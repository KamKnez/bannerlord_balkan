"""Schritt 3: Höhenbild und Masken für den Editor schreiben.

Aufruf: python3 karte_bauen.py <Arbeitsordner> <Zielordner>

Das Gelände ist bewusst nicht maßstäblich: Im Spiel gibt es eine einzige Wasserhöhe für Meer, Seen und Flüsse.
Deshalb zählt für jeden Punkt die Höhe über dem nächsten Tal (Höhe minus Talgrund), nicht die Höhe über dem
Meer. Täler und Ebenen liegen so knapp über dem Wasser, Gebirge behalten ihr Relief, und alle Flüsse lassen sich
bis unter die Wasserhöhe graben. Die Höhen sind überhöht (Hochgebirge rund fünffach, Hügelland weniger), damit das Hügelland begehbar bleibt.
"""
import sys

import numpy as np
from PIL import Image
from scipy import ndimage as ndi

import rahmen as R

arbeit, ziel = sys.argv[1], sys.argv[2]
hoehe = np.load(f"{arbeit}/hoehe.npy").astype(np.float64)
bedeckung = np.load(f"{arbeit}/bedeckung.npy")
einzug = np.load(f"{arbeit}/einzug.npy")
fluss_halb = np.load(f"{arbeit}/fluss.npy").astype(np.float64)
fuellung = np.load(f"{arbeit}/fuellung.npy")
meer = np.load(f"{arbeit}/meer.npy")
marken, _ = ndi.label((bedeckung == 80) | (bedeckung == 0))        # auch das Tyrrhenische Meer zählt als Meer
gr = np.bincount(marken.ravel())
gr[0] = 0
meer |= gr[marken] > 0.005 * marken.size

W = R.WASSERHOEHE
LAND_UEBER_WASSER = 0.35     # so hoch liegt flaches Land über der Wasserfläche
GIPFEL = 13.0                # Spielhöhe für BEZUG_M Meter über dem Tal
BEZUG_M = 2800.0
KRUEMMUNG = 1.15            # über 1: Hügelland bleibt flach und begehbar, Hochgebirge ragt heraus
WASSERTIEFE = 0.6            # Flüsse und Seen
UFER = 4.0                   # Breite der Böschung in Bildpunkten

# Binnengewässer aus der Landbedeckung, ohne Teiche
wasser = (bedeckung == 80) | (bedeckung == 0)
binnen = wasser & ~meer
np.save(f"{arbeit}/meer.npy", meer)
marken, _ = ndi.label(binnen)
gr = np.bincount(marken.ravel())
binnen &= gr[marken] >= 60
see = ndi.binary_opening(binnen, iterations=3)          # breite Flächen: Seen und Lagunen
see = ndi.binary_dilation(see, iterations=3) & binnen

# Talgrund: bekannte Höhen an Meer, Seen, Flüssen und Bächen, dazwischen geglättet interpoliert
tal_hoehe = ndi.minimum_filter(hoehe, 5)
bach = (einzug >= 150.0) & (fuellung < 20.0)
fest = meer | binnen | (fluss_halb > 0) | bach
wert = np.where(meer, 0.0, np.where(fest, tal_hoehe, 0.0))
zaehler = np.zeros_like(hoehe)
nenner = np.zeros_like(hoehe)
maske = fest.astype(np.float64)
for sigma, gewicht in ((3, 3000.0), (8, 300.0), (20, 30.0), (50, 3.0), (130, 0.3), (350, 0.03)):
    zaehler += gewicht * ndi.gaussian_filter(wert * maske, sigma, mode="nearest", truncate=3)
    nenner += gewicht * ndi.gaussian_filter(maske, sigma, mode="nearest", truncate=3)
talgrund = zaehler / np.maximum(nenner, 1e-9)
talgrund = np.minimum(talgrund, hoehe)

ueber_tal = np.clip(hoehe - talgrund, 0, None)
ueber_tal = ndi.gaussian_filter(ueber_tal, 1.3)
land = W + LAND_UEBER_WASSER + GIPFEL * (ueber_tal / BEZUG_M) ** KRUEMMUNG

# Flüsse und Seen graben: im Bett WASSERTIEFE unter Wasser, über die Böschung zurück aufs Gelände
bett = (fluss_halb > 0) | binnen
abstand, (iz, isp) = ndi.distance_transform_edt(~bett, return_indices=True)
halb = np.where(binnen, 0.0, fluss_halb)[iz, isp]
t = np.clip((abstand - halb) / UFER, 0, 1)
t = t * t * (3 - 2 * t)
spiel = (W - WASSERTIEFE) * (1 - t) + land * t

