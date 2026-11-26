# Lebensläufe (Charaktererstellung)

Die Charaktererstellung des Spiels kennt nur die sechs Kulturen Calradias. Jede Kultur der Mod nutzt die Optionen
ihrer Vorlage (Kroaten, Deutsche, Ungarn: Vlandia; Serben: Sturgia; Bosniaken, Türken: Aserai; Venezianer, Ragusaner:
Imperium). Fähigkeiten, Ausrüstung und Szenen bleiben die der Vorlage, nur die Texte kommen von hier.
`tools/gen_content.py` macht daraus Sprachtexte und die Tabelle `src/BalkanMod/CharacterCreation/BalkanBackgroundTable.g.cs`.

## Eine Datei pro Kultur (`<schluessel>.toml`, wie in `data/kulturen/`)

Abschnitt = Id der Option im Spiel. Erlaubt sind die Optionen der Eltern-Auswahl der Vorlage
(z. B. `vlandia_retainer_option`, Liste in `tools/gen_content.py`, `BACKGROUND_OPTIONS`).

```toml
[vlandia_retainer_option]
titel = { en = "A magnate's retainers", de = "das Gefolge eines Magnaten" }
text = { en = "Your father was …", de = "Euer Vater war …" }
```

Fehlt eine Option, bleibt der Text des Spiels.

## `allgemein.toml`

Texte, die für alle Kulturen gelten (Jugend, Bildung, Zusammenfassung). Abschnitt = Text-Id des Spiels
(8 Zeichen), darin `en` und `de`. Sie ersetzen den Text des Spiels in beiden Sprachen.
