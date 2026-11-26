"""Schritt 4: Städte, Burgen, Dörfer und Verstecke auf die Karte setzen.

Aufruf: python3 siedlungen_setzen.py <Arbeitsordner> <Zielordner>

Liest data/weltkarte/orte.csv (echte Koordinaten) und die Ids des Spiels aus tools/vanilla/ids_v1.5.7.txt.
Jeder Ort kommt auf den nächsten begehbaren Punkt bei seiner echten Lage, mit Mindestabständen (etwas
enger als auf der Calradia-Karte), damit sich die Symbole nicht überdecken. Dörfer ohne eigenen Eintrag werden rund um ihre Stadt oder
Burg verteilt, Verstecke passend zu ihrer Art (Küste, Gebirge, Wald ...) über die Karte gestreut.
Ergebnis: siedlungen.csv und vorschau.png im Zielordner.
"""
import csv
import math
import os
import re
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFont
from scipy import ndimage as ndi

import rahmen as R

arbeit, ziel = sys.argv[1], sys.argv[2]
wurzel = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..")
RAND = 22.0                                  # Abstand zum Kartenrand in Einheiten
ABSTAND = {("town", "town"): 10.0, ("town", "castle"): 7.5, ("castle", "castle"): 7.5,
           ("town", "village"): 5.0, ("castle", "village"): 5.0, ("village", "village"): 4.5}
ABSTAND_VERSTECK = 6.0
DORF_UM_SITZ = 8.0                           # Abstand automatisch verteilter Dörfer zu ihrem Sitz

spiel = np.load(f"{arbeit}/spielhoehe.npy")
steigung = np.load(f"{arbeit}/steigung.npy")
gebirge = np.load(f"{arbeit}/gebirge.npy")
meer = np.load(f"{arbeit}/meer.npy")
bedeckung = np.load(f"{arbeit}/bedeckung.npy")
wasser = spiel < R.WASSERHOEHE
je_einheit = R.PIXEL / R.KARTE               # Bildpunkte je Spieleinheit

begehbar = ~wasser & ~gebirge & (steigung < 0.8) & (ndi.distance_transform_edt(~wasser) >= 3)
rand = int(RAND * je_einheit)
begehbar[:rand] = begehbar[-rand:] = False
begehbar[:, :rand] = begehbar[:, -rand:] = False
# nur das zusammenhängende Festland und Inseln mit Platz: Anteil begehbarer Fläche im Umkreis
anteil_gross = ndi.uniform_filter(begehbar.astype(np.float32), int(7 * je_einheit))
anteil_klein = ndi.uniform_filter(begehbar.astype(np.float32), int(3 * je_einheit))
platz = {"town": begehbar & (anteil_gross >= 0.35), "castle": begehbar & (anteil_klein >= 0.45),
         "village": begehbar & (anteil_klein >= 0.4), "hideout": begehbar & (anteil_klein >= 0.5)}


# Verstecke und automatisch verteilte Dörfer nur aufs Festland, nicht auf Inseln
marken, _ = ndi.label(~meer)
gr = np.bincount(marken.ravel())
gr[0] = 0
festland = gr[marken] > 0.015 * marken.size        # Europa und Kleinasien, keine Inseln
platz["hideout"] &= festland


def art_von(ident):
    if ident.startswith("hideout"):
        return "hideout"
    return "village" if "village" in ident else ident.split("_")[0]


def sitz_von(ident):
    m = re.match(r"(castle_)?village_([A-Z]+\d+)_", ident)
    return ("castle_" if m.group(1) else "town_") + m.group(2) if m else None


ids = [z.strip().split(".", 1)[1] for z in open(f"{wurzel}/tools/vanilla/ids_v1.5.7.txt", encoding="utf-8")
       if z.startswith("Settlement.")]
ids = [i for i in ids if re.match(r"(town|castle|village|castle_village|hideout)_", i)]
orte = {z["id"]: z for z in csv.DictReader(open(f"{wurzel}/data/weltkarte/orte.csv", encoding="utf-8"), delimiter=";")}
fehlend = [i for i in ids if art_von(i) in ("town", "castle") and i not in orte]
assert not fehlend, fehlend

gesetzt = {}        # id -> (x, y) in Spieleinheiten


