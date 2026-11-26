"""Schritt 1: Höhendaten und Landbedeckung auf das Kartenraster umrechnen.

Aufruf: python3 quellen_lesen.py <Arbeitsordner>
Höhen (Copernicus GLO-90) und Landbedeckung (ESA WorldCover 2021) werden in verkleinerter Auflösung direkt aus
dem Netz gelesen. Ergebnis: hoehe.npy (Meter) und bedeckung.npy
(WorldCover-Klassen, 0 = keine Daten = offenes Meer).
"""
import os
import sys
from concurrent.futures import ThreadPoolExecutor

import numpy as np
import rasterio
from rasterio.crs import CRS
from rasterio.transform import from_origin
from rasterio.warp import Resampling, reproject

import rahmen as R

ordner = sys.argv[1]
ziel_crs = CRS.from_proj4(R.PROJ)
halb = R.KANTE_KM * 500.0
ziel_tr = from_origin(-halb, halb, R.M_JE_PIXEL, R.M_JE_PIXEL)
form = (R.PIXEL, R.PIXEL)

# Gradfelder, die der Ausschnitt berührt (mit einem Grad Rand)
ecken = [R.meter_zu_geo(x, y) for x in (-halb, 0, halb) for y in (-halb, 0, halb)]
lat0, lat1 = int(np.floor(min(e[0] for e in ecken))) - 1, int(np.ceil(max(e[0] for e in ecken))) + 1
lon0, lon1 = int(np.floor(min(e[1] for e in ecken))) - 1, int(np.ceil(max(e[1] for e in ecken))) + 1
grad_m = R.M_JE_PIXEL / 111200.0        # Bildpunktgröße in Grad


def lies_kachel(lat, lon):
    """Eine Copernicus-Kachel verkleinert aus dem Netz lesen (None, wenn es sie nicht gibt: offenes Meer)."""
    name = f"Copernicus_DSM_COG_30_N{lat:02d}_00_E{lon:03d}_00_DEM"
    try:
        q = rasterio.open(f"/vsicurl/https://copernicus-dem-90m.s3.amazonaws.com/{name}/{name}.tif")
    except Exception:
        return None
    with q:
        n = int(min(1200, max(200, 1.6 / grad_m)))      # etwas feiner als das Kartenraster
        klein = q.read(1, out_shape=(n, n), resampling=Resampling.average).astype(np.float32)
        return klein, q.transform * q.transform.scale(q.width / n, q.height / n), q.crs


if not os.path.exists(f"{ordner}/hoehe.npy"):
    summe = np.zeros(form, np.float32)
    felder = [(la, lo) for la in range(lat0, lat1 + 1) for lo in range(lon0, lon1 + 1)]
    with ThreadPoolExecutor(16) as pool:
        for ergebnis in pool.map(lambda f: lies_kachel(*f), felder):
            if ergebnis is None:
                continue
            klein, tr, crs = ergebnis
            teil = np.full(form, np.nan, np.float32)
            reproject(klein, teil, src_transform=tr, src_crs=crs, dst_transform=ziel_tr, dst_crs=ziel_crs,
                      dst_nodata=np.nan, resampling=Resampling.bilinear)
            gut = np.isfinite(teil)
            summe[gut] = teil[gut]
    np.save(f"{ordner}/hoehe.npy", summe)
    print("hoehe", summe.min(), summe.max())

if not os.path.exists(f"{ordner}/bedeckung.npy"):
    bild = np.zeros(form, np.uint8)
    wald = np.zeros(form, np.float32)
    for lat in range(lat0 // 3 * 3, lat1 + 1, 3):
        for lon in range(lon0 // 3 * 3, lon1 + 1, 3):
            url = ("/vsicurl/https://esa-worldcover.s3.eu-central-1.amazonaws.com/v200/2021/map/"
                   f"ESA_WorldCover_10m_2021_v200_N{lat:02d}E{lon:03d}_Map.tif")
            try:
                q = rasterio.open(url)
            except Exception:
                continue
            with q:
                n = int(min(3000, max(600, 5.0 / grad_m)))
                klein = q.read(1, out_shape=(n, n), resampling=Resampling.nearest)
                tr = q.transform * q.transform.scale(q.width / n, q.height / n)
                teil = np.zeros(form, np.uint8)
                reproject(klein, teil, src_transform=tr, src_crs=q.crs, dst_transform=ziel_tr,
                          dst_crs=ziel_crs, resampling=Resampling.nearest)
                bild[teil > 0] = teil[teil > 0]
                print("bedeckung", lat, lon, flush=True)
    np.save(f"{ordner}/bedeckung.npy", bild)
