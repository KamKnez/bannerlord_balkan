# Credits

Fremde Bausteine, die die Mod benutzt, mit Lizenz. Neue Einträge kommen nur mit Erlaubnis bzw. passender Lizenz dazu. Dateien ohne Freigabe stehen in [NICHT_FREIGEGEBEN.md](NICHT_FREIGEGEBEN.md).

| Baustein | Wofür | Lizenz |
|---|---|---|
| [Bannerlord.ReferenceAssemblies](https://github.com/BUTR/Bannerlord.ReferenceAssemblies) (BUTR) | Bauen gegen die Spiel-DLLs, nur beim Kompilieren, wird nicht mitgeliefert | MIT |
| Mount & Blade II: Bannerlord (TaleWorlds Entertainment) | Spiel, Modding-Werkzeuge und vorhandene Spielinhalte | Bannerlord-EULA |
| [Napoleonic Warfare – Open Source](https://www.nexusmods.com/mountandblade2bannerlord/mods/6101) (GunsAndPowder-Revived: Killer/Florian, DarthKiller454) | Modelle und Texturen der Muskete (`newmusket`) und der Büchse (`newrifle`) unter `Module/BalkanMod/Assets/napoleonic_warfare/` und `Module/BalkanMod/RuntimeDataCache/`; Schuss- und Ladeklänge unter `Module/BalkanMod/ModuleSounds/` | Freigegeben zur Nutzung in anderen Mods mit Namensnennung (laut Mod-Seite: „just credit us“) |
| [Copernicus DEM GLO-90](https://doi.org/10.5270/ESA-c5d3d65) | Höhen der Weltkarte (`tools/weltkarte/`), nur als abgeleitetes Höhenbild | frei nutzbar mit Quellenangabe: © DLR e.V. 2010–2014 and © Airbus Defence and Space GmbH 2014–2018 provided under COPERNICUS by the European Union and ESA; all rights reserved |
| [ESA WorldCover 2021 v200](https://doi.org/10.5281/zenodo.7254221) | Wald, Acker, Wiese und Wasser der Weltkarte, nur als abgeleitete Masken | CC BY 4.0, © ESA WorldCover project 2021 / Contains modified Copernicus Sentinel data (2021) processed by ESA WorldCover consortium |
| [Natural Earth](https://www.naturalearthdata.com/) (Flüsse 1:10 Mio.) | Flussläufe der Weltkarte in den Ebenen | gemeinfrei |
| [GeoNames](https://www.geonames.org/) über [lutangar/cities.json](https://github.com/lutangar/cities.json) | Koordinaten der Orte in `data/weltkarte/orte.csv` (Quelle `GeoNames`) | CC BY 4.0 |

## Napoleonic Warfare

Die Musketen-Modelle stammen unverändert aus „Napoleonic Warfare – Open Release 1.0“ (Nexus Mods, Mod 6101) von
GunsAndPowder-Revived. Vielen Dank an Killer (Florian) und DarthKiller454 für Modelle, Texturen und die Freigabe
ihrer Dateien für andere Mods. Übernommen wurden nur Dateien aus deren Ordner `Assets/shared`; Dateien aus ihrem
Ordner `Assets/copyright` (Werke Dritter) sind nicht enthalten.

Die Klänge (`ModuleSounds/balkan_*.wav`, umbenannte Kopien von `fire_musket*.wav`, `fire_pistol.wav` und
`gap_musket_reload.wav` aus Napoleonic Warfare) stammen laut Mod-Seite von „Various Free Web Sound Pages“. Eine
ausdrückliche Freigabe für Klänge gibt es dort nicht. Die Mod ist privat; die Klänge stehen deshalb in
[NICHT_FREIGEGEBEN.md](NICHT_FREIGEGEBEN.md) und müssen vor einer Veröffentlichung ersetzt werden.

## Hauptmenü-Karte

`GUI/SpriteParts/ui_balkan/balkan_main_menu_map.png`: Johann Baptist Homann, „Imperium Turcicum in Europa, Asia et
Africa“ (Nürnberg, um 1720), gemeinfrei, über Wikimedia Commons (`File:Homann_Imperium_Turcium.jpg`).
