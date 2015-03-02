<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">



<!-- 
  ***********************************************
  **  Utility templates                        **          
  *********************************************** 
-->

	<!-- template to convert values to mm -->
	<xsl:template name="to_mm">

		<xsl:param name="value"/>
		<xsl:variable name="num_value" select="number(substring($value, 1, string-length($value) -2))"/>
		<xsl:variable name="unit" select="substring($value, string-length($value) -1)"/>

		<xsl:variable name="scale">
			<xsl:choose>
				<xsl:when test="$unit='in'">25.4</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="$num_value * $scale"/>

	</xsl:template>


</xsl:stylesheet>