def naechster_platz(x, y, art, weit=140.0, zusatz=None):
    """Nächster freier, begehbarer Punkt bei (x, y) in Spieleinheiten."""
    sp, ze = R.spiel_zu_pixel(x, y)
    for radius in (12.0, 30.0, 70.0, weit):
        r = int(radius * je_einheit)
        z0, z1 = max(int(ze) - r, 0), min(int(ze) + r, R.PIXEL)
        s0, s1 = max(int(sp) - r, 0), min(int(sp) + r, R.PIXEL)
        feld = platz[art][z0:z1, s0:s1]
        if zusatz is not None:
            feld = feld & zusatz[z0:z1, s0:s1]
        zz, ss = np.nonzero(feld)
        if not len(zz):
            continue
        kx = (ss + s0 + 0.5) / je_einheit
        ky = R.KARTE - (zz + z0 + 0.5) / je_einheit
        frei = np.ones(len(zz), bool)
        for anderer, (ax, ay) in gesetzt.items():
            a2 = art_von(anderer)
            if "hideout" in (art, a2):
                d = ABSTAND_VERSTECK
            else:
                d = ABSTAND.get((art, a2)) or ABSTAND[(a2, art)]
            frei &= (kx - ax) ** 2 + (ky - ay) ** 2 >= d * d
        if frei.any():
            d2 = (kx - x) ** 2 + (ky - y) ** 2
            d2[~frei] = np.inf
            k = int(d2.argmin())
            if d2[k] <= (radius * 0.95) ** 2:
                return float(kx[k]), float(ky[k])
    raise RuntimeError(f"kein Platz bei {x:.0f}, {y:.0f}")


zeilen = {}


def setze(ident, x, y, name, breite, laenge, quelle, zusatz=None):
    px, py = naechster_platz(x, y, art_von(ident), zusatz=zusatz)
    gesetzt[ident] = (px, py)
    zeilen[ident] = dict(id=ident, name=name, art=art_von(ident), x=px, y=py, breite=breite, laenge=laenge,
                         versatz_km=math.hypot(px - x, py - y) * R.KM_JE_EINHEIT, quelle=quelle)


# Reihenfolge: erst echte Orte (Städte, Burgen, Dörfer), dann vorläufige, dann automatisch verteilte Dörfer
rang = {"town": 0, "castle": 1, "village": 2}
benannt = [i for i in ids if i in orte]
benannt.sort(key=lambda i: (orte[i]["quelle"] == "vorläufig", rang[art_von(i)], i))
for ident in benannt:
    o = orte[ident]
    x, y = R.geo_zu_spiel(float(o["breite"]), float(o["laenge"]))
    setze(ident, x, y, o["name"], o["breite"], o["laenge"], o["quelle"])

doerfer = {}
for ident in ids:
    if art_von(ident) == "village" and ident not in orte:
        doerfer.setdefault(sitz_von(ident), []).append(ident)
for sitz, liste in sorted(doerfer.items()):
    sx, sy = gesetzt[sitz]
    for k, ident in enumerate(sorted(liste)):
        winkel = 2 * math.pi * k / len(liste)        # gleichmäßig, im Norden beginnend
        setze(ident, sx + DORF_UM_SITZ * math.sin(winkel), sy + DORF_UM_SITZ * math.cos(winkel),
              "", "", "", f"automatisch bei {zeilen[sitz]['name']}", zusatz=festland)

# Verstecke: je Art passendes Gelände, möglichst weit weg von allem anderen
rng = np.random.default_rng(1700)
wald = bedeckung == 10
nah = lambda maske, einheiten: ndi.distance_transform_edt(~maske) <= einheiten * je_einheit
gelaende = {
    "seaside": nah(meer, 5.0), "mountain": nah(gebirge, 4.0), "forest": ndi.uniform_filter(wald.astype(np.float32), 15) > 0.7,
    "steppe": ndi.uniform_filter((bedeckung == 40).astype(np.float32), 25) > 0.6,
    "desert": ndi.uniform_filter(np.isin(bedeckung, (20, 30, 60)).astype(np.float32), 15) > 0.5,
}
for ident in sorted(i for i in ids if art_von(i) == "hideout"):
    sorte = re.match(r"hideout_([a-z]+)_", ident).group(1)
    zz, ss = np.nonzero(platz["hideout"] & gelaende.get(sorte, begehbar))
    wahl = rng.choice(len(zz), size=min(3000, len(zz)), replace=False)
    kx = (ss[wahl] + 0.5) / je_einheit
    ky = R.KARTE - (zz[wahl] + 0.5) / je_einheit
    alle = np.array(list(gesetzt.values()))
    kleinster = np.sqrt(((kx[:, None] - alle[None, :, 0]) ** 2 + (ky[:, None] - alle[None, :, 1]) ** 2).min(axis=1))
    # nicht mitten in der Wildnis: 12 bis 30 Einheiten vom nächsten Ort sind ideal
    k = int(np.abs(np.clip(kleinster, 0, 22.0) - 22.0).argmin())
    gesetzt[ident] = (float(kx[k]), float(ky[k]))
    zeilen[ident] = dict(id=ident, name="", art="hideout", x=gesetzt[ident][0], y=gesetzt[ident][1], breite="",
                         laenge="", versatz_km=0.0, quelle=f"automatisch ({sorte})")

