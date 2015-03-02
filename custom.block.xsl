<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">


	<!-- Formal para title customisation -->
	<xsl:template match="formalpara/title|formalpara/info/title">

		<xsl:variable name="titleStr">
			<xsl:apply-templates/>
		</xsl:variable>

		<fo:block xsl:use-attribute-sets="custom.formalpara.title.properties">
			<xsl:copy-of select="$titleStr"/>
		</fo:block>

	</xsl:template>

</xsl:stylesheet>