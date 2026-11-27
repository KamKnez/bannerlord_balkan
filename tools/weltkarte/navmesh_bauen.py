"""Schritt 5: Navmesh der Weltkarte als Datei erzeugen (navmesh.bin im Szenenordner).

Aufruf: python3 navmesh_bauen.py <Arbeitsordner> <siedlungen.csv> <Vorlage navmesh.bin> <Zielordner> [siedlungen_positionen.xslt]

Mit der XSLT-Datei aus szene_vorbereiten.py werden auch die Tore der Städte und Burgen berücksichtigt: Das Spiel
betritt einen Ort am Tor, also muss das Tor auf begehbarem Boden liegen.

Die Karte wird in ein Raster aus quadratischen Flächen zerlegt. Jede Fläche bekommt die Geländeart, die das Spiel
kennt: 1 Ebene, 4 Wald, 6 Furt. Gebirge, Seen, Meer und Flüsse bekommen keine Fläche und sind damit gesperrt:
im Editor ist jedes Gitterfeld begehbar und jede Lücke gesperrt. Flüsse bekommen
in regelmäßigen Abständen Furten, Bosporus und Dardanellen je einen Übergang, und am Ende wird geprüft, dass
alle Orte in einem zusammenhängenden begehbaren Gebiet liegen (sonst wird der kürzeste Durchgang geöffnet).

Dateiformat (aus Calradias navmesh.bin gelesen, Spielstand 1.5.7):
  "RNM1", int32 Länge-8, int32 3, int32 0, int64 entpackte Länge, int64 Länge-8, 16 Byte ohne Bedeutung,
  dann ein LZ4-Block. Entpackt: "NMG9", Zahl der Ecken und je Ecke 3 float (x, y, z); Zahl der Kanten und je
  Kante 6 int32 (-1, Ecke a, Ecke b, -1, -1, 0); Zahl der Flächen und je Fläche: Eckenzahl n, n Ecken (gegen den
  Uhrzeigersinn), n Kanten (Kante k verbindet Ecke k und k+1), dann int32 2, 0, Geländeart, 0, -109 und ein
  Nullbyte; zum Schluss int32 32 und 256 Nullbytes.
"""
import csv
import heapq
import re
import struct
import sys

import numpy as np
from PIL import Image
from scipy import ndimage as ndi

import rahmen as R

arbeit, csv_pfad, vorlage, ziel = sys.argv[1:5]
N = 320                               # Flächen je Kante, eine Fläche ist 2,65 Einheiten breit
ZELLE = R.KARTE / N
FURT_ABSTAND = 20.0                   # Einheiten zwischen zwei Furten
EBENE, WALD, FURT, GEBIRGE, SEE, MEER, FLUSS = 1, 4, 6, 7, 8, 10, 11
KEINE = 0
# Meerengen: von Ufer zu Ufer (Breite, Länge)
MEERENGEN = (((41.06, 28.98), (41.02, 29.10)),      # Bosporus bei Istanbul
             ((40.17, 26.36), (40.13, 26.44)))      # Dardanellen bei Çanakkale

spiel = np.load(f"{arbeit}/spielhoehe.npy")
meer_b = np.load(f"{arbeit}/meer.npy")
gebirge_b = np.load(f"{arbeit}/gebirge.npy")
fluss_b = np.load(f"{arbeit}/fluss.npy") > 0
wald_b = np.load(f"{arbeit}/bedeckung.npy") == 10
nass_b = (spiel < R.WASSERHOEHE) & ~meer_b

# Bildpunkt-Grenzen der Zellen; Zeile 0 der Zellen ist Süden (y = 0)
grenzen = np.round(np.arange(N + 1) * R.PIXEL / N).astype(int)


def anteil(feld):
    """Anteil gesetzter Bildpunkte je Zelle, Zeile 0 = Süden."""
    f = feld[::-1].astype(np.float64)
    s = np.add.reduceat(np.add.reduceat(f, grenzen[:-1], axis=0), grenzen[:-1], axis=1)
    b = np.diff(grenzen).astype(np.float64)
    return s / np.outer(b, b)