# Höhe und freie Richtung für das Tor
for z in zeilen.values():
    sp, ze = R.spiel_zu_pixel(z["x"], z["y"])
    z["z"] = float(ndi.map_coordinates(spiel, [[ze - 0.5], [sp - 0.5]], order=1)[0])
    beste, bester_wert = 0.0, -1.0
    for k in range(16):
        w = 2 * math.pi * k / 16
        wert = 0.0
        for dw in (-0.4, 0.0, 0.4):
            for r in (3.0, 4.5, 6.0):
                s2, z2 = R.spiel_zu_pixel(z["x"] + r * math.cos(w + dw), z["y"] + r * math.sin(w + dw))
                wert += bool(begehbar[int(z2), int(s2)])
        if wert > bester_wert:
            beste, bester_wert = w, wert
    z["tor_richtung"] = beste

os.makedirs(ziel, exist_ok=True)
felder = ["id", "name", "art", "x", "y", "z", "tor_richtung", "breite", "laenge", "versatz_km", "quelle"]
with open(f"{ziel}/siedlungen.csv", "w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, felder, delimiter=";")
    w.writeheader()
    for ident in ids:
        z = zeilen[ident]
        w.writerow({**z, "x": f"{z['x']:.3f}", "y": f"{z['y']:.3f}", "z": f"{z['z']:.3f}",
                    "tor_richtung": f"{z['tor_richtung']:.3f}", "versatz_km": f"{z['versatz_km']:.1f}"})

inseln = sorted(z["name"] for z in zeilen.values() if z["name"] and not festland[
    int(R.spiel_zu_pixel(z["x"], z["y"])[1]), int(R.spiel_zu_pixel(z["x"], z["y"])[0])])
print("Auf Inseln:", ", ".join(inseln))
weit = sorted((z for z in zeilen.values() if z["versatz_km"] > 40 and z["name"]), key=lambda z: -z["versatz_km"])
print(f"{len(zeilen)} Orte gesetzt; mehr als 40 km von der echten Lage: {len(weit)}")
for z in weit[:40]:
    print(f"  {z['id']:22} {z['name']:18} {z['versatz_km']:.0f} km")

# Vorschau mit Ortsnamen
bild = Image.fromarray(np.load(f"{arbeit}/vorschau.npy"))
stift = ImageDraw.Draw(bild)
try:
    schrift = ImageFont.truetype("DejaVuSans-Bold.ttf", 26)
    klein = ImageFont.truetype("DejaVuSans.ttf", 17)
except OSError:
    schrift = klein = ImageFont.load_default()
for z in zeilen.values():
    sp, ze = R.spiel_zu_pixel(z["x"], z["y"])
    if z["art"] == "town":
        stift.rectangle([sp - 9, ze - 9, sp + 9, ze + 9], fill=(220, 30, 30), outline=(255, 255, 255), width=2)
        stift.text((sp + 13, ze - 15), z["name"], font=schrift, fill=(255, 255, 255), stroke_width=3, stroke_fill=(0, 0, 0))
    elif z["art"] == "castle":
        stift.polygon([(sp, ze - 9), (sp + 8, ze + 7), (sp - 8, ze + 7)], fill=(250, 200, 40), outline=(0, 0, 0))
        stift.text((sp + 10, ze - 9), z["name"], font=klein, fill=(255, 235, 150), stroke_width=2, stroke_fill=(0, 0, 0))
    elif z["art"] == "village":
        stift.ellipse([sp - 4, ze - 4, sp + 4, ze + 4], fill=(255, 255, 255), outline=(0, 0, 0))
    else:
        stift.line([sp - 4, ze - 4, sp + 4, ze + 4], fill=(0, 0, 0), width=2)
        stift.line([sp - 4, ze + 4, sp + 4, ze - 4], fill=(0, 0, 0), width=2)
bild.save(f"{ziel}/vorschau.png")
