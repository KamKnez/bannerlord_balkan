# Technik: Was ist machbar?

Stand: Bannerlord v1.5.7 (Referenz-DLLs von BUTR, Paket `Bannerlord.ReferenceAssemblies.Core` 1.5.7.125802).

## Kurzfassung

| Bereich | Werkzeug | Aufwand | Ohne Modding Kit? |
|---|---|---|---|
| Kulturen, Namen, Texte | XML | gering | ja |
| Königreiche, Clans, Lords | XML | gering bis mittel | ja |
| Truppen und Truppenbäume | XML (`NPCCharacters`) | mittel | ja |
| Ausrüstung aus vorhandenen Modellen | XML (`Items`) | mittel | ja |
| Siedlungen umbenennen und neu verteilen | XML oder C# | gering | ja |
| Eigene Spielregeln (Militärgrenze, Ereignisse, Aberglauben) | C# | mittel bis hoch | ja |
| Schusswaffen | XML + C# + Effekte | hoch | teilweise |
| Neue Karte | Modding Kit (Editor) | sehr hoch | nein |
| Neue Szenen (Städte, Burgen) | Modding Kit | hoch | nein |
| Eigene 3D-Modelle | Blender + Modding Kit | sehr hoch | nein |
| Seefahrt (War Sails) | DLC + Modding Kit | hoch | nein |

## XML-Daten

- Jede Mod meldet ihre XML-Dateien in `SubModule.xml` unter `<Xmls>` an, als `<XmlNode><XmlName id="..." path="..."/></XmlNode>`.
  Bekannte IDs sind z. B. `Items`, `SPCultures`, `NPCCharacters`, `Settlements`. Dazu kommen nach unserer Kenntnis `Kingdoms`, `Factions` (Clans) und `Heroes`. *(Die genauen IDs prüfen wir in Phase 2 an den Spieldateien.)*
  Quelle: [SubModule-Doku](https://docs.bannerlordmodding.com/_xmldocs/submodule).
- Dateien mit derselben ID aus verschiedenen Mods werden **zusammengeführt**. Objekte mit derselben ID überschreiben einander in Ladereihenfolge.
  Das heißt, wir können die Calradia-Fraktionen gezielt überschreiben, z. B. die Kultur `vlandia` mit Namen, Truppen und Kleidung der Habsburger.
- Truppen und Lords sind beide `NPCCharacter`-Einträge mit Ausrüstung, Fähigkeiten und `upgrade_targets` (Truppenbaum).
  Quelle: [NPCCharacters-Doku](https://docs.bannerlordmodding.com/_xmldocs/npccharacters).
- Gegenstände (`Item`, mit `Armor`, `Weapon`, `Horse` usw.) können vorhandene Modelle (`mesh`) mit neuen Werten und Namen benutzen.
  Quelle: [Items-Doku](https://docs.bannerlordmodding.com/_xmldocs/items).

## Siedlungen auf der Calradia-Karte

- `settlements.xml` legt Typ, Besitzer, Wohlstand und zugehörige Stadt fest. Die Lage auf der Karte steht dagegen in der Kartenszene `Main_map/scene.xscene`.
  Quelle: [How settlements work](https://docs.bannerlordmodding.com/_tutorials/new_settlements).
- Ein Haken ist, dass `settlements.xml` laut Doku nicht ergänzt werden kann. Man müsste die ganze Datei des Spiels kopieren, und die dürfen wir nicht ins Repo legen.
- **Unser Weg für v0.1:** Wir legen eine eigene kleine Datei an, die jeder Calradia-Siedlung einen Balkan-Namen und einen neuen Besitzer zuweist (`calradia_id → Name, Clan`).
  Ein C#-Teil wendet sie beim Start einer neuen Kampagne an.
  So kopieren wir keine Spieldateien, und die Zuordnung lässt sich ohne Spiel testen (Unit-Tests).
- Neue Siedlungen an neuen Orten gehen erst mit eigener Karte (Phase 4).

## Schusswaffen

- Die Spiel-Engine kennt die Waffenarten `Musket`, `Pistol`, `Bullets` und `Cartridge` (gefunden in `TaleWorlds.Core.dll` 1.5.7).
  Ob sie im Einzelspieler vollständig funktionieren (Nachladen, Animation, Ton), testen wir in Phase 3. *(prüfen)*
- Andere Mods bauen Gewehre meist auf **Armbrüsten** auf: gleiche Mechanik (Laden, Zielen), neue Modelle, eigene Werte.
  Einige tauschen nur das Aussehen ([Gun model replacer](https://www.nexusmods.com/mountandblade2bannerlord/mods/4263)).
- Rauch, Mündungsfeuer und Knall sind Partikel- und Ton-Effekte. Dafür brauchen wir C# und gegebenenfalls das Modding Kit.
- Unser Plan: zuerst Armbrust-Mechanik mit Musketen-Werten (Phase 2/3), dann Effekte und eigene Modelle.

## Karte und War Sails

- Eine neue Weltkarte entsteht im Editor des Modding Kits (Höhenkarte, Gelände, Wege, Siedlungspositionen). Das ist der größte Einzelschritt.
- Wir legen sie gleich in voller Größe mit Meer an, damit War Sails später ohne Neubau dazukommt.
  TaleWorlds unterstützt War-Sails-Mods ausdrücklich ([Modding-Wettbewerb](https://www.pcgamer.com/games/rpg/you-could-win-a-slice-of-eur30-000-by-building-the-best-mod-for-mount-and-blade-2s-controversial-seafaring-expansion/)).
- Die Seefahrt kommt als eigenes, optionales Modul, damit die Hauptmod auch ohne DLC läuft.

## Leistung

- Eine große Karte mit vielen Siedlungen und Parteien kostet Leistung. Ziel ist, dass die Mod auf einem normalen Laptop spielbar bleibt.
  Deshalb setzen wir lieber auf weniger, dafür wichtige Orte und testen früh.

## Was sich ohne Spiel testen lässt

- XML: wohlgeformt, Pflichtfelder, IDs eindeutig, Verweise gültig (Truppe → Ausrüstung, Clan → Kultur, Siedlung → Clan).
- C#: Bauen gegen die Referenz-DLLs, Unit-Tests für Logik ohne Spiel (z. B. Zuordnung der Siedlungen, Balancing-Formeln).
- Alles andere testet Kamilo durch Spielen.
