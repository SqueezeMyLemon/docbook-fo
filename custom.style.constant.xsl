<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Style constants                          **
  *********************************************** 
	<xsl:param name="custom.font.sans">sans</xsl:param>
-->
	<!-- fonts -->
	<xsl:param name="custom.font.serif">serif</xsl:param>
	<xsl:param name="custom.font.sans">sans-serif</xsl:param>
	<xsl:param name="custom.font.mono">monospace</xsl:param>
	<xsl:param name="custom.font.symbol">Symbol,ZapfDingbats</xsl:param>
	<xsl:param name="custom.font.dingbat">serif</xsl:param>

	<!-- colours / greys -->
	<xsl:param name="custom.colour.darkgrey">#505050</xsl:param>
	<xsl:param name="custom.colour.midgrey">#888888</xsl:param>
	<xsl:param name="custom.colour.lightgrey">#eeeeee</xsl:param>

	<!-- colours / blues -->
	<xsl:param name="custom.colour.midblue">#4477aa</xsl:param>
	<xsl:param name="custom.colour.brightblue">#1111ff</xsl:param>
	<xsl:param name="custom.colour.darkteal">#004664</xsl:param>
	<xsl:param name="custom.colour.navy">#000080</xsl:param>
	<xsl:param name="custom.colour.darkblue">#083194</xsl:param>

	<!-- colours / yellows -->
	<xsl:param name="custom.colour.lightyellow">#ffffee</xsl:param>
	
	<!-- colours / greens -->
	<xsl:param name="custom.colour.midgreen">#008833</xsl:param>
	
	<!-- colours / reds -->
	<xsl:param name="custom.colour.brightred">#ff0000</xsl:param>
	

	<!-- font sizes -->
	<xsl:param name="custom.font.size0">8pt</xsl:param>
	<xsl:param name="custom.font.size1">10pt</xsl:param>
	<xsl:param name="custom.font.size2">12pt</xsl:param>
	<xsl:param name="custom.font.size3">14pt</xsl:param>
	<xsl:param name="custom.font.size4">20pt</xsl:param>
	<xsl:param name="custom.font.size5">24pt</xsl:param>
	<xsl:param name="custom.font.size6">48pt</xsl:param>
	<xsl:param name="custom.font.size7">72pt</xsl:param>
	<xsl:param name="custom.font.size8">100pt</xsl:param>
	<xsl:param name="custom.font.size9">120pt</xsl:param>

	<!-- spacing sizes -->
	<xsl:param name="custom.space.size0">7.5pt</xsl:param>
	<xsl:param name="custom.space.size1">9pt</xsl:param>
	<xsl:param name="custom.space.size2">10pt</xsl:param>
	<xsl:param name="custom.space.size3">12pt</xsl:param>
	<xsl:param name="custom.space.size4">16pt</xsl:param>
	<xsl:param name="custom.space.size5">18pt</xsl:param>
	<xsl:param name="custom.space.size6">24pt</xsl:param>
	<xsl:param name="custom.space.size7">32pt</xsl:param>
	<xsl:param name="custom.space.size8">48pt</xsl:param>
	<xsl:param name="custom.space.size9">72pt</xsl:param>
	
</xsl:stylesheet>