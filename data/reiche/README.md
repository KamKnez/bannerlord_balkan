# Königreiche, Clans und Lords

Eine Datei pro Königreich. `tools/gen_content.py` erzeugt daraus XSLT-Patches für die Calradia-Reiche
(`Module/BalkanMod/ModuleData/XSLT/BalkanMod_Sandbox_*.xslt`). Ids, Wappen, Familienbande, Gesichter und
Fähigkeiten der Lords bleiben wie im Spiel, wir ändern nur Namen, Texte, Farben, Herrscher und Kultur.

| Datei | Königreich | Im Spiel |
|---|---|---|
| `habsburger.toml` | Habsburgermonarchie | Vlandia (`vlandia`) |
| `osmanen.toml` | Osmanisches Reich (Eyalet Bosnien) | Aserai (`aserai`) |
| `venedig.toml` | Republik Venedig | Westliches Imperium (`empire_w`) |
| `ragusa.toml` | Republik Ragusa | Südliches Imperium (`empire_s`) |

## Felder

| Feld | Bedeutung |
|---|---|
| `reich_id` | Id des Königreichs im Spiel |
| `kultur_id` | Kultur aus `data/kulturen/` |
| `kultur_wechseln` | `true`: Reich, Clans, Lords und die Siedlungen unter `siedlungen` bekommen diese Kultur (nötig für Venedig und Ragusa, deren Kulturen neu sind) |
| `farben` | Kartenfarben des Reichs (`AARRGGBB`) |
| `herrscher` | Lord, der Reich und Clan führt (muss in einem Clan der Datei stehen) |
| `name`, `kurzname`, `titel`, `herrschertitel` | Texte, Englisch und Deutsch |
| `[text]`, `[herrscher_text]` | Beschreibung des Reichs und Lebenslauf des Herrschers |
| `siedlungen` | Städte, Burgen und Dörfer, deren Kultur wechselt |
| `krieg_mit` | Königreiche, mit denen das Reich zu Spielbeginn im Krieg ist; muss auf beiden Seiten stehen. Andere Calradia-Kriege dieses Reichs entfallen, auch die, die andere Reiche gegen es führen |
| `[wappen]` | Wappen des Reichs: `zeichen` (Nummer des Zeichens), `groesse`, `hintergrund` und `farbe` als `[Nummer, "0xffRRGGBB"]` aus der Farbpalette des Spiels. Die Clans übernehmen die Farben im Spiel |
| `[orte]` | neue Namen der Städte, Burgen und Dörfer: `town_V1 = "Zagreb"` (Eigenname) oder `{ en, de }`. Der Kommentar dahinter nennt den Calradia-Namen |
| `[ortstexte]` | Beschreibung einer Stadt oder Burg für die Enzyklopädie (Stand um 1700): `town_V1 = { en, de }` |
| `[[dorftext]]` | Vorlagen `en`/`de` für Dörfer ohne eigenen Text, reihum verteilt. `{DORF}` wird durch den Dorfnamen ersetzt, `{SITZ}` durch die Stadt oder Burg, zu der das Dorf gehört |
| `[[clan]]` | `id` im Spiel und `name` (Familienname als Text, oder `{ en, de }` für einen übersetzten Namen) |
| `[[clan.lord]]` | `id` im Spiel, neuer Vorname `name`, `weiblich` nur zur Übersicht (das Geschlecht bleibt wie im Spiel) |

Die Vornamen sind beim Anlegen reihum aus `data/namen/` verteilt worden und können frei geändert werden.
Alle anderen Lebensläufe der Lords werden entfernt, weil sie von Calradia erzählen.
Die Orte sind nach ihrer Lage auf der Calradia-Karte echten Orten zugeordnet (Norden bleibt Norden, Osten bleibt Osten),
die Hauptstadt jedes Reichs ist fest gesetzt (Zagreb, Sarajevo, Zadar, Dubrovnik). Die Dörfer einer Stadt oder Burg
liegen auch in Wirklichkeit in deren Nähe. Calradia hat mehr Orte, als die Reiche um 1700 hatten; die übrigen tragen
Namen aus der weiteren Umgebung (z. B. Graz, Pécs und Ljubljana bei den Habsburgern, Beograd und Novi Pazar bei den
Osmanen, Inseln und Dörfer der Republik bei Ragusa).

Die CI prüft, dass jede Id im Spiel existiert, kein Clan, Lord oder Ort in zwei Dateien steht und kein Ortsname doppelt vorkommt.
