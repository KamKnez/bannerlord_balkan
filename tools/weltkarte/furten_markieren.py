"""Setzt an jede Furt des Navmeshs einen Holzsteg, damit man die Übergänge auf der Karte sieht.

Aufruf: python3 furten_markieren.py <scene.xscene> <furten.csv> <siedlungen.csv>

furten.csv schreibt navmesh_bauen.py (Mitte, Richtung der Querung, Länge). Der Steg besteht aus Stücken des
Kartenmodells mi_emp_bridge_wooden, wie Calradias Holzbrücken; die Endstücke sind als Rampe geneigt. Die Stege
sind nur Zeichen: Begehbar ist die Furt durch das Navmesh. Furten direkt an einem Ort bekommen keinen Steg (dort ist
nur das Feld des Orts selbst begehbar gemacht, der Steg läge auf dem Ortsmodell). Ein zweiter Lauf ersetzt die
vorhandenen Stege.
"""
import csv
import math
import re
import sys

import rahmen as R

GROESSE = 3.739          # Maßstab der Stücke wie in Calradia
STUECK = 1.5             # Länge eines Stücks bei diesem Maßstab
HOEHE = R.WASSERHOEHE + 0.15
RAMPE = 0.19             # Neigung der Endstücke
NAME = "balkan_furt"
ORT_ABSTAND = 4.5        # näher an einem Ort gibt es keinen Steg

szene, liste, orte_pfad = sys.argv[1:4]
orte = [(float(o["x"]), float(o["y"])) for o in csv.DictReader(open(orte_pfad, encoding="utf-8"), delimiter=";")]
roh = open(szene, "rb").read()
nl = "\r\n" if b"\r\n" in roh[:2000] else "\n"
text = roh.decode("utf-8")
text = re.sub(rf'\t\t<game_entity name="{NAME}" old_prefab_name="">.*?\n\t\t</game_entity>\r?\n', "", text, flags=re.S)

zeilen = []
zahl = 0
for furt in csv.DictReader(open(liste, encoding="utf-8"), delimiter=";"):
    x, y, w, laenge = (float(furt[k]) for k in ("x", "y", "winkel", "laenge"))
    if any(math.hypot(x - a, y - b) < ORT_ABSTAND for a, b in orte):
        continue
    n = max(2, math.ceil(laenge / STUECK))
    drehung = w - math.pi / 2          # die Stücke laufen entlang ihrer y-Achse
    zeilen += [f'\t\t<game_entity name="{NAME}" old_prefab_name="">',
               f'\t\t\t<transform position="{x:.3f}, {y:.3f}, {HOEHE:.3f}" rotation_euler="0.000, 0.000, {drehung:.3f}"/>',
               "\t\t\t<children>"]
    for k in range(n):
        lage = (k - (n - 1) / 2) * STUECK
        neigung = RAMPE if k == 0 else -RAMPE if k == n - 1 else 0.0
        tief = -0.12 if neigung else 0.0
        zeilen += ['\t\t\t\t<game_entity name="map_bridge_b" old_prefab_name="">',
                   f'\t\t\t\t\t<transform position="0.000, {lage:.3f}, {tief:.3f}" rotation_euler="{neigung:.3f}, 0.000, 0.000"'
                   f' scale="{GROESSE:.3f}, {GROESSE:.3f}, {GROESSE:.3f}"/>',
                   "\t\t\t\t\t<components>",
                   '\t\t\t\t\t\t<meta_mesh_component name="mi_emp_bridge_wooden"/>',
                   "\t\t\t\t\t</components>",
                   "\t\t\t\t</game_entity>"]
    zeilen += ["\t\t\t</children>", "\t\t</game_entity>"]
    zahl += 1

ende = text.rindex("\t</entities>")
text = text[:ende] + nl.join(zeilen) + nl + text[ende:]
open(szene, "wb").write(text.encode("utf-8"))
print(f"{zahl} Stege gesetzt")
