#!/usr/bin/env python3
"""Prüft die XML-Dateien der Mod.

- Jede .xml-Datei unter Module/ muss wohlgeformt sein.
- SubModule.xml muss die Pflichtfelder haben, und die DLL-Namen müssen zu den C#-Projekten passen.
- Sprachdateien: jede in language_data.xml genannte Datei muss existieren.

Aufruf: python3 tools/validate_xml.py   (Exit-Code 1 bei Fehlern)
"""
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MODULE_ROOT = ROOT / "Module"
SRC_ROOT = ROOT / "src"

errors = []


def check_wellformed(path):
    try:
        return ET.parse(path)
    except ET.ParseError as exc:
        errors.append(f"{path.relative_to(ROOT)}: nicht wohlgeformt: {exc}")
        return None


def check_submodule(module_dir, tree):
    root = tree.getroot()
    rel = (module_dir / "SubModule.xml").relative_to(ROOT)
    for field in ("Id", "Name", "Version"):
        node = root.find(field)
        if node is None or not node.get("value"):
            errors.append(f"{rel}: Pflichtfeld <{field} value=...> fehlt")
    module_id = root.find("Id")
    if module_id is not None and module_id.get("value") != module_dir.name:
        errors.append(f"{rel}: Id '{module_id.get('value')}' passt nicht zum Ordnernamen '{module_dir.name}'")

    assemblies = {p.stem for p in SRC_ROOT.glob("*/*.csproj")}
    for sub in root.iter("SubModule"):
        dll = sub.find("DLLName")
        if dll is None:
            continue
        name = Path(dll.get("value", "")).stem
        if name not in assemblies:
            errors.append(f"{rel}: DLL '{name}.dll' hat kein passendes C#-Projekt unter src/")


def check_languages(module_dir):
    lang_root = module_dir / "ModuleData" / "Languages"
    for data_file in lang_root.glob("*/language_data.xml"):
        tree = check_wellformed(data_file)
        if tree is None:
            continue
        for lf in tree.getroot().iter("LanguageFile"):
            target = lang_root / lf.get("xml_path", "")
            if not target.is_file():
                errors.append(f"{data_file.relative_to(ROOT)}: Datei '{lf.get('xml_path')}' fehlt")


def main():
    xml_files = sorted(MODULE_ROOT.rglob("*.xml"))
    for path in xml_files:
        if "bin" in path.relative_to(MODULE_ROOT).parts:
            continue
        check_wellformed(path)

    for module_dir in sorted(p for p in MODULE_ROOT.iterdir() if p.is_dir()):
        sub = module_dir / "SubModule.xml"
        if not sub.is_file():
            errors.append(f"{module_dir.relative_to(ROOT)}: SubModule.xml fehlt")
            continue
        tree = check_wellformed(sub)
        if tree is not None:
            check_submodule(module_dir, tree)
        check_languages(module_dir)

    if errors:
        print("XML-Prüfung fehlgeschlagen:")
        for e in errors:
            print("  - " + e)
        return 1
    print(f"XML-Prüfung ok ({len(xml_files)} Dateien).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
