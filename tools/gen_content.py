#!/usr/bin/env python3
"""Erzeugt die Spieldaten der Mod aus den Quelldateien unter data/.

Quellen:
  data/kulturen/*.toml   Kulturen, Truppenbäume, Miliz und Lord-Parteien
  data/namen/*.txt       Namenslisten (siehe data/namen/README.md)
  data/reiche/*.toml     Königreiche, Clans, Lords, Namen und Kultur der Siedlungen
  data/waffen.toml       Feuerwaffen und Munition

Ergebnis (nicht von Hand ändern, sondern hier neu erzeugen):
  Module/BalkanMod/ModuleData/balkan_troops.xml                 NPCCharacters (Truppen)
  Module/BalkanMod/ModuleData/balkan_party_templates.xml        partyTemplates (Lord-Parteien, Miliz)
  Module/BalkanMod/ModuleData/balkan_items.xml                  Items (Feuerwaffen, Munition)
  Module/BalkanMod/ModuleData/XSLT/BalkanMod_SandBoxCore_SPCultures.xslt
                                                                Patch der Kulturen (wie im NavalDLC)
  Module/BalkanMod/ModuleData/XSLT/BalkanMod_Sandbox_*.xslt   Patches für Reiche, Clans, Lords, Helden, Siedlungen
  Module/BalkanMod/ModuleData/Languages/DE/std_balkan_content_de.xml
                                                                Deutsche Texte

Aufruf:
  python3 tools/gen_content.py           Dateien schreiben
  python3 tools/gen_content.py --check   nur prüfen, ob die Dateien aktuell sind (für die CI)
"""
import sys
import tomllib
from pathlib import Path
from xml.sax.saxutils import quoteattr, escape

sys.path.insert(0, str(Path(__file__).resolve().parent))
from validate_names import parse as parse_names  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / "data"
MODULE_DATA = ROOT / "Module" / "BalkanMod" / "ModuleData"
OUT_TROOPS = MODULE_DATA / "balkan_troops.xml"
OUT_PARTIES = MODULE_DATA / "balkan_party_templates.xml"
OUT_ITEMS = MODULE_DATA / "balkan_items.xml"
OUT_XSLT = MODULE_DATA / "XSLT" / "BalkanMod_SandBoxCore_SPCultures.xslt"
OUT_ROSTERS = MODULE_DATA / "XSLT" / "BalkanMod_SandBoxCore_EquipmentRosters.xslt"
OUT_STRINGS = MODULE_DATA / "balkan_strings.xml"
OUT_DE = MODULE_DATA / "Languages" / "DE" / "std_balkan_content_de.xml"

OUT_REALMS = {
    "Kingdoms": MODULE_DATA / "XSLT" / "BalkanMod_Sandbox_Kingdoms.xslt",
    "Factions": MODULE_DATA / "XSLT" / "BalkanMod_Sandbox_Factions.xslt",
    "Lords": MODULE_DATA / "XSLT" / "BalkanMod_Sandbox_Lords.xslt",
    "Heroes": MODULE_DATA / "XSLT" / "BalkanMod_Sandbox_Heroes.xslt",
    "Settlements": MODULE_DATA / "XSLT" / "BalkanMod_Sandbox_Settlements.xslt",
}
VANILLA_IDS = ROOT / "tools" / "vanilla" / "ids_v1.5.7.txt"

HEADER = "<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->"

# Stufe -> Level wie bei den Calradia-Truppen
LEVELS = {1: 6, 2: 11, 3: 16, 4: 21, 5: 26, 6: 31}
# Grundwert der Hauptfähigkeit je Stufe
BASE = {1: 20, 2: 40, 3: 70, 4: 100, 5: 130, 6: 160}
SKILLS = ("Athletics", "Riding", "OneHanded", "TwoHanded", "Polearm", "Bow", "Crossbow", "Throwing")
# Anteil der Hauptfähigkeit je Profil, in der Reihenfolge von SKILLS
PROFILES = {
    "bauer":        (1.0, 0.25, 1.0, 0.5, 1.0, 0.25, 0.25, 0.25),
    "infanterie":   (1.0, 0.3, 1.0, 0.5, 1.0, 0.15, 0.3, 0.4),
    "pike":         (1.0, 0.3, 0.8, 0.6, 1.1, 0.1, 0.3, 0.3),
    "schuetze":     (1.0, 0.3, 0.9, 0.4, 0.4, 0.15, 1.0, 0.3),
    "bogen_infanterie": (1.0, 0.3, 0.8, 0.3, 0.9, 0.8, 0.2, 0.4),
    "reiter":       (0.5, 1.0, 1.0, 0.4, 1.1, 0.2, 0.3, 0.3),
    "leichte_reiter": (0.5, 1.0, 1.0, 0.3, 0.9, 0.2, 0.5, 0.9),
    "berittene_schuetzen": (0.5, 1.0, 0.9, 0.3, 0.8, 1.0, 0.3, 0.4),
}
GROUPS = ("Infantry", "Ranged", "Cavalry", "HorseArcher")
SLOTS = ("Item0", "Item1", "Item2", "Item3", "Head", "Cape", "Body", "Gloves", "Leg", "Horse", "HorseHarness")
REQUIRES = {"pferd": "ItemCategory.horse", "kriegspferd": "ItemCategory.war_horse"}
GAME_TYPES = ("Campaign", "CampaignStoryMode", "CustomGame")


def round5(value):
    return int(5 * round(value / 5))


