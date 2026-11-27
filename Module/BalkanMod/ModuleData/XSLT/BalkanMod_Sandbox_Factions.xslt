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
			<xsl:attribute name="banner_key">11.202.202.4345.4345.764.764.0.0.0.506.126.126.340.110.764.744.0.0.0.118.172.172.380.380.764.564.0.0.0.140.15.15.360.360.764.964.0.0.0</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.0.0.0.505.116.116.1020.1020.314.314.0.0.0.505.116.116.1020.1020.1214.1214.0.0.0.146.172.172.260.260.604.574.0.0.0.146.172.172.260.260.924.954.0.0.0.335.15.15.200.200.924.574.0.0.0.335.15.15.200.200.604.954.0.0.0.505.172.172.260.300.764.764.0.0.0.505.83.83.230.270.764.764.0.0.0.511.172.172.170.170.764.764.0.0.0</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.0.0.0.505.172.172.1600.80.764.804.0.0.0.505.172.172.1600.80.764.934.0.0.0.505.172.172.1600.80.764.1064.0.0.0.157.172.172.300.300.764.614.0.0.0.340.15.15.130.130.724.434.0.0.0</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Beširević</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Faction[@id='clan_aserai_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Hadžalić</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Krupić</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.0.0.0.505.202.202.2200.120.976.552.0.0.45.505.202.202.2200.120.806.722.0.0.45.505.202.202.2200.120.637.891.0.0.45.505.202.202.2200.120.467.1061.0.0.45</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.202.202.4345.4345.764.764.0.0.0.505.15.15.2000.50.819.709.0.0.45.505.15.15.2000.50.709.819.0.0.45.424.15.15.110.110.804.504.0.0.0.424.15.15.110.110.944.564.0.0.0.424.15.15.110.110.964.704.0.0.0.424.15.15.110.110.564.824.0.0.0.424.15.15.110.110.584.964.0.0.0.424.15.15.110.110.724.1024.0.0.0</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.83.83.4345.4345.764.764.0.0.0.505.172.172.1600.240.764.764.0.0.0</xsl:attribute>
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
			<xsl:attribute name="banner_key">11.15.15.4345.4345.764.764.0.0.0.505.202.202.1600.1020.764.1214.0.0.0.220.202.202.160.160.584.584.0.0.0.220.202.202.160.160.764.584.0.0.0.220.202.202.160.160.944.584.0.0.0.220.15.15.160.160.584.944.0.0.0.220.15.15.160.160.764.944.0.0.0.220.15.15.160.160.944.944.0.0.0</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
