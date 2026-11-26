# Packen: Modelle, Animationen, Kleidung und Bilder in einem Durchgang

Alles, was das Spiel nur gepackt lädt, entsteht hier auf einen Schlag: `AssetPackages/pack0.tpac` (Modelle,
Animationen, Partikel, Kleidung) und die Sprites der Oberfläche (Musketen-Symbol, Hauptmenü-Karte).
Danach kommen die Ergebnisse ins Repo, und die Umstellungen „nach dem Packen“ (unten) werden gemergt.

## 0. Vorbereitung

1. Das neueste Paket aus GitHub (Actions → letzter Lauf auf `main` → Artefakt) nach `Modules\BalkanMod` entpacken
   und entsperren:
   `Get-ChildItem -Recurse "…\Modules\BalkanMod" | Unblock-File`
2. Die Hilfs-Mod `Modules\BalkanAssets` (mit dem Editor angelegt) bekommt die Quellen:
   - `Module/BalkanMod/Assets/napoleonic_warfare/` aus dem Repo nach `BalkanAssets\Assets\napoleonic_warfare\`
     (neu sind die Kugel: `weapons/musket_bullet_geo.tpac`, `materials/gap_musket_bullet_mtl.tpac`,
     `textures/musket_bullet_*_tex.tpac`)
   - `Module/BalkanMod/RuntimeDataCache/*.rdc` nach `BalkanAssets\RuntimeDataCache\`
   - Die Napoleonic-Kleidung und das Pistolenmodell liegen dort schon (`Assets\napoleonic_warfare_kleidung\`).
   - `BalkanAssets\ModuleData\action_types.xml` bleibt (sonst meldet der Editor fehlende Aktionen).

## 1. pack0.tpac (Modding Kit, Editor)

1. Modding Kit starten, im Launcher nur Native, SandBoxCore, Sandbox und **BalkanAssets** anhaken
   (Balkan 1700 aus, sonst kommen die Klang-Meldungen).
2. Hauptmenü → Editor → *File → Publish Module* → BalkanAssets → Zielordner
   `Desktop\BalkanAssets_gepackt`.
3. Größe von `BalkanAssets_gepackt\BalkanAssets\AssetPackages\pack0.tpac` prüfen: GitHub nimmt höchstens 100 MB
   pro Datei. Ist sie größer, Bescheid geben, dann teilen wir auf.

## 2. Sprites (Musketen-Symbol, Hauptmenü-Karte)

1. `…\Mount & Blade II Bannerlord\bin\Win64_Shipping_wEditor\TaleWorlds.TwoDimension.SpriteSheetGenerator.exe`
   starten und am Ende **Enter** drücken (sonst bleiben die Bilder gesperrt). Er liest
   `Modules\BalkanMod\GUI\SpriteParts\ui_balkan\` und schreibt `GUI\BalkanModSpriteData.xml`.
2. Modding Kit starten, diesmal **Balkan 1700** anhaken (mit Harmony, ButterLib, UIExtenderEx, MCM), *Play*.
3. Im Hauptmenü **Alt + `** und `resource.show_resource_browser` eingeben.
4. „Native“ einklappen, **BalkanMod** wählen → *GauntletUI* → **Scan new asset files** → `ui_balkan` anhaken →
   **Import**. Bei einem zweiten Durchgang: Rechtsklick auf `ui_balkan` → *Reimport*.
5. Fenster und Spiel schließen. Neu ist `Modules\BalkanMod\Assets\GauntletUI\ui_balkan_1_tex.tpac`.

## 3. Zurück ins Repo

Bescheid geben. Claude holt sich (nur lesend) `pack0.tpac` aus `Desktop\BalkanAssets_gepackt` und die
Sprite-Dateien (`GUI\BalkanModSpriteData.xml`, `Assets\GauntletUI\ui_balkan_*`) aus `Modules\BalkanMod`.

## Nach dem Packen umstellen

- `BULLET_FLYING_MESH` in `tools/gen_content.py` auf `musket_bullet` (fliegende Kugel statt Schleuderstein)
- Pistole auf das NW-Modell `new_flintlock_pistol` (`data/waffen.toml`)
- Kleidung aus PR #30 (Truppen ab Stufe 3)
- Hauptmenü: Karte als Hintergrund (Prefab-Erweiterung auf `InitialScreen`, Sprite `balkan_main_menu_map`; das Bild liegt schon in `GUI/SpriteParts/ui_balkan/`)