# Meer: vom Ufer weg bis auf 0 abfallend
kueste = ndi.distance_transform_edt(meer)
spiel = np.where(meer, np.clip(W - 0.25 * kueste, 0, None), spiel)
spiel = ndi.gaussian_filter(spiel, 0.6)
spiel = np.where(meer, np.minimum(spiel, W - 0.15), spiel)
unter_wasser = spiel < W
np.save(f"{arbeit}/spielhoehe.npy", spiel.astype(np.float32))
print(f"Höhen im Spiel: {spiel.min():.2f} bis {spiel.max():.2f}, unter Wasser {unter_wasser.mean():.1%}")
assert spiel.max() < R.HOEHE_WEISS

bild16 = np.round(spiel / R.HOEHE_WEISS * 65535).astype(np.uint16)


def speichere(name, feld, spiegeln_auch=True):
    Image.fromarray(feld).save(f"{ziel}/{name}.png")
    if spiegeln_auch:
        Image.fromarray(feld[::-1].copy()).save(f"{ziel}/gespiegelt/{name}.png")


import os
os.makedirs(f"{ziel}/gespiegelt", exist_ok=True)
speichere("hoehenbild_16bit", bild16)

# Masken (8 Bit, weiß = Ebene voll deckend)
zelle = R.KARTE / R.PIXEL
gy, gx = np.gradient(spiel, zelle)
steigung = np.hypot(gx, gy)
wald = ndi.gaussian_filter((bedeckung == 10).astype(np.float64), 1.2)
fels = np.clip((steigung - 0.9) / 0.6, 0, 1)
fels = np.maximum(fels, np.clip((hoehe - 1900.0) / 400.0, 0, 1))      # über der Baumgrenze
fels = np.maximum(fels, ndi.gaussian_filter(np.isin(bedeckung, (60, 70)).astype(np.float64), 1.0))
fels = ndi.gaussian_filter(fels, 0.8)
acker = ndi.gaussian_filter((bedeckung == 40).astype(np.float64), 1.5)
nass = ndi.gaussian_filter(ndi.binary_dilation(unter_wasser, iterations=1).astype(np.float64), 0.7)
wald = wald * (1 - fels) * (1 - nass)
acker = acker * (1 - fels) * (1 - nass) * (1 - wald)
fels = fels * (1 - nass)
wiese = np.clip(1 - wald - fels - acker - nass, 0, 1)
for name, feld in (("maske_wald", wald), ("maske_fels", fels), ("maske_acker", acker),
                   ("maske_wiese", wiese), ("maske_wasser", nass)):
    speichere(name, np.round(np.clip(feld, 0, 1) * 255).astype(np.uint8))

speichere("maske_leer", np.zeros(spiel.shape, np.uint8), spiegeln_auch=False)
speichere("maske_voll", np.full(spiel.shape, 255, np.uint8), spiegeln_auch=False)

# Hilfskarte für das Navmesh: Farben nach Geländeart
farbe = np.zeros(spiel.shape + (3,), np.uint8)
farbe[...] = (150, 190, 110)                       # Ebene
farbe[acker > 0.5] = (205, 200, 130)               # Ackerland (zählt als Ebene)
farbe[wald > 0.5] = (40, 110, 50)                  # Wald
steil = ndi.binary_opening(ndi.gaussian_filter(steigung, 2.0) > 1.0, iterations=1)
farbe[steil | (fels > 0.6)] = (120, 110, 105)       # Gebirge, unpassierbar
farbe[unter_wasser & ~meer] = (90, 160, 230)       # Fluss und See
farbe[meer] = (30, 70, 150)                        # Meer
speichere("hilfskarte_gelaende", farbe)
np.save(f"{arbeit}/steigung.npy", steigung.astype(np.float32))
np.save(f"{arbeit}/gebirge.npy", steil | (fels > 0.6))
lm = ~unter_wasser
print("Steigung (Median, 90 %, 99 %):", np.percentile(steigung[lm], [50, 90, 99]).round(2),
      "Gebirge:", f"{(steil | (fels > 0.6))[lm].mean():.1%}", "Wald:", f"{(wald > 0.5)[lm].mean():.1%}")

# Schummerung für die Vorschau
licht = np.clip(0.75 + 0.9 * (-gx * 0.7 + gy * 0.7), 0.25, 1.4)
vorschau = np.clip(farbe * licht[..., None], 0, 255).astype(np.uint8)
np.save(f"{arbeit}/vorschau.npy", vorschau)
Image.fromarray(vorschau).resize((2048, 2048), Image.LANCZOS).save(f"{arbeit}/vorschau_roh.png")
