# Wappen im Bannersystem

Wappen werden in `data/reiche/*.toml` als `[clan.wappen]` beschrieben und von `tools/gen_content.py`
(über `tools/wappen.py`) in den Bannercode des Spiels übersetzt. Jedes Wappen braucht eine `quelle`;
die Belege stehen in `docs/belege_inhalte.md`.

## Lage und Größe

- Lage `x`, `y` zählt vom Mittelpunkt des Banners, `x` nach rechts, `y` nach unten.
- Sichtbar ist auf dem Schild etwa `x` −300 bis 300 und `y` −370 bis 370.
- `groesse` (oder `breite` und `hoehe`) ist die Kante des Zeichenfelds. Das Quadrat 505 füllt davon
  etwa 88 %: eine Fläche von 0 bis 900 braucht also Größe 1020 bei Lage 450.
- `drehung` in Grad, 45 ergibt einen Schrägbalken von oben links nach unten rechts.

## Farben

rot (83), weiss/silber (172), gold (15), blau (202), schwarz (116), gruen (126), braun (92).
Die Zahl ist die Nummer der Farbe in der Palette des Spiels.

## Zeichen (Nummern aus `Native/ModuleData/banner_icons.xml`)

| Nummer | Zeichen |
|---|---|
| 100, 101 | Doppeladler |
| 102, 104 | Adler mit ausgebreiteten Flügeln |
| 118 | stehender Vogel (für den Pelikan) |
| 124, 125 | Pferd laufend oder steigend |
| 135 | Hirsch |
| 138 | Bär |
| 140 | Löwe steigend |
| 141 | Löwe schreitend |
| 146 | Hund |
| 149 | Eber |
| 155 | Schlange |
| 157 | Schwan oder Gans |
| 158 | Fisch |
| 160 | Löwe mit Fahne |
| 161 bis 164 | Doppeladler, Varianten |
| 206 | Rose am Stiel |
| 220 | fünfblättrige Rose (heraldisch) |
| 203 | Tanne |
| 301 | Schwert |
| 309 | Säbel |
| 327 | Turm |
| 326 | Burgtor |
| 333 | Schiff |
| 335 | Hufeisen |
| 336 | gekreuzte Schlüssel |
| 340 | Krone |
| 419 | Kreuz |
| 424 | Lilie |
| 427, 428 | Halbmond |
| 505 | gefülltes Quadrat (für Felder, Balken, Schach) |
| 506 | Oval |
| 510 | waagrechter Balken |
| 511 | Sparren |
| 512 | Raute |
| 516 | fünfzackiger Stern |
| 518 | sechszackiger Stern |
| 522 | Andreaskreuz |
