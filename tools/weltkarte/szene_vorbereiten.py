"""Schritt 5: Kopie der Calradia-Kartenszene für die Balkankarte vorbereiten.

Aufruf (braucht nur Python 3, keine weiteren Pakete):
    python szene_vorbereiten.py <Main_map des Spiels> <Zielordner> <siedlungen.csv>
Beispiel:
    python szene_vorbereiten.py "...\\Modules\\SandBox\\SceneObj\\Main_map" "...\\Modules\\BalkanMod\\SceneObj\\balkan_map" siedlungen.csv

Die Szene des Spiels wird nicht verändert. In der Kopie
- stehen alle Städte, Burgen, Dörfer und Verstecke an ihrem Platz aus siedlungen.csv (Höhe passend zum Höhenbild),
- sind Städte und Burgen so gedreht, dass das Tor auf begehbares Land zeigt,
- ist alles entfernt, was nur zur Calradia-Landschaft gehört (Felsen, Brücken, Flüsse, Seen, Sperren, Sichtblenden),
- liegt eine einzige Wasserfläche über der ganzen Karte, und die Kartengrenzen umfassen die ganze Karte.
Mit "python szene_vorbereiten.py --nur-orte <Szenenordner> <siedlungen.csv>" werden nur die Orte einer schon
vorbereiteten Szene neu gesetzt. Daneben entsteht siedlungen_positionen.xslt mit posX/posY und Torpositionen für settlements.xml.
Pflanzen (flora.bin) und Navmesh (navmesh.bin) der Calradia-Karte werden nicht mitkopiert.
"""
import csv
import math
import os
import re
import shutil
import sys
import xml.etree.ElementTree as ET

WASSERHOEHE = 2.25
KARTE = 848.0
BEHALTEN = ("campaign_icon_capsule", "settlements_scripts", "border_min", "border_max", "camera_top",
            "color_grade_manager", "cloud_plane", "envmap_probe", "outer_mesh", "medit_water_plane")
BEHALTEN_PREFAB = ("MapSnowAndRainDefiner",)
NICHT_KOPIEREN = ("flora.bin", "navmesh.bin")


def zahlen(text):
    return [float(t) for t in text.split(",")]


def attribut(zeile, name):
    m = re.search(name + r'="([^"]*)"', zeile)
    return m.group(1) if m else None


def setze_attribut(zeile, name, wert):
    if re.search(name + r'="[^"]*"', zeile):
        return re.sub(name + r'="[^"]*"', f'{name}="{wert}"', zeile, count=1)
    return zeile.replace("<transform ", f'<transform {name}="{wert}" ', 1)


def fmt(*werte):
    return ", ".join(f"{w:.3f}" for w in werte)


def hauptprogramm(quelle, ziel, csv_pfad):
    orte = {z["id"]: z for z in csv.DictReader(open(csv_pfad, encoding="utf-8"), delimiter=";")}
    os.makedirs(ziel, exist_ok=True)
    for name in os.listdir(quelle):
        if name in NICHT_KOPIEREN or name == "scene.xscene":
            continue
        von, nach = os.path.join(quelle, name), os.path.join(ziel, name)
        if os.path.isdir(von):
            shutil.copytree(von, nach, dirs_exist_ok=True)
        else:
            shutil.copyfile(von, nach)

    with open(os.path.join(quelle, "scene.xscene"), encoding="utf-8", newline="") as f:
        zeilen = f.read().split("\r\n")
    szenenname = os.path.basename(os.path.normpath(ziel))
    aus = []
    i = 0
    n = len(zeilen)
    entfernt = behalten = versetzt = 0
    tore = {}
    wasser_vorlage = None
    in_entities = False
    while i < n:
        z = zeilen[i]
        if z.startswith("<scene "):
            z = setze_attribut(z, "name", szenenname)
        if z.strip() == "<entities>":
            in_entities = True
        elif z.strip() == "</entities>":
            in_entities = False
            # eine Wasserfläche über die ganze Karte
            assert wasser_vorlage, "keine water_plane in der Szene gefunden"
            block = list(wasser_vorlage)
            for k, bz in enumerate(block):
                if "<transform " in bz:
                    bz = setze_attribut(bz, "position", fmt(KARTE / 2, KARTE / 2, WASSERHOEHE))
                    bz = setze_attribut(bz, "rotation_euler", fmt(0, 0, 0))
                    block[k] = setze_attribut(bz, "scale", fmt(900, 900, 1))
                    break
            aus.extend(block)
        if z.strip() == "<Paths>":           # Fluss- und Küstenpfade der Calradia-Karte
            while zeilen[i].strip() != "</Paths>":
                i += 1
            aus.append(z.replace("<Paths>", "<Paths/>"))
            i += 1
            continue
        if in_entities and z.startswith("\t\t<game_entity"):
            # obersten Block einsammeln
            j, tiefe = i, 0
            while True:
                t = zeilen[j]
                if "<game_entity" in t and not t.rstrip().endswith("/>"):
                    tiefe += 1
                if "</game_entity>" in t:
                    tiefe -= 1
                    if tiefe == 0:
                        break
                j += 1
            block = zeilen[i:j + 1]
            i = j + 1
            name = attribut(block[0], "name") or ""
            prefab = attribut(block[0], "prefab") or ""
            if prefab == "water_plane" and wasser_vorlage is None and any("Main Map Sea" in b for b in block):
                wasser_vorlage = block
            if not (name.startswith(BEHALTEN) or prefab in BEHALTEN_PREFAB):
                entfernt += 1
                continue
            behalten += 1
            if name == "border_min":
                block = [setze_attribut(b, "position", fmt(10, 10, 0)) if "<transform " in b else b for b in block]
            elif name == "border_max":
                block = [setze_attribut(b, "position", fmt(KARTE - 10, KARTE - 10, 620)) if "<transform " in b else b
                         for b in block]
            elif name == "camera_top":
                block = [setze_attribut(b, "position", fmt(KARTE / 2, KARTE / 2, 11.3)) if "<transform " in b else b
                         for b in block]
            elif name.startswith("campaign_icon_capsule"):
                versetzt += versetze(block, orte, tore)
            aus.extend(block)
            continue
        aus.append(z)
        i += 1

    with open(os.path.join(ziel, "scene.xscene"), "w", encoding="utf-8", newline="") as f:
        f.write("\r\n".join(aus))
    fehlen = sorted(set(orte) - set(tore))
    schreibe_xslt(os.path.join(ziel, "siedlungen_positionen.xslt"), tore)
    print(f"{versetzt} Orte versetzt, {behalten} Objekte behalten, {entfernt} Calradia-Objekte entfernt.")
    if fehlen:
        print("Nicht in der Szene gefunden:", ", ".join(fehlen))
    print("Geschrieben nach", ziel)


