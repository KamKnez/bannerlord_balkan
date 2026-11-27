"""Stellt die Orte der Szenendatei gerade auf das Gelände.

Aufruf: python3 orte_aufsetzen.py <Arbeitsordner> <scene.xscene>

Die Ortsmodelle stammen aus Calradia und waren dort an die Hänge angepasst: gekippt, und die Betriebe der Dörfer
(Minen, Höfe, Sägewerke) mit eigener Höhe und Neigung. Auf dem Balkan-Gelände (spielhoehe.npy im Arbeitsordner,
nach orte_einebnen.py) hängen sie damit in der Luft oder stecken im Boden. Das Skript
- setzt jeden Ort (Stadt, Burg, Dorf, Versteck) auf die Geländehöhe an seinem Platz und nimmt die Neigung heraus,
- setzt jeden Betrieb eines Dorfs auf die Geländehöhe an seinem eigenen Platz, ohne Neigung, und zieht ihn zum
  Dorf hin, falls er im Wasser stünde.
Die Lage in x und y und die Drehung um die Hochachse bleiben. Ein zweiter Lauf ändert nichts mehr.
"""
import math
import re
import sys

import numpy as np

import rahmen as R
from szene_vorbereiten import drehe

arbeit, szene = sys.argv[1:3]
spiel = np.load(f"{arbeit}/spielhoehe.npy")
px = R.PIXEL / R.KARTE
ORT = re.compile(r'\t\t\t\t<game_entity name="(town|castle|village|castle_village|hideout)_[^"]*"')
LAGE = r'<transform position="([-\d.]+), ([-\d.]+), ([-\d.]+)"'


def hoehe(x, y):
    s = min(R.PIXEL - 1, max(0, int(x * px)))
    z = min(R.PIXEL - 1, max(0, int((R.KARTE - y) * px)))
    return float(spiel[z, s])


roh = open(szene, "rb").read()
nl = "\r\n" if b"\r\n" in roh[:2000] else "\n"
zeilen = roh.decode("utf-8").split(nl)
gruppe = ort = None
orte = betriebe = gezogen = 0
for i, zeile in enumerate(zeilen):
    if zeile.startswith("\t\t<game_entity "):
        gruppe = ort = None
        for j in range(i + 1, min(i + 12, len(zeilen))):
            t = re.match(r"\t\t\t" + LAGE, zeilen[j])
            if t:
                gruppe = tuple(map(float, t.groups()))
                break
    elif zeile.startswith("\t\t\t\t<game_entity "):
        ort = None
        if gruppe and ORT.match(zeile):
            for j in range(i + 1, i + 8):
                t = re.match(r'(\t\t\t\t\t<transform position=")([-\d.]+), ([-\d.]+), ([-\d.]+)(" rotation_euler=")'
                             r'([-\d.]+), ([-\d.]+), ([-\d.]+)(")(?: scale="([-\d.]+), ([-\d.]+), ([-\d.]+)")?(.*)',
                             zeilen[j])
                if t:
                    g = t.groups()
                    x, y = float(g[1]) + gruppe[0], float(g[2]) + gruppe[1]
                    z = max(R.WASSERHOEHE + 0.05, hoehe(x, y))
                    mass = tuple(float(v) for v in g[9:12]) if g[9] else (1.0, 1.0, 1.0)
                    ort = (x, y, z, float(g[7]), mass)
                    zeilen[j] = f"{g[0]}{g[1]}, {g[2]}, {z - gruppe[2]:.3f}{g[4]}0.000, 0.000, {g[7]}\"" + zeilen[j][t.end(9):]
                    orte += 1
                    break
    elif ort and re.match(r'\t\t\t\t\t\t<game_entity name="map_icons_production', zeile):
        for j in range(i + 1, i + 8):
            t = re.match(r'(\t\t\t\t\t\t\t<transform position=")([-\d.]+), ([-\d.]+), ([-\d.]+)(")'
                         r'( rotation_euler="[^"]*"| non_orthogonal_rotation_mat="[^"]*")(.*)', zeilen[j])
            if t:
                lx, ly = float(t.group(2)), float(t.group(3))
                f = 1.0
                while True:
                    v = drehe((lx * f * ort[4][0], ly * f * ort[4][1], 0), (0, 0, ort[3]))
                    h = hoehe(ort[0] + v[0], ort[1] + v[1])
                    if h >= R.WASSERHOEHE + 0.03 or f < 0.25:
                        break
                    f -= 0.15
                gezogen += f < 1
                m = re.search(r'rotation_euler="[-\d.]+, [-\d.]+, ([-\d.]+)"', t.group(6))
                if m:
                    gier = float(m.group(1))
                else:
                    a = [float(v) for v in re.search(r'mat="([^"]*)"', t.group(6)).group(1).split(",")]
                    gier = math.atan2(a[1], a[0])
                lz = (max(h, R.WASSERHOEHE) - ort[2]) / ort[4][2]
                zeilen[j] = (f"{t.group(1)}{lx * f:.3f}, {ly * f:.3f}, {lz:.3f}{t.group(5)}"
                             f' rotation_euler="0.000, 0.000, {gier:.3f}"{t.group(7)}')
                betriebe += 1
                break

open(szene, "wb").write(nl.join(zeilen).encode("utf-8"))
print(f"{orte} Orte aufgesetzt, {betriebe} Betriebe aufgesetzt, davon {gezogen} aus dem Wasser gezogen")
