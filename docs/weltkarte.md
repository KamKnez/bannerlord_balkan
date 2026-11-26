# Balkan-Weltkarte: Dateien und Import im Editor

Stand: Die Dateien sind aus echten Geodaten erzeugt, die Szene ist vorbereitet. **Im Editor ist noch nichts davon
getestet**; der erste Import ist der Test. Erzeugt wird alles mit den Skripten unter
[tools/weltkarte/](../tools/weltkarte/README.md).

## Ausschnitt

- Quadrat von 875 km um 44,6° N / 17,3° O: von Venedig bis hinter Belgrad und Niš, von Wien und Buda bis Durrës,
  Ohrid und Apulien. Kroatien, Slawonien, Bosnien, Dalmatien, Ragusa, Montenegro und Serbien liegen in der Mitte.
- Raster wie Calradia: 16 × 16 Knoten zu 53 m, 256 Punkte je Knoten, also 848 × 848 Einheiten und 4096 × 4096
  Bildpunkte. **Eine Einheit im Spiel ist rund ein Kilometer.**
- Die Walachei liegt außerhalb. Ein Gelände lässt sich später nicht einfach ansetzen; wer sie will, ändert den
  Ausschnitt in `tools/weltkarte/rahmen.py` und erzeugt alles neu (dann wird alles kleiner).
- Höhen sind nicht maßstäblich: Das Spiel kennt eine einzige Wasserhöhe für Meer, Seen und Flüsse. Deshalb liegen
  alle Täler knapp über dem Wasser, und Berge zählen nach ihrer Höhe über dem Tal. Wasser steht auf **2,25**.

## Dateien