def versetze(block, orte, tore):
    """Kinder eines Sammelobjekts (campaign_icon_capsule) an ihre neuen Plätze setzen."""
    eltern = None
    for b in block:
        if "<transform " in b:
            eltern = zahlen(attribut(b, "position"))
            break
    anzahl = 0
    k = 1
    while k < len(block):
        b = block[k]
        if b.startswith("\t\t\t\t<game_entity") and (attribut(b, "name") or "") in orte:
            ident = attribut(b, "name")
            o = orte[ident]
            # Ende dieses Kindes und seine eigene transform-Zeile suchen
            e, tiefe = k, 0
            while True:
                t = block[e]
                if "<game_entity" in t and not t.rstrip().endswith("/>"):
                    tiefe += 1
                if "</game_entity>" in t:
                    tiefe -= 1
                    if tiefe == 0:
                        break
                e += 1
            tz = next(m for m in range(k + 1, e) if block[m].startswith("\t\t\t\t\t<transform "))
            dreh = zahlen(attribut(block[tz], "rotation_euler") or "0, 0, 0")
            mass = zahlen(attribut(block[tz], "scale") or "1, 1, 1")
            x, y, hoehe = float(o["x"]), float(o["y"]), float(o["z"])
            tor = tor_im_ort(block[k:e + 1])
            if tor is not None:
                dreh[2] = float(o["tor_richtung"]) - math.atan2(tor[1], tor[0])
                dreh[2] = (dreh[2] + math.pi) % (2 * math.pi) - math.pi
                v = drehe([tor[0] * mass[0], tor[1] * mass[1], tor[2] * mass[2]], dreh)
                tore[ident] = (x, y, x + v[0], y + v[1])
            else:
                tore[ident] = (x, y, None, None)
            neu = setze_attribut(block[tz], "position", fmt(x - eltern[0], y - eltern[1], hoehe - eltern[2]))
            if tor is not None:
                neu = setze_attribut(neu, "rotation_euler", fmt(*dreh))
            block[tz] = neu
            anzahl += 1
            k = e
        k += 1
    return anzahl


def drehe(v, euler):
    """Vektor um die Euler-Winkel drehen (erst x, dann y, dann z)."""
    x, y, z = v
    cx, sx = math.cos(euler[0]), math.sin(euler[0])
    y, z = y * cx - z * sx, y * sx + z * cx
    cy, sy = math.cos(euler[1]), math.sin(euler[1])
    x, z = x * cy + z * sy, -x * sy + z * cy
    cz, sz = math.cos(euler[2]), math.sin(euler[2])
    return [x * cz - y * sz, x * sz + y * cz, z]


