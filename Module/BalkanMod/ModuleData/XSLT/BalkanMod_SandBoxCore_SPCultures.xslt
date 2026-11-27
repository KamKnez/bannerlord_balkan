<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<!-- Grundregel: alles unverändert übernehmen -->
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Neue Kulturen am Ende der Liste anhängen -->
	<xsl:template match="/SPCultures">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
			<xsl:apply-templates select="Culture[@id='sturgia']" mode="balkan_bulgaren" />
			<xsl:apply-templates select="Culture[@id='vlandia']" mode="balkan_deutsche" />
			<xsl:apply-templates select="Culture[@id='empire']" mode="balkan_griechen" />
			<xsl:apply-templates select="Culture[@id='empire']" mode="balkan_ragusaner" />
			<xsl:apply-templates select="Culture[@id='sturgia']" mode="balkan_serben" />
			<xsl:apply-templates select="Culture[@id='aserai']" mode="balkan_tuerken" />
			<xsl:apply-templates select="Culture[@id='vlandia']" mode="balkan_ungarn" />
			<xsl:apply-templates select="Culture[@id='empire']" mode="balkan_venezianer" />
		</xsl:copy>
	</xsl:template>
	<!-- Bosniaken: Calradia-Kultur 'aserai' anpassen (data/kulturen/bosniaken.toml) -->
	<xsl:template match="/SPCultures/Culture[@id='aserai']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_culture_bosniaken}Bosniaks</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_bosniaken_text}The Eyalet of Bosnia is the Ottoman bulwark on the Habsburg and Venetian frontier. Its captaincies, the kapetanije, guard the river crossings and mountain passes, manned by azaps and musketeers who know every ford. The sipahis hold their timars in return for service on horseback, and the reckless deli horsemen ride ahead of every raid.</xsl:attribute>
			<xsl:attribute name="color">0xff1E6B3A</xsl:attribute>
			<xsl:attribute name="color2">0xffE3B04B</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_bs_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_bs_timarli_sipahi</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_bs_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_bs_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_bs_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_bs_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_bosniaken</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_bosniaken</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_bosniaken" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_bosniaken">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_bosniaken" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_bosniaken">
		<male_names>
			<name name="{{=!}}Mehmed" />
			<name name="{{=!}}Ahmed" />
			<name name="{{=!}}Mustafa" />
			<name name="{{=!}}Hasan" />
			<name name="{{=!}}Husein" />
			<name name="{{=!}}Ibrahim" />
			<name name="{{=!}}Alija" />
			<name name="{{=!}}Osman" />
			<name name="{{=!}}Murat" />
			<name name="{{=!}}Sulejman" />
			<name name="{{=!}}Omer" />
			<name name="{{=!}}Derviš" />
			<name name="{{=!}}Ismail" />
			<name name="{{=!}}Ali" />
			<name name="{{=!}}Halil" />
			<name name="{{=!}}Ejub" />
			<name name="{{=!}}Hamza" />
			<name name="{{=!}}Salih" />
			<name name="{{=!}}Mahmut" />
			<name name="{{=!}}Bajro" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_bosniaken">
		<female_names>
			<name name="{{=!}}Fatima" />
			<name name="{{=!}}Ajša" />
			<name name="{{=!}}Hatidža" />
			<name name="{{=!}}Emina" />
			<name name="{{=!}}Zejneba" />
			<name name="{{=!}}Merjema" />
			<name name="{{=!}}Hanifa" />
			<name name="{{=!}}Safija" />
			<name name="{{=!}}Hasnija" />
			<name name="{{=!}}Rabija" />
			<name name="{{=!}}Umihana" />
			<name name="{{=!}}Šerifa" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_bosniaken">
		<clan_names>
			<name name="{{=!}}Atlagić" />
			<name name="{{=!}}Crnčić" />
			<name name="{{=!}}Čengić" />
			<name name="{{=!}}Ljubović" />
			<name name="{{=!}}Sokolović" />
			<name name="{{=!}}Kapetanović" />
			<name name="{{=!}}Kulenović" />
			<name name="{{=!}}Predojević" />
			<name name="{{=!}}Filipović" />
			<name name="{{=!}}Gradaščević" />
		</clan_names>
	</xsl:template>
	<!-- Bulgaren: neue Kultur 'bulgarians' als Kopie von 'sturgia' (data/kulturen/bulgaren.toml) -->
	<xsl:template match="Culture" mode="balkan_bulgaren">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">bulgarians</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_bulgaren}Bulgarians</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_bulgaren_text}For three centuries the Bulgarians have lived under the Sultan, as farmers, herdsmen and craftsmen in the valleys of the Balkan mountains and on the Thracian plain. Some serve the empire as voynuks or as guards of the mountain passes and are freed from taxes in return. Others have taken to the forests as hajduks. The Catholic uprising of Chiprovtsi in 1688 was crushed, but it is not forgotten.</xsl:attribute>
			<xsl:attribute name="color">0xff2E6B3A</xsl:attribute>
			<xsl:attribute name="color2">0xffE9E4D4</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_bg_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_bg_konnik</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_bg_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_bg_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_bg_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_bg_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_bulgaren</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_bulgaren</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_bulgaren" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_bulgaren">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_bulgaren" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_bulgaren">
		<male_names>
			<name name="{{=!}}Stojan" />
			<name name="{{=!}}Ivan" />
			<name name="{{=!}}Petko" />
			<name name="{{=!}}Dimitar" />
			<name name="{{=!}}Georgi" />
			<name name="{{=!}}Nikola" />
			<name name="{{=!}}Todor" />
			<name name="{{=!}}Stanko" />
			<name name="{{=!}}Marin" />
			<name name="{{=!}}Petar" />
			<name name="{{=!}}Vasil" />
			<name name="{{=!}}Krastju" />
			<name name="{{=!}}Radoslav" />
			<name name="{{=!}}Dragan" />
			<name name="{{=!}}Stoiko" />
			<name name="{{=!}}Hristo" />
			<name name="{{=!}}Iliya" />
			<name name="{{=!}}Nedelko" />
			<name name="{{=!}}Atanas" />
			<name name="{{=!}}Kostadin" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_bulgaren">
		<female_names>
			<name name="{{=!}}Marija" />
			<name name="{{=!}}Elena" />
			<name name="{{=!}}Stojanka" />
			<name name="{{=!}}Rada" />
			<name name="{{=!}}Todora" />
			<name name="{{=!}}Kalina" />
			<name name="{{=!}}Neda" />
			<name name="{{=!}}Petkana" />
			<name name="{{=!}}Velika" />
			<name name="{{=!}}Zlata" />
			<name name="{{=!}}Vasilka" />
			<name name="{{=!}}Stana" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_bulgaren">
		<clan_names>
			<name name="{{=!}}Čiprovski" />
			<name name="{{=!}}Pejačević" />
			<name name="{{=!}}Knežević" />
			<name name="{{=!}}Parčević" />
			<name name="{{=!}}Marinović" />
			<name name="{{=!}}Stanislavov" />
			<name name="{{=!}}Bogdanov" />
			<name name="{{=!}}Nikolov" />
			<name name="{{=!}}Kraljev" />
			<name name="{{=!}}Vojnikov" />
		</clan_names>
	</xsl:template>
	<!-- Deutsche: neue Kultur 'germans' als Kopie von 'vlandia' (data/kulturen/deutsche.toml) -->
	<xsl:template match="Culture" mode="balkan_deutsche">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">germans</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_deutsche}Germans</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_deutsche_text}German settlers came to the frontier lands of Styria, Carniola and the reconquered plains as farmers, craftsmen and soldiers. The imperial regiments recruit their pikemen and musketeers among them, and the heavy cuirassiers of the Emperor are drawn from their nobility.</xsl:attribute>
			<xsl:attribute name="color">0xff1A1A1A</xsl:attribute>
			<xsl:attribute name="color2">0xffE8C547</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_de_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_de_squire</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_de_militia_pikeman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_de_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_de_militia_veteran_pikeman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_de_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_deutsche</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_deutsche</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_deutsche" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_deutsche">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_deutsche" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_deutsche">
		<male_names>
			<name name="{{=!}}Johann" />
			<name name="{{=!}}Georg" />
			<name name="{{=!}}Joseph" />
			<name name="{{=!}}Leopold" />
			<name name="{{=!}}Ferdinand" />
			<name name="{{=!}}Karl" />
			<name name="{{=!}}Franz" />
			<name name="{{=!}}Wolfgang" />
			<name name="{{=!}}Sigmund" />
			<name name="{{=!}}Christoph" />
			<name name="{{=!}}Andreas" />
			<name name="{{=!}}Heinrich" />
			<name name="{{=!}}Jakob" />
			<name name="{{=!}}Matthias" />
			<name name="{{=!}}Ulrich" />
			<name name="{{=!}}Ruprecht" />
			<name name="{{=!}}Herbard" />
			<name name="{{=!}}Siegfried" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_deutsche">
		<female_names>
			<name name="{{=!}}Anna" />
			<name name="{{=!}}Maria" />
			<name name="{{=!}}Katharina" />
			<name name="{{=!}}Elisabeth" />
			<name name="{{=!}}Barbara" />
			<name name="{{=!}}Margaretha" />
			<name name="{{=!}}Ursula" />
			<name name="{{=!}}Regina" />
			<name name="{{=!}}Sophia" />
			<name name="{{=!}}Eleonora" />
			<name name="{{=!}}Susanna" />
			<name name="{{=!}}Juliana" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_deutsche">
		<clan_names>
			<name name="{{=!}}Herberstein" />
			<name name="{{=!}}Auersperg" />
			<name name="{{=!}}Lamberg" />
			<name name="{{=!}}Khevenhüller" />
			<name name="{{=!}}Paradeiser" />
			<name name="{{=!}}Trauttmansdorff" />
			<name name="{{=!}}Starhemberg" />
			<name name="{{=!}}Breuner" />
			<name name="{{=!}}Attems" />
			<name name="{{=!}}Rauber" />
		</clan_names>
	</xsl:template>
	<!-- Griechen: neue Kultur 'greeks' als Kopie von 'empire' (data/kulturen/griechen.toml) -->
	<xsl:template match="Culture" mode="balkan_griechen">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">greeks</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_griechen}Greeks</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_griechen_text}The Greeks of Macedonia, Thessaly and the islands live under the Sultan as his Orthodox subjects. Their merchants and ship owners trade from Thessaloniki to Venice and Odessa, and Phanariot families in Constantinople serve the Porte as interpreters and princes. In the mountains the armatoles keep the roads for the empire, and the klephts rob them.</xsl:attribute>
			<xsl:attribute name="color">0xff1F4E9A</xsl:attribute>
			<xsl:attribute name="color2">0xffF2F2F2</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_gr_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_gr_archontopoulos</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_gr_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_gr_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_gr_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_gr_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_griechen</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_griechen</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_griechen" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_griechen">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_griechen" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_griechen">
		<male_names>
			<name name="{{=!}}Georgios" />
			<name name="{{=!}}Ioannis" />
			<name name="{{=!}}Nikolaos" />
			<name name="{{=!}}Dimitrios" />
			<name name="{{=!}}Konstantinos" />
			<name name="{{=!}}Athanasios" />
			<name name="{{=!}}Panagiotis" />
			<name name="{{=!}}Christodoulos" />
			<name name="{{=!}}Theodoros" />
			<name name="{{=!}}Michail" />
			<name name="{{=!}}Antonios" />
			<name name="{{=!}}Stavros" />
			<name name="{{=!}}Manolis" />
			<name name="{{=!}}Andreas" />
			<name name="{{=!}}Spyridon" />
			<name name="{{=!}}Vasileios" />
			<name name="{{=!}}Anastasios" />
			<name name="{{=!}}Lambros" />
			<name name="{{=!}}Kostas" />
			<name name="{{=!}}Nikitas" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_griechen">
		<female_names>
			<name name="{{=!}}Maria" />
			<name name="{{=!}}Eleni" />
			<name name="{{=!}}Aikaterini" />
			<name name="{{=!}}Sofia" />
			<name name="{{=!}}Anastasia" />
			<name name="{{=!}}Theodora" />
			<name name="{{=!}}Irini" />
			<name name="{{=!}}Despina" />
			<name name="{{=!}}Zoi" />
			<name name="{{=!}}Chrysoula" />
			<name name="{{=!}}Angeliki" />
			<name name="{{=!}}Kyriaki" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_griechen">
		<clan_names>
			<name name="{{=!}}Mavrokordatos" />
			<name name="{{=!}}Kantakouzinos" />
			<name name="{{=!}}Ypsilantis" />
			<name name="{{=!}}Karatzas" />
			<name name="{{=!}}Soutzos" />
			<name name="{{=!}}Rallis" />
			<name name="{{=!}}Notaras" />
			<name name="{{=!}}Laskaris" />
			<name name="{{=!}}Chrysoskoleos" />
			<name name="{{=!}}Bouas" />
		</clan_names>
	</xsl:template>
	<!-- Kroaten: Calradia-Kultur 'vlandia' anpassen (data/kulturen/kroaten.toml) -->
	<xsl:template match="/SPCultures/Culture[@id='vlandia']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_culture_kroaten}Croatians</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_kroaten_text}Croatia, Slavonia and Dalmatia call themselves a kingdom of their own, joined to the Habsburg crown. For two centuries the Croats have held the Military Frontier against the Ottomans: free peasants owe the emperor service instead of rent, and every village keeps its haramije and horsemen ready. Their nobles still ride as armoured cavalry, while the border men fight with sabre and arquebus.</xsl:attribute>
			<xsl:attribute name="color">0xffB0182A</xsl:attribute>
			<xsl:attribute name="color2">0xffF2EFE6</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_hr_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_hr_junker</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_hr_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_hr_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_hr_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_hr_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_kroaten</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_kroaten</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_kroaten" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_kroaten">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_kroaten" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_kroaten">
		<male_names>
			<name name="{{=!}}Ivan" />
			<name name="{{=!}}Juraj" />
			<name name="{{=!}}Nikola" />
			<name name="{{=!}}Petar" />
			<name name="{{=!}}Pavao" />
			<name name="{{=!}}Franjo" />
			<name name="{{=!}}Matija" />
			<name name="{{=!}}Grgur" />
			<name name="{{=!}}Stjepan" />
			<name name="{{=!}}Tomo" />
			<name name="{{=!}}Vuk" />
			<name name="{{=!}}Krsto" />
			<name name="{{=!}}Luka" />
			<name name="{{=!}}Marko" />
			<name name="{{=!}}Ante" />
			<name name="{{=!}}Mihovil" />
			<name name="{{=!}}Andrija" />
			<name name="{{=!}}Ladislav" />
			<name name="{{=!}}Gašpar" />
			<name name="{{=!}}Baltazar" />
			<name name="{{=!}}Ivaniš" />
			<name name="{{=!}}Benedikt" />
			<name name="{{=!}}Jakov" />
			<name name="{{=!}}Ilija" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_kroaten">
		<female_names>
			<name name="{{=!}}Katarina" />
			<name name="{{=!}}Margareta" />
			<name name="{{=!}}Ana" />
			<name name="{{=!}}Jelena" />
			<name name="{{=!}}Marija" />
			<name name="{{=!}}Barbara" />
			<name name="{{=!}}Doroteja" />
			<name name="{{=!}}Uršula" />
			<name name="{{=!}}Magdalena" />
			<name name="{{=!}}Klara" />
			<name name="{{=!}}Elizabeta" />
			<name name="{{=!}}Agata" />
			<name name="{{=!}}Lucija" />
			<name name="{{=!}}Jela" />
			<name name="{{=!}}Mara" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_kroaten">
		<clan_names>
			<name name="{{=!}}Drašković" />
			<name name="{{=!}}Keglević" />
			<name name="{{=!}}Oršić" />
			<name name="{{=!}}Patačić" />
			<name name="{{=!}}Rattkay" />
			<name name="{{=!}}Gušić" />
			<name name="{{=!}}Vojković" />
			<name name="{{=!}}Ibrišimović" />
			<name name="{{=!}}Mesić" />
			<name name="{{=!}}Vitezović" />
			<name name="{{=!}}Jelačić" />
			<name name="{{=!}}Kušević" />
		</clan_names>
	</xsl:template>
	<!-- Ragusaner: neue Kultur 'ragusa' als Kopie von 'empire' (data/kulturen/ragusaner.toml) -->
	<xsl:template match="Culture" mode="balkan_ragusaner">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">ragusa</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_ragusaner}Ragusans</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_ragusaner_text}The Republic of Ragusa keeps its freedom with gold rather than steel. Its merchant fleet trades from the Levant to Spain, and every year its envoys carry tribute to the Sultan. Behind the great walls of the city a small guard of halberdiers and arquebusiers serves the Rector, who changes every month so that no man may rule alone.</xsl:attribute>
			<xsl:attribute name="color">0xffF2EFE6</xsl:attribute>
			<xsl:attribute name="color2">0xff1F3E8C</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_ra_recruit</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_ra_patrician</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_ra_militia_halberdier</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_ra_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_ra_militia_veteran_halberdier</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_ra_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_ragusaner</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_ragusaner</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_ragusaner" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_ragusaner">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_ragusaner" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_ragusaner">
		<male_names>
			<name name="{{=!}}Marin" />
			<name name="{{=!}}Nikola" />
			<name name="{{=!}}Frano" />
			<name name="{{=!}}Ivan" />
			<name name="{{=!}}Miho" />
			<name name="{{=!}}Vlaho" />
			<name name="{{=!}}Luko" />
			<name name="{{=!}}Pavao" />
			<name name="{{=!}}Ivo" />
			<name name="{{=!}}Jakov" />
			<name name="{{=!}}Šimun" />
			<name name="{{=!}}Orsat" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_ragusaner">
		<female_names>
			<name name="{{=!}}Mara" />
			<name name="{{=!}}Nika" />
			<name name="{{=!}}Kata" />
			<name name="{{=!}}Anica" />
			<name name="{{=!}}Paula" />
			<name name="{{=!}}Frana" />
			<name name="{{=!}}Lucija" />
			<name name="{{=!}}Marija" />
			<name name="{{=!}}Dešica" />
			<name name="{{=!}}Jela" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_ragusaner">
		<clan_names>
			<name name="{{=!}}Gozze" />
			<name name="{{=!}}Sorgo" />
			<name name="{{=!}}Bona" />
			<name name="{{=!}}Ghetaldi" />
			<name name="{{=!}}Gradi" />
			<name name="{{=!}}Pozza" />
			<name name="{{=!}}Caboga" />
			<name name="{{=!}}Menze" />
			<name name="{{=!}}Zamagna" />
			<name name="{{=!}}Ragnina" />
		</clan_names>
	</xsl:template>
	<!-- Serben: neue Kultur 'serbs' als Kopie von 'sturgia' (data/kulturen/serben.toml) -->
	<xsl:template match="Culture" mode="balkan_serben">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">serbs</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_serben}Serbs</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_serben_text}In 1690 tens of thousands of Serbs crossed the Sava and the Danube with their patriarch and settled on the Habsburg frontier, where they serve as border soldiers in return for land and freedom of faith. Others stayed under the Sultan or took service with Venice. Their hajduks and hussars are feared on every side of the border.</xsl:attribute>
			<xsl:attribute name="color">0xff8E1B1B</xsl:attribute>
			<xsl:attribute name="color2">0xff2F4F8F</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_sr_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_sr_plemic</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_sr_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_sr_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_sr_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_sr_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_serben</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_serben</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_serben" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_serben">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_serben" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_serben">
		<male_names>
			<name name="{{=!}}Stojan" />
			<name name="{{=!}}Ilija" />
			<name name="{{=!}}Jovan" />
			<name name="{{=!}}Đorđe" />
			<name name="{{=!}}Petar" />
			<name name="{{=!}}Nikola" />
			<name name="{{=!}}Vuk" />
			<name name="{{=!}}Radoslav" />
			<name name="{{=!}}Dragutin" />
			<name name="{{=!}}Miloš" />
			<name name="{{=!}}Stefan" />
			<name name="{{=!}}Arsenije" />
			<name name="{{=!}}Sava" />
			<name name="{{=!}}Lazar" />
			<name name="{{=!}}Marko" />
			<name name="{{=!}}Vukašin" />
			<name name="{{=!}}Novak" />
			<name name="{{=!}}Radovan" />
			<name name="{{=!}}Bogdan" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_serben">
		<female_names>
			<name name="{{=!}}Jelena" />
			<name name="{{=!}}Milica" />
			<name name="{{=!}}Ana" />
			<name name="{{=!}}Mara" />
			<name name="{{=!}}Jovana" />
			<name name="{{=!}}Stana" />
			<name name="{{=!}}Danica" />
			<name name="{{=!}}Vukosava" />
			<name name="{{=!}}Anđelija" />
			<name name="{{=!}}Jela" />
			<name name="{{=!}}Smiljana" />
			<name name="{{=!}}Desanka" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_serben">
		<clan_names>
			<name name="{{=!}}Janković" />
			<name name="{{=!}}Smiljanić" />
			<name name="{{=!}}Mitrović" />
			<name name="{{=!}}Desnica" />
			<name name="{{=!}}Rajačić" />
			<name name="{{=!}}Branković" />
			<name name="{{=!}}Popović" />
			<name name="{{=!}}Kosović" />
			<name name="{{=!}}Vukmirović" />
		</clan_names>
	</xsl:template>
	<!-- Türken: neue Kultur 'turks' als Kopie von 'aserai' (data/kulturen/tuerken.toml) -->
	<xsl:template match="Culture" mode="balkan_tuerken">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">turks</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_tuerken}Turks</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_tuerken_text}Turkish settlers, officials and soldiers have lived in the Balkan towns since the conquest. The Janissaries, the Sultan's standing infantry, are the most famous musketeers of the empire, while the sipahis hold their land in return for service on horseback.</xsl:attribute>
			<xsl:attribute name="color">0xffB3141C</xsl:attribute>
			<xsl:attribute name="color2">0xffF4F1E8</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_tr_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_tr_timarli_sipahi</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_tr_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_tr_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_tr_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_tr_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_tuerken</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_tuerken</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_tuerken" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_tuerken">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_tuerken" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_tuerken">
		<male_names>
			<name name="{{=!}}Mehmed" />
			<name name="{{=!}}Ahmed" />
			<name name="{{=!}}Mustafa" />
			<name name="{{=!}}Süleyman" />
			<name name="{{=!}}Hüseyin" />
			<name name="{{=!}}Hasan" />
			<name name="{{=!}}İbrahim" />
			<name name="{{=!}}Osman" />
			<name name="{{=!}}Murad" />
			<name name="{{=!}}Selim" />
			<name name="{{=!}}Bayezid" />
			<name name="{{=!}}Ömer" />
			<name name="{{=!}}Yusuf" />
			<name name="{{=!}}Abdullah" />
			<name name="{{=!}}Halil" />
			<name name="{{=!}}Rüstem" />
			<name name="{{=!}}Kasım" />
			<name name="{{=!}}Sinan" />
			<name name="{{=!}}Ferhad" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_tuerken">
		<female_names>
			<name name="{{=!}}Fatma" />
			<name name="{{=!}}Ayşe" />
			<name name="{{=!}}Hatice" />
			<name name="{{=!}}Emine" />
			<name name="{{=!}}Zeynep" />
			<name name="{{=!}}Rabia" />
			<name name="{{=!}}Hafsa" />
			<name name="{{=!}}Safiye" />
			<name name="{{=!}}Gülbahar" />
			<name name="{{=!}}Mihrimah" />
			<name name="{{=!}}Hümaşah" />
			<name name="{{=!}}Saliha" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_tuerken">
		<clan_names>
			<name name="{{=!}}Köprülü" />
			<name name="{{=!}}Sokollu" />
			<name name="{{=!}}Daltaban" />
			<name name="{{=!}}Kalaylıkoz" />
			<name name="{{=!}}Elmas" />
			<name name="{{=!}}Topal" />
			<name name="{{=!}}Gazi" />
			<name name="{{=!}}Tekeli" />
		</clan_names>
	</xsl:template>
	<!-- Ungarn: neue Kultur 'hungarians' als Kopie von 'vlandia' (data/kulturen/ungarn.toml) -->
	<xsl:template match="Culture" mode="balkan_ungarn">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">hungarians</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_ungarn}Hungarians</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_ungarn_text}After a century and a half of war the Hungarian plains are slowly filling with people again. The hajdús, once cattle drovers, fight on foot with musket and sabre, and the light hussars of the Hungarian nobility have become famous in every army of Europe.</xsl:attribute>
			<xsl:attribute name="color">0xff2E6B30</xsl:attribute>
			<xsl:attribute name="color2">0xffD8263A</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_hu_peasant</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_hu_nemes</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_hu_militia_spearman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_hu_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_hu_militia_veteran_spearman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_hu_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_ungarn</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_ungarn</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_ungarn" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_ungarn">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_ungarn" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_ungarn">
		<male_names>
			<name name="{{=!}}János" />
			<name name="{{=!}}István" />
			<name name="{{=!}}Miklós" />
			<name name="{{=!}}Ferenc" />
			<name name="{{=!}}György" />
			<name name="{{=!}}Péter" />
			<name name="{{=!}}Pál" />
			<name name="{{=!}}Ádám" />
			<name name="{{=!}}László" />
			<name name="{{=!}}Mihály" />
			<name name="{{=!}}Imre" />
			<name name="{{=!}}Gábor" />
			<name name="{{=!}}Zsigmond" />
			<name name="{{=!}}Kristóf" />
			<name name="{{=!}}Tamás" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_ungarn">
		<female_names>
			<name name="{{=!}}Katalin" />
			<name name="{{=!}}Erzsébet" />
			<name name="{{=!}}Ilona" />
			<name name="{{=!}}Zsófia" />
			<name name="{{=!}}Anna" />
			<name name="{{=!}}Mária" />
			<name name="{{=!}}Borbála" />
			<name name="{{=!}}Judit" />
			<name name="{{=!}}Krisztina" />
			<name name="{{=!}}Orsolya" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_ungarn">
		<clan_names>
			<name name="{{=!}}Batthyány" />
			<name name="{{=!}}Erdődy" />
			<name name="{{=!}}Pálffy" />
			<name name="{{=!}}Esterházy" />
			<name name="{{=!}}Nádasdy" />
			<name name="{{=!}}Zichy" />
			<name name="{{=!}}Forgách" />
			<name name="{{=!}}Széchényi" />
		</clan_names>
	</xsl:template>
	<!-- Venezianer: neue Kultur 'venice' als Kopie von 'empire' (data/kulturen/venezianer.toml) -->
	<xsl:template match="Culture" mode="balkan_venezianer">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="id">venice</xsl:attribute>
			<xsl:attribute name="is_main_culture">false</xsl:attribute>
			<xsl:attribute name="name">{=balkan_culture_venezianer}Venetians</xsl:attribute>
			<xsl:attribute name="text">{=balkan_culture_venezianer_text}The Most Serene Republic of Venice rules the Adriatic from its lagoon. Along the Dalmatian coast its provveditori govern walled ports filled with merchants, sailors and soldiers. Italian pikemen and musketeers hold the walls, while Dalmatian schiavoni and Albanian cappelletti fight the war of raids in the hinterland.</xsl:attribute>
			<xsl:attribute name="color">0xff8C1C13</xsl:attribute>
			<xsl:attribute name="color2">0xffE8C547</xsl:attribute>
			<xsl:attribute name="basic_troop">NPCCharacter.balkan_ve_recruit</xsl:attribute>
			<xsl:attribute name="elite_basic_troop">NPCCharacter.balkan_ve_gentiluomo</xsl:attribute>
			<xsl:attribute name="melee_militia_troop">NPCCharacter.balkan_ve_militia_pikeman</xsl:attribute>
			<xsl:attribute name="ranged_militia_troop">NPCCharacter.balkan_ve_militia_shooter</xsl:attribute>
			<xsl:attribute name="melee_elite_militia_troop">NPCCharacter.balkan_ve_militia_veteran_pikeman</xsl:attribute>
			<xsl:attribute name="ranged_elite_militia_troop">NPCCharacter.balkan_ve_militia_veteran_shooter</xsl:attribute>
			<xsl:attribute name="default_party_template">PartyTemplate.balkan_kingdom_hero_party_venezianer</xsl:attribute>
			<xsl:attribute name="militia_party_template">PartyTemplate.balkan_militia_venezianer</xsl:attribute>
			<xsl:apply-templates select="node()" mode="balkan_venezianer" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*|node()" mode="balkan_venezianer">
		<xsl:copy><xsl:apply-templates select="@*|node()" mode="balkan_venezianer" /></xsl:copy>
	</xsl:template>
	<xsl:template match="male_names" mode="balkan_venezianer">
		<male_names>
			<name name="{{=!}}Alvise" />
			<name name="{{=!}}Francesco" />
			<name name="{{=!}}Girolamo" />
			<name name="{{=!}}Marco" />
			<name name="{{=!}}Pietro" />
			<name name="{{=!}}Giovanni" />
			<name name="{{=!}}Lorenzo" />
			<name name="{{=!}}Andrea" />
			<name name="{{=!}}Nicolò" />
			<name name="{{=!}}Zuane" />
			<name name="{{=!}}Antonio" />
			<name name="{{=!}}Domenico" />
			<name name="{{=!}}Giacomo" />
			<name name="{{=!}}Leonardo" />
			<name name="{{=!}}Sebastiano" />
			<name name="{{=!}}Bernardo" />
			<name name="{{=!}}Daniele" />
			<name name="{{=!}}Vettor" />
		</male_names>
	</xsl:template>
	<xsl:template match="female_names" mode="balkan_venezianer">
		<female_names>
			<name name="{{=!}}Elena" />
			<name name="{{=!}}Lucia" />
			<name name="{{=!}}Caterina" />
			<name name="{{=!}}Isabella" />
			<name name="{{=!}}Chiara" />
			<name name="{{=!}}Laura" />
			<name name="{{=!}}Cecilia" />
			<name name="{{=!}}Paolina" />
			<name name="{{=!}}Marietta" />
			<name name="{{=!}}Elisabetta" />
			<name name="{{=!}}Orsola" />
			<name name="{{=!}}Benedetta" />
		</female_names>
	</xsl:template>
	<xsl:template match="clan_names" mode="balkan_venezianer">
		<clan_names>
			<name name="{{=!}}Mocenigo" />
			<name name="{{=!}}Cornaro" />
			<name name="{{=!}}Morosini" />
			<name name="{{=!}}Contarini" />
			<name name="{{=!}}Foscolo" />
			<name name="{{=!}}Grimani" />
			<name name="{{=!}}Loredan" />
			<name name="{{=!}}Pisani" />
			<name name="{{=!}}Venier" />
			<name name="{{=!}}Dolfin" />
			<name name="{{=!}}Fanfogna" />
			<name name="{{=!}}Garagnin" />
		</clan_names>
	</xsl:template>
</xsl:stylesheet>
