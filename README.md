# Balkan 1700 (Arbeitstitel)

Total-Conversion-Mod für **Mount & Blade II: Bannerlord** (gebaut gegen Spielversion v1.5.7).
Schauplatz ist Südosteuropa: Grenzen und Lords wie um 1700 nach dem Frieden von Karlowitz,
Truppen und Ausrüstung im Stil von etwa 1600 bis 1680, dazu ein Hauch Low Fantasy aus dem Volksaberglauben.

Die erste spielbare Version deckt Kroatien, Slawonien, Bosnien-Herzegowina und Dalmatien ab,
mit Habsburgern, Osmanen, Venedig und Ragusa. Danach wird die Karte in Runden erweitert.

## Stand

Phase 0: Grundgerüst. Die Mod lädt und zeigt im Hauptmenü die Meldung „Balkan-Mod geladen.“ (Englisch: „Balkan mod loaded.“).
Inhalte kommen ab Phase 2.

## Installieren und testen

**Ohne selbst zu bauen:** Bei jedem Pull Request und jedem Stand auf `main` baut GitHub die Mod automatisch.
Unter *Actions* → letzter Lauf → *Artifacts* gibt es das Paket `BalkanMod` zum Herunterladen.

1. Den Inhalt nach `…\Mount & Blade II Bannerlord\Modules\BalkanMod\` kopieren
   (darin liegen dann `SubModule.xml`, `ModuleData\` und `bin\`).
2. Im Bannerlord-Launcher unter *Singleplayer* → *Mods* „Balkan 1700“ anhaken.
3. Spiel starten. Unten links im Hauptmenü sollte „Balkan-Mod geladen.“ stehen.

**Selbst bauen** (braucht das .NET SDK 8):

```
dotnet build src/BalkanMod/BalkanMod.csproj -c Release
```

Mit `-p:GameFolder="C:\Program Files (x86)\Steam\steamapps\common\Mount & Blade II Bannerlord"`
wird der Modulordner nach dem Bauen direkt ins Spiel kopiert.

## Aufbau

| Ordner | Inhalt |
|---|---|
| `Module/BalkanMod/` | Der Modulordner, wie er im Spiel liegt: `SubModule.xml`, `ModuleData/` (XML-Daten, Sprachen) |
| `src/BalkanMod/` | C#-Code der Mod |
| `tools/` | Prüfskripte (z. B. `validate_xml.py`) |
| `docs/` | Recherche und Design-Dokumente (ab Phase 1) |

## Automatische Prüfung

Bei jedem Push und Pull Request laufen:

- `python3 tools/validate_xml.py`: alle XML-Dateien wohlgeformt, `SubModule.xml` vollständig, Sprachdateien vorhanden.
- `dotnet build`: der C#-Code baut gegen die Referenz-DLLs des Spiels.

## Sprachen

Englisch ist die Hauptsprache (Texte direkt im Code bzw. in den XML-Daten),
Deutsch liegt unter `Module/BalkanMod/ModuleData/Languages/DE/`.

## Credits und Quellen

Siehe [CREDITS.md](CREDITS.md) und [SOURCES.md](SOURCES.md).
