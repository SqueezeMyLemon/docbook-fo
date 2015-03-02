<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Asciidoc specific stuff                  **          
  *********************************************** 
-->

	<!-- Line break -->
	<xsl:template match="processing-instruction('asciidoc-br')">
		<fo:block/>
	</xsl:template>

	<!-- Horizontal ruler -->
	<xsl:template match="processing-instruction('asciidoc-hr')">
		<fo:block space-after="1em">
			<fo:leader leader-pattern="rule" rule-thickness="0.5pt"  rule-style="solid" leader-length.minimum="100%"/>
		</fo:block>
	</xsl:template>

	<!-- Hard page break -->
	<xsl:template match="processing-instruction('asciidoc-pagebreak')">
		<fo:block break-after='page'/>
	</xsl:template>

	<xsl:param name="section.autolabel">
		<xsl:choose>
			<xsl:when test="/processing-instruction('asciidoc-numbered')">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

</xsl:stylesheet>