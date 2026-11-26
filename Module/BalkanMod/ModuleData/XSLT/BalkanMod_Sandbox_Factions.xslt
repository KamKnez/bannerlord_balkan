<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Habsburgermonarchie (data/reiche/habsburger.toml) -->
	<xsl:template match="Faction[@id='clan_vlandia_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Batthyány</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_4_1</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Erdődy</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Drašković</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Keglević</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Oršić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Patačić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Herberstein</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Rattkay</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gušić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_10']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vojković</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_vlandia_11']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jelačić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Osmanisches Reich (data/reiche/osmanen.toml) -->
	<xsl:template match="Faction[@id='clan_aserai_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_clan_aserai_1}House of the Beylerbey</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_3_1</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Atlagić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Crnčić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Čengić</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ljubović</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sokolović</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kapetanović</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kulenović</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Predojević</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Faction[@id='clan_empire_south_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gozze</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_1_47</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sorgo</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bona</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ghetaldi</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gradi</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pozza</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Caboga</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Menze</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_south_9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Zamagna</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Venedig (data/reiche/venedig.toml) -->
	<xsl:template match="Faction[@id='clan_empire_west_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mocenigo</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:attribute name="owner">Hero.lord_1_7</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Cornaro</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Morosini</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Fanfogna</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Janković</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Contarini</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Foscolo</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Grimani</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_empire_west_9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Loredan</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