art = np.full((N, N), EBENE, np.int32)
art[anteil(wald_b) > 0.5] = WALD
art[anteil(gebirge_b) > 0.5] = GEBIRGE
art[anteil(nass_b) > 0.3] = SEE
art[anteil(fluss_b) > 0] = FLUSS
art[anteil(meer_b) > 0.5] = MEER
begehbar_arten = (EBENE, WALD, FURT)


def zelle_von(x, y):
    return min(N - 1, max(0, int(y / ZELLE))), min(N - 1, max(0, int(x / ZELLE)))


# Orte: ihre Zelle und die Nachbarn im Umkreis von 1,5 Einheiten sind begehbar
orte = []
with open(csv_pfad, encoding="utf-8-sig", newline="") as f:
    for z in csv.DictReader(f, delimiter=";"):
        orte.append((z["id"], float(z["x"]), float(z["y"])))
if len(sys.argv) > 5:
    xslt = open(sys.argv[5], encoding="utf-8").read()
    tor_x = dict(re.findall(r"Settlement\[@id='([^']+)'\]/@gate_posX\"><xsl:attribute name=\"gate_posX\">([-0-9.]+)<", xslt))
    tor_y = dict(re.findall(r"Settlement\[@id='([^']+)'\]/@gate_posY\"><xsl:attribute name=\"gate_posY\">([-0-9.]+)<", xslt))
    tore = [(f"{ident} Tor", float(tor_x[ident]), float(tor_y[ident])) for ident in tor_x]
    print(len(tore), "Tore gelesen")
    orte += tore
for ident, x, y in orte:
    r, s = zelle_von(x, y)
    if art[r, s] not in (EBENE, WALD):
        art[r, s] = FURT if art[r, s] in (FLUSS, SEE) else EBENE
    if ident.endswith(" Tor"):
        continue
    for dy in (-1.5, 0.0, 1.5):
        for dx in (-1.5, 0.0, 1.5):
            r, s = zelle_von(x + dx, y + dy)
            if art[r, s] == GEBIRGE:
                art[r, s] = EBENE
ort_zellen = [zelle_von(x, y) for _, x, y in orte]


def linie(a, b):
    """Zellen entlang einer Strecke, über Kanten zusammenhängend."""
    (r0, s0), (r1, s1) = a, b
    weg = [(r0, s0)]
    while (r0, s0) != (r1, s1):
        if abs(r1 - r0) > abs(s1 - s0):
            r0 += 1 if r1 > r0 else -1
        else:
            s0 += 1 if s1 > s0 else -1
        weg.append((r0, s0))
    return weg


def naechstes_land(r, s):
    """Nächste begehbare Zelle zu (r, s)."""
    land = np.isin(art, begehbar_arten)
    rr, ss = np.nonzero(land)
    k = np.argmin((rr - r) ** 2 + (ss - s) ** 2)
    return int(rr[k]), int(ss[k])


for (b0, l0), (b1, l1) in MEERENGEN:
    a = naechstes_land(*zelle_von(*R.geo_zu_spiel(b0, l0)))
    b = naechstes_land(*zelle_von(*R.geo_zu_spiel(b1, l1)))
    for r, s in linie(a, b):
        if art[r, s] not in begehbar_arten:
            art[r, s] = FURT
    print("Meerenge:", a, "->", b, len(linie(a, b)), "Zellen")

# Furten in regelmäßigen Abständen: gerade Querung von Ufer zu Ufer, höchstens FURT_LAENGE Zellen lang
FURT_LAENGE = 5
land = np.isin(art, begehbar_arten)
nass = np.isin(art, (FLUSS, SEE))