def skills_for(troop):
    tier = troop["stufe"]
    factors = PROFILES[troop["profil"]]
    values = {s: round5(BASE[tier] * f) for s, f in zip(SKILLS, factors)}
    values.update(troop.get("faehigkeiten", {}))
    return values


def tid(culture, key):
    """Volle Id einer Truppe: Präfix der Kultur + Kurzname."""
    return f"balkan_{culture['praefix']}_{key}"


def load_cultures():
    cultures = []
    for path in sorted((DATA / "kulturen").glob("*.toml")):
        with path.open("rb") as fh:
            c = tomllib.load(fh)
        c["_datei"] = path.relative_to(ROOT).as_posix()
        names = parse_names(DATA / "namen" / f"{c['namensliste']}.txt")
        c["_namen"] = names
        cultures.append(c)
    return cultures


class Strings:
    """Sammelt Texte mit Id für die deutsche Sprachdatei."""

    def __init__(self):
        self.entries = {}

    def add(self, sid, en, de):
        if sid in self.entries and self.entries[sid] != de:
            raise ValueError(f"Text-Id {sid} doppelt mit unterschiedlichem Inhalt")
        self.entries[sid] = de
        return f"{{={sid}}}{en}"


def troop_xml(c, t, strings):
    t_id = tid(c, t["id"])
    attrs = [
        ("id", t_id),
        ("default_group", t["gruppe"]),
        ("level", str(LEVELS[t["stufe"]])),
        ("name", strings.add(t_id, t["name"]["en"], t["name"]["de"])),
        ("occupation", "Soldier"),
    ]
    if t.get("basis"):
        attrs.append(("is_basic_troop", "true"))
    if t.get("benoetigt"):
        attrs.append(("upgrade_requires", REQUIRES[t["benoetigt"]]))
    attrs.append(("culture", f"Culture.{c['kultur_id']}"))

    out = ["\t<NPCCharacter"]
    out += [f"\t\t{k}={quoteattr(v)}" for k, v in attrs]
    out[-1] += ">"
    out.append("\t\t<face>")
    out.append(f"\t\t\t<face_key_template value=\"BodyProperty.{t.get('gesicht', c['gesicht'])}\" />")
    out.append("\t\t</face>")
    out.append("\t\t<skills>")
    for skill, value in skills_for(t).items():
        out.append(f"\t\t\t<skill id=\"{skill}\" value=\"{value}\" />")
    out.append("\t\t</skills>")
    out.append("\t\t<upgrade_targets>")
    for target in t.get("aufwerten", []):
        out.append(f"\t\t\t<upgrade_target id=\"NPCCharacter.{tid(c, target)}\" />")
    out.append("\t\t</upgrade_targets>")
    out.append("\t\t<Equipments>")
    horse = t.get("pferd", {})
    for roster in t["ausruestung"]:
        items = dict(horse)
        items.update(roster)
        out.append("\t\t\t<EquipmentRoster>")
        for slot in SLOTS:
            if slot in items:
                out.append(f"\t\t\t\t<equipment slot=\"{slot}\" id=\"Item.{items[slot]}\" />")
        out.append("\t\t\t</EquipmentRoster>")
    zivil = t.get("zivil") or c["zivil"][min(t["stufe"], 3) - 1]
    out.append(f"\t\t\t<EquipmentSet id=\"{zivil}\" equipmentType=\"Civilian\" />")
    out.append("\t\t</Equipments>")
    out.append("\t</NPCCharacter>")
    return "\n".join(out)


def build_troops(cultures, strings):
    parts = ['<?xml version="1.0" encoding="utf-8"?>', HEADER, "<NPCCharacters>"]
    for c in cultures:
        parts.append(f"\t<!-- {c['name']['de']} ({c['_datei']}) -->")
        for t in c["truppe"]:
            parts.append(troop_xml(c, t, strings))
    parts.append("</NPCCharacters>")
    return "\n".join(parts) + "\n"


def party_template_xml(template_id, stacks):
    out = [f"\t<MBPartyTemplate id=\"{template_id}\">", "\t\t<stacks>"]
    for s in stacks:
        out.append(
            f"\t\t\t<PartyTemplateStack min_value=\"{s['min']}\" max_value=\"{s['max']}\" "
            f"troop=\"NPCCharacter.{s['_troop']}\" />"
        )
    out += ["\t\t</stacks>", "\t</MBPartyTemplate>"]
    return "\n".join(out)


def lord_template_id(c):
    return f"balkan_kingdom_hero_party_{c['schluessel']}"


def militia_template_id(c):
    return f"balkan_militia_{c['schluessel']}"


def build_parties(cultures):
    parts = ['<?xml version="1.0" encoding="utf-8"?>', HEADER, "<partyTemplates>"]
    for c in cultures:
        stacks = [dict(s, _troop=tid(c, s["truppe"])) for s in c["lord_partei"]]
        parts.append(party_template_xml(lord_template_id(c), stacks))
        m = c["miliz"]
        militia = [
            {"min": 1, "max": 1, "_troop": tid(c, m["nahkampf"])},
            {"min": 1, "max": 1, "_troop": tid(c, m["fernkampf"])},
        ]
        parts.append(party_template_xml(militia_template_id(c), militia))
    parts.append("</partyTemplates>")
    return "\n".join(parts) + "\n"


