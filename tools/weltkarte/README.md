# Werkzeuge für die Balkan-Weltkarte

Erzeugt aus frei verfügbaren Geodaten die Dateien, die im Karteneditor des Modding Kits importiert werden.
Die Anleitung für den Import steht in [docs/weltkarte.md](../../docs/weltkarte.md), die Quellen der Daten in
[CREDITS.md](../../CREDITS.md).

| Skript | Aufgabe |
|---|---|
| `rahmen.py` | Kartenausschnitt, Raster und Umrechnung Breite/Länge ↔ Spielkoordinaten. Hier wird der Ausschnitt geändert |
| `quellen_lesen.py` | Höhen (Copernicus GLO-90) und Landbedeckung (ESA WorldCover) auf das Kartenraster rechnen |
| `fluesse.py` | Flussläufe aus dem Höhenmodell und Natural Earth |
| `karte_bauen.py` | Höhenbild, Masken und Hilfskarte schreiben |
| `siedlungen_setzen.py` | Orte aus `data/weltkarte/orte.csv` auf begehbares Land setzen, `siedlungen.csv` und Vorschau schreiben |
| `szene_vorbereiten.py` | Kopie der Kartenszene des Spiels vorbereiten (braucht nur Python 3, läuft auf dem Spiel-PC) |

## Neu erzeugen

Braucht Python 3 mit `numpy scipy pillow rasterio pyshp pysheds` und rund 1 GB Platz. In einem Arbeitsordner `A`:

1. Copernicus-Kacheln nach `A/dem/` laden (10 bis 24 Grad Ost, 39 bis 49 Grad Nord), je Kachel
   `https://copernicus-dem-90m.s3.amazonaws.com/Copernicus_DSM_COG_30_N44_00_E018_00_DEM/Copernicus_DSM_COG_30_N44_00_E018_00_DEM.tif`.
2. Natural Earth nach `A/ne/<name>/` entpacken: `ne_10m_rivers_lake_centerlines` und `ne_10m_rivers_europe`
   (`https://naturalearth.s3.amazonaws.com/10m_physical/<name>.zip`).
3. Der Reihe nach, aus diesem Ordner:

```
python3 quellen_lesen.py A
python3 fluesse.py A
python3 karte_bauen.py A Zielordner
python3 siedlungen_setzen.py A Zielordner
```

Die Höhen sind absichtlich nicht maßstäblich; warum, steht am Anfang von `karte_bauen.py`.
