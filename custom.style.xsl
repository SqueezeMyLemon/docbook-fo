<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Colours                                  **
  *********************************************** 
-->
	<!-- table header & cell font; copyright font; header & footer font; formal object title & body font; list label font -->
	<xsl:param name="custom.colour.font.1" select="$custom.colour.darkgrey" />
	
	<!-- titles -->
	<xsl:param name="custom.colour.title" select="$custom.colour.midblue" />

	<!-- xrefs -->
	<xsl:param name="custom.colour.xref" select="$custom.colour.navy" />

	<!-- borders -->
	<xsl:param name="custom.colour.border.1" select="$custom.colour.lightgrey" />
	<xsl:param name="custom.colour.border.2" select="$custom.colour.midblue" />

	<!-- backgrounds -->
	<xsl:param name="custom.colour.background.1" select="$custom.colour.lightyellow" />
	<xsl:param name="custom.colour.background.2" select="$custom.colour.lightgrey" />

	<!-- syntax highlight -->
	<xsl:param name="custom.colour.sh.1" select="$custom.colour.midblue" />
	<xsl:param name="custom.colour.sh.2" select="$custom.colour.midgreen" />
	<xsl:param name="custom.colour.sh.3" select="$custom.colour.midgrey" />



<!-- 
  ***********************************************
  **  General styles                           **
  *********************************************** 
-->
	<!-- default fonts	-->
	<xsl:param name="title.font.family"><xsl:value-of select="$custom.font.serif" /></xsl:param>
	<xsl:param name="body.font.family"><xsl:value-of select="$custom.font.serif" /></xsl:param>
	<xsl:param name="symbol.font.family"><xsl:value-of select="$custom.font.symbol" /></xsl:param>
	<xsl:param name="monospace.font.family"><xsl:value-of select="$custom.font.mono" /></xsl:param>
	<xsl:param name="dingbat.font.family"><xsl:value-of select="$custom.font.dingbat" /></xsl:param>

	<!-- xrefs -->
	<xsl:attribute-set name="xref.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.xref" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- emphasis / bold -->
	<xsl:attribute-set name="custom.inline.boldseq">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.darkblue" /></xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template name="inline.boldseq">
		<xsl:param name="content">
			<xsl:call-template name="simple.xlink">
				<xsl:with-param name="content">
					<xsl:apply-templates/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:param>

		<fo:inline xsl:use-attribute-sets="custom.inline.boldseq">
			<xsl:if test="@dir">
				<xsl:attribute name="direction">
					<xsl:choose>
						<xsl:when test="@dir = 'ltr' or @dir = 'lro'">ltr</xsl:when>
						<xsl:otherwise>rtl</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="$content"/>
		</fo:inline>
	</xsl:template>


<!-- 
  ***********************************************
  **  Page styles                              **
  *********************************************** 
-->
	<xsl:param name="paper.type" select="'A4'"/>
	<xsl:param name="page.orientation" select="'portrait'"/>
	<xsl:param name="page.margin.bottom" select="'0.25in'"/>
	<xsl:param name="page.margin.top" select="'0.5in'"/>

	<xsl:param name="page.margin.inner">
		<xsl:choose>
			<xsl:when test="$double.sided != 0">0.75in</xsl:when>
			<xsl:otherwise>0.75in</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:param name="page.margin.outer">
		<xsl:choose>
			<xsl:when test="$double.sided != 0">0.5in</xsl:when>
			<xsl:otherwise>0.5in</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:param name="page.width">
		<xsl:choose>
			<xsl:when test="$page.orientation = 'portrait'">
				<xsl:value-of select="$page.width.portrait"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$page.height.portrait"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>



<!-- 
  ***********************************************
  **  Title page styles                        **
  *********************************************** 
