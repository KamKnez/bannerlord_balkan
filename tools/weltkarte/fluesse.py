"""Schritt 2: Flüsse aus dem Höhenmodell ableiten.

Aufruf: python3 fluesse.py <Arbeitsordner>
Die Flussläufe folgen den Tälern des Höhenmodells (Fließrichtung und Einzugsgebiet, gerechnet mit pysheds auf
halber Auflösung). Gegraben wird ein Fluss nur, wenn er groß genug ist und in Natural Earth als Fluss
verzeichnet ist, oder wenn er unterhalb eines Startpunkts aus STARTPUNKTE liegt. So entstehen im Karst keine
erfundenen Flüsse. Ergebnis: einzug.npy (Einzugsgebiet in km² je Bildpunkt, volle Auflösung, 0 = kein Bach),
fluss.npy (halbe Flussbreite in Bildpunkten, 0 = kein Fluss) und fuellung.npy.
"""
import sys

import numpy as np
import shapefile
from affine import Affine
from PIL import Image, ImageDraw
from pysheds.grid import Grid
from pysheds.sview import Raster, ViewFinder
from scipy import ndimage as ndi

import rahmen as R

ordner = sys.argv[1]
if not hasattr(np, "in1d"):      # pysheds ruft noch np.in1d auf, das neuere numpy-Versionen nicht mehr haben
    np.in1d = np.isin
FLUSS_AB_KM2 = 4000.0       # ab diesem Einzugsgebiet wird ein verzeichneter Fluss gegraben
NAH_AN_NE_KM = 12.0         # so nah muss der Lauf an einer Natural-Earth-Linie liegen
# Flüsse, die Natural Earth fehlen oder deren Oberlauf zu klein wäre: (Name, Breite, Länge) eines Punkts am
# Oberlauf; ab dort wird talwärts bis zum Meer oder zum nächsten Fluss gegraben.
STARTPUNKTE = [
    ("Cetina", 43.93, 16.43), ("Krka", 44.04, 16.20), ("Bosna", 43.82, 18.27), ("Una", 44.50, 16.13),
    ("Vrbas", 43.98, 17.45), ("Neretva", 43.42, 18.10), ("Kupa", 45.49, 14.85), ("Morača", 42.60, 19.33),
    ("Ibar", 42.90, 20.87), ("Zapadna Morava", 43.85, 20.03), ("Vardar", 41.99, 21.43),
]

hoehe = np.load(f"{ordner}/hoehe.npy")
bedeckung = np.load(f"{ordner}/bedeckung.npy")
wasser = (bedeckung == 80) | (bedeckung == 0)
marken, _ = ndi.label(wasser)
groessen = np.bincount(marken.ravel())
groessen[0] = 0
meer = marken == groessen.argmax()

# halbe Auflösung für die Fließrechnung
n = R.PIXEL // 2
h2 = hoehe.reshape(n, 2, n, 2).mean(axis=(1, 3)).astype(np.float64)
meer2 = meer.reshape(n, 2, n, 2).mean(axis=(1, 3)) > 0.5
zelle = R.M_JE_PIXEL * 2
# Natural-Earth-Flüsse als Nähe-Maske
bild = Image.new("L", (n, n), 0)
stift = ImageDraw.Draw(bild)
rang_bild = Image.new("L", (n, n), 0)
rang_stift = ImageDraw.Draw(rang_bild)
ne = f"{ordner}/ne/"
for name in ("ne_10m_rivers_lake_centerlines", "ne_10m_rivers_europe"):
    for eintrag in shapefile.Reader(f"{ne}{name}/{name}.shp").iterShapeRecords():
        form = eintrag.shape
        daten = eintrag.record.as_dict()
        rang = int(daten.get("scalerank") or 12)
        if rang >= 10 or not daten.get("name"):       # nur größere, benannte Flüsse
            continue
        b = form.bbox
        if b[2] < 9 or b[0] > 26 or b[3] < 38 or b[1] > 51:
            continue
        teile = list(form.parts) + [len(form.points)]
        for a, e in zip(teile[:-1], teile[1:]):
            punkte = []
            for lon, lat in form.points[a:e]:
                x, y = R.geo_zu_spiel(lat, lon)
                sp, ze = R.spiel_zu_pixel(x, y)
                punkte.append((sp / 2, ze / 2))
            if len(punkte) > 1:
                stift.line(punkte, fill=255, width=1)
                rang_stift.line(punkte, fill=20 - min(rang, 12), width=1)
