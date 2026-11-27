<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Habsburgermonarchie (data/reiche/habsburger.toml) -->
	<xsl:template match="Kingdom[@id='vlandia']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_vlandia}Habsburg Monarchy</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_vlandia_short}Habsburgs</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_vlandia_title}Kingdom of Croatia-Slavonia under the Habsburg Crown</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_vlandia_ruler}Ban</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_vlandia_text}After the Great Turkish War and the Peace of Karlowitz the Habsburgs hold Croatia and Slavonia again. The emperor is far away in Vienna; at home the Ban of Croatia, his viceroy, leads the nobles of the kingdom.</xsl:attribute>
			<xsl:attribute name="color">FF1A1A1A</xsl:attribute>
			<xsl:attribute name="color2">FFE8C547</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_4_1</xsl:attribute>
			<xsl:attribute name="banner_key">11.15.15.4345.4345.764.764.1.0.0.164.149.149.512.512.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xffF7BF46</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xff211f1f</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Krim-Khanat (data/reiche/krim.toml) -->
	<xsl:template match="Kingdom[@id='khuzait']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_khuzait}Crimean Khanate</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_khuzait_short}Crimean Tatars</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_khuzait_title}Khanate of Crimea</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_khuzait_ruler}Khan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_khuzait_text}The khans of the house of Giray rule from Bahçeseray under the protection of the Ottoman Sultan, together with the beys of the clans Şirin, Barın, Arğın and Qıpçaq. The Nogai hordes of the steppe serve them as vassals. The Peace of Karlowitz in 1699 forbade further raids into the lands of their neighbours.</xsl:attribute>
			<xsl:attribute name="color">FF2B7A9E</xsl:attribute>
			<xsl:attribute name="color2">FFE8C547</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_6_1</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Königreich Neapel (data/reiche/neapel.toml) -->
	<xsl:template match="Kingdom[@id='battania']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_battania}Kingdom of Naples</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_battania_short}Neapolitans</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_battania_title}Viceroyalty of Naples under the Spanish Crown</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_battania_ruler}Viceroy</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_battania_text}Since 1504 the Kingdom of Naples, with Campania, Calabria, Apulia, Basilicata, Abruzzo and Molise, has belonged to the Spanish crown and is governed by a Spanish viceroy. Its great houses, the Carafa, Caracciolo, Pignatelli and Sanseverino, sit in the capital. In this game the kingdom also holds Rome and the cities of the Papal States on the Adriatic.</xsl:attribute>
			<xsl:attribute name="color">FFF2C230</xsl:attribute>
			<xsl:attribute name="color2">FF8B1A1A</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_5_1</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Osmanisches Reich (data/reiche/osmanen.toml) -->
	<xsl:template match="Kingdom[@id='aserai']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_aserai}Ottoman Empire</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_aserai_short}Ottomans</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_aserai_title}Eyalet of Bosnia</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_aserai_ruler}Beylerbey</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_aserai_text}After the Peace of Karlowitz Bosnia is the frontier province of the Ottoman Empire. Sarajevo was burned in the war, so the pasha's seat is moving to Travnik. Twelve captaincies, most of them along the border, guard it against Habsburgs and Venetians.</xsl:attribute>
			<xsl:attribute name="color">FF9E1B1B</xsl:attribute>
			<xsl:attribute name="color2">FF1E6B3A</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_3_1</xsl:attribute>
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.1.0.0.463.172.172.466.466.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xffD22D33</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xffffffff</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Polen-Litauen (data/reiche/polen.toml) -->
	<xsl:template match="Kingdom[@id='sturgia']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_sturgia}Polish–Lithuanian Commonwealth</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_sturgia_short}Poles</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_sturgia_title}Commonwealth of the Two Nations</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_sturgia_ruler}King</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_sturgia_text}The Commonwealth of Poland and Lithuania is an elective monarchy: its nobles elect the king for life and guard their Golden Liberty. Since the second half of the 17th century the great magnate families hold the real power, and in 1700 the Sapieha fight the other Lithuanian nobles in open civil war.</xsl:attribute>
			<xsl:attribute name="color">FFDC143C</xsl:attribute>
			<xsl:attribute name="color2">FFF4F1EA</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_2_1</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Kingdom[@id='empire_s']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_empire_s}Republic of Ragusa</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_empire_s_short}Ragusans</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_empire_s_title}Republic of Ragusa</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_empire_s_ruler}Rector</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_empire_s_text}Ragusa has paid tribute to the Sultan since 1458, and since 1684 it also stands under the protection of the Habsburg emperor. The Rector, head of the government, comes from the noble houses of the city, and the office changes hands often.</xsl:attribute>
			<xsl:attribute name="color">FFF2EFE6</xsl:attribute>
			<xsl:attribute name="color2">FF1F3E8C</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_1_47</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:attribute name="banner_key">11.33.33.4345.4345.764.764.1.0.0.162.146.146.512.512.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xffefece5</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xff2C4D86</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Venedig (data/reiche/venedig.toml) -->
	<xsl:template match="Kingdom[@id='empire_w']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_kingdom_empire_w}Republic of Venice</xsl:attribute>
			<xsl:attribute name="short_name">{=balkan_kingdom_empire_w_short}Venetians</xsl:attribute>
			<xsl:attribute name="title">{=balkan_kingdom_empire_w_title}Most Serene Republic of Venice</xsl:attribute>
			<xsl:attribute name="ruler_title">{=balkan_kingdom_empire_w_ruler}Provveditore Generale</xsl:attribute>
			<xsl:attribute name="text">{=balkan_kingdom_empire_w_text}Venice has pushed its Dalmatian border deep inland, taking Knin, Sinj and Vrlika. The coast belongs to the Lion of Saint Mark, in the hinterland Venice relies on Morlach captains who serve the Republic.</xsl:attribute>
			<xsl:attribute name="color">FF8C1C13</xsl:attribute>
			<xsl:attribute name="color2">FFE8C547</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_1_7</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:attribute name="banner_key">11.14.14.4345.4345.764.764.1.0.0.160.15.15.497.497.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xff8D291A</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xffF7BF46</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Kriege zu Spielbeginn (krieg_mit in data/reiche/) -->
	<xsl:template match="Kingdom/relationships/relationship[@kingdom='Kingdom.vlandia' or @kingdom='Kingdom.aserai' or @kingdom='Kingdom.empire_s' or @kingdom='Kingdom.empire_w']" />
	<xsl:template match="Kingdom[@id='vlandia']/relationships">
		<relationships>
			<relationship kingdom="Kingdom.aserai" value="-1" isAtWar="true" />
		</relationships>
	</xsl:template>
	<xsl:template match="Kingdom[@id='aserai']/relationships">
		<relationships>
			<relationship kingdom="Kingdom.vlandia" value="-1" isAtWar="true" />
			<relationship kingdom="Kingdom.empire_w" value="-1" isAtWar="true" />
		</relationships>
	</xsl:template>
	<xsl:template match="Kingdom[@id='empire_s']/relationships">
		<relationships>
		</relationships>
	</xsl:template>
	<xsl:template match="Kingdom[@id='empire_w']/relationships">
		<relationships>
			<relationship kingdom="Kingdom.aserai" value="-1" isAtWar="true" />
		</relationships>
	</xsl:template>
</xsl:stylesheet>
