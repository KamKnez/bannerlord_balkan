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
			<xsl:attribute name="text">{=balkan_kingdom_vlandia_text}After the Peace of Karlowitz the Habsburgs hold Croatia and Slavonia again up to the Una and the Sava. The emperor is far away in Vienna; on the frontier the Ban of Croatia leads the nobles and the border regiments.</xsl:attribute>
			<xsl:attribute name="color">FF1A1A1A</xsl:attribute>
			<xsl:attribute name="color2">FFE8C547</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_4_1</xsl:attribute>
			<xsl:attribute name="banner_key">11.15.15.4345.4345.764.764.1.0.0.164.149.149.512.512.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xffF7BF46</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xff211f1f</xsl:attribute>
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
			<xsl:attribute name="text">{=balkan_kingdom_aserai_text}Bosnia is now the frontier province of the Ottoman Empire. The beylerbey still holds court in burned Sarajevo, though Travnik is already being readied as his new seat, and the captaincies along the Una, Sava and Drina guard the border against Habsburgs and Venetians.</xsl:attribute>
			<xsl:attribute name="color">FF9E1B1B</xsl:attribute>
			<xsl:attribute name="color2">FF1E6B3A</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_3_1</xsl:attribute>
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.1.0.0.463.172.172.466.466.764.764.1.0.0</xsl:attribute>
			<xsl:attribute name="primary_banner_color">0xffD22D33</xsl:attribute>
			<xsl:attribute name="secondary_banner_color">0xffffffff</xsl:attribute>
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
			<xsl:attribute name="text">{=balkan_kingdom_empire_s_text}Ragusa pays tribute to the Sultan and stays under the protection of the Emperor. Its noble houses take turns as Rector, and its merchants are welcome in every port from Venice to Istanbul.</xsl:attribute>
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
			<xsl:attribute name="text">{=balkan_kingdom_empire_w_text}Venice has pushed its Dalmatian border deep inland, taking Knin, Sinj and Vrlika. The coast belongs to the Lion of Saint Mark, the hinterland to Morlach captains who serve the Republic for land and pay.</xsl:attribute>
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