Auf dem Spiel-PC liegen die Bilder unter `Modules\BalkanMod\Weltkarte_Import\` und die vorbereitete Szene unter
`Modules\BalkanMod\SceneObj\balkan_map\`. Im Projektordner liegen dieselben Dateien unter `weltkarte/`.

| Datei | Inhalt |
|---|---|
| `hoehenbild_16bit.png` | Höhenbild, 4096 × 4096, 16 Bit Graustufen. Schwarz = Höhe 0, Weiß = Höhe 25,6. Flüsse, Seen und Meer sind schon eingegraben |
| `maske_wald.png`, `maske_fels.png`, `maske_wiese.png`, `maske_acker.png`, `maske_wasser.png` | Masken der Geländeebenen, 8 Bit Graustufen (weiß = Ebene deckt voll) |
| `maske_leer.png`, `maske_voll.png` | ganz schwarz und ganz weiß, zum Leeren oder Füllen einer Ebene |
| `gespiegelt/` | dieselben Bilder mit Norden unten, falls der Editor das Bild auf dem Kopf einliest |
| `hilfskarte_gelaende.png` | Farbkarte als Vorlage fürs Navmesh: Ebene, Acker, Wald, Gebirge (grau), Fluss und See, Meer |
| `vorschau.png` | Vorschau mit allen Orten (rot Stadt, gelb Burg, weiß Dorf, Kreuz Versteck) |
| `siedlungen.csv` | Platz jedes Orts: Spielkoordinaten x, y, Höhe z, Richtung des Tors, echte Koordinaten, Versatz zur echten Lage |
| `szene_vorbereiten.py` | macht aus der Kartenszene des Spiels die vorbereitete Szene `balkan_map` |

Die vorbereitete Szene `balkan_map` ist eine Kopie der Calradia-Kartenszene mit allen Ebenen, Texturen und
Skripten. Darin stehen alle 492 Orte und Verstecke schon an ihrem Platz, die Calradia-Dekoration (Felsen, Brücken,
Flüsse, Seen, Sperren) ist entfernt, und eine Wasserfläche auf Höhe 2,25 liegt über der ganzen Karte. Pflanzen und
Navmesh von Calradia sind nicht mitkopiert. Das Spiel benutzt diese Szene noch nicht, die Mod bleibt spielbar.

## Import in Minuten

1. Modding Kit starten, im Editor die Szene `balkan_map` öffnen (Modul BalkanMod).
2. **Höhenbild:** *Terrain Inspector* → Reiter *Properties* → mit Strg+A alle Knoten auswählen → Heightmap
   importieren → `hoehenbild_16bit.png`. Der Editor fragt nach *Scale* und *Offset*: Offset bleibt, Scale so, dass
   Weiß die Höhe 25,6 ergibt.
3. **Kontrolle** mit dem Höhenwerkzeug (Maus über das Gelände halten):

   | Stelle | x, y | Höhe |
   |---|---|---|
   | Meeresboden weit draußen | z. B. 250, 250 | 0,0 |
   | Zagreb | 325, 556 | rund 2,7 |
   | Dinara | 353, 366 | rund 8,2 |
   | Triglav | 167, 621 | rund 11,6 |
   | höchster Punkt (Hohe Tauern) | 84, 701 | 14,2 |

   Stimmen die Höhen nicht, Import mit anderem Scale wiederholen. Liegt Venedig unten links statt oben links,
   die Bilder aus `gespiegelt/` nehmen.
4. **Masken:** je Ebene die Ebene anwählen, *Properties*, Strg+A, *Import Materialmap*:

   | Ebene im Editor | Bild |
   |---|---|
   | `flora_forest` | `maske_wald.png` |
   | `rock` | `maske_fels.png` |
   | `grass` | `maske_wiese.png` |
   | `dirt` | `maske_acker.png` |
   | `river` | `maske_wasser.png` |
   | `dirt2`, `forest2` | `maske_leer.png` |
   | `default` | `maske_voll.png`, nur falls nach dem Import kahle Stellen bleiben |

   Die Ebene `flora_forest` setzt ihre Bäume selbst.
5. Speichern. Die Orte stehen schon; Wasser und Kartengrenzen sind gesetzt.

## Was Handarbeit bleibt

- **Navmesh.** Ohne Navmesh bewegt sich auf der Karte nichts, und der Editor kann es für die Weltkarte nicht
  erzeugen oder importieren. `hilfskarte_gelaende.png` zeigt, was wohin gehört. Nummern der Flächen laut
  Community-Doku: 1 Ebene, 4 Wald, 7 Gebirge (unpassierbar), 8 See, 10 Wasser, 11 Fluss, 6 Furt.
- **Flussübergänge.** Die Karte hat viele Flüsse (Save, Drau, Donau, Una, Vrbas, Bosna, Drina, Neretva …). Jeder
  braucht Furten oder Brücken im Navmesh, sonst trennt er die Karte.
- **Inseln.** Auf Inseln liegen Rab, Hvar, Lastovo und Orebić (die Halbinsel Pelješac ist auf der Karte an der
  Landenge von Ston vom Festland getrennt), dazu die Dörfer Pag, Lopar, Preko, Okrug, Stari Grad, Jelsa, Polače,
  Goveđari, Saplunara, Ubli, Pasadur und Skrivena Luka. Ohne Schiffe sind sie nur erreichbar, wenn das Navmesh
  einen Übergang übers Wasser bekommt, oder sie ziehen aufs Festland um.
- Danach im Editor am Objekt `settlements_scripts`: *CheckPositions*, dann
  *ComputeAndSaveSettlementDistanceCache*.

## Offene Punkte

- **Ragusa ist zu dicht.** 49 Orte auf 100 km Küste: Um Dubrovnik stehen die Orte bis zu 20 km neben ihrer
  echten Lage, damit sich die Symbole nicht überdecken (Spalte `versatz_km`). Besser wäre, Ragusa später weniger
  Orte zu geben.
- **Übrige Calradia-Reiche.** Die 190 Orte von Sturgia, Battania, Khuzait und dem Nördlichen Imperium stehen
  vorläufig an echten Orten rundum (Wien, Buda, Venedig, Triest, Temeswar, Niš, Skadar …, Quelle `vorläufig` in
  `data/weltkarte/orte.csv`), ihre Dörfer im Kreis darum. Namen und Besitzer sind noch die von Calradia.
- **Dorfkoordinaten** mit Quelle `geschätzt` sind aus dem Gedächtnis auf wenige Kilometer genau.
- **Karte scharf schalten:** Erst wenn Gelände und Navmesh stehen, wird die Szene zu `Main_map` der Mod, und
  `siedlungen_positionen.xslt` (liegt in der Szene) kommt in die `SubModule.xml`. Bis dahin spielt die Mod auf
  Calradia.
- Die heutigen Wälder, Stauseen und Flussläufe sind die von heute, nicht die von 1700.