def culture_attributes(c, strings):
    key = c["schluessel"]
    m = c["miliz"]
    attrs = {
        "name": strings.add(f"balkan_culture_{key}", c["name"]["en"], c["name"]["de"]),
        "text": strings.add(f"balkan_culture_{key}_text", c["text"]["en"].strip(), c["text"]["de"].strip()),
        "color": c["farben"][0],
        "color2": c["farben"][1],
        "basic_troop": f"NPCCharacter.{tid(c, c['basis_truppe'])}",
        "elite_basic_troop": f"NPCCharacter.{tid(c, c['elite_truppe'])}",
        "melee_militia_troop": f"NPCCharacter.{tid(c, m['nahkampf'])}",
        "ranged_militia_troop": f"NPCCharacter.{tid(c, m['fernkampf'])}",
        "melee_elite_militia_troop": f"NPCCharacter.{tid(c, m['nahkampf_elite'])}",
        "ranged_elite_militia_troop": f"NPCCharacter.{tid(c, m['fernkampf_elite'])}",
        "default_party_template": f"PartyTemplate.{lord_template_id(c)}",
        "militia_party_template": f"PartyTemplate.{militia_template_id(c)}",
    }
    if c["art"] == "neu":
        attrs = {"id": c["kultur_id"], "is_main_culture": "false", **attrs}
    return attrs


def build_game_texts(cultures, strings):
    """Name und Beschreibung jeder Kultur für die Charaktererstellung (GameText mit Variante = Kultur-Id)."""
    lines = ['<?xml version="1.0" encoding="utf-8"?>', HEADER, "<strings>"]
    for c in cultures:
        key, cid = c["schluessel"], c["kultur_id"]
        rich = strings.add(f"balkan_culture_{key}_rich", c["name"]["en"], c["name"]["de"])
        desc = strings.add(f"balkan_culture_{key}_desc", c["text"]["en"].strip(), c["text"]["de"].strip())
        lines.append(f"\t<string id={quoteattr('str_culture_rich_name.' + cid)} text={quoteattr(rich)} />")
        lines.append(f"\t<string id={quoteattr('str_culture_description.' + cid)} text={quoteattr(desc)} />")
    lines.append("</strings>")
    return "\n".join(lines) + "\n"


def name_list_xml(tag, names, indent):
    lines = [f"{indent}<{tag}>"]
    for n in names:
        # {=!} = Eigenname, wird nicht übersetzt. In XSLT-Attributen muss "{" als "{{" stehen.
        lines.append(f"{indent}\t<name name={quoteattr('{{=!}}' + n)} />")
    lines.append(f"{indent}</{tag}>")
    return lines


def culture_templates(c, strings):
    mode = f"balkan_{c['schluessel']}"
    names = c["_namen"]
    out = []
    if c["art"] == "anpassen":
        out.append(f"\t<!-- {c['name']['de']}: Calradia-Kultur '{c['kultur_id']}' anpassen ({c['_datei']}) -->")
        out.append(f"\t<xsl:template match=\"/SPCultures/Culture[@id='{c['kultur_id']}']\">")
    else:
        out.append(f"\t<!-- {c['name']['de']}: neue Kultur '{c['kultur_id']}' als Kopie von '{c['vorlage']}' ({c['_datei']}) -->")
        out.append(f"\t<xsl:template match=\"Culture\" mode=\"{mode}\">")
    out.append("\t\t<xsl:copy>")
    out.append("\t\t\t<xsl:copy-of select=\"@*\" />")
    for k, v in culture_attributes(c, strings).items():
        out.append(f"\t\t\t<xsl:attribute name=\"{k}\">{escape(v)}</xsl:attribute>")
    out.append(f"\t\t\t<xsl:apply-templates select=\"node()\" mode=\"{mode}\" />")
    out.append("\t\t</xsl:copy>")
    out.append("\t</xsl:template>")
    # Alles übrige unverändert kopieren, nur die Namenslisten ersetzen
    out.append(f"\t<xsl:template match=\"@*|node()\" mode=\"{mode}\">")
    out.append(f"\t\t<xsl:copy><xsl:apply-templates select=\"@*|node()\" mode=\"{mode}\" /></xsl:copy>")
    out.append("\t</xsl:template>")
    for tag, section in (("male_names", "maennlich"), ("female_names", "weiblich"), ("clan_names", "familien")):
        out.append(f"\t<xsl:template match=\"{tag}\" mode=\"{mode}\">")
        out += name_list_xml(tag, names[section], "\t\t")
        out.append("\t</xsl:template>")
    return out


def build_xslt(cultures, strings):
    out = [
        '<?xml version="1.0" encoding="utf-8"?>',
        HEADER,
        '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">',
        '\t<xsl:output omit-xml-declaration="no" indent="yes" />',
        "\t<!-- Grundregel: alles unverändert übernehmen -->",
        '\t<xsl:template match="@*|node()">',
        '\t\t<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>',
        "\t</xsl:template>",
    ]
    new = [c for c in cultures if c["art"] == "neu"]
    if new:
        out.append("\t<!-- Neue Kulturen am Ende der Liste anhängen -->")
        out.append('\t<xsl:template match="/SPCultures">')
        out.append("\t\t<xsl:copy>")
        out.append('\t\t\t<xsl:apply-templates select="@*|node()" />')
        for c in new:
            out.append(
                f"\t\t\t<xsl:apply-templates select=\"Culture[@id='{c['vorlage']}']\" mode=\"balkan_{c['schluessel']}\" />"
            )
        out.append("\t\t</xsl:copy>")
        out.append("\t</xsl:template>")
    for c in cultures:
        out += culture_templates(c, strings)
    out.append("</xsl:stylesheet>")
    return "\n".join(out) + "\n"