def querung(r, s):
    """Kürzeste gerade Querung durch (r, s) oder None."""
    beste = None
    for dr, ds in ((1, 0), (0, 1)):
        lauf = [(r, s)]
        gut = True
        for vz in (1, -1):
            a, b = r + vz * dr, s + vz * ds
            while 0 <= a < N and 0 <= b < N and nass[a, b] and len(lauf) <= FURT_LAENGE:
                lauf.append((a, b))
                a, b = a + vz * dr, b + vz * ds
            if not (0 <= a < N and 0 <= b < N and land[a, b]):
                gut = False
        if gut and len(lauf) <= FURT_LAENGE and (beste is None or len(lauf) < len(beste)):
            beste = lauf
    return beste


ort_feld = np.ones((N, N), bool)
for r, s in ort_zellen:
    ort_feld[r, s] = False
zu_ort = ndi.distance_transform_edt(ort_feld)
kand = np.argwhere(art == FLUSS)
kand = kand[np.argsort(zu_ort[kand[:, 0], kand[:, 1]], kind="stable")]
furten = []
for r, s in kand:
    if all((r - a) ** 2 + (s - b) ** 2 >= (FURT_ABSTAND / ZELLE) ** 2 for a, b in furten):
        lauf = querung(int(r), int(s))
        if lauf:
            furten.append((r, s))
            for p in lauf:
                art[p] = FURT
print("Furten in Abständen:", len(furten))

# Zusammenhang: alle Orte müssen in einem begehbaren Gebiet liegen
KOSTEN = {FLUSS: 1.0, SEE: 1.5, GEBIRGE: 2.0, MEER: 8.0}
geoeffnet = 0
while True:
    marken, _ = ndi.label(np.isin(art, begehbar_arten))
    gebiete = np.array([marken[r, s] for r, s in ort_zellen])
    assert gebiete.min() > 0
    zahl = np.bincount(gebiete)
    haupt = int(np.argmax(zahl))
    rest = sorted(set(gebiete.tolist()) - {haupt}, key=lambda g: zahl[g])
    if not rest:
        break
    g = rest[0]
    # kürzester Weg von Gebiet g durch gesperrte Zellen zu irgendeinem anderen begehbaren Gebiet
    kosten = np.full((N, N), np.inf)
    vor = {}
    halde = []
    for r, s in np.argwhere(marken == g):
        kosten[r, s] = 0.0
        halde.append((0.0, int(r), int(s)))
    heapq.heapify(halde)
    ende = None
    while halde:
        k, r, s = heapq.heappop(halde)
        if k > kosten[r, s]:
            continue
        if marken[r, s] not in (0, g):
            ende = (r, s)
            break
        for dr, ds in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            a, b = r + dr, s + ds
            if 0 <= a < N and 0 <= b < N:
                neu = k + (0.0 if marken[a, b] else KOSTEN[int(art[a, b])])
                if neu < kosten[a, b]:
                    kosten[a, b] = neu
                    vor[(a, b)] = (r, s)
                    heapq.heappush(halde, (neu, a, b))
    assert ende is not None
    p = ende
    while p in vor:
        p = vor[p]
        if art[p] in (FLUSS, SEE, MEER):
            art[p] = FURT
            geoeffnet += 1
        elif art[p] == GEBIRGE:
            art[p] = EBENE
            geoeffnet += 1
print("Zusätzlich geöffnete Zellen für den Zusammenhang:", geoeffnet)

# Es bleiben nur begehbare Flächen des Hauptgebiets: Im Editor ist dann jedes Gitterfeld begehbar und jede Lücke
# gesperrt. Begehbare Gebiete ohne Ort (Inseln, abgeschlossene Täler) fallen weg.
marken, _ = ndi.label(np.isin(art, begehbar_arten))
haupt = marken[ort_zellen[0]]
art_voll = art.copy()
art[marken != haupt] = KEINE

# Ecken, Kanten, Flächen
ecke_nr = {}
ecken = []
kante_nr = {}
kanten = []
flaechen = []


