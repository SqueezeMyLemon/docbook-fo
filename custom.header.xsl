<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">



<!-- 
  ***********************************************
  **  Header                                   **          
  *********************************************** 
-->

	<!-- Custom header template -->
	<xsl:template name="header.table">
		<xsl:param name="pageclass" select="''"/>
		<xsl:param name="sequence" select="''"/>
		<xsl:param name="gentext-key" select="''"/>

		<xsl:choose>
			<xsl:when test="$pageclass = 'index'">
				<xsl:attribute name="margin-{$direction.align.start}">0pt</xsl:attribute>
			</xsl:when>
		</xsl:choose>

		<xsl:variable name="column1">
			<xsl:choose>
				<xsl:when test="$double.sided = 0">1</xsl:when>
				<xsl:when test="$sequence = 'first' or $sequence = 'odd'">1</xsl:when>
				<xsl:otherwise>2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="column2">
			<xsl:choose>
				<xsl:when test="$double.sided = 0">2</xsl:when>
				<xsl:when test="$sequence = 'first' or $sequence = 'odd'">2</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="candidate">
			<fo:table xsl:use-attribute-sets="header.table.properties">
				<xsl:call-template name="head.sep.rule">
					<xsl:with-param name="pageclass" select="$pageclass"/>
					<xsl:with-param name="sequence" select="$sequence"/>
					<xsl:with-param name="gentext-key" select="$gentext-key"/>
				</xsl:call-template>

				<fo:table-column column-number="1">
					<xsl:attribute name="column-width">
						<xsl:text>proportional-column-width(6)</xsl:text>
					</xsl:attribute>
				</fo:table-column>
				<fo:table-column column-number="2">
					<xsl:attribute name="column-width">
						<xsl:text>proportional-column-width(1)</xsl:text>
					</xsl:attribute>
				</fo:table-column>

				<fo:table-body>
					<fo:table-row>
						<xsl:attribute name="block-progression-dimension.minimum">
							<xsl:value-of select="$header.table.height"/>
						</xsl:attribute>
						<fo:table-cell xsl:use-attribute-sets="custom.header.column1.properties">
							<xsl:if test="$fop.extensions = 0">
								<xsl:attribute name="relative-align">baseline</xsl:attribute>
							</xsl:if>
							<fo:block>
								<xsl:call-template name="header.content">
									<xsl:with-param name="pageclass" select="$pageclass"/>
									<xsl:with-param name="sequence" select="$sequence"/>
									<xsl:with-param name="position" select="$direction.align.start"/>
									<xsl:with-param name="gentext-key" select="$gentext-key"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="custom.header.column2.properties" >
							<xsl:if test="$fop.extensions = 0">
								<xsl:attribute name="relative-align">baseline</xsl:attribute>
							</xsl:if>
							<fo:block>
								<xsl:call-template name="header.content">
									<xsl:with-param name="pageclass" select="$pageclass"/>
									<xsl:with-param name="sequence" select="$sequence"/>
									<xsl:with-param name="position" select="$direction.align.end"/>
									<xsl:with-param name="gentext-key" select="$gentext-key"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:variable>

		<!-- Really output a header? -->
		<xsl:choose>
			<xsl:when test="$pageclass = 'titlepage' and $gentext-key = 'book' and $sequence='first'">
				<!-- no, book titlepages have no headers at all -->
			</xsl:when>
			<xsl:when test="$sequence='first'">
				<!-- no header for first page -->
			</xsl:when>
			<xsl:when test="$sequence = 'blank' and $headers.on.blank.pages = 0">
				<!-- no output -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$candidate"/>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<!-- Custom header content -->
	<xsl:template name="header.content">
		<xsl:param name="pageclass" select="''"/>
		<xsl:param name="sequence" select="''"/>
		<xsl:param name="position" select="''"/>
		<xsl:param name="gentext-key" select="''"/>

		<fo:block>
			<!-- sequence can be odd, even, first, blank -->
			<!-- position can be left, center, right -->
			<xsl:choose>
				<xsl:when test="$position='left'">
					<xsl:apply-templates select="." mode="titleabbrev.markup"/>
				</xsl:when>

				<xsl:when test="$position='center'">
					<!-- nothing -->
				</xsl:when>

				<xsl:when test="$position='right'">
					<!-- Output draft text --> 
					<!--
					<xsl:value-of select="$pageclass" />
					-->
					<xsl:call-template name="draft.text"/>
				</xsl:when>

				<xsl:when test="$sequence = 'first'">
					<!-- nothing for first pages -->
				</xsl:when>

				<xsl:when test="$sequence = 'blank'">
					<!-- nothing for blank pages -->
				</xsl:when>
			</xsl:choose>
		</fo:block>

	</xsl:template>


</xsl:stylesheet>