-->
	<!-- corpname attribute set -->
	<xsl:attribute-set name="custom.titlepage.corpname.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size2" /></xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- doc title attribute set -->
	<xsl:attribute-set name="custom.titlepage.title.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size5" /></xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size3" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- doc subtitle attribute set -->
	<xsl:attribute-set name="custom.titlepage.subtitle.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size4" /></xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size7" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- doc revision date attribute set -->
	<xsl:attribute-set name="custom.titlepage.revisiondate.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size3" /></xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size5" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- doc author attribute set -->
	<xsl:attribute-set name="custom.titlepage.author.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size3" /></xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size8" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- copyright attribute set -->
	<xsl:attribute-set name="custom.titlepage.copyright.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="padding-before">0pt</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size1" /></xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Rev. history styles                      **
  *********************************************** 
-->
	<xsl:attribute-set name="revhistory.title.properties">
		<xsl:attribute name="border-color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-after"><xsl:value-of select="$custom.space.size1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="revhistory.table.properties">
		<xsl:attribute name="border-width">3px</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-color"><xsl:value-of select="$custom.colour.border.2" /></xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.revhistory.header.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="revhistory.table.cell.properties">
		<xsl:attribute name="border-width">1px</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-color"><xsl:value-of select="$custom.colour.border.2" /></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="padding">5px</xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.revhistory.table.revnumber.properties" use-attribute-sets="revhistory.table.cell.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="display-align">before</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.revhistory.revision.revremark.remarklist.properties" use-attribute-sets="list.block.spacing itemizedlist.properties">
		<xsl:attribute name="margin-top">3px</xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Body styles                              **
  *********************************************** 
-->

	<xsl:param name="alignment">left</xsl:param>
	<xsl:param name="body.font.master">12</xsl:param>
	<xsl:param name="body.margin.bottom" select="'0.5in'"/>
	<xsl:param name="body.margin.top" select="'0.5in'"/>

	<xsl:param name="body.start.indent">
		<xsl:choose>
			<xsl:when test="$fop.extensions != 0">0pt</xsl:when>
			<xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
			<xsl:otherwise>1pc</xsl:otherwise>
		</xsl:choose>
	</xsl:param>


<!-- 
  ***********************************************
  **  Section start title page styles          **
  *********************************************** 
-->
	<xsl:attribute-set name="custom.section.titlepage.style">
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size4" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.section.titlepage.section-num.style">
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="padding-before"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size9" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.section.titlepage.section-name.style">
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="space-before"><xsl:value-of select="$custom.space.size9" /></xsl:attribute>
		<xsl:attribute name="space-after"><xsl:value-of select="$custom.space.size7" /></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size5" /></xsl:attribute>
		<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
		<xsl:attribute name="border-bottom-width">3pt</xsl:attribute>
		<xsl:attribute name="border-bottom-color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Header styles                            **
  *********************************************** 
-->
	<!-- column 1 styles -->
	<xsl:attribute-set name="custom.header.column1.properties">
		<xsl:attribute name="text-align">start</xsl:attribute>
		<xsl:attribute name="display-align">before</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- column 2 styles -->
	<xsl:attribute-set name="custom.header.column2.properties">
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="display-align">before</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
	
	
<!-- 
  ***********************************************
  **  Footer styles                            **
  *********************************************** 
-->
	<!-- column 1 styles -->
	<xsl:attribute-set name="custom.footer.column1.properties">
		<xsl:attribute name="text-align">start</xsl:attribute>
		<xsl:attribute name="display-align">after</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- column 2 styles -->
	<xsl:attribute-set name="custom.footer.column2.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="display-align">after</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
	</xsl:attribute-set>
	
	<!-- column 3 styles -->	
	<xsl:attribute-set name="custom.footer.column3.properties">
		<xsl:attribute name="text-align">end</xsl:attribute>
		<xsl:attribute name="display-align">after</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
	</xsl:attribute-set>


	
<!-- 
  ***********************************************
  **  Heading styles                           **
  *********************************************** 
-->
	<!-- general heading styles -->
	<xsl:attribute-set name="section.title.properties">
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- level 1 heading styles -->
	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size4" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.level1.properties">
		<xsl:attribute name="break-before">page</xsl:attribute>
	</xsl:attribute-set>

	<!-- level 2 heading styles -->
	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size3" /></xsl:attribute>
		<xsl:attribute name="space-before.minimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.2em</xsl:attribute>
	</xsl:attribute-set>

	<!-- level 3 heading styles -->
	<xsl:attribute-set name="section.title.level3.properties">		
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size2" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- level 4 heading styles -->
	<xsl:attribute-set name="section.title.level4.properties">
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size1" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- level 5 heading styles -->
	<xsl:attribute-set name="section.title.level5.properties">
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
	</xsl:attribute-set>