def build_rosters(cultures):
    """Ausrüstungsvorlagen für neue Kulturen.

    Das Spiel sucht Ausrüstung für Lords, Kinder, Herrscher, Gefährten usw. über die Kultur der Vorlage
    (EquipmentRoster culture="Culture.x"). Ohne eigene Vorlagen findet es für eine neue Kultur nichts und
    stürzt beim Start der Kampagne ab. Darum bekommt jede neue Kultur eine Kopie aller Vorlagen ihrer
    Vorlage-Kultur (neue Id: <id>_balkan_<kultur>).
    """
    out = [
        '<?xml version="1.0" encoding="utf-8"?>',
        HEADER,
        '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">',
        '\t<xsl:output omit-xml-declaration="no" indent="yes" />',
        '\t<xsl:template match="@*|node()">',
        '\t\t<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>',
        "\t</xsl:template>",
    ]
    by_template = {}
    for c in cultures:
        if c["art"] == "neu":
            by_template.setdefault(c["vorlage"], []).append(c["kultur_id"])
    for template, new_ids in sorted(by_template.items()):
        out.append(f"\t<xsl:template match=\"EquipmentRoster[@culture='Culture.{template}']\">")
        out.append('\t\t<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>')
        for cid in new_ids:
            out += [
                "\t\t<xsl:copy>",
                '\t\t\t<xsl:apply-templates select="@*" />',
                f"\t\t\t<xsl:attribute name=\"id\"><xsl:value-of select=\"concat(@id, '_balkan_{cid}')\" /></xsl:attribute>",
                f'\t\t\t<xsl:attribute name="culture">Culture.{cid}</xsl:attribute>',
                '\t\t\t<xsl:apply-templates select="node()" />',
                "\t\t</xsl:copy>",
            ]
        out.append("\t</xsl:template>")
    out.append("</xsl:stylesheet>")
    return "\n".join(out) + "\n"


def build_de(strings):
    out = [
        '<?xml version="1.0" encoding="utf-8"?>',
        HEADER,
        '<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
        'xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">',
        "  <tags>",
        '    <tag language="Deutsch" />',
        "  </tags>",
        "  <strings>",
    ]
    for sid, de in strings.entries.items():
        out.append(f"    <string id={quoteattr(sid)} text={quoteattr(de)} />")
    out += ["  </strings>", "</base>"]
    return "\n".join(out) + "\n"


def check_definitions(cultures):
    """Prüft die Quelldaten, bevor etwas geschrieben wird."""
    errors = []
    for c in cultures:
        where = c["_datei"]
        if c["art"] not in ("anpassen", "neu"):
            errors.append(f"{where}: art muss 'anpassen' oder 'neu' sein")
        if c["art"] == "neu" and not c.get("vorlage"):
            errors.append(f"{where}: neue Kultur braucht eine vorlage")
        keys = [t["id"] for t in c["truppe"]]
        dupes = {k for k in keys if keys.count(k) > 1}
        if dupes:
            errors.append(f"{where}: Truppen doppelt: {sorted(dupes)}")
        known = set(keys)
        refs = [c["basis_truppe"], c["elite_truppe"], *c["miliz"].values()]
        refs += [s["truppe"] for s in c["lord_partei"]]
        for t in c["truppe"]:
            refs += t.get("aufwerten", [])
            if t["gruppe"] not in GROUPS:
                errors.append(f"{where}: {t['id']}: unbekannte gruppe '{t['gruppe']}'")
            if t["profil"] not in PROFILES:
                errors.append(f"{where}: {t['id']}: unbekanntes profil '{t['profil']}'")
            if t["stufe"] not in LEVELS:
                errors.append(f"{where}: {t['id']}: stufe muss 1 bis 6 sein")
            if len(t.get("aufwerten", [])) > 2:
                errors.append(f"{where}: {t['id']}: höchstens 2 Aufwertungen möglich")
            if not t.get("ausruestung"):
                errors.append(f"{where}: {t['id']}: keine ausruestung")
            for roster in t.get("ausruestung", []):
                for slot in roster:
                    if slot not in SLOTS:
                        errors.append(f"{where}: {t['id']}: unbekannter Slot '{slot}'")
            for target in t.get("aufwerten", []):
                target_t = next((x for x in c["truppe"] if x["id"] == target), None)
                if target_t and target_t["stufe"] <= t["stufe"]:
                    errors.append(f"{where}: {t['id']} -> {target}: Ziel muss eine höhere Stufe haben")
        for r in refs:
            if r not in known:
                errors.append(f"{where}: Truppe '{r}' wird verwendet, ist aber nicht definiert")
    return errors


# ---------------------------------------------------------------- Reiche, Clans, Lords


def load_realms():
    realms = []
    for path in sorted((DATA / "reiche").glob("*.toml")):
        with path.open("rb") as fh:
            r = tomllib.load(fh)
        r["_datei"] = path.relative_to(ROOT).as_posix()
        realms.append(r)
    return realms


