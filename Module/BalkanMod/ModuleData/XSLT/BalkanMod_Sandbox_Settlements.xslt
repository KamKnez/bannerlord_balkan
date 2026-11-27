<?xml version="1.0" encoding="utf-8"?>
<!-- Erzeugt von tools/gen_content.py aus data/. Nicht von Hand ändern. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy><xsl:apply-templates select="@*|node()" /></xsl:copy>
	</xsl:template>
	<!-- Habsburgermonarchie (data/reiche/habsburger.toml) -->
	<xsl:template match="Settlement[@id='town_V1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Zagreb</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V1_text}Zagreb is two towns on two hills above the Sava: the bishop's Kaptol and the free royal town of Gradec. Here the Croatian Sabor meets and the Ban holds court.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Osijek</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V2_text}Osijek on the Drava was taken from the Ottomans in 1687. The great wooden bridge of Suleiman across the marshes burned in the war, and the imperial engineers plan a new fortress.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Varaždin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V3_text}Varaždin with its old moated castle is the seat of the Varaždin Generalate, which commands the Slavonian frontier against the Turks. Its burghers trade in wine, cloth and grain.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ljubljana</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V5_text}Ljubljana, called Laibach by the Germans, is the capital of the Duchy of Carniola. Baroque churches rise under the castle hill on the Ljubljanica.</xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Karlovac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V6_text}Karlovac is a six-pointed star fortress, built in 1579 where four rivers meet. It is the seat of the Karlovac Generalate and the heart of the Military Frontier.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Wien</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V7_text}Wien, Vienna, is the residence of Emperor Leopold I. In 1683 the city withstood the Ottoman siege. Count Ernst Rüdiger von Starhemberg commanded its defence with fewer than 20,000 men.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Graz</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V8_text}Graz is the capital of Inner Austria. From its great armoury, muskets, pikes and armour go south to the garrisons of the frontier.</xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pécs</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V9_text}Pécs was retaken in 1686. Its domed mosques are being turned into churches, and the old Hungarian bishopric is slowly rising again.</xsl:attribute>
			<xsl:attribute name="culture">Culture.hungarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Brod</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V1_text}Brod watches the ford over the Sava. On the far bank lies Ottoman Bosnia, and the frontier guards never leave the river unwatched.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Senj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V2_text}Senj on the Adriatic was home to the Uskoks, raiders who fought the Ottomans and plundered Venetian ships alike. The Nehaj fortress still towers over the windswept harbour.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Požega</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V3_text}For a century and a half Požega was the seat of an Ottoman sanjak. On 12 March 1688 its citizens, led by the friar Luka Ibrišimović, freed the town. The Ottomans retook it in 1690 and held it for one more year.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sisak</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V4_text}The triangular fortress of Sisak guards the meeting of the Kupa and the Sava. In 1593 the Ottoman army was crushed beneath its walls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Koprivnica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V5_text}Koprivnica is a Renaissance fortress of earthworks and bastions in the Podravina, part of the frontier line along the Drava.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Buda</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V6_text}Buda, the former capital of Hungary, was taken by the Holy League in 1686 after 145 years under Ottoman rule. The royal palace was destroyed in the great siege, and many buildings burned and collapsed.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pressburg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V7_text}Pressburg has been the capital of Royal Hungary since 1536. The kings and queens of Hungary are crowned in St Martin's Cathedral, and the Hungarian Diet meets in the town.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Klausenburg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V8_text}Klausenburg in Transylvania was settled by large groups of Transylvanian Saxons in the Middle Ages, and Hungarians form the majority of its people. Imperial troops occupied the town in 1687, and with the Peace of Karlowitz in 1699 it became part of the Habsburg monarchy.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Županja</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V1_1_text}Županja is a village near Brod. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Krivi Put</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V2_1_text}Krivi Put lies in the countryside of Senj. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jablanac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V2_2_text}Jablanac belongs to the lands of Senj. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pleternica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V3_1_text}Pleternica is a village near Požega. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kutjevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V3_2_text}Kutjevo lies in the countryside of Požega. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Petrinja</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V4_1_text}Petrinja belongs to the lands of Sisak. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Đurđevac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V5_1_text}Đurđevac is a village near Koprivnica. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Drnje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V5_2_text}Drnje lies in the countryside of Koprivnica. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Óbuda</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V6_1_text}Óbuda belongs to the lands of Buda. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vác</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V6_2_text}Vác is a village near Buda. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Theben</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V7_1_text}Theben lies in the countryside of Pressburg. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sankt Georgen</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V7_2_text}Sankt Georgen belongs to the lands of Pressburg. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Torda</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V8_1_text}Torda is a village near Klausenburg. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gilău</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V8_2_text}Gilău lies in the countryside of Klausenburg. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sesvete</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V1_1_text}Sesvete belongs to the lands of Zagreb. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Samobor</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V1_2_text}Samobor is a village near Zagreb. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Valpovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V2_1_text}Valpovo lies in the countryside of Osijek. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:attribute name="culture">Culture.hungarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bizovac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V2_2_text}Bizovac belongs to the lands of Osijek. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Čepin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V2_3_text}Čepin is a village near Osijek. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ivanec</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V3_2_text}Ivanec lies in the countryside of Varaždin. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ludbreg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V3_3_text}Ludbreg belongs to the lands of Varaždin. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V3_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Varaždinske Toplice</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V3_4_text}Varaždinske Toplice is a village near Varaždin. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kranj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V5_1_text}Kranj lies in the countryside of Ljubljana. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vrhnika</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V5_2_text}Vrhnika belongs to the lands of Ljubljana. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Domžale</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V5_3_text}Domžale is a village near Ljubljana. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Duga Resa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V6_1_text}Duga Resa lies in the countryside of Karlovac. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ozalj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V6_2_text}Ozalj belongs to the lands of Karlovac. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Draganić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V6_3_text}Draganić is a village near Karlovac. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Netretić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V6_4_text}Netretić lies in the countryside of Karlovac. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Schwechat</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V7_1_text}Schwechat belongs to the lands of Wien. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Klosterneuburg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V7_2_text}Klosterneuburg is a village near Wien. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Leibnitz</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_1_text}Leibnitz lies in the countryside of Graz. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Voitsberg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_2_text}Voitsberg belongs to the lands of Graz. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gleisdorf</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_3_text}Gleisdorf is a village near Graz. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:attribute name="culture">Culture.germans</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mohács</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V9_1_text}Mohács lies in the countryside of Pécs. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:attribute name="culture">Culture.hungarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Siklós</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V9_2_text}Siklós belongs to the lands of Pécs. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:attribute name="culture">Culture.hungarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V1_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V7_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.sheep_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.vineyard</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V6_3']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.cattle_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V7_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.vineyard</xsl:attribute>
	</xsl:template>
	<!-- Osmanisches Reich (data/reiche/osmanen.toml) -->
	<xsl:template match="Settlement[@id='town_A1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sarajevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A1_text}Sarajevo, founded by Isa-beg in the valley of the Miljacka, is the jewel of Bosnia, with the mosque, bazaar and baths of Gazi Husrev-beg. In 1697 Prince Eugene burned it, and its people are still rebuilding.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Beograd</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A2_text}Belgrade's fortress stands where the Sava meets the Danube. It changed hands in 1688 and again in 1690, and it remains the gate of the Ottoman Balkans.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sofia</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A3_text}Sofia has been the capital of the Rumelia Eyalet since 1530. Three mountain passes lead to the city, and they have been key roads since antiquity.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Saloniki</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A4_text}In Saloniki the Jews are the majority. In 1613 they made up 68 per cent of the population. A sultan chose the Jews of the city to be the exclusive makers of the uniforms of the janissaries.</xsl:attribute>
			<xsl:attribute name="culture">Culture.greeks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Edirne</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A5_text}Edirne was the capital of the Ottoman Empire from the 1360s until 1453. The Selimiye Mosque, designed by Mimar Sinan and built in 1575, stands here. Sultan Mehmed IV, called the Hunter, withdrew to Edirne after he was deposed and died here in 1693.</xsl:attribute>
			<xsl:attribute name="culture">Culture.turks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Banja Luka</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A6_text}Banja Luka grew around the Ferhadija mosque of Ferhad Pasha. It guards the Vrbas valley and the northern border of the province.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mostar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A7_text}Mostar is the heart of Herzegovina. Its stone bridge, built in 1566, spans the green Neretva in a single bold arch.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Travnik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A8_text}Travnik in the Lašva valley is to become the new seat of the vizier of Bosnia now that Sarajevo has burned. Until his konak is ready, the begs of the town keep it for him. Couriers, merchants and petitioners crowd its streets.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bihać</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A1_text}Bihać is the northwestern bulwark of the empire, taken in 1592. In 1697 it threw back a Habsburg siege, and its captains watch Croatia day and night.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Novi Pazar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A2_text}Novi Pazar became a rich market town at the crossroads of the routes from Dubrovnik, Niš, Sofia, Istanbul, Salonica, Sarajevo and Belgrade. The Austrian army captured it at the end of 1689, before the Ottomans won the region back.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Niš</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A3_text}The Austrian army took Niš in 1689 after defeating the Ottomans in the battle of Niš on 24 September. The Ottomans retook the town the following year, after the Austrians had abandoned it.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jajce</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A4_text}Jajce, the old royal town of Bosnia, stands above the waterfall where the Pliva falls into the Vrbas.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Skopje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A5_text}On the order of General Piccolomini, Skopje was set on fire in October 1689. Only stone buildings such as the fortress and some churches and mosques remained relatively undamaged. The population fell from about 60,000 to about 10,000, and the town lost its importance as a trading centre.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Plowdiw</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A6_text}Plowdiw, which the Ottomans call Filibe, has grown on seven hills on both banks of the Maritsa. It is one of the important nodes of trade and transport in the Ottoman Balkans.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tuzla</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A7_text}Tuzla takes its name from tuzla, the Ottoman Turkish word for a salt mine. In the Middle Ages the place was called Soli, which means salts. Its salt deposits are mined for export and are a large source of tax revenue for the Ottomans.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vidin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A8_text}Vidin with its fortress Baba Vida fell under Austrian occupation in October 1689. The occupation lasted nine months and ended in August 1690. The Ottomans use Baba Vida as a weapon store and a prison.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Temeschwar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A9_text}Temeschwar is the administrative centre of the Ottoman province of Temeşvar. Its fortress was raised on swampy land near the Bega and is protected by water trenches around the walls. An imperial siege in 1696 failed, and the Peace of Karlowitz of 1699 left the province with the Ottomans.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Cazin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A1_1_text}Cazin is a village near Bihać. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ostrožac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A1_2_text}Ostrožac lies in the lands of Bihać. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sjenica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A2_1_text}Sjenica belongs to the district of Novi Pazar. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Raška</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A2_2_text}Raška is a village near Novi Pazar. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Aleksinac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A3_1_text}Aleksinac lies in the lands of Niš. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pirot</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A3_2_text}Pirot belongs to the district of Niš. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Varcar Vakuf</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A4_1_text}Varcar Vakuf is a village near Jajce. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šipovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A4_2_text}Šipovo lies in the lands of Jajce. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tetovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A5_1_text}Tetovo belongs to the district of Skopje. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kumanovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A5_2_text}Kumanovo is a village near Skopje. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Assenowgrad</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A6_1_text}Assenowgrad lies in the lands of Plowdiw. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pasardschik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A6_2_text}Pasardschik belongs to the district of Plowdiw. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gračanica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A7_1_text}Gračanica is a village near Tuzla. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lukavac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A7_2_text}Lukavac lies in the lands of Tuzla. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Belogradtschik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A8_1_text}Belogradtschik belongs to the district of Vidin. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lom</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A8_2_text}Lom is a village near Vidin. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lugosch</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A9_1_text}Lugosch lies in the lands of Temeschwar. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lippa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A9_2_text}Lippa belongs to the district of Temeschwar. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ilidža</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A1_1_text}Ilidža is a village near Sarajevo. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vogošća</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A1_2_text}Vogošća lies in the lands of Sarajevo. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Hadžići</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A1_4_text}Hadžići belongs to the district of Sarajevo. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Grocka</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A2_2_text}Grocka is a village near Beograd. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Smederevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A2_3_text}Smederevo lies in the lands of Beograd. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bojana</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A3_1_text}Bojana belongs to the district of Sofia. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Samokow</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A3_3_text}Samokow is a village near Sofia. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.bulgarians</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Langadas</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_1_text}Langadas lies in the lands of Saloniki. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:attribute name="culture">Culture.greeks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Chalkidona</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_2_text}Chalkidona belongs to the district of Saloniki. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.greeks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kalamaria</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_4_text}Kalamaria is a village near Saloniki. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.greeks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Havsa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_1_text}Havsa lies in the lands of Edirne. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:attribute name="culture">Culture.turks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lüleburgaz</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_2_text}Lüleburgaz belongs to the district of Edirne. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:attribute name="culture">Culture.turks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Uzunköprü</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_3_text}Uzunköprü is a village near Edirne. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.turks</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Laktaši</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A6_1_text}Laktaši lies in the lands of Banja Luka. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kotor Varoš</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A6_2_text}Kotor Varoš belongs to the district of Banja Luka. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Čelinac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A6_3_text}Čelinac is a village near Banja Luka. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A6_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Prnjavor</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A6_4_text}Prnjavor lies in the lands of Banja Luka. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Blagaj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A7_2_text}Blagaj belongs to the district of Mostar. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A7_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Buna</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A7_3_text}Buna is a village near Mostar. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A7_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Žitomislić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A7_4_text}Žitomislić lies in the lands of Mostar. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vitez</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A8_1_text}Vitez belongs to the district of Travnik. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Busovača</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A8_2_text}Busovača is a village near Travnik. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A1_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.sheep_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A2_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A3_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A4_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A4_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A5_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A6_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A8_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A1_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.cattle_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A1_4']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A2_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A2_3']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.wheat_farm</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A7_2']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.europe_horse_ranch</xsl:attribute>
	</xsl:template>
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Settlement[@id='castle_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Nikšić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES1_text}Nikšić, the old Onogošt, lies at the heart of the wide Nikšić field. The Ottomans took control of Onogošt in 1465, and between 1695 and 1703 mosques were built in the town.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Cetinje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES2_text}The monastery of Cetinje is the seat of the Metropolitan of Montenegro. It was devastated in 1692, when the retreating Venetians mined it with a time bomb. Metropolitan Danilo had it rebuilt between 1701 and 1704.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ston</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES3_text}Ston guards the neck of the Pelješac peninsula with miles of walls. Its salt pans are among the Republic's richest treasures.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES4_text}Old Bar stands on a hilltop at the foot of Mount Rumija and overlooks the Adriatic Sea. Near the town grows an olive tree that is said to be more than 2,000 years old.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ulcinj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES5_text}Ulcinj is known as a base for piracy and remained a pirate haven even after the Ottoman conquest of 1571. At the end of the 16th century about 400 pirates from Malta, Tunisia and Algeria were based here.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vlorë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES6_text}The Venetians captured Vlorë in September 1690, and in 1691 the town was restored to the Ottomans. The surrounding region yields bitumen and salt, and nearby Selenica is well known for its bitumen mines.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Berat</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES7_text}The name of Berat means White City. Its castle is built on a rocky hill on the right bank of the river Osum. Because of the way its houses are stacked on the slope, it is called the town of one window above the other.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Arta</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES8_text}Arta lies on the river Arachthos. The church of the Parigoritissa was built in about 1290 by Despot Nikephoros I Komnenos Doukas. The stone bridge of Arta in its present form is probably an Ottoman work of the 17th century.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ohrid</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES1_text}Ohrid lies on the shore of Lake Ohrid and is the seat of an archbishopric. According to a legend recorded by the traveller Evliya Çelebi, the town once had 365 churches.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Skadar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES2_text}Skadar lies where the lake of Skadar flows out into the river Bojana. Rozafa Castle rises imposingly on a rocky hill, and a market has been held here from the earliest times.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gjirokastër</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES3_text}Gjirokastër lies in a valley between the Gjerë mountains and the river Drino. The town is overlooked by its fortress.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Dubrovnik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES4_text}Dubrovnik, the Republic of Ragusa, lives behind its great walls under the word Libertas. Its Rector changes every month, its ships sail every sea, and its tribute to the Sultan buys peace. The city is still recovering from the great earthquake of 1667.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Durrës</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES5_text}In Roman times the Via Egnatia started in Durrës. Under the Ottomans its importance declined greatly and it became a den of piracy. The traveller Evliya Çelebi counted about 150 houses here in 1670. The harbour is gradually silting up, but since the late 17th century the town has begun to recover.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Janina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES6_text}Janina lies on the western shore of Lake Pamvotis. In the late 17th century it is a thriving town whose merchants trade with Venice and Livorno. The Epiphaniou School was founded here in 1647 and the Gioumeios School in 1676.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Prizren</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES7_text}Prizren has grown below its fortress along the river Bistrica, between the foothills of the Šar mountains. An Ottoman register of 1591 lists a quarter of the leatherworkers with 34 homes.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Grahovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES1_1_text}Grahovo is a village near Nikšić. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Njeguši</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES2_1_text}Njeguši is a village near Cetinje. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Rijeka Crnojevića</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES2_2_text}Rijeka Crnojevića lies in the lands of Cetinje. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Žuljana</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES3_1_text}Žuljana is a village near Ston. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Prapratno</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES3_2_text}Prapratno lies in the lands of Ston. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sutomore</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES4_1_text}Sutomore is a village near Bar. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Virpazar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES4_2_text}Virpazar lies in the lands of Bar. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šas</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES5_1_text}Šas is a village near Ulcinj. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kaninë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES6_1_text}Kaninë is a village near Vlorë. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kuçovë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES7_1_text}Kuçovë is a village near Berat. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Filippiada</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES8_1_text}Filippiada is a village near Arta. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šavnik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES1_2_text}Šavnik lies in the lands of Nikšić. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Struga</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_2_text}Struga is a village near Ohrid. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Resen</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_3_text}Resen lies in the lands of Ohrid. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Peštani</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_4_text}Peštani is a village near Ohrid. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vladimir</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES5_2_text}Vladimir lies in the lands of Ulcinj. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Drisht</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_2_text}Drisht lies in the lands of Skadar. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Koplik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_3_text}Koplik is a village near Skadar. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vau i Dejës</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_4_text}Vau i Dejës lies in the lands of Skadar. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Libohovë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_1_text}Libohovë is a village near Gjirokastër. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tepelenë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_2_text}Tepelenë lies in the lands of Gjirokastër. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Delvinë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_3_text}Delvinë is a village near Gjirokastër. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gruž</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES4_1_text}Gruž lies in the lands of Dubrovnik. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Peta</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES8_2_text}Peta lies in the lands of Arta. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lapad</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES4_3_text}Lapad is a village near Dubrovnik. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kavajë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_1_text}Kavajë lies in the lands of Durrës. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Shijak</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_2_text}Shijak is a village near Durrës. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Krujë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_3_text}Krujë lies in the lands of Durrës. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Metsovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES6_1_text}Metsovo is a village near Janina. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Zitsa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES6_2_text}Zitsa lies in the lands of Janina. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Himarë</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES6_2_text}Himarë lies in the lands of Vlorë. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Suva Reka</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES7_1_text}Suva Reka is a village near Prizren. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Orahovac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES7_2_text}Orahovac lies in the lands of Prizren. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Poliçan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES7_2_text}Poliçan lies in the lands of Berat. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Republik Venedig (data/reiche/venedig.toml) -->
	<xsl:template match="Settlement[@id='castle_EW1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Trogir</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW1_text}Trogir is a small walled town on an islet, guarded by the Kamerlengo fortress.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Udine</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW2_text}Udine has been the capital of Friuli since 1238. Venice has ruled the land since 1420 through a Luogotenente who resides in Udine. The town hall, the Loggia del Lionello, is built in the Venetian Gothic style, and the clock tower resembles the one on St Mark's Square in Venice.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Makarska</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW3_text}Makarska, a harbour below the steep wall of Biokovo, came under Venice in 1684.</xsl:attribute>
			<xsl:attribute name="culture">Culture.vlandia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Knin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW4_text}Knin was taken in 1688. Its fortress on the ridge above the Krka is the key to the Dalmatian hinterland.</xsl:attribute>
			<xsl:attribute name="culture">Culture.vlandia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pula</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW5_text}Venice has ruled Pula since 1331. War, plague, malaria and typhoid have ravaged the town. The great Roman amphitheatre and the Temple of Augustus on the forum date from its ancient past.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Patras</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW6_text}The Venetians captured Patras from the Ottomans in 1687 during the Morean War. It is the capital of Achaia, one of the four provinces of the Venetian Kingdom of the Morea.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Nauplia</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW7_text}Nauplia, in Italian Napoli di Romania, is the capital of the Venetian Kingdom of the Morea. The Venetians won it back in the Morean War. The Bourtzi, the fort in the harbour, was built by the Venetians in the 1470s.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Modon</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW8_text}Modon was an important staging point on the route between Venice and the Holy Land. It fell to the Ottomans on 9 August 1500 after a siege of 28 days. The Venetians returned under Francesco Morosini in 1686 and repaired the castle.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Venezia</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW1_text}Venezia is the capital of the Republic. Its head of state is the Doge, and the Great Council holds the legislative power. The Arsenal can build, equip and provision fleets of war galleys on a scale unmatched elsewhere in Europe.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Zadar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW2_text}Zadar is the capital of Venetian Dalmatia and the seat of the Provveditore generale. The winged lion of St Mark watches over its Land Gate.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Preveza</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW3_text}Preveza lies on the northern peninsula at the mouth of the Ambracian Gulf. The Venetians took its castle in September 1684 after a siege of eight days. At the end of the war in 1699 the town was handed back to Ottoman rule.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šibenik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW4_text}Šibenik is known for its cathedral of St James, built entirely of stone. The fortresses of St Nicholas and Barone protect it from sea and land.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kotor</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW5_text}Kotor lies at the end of a deep bay. Its walls climb the mountain behind the town, and its seafarers sail under the banner of St Mark.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Split</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW6_text}Split grew inside the palace of the emperor Diocletian. Its great lazaretto receives caravans from Bosnia, and much of the trade with the Ottoman lands passes through here.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Seget</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW1_1_text}Seget is a village near Trogir. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Cividale</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW2_1_text}Cividale lies on the coast near Udine. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Palmanova</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW2_2_text}Palmanova is a village near Udine. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tučepi</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW3_1_text}Tučepi belongs to the lands of Makarska. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Drniš</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW4_1_text}Drniš is a village near Knin. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vodnjan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW5_1_text}Vodnjan lies on the coast near Pula. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Medulin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW5_2_text}Medulin is a village near Pula. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Aigio</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW6_1_text}Aigio belongs to the lands of Patras. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Argos</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW7_1_text}Argos is a village near Nauplia. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tolo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW7_2_text}Tolo belongs to the lands of Nauplia. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Koroni</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW8_1_text}Koroni lies on the coast near Modon. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mestre</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW1_1_text}Mestre belongs to the lands of Venezia. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Chioggia</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW1_2_text}Chioggia lies on the coast near Venezia. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kalavryta</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW6_2_text}Kalavryta lies on the coast near Patras. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Baška Voda</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW3_2_text}Baška Voda lies on the coast near Makarska. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Nin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW2_2_text}Nin is a village near Zadar. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Biograd</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW2_3_text}Biograd belongs to the lands of Zadar. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW2_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Preko</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW2_4_text}Preko lies on the coast near Zadar. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kistanje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW4_2_text}Kistanje belongs to the lands of Knin. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.serbs</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Parga</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW3_2_text}Parga is a village near Preveza. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vonitsa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW3_3_text}Vonitsa belongs to the lands of Preveza. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Skradin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW4_1_text}Skradin lies on the coast near Šibenik. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Okrug</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW1_2_text}Okrug belongs to the lands of Trogir. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vodice</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW4_3_text}Vodice is a village near Šibenik. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Primošten</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW4_4_text}Primošten belongs to the lands of Šibenik. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Perast</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW5_1_text}Perast lies on the coast near Kotor. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Risan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW5_2_text}Risan is a village near Kotor. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kaštel Sućurac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW6_1_text}Kaštel Sućurac belongs to the lands of Split. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Navarino</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW8_2_text}Navarino is a village near Modon. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Solin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW6_3_text}Solin lies on the coast near Split. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW6_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Stobreč</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW6_4_text}Stobreč is a village near Split. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW4_1']/Components/Village/@village_type">
		<xsl:attribute name="village_type">VillageType.swine_farm</xsl:attribute>
	</xsl:template>
	<!-- Orte außerhalb der Mod-Reiche (data/weltkarte/orte.csv und namen.toml) -->
	<xsl:template match="Settlement[@id='castle_B1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Pescara</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Rijeka</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tarent</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ravenna</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Rimini</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Brindisi</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Lecce</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_B8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Foggia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Burgas</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tarnowo</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Rustschuk</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Larissa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Adana</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bursa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Konya</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Antalya</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EN9']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sinope</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Târgoviște</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Suceava</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Chotyn</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bender</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Akkerman</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Perekop</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Brăila</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kilija</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_K9']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tscherkassy</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Győr</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Komárom</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Esztergom</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Eger</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Großwardein</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tarnów</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Hermannstadt</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_S8']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kamieniec</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Chieti</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ortona</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Trsat</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kastav</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Massafra</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Grottaglie</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Classe</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Cervia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Cattolica</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Santarcangelo</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Mesagne</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ostuni</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Otranto</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Gallipoli</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Lucera</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_B8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Manfredonia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Pomorie</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sosopol</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Arbanassi</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Gabrowo</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Giurgiu</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tutrakan</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tyrnavos</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Trikala</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tarsus</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Misis</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Mudanya</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}İnegöl</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Meram</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sille</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Alanya</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Manavgat</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Gerze</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EN9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Boyabat</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ploiești</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Pitești</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Rădăuți</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Siret</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Czernowitz</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Schwanez</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kischinau</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Căușeni</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Owidiopol</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tatarbunar</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Armjansk</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tschaplynka</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Galatz</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Focșani</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ismail</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Wylkowe</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tschyhyryn</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_K9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kaniw</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Pannonhalma</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Moson</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tata</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Neuhäusel</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Visegrád</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Párkány</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Gyöngyös</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Miskolc</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Salonta</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Beiuș</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bochnia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Dębica</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Mediasch</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Heltau</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Żwaniec</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_S8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Dunajiwzi</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_B1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Rom</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_B2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Trieste</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_B3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ancona</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_B4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Napoli</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_B5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bari</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Istanbul</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Athen</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Smyrna</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ankara</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kütahya</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EN6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Varna</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bukarest</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Jassy</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bachtschissarai</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kaffa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kiew</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_K6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Otschakiw</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Krakau</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Lublin</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Przemyśl</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sandomierz</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S5']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Lemberg</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S6']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kaschau</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_S7']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Debrecen</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tivoli</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Ostia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Frascati</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Civitavecchia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Muggia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Koper</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Duino</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Senigallia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Loreto</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Jesi</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Pozzuoli</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Capua</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Salerno</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Aversa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Bitonto</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Monopoli</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_B5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Trani</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Galata</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Üsküdar</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Silivri</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Piräus</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Eleusis</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Manisa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Urla</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Beypazarı</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Çubuk</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Eskişehir</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Afyon</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN5_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Simav</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Baltschik</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EN6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Prowadija</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Snagov</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Oltenița</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Mogoșoaia</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Hârlău</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Huși</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Inkerman</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Mangup</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Akmescit</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sudak</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kertsch</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Karasubazar</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Wyschhorod</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Wassylkiw</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K5_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Browary</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Kinburn</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Hadschibej</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_K6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Beresan</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Wieliczka</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Olkusz</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Zamość</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Puławy</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Jarosław</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sanok</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Opatów</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S4_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tarnobrzeg</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Staszów</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Żółkiew</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Gródek</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Eperies</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Tokaj</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S6_3']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Sárospatak</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Hajdúböszörmény</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_S7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*[name() != 'text']" />
			<xsl:attribute name="name">{=!}Nyíregyháza</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<!-- Ruhesitz (ruhesitz in data/weltkarte/namen.toml) -->
	<xsl:template match="Settlement[@id='retirement_retreat']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=balkan_retreat_name}Ostrog Monastery</xsl:attribute>
			<xsl:attribute name="text">{=balkan_retreat_text}The monastery of Ostrog stands against an almost vertical wall, high up in the great rock of Ostroška Greda above the plain of the river Zeta. Vasilije, Metropolitan of Herzegovina, founded it in 1656 and died here in 1671. It is a meeting place of all confessions: Orthodox, Catholics and Muslims.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
