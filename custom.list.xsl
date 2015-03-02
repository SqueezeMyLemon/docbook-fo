<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Lists                                    **          
  *********************************************** 
-->

	<xsl:template name="itemizedlist.label.markup">
	  <xsl:param name="itemsymbol" select="'solidcircle'"/>

	  <xsl:choose>
		<xsl:when test="$itemsymbol='none'"></xsl:when>
		<xsl:when test="$itemsymbol='disc'">&#x2022;</xsl:when>
		<xsl:when test="$itemsymbol='bullet'">&#x2022;</xsl:when>
		
		<xsl:when test="$itemsymbol='solidcircle'">&#x2022;</xsl:when>
		
		<xsl:when test="$itemsymbol='hollowcircle'">
			<fo:inline font-family="ArialUnicodeMS">&#x25E6;</fo:inline>	
		</xsl:when>
		
		<xsl:when test="$itemsymbol='solidsquare'">
			<fo:inline font-family="ArialUnicodeMS">&#x25A0;</fo:inline>	
		</xsl:when>
		
		<xsl:when test="$itemsymbol='hollowsquare'">
			<fo:inline font-family="ArialUnicodeMS">&#x25A1;</fo:inline>	
		</xsl:when>

		<xsl:when test="$itemsymbol='solidtriangle'">
			<fo:inline font-family="ArialUnicodeMS">&#x25B8;</fo:inline>	
		</xsl:when>
		
		<xsl:when test="$itemsymbol='hollowtriangle'">
			<fo:inline font-family="ArialUnicodeMS">&#x25B9;</fo:inline>	
		</xsl:when>
					
		<xsl:otherwise>&#x2022;</xsl:otherwise>
		
		<!-- Some of these may work in your XSL-FO processor and fonts -->
		<!--		
		<xsl:when test="$itemsymbol='solidmediumsquare'">
			<fo:inline font-family="ArialUnicodeMS">&#x25FC;</fo:inline>	
		</xsl:when>
		
		<xsl:when test="$itemsymbol='hollowmediumsquare'">
			<fo:inline font-family="ArialUnicodeMS">&#x25FB;</fo:inline>	
		</xsl:when>
			
		<xsl:when test="$itemsymbol='endash'">&#x2013;</xsl:when>
		<xsl:when test="$itemsymbol='emdash'">&#x2014;</xsl:when>
		
		<xsl:when test="$itemsymbol='box'">&#x25A0;</xsl:when>
		<xsl:when test="$itemsymbol='smallblacksquare'">&#x25AA;</xsl:when>
		<xsl:when test="$itemsymbol='circle'">&#x25CB;</xsl:when>
		<xsl:when test="$itemsymbol='smallwhitesquare'">&#x25AB;</xsl:when>
		<xsl:when test="$itemsymbol='round'">&#x25CF;</xsl:when>
		<xsl:when test="$itemsymbol='blackcircle'">&#x25CF;</xsl:when>
		<xsl:when test="$itemsymbol='whitebullet'">&#x25E6;</xsl:when>
		<xsl:when test="$itemsymbol='triangle'">&#x2023;</xsl:when>
		<xsl:when test="$itemsymbol='point'">&#x203A;</xsl:when>
		<xsl:when test="$itemsymbol='hand'"><fo:inline 
							 font-family="Wingdings 2">A</fo:inline></xsl:when>
		-->
	  </xsl:choose>
	</xsl:template>

	<xsl:template name="next.itemsymbol">
		<xsl:param name="itemsymbol" select="'default'"/>
		<xsl:choose>
			<xsl:when test="$itemsymbol = 'solidcircle'">hollowcircle</xsl:when>
			<xsl:when test="$itemsymbol = 'hollowcircle'">solidtriangle</xsl:when>
			<xsl:when test="$itemsymbol = 'solidtriangle'">hollowtriangle</xsl:when>
			<xsl:otherwise>solidcircle</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>