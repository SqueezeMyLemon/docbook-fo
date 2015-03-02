<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:xslthl="http://xslthl.sf.net"
	exclude-result-prefixes="xslthl">


<!-- 
  ***********************************************
  **  Syntax highlighting                      **
  *********************************************** 
-->

	<xsl:template match='xslthl:keyword' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.keyword.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:string' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.string.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:comment' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.comment.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:tag' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.tag.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:attribute' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.attribute.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:value' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.value.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:number' mode="xslthl">
		<xsl:apply-templates mode="xslthl"/>
	</xsl:template>

	<xsl:template match='xslthl:annotation' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.annotation.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:directive' mode="xslthl">
		<xsl:apply-templates mode="xslthl"/>
	</xsl:template>

	<!-- Not sure which element will be in final XSLTHL 2.0 -->
	<xsl:template match='xslthl:doccomment|xslthl:doctype' mode="xslthl">
		<fo:inline xsl:use-attribute-sets="custom.syntaxhighlight.doctype.properties"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

</xsl:stylesheet>