<!-- 
  ***********************************************
  **  Object general styles                    **
  *********************************************** 
-->
	<!-- title position relative to object -->
	<xsl:param name="formal.title.placement">
		figure after
		example before
		equation before
		table before
		procedure before
	</xsl:param>

	<!-- title styles -->
	<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size2" /></xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
	</xsl:attribute-set>


	<!-- default custom formal object styles -->
	<xsl:attribute-set name="custom.formal.object.properties">
		<xsl:attribute name="space-before.minimum"><xsl:value-of select="$custom.space.size4" /></xsl:attribute>
		<xsl:attribute name="space-before.optimum"><xsl:value-of select="$custom.space.size5" /></xsl:attribute>
		<xsl:attribute name="space-before.maximum"><xsl:value-of select="$custom.space.size6" /></xsl:attribute>
		<xsl:attribute name="space-after.minimum"><xsl:value-of select="$custom.space.size1" /></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="$custom.space.size2" /></xsl:attribute>
		<xsl:attribute name="space-after.maximum"><xsl:value-of select="$custom.space.size3" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size2" /></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="margin-left"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
		<xsl:attribute name="margin-right"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
		<xsl:attribute name="padding"><xsl:value-of select="$custom.space.size2" /></xsl:attribute>
		<xsl:attribute name="padding-top"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
		<xsl:attribute name="border">0mm</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-left">.5mm</xsl:attribute>
		<xsl:attribute name="border-color"><xsl:value-of select="$custom.colour.border.1" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- default custom formal object title styles -->
	<xsl:attribute-set name="custom.formal.title.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size2" /></xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
	</xsl:attribute-set>

	<!-- default custom formal para title styles -->
	<xsl:attribute-set name="custom.formalpara.title.properties" use-attribute-sets="custom.formal.title.properties">
		<xsl:attribute name="margin-left"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
		<xsl:attribute name="margin-right"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
	</xsl:attribute-set>



<!-- 
  ***********************************************
  **  TOC styles                               **
  *********************************************** 
-->
	<xsl:attribute-set name="table.of.contents.titlepage.recto.style">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size4" /></xsl:attribute>
	</xsl:attribute-set>  


<!-- 
  ***********************************************
  **  Image styles                             **
  *********************************************** 
-->






<!-- 
  ***********************************************
  **  Xref styles                              **
  *********************************************** 
-->
<!--
	<xsl:attribute-set name="xref.properties">
		<xsl:attribute name="color">
			<xsl:choose>
				<xsl:when test="self::d:link and @xlink:href">blue</xsl:when>
				<xsl:otherwise>inherit</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="text-decoration">
			<xsl:choose>
				<xsl:when test="self::d:link and @xlink:href">underline</xsl:when>
				<xsl:otherwise>inherit</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>   
-->

	<xsl:attribute-set name="xref.properties">
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
	</xsl:attribute-set>



<!-- 
  ***********************************************
  **  Table styles                             **
  *********************************************** 
-->
	<xsl:attribute-set name="table.properties">
		<xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="table.frame.border.color" select="$custom.colour.border.2"/>
	<xsl:param name="table.frame.border.thickness" select="'3px'"/>
	<xsl:param name="table.frame.border.style" select="'solid'"/>
	
	<xsl:param name="table.cell.border.color" select="$custom.colour.border.2"/>
	<xsl:param name="table.cell.border.thickness" select="'1px'"/>
	<xsl:param name="table.cell.border.style" select="'solid'"/>

	<xsl:attribute-set name="table.cell.padding">
		<xsl:attribute name="padding-start">5px</xsl:attribute>
		<xsl:attribute name="padding-end">5px</xsl:attribute>
		<xsl:attribute name="padding-top">5px</xsl:attribute>
		<xsl:attribute name="padding-bottom">5px</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="table.borders.with.css" select="1"/>
	<xsl:param name="tablecolumns.extension" select="'1'"/>
	
	<xsl:param name="table.footnote.number.format" select="'a'"/>
	<xsl:param name="table.footnote.number.symbols" select="''"/>


