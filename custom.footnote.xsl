<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format">


	<!-- custom footnote template -->
	<xsl:template name="format.footnote.mark">
		<xsl:param name="mark" select="'?'"/>
		<fo:inline xsl:use-attribute-sets="footnote.mark.properties">
			<xsl:choose>
				<xsl:when test="$fop.extensions != 0">
					<xsl:attribute name="vertical-align">super</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="baseline-shift">super</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			[<xsl:copy-of select="$mark"/>]
		</fo:inline>
	</xsl:template>

</xsl:stylesheet>