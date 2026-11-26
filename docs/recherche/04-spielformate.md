# Spielformate (Bannerlord v1.5.7)

Gelesen aus einer installierten Steam-Version (`Modules/`, Stand November 2026). Hier steht nur der Aufbau der
Dateien, keine Spielinhalte. Die Ids, auf die unsere Daten verweisen, liegen als reine Liste in
`tools/vanilla/ids_v1.5.7.txt`.

## Module und Versionen

| Modul | Version | Rolle |
|---|---|---|
| Native | v1.5.7 | Grundlage, Gegenstände für Mehrspieler, Texte |
| SandBoxCore | v1.5.7 | Kulturen, Truppen, Gegenstände, Gesichter, Ausrüstungssets |
| Sandbox | v1.5.7 | Kampagne: Lords, Clans, Königreiche, Siedlungen, Party-Vorlagen |
| StoryMode | v1.5.7 | Hauptquest |
| CustomBattle, BirthAndDeath | v1.5.7 | |
| NavalDLC (War Sails) | v1.3.7 | benötigt StoryMode, ändert Kulturen per XSLT |

Unsere `SubModule.xml` hängt von Native, SandBoxCore und Sandbox ab (v1.5.7) und optional vom NavalDLC, damit wir
nach ihm geladen werden.

## Wie Daten eingebunden werden

Jede Datei wird in der `SubModule.xml` als `XmlNode` mit Typ und Pfad (ohne Endung, relativ zu `ModuleData/`) angemeldet:

```xml
<XmlNode>
  <XmlName id="NPCCharacters" path="balkan_troops"/>
  <IncludedGameTypes><GameType value="Campaign"/> ...</IncludedGameTypes>
</XmlNode>
```

Wichtige Typen: `SPCultures`, `NPCCharacters`, `partyTemplates`, `Kingdoms`, `Factions` (Clans), `Heroes`,
`Settlements`, `Items`, `EquipmentRosters`, `BodyProperties`, `SkillSets`.
Alle Dateien eines Typs werden über alle Module zusammengeführt. Gleiche Ids aus einem späteren Modul ersetzen frühere.

**XSLT-Patches:** Zeigt der Pfad auf eine `.xslt`-Datei ohne gleichnamige `.xml`, wird das bisher zusammengeführte
Dokument dieses Typs damit umgeformt. So ändert das NavalDLC die Kulturen (`XSLT/NavalDLC_SandBoxCore_SPCultures`).
Wir nutzen denselben Weg, weil man damit nur einzelne Werte einer Kultur ändert und alles andere (auch die
Erweiterungen des DLC) erhalten bleibt. Achtung: In Attributen von Ergebnis-Elementen stehen `{` und `}` als
`{{` und `}}`, sonst hält XSLT sie für Ausdrücke.

## Kultur (`SPCultures`, `Culture`)

- Attribute: `id`, `name`, `is_main_culture`, `color`, `color2`, `basic_troop`, `elite_basic_troop`,
  vier Miliz-Truppen (`melee_militia_troop` usw.), `default_party_template` (Lords), `militia_party_template`,
  `villager_party_template`, Patrouillen, Rebellen, Belohnung für Vasallen, rund 40 Verweise auf Stadtbewohner
  (`townsman`, `blacksmith`, `tavernkeeper` …), Standardausrüstung, Brettspiel, Startpunkt auf der Karte, `text`.
- Kinder: `male_names`, `female_names`, `clan_names` (je `<name name="..."/>`), `cultural_feats`,
  `default_policies`, `possible_clan_banner_icon_ids`, `notable_templates`, `lord_templates`, Turniervorlagen,
  `basic_mercenary_troops`, Karawanen, mit DLC auch `available_ship_hulls`.
- Hauptkulturen im Spiel: empire, aserai, sturgia, vlandia, battania, khuzait (mit DLC auch nord).

## Truppe (`NPCCharacters`, `NPCCharacter`)

- Attribute: `id`, `name`, `level` (Stufe 1–6 = 6, 11, 16, 21, 26, 31), `default_group`
  (Infantry, Ranged, Cavalry, HorseArcher), `occupation="Soldier"`, `culture`, `is_basic_troop`,
  `upgrade_requires` (z. B. `ItemCategory.horse`, steht an der Zieltruppe), optional `skill_template`.
- Kinder: `face/face_key_template` (z. B. `BodyProperty.fighter_vlandia`), `skills/skill` (acht Kampffähigkeiten),
  `upgrade_targets/upgrade_target` (höchstens zwei), `Equipments` mit mehreren `EquipmentRoster`
  (`equipment slot="Item0..3|Head|Cape|Body|Gloves|Leg|Horse|HorseHarness"`) und einem zivilen `EquipmentSet`.

## Party-Vorlage (`partyTemplates`, `MBPartyTemplate`)

`stacks/PartyTemplateStack` mit `min_value`, `max_value`, `troop`. Die Kultur verweist auf die Vorlagen.

## Königreich (`Kingdoms`, `Kingdom`)

Attribute: `id`, `owner` (Hero), `initial_home_settlement`, `culture`, `banner_key`, Farben, `name`, `short_name`,
`title`, `ruler_title`, `text`. Kind `relationships/relationship` mit `kingdom`, `value`, `isAtWar`.

## Clan (`Factions`, `Faction`)

Attribute: `id`, `name`, `tier`, `owner` (Hero), `culture`, `super_faction` (Kingdom), `is_noble`, `banner_key`,
`initial_home_settlement`.

## Lord (`NPCCharacters` in `lords.xml`) und Held (`Heroes`)

- `lords.xml`: `NPCCharacter` mit `is_hero="true"`, `occupation="Lord"`, `age`, `voice`, `skill_template`,
  `face/BodyProperties` (fester Gesichtsschlüssel) mit Haar- und Bart-Tags, `Traits`, `Equipments` mit
  `EquipmentSet`-Vorlagen für Kampf und Zivil.
- `heroes.xml`: `Hero` mit gleicher `id`, `faction` (Clan), `spouse`, `father`, `mother`, `text`.

## Siedlung (`Settlements`, `Settlement`)

- Attribute: `id` (`town_V1`, `castle_V1`, `village_V1_1`), `name` (`{=Settlements.Settlement.name.<id>}Name`),
  `owner` (Clan, nur Städte und Burgen), `culture`, `posX`, `posY`, `gate_posX`, `gate_posY`, `text`.
- Kinder: `Components/Town` (`is_castle`, `prosperity`, Hintergründe) oder `Components/Village`
  (`village_type`, `hearth`, `bound` = zugehörige Stadt oder Burg), `Locations` mit den Szenen, `CommonAreas`.
- Umbenennen geht daher über die Text-Id `Settlements.Settlement.name.<id>` in einer Sprachdatei oder per XSLT.

## Gegenstände

`SandBoxCore/ModuleData/items/*.xml`: `Item` (Rüstungen, Pferde, Munition, Armbrüste, Bögen) und `CraftedItem`
(Schwerter, Speere, Äxte). Armbrüste mit dem Flag `CantReloadOnHorseback` kann man beritten nicht nachladen.

## Sprachdateien

`ModuleData/Languages/DE/language_data.xml` (`<LanguageData id="Deutsch">`) listet die Dateien.
Jede Datei: `<base><tags><tag language="Deutsch"/></tags><strings><string id="..." text="..."/></strings></base>`.
Texte in den Daten stehen als `{=id}English text`; `{=!}` heißt: nicht übersetzen (Eigennamen).
