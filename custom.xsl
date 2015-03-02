<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- Include base DocBook stuff - note: use catalog to map to local resource -->
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

	<!-- Include source syntax highlighting -->
	<!--
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/highlighting/common.xsl"/>
	-->
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/highlight.xsl"/>
	<xsl:import href="custom.syntaxhighlight.xsl"/>

	<!-- Include custom parameters -->
	<xsl:import href="custom.param.xsl"/>

	<!-- Include custom languages -->
	<xsl:import href="custom.lang.en.xsl"/>

	<!-- Include custom style constants -->
	<xsl:import href="custom.style.constant.xsl"/>

	<!-- Include custom styles -->
	<xsl:import href="custom.style.xsl"/>

	<!-- Include custom utils -->
	<xsl:import href="custom.util.xsl"/>

	<!-- Include custom header -->
	<xsl:import href="custom.header.xsl"/>

	<!-- Include custom footer -->
	<xsl:import href="custom.footer.xsl"/>

	<!-- Include custom title pages -->
	<xsl:import href="custom.titlepage.xsl"/>

	<!-- Include custom rev history -->
	<xsl:import href="custom.revhistory.xsl"/>
	
	<!-- Include custom blocks -->
	<xsl:import href="custom.block.xsl"/>

	<!-- Include custom admons -->
	<xsl:import href="custom.admon.xsl"/>

	<!-- Include custom lists -->
	<xsl:import href="custom.list.xsl"/>

	<!-- Include custom footnotes -->
	<xsl:import href="custom.footnote.xsl"/>

	<!-- Include custom appendices -->
	<xsl:import href="custom.appendix.xsl"/>

	<!-- Include AsciiDoc specific formatting -->
	<xsl:import href="asciidoc.xsl"/>

</xsl:stylesheet>