<!-- 
  ***********************************************
  **  Admonition styles                        **
  *********************************************** 
-->

	<!-- admonition title styles -->
	<xsl:attribute-set name="admonition.title.properties" use-attribute-sets="custom.formal.object.properties custom.formal.title.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
		<xsl:attribute name="padding-bottom">0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0em</xsl:attribute>
	</xsl:attribute-set>

	<!-- admonition body styles -->
	<xsl:attribute-set name="admonition.properties" use-attribute-sets="custom.formal.object.properties">
		<xsl:attribute name="padding-top">0em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0em</xsl:attribute>
	 </xsl:attribute-set> 


<!-- 
  ***********************************************
  **  Sidebar block styles                     **
  *********************************************** 
-->
	<!-- sidebar body styles -->
	<xsl:attribute-set name="sidebar.properties" use-attribute-sets="custom.formal.object.properties">
		<xsl:attribute name="background-color"><xsl:value-of select="$custom.colour.background.1" /></xsl:attribute>
	</xsl:attribute-set>

	<!-- sidebar title styles -->
	<xsl:attribute-set name="sidebar.title.properties" use-attribute-sets="custom.formal.title.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Example block styles                     **
  *********************************************** 
-->
	<xsl:attribute-set name="example.properties" use-attribute-sets="custom.formal.object.properties">
		<!-- just use default custom object styles -->
	</xsl:attribute-set>

	<xsl:attribute-set name="example.title.properties" use-attribute-sets="custom.formal.object.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.title" /></xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Blockquote styles                        **
  *********************************************** 
-->
	<xsl:attribute-set name="blockquote.properties" use-attribute-sets="custom.formal.object.properties">
		<!-- just use default custom object styles -->
	</xsl:attribute-set>

<!-- 
  ***********************************************
  **  Callout styles                           **
  *********************************************** 
-->





<!-- 
  ***********************************************
  **  Program listing styles                   **
  *********************************************** 
-->
	<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="custom.formal.object.properties">
		<xsl:attribute name="font-size"><xsl:value-of select="$custom.font.size0" /></xsl:attribute>
		<xsl:attribute name="border">0mm</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0em</xsl:attribute>
	</xsl:attribute-set>


	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="background-color"><xsl:value-of select="$custom.colour.background.2" /></xsl:attribute>
	</xsl:attribute-set>


<!-- 
  ***********************************************
  **  Syntax highlighting styles               **
  *********************************************** 
-->
	<xsl:attribute-set name="custom.syntaxhighlight.keyword.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.sh.1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.string.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.sh.2" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.comment.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.sh.3" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.tag.properties">
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.attribute.properties" >
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.value.properties">
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.annotation.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.sh.3" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="custom.syntaxhighlight.doctype.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	
		
<!-- 
  ***********************************************
  **  List styles                              **
  *********************************************** 
-->	
	<xsl:attribute-set name="itemizedlist.label.properties">
		<xsl:attribute name="color"><xsl:value-of select="$custom.colour.font.1" /></xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="itemizedlist.properties">
		<xsl:attribute name="margin-left"><xsl:value-of select="$custom.space.size2" /></xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="orderedlist.properties">
		<xsl:attribute name="margin-left"><xsl:value-of select="$custom.space.size2" /></xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="list.item.spacing">
		<xsl:attribute name="margin-top"><xsl:value-of select="$custom.space.size0" /></xsl:attribute>
	</xsl:attribute-set>
	

<!-- 
  ***********************************************
  **  Glossary styles                          **
  *********************************************** 
-->
	<xsl:attribute-set name="custom.glossary.title.properties" use-attribute-sets="section.title.properties section.title.level1.properties section.level1.properties" />

</xsl:stylesheet>