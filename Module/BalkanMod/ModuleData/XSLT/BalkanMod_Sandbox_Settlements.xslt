<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Habsburgermonarchie (data/reiche/habsburger.toml) -->
	<!-- Osmanisches Reich (data/reiche/osmanen.toml) -->
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Settlement[@id='castle_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Venedig (data/reiche/venedig.toml) -->
	<xsl:template match="Settlement[@id='castle_EW1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
