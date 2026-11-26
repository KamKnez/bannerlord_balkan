"""Schritt 1: Höhendaten und Landbedeckung auf das Kartenraster umrechnen.

Aufruf: python3 quellen_lesen.py <Arbeitsordner>
Im Arbeitsordner liegen unter dem/ die Copernicus-Kacheln (GLO-90). Die Landbedeckung (ESA WorldCover 2021)
wird in verkleinerter Auflösung direkt aus dem Netz gelesen. Ergebnis: hoehe.npy (Meter) und bedeckung.npy
(WorldCover-Klassen, 0 = keine Daten = offenes Meer).
"""
import glob
import os
import sys

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

if not os.path.exists(f"{ordner}/hoehe.npy"):
    summe = np.zeros(form, np.float32)
    for i, pfad in enumerate(sorted(glob.glob(f"{ordner}/dem/*.tif"))):
        with rasterio.open(pfad) as q:
            teil = np.full(form, np.nan, np.float32)
            reproject(rasterio.band(q, 1), teil, dst_transform=ziel_tr, dst_crs=ziel_crs,
                      dst_nodata=np.nan, resampling=Resampling.average)
            gut = np.isfinite(teil)
            summe[gut] = teil[gut]
    np.save(f"{ordner}/hoehe.npy", summe)
    print("hoehe", summe.min(), summe.max())

if not os.path.exists(f"{ordner}/bedeckung.npy"):
    bild = np.zeros(form, np.uint8)
    wald = np.zeros(form, np.float32)
    for lat in range(36, 51, 3):
        for lon in range(6, 27, 3):
            url = ("/vsicurl/https://esa-worldcover.s3.eu-central-1.amazonaws.com/v200/2021/map/"
                   f"ESA_WorldCover_10m_2021_v200_N{lat:02d}E{lon:03d}_Map.tif")
            try:
                q = rasterio.open(url)
            except Exception:
                continue
            with q:
                n = 2250   # 3 Grad / 2250 = rund 150 m
                klein = q.read(1, out_shape=(n, n), resampling=Resampling.nearest)
                tr = q.transform * q.transform.scale(q.width / n, q.height / n)
                teil = np.zeros(form, np.uint8)
                reproject(klein, teil, src_transform=tr, src_crs=q.crs, dst_transform=ziel_tr,
                          dst_crs=ziel_crs, resampling=Resampling.nearest)
                bild[teil > 0] = teil[teil > 0]
                print("bedeckung", lat, lon, flush=True)
    np.save(f"{ordner}/bedeckung.npy", bild)
