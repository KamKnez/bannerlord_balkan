"""Wappen für Reiche und Clans: aus data/reiche/*.toml einen Bannercode des Spiels bauen.

Ein Wappen besteht aus einem Feld (Grundfarbe) und Figuren. Jede Figur ist ein Zeichen aus
Native/ModuleData/banner_icons.xml (Nummer, siehe docs/wappen.md) mit Farbe, Lage und Größe.
Die Lage zählt vom Mittelpunkt des Banners aus (x nach rechts, y nach unten), sichtbar ist auf dem
Schild etwa x -300..300 und y -370..370. Größe ist die Kantenlänge des Zeichenfelds; das Zeichen selbst
füllt davon etwa 85 %.

    [clan.wappen]
    quelle = "https://..."            # Beleg für das historische Wappen
    feld = "rot"
    figuren = [
      { zeichen = 505, farbe = "weiss", y = 0, breite = 1600, hoehe = 220 },   # Balken
      { zeichen = 140, farbe = "gold", groesse = 420 },                          # Löwe
    ]
"""

# Heraldische Farben -> Nummer der Spielpalette (Native/ModuleData/banner_icons.xml, BannerColors)
FARBEN = {
    "rot": 83,       # D22D33
    "weiss": 172,    # FFFFFF
    "silber": 172,
    "gold": 15,      # F7BF46
    "blau": 202,     # 2A5599
    "schwarz": 116,  # 0B0C11
    "gruen": 126,    # 34671E
    "braun": 92,     # 714214
}
FARBWERTE = {
    83: "0xffD22D33", 172: "0xffffffff", 15: "0xffF7BF46", 202: "0xff2A5599",
    116: "0xff0B0C11", 126: "0xff34671e", 92: "0xff714214",
}
MITTE = 764
HINTERGRUND = 11  # einfarbiger Hintergrund des Banners
ERLAUBT = {"zeichen", "farbe", "x", "y", "groesse", "breite", "hoehe", "drehung", "spiegeln"}


def check(w, where, icon_ids=None):
    icon_ids = icon_ids or ZEICHEN
    errors = []
    if w.get("feld") not in FARBEN:
        errors.append(f"{where}: wappen.feld muss eine von {', '.join(FARBEN)} sein")
    if not str(w.get("quelle", "")).startswith("http"):
        errors.append(f"{where}: wappen.quelle (Beleg, URL) fehlt")
    figuren = w.get("figuren", [])
    if not figuren:
        errors.append(f"{where}: wappen.figuren ist leer")
    if len(figuren) > 30:
        errors.append(f"{where}: höchstens 30 Figuren")
    for i, f in enumerate(figuren):
        extra = set(f) - ERLAUBT
        if extra:
            errors.append(f"{where}: Figur {i + 1}: unbekannte Felder {sorted(extra)}")
        if f.get("zeichen") not in icon_ids:
            errors.append(f"{where}: Figur {i + 1}: Zeichen {f.get('zeichen')} gibt es nicht")
        if f.get("farbe") not in FARBEN:
            errors.append(f"{where}: Figur {i + 1}: Farbe {f.get('farbe')} unbekannt")
    return errors


def layers(w):
    """Ebenen als (zeichen, farbe, breite, hoehe, x, y, spiegeln, drehung) in Bannerkoordinaten."""
    out = [(HINTERGRUND, FARBEN[w["feld"]], 4345, 4345, MITTE, MITTE, 0, 0)]
    for f in w["figuren"]:
        g = f.get("groesse", 400)
        out.append((
            f["zeichen"], FARBEN[f["farbe"]], f.get("breite", g), f.get("hoehe", g),
            MITTE + f.get("x", 0), MITTE + f.get("y", 0), 1 if f.get("spiegeln") else 0, f.get("drehung", 0),
        ))
    return out


def banner_key(w):
    parts = []
    for zeichen, farbe, b, h, x, y, spiegeln, drehung in layers(w):
        # Zeichen.Farbe1.Farbe2.Breite.Höhe.X.Y.Umriss.Spiegeln.Drehung
        parts.append(f"{zeichen}.{farbe}.{farbe}.{b}.{h}.{x}.{y}.0.{spiegeln}.{drehung}")
    return ".".join(parts)


def primary_secondary(w):
    """Grundfarbe und Farbe der ersten Figur, für die Farben des Reichs auf der Karte."""
    feld = FARBEN[w["feld"]]
    fig = FARBEN[w["figuren"][0]["farbe"]] if w.get("figuren") else feld
    return FARBWERTE[feld], FARBWERTE[fig]


# Nummern der Zeichen in Native/ModuleData/banner_icons.xml (Spielversion 1.3/1.5)
ZEICHEN = set(range(100, 165)) | set(range(200, 224)) | set(range(300, 348)) | set(range(400, 464)) | set(range(500, 536))
