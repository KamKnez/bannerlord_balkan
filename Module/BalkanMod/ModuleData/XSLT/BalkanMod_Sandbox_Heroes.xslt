<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Habsburgermonarchie (data/reiche/habsburger.toml) -->
	<xsl:template match="Hero[@id='lord_4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="text">{=balkan_hero_lord_4_1_text}Adam Batthyány is Ban of Croatia. He has been Ban since 1693, fought in the Great Turkish War and now has to secure what was won.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_10']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_13']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_14']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_141']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_15']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_11']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_9']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_12']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_121']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_16']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_16_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_17']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_18']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_181']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_19']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_25']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_25_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_21']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_20']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_20_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_22']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_22_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_23']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_23_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_23_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_23_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_24']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_24_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_24_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_24_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_24_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_26']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_26_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_27']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_27_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_V9_u']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_28']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_28_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_4_28_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_V11_l']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_V11_u']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_V11_c1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_V11_c2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Osmanisches Reich (data/reiche/osmanen.toml) -->
	<xsl:template match="Hero[@id='lord_3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="text">{=balkan_hero_lord_3_1_text}Halil Pasha, called Köse, governs the Eyalet of Bosnia in the name of the Sultan. Whether he keeps the post depends on Istanbul.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_10']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_13']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_13_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_13_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='dead_lord_3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_11']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_51']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_12']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_20']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_20_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_20_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_9']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_14']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_14_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_15']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_15_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_15_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_16']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_16_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_17']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_17_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_17_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_21']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_21_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_18']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_18_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_18_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_18_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_18_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_19']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_19_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_19_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_19_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_23']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_23_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_22']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_22_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_22_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_22_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_3_22_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_A9_l']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_A9_s']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_A9_c']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_A9_u']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Hero[@id='lord_1_14']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_27']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_27_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_27_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_27_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_37']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_47']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="text">{=balkan_hero_lord_1_47_text}Vladislav Gozze is Rector of the Republic. His term is short, but the great families of the city stand behind him.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_47_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_47_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_47_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_15']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_155']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_16']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_28']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_38']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_48']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_48_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_48_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_48_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_177']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_29']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_17']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_18']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_39']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_30']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_30_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_49']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_49_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_49_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_30_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_30_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_56_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_63_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_63_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_63']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_63_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_74']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_74_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_54']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_54_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_68']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_68_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_69_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_69']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_69_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_55']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_55_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_72']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_72_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_SE8_c']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_SE9_l']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_SE9_s']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_SE9_c1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_SE9_c2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Venedig (data/reiche/venedig.toml) -->
	<xsl:template match="Hero[@id='lord_1_7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="text">{=balkan_hero_lord_1_7_text}Alvise Mocenigo is Provveditore Generale of Dalmatia and Albania. He has governed the province since 1696 on behalf of the Republic.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_75']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_34']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_24']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_44']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_9']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_10']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_35']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_25']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_23']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_11']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_111']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_12']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_36']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_26']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_40']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_40_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_46']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_46_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_45']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_45_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_45_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_45_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_57']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_57_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_57_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_52']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_52_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_52_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_62']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_62_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_53']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_73']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_73_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_1_71']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_WE8_c']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_WE8_u']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_WE9_l']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_WE9_u']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Hero[@id='lord_WE9_u2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
