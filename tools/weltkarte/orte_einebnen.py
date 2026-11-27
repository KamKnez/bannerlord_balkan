"""Ebnet das Gelände unter jedem Ort ein, damit Städte, Burgen und Dörfer nicht am Hang hängen.

Aufruf: python3 orte_einebnen.py <Arbeitsordner> <siedlungen.csv> <Zielordner>

Liest spielhoehe_roh.npy aus dem Arbeitsordner (beim ersten Lauf eine Kopie von spielhoehe.npy), setzt unter jedem
Ort eine ebene Fläche auf die mittlere Höhe des Landes dort und führt sie über einen Rand ins Gelände zurück.
Wasser (Flussbett, See, Meer) bleibt unberührt, außer im inneren Teil der Fläche (FUELLEN): Dort wird es
aufgefüllt, damit kein Ort im Wasser steht. orte_vom_wasser.py rückt die Orte vorher so, dass das kaum vorkommt. Schreibt spielhoehe.npy neu und die Höhenbilder
hoehenbild_16bit.png in den Zielordner, nach gespiegelt/ und halbiert nach leicht/.
"""
import csv
import os
import shutil
import sys

import numpy as np
from PIL import Image

import rahmen as R

RADIUS = {"town": 3.4, "castle": 2.4, "village": 2.0}     # ebene Fläche, Einheiten
RAND = 2.0                                                # Übergang ins Gelände
UEBER_WASSER = 0.15
FUELLEN = 0.75                                            # Anteil des Radius, in dem auch Wasser aufgefüllt wird

arbeit, csv_pfad, ziel = sys.argv[1:4]
roh = f"{arbeit}/spielhoehe_roh.npy"
if not os.path.exists(roh):
    shutil.copy(f"{arbeit}/spielhoehe.npy", roh)
alt = np.load(roh).astype(np.float64)
neu = alt.copy()
px = R.PIXEL / R.KARTE
land = alt >= R.WASSERHOEHE

orte = list(csv.DictReader(open(csv_pfad, encoding="utf-8"), delimiter=";"))
# Dörfer zuerst, Städte zuletzt: Wo sich Flächen überschneiden, gilt die Stadt
orte.sort(key=lambda o: {"village": 0, "castle": 1, "town": 2}.get(o["art"], 0))
hoehen = {}
for o in orte:
    x, y = float(o["x"]), float(o["y"])
    r = RADIUS.get(o["art"], 2.0)
    s0, z0 = x * px, (R.KARTE - y) * px
    w = int((r + RAND) * px) + 1
    za, ze = max(0, int(z0) - w), min(R.PIXEL, int(z0) + w + 1)
    sa, se = max(0, int(s0) - w), min(R.PIXEL, int(s0) + w + 1)
    zz, ss = np.mgrid[za:ze, sa:se]
    d = np.hypot(zz + 0.5 - z0, ss + 0.5 - s0) / px
    kern = (d <= r) & land[za:ze, sa:se]
    fenster_land = land[za:ze, sa:se] | (d <= r * FUELLEN)
    hoehe = R.WASSERHOEHE + UEBER_WASSER
    if kern.any():
        hoehe = max(hoehe, float(np.median(alt[za:ze, sa:se][kern])))
    t = np.clip((d - r) / RAND, 0, 1)
    gewicht = np.where(fenster_land, 1 - t * t * (3 - 2 * t), 0.0)
    neu[za:ze, sa:se] = neu[za:ze, sa:se] * (1 - gewicht) + hoehe * gewicht
    hoehen[o["id"]] = hoehe

np.save(f"{arbeit}/spielhoehe.npy", neu.astype(np.float32))
bild = np.round(neu / R.HOEHE_WEISS * 65535).astype(np.uint16)
halb = np.round(neu.reshape(R.PIXEL // 2, 2, R.PIXEL // 2, 2).mean(axis=(1, 3)) / R.HOEHE_WEISS * 65535).astype(np.uint16)
for ordner, feld in ((ziel, bild), (f"{ziel}/leicht", halb)):
    os.makedirs(f"{ordner}/gespiegelt", exist_ok=True)
    Image.fromarray(feld).save(f"{ordner}/hoehenbild_16bit.png")
    Image.fromarray(feld[::-1].copy()).save(f"{ordner}/gespiegelt/hoehenbild_16bit.png")
print(f"{len(hoehen)} Orte eingeebnet, größte Änderung {np.abs(neu - alt).max():.2f}, "
      f"geändert {(np.abs(neu - alt) > 0.01).mean():.2%} der Karte")
