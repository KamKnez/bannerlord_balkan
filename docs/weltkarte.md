# Balkan-Weltkarte: Dateien und Import im Editor

Stand: Die Dateien sind aus echten Geodaten erzeugt, die Szene ist vorbereitet. **Im Editor ist noch nichts davon
getestet**; der erste Import ist der Test. Erzeugt wird alles mit den Skripten unter
[tools/weltkarte/](../tools/weltkarte/README.md).

## Ausschnitt

- Quadrat von 2050 km um 42,6° N / 24,3° O: von Venedig bis zur Krim und Kertsch, von Krakau, Lemberg und Kiew
  bis Kreta und Zypern. Darin liegen Wien, Buda, der ganze Balkan, die Walachei und Moldau, Istanbul, Ankara,
  Griechenland mit allen Inseln, Süditalien und Sizilien. So steht es auch im Design ([design.md](design.md)).
- Raster wie Calradia: 16 × 16 Knoten zu 53 m, 256 Punkte je Knoten, also 848 × 848 Einheiten und 4096 × 4096
  Bildpunkte. **Eine Einheit im Spiel sind rund 2,4 km**, ein Bildpunkt 500 m.
- Höhen sind nicht maßstäblich: Das Spiel kennt eine einzige Wasserhöhe für Meer, Seen und Flüsse. Deshalb liegen
  alle Täler knapp über dem Wasser, und Berge zählen nach ihrer Höhe über dem Tal. Wasser steht auf **2,25**.

### Was der Maßstab bedeutet

- **Spieltempo:** Die Karte ist so groß wie Calradia, Reisen von Rand zu Rand dauern also gleich lang. Von Zagreb
  nach Sarajevo sind es rund 120 Einheiten, von Wien nach Istanbul rund 530.
- **Dichte:** Calradia hat 280 Orte auf derselben Fläche. Das Kernland (Kroatien, Bosnien, Dalmatien, Ragusa) ist
  hier nur rund 170 × 170 Einheiten groß und hat Platz für etwa 40 Orte, nicht für 203. Vorläufig stehen dort
  trotzdem alle 203, dicht gedrängt; die übrige Karte ist fast leer. Die Orte müssen in einer eigenen Runde neu
  verteilt werden (siehe offene Punkte).
- **Navmesh:** gleiche Fläche wie Calradia, also der gleiche Aufwand wie beim kleinen Ausschnitt. Mehr Küste und
  Inseln, dafür weniger Flüsse: Gegraben sind nur große Flüsse (Donau, Save, Drau, Theiß, Dnjepr, Dnjestr, Pruth,
  Olt, Morava, Vardar, Marica …) und die wichtigsten im Kernland (Una, Vrbas, Bosna, Drina, Neretva, Kupa, Cetina).
- **Leistung:** Geländegröße wie im Spiel, also kein Mehraufwand für den Laptop.

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

## Stand nach dem ersten Versuch im Editor (26.11.2026)

Die volle Szene `balkan_map` (16 × 16 Kacheln wie Calradia) ließ sich auf dem Laptop nicht öffnen: Der Editor
bricht beim Laden des Geländes mit „could not get new memory“ ab. Gearbeitet wird deshalb mit der leichten Szene
`balkan_karte`:

- Gelände im Editor neu angelegt: 8 × 8 Kacheln, Kachelgröße 106, 256 × 256 je Kachel. Die Karte bleibt 848
  Einheiten groß, alle Ortspositionen gelten weiter. Die Bilder dafür haben 2048 Pixel und liegen im Unterordner
  `leicht/` (einfach die großen Bilder halbiert).
- Orte, Wasserfläche, Kartengrenzen und die acht Geländeebenen sind aus `balkan_map` in die Szenendatei kopiert.
  Höhenbild (Scale 25.6, Offset 0) und Masken hat der Editor ohne Fehler eingelesen.
- Aus der Szene entfernt, weil es nur zu Calradia passt: das Randgebirge (`outer_mesh`), der Schnee-Bereich
  (`MapSnowAndRainDefiner`, macht sonst Boden und Bäume weiß) und lose Zierobjekte (`map_icons_…`) in den
  Sammelobjekten.
- Das `SettlementPositionScript` ist vorerst herausgenommen. Es öffnet beim Speichern
  `Modules/BalkanMod/ModuleData/settlements.xml`; die Datei gibt es nicht, der Editor stürzt dann ab. Es kommt
  zurück, wenn das Navmesh steht.
- Licht: `atmosphere.xml` der Calradia-Karte statt des Editor-Standards, Belichtung etwas gesenkt.
- Farben: Die Bodentexturen der Weltkarte sind grau-weiß, Calradia färbt sie über ein fertig gemaltes Farbbild
  (`TileSets/WorldMap`, 2 GB). Hier hat stattdessen jede Ebene einen Farbton (`albedo_factor_color`,
  `albedo_factor_mode="2"`), und `vista_layer_detail_distance` steht auf 10000.
