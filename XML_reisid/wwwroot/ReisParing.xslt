<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="msxsl">

	<xsl:output method="html" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">


		<table class="reisid-table" border="1">
			<tr>
				<th>Nimetus</th>
				<th>Riik</th>
				<th>Pikkus</th>
				<th>Reisihind</th>
				<th>transport</th>
			</tr>

			<xsl:for-each select="reisid/reis/suund">
				<xsl:sort select ="Pikkus" order="descending"/>
				<tr>
					<td>
						<xsl:value-of select="Nimetus"/>
					</td>
					<td>
						<xsl:value-of select="Riik"/>
					</td>
					<td>
						<xsl:value-of select="Pikkus"/>
					</td>
					<td>
						<xsl:value-of select="reisihind"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<strong>Kõik suunad:</strong>

		<h1>
			<xsl:for-each select="reisid/reis/suund">
				<xsl:value-of select="@id"/>
				<xsl:text>, </xsl:text>
			</xsl:for-each>
		</h1>

		<ul>
			<xsl:for-each select="reisid/reis/suund">

				<li>
					<xsl:attribute name="style">
						background-color: yellow;
					</xsl:attribute>

					<xsl:value-of select="concat(
                        Nimetus,
                        ', ',
                        Riik,
                        ', ',
                        Pikkus
                    )"/>

				</li>

			</xsl:for-each>
		</ul>


		<ul>
			<xsl:for-each select="reisid/reis/suund">
				<li>
					<xsl:value-of select ="concat(Nimetus, ',', Pikkus, Päeva)"/>
					<xsl:if test="Pikkus = 7">
						- Pikkus reis
						<strong> - Pikk reis</strong>
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>


		<xsl:for-each select="//suund">
			<xsl:value-of select="sum(reisihind)"/>
			- kogu sum
			<br></br>
			
		</xsl:for-each>
		Transport
<ul>
		<xsl:for-each select="reisid/reis/suund">
			<xsl:if test="transport = 'bus'">
				<li>
					<xsl:value-of select="Riik"/>
				</li>
			</xsl:if>
		</xsl:for-each>
	</ul>
		<ul>
		<strong>Sorteeri reisid</strong>
		<xsl:for-each select="reisid/reis/suund">
			<xsl:sort select ="Pikkus" order="descending"/>
			<li>
			<xsl:value-of select ="concat(Nimetus, ', ', Riik, ', ', Hind, ', ', Pikkus)"/>
			</li>
		</xsl:for-each>
		</ul>
		

	</xsl:template>

</xsl:stylesheet>
