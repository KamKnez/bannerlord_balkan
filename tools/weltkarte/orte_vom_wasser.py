"""Rückt Städte, Burgen und Dörfer vom Wasser weg, deren ebene Fläche sonst im Fluss, See oder Meer läge.

Aufruf: python3 orte_vom_wasser.py <Arbeitsordner> <siedlungen.csv>

orte_einebnen.py lässt Wasser unberührt. Steht ein Ort so nah am Ufer, dass seine ebene Fläche ins Wasser reicht,
ragen Mauern und Häuser in den Fluss. Das Skript sucht für jeden solchen Ort den nächsten Punkt, an dem die ganze
ebene Fläche trocken liegt (begehbar, kein Gebirge, Mindestabstände zu den anderen Orten wie in
siedlungen_setzen.py), und schreibt x, y und die Torrichtung in siedlungen.csv neu. Die Höhe z setzt danach
orte_aufsetzen.py. Ein zweiter Lauf ändert nichts mehr.
"""
import csv
import math
import sys

import numpy as np
from scipy import ndimage as ndi

import rahmen as R
RADIUS = {"town": 3.4, "castle": 2.4, "village": 2.0}     # wie orte_einebnen.py

ZUGABE = 0.3                 # Abstand der ebenen Fläche zum Ufer, Einheiten
WEIT = 5.0                   # so weit darf ein Ort höchstens rücken (12 km): Küstenstädte bleiben an der Küste
ABSTAND = {("town", "town"): 12.0, ("town", "castle"): 10.0, ("castle", "castle"): 10.0,
           ("town", "village"): 6.0, ("castle", "village"): 6.0, ("village", "village"): 6.0}


def hauptprogramm(arbeit, csv_pfad):
    roh = np.load(f"{arbeit}/spielhoehe_roh.npy")
    steigung = np.load(f"{arbeit}/steigung.npy")
    gebirge = np.load(f"{arbeit}/gebirge.npy")
    je = R.PIXEL / R.KARTE
    wasser = roh < R.WASSERHOEHE
    ufer = ndi.distance_transform_edt(~wasser) / je          # Abstand zum Wasser in Einheiten
    begehbar = ~wasser & ~gebirge & (steigung < 0.8)
    marken, _ = ndi.label(begehbar)

    zeilen = list(csv.DictReader(open(csv_pfad, encoding="utf-8"), delimiter=";"))
    felder = list(zeilen[0].keys())
    lage = {z["id"]: (float(z["x"]), float(z["y"])) for z in zeilen}
    art = {z["id"]: z["art"] for z in zeilen}
    gerueckt = []
    for z in sorted(zeilen, key=lambda z: {"town": 0, "castle": 1, "village": 2}.get(z["art"], 3)):
        if z["art"] not in RADIUS:
            continue
        x, y = lage[z["id"]]
        sp, ze = R.spiel_zu_pixel(x, y)
        frei = RADIUS[z["art"]] + ZUGABE
        if ufer[int(ze), int(sp)] >= frei:
            continue
        r = int(WEIT * je)
        z0, z1 = max(int(ze) - r, 0), min(int(ze) + r, R.PIXEL)
        s0, s1 = max(int(sp) - r, 0), min(int(sp) + r, R.PIXEL)
        gefunden = None
        # erst begehbares Land, dann auch Hang und Gebirge (die Fläche wird ohnehin eingeebnet), notfalls etwas
        # Wasser am Rand der Fläche dulden
        for boden, nachlass in ((begehbar, 0.0), (~wasser, 0.0), (begehbar, 0.7), (~wasser, 0.7), (~wasser, 1.4)):
            feld = boden[z0:z1, s0:s1] & (ufer[z0:z1, s0:s1] >= frei - nachlass)
            eigene = marken[int(ze), int(sp)]
            if eigene:                                       # auf derselben Seite des Flusses bleiben
                feld &= marken[z0:z1, s0:s1] == eigene
            zz, ss = np.nonzero(feld)
            if not len(zz):
                continue
            kx = (ss + s0 + 0.5) / je
            ky = R.KARTE - (zz + z0 + 0.5) / je
            ok = np.ones(len(zz), bool)
            for anderer, (ax, ay) in lage.items():
                if anderer == z["id"] or abs(ax - x) > WEIT + 13 or abs(ay - y) > WEIT + 13:
                    continue
                paar = (z["art"], art[anderer])
                d = 8.0 if "hideout" in paar else ABSTAND.get(paar) or ABSTAND[paar[::-1]]
                d = min(d, math.hypot(ax - x, ay - y))       # nie näher als bisher, enger Bestand bleibt erlaubt
                ok &= (kx - ax) ** 2 + (ky - ay) ** 2 >= d * d - 1e-6
            d2 = (kx - x) ** 2 + (ky - y) ** 2
            d2[~ok] = np.inf
            k = int(d2.argmin())
            if d2[k] <= WEIT ** 2:
                gefunden = float(kx[k]), float(ky[k]), nachlass
                break
        if not gefunden:
            print(f"  kein trockener Platz für {z['id']} {z['name']}")
            continue
        nx, ny, nachlass = gefunden
        gerueckt.append((math.hypot(nx - x, ny - y), z["id"], z["name"], nachlass))
        lage[z["id"]] = (nx, ny)
        z["x"], z["y"] = f"{nx:.3f}", f"{ny:.3f}"
        if z["breite"]:
            # Abstand zur echten Lage neu
            ex, ey = R.geo_zu_spiel(float(z["breite"]), float(z["laenge"]))
            if z["art"] != "village":
                z["versatz_km"] = f"{math.hypot(nx - ex, ny - ey) * R.KM_JE_EINHEIT:.1f}"
        # Tor zum offenen, begehbaren Land hin
        weg = begehbar & (ufer >= 0.4)
        beste, bester_wert = 0.0, -1.0
        for k in range(16):
            w = 2 * math.pi * k / 16
            wert = 0.0
            for dw in (-0.4, 0.0, 0.4):
                for rr in (3.0, 4.5, 6.0):
                    s2, z2 = R.spiel_zu_pixel(nx + rr * math.cos(w + dw), ny + rr * math.sin(w + dw))
                    wert += bool(weg[int(z2), int(s2)])
            if wert > bester_wert:
                beste, bester_wert = w, wert
        z["tor_richtung"] = f"{beste:.3f}"

    with open(csv_pfad, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, felder, delimiter=";")
        w.writeheader()
        w.writerows(zeilen)
    gerueckt.sort(reverse=True)
    print(f"{len(gerueckt)} Orte gerückt, im Mittel {sum(g[0] for g in gerueckt) / max(1, len(gerueckt)):.1f} Einheiten, "
          f"mit Wasser am Rand: {sum(1 for g in gerueckt if g[3])}")
    for d, ident, name, nachlass in gerueckt[:12]:
        print(f"  {ident:22} {name:18} {d:.1f} Einheiten" + (f" (Rand {nachlass})" if nachlass else ""))


if __name__ == "__main__":
    hauptprogramm(*sys.argv[1:3])
