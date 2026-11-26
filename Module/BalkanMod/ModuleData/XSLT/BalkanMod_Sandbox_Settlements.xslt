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
			<xsl:attribute name="text">{=balkan_settlement_town_V3_text}Varaždin with its old moated castle was long the seat of the Croatian Ban and of the generals of the Varaždin frontier. Its burghers trade in wine, cloth and grain.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ljubljana</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V5_text}Ljubljana, called Laibach by the Germans, is the capital of the Duchy of Carniola. Baroque churches rise under the castle hill on the Ljubljanica.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Požega</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V7_text}Požega lies in the Golden Valley of Slavonia. After a century and a half of Ottoman rule it returned to the Crown in 1688, and Franciscans and settlers are bringing the land back to life.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Graz</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V8_text}Graz is the capital of Inner Austria. From its great armoury, muskets, pikes and armour go south to the garrisons of the frontier.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_V9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pécs</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_V9_text}Pécs was retaken in 1686. Its domed mosques are being turned into churches, and the old Hungarian bishopric is slowly rising again.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Ogulin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V3_text}Ogulin's castle, built by the Frankopans, stands at the edge of the gorge where the Dobra river vanishes underground. It is the seat of a frontier captaincy.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Virovitica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V6_text}Virovitica was taken back from the Ottomans in 1684. From its walls one looks out over the flat, half-empty plain of the Drava.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Udbina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V7_text}Udbina in Krbava was an Ottoman stronghold until 1689. Since then Lika is being resettled by frontier families from all sides.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_V8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kostajnica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_V8_text}Kostajnica stands on the Una, which the Peace of Karlowitz made the border. Across the river the Ottoman watchtowers are in plain sight.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Garčin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V1_1_text}Garčin is a village near Brod. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Josipdol</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V3_1_text}Josipdol is a village near Ogulin. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Modruš</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V3_2_text}Modruš lies in the countryside of Ogulin. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Slatina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V6_1_text}Slatina belongs to the lands of Virovitica. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pitomača</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V6_2_text}Pitomača is a village near Virovitica. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Korenica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V7_1_text}Korenica lies in the countryside of Udbina. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bunić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V7_2_text}Bunić belongs to the lands of Udbina. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Dubica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V8_1_text}Dubica is a village near Kostajnica. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_V8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Majur</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_V8_2_text}Majur lies in the countryside of Kostajnica. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Pleternica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V7_1_text}Pleternica belongs to the lands of Požega. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kutjevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V7_2_text}Kutjevo is a village near Požega. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Leibnitz</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_1_text}Leibnitz lies in the countryside of Graz. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Voitsberg</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_2_text}Voitsberg belongs to the lands of Graz. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V8_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gleisdorf</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V8_3_text}Gleisdorf is a village near Graz. Its families owe service on the frontier: the men keep watch in turn, and every house keeps a musket.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mohács</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V9_1_text}Mohács lies in the countryside of Pécs. After the long war the fields are being cleared again, and new settlers arrive every spring.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_V9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Siklós</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_V9_2_text}Siklós belongs to the lands of Pécs. The villagers grow wheat and maize, keep pigs in the oak woods and pay their dues to the lord and the Church.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
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
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Foča</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A3_text}Foča on the Drina lies on the caravan road from Dubrovnik to Istanbul. Its painted Aladža mosque is famed far beyond Bosnia.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tuzla</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A4_text}Tuzla takes its name from the salt springs that have made it rich. Salt from its pans is carried across the whole of Bosnia.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_A5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Novi Pazar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_A5_text}Novi Pazar, the 'new market' founded by Isa-beg, is a trading town of the Sanjak on the high road towards Istanbul.</xsl:attribute>
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
			<xsl:attribute name="text">{=balkan_settlement_town_A8_text}Travnik in the Lašva valley has been the seat of the vizier of Bosnia since Sarajevo burned. Consuls, couriers and petitioners crowd its streets.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Stolac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A2_text}Above Stolac rises the fortress of Vidoški, guarding the roads of eastern Herzegovina.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ključ</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A3_text}Ključ on the Sana is where the last Bosnian king surrendered in 1463. Today it is a captaincy on the road to the frontier.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Počitelj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A5_text}Počitelj is a walled town that climbs the rock above the Neretva, a guard post on the road from Mostar to the sea.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Srebrenik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A6_text}Srebrenik sits on a sheer rock near Tuzla, reachable only by a narrow bridge.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Doboj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A7_text}Doboj guards the Bosna valley, the main road from the Sava into the heart of the province.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Zvornik</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A8_text}Zvornik's walls run down the hillside to the Drina. Whoever holds it controls the crossing between Bosnia and Serbia.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_A9']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Livno</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_A9_text}Livno looks out over the wide Livno field towards Venetian Dalmatia. Raiders from both sides cross the border here.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Ljubinje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A2_1_text}Ljubinje belongs to the district of Stolac. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Berkovići</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A2_2_text}Berkovići is a village near Stolac. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sanski Most</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A3_1_text}Sanski Most lies in the lands of Ključ. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Petrovac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A3_2_text}Petrovac belongs to the district of Ključ. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Čapljina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A5_1_text}Čapljina belongs to the district of Počitelj. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gabela</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A5_2_text}Gabela is a village near Počitelj. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Brčko</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A6_1_text}Brčko lies in the lands of Srebrenik. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gradačac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A6_2_text}Gradačac belongs to the district of Srebrenik. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Maglaj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A7_1_text}Maglaj is a village near Doboj. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tešanj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A7_2_text}Tešanj lies in the lands of Doboj. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Bijeljina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A8_1_text}Bijeljina belongs to the district of Zvornik. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A8_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kozluk</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A8_2_text}Kozluk is a village near Zvornik. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Duvno</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A9_1_text}Duvno lies in the lands of Livno. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_A9_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Glamoč</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_A9_2_text}Glamoč belongs to the district of Livno. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
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
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Smederevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A2_3_text}Smederevo lies in the lands of Beograd. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ustikolina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A3_1_text}Ustikolina belongs to the district of Foča. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Goražde</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A3_3_text}Goražde is a village near Foča. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lukavac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_1_text}Lukavac lies in the lands of Tuzla. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Živinice</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_2_text}Živinice belongs to the district of Tuzla. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A4_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kalesija</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A4_4_text}Kalesija is a village near Tuzla. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sjenica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_1_text}Sjenica lies in the lands of Novi Pazar. Muslim and Christian families live side by side here, and the bells and the call to prayer can both be heard.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Tutin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_2_text}Tutin belongs to the district of Novi Pazar. Its people keep orchards of plums and walnuts and sell cheese and wool at the town market.</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_A5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Raška</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_A5_3_text}Raška is a village near Novi Pazar. Its fields belong to a timar, whose sipahi rides to war when the Sultan calls.</xsl:attribute>
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
	<!-- Republik Ragusa (data/reiche/ragusa.toml) -->
	<xsl:template match="Settlement[@id='castle_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Sokol</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES1_text}Sokol, the 'falcon', sits on a crag above Konavle and guards the border with Ottoman Herzegovina.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lovrijenac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES2_text}Lovrijenac stands on a cliff outside the western walls of Dubrovnik. Over its gate is written: freedom is not sold for all the gold in the world.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Molunat</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES4_text}Molunat is a small harbour at the southern end of Konavle, the last refuge of Ragusan ships before Venetian waters.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šipan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES5_text}Šipan is the largest of the Elaphite islands, with the summer residences of Ragusan nobles and the rector's palace.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Trpanj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES6_text}Trpanj is a harbour on northern Pelješac, facing the mouth of the Neretva and the Venetian coast.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mali Ston</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES7_text}Mali Ston lies at the other end of the Ston walls, under the tower of Koruna. Its oyster beds are famous.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_ES8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Janjina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_ES8_text}Janjina watches over the middle of the Pelješac peninsula and its vineyards.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Cavtat</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES1_text}Cavtat, the ancient Epidaurum, is the harbour of the fertile Konavle valley.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Babino Polje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES2_text}Babino Polje is the seat of the Ragusan count of the island of Mljet, among forests and salt lakes.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lastovo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES3_text}Lastovo is the Republic's farthest island, a home of fishermen and a lookout far out at sea.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Lopud</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES5_text}Lopud in the Elaphite islands is the home of rich shipowners and the seat of the count of the islands.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Orebić</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES6_text}Orebić on Pelješac is a town of sea captains, facing the island of Korčula across the channel.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_ES7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Slano</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_ES7_text}Slano in a quiet bay is the seat of the count of the coastal lands, with a small rector's palace.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Dunave</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES1_1_text}Dunave is a village near Sokol. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pile</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES2_1_text}Pile is a village near Lovrijenac. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ploče</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES2_2_text}Ploče lies in the lands of Lovrijenac. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Vitaljina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES4_1_text}Vitaljina is a village near Molunat. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES4_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mrcine</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES4_2_text}Mrcine lies in the lands of Molunat. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Šipanska Luka</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES5_1_text}Šipanska Luka is a village near Šipan. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Donja Vrućica</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES6_1_text}Donja Vrućica is a village near Trpanj. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Hodilje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES7_1_text}Hodilje is a village near Mali Ston. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pijavičino</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES8_1_text}Pijavičino is a village near Janjina. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mihanići</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES1_2_text}Mihanići lies in the lands of Sokol. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Čilipi</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_2_text}Čilipi is a village near Cavtat. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Mlini</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_3_text}Mlini lies in the lands of Cavtat. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES1_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Gruda</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES1_4_text}Gruda is a village near Cavtat. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jakljan</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES5_2_text}Jakljan lies in the lands of Šipan. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Polače</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_2_text}Polače lies in the lands of Babino Polje. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Goveđari</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_3_text}Goveđari is a village near Babino Polje. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES2_4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Saplunara</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES2_4_text}Saplunara lies in the lands of Babino Polje. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Ubli</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_1_text}Ubli is a village near Lastovo. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Skrivena Luka</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_2_text}Skrivena Luka lies in the lands of Lastovo. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pasadur</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES3_3_text}Pasadur is a village near Lastovo. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Drače</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES8_2_text}Drače lies in the lands of Janjina. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Koločep</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_1_text}Koločep lies in the lands of Lopud. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Suđurađ</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_2_text}Suđurađ is a village near Lopud. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES5_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Trsteno</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES5_3_text}Trsteno lies in the lands of Lopud. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kuna</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES6_1_text}Kuna is a village near Orebić. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Potomje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES6_2_text}Potomje lies in the lands of Orebić. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Duba</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES6_2_text}Duba lies in the lands of Trpanj. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Doli</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES7_1_text}Doli is a village near Slano. Its peasants work the land of Ragusan noble families and send wine and oil to the city.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Majkovi</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_ES7_2_text}Majkovi lies in the lands of Slano. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
			<xsl:attribute name="culture">Culture.ragusa</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_ES7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Broce</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_ES7_2_text}Broce lies in the lands of Mali Ston. Many of its young men have gone to sea on Ragusan ships.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Sinj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW2_text}Sinj was taken from the Ottomans in 1686. It guards the Cetina valley, and its garrison expects the enemy to return one day.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Makarska</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW3_text}Makarska, a harbour below the steep wall of Biokovo, came under Venice in 1684.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW4']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Knin</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW4_text}Knin was taken in 1688. Its fortress on the ridge above the Krka is the key to the Dalmatian hinterland.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW5']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Novigrad</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW5_text}Novigrad guards the narrow sea of the same name, the back door to Zadar.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW6']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Klis</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW6_text}Klis holds the mountain pass above Split. It was held by the Ottomans for more than a century before Venice took it in 1648.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW7']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Omiš</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW7_text}Omiš at the mouth of the Cetina was once a nest of pirates. Today its towers watch over the gorge and the coast.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_EW8']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Vrlika</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_EW8_text}Vrlika, near the source of the Cetina, lies under the fortress of Prozor and was taken from the Ottomans in 1688.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='town_EW1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Rab</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW1_text}Rab is an island town of four bell towers. Its nobles serve Venice as officers and captains of galleys.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Hvar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_town_EW3_text}Hvar is a station of the Venetian fleet. Galleys take on water, wine and oarsmen here, under the fortress on the hill.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Trilj</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW2_1_text}Trilj lies on the coast near Sinj. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW2_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Otok</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW2_2_text}Otok is a village near Sinj. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
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
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Posedarje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW5_1_text}Posedarje lies on the coast near Novigrad. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW5_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Obrovac</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW5_2_text}Obrovac is a village near Novigrad. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Dugopolje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW6_1_text}Dugopolje belongs to the lands of Klis. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jesenice</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW7_1_text}Jesenice is a village near Omiš. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW7_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kostanje</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW7_2_text}Kostanje belongs to the lands of Omiš. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW8_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kijevo</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW8_1_text}Kijevo lies on the coast near Vrlika. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_1']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Lopar</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW1_1_text}Lopar belongs to the lands of Rab. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW1_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Pag</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW1_2_text}Pag lies on the coast near Rab. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='castle_village_EW6_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Kučine</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW6_2_text}Kučine lies on the coast near Klis. Its men fish for sardines and row in the galleys when Venice calls.</xsl:attribute>
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
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_2']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Stari Grad</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW3_2_text}Stari Grad is a village near Hvar. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
			<xsl:attribute name="culture">Culture.venice</xsl:attribute>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Settlement[@id='village_EW3_3']">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="name">{=!}Jelsa</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_village_EW3_3_text}Jelsa belongs to the lands of Hvar. Olives, wine and figs grow on its stony terraces.</xsl:attribute>
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
			<xsl:attribute name="name">{=!}Cetina</xsl:attribute>
			<xsl:attribute name="text">{=balkan_settlement_castle_village_EW8_2_text}Cetina is a village near Vrlika. Morlach families who came from Ottoman lands in the war have settled here and serve Venice as frontier soldiers.</xsl:attribute>
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
</xsl:stylesheet>
