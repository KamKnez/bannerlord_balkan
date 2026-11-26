<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/kulturen/. Nicht von Hand ändern. -->
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
			<xsl:apply-templates select="Culture[@id='empire']" mode="balkan_ragusaner" />
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
