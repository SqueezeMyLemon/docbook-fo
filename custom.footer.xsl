<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Footer                                   **          
  *********************************************** 
-->

<xsl:template name="footer.table">
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
			<xsl:otherwise>3</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="column3">
		<xsl:choose>
			<xsl:when test="$double.sided = 0">3</xsl:when>
			<xsl:when test="$sequence = 'first' or $sequence = 'odd'">3</xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="candidate">
		<fo:table xsl:use-attribute-sets="footer.table.properties">
			<xsl:call-template name="foot.sep.rule">
				<xsl:with-param name="pageclass" select="$pageclass"/>
				<xsl:with-param name="sequence" select="$sequence"/>
				<xsl:with-param name="gentext-key" select="$gentext-key"/>
			</xsl:call-template>
			<fo:table-column column-number="1">
				<xsl:attribute name="column-width">
					<xsl:text>proportional-column-width(</xsl:text>
						<xsl:call-template name="header.footer.width">
							<xsl:with-param name="location">footer</xsl:with-param>
							<xsl:with-param name="position" select="$column1"/>
							<xsl:with-param name="pageclass" select="$pageclass"/>
							<xsl:with-param name="sequence" select="$sequence"/>
							<xsl:with-param name="gentext-key" select="$gentext-key"/>
						</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-number="2">
				<xsl:attribute name="column-width">
					<xsl:text>proportional-column-width(</xsl:text>
						<xsl:call-template name="header.footer.width">
							<xsl:with-param name="location">footer</xsl:with-param>
							<xsl:with-param name="position" select="2"/>
							<xsl:with-param name="pageclass" select="$pageclass"/>
							<xsl:with-param name="sequence" select="$sequence"/>
							<xsl:with-param name="gentext-key" select="$gentext-key"/>
						</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-number="3">
				<xsl:attribute name="column-width">
					<xsl:text>proportional-column-width(</xsl:text>
						<xsl:call-template name="header.footer.width">
						<xsl:with-param name="location">footer</xsl:with-param>
						<xsl:with-param name="position" select="$column3"/>
						<xsl:with-param name="pageclass" select="$pageclass"/>
						<xsl:with-param name="sequence" select="$sequence"/>
						<xsl:with-param name="gentext-key" select="$gentext-key"/>
						</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:attribute>
			</fo:table-column>

			<fo:table-body>
				<fo:table-row>
					<xsl:attribute name="block-progression-dimension.minimum">
						<xsl:value-of select="$footer.table.height"/>
					</xsl:attribute>
					<fo:table-cell xsl:use-attribute-sets="custom.footer.column1.properties">
						<xsl:if test="$fop.extensions = 0">
							<xsl:attribute name="relative-align">baseline</xsl:attribute>
						</xsl:if>
						<fo:block>
							<xsl:call-template name="footer.content">
								<xsl:with-param name="pageclass" select="$pageclass"/>
								<xsl:with-param name="sequence" select="$sequence"/>
								<xsl:with-param name="position" select="$direction.align.start"/>
								<xsl:with-param name="gentext-key" select="$gentext-key"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="custom.footer.column2.properties">
						<xsl:if test="$fop.extensions = 0">
							<xsl:attribute name="relative-align">baseline</xsl:attribute>
						</xsl:if>
						<fo:block>
							<xsl:call-template name="footer.content">
								<xsl:with-param name="pageclass" select="$pageclass"/>
								<xsl:with-param name="sequence" select="$sequence"/>
								<xsl:with-param name="position" select="'center'"/>
								<xsl:with-param name="gentext-key" select="$gentext-key"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="custom.footer.column3.properties">
						<xsl:if test="$fop.extensions = 0">
							<xsl:attribute name="relative-align">baseline</xsl:attribute>
						</xsl:if>
						<fo:block>
							<xsl:call-template name="footer.content">
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

	<!-- Really output a footer? -->
	<xsl:choose>
		<xsl:when test="$sequence='first'">
			<!-- no, first page has no footer at all -->
		</xsl:when>
		<xsl:when test="$sequence = 'blank' and $footers.on.blank.pages = 0">
			<!-- no output -->
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select="$candidate"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="footer.content">
	<xsl:param name="pageclass" select="''"/>
	<xsl:param name="sequence" select="''"/>
	<xsl:param name="position" select="''"/>
	<xsl:param name="gentext-key" select="''"/>

	<fo:block>
	<!-- pageclass can be front, body, back -->
	<!-- sequence can be odd, even, first, blank -->
	<!-- position can be left, center, right -->
		<xsl:choose>
			<xsl:when test="$pageclass = 'titlepage'">
			<!-- nop; no footer on title pages -->
			</xsl:when>

			<xsl:when test="$double.sided != 0 and $sequence = 'even' and $position='left'">
				<fo:page-number/>
			</xsl:when>

			<xsl:when test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first') and $position='right'">
				<fo:page-number/>
			</xsl:when>

			<xsl:when test="$double.sided = 0 and $position='center'">
				<fo:page-number/>
			</xsl:when>

			<xsl:when test="$sequence='blank'">
				<xsl:choose>
					<xsl:when test="$double.sided != 0 and $position = 'left'">
						<fo:page-number/>
					</xsl:when>
					<xsl:when test="$double.sided = 0 and $position = 'center'">
						<fo:page-number/>
					</xsl:when>
					<xsl:otherwise>
						<!-- nop -->
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>


			<xsl:otherwise>
				<!-- nop -->
			</xsl:otherwise>
		</xsl:choose>

	</fo:block>
</xsl:template>


</xsl:stylesheet>