ne_linie = np.asarray(bild) > 0
nah = ndi.distance_transform_edt(~ne_linie) * zelle / 1000.0 <= NAH_AN_NE_KM

h2[meer2] = -50.0
sicht = ViewFinder(affine=Affine(zelle, 0, 0, 0, -zelle, 0), shape=h2.shape, nodata=-9999.0)
grid = Grid.from_raster(Raster(h2, sicht))
dem = Raster(h2, sicht)
gefuellt = grid.fill_depressions(grid.fill_pits(dem))
eben = grid.resolve_flats(gefuellt)
richtung = grid.flowdir(eben)
einzug2 = np.asarray(grid.accumulation(richtung)) * (zelle / 1000.0) ** 2
einzug2[meer2] = 0
richtung = np.asarray(richtung)
fuellung2 = np.asarray(gefuellt) - h2

# In den Ebenen ist das Gefälle zu klein, um den Lauf aus den Höhen zu finden: dort gilt die Natural-Earth-Linie.
fenster = max(3, int(round(10000.0 / zelle)) | 1)
relief = ndi.maximum_filter(h2, fenster) - ndi.minimum_filter(np.where(meer2, 0, h2), fenster)   # Höhenspanne in rund 10 km
fluss2 = (einzug2 >= FLUSS_AB_KM2) & nah & (relief >= 90.0)
# kurze Bruchstücke entfernen
marken, _ = ndi.label(fluss2, structure=np.ones((3, 3)))
gr = np.bincount(marken.ravel())
fluss2 &= gr[marken] >= 25

# talwärts von den Startpunkten
schritt = {64: (-1, 0), 128: (-1, 1), 1: (0, 1), 2: (1, 1), 4: (1, 0), 8: (1, -1), 16: (0, -1), 32: (-1, -1)}
for name, lat, lon in STARTPUNKTE:
    x, y = R.geo_zu_spiel(lat, lon)
    sp, ze = R.spiel_zu_pixel(x, y)
    z, s = int(ze / 2), int(sp / 2)
    # auf den stärksten Bach in der Nähe setzen
    f = einzug2[z - 6:z + 7, s - 6:s + 7]
    dz, ds = np.unravel_index(f.argmax(), f.shape)
    z, s = z - 6 + dz, s - 6 + ds
    laenge = 0
    while 0 < z < n - 1 and 0 < s < n - 1 and not meer2[z, s] and richtung[z, s] in schritt:
        if (fluss2[z, s] and laenge > 3) or relief[z, s] < 60.0:    # bis zum nächsten Fluss oder zur Ebene
            break
        fluss2[z, s] = True
        dz, ds = schritt[int(richtung[z, s])]
        z, s = z + dz, s + ds
        laenge += 1
    print(f"{name}: {laenge * zelle / 1000:.0f} km")

# zurück auf volle Auflösung
gross = lambda a: np.repeat(np.repeat(a, 2, axis=0), 2, axis=1)
einzug = gross(np.where(einzug2 >= FLUSS_AB_KM2 / 8, einzug2, 0)).astype(np.float32)
halb = np.where(fluss2, 1.5 + 1.1 * np.log10(np.maximum(einzug2, FLUSS_AB_KM2) / FLUSS_AB_KM2), 0)
rang2 = np.asarray(rang_bild).astype(np.float64)                     # 20 - Rang, 0 = keine Linie
ne_breite = np.where(rang2 > 0, 1.5 + 0.3 * np.clip(rang2 - 10, 0, 8), 0)  # Rang 9: 1,8 ... Rang 2: 3,9
halb = np.maximum(halb, np.where((relief < 170.0) & ~meer2, ne_breite, 0))
np.save(f"{ordner}/einzug.npy", einzug)
np.save(f"{ordner}/fluss.npy", gross(halb).astype(np.float32))
np.save(f"{ordner}/fuellung.npy", gross(fuellung2).astype(np.float32))
np.save(f"{ordner}/meer.npy", meer)
print("Flusspunkte:", int(fluss2.sum()))