def check_realms(realms, cultures):
    vanilla = set(VANILLA_IDS.read_text(encoding="utf-8").split())
    culture_ids = {c["kultur_id"] for c in cultures}
    errors = []
    seen = {}
    place_names = {}
    for r in realms:
        where = r["_datei"]
        if f"Kingdom.{r['reich_id']}" not in vanilla:
            errors.append(f"{where}: Königreich {r['reich_id']} gibt es im Spiel nicht")
        if r["kultur_id"] not in culture_ids:
            errors.append(f"{where}: Kultur {r['kultur_id']} ist in data/kulturen nicht definiert")
        lords = [l["id"] for c in r["clan"] for l in c["lord"]]
        if r["herrscher"] not in lords:
            errors.append(f"{where}: herrscher {r['herrscher']} gehört zu keinem Clan der Datei")
        checks = [("Faction", c["id"]) for c in r["clan"]] + [("Hero", x) for x in lords]
        checks += [("Settlement", x) for x in r["siedlungen"]]
        checks += [("Settlement", x) for x in r.get("orte", {})]
        for kind, obj in checks:
            if f"{kind}.{obj}" not in vanilla:
                errors.append(f"{where}: {kind}.{obj} gibt es im Spiel nicht")
            if (kind, obj) in seen and seen[(kind, obj)] != where:
                errors.append(f"{where}: {kind}.{obj} steht auch in {seen[(kind, obj)]}")
            seen[(kind, obj)] = where
        for sid, name in r.get("orte", {}).items():
            label = name if isinstance(name, str) else name.get("en", "")
            if not label.strip():
                errors.append(f"{where}: Ort {sid} hat keinen Namen")
            elif label in place_names:
                errors.append(f"{where}: Ortsname '{label}' gibt es schon ({place_names[label]})")
            place_names[label] = f"{where}: {sid}"
        orte = r.get("orte", {})
        for sid in r.get("ortstexte", {}):
            if sid not in orte:
                errors.append(f"{where}: ortstexte: {sid} steht nicht in [orte]")
        for sid in orte:
            seat = seat_of(sid)
            if seat is not None and r.get("dorftext") and seat not in orte:
                errors.append(f"{where}: Dorf {sid}: Sitz {seat} steht nicht in [orte]")
        for sid, cid in r.get("dorfkultur", {}).items():
            if sid not in orte:
                errors.append(f"{where}: dorfkultur: {sid} steht nicht in [orte]")
            if cid not in culture_ids:
                errors.append(f"{where}: dorfkultur: Kultur {cid} ist in data/kulturen nicht definiert")
        for v in r.get("dorftext", []):
            if not v.get("en") or not v.get("de"):
                errors.append(f"{where}: dorftext braucht en und de")
        w = r.get("wappen")
        if w is not None:
            for key in ("hintergrund", "farbe"):
                v = w.get(key)
                if not (isinstance(v, list) and len(v) == 2 and isinstance(v[0], int) and str(v[1]).lower().startswith("0xff")):
                    errors.append(f"{where}: wappen.{key} muss [Nummer, \"0xffRRGGBB\"] sein")
            if not isinstance(w.get("zeichen"), int) or not isinstance(w.get("groesse"), int):
                errors.append(f"{where}: wappen.zeichen und wappen.groesse müssen Zahlen sein")
        for enemy in r.get("krieg_mit", []):
            if f"Kingdom.{enemy}" not in vanilla:
                errors.append(f"{where}: krieg_mit: Königreich {enemy} gibt es im Spiel nicht")
            other = next((x for x in realms if x["reich_id"] == enemy), None)
            if other is not None and r["reich_id"] not in other.get("krieg_mit", []):
                errors.append(f"{where}: Krieg mit {enemy} muss auch in {other['_datei']} stehen")
        if r["siedlungen"] and not r["kultur_wechseln"]:
            errors.append(f"{where}: siedlungen nur mit kultur_wechseln = true")
    return errors


def text_value(strings, sid, value):
    """Eigenname (String) oder übersetzter Text ({en, de})."""
    if isinstance(value, str):
        return "{=!}" + value
    return strings.add(sid, value["en"].strip(), value["de"].strip())


def seat_of(village_id):
    """village_V1_2 -> town_V1, castle_village_V2_1 -> castle_V2"""
    if village_id.startswith("castle_village_"):
        return "castle_" + village_id[len("castle_village_"):].rsplit("_", 1)[0]
    if village_id.startswith("village_"):
        return "town_" + village_id[len("village_"):].rsplit("_", 1)[0]
    return None


def place_label(value):
    return value if isinstance(value, str) else value["en"]


def place_text(r, sid):
    """Beschreibung eines Orts: eigener Text oder, bei Dörfern, ein Text aus dorftext."""
    own = r.get("ortstexte", {}).get(sid)
    if own is not None:
        return own
    seat = seat_of(sid)
    variants = r.get("dorftext", [])
    if seat is None or not variants:
        return None
    orte = r["orte"]
    villages = [x for x in orte if seat_of(x) is not None]
    v = variants[villages.index(sid) % len(variants)]
    out = {}
    for lang in ("en", "de"):
        out[lang] = v[lang].replace("{DORF}", place_label(orte[sid])).replace("{SITZ}", place_label(orte[seat]))
    return out


def xslt_doc(templates):
    out = [
        '<?xml version="1.0" encoding="utf-8"?>',
        HEADER,
        '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">',
        '\t<xsl:output omit-xml-declaration="no" indent="yes" />',
        '\t<xsl:template match="@*|node()">',
        '\t\t<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>',
        "\t</xsl:template>",
    ]
    out += templates
    out.append("</xsl:stylesheet>")
    return "\n".join(out) + "\n"


