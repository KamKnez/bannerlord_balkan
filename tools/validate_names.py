#!/usr/bin/env python3
"""Prüft die Namenslisten unter data/namen/.

Jede .txt-Datei muss die Abschnitte [maennlich], [weiblich] und [familien] haben,
jeder Abschnitt braucht mindestens einen Namen, und kein Name darf in einem Abschnitt doppelt vorkommen.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
NAMES_DIR = ROOT / "data" / "namen"
SECTIONS = ("maennlich", "weiblich", "familien")


def parse(path):
    sections = {}
    current = None
    for lineno, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("[") and line.endswith("]"):
            current = line[1:-1]
            sections.setdefault(current, [])
            continue
        if current is None:
            raise ValueError(f"Zeile {lineno}: Name vor dem ersten Abschnitt")
        sections[current].append(line)
    return sections


def main():
    errors = []
    files = sorted(NAMES_DIR.glob("*.txt"))
    for path in files:
        rel = path.relative_to(ROOT)
        try:
            sections = parse(path)
        except ValueError as exc:
            errors.append(f"{rel}: {exc}")
            continue
        for name in SECTIONS:
            entries = sections.get(name)
            if not entries:
                errors.append(f"{rel}: Abschnitt [{name}] fehlt oder ist leer")
                continue
            seen = set()
            for entry in entries:
                if entry in seen:
                    errors.append(f"{rel}: '{entry}' doppelt in [{name}]")
                seen.add(entry)
        for name in sections:
            if name not in SECTIONS:
                errors.append(f"{rel}: unbekannter Abschnitt [{name}]")
    if errors:
        print("Namensprüfung fehlgeschlagen:")
        for e in errors:
            print("  - " + e)
        return 1
    print(f"Namensprüfung ok ({len(files)} Dateien).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
