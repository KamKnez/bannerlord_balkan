#!/usr/bin/env python3
"""Prüft Verweise in den Spieldaten der Mod.

- Jeder Verweis wie "Item.x", "NPCCharacter.x", "Culture.x", "PartyTemplate.x", "BodyProperty.x",
  "SkillSet.x" oder "EquipmentRoster.x" (auch <EquipmentSet id="x">) muss entweder in der Mod selbst
  definiert sein oder im Spiel vorkommen (Liste unter tools/vanilla/).
- Jede Text-Id "{=balkan_...}" muss eine deutsche Übersetzung haben.
- Die Ids der Mod dürfen nicht mit Ids des Spiels zusammenfallen (sonst würden wir Spielobjekte überschreiben).

Aufruf: python3 tools/validate_refs.py   (Exit-Code 1 bei Fehlern)
"""
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MODULE_DATA = ROOT / "Module" / "BalkanMod" / "ModuleData"
VANILLA = ROOT / "tools" / "vanilla" / "ids_v1.5.7.txt"
TYPES = (
    "Item", "NPCCharacter", "Culture", "PartyTemplate", "BodyProperty", "SkillSet", "EquipmentRoster",
    "Hero", "Faction", "Kingdom", "Settlement",
)
REF = re.compile(r"\b(" + "|".join(TYPES) + r")\.([A-Za-z0-9_]+)")
TEXT_ID = re.compile(r"\{=(balkan_[A-Za-z0-9_]+)\}")
XSL = "{http://www.w3.org/1999/XSL/Transform}"


def load_vanilla():
    ids = set()
    for line in VANILLA.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line and not line.startswith("#"):
            ids.add(line)
    return ids


def own_definitions():
    """Ids, die die Mod selbst anlegt."""
    defined = set()
    for path in MODULE_DATA.glob("*.xml"):
        root = ET.parse(path).getroot()
        for el in root:
            el_id = el.get("id")
            if not el_id:
                continue
            if el.tag == "NPCCharacter":
                defined.add(f"NPCCharacter.{el_id}")
            elif el.tag == "MBPartyTemplate":
                defined.add(f"PartyTemplate.{el_id}")
            elif el.tag == "Item":
                defined.add(f"Item.{el_id}")
            elif el.tag == "Culture":
                defined.add(f"Culture.{el_id}")
    # neue Kulturen aus dem XSLT-Patch: <xsl:attribute name="id">venice</xsl:attribute>
    for path in (MODULE_DATA / "XSLT").glob("*.xslt"):
        root = ET.parse(path).getroot()
        for attr in root.iter(f"{XSL}attribute"):
            if attr.get("name") == "id" and attr.text:
                defined.add(f"Culture.{attr.text.strip()}")
    return defined


def iter_values(path):
    root = ET.parse(path).getroot()
    for el in root.iter():
        for key, value in el.attrib.items():
            yield el, key, value
        if el.text and el.text.strip():
            yield el, None, el.text.strip()


def german_ids():
    ids = set()
    for path in (MODULE_DATA / "Languages" / "DE").glob("*.xml"):
        root = ET.parse(path).getroot()
        for s in root.iter("string"):
            ids.add(s.get("id"))
    return ids


def main():
    errors = []
    vanilla = load_vanilla()
    own = own_definitions()
    known = vanilla | own
    de = german_ids()

    for clash in sorted(own & vanilla):
        errors.append(f"Id der Mod gibt es schon im Spiel: {clash}")

    files = sorted(MODULE_DATA.glob("*.xml")) + sorted((MODULE_DATA / "XSLT").glob("*.xslt"))
    refs = 0
    for path in files:
        rel = path.relative_to(ROOT).as_posix()
        for el, key, value in iter_values(path):
            for kind, name in REF.findall(value):
                refs += 1
                if f"{kind}.{name}" not in known:
                    errors.append(f"{rel}: unbekannter Verweis {kind}.{name}")
            if el.tag == "EquipmentSet" and key == "id":
                refs += 1
                if f"EquipmentRoster.{value}" not in known:
                    errors.append(f"{rel}: unbekanntes EquipmentSet {value}")
            for text_id in TEXT_ID.findall(value):
                if text_id not in de:
                    errors.append(f"{rel}: Text-Id {text_id} hat keine deutsche Übersetzung")

    if errors:
        print("Verweisprüfung fehlgeschlagen:")
        for e in errors:
            print("  - " + e)
        return 1
    print(f"Verweisprüfung ok ({refs} Verweise in {len(files)} Dateien).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
