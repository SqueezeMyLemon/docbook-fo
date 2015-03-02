<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">




<!-- 
  ***********************************************
  **  Title page / recto                       **          
  *********************************************** 
-->
	<!-- custom title page template -->
	<xsl:template name="article.titlepage.recto">

		<xsl:variable name="page.height.mm">
			<xsl:call-template name="to_mm">
				<xsl:with-param name="value" select="$page.height"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="page.margin.top.mm">
			<xsl:call-template name="to_mm">
				<xsl:with-param name="value" select="$page.margin.top"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="body.margin.top.mm">
			<xsl:call-template name="to_mm">
				<xsl:with-param name="value" select="$body.margin.top"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="body.margin.bottom.mm">
			<xsl:call-template name="to_mm">
				<xsl:with-param name="value" select="$body.margin.bottom"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="page.margin.bottom.mm">
			<xsl:call-template name="to_mm">
				<xsl:with-param name="value" select="$page.margin.bottom"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="region.body.height.mm" select="$page.height.mm - $page.margin.top.mm - $body.margin.top.mm - $body.margin.bottom.mm - $page.margin.bottom.mm - 2" />
		<xsl:variable name="region.body.top.height.mm" select="($region.body.height.mm div 7) * 3" />
		<xsl:variable name="region.body.middle.height.mm" select="($region.body.height.mm div 7) * 3" />
		<xsl:variable name="region.body.bottom.height.mm" select="($region.body.height.mm div 7) * 1" />


		<fo:block>
			<fo:table inline-progression-dimension="100%" table-layout="fixed">

				<fo:table-column column-width="100%"/>
				
				<fo:table-body>

					<fo:table-row display-align="center" height="{$region.body.top.height.mm}mm">
						<fo:table-cell>
							<xsl:choose>
								<xsl:when test="$custom.logo = '1'">
									<fo:block text-align="center" padding-before="0pt">
										<fo:external-graphic src="url({$custom.logo.path})" />
									</fo:block>
								</xsl:when>
								<xsl:otherwise>
									<fo:block xsl:use-attribute-sets="custom.titlepage.corpname.properties">
										<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/corpname"/>
									</fo:block>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>


					<fo:table-row height="{$region.body.middle.height.mm}mm">
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="custom.titlepage.title.properties">
								<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/title"/>
 							</fo:block>
							<fo:block xsl:use-attribute-sets="custom.titlepage.subtitle.properties">
								<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/subtitle"/>
 							</fo:block>
							<fo:block xsl:use-attribute-sets="custom.titlepage.revisiondate.properties">
								<xsl:apply-templates mode="article.titlepage.verso.mode" select="articleinfo/authorgroup"/>
 							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row display-align="after" height="{$region.body.bottom.height.mm}mm">
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="custom.titlepage.copyright.properties" >
								<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/copyright"/>
 							</fo:block>
						</fo:table-cell>
					</fo:table-row>

				</fo:table-body> 

			</fo:table>

		</fo:block>
	</xsl:template>


<!-- 
  ***********************************************
  **  Title page / verso                       **          
  *********************************************** 
-->
	<!-- custom title page template -->
	<xsl:template name="article.titlepage.verso">

		<fo:block break-after="page">
			<fo:table inline-progression-dimension="100%" table-layout="fixed">

				<fo:table-column column-width="100%"/>
				
				<fo:table-body>

					<fo:table-row display-align="center">
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="custom.titlepage.author.properties">
								<xsl:apply-templates mode="article.titlepage.verso.mode" select="articleinfo/revhistory"/>
 							</fo:block>
						</fo:table-cell>
					</fo:table-row>

				</fo:table-body> 

			</fo:table>

		</fo:block>
	</xsl:template>


<!-- 
  ***********************************************
  **  Title page / sections                    **          
  *********************************************** 
-->
	<!-- header template applied to first page of each section -->
	<xsl:template match="article/section/title" mode="section.titlepage.recto.auto.mode">  

		<!-- Display the text 'section' -->
		<fo:block xsl:use-attribute-sets="section.titlepage.recto.style custom.section.titlepage.style" 
						margin-left="{$title.margin.left}">
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'section'"/>
			</xsl:call-template>
		</fo:block>

		<!-- Display the current section number -->
		<fo:block xsl:use-attribute-sets="section.titlepage.recto.style custom.section.titlepage.section-num.style" 
						margin-left="{$title.margin.left}">
			<xsl:apply-templates select=".." mode="label.markup"/>
		</fo:block>

		<!--  Display the current section name -->
		<fo:block xsl:use-attribute-sets="section.titlepage.recto.style custom.section.titlepage.section-name.style" 
						margin-left="{$title.margin.left}">    

			<fo:block break-after="page">
				<xsl:apply-templates select="." mode="title.markup"/>
			</fo:block>
		</fo:block>

	</xsl:template>

	
	
<!-- 
  ***********************************************
  **  Title page / glossary                    **          
  *********************************************** 
-->
	
	<xsl:template name="glossary.titlepage.recto">
		<fo:block xsl:use-attribute-sets="custom.glossary.title.properties">
			<xsl:apply-templates select="." mode="title.markup"/>
		</fo:block>
	</xsl:template>

	
	
</xsl:stylesheet>