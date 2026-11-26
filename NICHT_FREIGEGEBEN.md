# Nicht für eine Veröffentlichung freigegeben

Die Mod ist privat. Hier stehen alle Dateien der Mod, für die keine Erlaubnis zur Weitergabe vorliegt oder deren
Herkunft unklar ist. Vor einer Veröffentlichung (Nexus, Steam Workshop, öffentliches Repo) muss jeder Eintrag
ersetzt, entfernt oder geklärt werden. Freigegebene fremde Bausteine stehen in [CREDITS.md](CREDITS.md).

**Neue Einträge:** Wer eine fremde Datei ohne klare Freigabe in die Mod holt, trägt sie hier ein, mit Pfad in der
Mod, Quelle, Verwendung und dem, was beim Austausch zu tun ist. Ein Eintrag pro Datei oder Dateigruppe.

| Pfad in der Mod | Quelle | Wofür | Grund | Austausch |
|---|---|---|---|---|
| `Module/BalkanMod/ModuleSounds/balkan_musket_fire1.wav`, `balkan_musket_fire2.wav`, `balkan_musket_fire3.wav` | Napoleonic Warfare (Nexus 6101), `ModuleSounds/fire_musket.wav`, `fire_musket2.wav`, `fire_musket3.wav` | Musketenknall (`Missions/FirearmSoundBehavior.cs`) | NW nennt als Quelle nur „Various Free Web Sound Pages“, keine Freigabe für Klänge | Freie Klänge (z. B. CC0) gleichen Namens in `ModuleSounds/` legen, sonst nichts zu ändern |
| `Module/BalkanMod/ModuleSounds/balkan_pistol_fire.wav` | Napoleonic Warfare, `ModuleSounds/fire_pistol.wav` | Pistolenknall | wie oben | wie oben |
| `Module/BalkanMod/ModuleSounds/balkan_musket_reload.wav` | Napoleonic Warfare, `ModuleSounds/gap_musket_reload.wav` | Ladegeräusch | wie oben | wie oben |
| `Module/BalkanMod/Assets/napoleonic_warfare/animations/` (41 Animationen, auch `musketmelee/`) | Napoleonic Warfare, `Assets/animations/` | Laden, Zielen, Schießen und Bajonett für Musketen und Pistolen | NW gibt die Inhalte nur mit Nennung frei, für Animationen ist die Herkunft nicht einzeln belegt | Eigene oder frei lizenzierte Animationen gleichen Namens packen, oder die Waffen auf die Armbrust-Animationen zurückstellen |
| `Module/BalkanMod/Assets/napoleonic_warfare/particle/` (8 Dateien: `musket_effect_psys`, `pistol_effect_psys` mit Materialien und Texturen) | Napoleonic Warfare, `Assets/particle/` | Rauch und Mündungsfeuer beim Schuss | wie oben | Eigenen Partikeleffekt im Modding Kit bauen und den Namen im Code ändern |
| `Module/BalkanMod/RuntimeDataCache/*.rdc` (alle 43) | Napoleonic Warfare, `RuntimeDataCache/` | vorberechnete Daten der NW-Modelle, Animationen und Effekte oben | gehören zu den NW-Assets | mit den NW-Assets entfernen |
| `Module/BalkanMod/AssetPackages/pack0.tpac` | mit dem Modding Kit gepackt aus den NW-Dateien oben (Modelle, Animationen, Partikel) | alles, was das Spiel von den NW-Assets tatsächlich lädt | wie oben | nach dem Austausch der Quellen neu packen |
| `Module/BalkanMod/ModuleData/action_types.xml`, `action_sets.xml`, `movement_sets.xml`, `full_movement_sets.xml`, `item_usage_sets.xml` | Napoleonic Warfare, `ModuleData/austria_*.xml` (Musket, Rifle, Pistol) | Lade-, Ziel- und Schussbewegungen der Gewehre | gehören zu den NW-Animationen | mit den Animationen ersetzen; ohne sie `item_usage` in `tools/gen_content.py` wieder auf `crossbow` stellen |
| `data/kleidung.toml` → `Module/BalkanMod/ModuleData/balkan_items.xml` (21 Teile `balkan_nw_*`, Meshes `gap_*`) | Napoleonic Warfare, `Assets/copyright/` (Ordner `real_hats`, `real_uniforms`, `real_pants`, `materials`, `textures`) und `Assets/shared/` (Handschuhe) | Kleidung höherer Ränge: Dreispitz, Börk, Kolpak, Dolama, Grenzer-Rock, Dolman, Attila, Kürass, Pluderhose, Husarenstiefel u. a. | liegt bei NW im Ordner `copyright`, also ausdrücklich ohne Freigabe | Teile in `data/kleidung.toml` auf andere `mesh`-Namen stellen oder in `data/kulturen/*.toml` durch Bannerlord-Teile ersetzen, dann neu packen |
| `Modules/BalkanAssets/Assets/napoleonic_warfare_kleidung/` (151 Dateien, Liste in `dateien.json`) und die zugehörigen 129 `.rdc` in `Modules/BalkanAssets/RuntimeDataCache/` (nur auf Kamilos PC, nicht im Repo) | wie oben, dazu `Assets/shared/weapons/new_flintlock_pistol_geo.tpac` mit Materialien und Texturen | Quellen zum Packen der Kleidung und des Pistolenmodells | wie oben | Ordner löschen und neu packen |
