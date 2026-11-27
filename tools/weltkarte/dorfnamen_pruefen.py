"""Prüft Dorfnamen gegen Wikipedia: Gibt es den Ort, und wie weit liegt er von seinem Sitz entfernt?

Aufruf: python3 dorfnamen_pruefen.py <liste.json> <ergebnis.csv>
liste.json: [[dorf_id, name, sitz_id], ...]. Die Lage der Sitze kommt aus data/weltkarte/orte.csv.
Für jeden Namen werden die Seite gleichen Namens und die ersten Suchtreffer der deutschen und englischen
Wikipedia mit ihren Koordinaten gelesen; gewählt wird die Seite, die dem Sitz am nächsten liegt und deren Titel
mit dem Namen beginnt. Ergebnis je Dorf: Seite, Koordinaten, Entfernung in km (leer = nichts gefunden).
"""
import csv
import json
import math
import os
import sys
import time
import urllib.parse
import urllib.request

HIER = os.path.dirname(os.path.abspath(__file__))
AGENT = "dorfnamen-pruefung/1.0"


def api(lang, **params):
    params.update(format="json", formatversion="2")
    url = f"https://{lang}.wikipedia.org/w/api.php?" + urllib.parse.urlencode(params)
    for versuch in range(4):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": AGENT})
            with urllib.request.urlopen(req, timeout=30) as f:
                return json.load(f)
        except Exception:
            time.sleep(2 + 3 * versuch)
    return {}


def km(a, b):
    p1, p2 = math.radians(a[0]), math.radians(b[0])
    d = math.sin((p2 - p1) / 2) ** 2 + math.cos(p1) * math.cos(p2) * math.sin(math.radians(b[1] - a[1]) / 2) ** 2
    return 6371.0 * 2 * math.asin(math.sqrt(d))


def einfach(s):
    return s.split("(")[0].split(",")[0].strip().casefold()


def kandidaten(lang, name):
    """(Titel, Breite, Länge, passt) für die Seite gleichen Namens (auch über Weiterleitung) und Suchtreffer."""
    out = {}
    r = api(lang, action="query", prop="coordinates", redirects="1", titles=name)
    for p in r.get("query", {}).get("pages", []):
        if p.get("coordinates"):
            c = p["coordinates"][0]
            out[p["title"]] = (c["lat"], c["lon"], True)      # der Name selbst führt auf diese Seite
    r = api(lang, action="query", generator="search", gsrsearch=name, gsrlimit="12", prop="coordinates",
            colimit="max")
    for p in r.get("query", {}).get("pages", []):
        if p.get("coordinates") and p["title"] not in out:
            c = p["coordinates"][0]
            out[p["title"]] = (c["lat"], c["lon"], einfach(p["title"]) == name.casefold())
    return out


def main(liste, ziel):
    orte = {z["id"]: z for z in csv.DictReader(open(os.path.join(HIER, "..", "..", "data", "weltkarte", "orte.csv"),
                                                    encoding="utf-8"), delimiter=";")}
    zeilen = []
    for dorf, name, sitz in json.load(open(liste, encoding="utf-8")):
        s = orte[sitz]
        lage = (float(s["breite"]), float(s["laenge"]))
        beste = None
        for lang in ("de", "en"):
            for titel, (b, l, passt) in kandidaten(lang, name).items():
                if not passt:
                    continue
                d = km(lage, (b, l))
                if beste is None or d < beste[0]:
                    beste = (d, lang, titel, b, l)
        if beste:
            d, lang, titel, b, l = beste
            seite = f"https://{lang}.wikipedia.org/wiki/" + urllib.parse.quote(titel.replace(" ", "_"))
            zeilen.append([dorf, name, s["name"], seite, f"{b:.3f}", f"{l:.3f}", f"{d:.0f}"])
        else:
            zeilen.append([dorf, name, s["name"], "", "", "", ""])
        print(*zeilen[-1], sep=";", flush=True)
    with open(ziel, "w", encoding="utf-8", newline="") as f:
        w = csv.writer(f, delimiter=";", lineterminator="\n")
        w.writerow(["id", "name", "sitz", "wikipedia", "breite", "laenge", "km_zum_sitz"])
        w.writerows(zeilen)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
