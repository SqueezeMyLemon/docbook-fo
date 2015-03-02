<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format">

 
	<!-- general parameters -->
	<xsl:param name="fop1.extensions" select="1" />
	<!-- this seems to throw an exception
	<xsl:param name="use.extensions" select="1" />
	-->
	
	
	<!-- draft parameters -->
	<xsl:param name="draft.watermark.image">C:/bin/asciidoc-custom/images/draft-500.png</xsl:param>

<!-- note: set at command line
	<xsl:param name="draft.mode">yes</xsl:param>
-->

	<!-- logo parameters -->
	<xsl:param name="custom.logo">1</xsl:param>
	<xsl:param name="custom.logo.path">c:/bin/asciidoc-custom/images/gis_logo.png</xsl:param>


	<!-- section parameters -->
	<xsl:param name="section.autolabel.max.depth">3</xsl:param>


	<!-- toc parameters -->
	<xsl:param name="toc.section.depth" select="'3'" />

	<xsl:attribute-set name="toc.margin.properties">
		<xsl:attribute name="break-after">page</xsl:attribute>
	</xsl:attribute-set>


	<!-- callout parameters -->
	<xsl:param name="callout.graphics">0</xsl:param>
	<xsl:param name="callout.unicode">1</xsl:param>
	<xsl:param name="callout.defaultcolumn">90</xsl:param>
	<xsl:param name="callout.graphics.extension">.png</xsl:param>
	<xsl:param name="callout.graphics.number.limit">10</xsl:param>
	<xsl:param name="callout.graphics.path">images/icons/callouts/</xsl:param>
	<xsl:param name="callout.list.table">1</xsl:param>


	<!-- admonition parameters -->
	<xsl:param name="admon.graphics" select="'1'"/> 
	<xsl:param name="admon.textlabel" select="'1'"></xsl:param>
	<xsl:param name="admon.graphics.extension">.png</xsl:param>
	<xsl:param name="admon.graphics.path">C:/bin/asciidoc-8.6.9/images/icons/</xsl:param>
	<xsl:param name="custom.admon.graphics.path">C:/bin/asciidoc-custom/images/icons/</xsl:param>


	<!-- source listing parameters -->
	<xsl:param name="highlight.source" select="1"/>
	<xsl:param name="linenumbering.extension" select="1" />
	<xsl:param name="linenumbering.everyNth" select="1" />
	

	<!-- verbatim parameters -->
	<xsl:param name="shade.verbatim" select="1"/>


	<!-- xref parameters -->
	<xsl:param name="ulink.show" select="0"/>
	<xsl:param name="ulink.footnotes" select="0"/>

</xsl:stylesheet>