def patch_template(element, obj_id, attrs, drop=()):
    """Kopiert ein Element mit allen Kindern und setzt bzw. entfernt einzelne Attribute."""
    keep = "@*"
    if drop:
        keep = "@*[" + " and ".join(f"name() != '{d}'" for d in drop) + "]"
    out = [f"\t<xsl:template match=\"{element}[@id='{obj_id}']\">", "\t\t<xsl:copy>"]
    out.append(f"\t\t\t<xsl:copy-of select=\"{keep}\" />")
    for k, v in attrs.items():
        out.append(f"\t\t\t<xsl:attribute name=\"{k}\">{escape(v)}</xsl:attribute>")
    out += ['\t\t\t<xsl:apply-templates select="node()" />', "\t\t</xsl:copy>", "\t</xsl:template>"]
    return out


def build_realms(realms, strings):
    t = {key: [] for key in OUT_REALMS}
    for r in realms:
        key = r["reich_id"]
        culture = f"Culture.{r['kultur_id']}"
        note = f"\t<!-- {r['name']['de']} ({r['_datei']}) -->"
        for part in t.values():
            part.append(note)
        kattrs = {
            "name": text_value(strings, f"balkan_kingdom_{key}", r["name"]),
            "short_name": text_value(strings, f"balkan_kingdom_{key}_short", r["kurzname"]),
            "title": text_value(strings, f"balkan_kingdom_{key}_title", r["titel"]),
            "ruler_title": text_value(strings, f"balkan_kingdom_{key}_ruler", r["herrschertitel"]),
            "text": text_value(strings, f"balkan_kingdom_{key}_text", r["text"]),
            "color": r["farben"][0],
            "color2": r["farben"][1],
            "owner": f"Hero.{r['herrscher']}",
        }
        if r["kultur_wechseln"]:
            kattrs["culture"] = culture
        if "wappen" in r:
            w = r["wappen"]
            bg, fg = w["hintergrund"], w["farbe"]
            kattrs["banner_key"] = (
                f"11.{bg[0]}.{bg[0]}.4345.4345.764.764.1.0.0."
                f"{w['zeichen']}.{fg[0]}.{fg[0]}.{w['groesse']}.{w['groesse']}.764.764.1.0.0"
            )
            # Die Clans des Reichs übernehmen diese Farben im Spiel (Clan.UpdateBannerColorsAccordingToKingdom)
            kattrs["primary_banner_color"] = bg[1]
            kattrs["secondary_banner_color"] = fg[1]
        t["Kingdoms"] += patch_template("Kingdom", key, kattrs)
        for c in r["clan"]:
            cattrs = {"name": text_value(strings, f"balkan_{c['id']}", c["name"])}
            if r["kultur_wechseln"]:
                cattrs["culture"] = culture
            if any(l["id"] == r["herrscher"] for l in c["lord"]):
                cattrs["owner"] = f"Hero.{r['herrscher']}"
            t["Factions"] += patch_template("Faction", c["id"], cattrs)
            for lord in c["lord"]:
                lattrs = {"name": "{=!}" + lord["name"]}
                if r["kultur_wechseln"]:
                    lattrs["culture"] = culture
                t["Lords"] += patch_template("NPCCharacter", lord["id"], lattrs)
                if lord["id"] == r["herrscher"]:
                    htext = text_value(strings, f"balkan_hero_{lord['id']}_text", r["herrscher_text"])
                    t["Heroes"] += patch_template("Hero", lord["id"], {"text": htext})
                else:
                    # alte Lebensläufe der Calradia-Herrscher passen nicht mehr
                    t["Heroes"] += patch_template("Hero", lord["id"], {}, drop=("text",))
        orte = r.get("orte", {})
        for sid in list(r["siedlungen"]) + [x for x in orte if x not in r["siedlungen"]]:
            sattrs = {}
            if sid in orte:
                sattrs["name"] = text_value(strings, f"balkan_settlement_{sid}", orte[sid])
                desc = place_text(r, sid)
                if desc is not None:
                    sattrs["text"] = strings.add(f"balkan_settlement_{sid}_text", desc["en"].strip(), desc["de"].strip())
            if sid in r.get("dorfkultur", {}):
                sattrs["culture"] = f"Culture.{r['dorfkultur'][sid]}"
            elif sid in r["siedlungen"]:
                sattrs["culture"] = culture
            t["Settlements"] += patch_template("Settlement", sid, sattrs)
    t["Kingdoms"] += build_wars(realms)
    return {OUT_REALMS[k]: xslt_doc(v) for k, v in t.items()}


def build_wars(realms):
    """Kriege zu Spielbeginn: Beziehungen unserer Reiche neu setzen, alte Kriege anderer Reiche mit ihnen entfernen."""
    ours = [r for r in realms if "krieg_mit" in r]
    if not ours:
        return []
    out = ["\t<!-- Kriege zu Spielbeginn (krieg_mit in data/reiche/) -->"]
    cond = " or ".join(f"@kingdom='Kingdom.{r['reich_id']}'" for r in ours)
    out.append(f'\t<xsl:template match="Kingdom/relationships/relationship[{cond}]" />')
    for r in ours:
        out.append(f"\t<xsl:template match=\"Kingdom[@id='{r['reich_id']}']/relationships\">")
        out.append("\t\t<relationships>")
        for enemy in r["krieg_mit"]:
            out.append(f'\t\t\t<relationship kingdom="Kingdom.{enemy}" value="-1" isAtWar="true" />')
        out += ["\t\t</relationships>", "\t</xsl:template>"]
    return out


# ---------------------------------------------------------------- Feuerwaffen