def tor_im_ort(zeilen):
    """Lage des Tors (Objekt mit dem Tag main_map_city_gate) im Koordinatensystem des Orts, sonst None."""
    wurzel = ET.fromstring("\n".join(zeilen))

    def suche(element, kette):
        for kind in element.findall("children/game_entity"):
            if kind.find("tags/tag[@name='main_map_city_gate']") is not None:
                return kette + [kind]
            fund = suche(kind, kette + [kind])
            if fund:
                return fund
        return None

    kette = suche(wurzel, [])
    if not kette:
        return None
    punkt = [0.0, 0.0, 0.0]
    for element in reversed(kette):
        t = element.find("transform")
        werte = t.attrib if t is not None else {}
        mass = zahlen(werte.get("scale", "1, 1, 1"))
        punkt = drehe([punkt[0] * mass[0], punkt[1] * mass[1], punkt[2] * mass[2]],
                      zahlen(werte.get("rotation_euler", "0, 0, 0")))
        lage = zahlen(werte.get("position", "0, 0, 0"))
        punkt = [punkt[0] + lage[0], punkt[1] + lage[1], punkt[2] + lage[2]]
    return punkt


def ruhesitz():
    """Lage des Ruhesitzes (retirement_retreat) aus data/weltkarte/namen.toml. Er hat kein Objekt in der Szene."""
    import tomllib
    import rahmen
    pfad = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "data", "weltkarte", "namen.toml")
    with open(pfad, "rb") as f:
        r = tomllib.load(f).get("ruhesitz")
    if not r:
        return {}
    x, y = rahmen.geo_zu_spiel(r["breite"], r["laenge"])
    return {r["id"]: (x, y, None, None)}


def schreibe_xslt(pfad, tore):
    t = ['<?xml version="1.0" encoding="utf-8"?>',
         "<!-- Erzeugt von tools/weltkarte/szene_vorbereiten.py. Positionen der Orte auf der Balkankarte. -->",
         '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">',
         '\t<xsl:output omit-xml-declaration="no" indent="yes" />',
         '\t<xsl:template match="@*|node()">',
         '\t\t<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>',
         "\t</xsl:template>"]
    tore = dict(tore)
    tore.update(ruhesitz())
    for ident, (x, y, tx, ty) in sorted(tore.items()):
        t.append(f"\t<xsl:template match=\"Settlement[@id='{ident}']/@posX\">"
                 f'<xsl:attribute name="posX">{x:.3f}</xsl:attribute></xsl:template>')
        t.append(f"\t<xsl:template match=\"Settlement[@id='{ident}']/@posY\">"
                 f'<xsl:attribute name="posY">{y:.3f}</xsl:attribute></xsl:template>')
        if tx is not None:
            t.append(f"\t<xsl:template match=\"Settlement[@id='{ident}']/@gate_posX\">"
                     f'<xsl:attribute name="gate_posX">{tx:.3f}</xsl:attribute></xsl:template>')
            t.append(f"\t<xsl:template match=\"Settlement[@id='{ident}']/@gate_posY\">"
                     f'<xsl:attribute name="gate_posY">{ty:.3f}</xsl:attribute></xsl:template>')
    t.append("</xsl:stylesheet>")
    with open(pfad, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(t) + "\n")


def nur_orte(ordner, csv_pfad):
    """Orte in einer schon vorbereiteten Szene neu setzen, alles andere bleibt, wie es ist."""
    orte = {z["id"]: z for z in csv.DictReader(open(csv_pfad, encoding="utf-8"), delimiter=";")}
    pfad = os.path.join(ordner, "scene.xscene")
    with open(pfad, encoding="utf-8", newline="") as f:
        text = f.read()
    ende = "\r\n" if "\r\n" in text else "\n"
    zeilen = text.split(ende)
    tore = {}
    versetzt = 0
    i = 0
    while i < len(zeilen):
        z = zeilen[i]
        if z.startswith("\t\t<game_entity") and (attribut(z, "name") or "").startswith("campaign_icon_capsule") \
                and not z.rstrip().endswith("/>"):
            j = i
            while zeilen[j] != "\t\t</game_entity>":
                j += 1
            block = zeilen[i:j + 1]
            versetzt += versetze(block, orte, tore)
            zeilen[i:j + 1] = block
            i = j
        i += 1
    with open(pfad, "w", encoding="utf-8", newline="") as f:
        f.write(ende.join(zeilen))
    schreibe_xslt(os.path.join(ordner, "siedlungen_positionen.xslt"), tore)
    fehlen = sorted(set(orte) - set(tore))
    print(f"{versetzt} Orte neu gesetzt.")
    if fehlen:
        print("Nicht in der Szene gefunden:", ", ".join(fehlen))


if __name__ == "__main__":
    if len(sys.argv) == 4 and sys.argv[1] == "--nur-orte":
        nur_orte(*sys.argv[2:])
    elif len(sys.argv) != 4:
        sys.exit(__doc__)
    else:
        hauptprogramm(*sys.argv[1:])