def ecke(r, s):
    if (r, s) not in ecke_nr:
        x, y = s * ZELLE, r * ZELLE
        sp, ze = R.spiel_zu_pixel(x, y)
        ze, sp, w = int(ze), int(sp), int(R.PIXEL / N * 0.6)
        # höchster Geländepunkt im Umkreis, damit das Gitter im Editor nicht im Hügel verschwindet
        h = max(R.WASSERHOEHE, spiel[max(0, ze - w):ze + w + 1, max(0, sp - w):sp + w + 1].max()) + 0.05
        ecke_nr[(r, s)] = len(ecken)
        ecken.append((x, y, float(h)))
    return ecke_nr[(r, s)]


def kante(a, b):
    k = (min(a, b), max(a, b))
    if k not in kante_nr:
        kante_nr[k] = len(kanten)
        kanten.append((a, b))
    return kante_nr[k]


for r, s in np.argwhere(art != KEINE):
    v = [ecke(r, s), ecke(r, s + 1), ecke(r + 1, s + 1), ecke(r + 1, s)]      # gegen den Uhrzeigersinn
    e = [kante(v[k], v[(k + 1) % 4]) for k in range(4)]
    flaechen.append((v, e, int(art[r, s])))

roh = bytearray(b"NMG9")
roh += struct.pack("<i", len(ecken))
for p in ecken:
    roh += struct.pack("<3f", *p)
roh += struct.pack("<i", len(kanten))
for a, b in kanten:
    roh += struct.pack("<6i", -1, a, b, -1, -1, 0)
roh += struct.pack("<i", len(flaechen))
for v, e, t in flaechen:
    roh += struct.pack("<i4i4i5iB", 4, *v, *e, 2, 0, t, 0, -109, 0)
roh += struct.pack("<i", 32) + bytes(256)

# LZ4-Block nur aus Literalen (gültig, aber unverdichtet; der Editor verdichtet beim nächsten Speichern selbst)
n = len(roh)
block = bytearray([0xF0])
rest = n - 15
while rest >= 255:
    block.append(255)
    rest -= 255
block.append(rest)
block += roh
kopf_alt = open(vorlage, "rb").read(0x30)
assert kopf_alt[:4] == b"RNM1"
laenge = 0x30 + len(block) - 8
kopf = b"RNM1" + struct.pack("<iiiqq", laenge, 3, 0, n, laenge) + kopf_alt[0x20:0x30]
with open(f"{ziel}/navmesh.bin", "wb") as f:
    f.write(kopf + block)

zaehler = np.bincount(art.ravel(), minlength=12)
print(f"{len(ecken)} Ecken, {len(kanten)} Kanten, {len(flaechen)} Flächen:",
      {name: int(zaehler[nr]) for name, nr in (("Ebene", EBENE), ("Wald", WALD), ("Furt", FURT), ("Gebirge", GEBIRGE),
                                               ("See", SEE), ("Meer", MEER), ("Fluss", FLUSS))})

# Vorschau
FARBEN = {KEINE: (20, 40, 90), EBENE: (170, 200, 120), WALD: (60, 130, 70), FURT: (255, 60, 60),
          GEBIRGE: (120, 110, 105), SEE: (90, 160, 230), MEER: (40, 80, 160), FLUSS: (90, 160, 230)}
bild = np.zeros((N, N, 3), np.uint8)
for nr, farbe in FARBEN.items():
    bild[art_voll == nr] = farbe
bild[(art == KEINE) & np.isin(art_voll, begehbar_arten)] = (70, 70, 70)      # weggefallene Gebiete ohne Ort
bild = np.kron(bild[::-1], np.ones((4, 4, 1), np.uint8))
for r, s in ort_zellen:
    zr, zs = (N - 1 - r) * 4 + 1, s * 4 + 1
    bild[zr:zr + 2, zs:zs + 2] = (0, 0, 0)
Image.fromarray(bild).save(f"{ziel}/navmesh_vorschau.png")
