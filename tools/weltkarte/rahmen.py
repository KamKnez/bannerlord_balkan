"""Kartenrahmen und Umrechnung zwischen echten Koordinaten und der Spielkarte.

Die Spielkarte ist wie Calradia ein Quadrat aus 16 x 16 Knoten zu je 53 m (848 x 848 Einheiten) mit
256 Höhenpunkten je Knoten, also 4096 x 4096 Bildpunkten. Der Ausschnitt ist flächentreu (Lambert) um den
Mittelpunkt abgebildet; eine Einheit im Spiel entspricht rund 2,4 Kilometern.
"""
import math

MITTE_BREITE = 42.6      # Grad Nord
MITTE_LAENGE = 24.3      # Grad Ost
KANTE_KM = 2050.0        # Kantenlänge des Ausschnitts: Venedig bis Krim, Kiew bis Kreta und Zypern
KNOTEN = 16
KNOTEN_GROESSE = 53.0
PUNKTE_JE_KNOTEN = 256
PIXEL = KNOTEN * PUNKTE_JE_KNOTEN          # 4096
KARTE = KNOTEN * KNOTEN_GROESSE            # 848 Einheiten
M_JE_PIXEL = KANTE_KM * 1000.0 / PIXEL
KM_JE_EINHEIT = KANTE_KM / KARTE

WASSERHOEHE = 2.25       # Höhe der Wasserfläche im Spiel (Calradia: rund 2,24)
HOEHE_WEISS = 25.6       # Spielhöhe, die im 16-Bit-Bild dem Wert 65535 entspricht (Schwarz = 0)

PROJ = f"+proj=laea +lat_0={MITTE_BREITE} +lon_0={MITTE_LAENGE} +datum=WGS84 +units=m +no_defs"
_R = 6371007.181  # Kugelradius, für die Platzierung von Orten genau genug (Abweichung zu PROJ unter 1 km)


def geo_zu_meter(breite, laenge):
    """Breite/Länge in Grad -> Meter östlich/nördlich des Kartenmittelpunkts."""
    p, l = math.radians(breite), math.radians(laenge)
    p0, l0 = math.radians(MITTE_BREITE), math.radians(MITTE_LAENGE)
    k = math.sqrt(2.0 / (1.0 + math.sin(p0) * math.sin(p) + math.cos(p0) * math.cos(p) * math.cos(l - l0)))
    x = _R * k * math.cos(p) * math.sin(l - l0)
    y = _R * k * (math.cos(p0) * math.sin(p) - math.sin(p0) * math.cos(p) * math.cos(l - l0))
    return x, y


def meter_zu_geo(x, y):
    """Umkehrung von geo_zu_meter."""
    p0, l0 = math.radians(MITTE_BREITE), math.radians(MITTE_LAENGE)
    rho = math.hypot(x, y)
    if rho < 1e-9:
        return MITTE_BREITE, MITTE_LAENGE
    c = 2 * math.asin(min(1.0, rho / (2 * _R)))
    breite = math.asin(math.cos(c) * math.sin(p0) + y * math.sin(c) * math.cos(p0) / rho)
    laenge = l0 + math.atan2(x * math.sin(c), rho * math.cos(p0) * math.cos(c) - y * math.sin(p0) * math.sin(c))
    return math.degrees(breite), math.degrees(laenge)


def geo_zu_spiel(breite, laenge):
    """Breite/Länge -> Spielkoordinaten (x nach Osten, y nach Norden, 0 bis 848)."""
    x, y = geo_zu_meter(breite, laenge)
    halb = KANTE_KM * 500.0
    return (x + halb) / (KM_JE_EINHEIT * 1000.0), (y + halb) / (KM_JE_EINHEIT * 1000.0)


def spiel_zu_pixel(x, y):
    """Spielkoordinaten -> Bildpunkt (Spalte, Zeile) im Bild mit Norden oben."""
    return x / KARTE * PIXEL, (1.0 - y / KARTE) * PIXEL
