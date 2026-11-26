<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<xsl:template match="EquipmentRoster[@culture='Culture.aserai']">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_turks')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.turks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="EquipmentRoster[@culture='Culture.empire']">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_ragusa')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_venice')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="EquipmentRoster[@culture='Culture.sturgia']">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_serbs')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="EquipmentRoster[@culture='Culture.vlandia']">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_germans')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:attribute name="id"><xsl:value-of select="concat(@id, '_balkan_hungarians')" /></xsl:attribute>
			<xsl:attribute name="culture">Culture.hungarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