- Die weißen Würfel bei den Orten sind Hilfspunkte des Editors (Tor, Lager, Banner), keine fehlenden Modelle.

**Orte aus dem Kern verlegt (26.11.2026).** Im Maßstab der großen Karte standen 213 der 492 Orte in Kroatien,
Bosnien und Dalmatien, dreimal so dicht wie in Calradia. Deshalb liegen 33 Sitze der vier Mod-Reiche jetzt dort,
wo die Reiche um 1700 wirklich lagen (Quelle `verlegt` in `data/weltkarte/orte.csv`): Habsburger bis Wien, Buda,
Pressburg und Klausenburg, Osmanen bis Sofia, Saloniki und Edirne, Venedig mit Venedig, Korfu und der Morea,
Ragusa vorläufig entlang der Küste bis Epirus. Um Dubrovnik bleiben nur Dubrovnik und Ston. Kein Ort liegt auf einer Insel, weil die Karte
ohne Schiffe gespielt wird. Die Dörfer verlegter Sitze haben noch
keine Namen. Die Namen im Spiel (`[orte]` in `data/reiche/`) sind noch nicht nachgezogen.

Die Schritte unten gelten sinngemäß für `balkan_karte` mit den Bildern aus `leicht/`.

## Import in Minuten

1. Modding Kit starten, im Editor die Szene `balkan_map` öffnen (Modul BalkanMod).
2. **Höhenbild:** *Terrain Inspector* → Reiter *Properties* → mit Strg+A alle Knoten auswählen → Heightmap
   importieren → `hoehenbild_16bit.png`. Der Editor fragt nach *Scale* und *Offset*: Offset bleibt, Scale so, dass
   Weiß die Höhe 25,6 ergibt.
3. **Kontrolle** mit dem Höhenwerkzeug (Maus über das Gelände halten):

   | Stelle | x, y | Höhe |
   |---|---|---|
   | Meeresboden weit draußen | z. B. 600, 500 (Schwarzes Meer) | 0,0 |
   | Zagreb | 158, 585 | rund 2,7 |
   | Triglav | 93, 619 | rund 8,2 |
   | Olymp | 356, 309 | rund 10,8 |
   | höchster Punkt (Ätna) | 85, 220 | 12,5 |

   Stimmen die Höhen nicht, Import mit anderem Scale wiederholen. Liegt Kreta oben statt unten,
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
- **Flussübergänge und Meerengen.** Jeder Fluss braucht Furten oder Brücken im Navmesh, sonst trennt er die
  Karte. Bosporus und Dardanellen brauchen einen Übergang, sonst ist Kleinasien abgeschnitten.
- **Inseln.** Ohne Schiffe sind Inseln nur erreichbar, wenn das Navmesh einen Übergang übers Wasser bekommt.
  Derzeit stehen dort Hvar und ein paar Dörfer. Kreta, Zypern, Sizilien und die Ägäis sind Gelände ohne Orte.
- Danach im Editor am Objekt `settlements_scripts`: *CheckPositions*, dann
  *ComputeAndSaveSettlementDistanceCache*.

## Offene Punkte

- **Orte neu verteilen (wichtigster Punkt).** Die 203 Orte der Mod stehen an ihrer echten Lage, soweit Platz
  ist; im Gedränge um Dubrovnik und in Dalmatien liegen manche bis zu 70 km daneben (Spalte `versatz_km`). Für
  diesen Maßstab sollten im Kernland rund 40 Orte bleiben und die übrigen an echte Orte in Ungarn, Serbien, der
  Walachei, Bulgarien, Griechenland und Kleinasien umziehen, mit neuen Namen und Besitzern.
- **Übrige Calradia-Reiche.** Die 190 Orte von Sturgia, Battania, Khuzait und dem Nördlichen Imperium stehen
  vorläufig an echten Orten rundum (Wien, Buda, Krakau, Lemberg, Venedig, Neapel, Bukarest, Jassy, Kiew, die
  Krim, Istanbul, Edirne, Saloniki, Athen, Smyrna, Ankara …, Quelle `vorläufig` in `data/weltkarte/orte.csv`),
  ihre Dörfer im Kreis darum. Namen und Besitzer sind noch die von Calradia.
- **Dorfkoordinaten** mit Quelle `geschätzt` sind aus dem Gedächtnis auf wenige Kilometer genau.
- **Karte scharf schalten:** Erst wenn Gelände und Navmesh stehen, wird die Szene zu `Main_map` der Mod, und
  `siedlungen_positionen.xslt` (liegt in der Szene) kommt in die `SubModule.xml`. Bis dahin spielt die Mod auf
  Calradia.
- Wälder, Stauseen und Flussläufe sind die von heute, nicht die von 1700.
