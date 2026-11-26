# Szenarien und Spielstarts (Entwürfe)

Bannerlord bietet im Sandbox-Modus unter **Advanced Starting Options** eine Auswahl an Kampagnen-Szenarien
(Default, United Empire, Last Stand, 2 Faction War, Invasion, Randomized Calradia), dazu Spielerstarts (*Player Start*)
und Modifikatoren (z. B. Bandit Surge, Civil Unrest, Recruit Shortage).
Wir wollen dort eigene, historische Szenarien anbieten. Die Liste hier sammelt Entwürfe zur späteren Auswahl.

Wie die Szenarien technisch angelegt werden (XML oder C#), prüfen wir an den Spieldateien. *(prüfen)*

## Kampagnenstruktur (entschieden)

Die Kampagne besteht aus zwei Teilen. Feldzüge zu einzelnen Schauplätzen kommen erst später als Option dazu.

### 1. Zwischen den Kriegen (Grundgerüst, offene Sandbox)

Start nach dem Frieden von Karlowitz 1699, mit festen Grenzen und angespanntem Frieden. Große historische Ereignisse
treten zu ihren Daten ein, sofern die betroffenen Gebiete auf der Karte sind. Der Spieler kann sich jeder Seite anschließen.

| Jahr | Ereignis | Wirkung im Spiel | Braucht |
|---|---|---|---|
| 1703 | Rákóczi-Aufstand (bis 1711) | Kuruzen-Rebellen erheben sich gegen die Habsburger in Ungarn | Ungarn auf der Karte |
| 1711 | Pruth-Feldzug | Krieg zwischen Zarentum und Osmanen, die Osmanen ziehen Truppen vom Balkan ab | Zarentum und Moldau |
| 1714 | Krieg zwischen Venedig und den Osmanen (bis 1718) | Osmanen greifen Morea und Dalmatien an, 1716 Belagerung von Korfu | Kern, für Morea und Korfu später Griechenland |
| 1716 | Österreichisch-Türkischer Krieg (bis 1718) | Habsburger treten an Venedigs Seite in den Krieg ein, Schlacht bei Peterwardein 1716, Belagerung Belgrads 1717 | Kern, für Belgrad und Peterwardein die zweite Runde |

Im Kern (v0.1) greifen davon zuerst die Kriege ab 1714 und 1716, die übrigen Ereignisse folgen mit der größeren Karte.
Die Ereignisse sollen abschaltbar sein, für Spieler, die eine rein freie Sandbox wollen. *(Daten im Design prüfen)*

### 2. Geführter Aufstieg (Einstieg)

Eine Startgeschichte je Volk mit eigenem Ziel. Hat man das Ziel erreicht, ist das Spiel frei.

| Start | Ziel | Wann |
|---|---|---|
| Grenzer (Kroate oder Serbe an der Militärgrenze) | Hauptmann der Militärgrenze werden | v0.1 oder kurz danach |
| Bosniake | Kapitän (Kapetan) einer Grenzfestung werden | v0.1 oder kurz danach |
| Hajduke | Eine eigene Bande aufbauen und anführen | v0.1 oder kurz danach |
| Venezianer oder Dalmatiner | Kommandant einer Küstenfestung werden *(Idee)* | nach v0.1 |
| Ragusaner | Ein Handelshaus gründen und in den Rat aufsteigen *(Idee)* | nach v0.1 |
| Montenegriner | Fürstbischof Danilo I. im Kampf um Unabhängigkeit helfen | zweite Runde (Montenegro) |

### 3. Schauplatz-Feldzüge (später, optional)

Kurze, abgeschlossene Kapitel als eigene Szenarien neben der Sandbox, zum Beispiel die Belagerung Belgrads 1717
oder die Verteidigung von Korfu 1716.

## Weitere Kampagnen-Szenarien (Entwürfe)

| Szenario | Startjahr | Lage zu Beginn | Braucht | Wann |
|---|---|---|---|---|
| **Nach Karlowitz** (Standard) | 1700 | Grenzen nach dem Frieden von 1699. Frieden zwischen allen Reichen, aber Spannungen an der Grenze. Freischärler sind aktiv | Kern | v0.1 |
| **Der Große Türkenkrieg** | 1686 | Slawonien, die Lika und das Hinterland Dalmatiens sind noch osmanisch. Habsburger und Venedig sind verbündet (Heilige Liga) und im Krieg mit den Osmanen | Kern, eigene Besitzliste | nach v0.1 |
| **Kandia-Krieg in Dalmatien** | 1645 | Venedig gegen die Osmanen in Dalmatien. Klis ist noch osmanisch, die Habsburger sind neutral | Kern, eigene Besitzliste | später |
| **Grenze in Flammen** | 1700 | Wie der Standard, aber mit Krieg zwischen Habsburgern und Osmanen von Anfang an (entspricht „2 Faction War“) | Kern | nach v0.1 |
| **Rákóczi-Aufstand** | 1703 | Ungarische Kuruzen erheben sich gegen die Habsburger. Neue Rebellen-Fraktion | Ungarn auf der Karte | zweite Runde oder später |
| **Österreichisch-Türkischer Krieg** | 1716 | Habsburger und Venedig gegen die Osmanen, Kampf um Belgrad und Morea | Serbien und Griechenland auf der Karte | später |
| **Zufälliger Balkan** | 1700 | Besitz zufällig verteilt (entspricht „Randomized Calradia“) | Kern | nach v0.1 |

## Spielerstarts (Ideen)

| Start | Beschreibung |
|---|---|
| Grenzer | Startet in einem Dorf der Militärgrenze mit ein paar Grenzern und guter Beziehung zum Generalat |
| Hajduk | Startet als Freischärler im osmanischen Bosnien, mit einer kleinen Bande und schlechtem Ruf bei den Behörden |
| Kaufmann aus Ragusa | Startet in Dubrovnik mit Geld und einer Karawane, aber ohne Truppen |
| Sipahi | Startet als osmanischer Lehensreiter mit einem kleinen Timar (Dorf) und Dienstpflicht |
| Venezianischer Offizier | Startet in Zadar mit einer Kompanie Schiavoni im Dienst der Republik |

## Modifikatoren (Ideen)

| Modifikator | Wirkung |
|---|---|
| Pest | Seuche in einzelnen Städten, Bevölkerung und Rekruten sinken zeitweise |
| Aberglauben stark | Mehr Ereignisse um Vampire, Vilen und Hexen (die Low-Fantasy-Ebene wird häufiger) |
| Aberglauben aus | Keine Low-Fantasy-Ereignisse |
| Grenzkrieg | Mehr Überfälle von Hajduken, Uskoken und Kapetanije-Truppen |