# Modelle aus dem Spiel: Kollisionskörper und Sitz der Munition, wie bei den Armbrüsten
# (Kollisionskörper, Sitz der Munition, hat eine Sehne)
GUN_MODELS = {
    "crossbow_b": ("bo_cross_bow_heavy", "0.0, 0.02131, 0.24975", True),
    "crossbow_c": ("bo_cross_bow_heavy", "0.0, 0.02131, 0.24675", True),
    "crossbow_d": ("bo_composite_crossbows", "0.0, 0.02131, 0.22975", True),
    "crossbow_e": ("bo_composite_crossbows", "0.0, 0.02131, 0.22975", True),
    # Modelle aus Napoleonic Warfare (Module/BalkanMod/Assets/napoleonic_warfare, siehe CREDITS.md)
    "newmusket": ("bo_spear_b", "0, 0, 0", False),
    "newrifle": ("bo_spear_b", "0, 0, 0", False),
}
# Munitionsmodelle: Köcher-Körper, Länge
AMMO_MODELS = {
    "bolt_bl_a": ("bo_axe_short", 47),
    "bolt_bl_c": ("bo_bolt_bl_c_quiver", 37),
}
WEAPON_ART = ("gewehr", "pistole", "munition")
GUN_FIELDS = ("gewicht", "schaden", "geschoss", "genauigkeit", "tempo", "handhabung", "schwierigkeit")
AMMO_FIELDS = ("gewicht", "schaden", "anzahl")


def load_weapons():
    path = DATA / "waffen.toml"
    with path.open("rb") as fh:
        return tomllib.load(fh).get("waffe", [])


def check_weapons(weapons, vanilla_ids):
    errors = []
    seen = set()
    for w in weapons:
        wid = w.get("id", "?")
        if wid in seen:
            errors.append(f"{wid}: doppelt")
        seen.add(wid)
        if not wid.startswith("balkan_"):
            errors.append(f"{wid}: Id muss mit balkan_ beginnen")
        if f"Item.{wid}" in vanilla_ids:
            errors.append(f"{wid}: Id gibt es schon im Spiel")
        art = w.get("art")
        if art not in WEAPON_ART:
            errors.append(f"{wid}: art muss eine von {WEAPON_ART} sein")
            continue
        models = AMMO_MODELS if art == "munition" else GUN_MODELS
        if w.get("modell") not in models:
            errors.append(f"{wid}: modell muss eines von {sorted(models)} sein")
        for field in AMMO_FIELDS if art == "munition" else GUN_FIELDS:
            if field not in w:
                errors.append(f"{wid}: Feld {field} fehlt")
        if "preis" not in w or not isinstance(w["preis"], int) or w["preis"] <= 0:
            errors.append(f"{wid}: preis (Denare, ganze Zahl > 0) fehlt")
        if art != "munition" and not 0 <= w.get("genauigkeit", 0) <= 100:
            errors.append(f"{wid}: genauigkeit muss 0 bis 100 sein")
    return errors


def gun_xml(w, name):
    body, ammo_offset, has_string = GUN_MODELS[w["modell"]]
    pistol = w["art"] == "pistole"
    flags = ['RangedWeapon="true"', f'HasString="{str(has_string).lower()}"', 'NotUsableWithOneHand="true"',
             'TwoHandIdleOnMount="true"']
    if not pistol:
        flags.insert(2, 'CantReloadOnHorseback="true"')
    out = [
        "\t<Item",
        f"\t\tid={quoteattr(w['id'])}",
        f"\t\tname={quoteattr(name)}",
        f'\t\tbody_name="{body}"',
        f'\t\tmesh="{w["modell"]}"',
        f'\t\tculture="Culture.{w["kultur"]}"',
        f'\t\tweight="{w["gewicht"]}"',
        '\t\tappearance="0.6"',
        f'\t\tvalue="{w["preis"]}"',
        f'\t\tdifficulty="{w["schwierigkeit"]}"',
        '\t\tType="Crossbow"',
        f'\t\tAmmoOffset="{ammo_offset}"',
        '\t\titem_holsters="crossbow_back:bow_hip:mace_right_hip:bow_hip_2"',
        '\t\tholster_position_shift="0.02,0,-0.4">',
        "\t\t<ItemComponent>",
        "\t\t\t<Weapon",
        '\t\t\t\tweapon_class="Crossbow"',
        '\t\t\t\tammo_class="Bolt"',
        '\t\t\t\tammo_limit="1"',
        f'\t\t\t\tthrust_speed="{w["tempo"]}"',
        f'\t\t\t\tspeed_rating="{w["handhabung"]}"',
        f'\t\t\t\tmissile_speed="{w["geschoss"]}"',
        '\t\t\t\tweapon_length="95"',
        f'\t\t\t\taccuracy="{w["genauigkeit"]}"',
        f'\t\t\t\tthrust_damage="{w["schaden"]}"',
        '\t\t\t\tthrust_damage_type="Pierce"',
        f'\t\t\t\titem_usage="{"crossbow_light" if pistol else "crossbow"}"',
        '\t\t\t\treload_phase_count="2"',
        '\t\t\t\tphysics_material="wood_weapon"',
        '\t\t\t\tcenter_of_mass="0,0,0.4"',
        '\t\t\t\tmodifier_group="crossbow">',
        "\t\t\t\t<WeaponFlags " + " ".join(flags) + " />",
        "\t\t\t</Weapon>",
        "\t\t</ItemComponent>",
        "\t\t<Flags />",
        "\t</Item>",
    ]
    return "\n".join(out)


