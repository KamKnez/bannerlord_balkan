# Balkan 1700

Total-Conversion-Mod für **Mount & Blade II: Bannerlord** (gebaut gegen Spielversion v1.5.7).
Schauplatz ist Südosteuropa: Grenzen und Lords wie um 1700 nach dem Frieden von Karlowitz,
Truppen und Ausrüstung im Stil von etwa 1600 bis 1680, dazu ein Hauch Low Fantasy aus dem Volksaberglauben.

Die erste spielbare Version deckt Kroatien, Slawonien, Bosnien-Herzegowina und Dalmatien ab,
mit Habsburgern, Osmanen, Venedig und Ragusa. Danach wird die Karte in Runden erweitert.

## Stand

Phase 2 läuft. Im Spiel sind die ersten vier Kulturen mit eigenen Truppenbäumen:
Kroaten (statt Vlandia), Bosniaken (statt Aserai) sowie Venezianer und Ragusaner als neue Kulturen.
Dazu Deutsche, Ungarn, Serben und Türken als eigene Kulturen ohne Reich, rekrutierbar in ihren Dörfern.
Dazu die vier Königreiche Habsburger (statt Vlandia), Osmanen (statt Aserai), Venedig (statt Westliches Imperium)
und Ragusa (statt Südliches Imperium) mit umbenannten Clans und Lords. Ihre 203 Städte, Burgen und Dörfer tragen
echte Ortsnamen (Zagreb, Sarajevo, Zadar, Dubrovnik …) und Beschreibungen um 1700 statt der Calradia-Geschichten. Die Reiche haben eigene Wappenfarben; zu Spielbeginn führen Habsburger und Venedig Krieg gegen die Osmanen.
Schützen tragen Arkebusen und Musketen, Reiter Pistolen ([data/waffen.toml](data/waffen.toml)). Die Gewehre haben
Musketen-Modelle aus Napoleonic Warfare (siehe [CREDITS.md](CREDITS.md)); Mechanik und Klang sind noch die der Armbrust.
Zum Ausprobieren liegen nach der Charaktererstellung eine Muskete, eine Pistole und Munition im Inventar. Als Nächstes folgt eine Balance-Runde
nach Spieltest (siehe [docs/design.md](docs/design.md)).

## Installieren und testen

**Ohne selbst zu bauen:** Bei jedem Pull Request und jedem Stand auf `main` baut GitHub die Mod automatisch.
Unter *Actions* → letzter Lauf → *Artifacts* gibt es das Paket `BalkanMod` zum Herunterladen.

0. Vorher diese Mods installieren (z. B. über Nexus Mods oder den Steam Workshop), mindestens in diesen Versionen:
   Harmony 2.4.2, ButterLib 2.12.0, UIExtenderEx 3.0.3 und Mod Configuration Menu (MCM) 5.13.1.
   Im Launcher müssen sie über „Balkan 1700“ stehen.
   Heruntergeladene Zip-Dateien vor dem Entpacken entsperren (Rechtsklick → *Eigenschaften* → *Zulassen*),
   sonst blockiert Windows die DLLs und das Spiel startet die Mods nicht.
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
| `data/` | Rohdaten, aus denen die XML-Dateien entstehen: Namenslisten, Kulturen und Truppen ([data/kulturen/](data/kulturen/README.md)), Königreiche, Clans und Lords ([data/reiche/](data/reiche/README.md)), Feuerwaffen ([data/waffen.toml](data/waffen.toml)) |
| `tools/` | Generator `gen_content.py` und Prüfskripte |
| `docs/` | Recherche und Design-Dokumente (ab Phase 1) |

## Automatische Prüfung

Bei jedem Push und Pull Request laufen:

- `python3 tools/validate_xml.py`: alle XML-Dateien wohlgeformt, `SubModule.xml` vollständig, Sprachdateien vorhanden.
- `python3 tools/validate_names.py`: Namenslisten unter `data/namen/` vollständig und ohne Dopplungen.
- `python3 tools/gen_content.py --check`: die erzeugten Spieldaten passen zu `data/kulturen/`.
- `python3 tools/validate_refs.py`: alle Verweise auf Gegenstände, Gesichter und Truppen gibt es im Spiel (v1.5.7), und jeder Text hat eine deutsche Übersetzung.
- `dotnet build`: der C#-Code baut gegen die Referenz-DLLs des Spiels.

## Einstellungen

**Schneller Zeitraffer:** Über der Zeitsteuerung unten auf der Karte (Pause, Play, Vorspulen) liegen zwei
zusätzliche Knöpfe, standardmäßig **8x** und **16x** (das Vorspulen des Spiels ist 4x). Tastenkürzel: **4** und **5**.
Pause, Play oder das normale Vorspulen beenden den schnellen Zeitraffer wieder.

Im Spiel unter *Optionen* → *Mod-Optionen* → *Balkan 1700* (kommt von MCM):

| Einstellung | Bereich | Standard | Wirkung |
|---|---|---|---|
| Reisegeschwindigkeit aller Parteien | 0,5x bis 4x | 1,0x | alle Parteien auf der Karte, auch Lords und Karawanen |
| Zusätzliche Geschwindigkeit der eigenen Partei | 0,5x bis 4x | 1,0x | nur die eigene Partei, wird mit dem ersten Wert multipliziert (1,5x · 2x = 3x) |
| Erster zusätzlicher Vorspulknopf | 5x bis 32x | 8x | Zeitraffer des ersten Knopfs (Taste 4) |
| Zweiter zusätzlicher Vorspulknopf | 5x bis 64x | 16x | Zeitraffer des zweiten Knopfs (Taste 5) |

Änderungen gelten sofort, auch in laufenden Kampagnen. Im Tooltip der Geschwindigkeit stehen sie als eigene Zeilen.

## Sprachen

Englisch ist die Hauptsprache (Texte direkt im Code bzw. in den XML-Daten),
Deutsch liegt unter `Module/BalkanMod/ModuleData/Languages/DE/`.

## Credits und Quellen

Siehe [CREDITS.md](CREDITS.md) und [SOURCES.md](SOURCES.md).
