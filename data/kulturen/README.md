# Kulturen und Truppen

Eine Datei pro Kultur. Daraus erzeugt `tools/gen_content.py` die Spieldaten unter `Module/BalkanMod/ModuleData/`.
Die erzeugten Dateien nie von Hand ändern, sondern hier ändern und dann:

```
python3 tools/gen_content.py
```

Die CI prüft mit `python3 tools/gen_content.py --check`, ob die erzeugten Dateien aktuell sind, und mit
`python3 tools/validate_refs.py`, ob alle Gegenstände, Gesichter und Truppen im Spiel (v1.5.7) existieren.

| Datei | Kultur | Im Spiel |
|---|---|---|
| `kroaten.toml` | Kroaten (Habsburger) | ändert Vlandia (`vlandia`) |
| `bosniaken.toml` | Bosniaken (Osmanen) | ändert Aserai (`aserai`) |
| `venezianer.toml` | Venezianer, mit Dalmatinern (Venedig) | neue Kultur `venice`, Kopie des Imperiums |
| `ragusaner.toml` | Ragusaner (Ragusa) | neue Kultur `ragusa`, Kopie des Imperiums |
| `bulgaren.toml` | Bulgaren (Osmanen) | neue Kultur `bulgarians`, Kopie von Sturgia |
| `griechen.toml` | Griechen (Osmanen) | neue Kultur `greeks`, Kopie des Imperiums |

## Kopf der Datei

| Feld | Bedeutung |
|---|---|
| `schluessel` | internes Kürzel, z. B. für die Namen der Party-Vorlagen |
| `kultur_id` | Id der Kultur im Spiel |
| `art` | `anpassen` (vorhandene Calradia-Kultur ändern) oder `neu` (neue Kultur als Kopie von `vorlage`) |
| `vorlage` | nur bei `neu`: Kultur, von der alle übrigen Werte kopiert werden (Stadtbewohner, Turniere, Notable usw.) |
| `bild` | Kulturbild des Spiels bei der Charaktererstellung: `empire`, `vlandia`, `sturgia`, `aserai`, `khuzait` oder `battania` |
| `praefix` | Kürzel in den Truppen-Ids: `balkan_<praefix>_<id>` |
| `namensliste` | Datei unter `data/namen/` (Vornamen und Familiennamen für Clans) |
| `farben` | zwei Farben als `0xAARRGGBB` |
| `gesicht` | Standard-Gesichtsvorlage (`BodyProperty`) der Truppen |
| `zivil` | Zivilkleidung für Stufe 1, 2 und 3+ |
| `basis_truppe`, `elite_truppe` | Rekruten aus Dörfern: normaler Baum und Adelsbaum (der Adelsbaum geht ohne Lücke von Stufe 2 bis 6, das prüft `tools/gen_content.py`) |
| `[name]`, `[text]` | Name und Beschreibung, Englisch (`en`) und Deutsch (`de`) |
| `[miliz]` | Miliz der Städte und Burgen |
| `[[lord_partei]]` | Truppen, mit denen ein Lord dieser Kultur startet (`min` bis `max`) |

## Truppen

```toml
[[truppe]]
id = "haramija"                         # ergibt balkan_hr_haramija
name = { en = "Haramija", de = "Haramija" }
stufe = 2                               # 1 bis 6, wie im Spiel (Level 6, 11, 16, 21, 26, 31)
gruppe = "Ranged"                       # Infantry, Ranged, Cavalry oder HorseArcher
profil = "schuetze"                     # Fähigkeiten, siehe unten
basis = true                            # nur für die Rekruten der Dörfer
benoetigt = "pferd"                     # zum Aufwerten nötig: pferd oder kriegspferd
aufwerten = ["border_musketeer", "croatian_rider"]   # höchstens 2
gesicht = "fighter_vlandia_noble"       # optional, sonst das der Kultur
pferd = { Horse = "khuzait_horse", HorseHarness = "steppe_harness" }   # gilt für alle Ausrüstungen
faehigkeiten = { Bow = 60 }             # optional, überschreibt einzelne Werte
[[truppe.ausruestung]]                  # eine oder mehrere Varianten
Item0 = "balkan_arquebus"
Item1 = "balkan_musket_balls"
Item2 = "khuzait_sword_1_t2"
Head = "fur_hat"
Body = "padded_short_coat"
Leg = "leather_boots"
```

Slots: `Item0` bis `Item3` (Waffen, Schilde, Munition), `Head`, `Cape`, `Body`, `Gloves`, `Leg`, `Horse`, `HorseHarness`.

Profile (Anteil am Grundwert der Stufe: 20, 40, 70, 100, 130, 160):
`bauer`, `infanterie`, `pike`, `schuetze` (Armbrust = Muskete), `bogen_infanterie`, `reiter`, `leichte_reiter`, `berittene_schuetzen`.

Musketen und Pistolen stehen in [data/waffen.toml](../waffen.toml) (`balkan_arquebus`, `balkan_musket`,
`balkan_long_musket`, `balkan_heavy_musket`, `balkan_pistol` mit `balkan_musket_balls` bzw. `balkan_pistol_balls`).
Nur die Pistole lässt sich beritten nachladen.