def ammo_xml(w, name):
    holster_body, length = AMMO_MODELS[w["modell"]]
    m = w["modell"]
    out = [
        "\t<Item",
        f"\t\tid={quoteattr(w['id'])}",
        f"\t\tname={quoteattr(name)}",
        '\t\tbody_name="bo_capsule_arrow"',
        f'\t\tholster_body_name="{holster_body}"',
        f'\t\tmesh="{m}"',
        f'\t\tholster_mesh="{m}_quiver"',
        f'\t\tholster_mesh_with_weapon="{m}_quiver"',
        '\t\tflying_mesh="bolt_bl_flying"',
        f'\t\tculture="Culture.{w["kultur"]}"',
        f'\t\tweight="{w["gewicht"]}"',
        '\t\tappearance="1"',
        f'\t\tvalue="{w["preis"]}"',
        '\t\tType="Bolts"',
        '\t\titem_holsters="quiver_bolts:quiver_bolts_2:quiver_back_middle:quiver_back_top">',
        "\t\t<ItemComponent>",
        "\t\t\t<Weapon",
        '\t\t\t\tweapon_class="Bolt"',
        f'\t\t\t\tstack_amount="{w["anzahl"]}"',
        '\t\t\t\tthrust_speed="0"',
        f'\t\t\t\tthrust_damage="{w["schaden"]}"',
        '\t\t\t\tthrust_damage_type="Pierce"',
        '\t\t\t\tspeed_rating="0"',
        '\t\t\t\tmissile_speed="10"',
        f'\t\t\t\tweapon_length="{length}"',
        '\t\t\t\titem_usage=""',
        '\t\t\t\tpassby_sound_code="event:/mission/combat/missile/passby"',
        '\t\t\t\trotation="180, 0, 0"',
        '\t\t\t\tphysics_material="missile"',
        f'\t\t\t\tsticking_position="0,-0.{length},0"',
        '\t\t\t\tsticking_rotation="90,0,0"',
        '\t\t\t\tcenter_of_mass="0,0,-0.1"',
        '\t\t\t\tmodifier_group="bolt">',
        '\t\t\t\t<WeaponFlags AttachAmmoToVisual="true" Consumable="true" AmmoSticksWhenShot="true" '
        'AmmoBreaksOnBounceBack="true" />',
        "\t\t\t</Weapon>",
        "\t\t</ItemComponent>",
        '\t\t<Flags ForceAttachOffHandPrimaryItemBone="true" />',
        "\t</Item>",
    ]
    return "\n".join(out)


def build_items(weapons, strings):
    out = ['<?xml version="1.0" encoding="utf-8"?>', HEADER, "<Items>"]
    for w in weapons:
        sid = "balkan_item_" + w["id"][len("balkan_"):]
        name = strings.add(sid, w["name"]["en"], w["name"]["de"])
        out.append(ammo_xml(w, name) if w["art"] == "munition" else gun_xml(w, name))
    out.append("</Items>")
    return "\n".join(out) + "\n"


def load_vanilla_ids():
    ids = set()
    for line in VANILLA_IDS.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line and not line.startswith("#"):
            ids.add(line)
    return ids


def check_troop_items(cultures, weapons, vanilla_ids):
    """Jede Waffe in einer Ausrüstung muss im Spiel oder in data/waffen.toml stehen."""
    own = {w["id"] for w in weapons}
    errors = []
    for c in cultures:
        for t in c["truppe"]:
            for roster in t.get("ausruestung", []) + [t.get("pferd", {})]:
                for slot, item in roster.items():
                    if item not in own and f"Item.{item}" not in vanilla_ids:
                        errors.append(f"{c['_datei']}: {t['id']}: unbekannter Gegenstand '{item}' ({slot})")
    return errors


def generate():
    cultures = load_cultures()
    errors = check_definitions(cultures)
    if errors:
        raise SystemExit("Fehler in data/kulturen:\n  - " + "\n  - ".join(errors))
    realms = load_realms()
    errors = check_realms(realms, cultures)
    if errors:
        raise SystemExit("Fehler in data/reiche:\n  - " + "\n  - ".join(errors))
    weapons = load_weapons()
    vanilla_ids = load_vanilla_ids()
    errors = check_weapons(weapons, vanilla_ids) + check_troop_items(cultures, weapons, vanilla_ids)
    if errors:
        raise SystemExit("Fehler in data/waffen.toml oder den Ausrüstungen:\n  - " + "\n  - ".join(errors))
    strings = Strings()
    files = {
        OUT_ITEMS: build_items(weapons, strings),
        OUT_TROOPS: build_troops(cultures, strings),
        OUT_PARTIES: build_parties(cultures),
        OUT_XSLT: build_xslt(cultures, strings),
        OUT_ROSTERS: build_rosters(cultures),
        OUT_STRINGS: build_game_texts(cultures, strings),
    }
    files.update(build_realms(realms, strings))
    files[OUT_DE] = build_de(strings)
    return files


def main():
    check = "--check" in sys.argv[1:]
    files = generate()
    stale = []
    for path, content in files.items():
        current = path.read_text(encoding="utf-8") if path.is_file() else None
        if current == content:
            continue
        if check:
            stale.append(path.relative_to(ROOT).as_posix())
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8", newline="\n")
            print(f"geschrieben: {path.relative_to(ROOT).as_posix()}")
    if stale:
        print("Erzeugte Dateien sind nicht aktuell. Bitte 'python3 tools/gen_content.py' ausführen:")
        for s in stale:
            print("  - " + s)
        return 1
    if check:
        print(f"Erzeugte Dateien aktuell ({len(files)} Dateien).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
