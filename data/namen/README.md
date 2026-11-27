# Namenslisten

Vornamen pro Kultur, Stand etwa 1600 bis 1700. Daraus entstehen in Phase 2 die `male_names`, `female_names`
und `clan_names` der Kulturen in Bannerlord. Eine Zeile pro Name, Schreibweise der jeweiligen Sprache.

| Datei | Kultur |
|---|---|
| `kroaten.txt` | Kroaten (Habsburger) |
| `deutsche.txt` | Deutsche (Habsburger) |
| `ungarn.txt` | Ungarn (Habsburger) |
| `serben.txt` | Serben (Grenzer, Martolosen) |
| `bosniaken.txt` | Bosnische Muslime (Osmanen) |
| `tuerken.txt` | Türken (Osmanen) |
| `italiener.txt` | Italiener und Venezianer |
| `ragusaner.txt` | Ragusaner (Dubrovnik) |
| `bulgaren.txt` | Bulgaren (Osmanen) |
| `griechen.txt` | Griechen (Osmanen) |

Aufbau jeder Datei: Abschnitte `[maennlich]`, `[weiblich]` und `[familien]` (Familiennamen für Clans und Lords).
Die Liste prüft `tools/validate_names.py` (keine Dopplungen, keine leeren Abschnitte).
