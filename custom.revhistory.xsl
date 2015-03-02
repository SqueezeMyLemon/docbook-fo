<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- custom revision history template -->
	<xsl:template match="revhistory" mode="article.titlepage.verso.mode">

		<xsl:variable name="explicit.table.width">
			<xsl:call-template name="pi.dbfo_table-width"/>
		</xsl:variable>

		<xsl:variable name="table.width">
			<xsl:choose>
				<xsl:when test="$explicit.table.width != ''">
					<xsl:value-of select="$explicit.table.width"/>
				</xsl:when>
				<xsl:when test="$default.table.width = ''">
					<xsl:text>100%</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$default.table.width"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:block>

			<!-- rev. history title -->
			<fo:block xsl:use-attribute-sets="revhistory.title.properties">
				<xsl:choose>
					<xsl:when test="title|info/title">
						<xsl:apply-templates select="title|info/title" mode="titlepage.mode"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="gentext">
							<xsl:with-param name="key" select="'RevHistory'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>


			<fo:block>

				<fo:table table-layout="fixed" width="{$table.width}" xsl:use-attribute-sets="revhistory.table.properties">

					<fo:table-column column-number="1" column-width="proportional-column-width(2)"/>
					<fo:table-column column-number="2" column-width="proportional-column-width(3)"/>
					<fo:table-column column-number="3" column-width="proportional-column-width(3)"/>
					<fo:table-column column-number="4" column-width="proportional-column-width(12)"/>

					<fo:table-body start-indent="0pt" end-indent="0pt">

						<!-- rev. history header row -->
						<fo:table-row xsl:use-attribute-sets="custom.revhistory.header.properties">

							<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
								<fo:block>
									<xsl:call-template name="gentext">
										<xsl:with-param name="key" select="'Rev'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>

							<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
								<fo:block>
									<xsl:call-template name="gentext">
										<xsl:with-param name="key" select="'Date'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>

							<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
								<fo:block>
									<xsl:call-template name="gentext">
										<xsl:with-param name="key" select="'Author'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>

							<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
								<fo:block>
									<xsl:call-template name="gentext">
										<xsl:with-param name="key" select="'Description'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>

						</fo:table-row>

						<xsl:apply-templates select="*[not(self::title)]" mode="article.titlepage.verso.mode"/>

					</fo:table-body>

				</fo:table>

			</fo:block>


		</fo:block>

	</xsl:template>


	<xsl:key name="versions" match="revhistory/revision" use="revnumber" />

	<xsl:template match="revhistory/revision" mode="article.titlepage.verso.mode">

		<xsl:variable name="revnumber" select="revnumber"/>
		<xsl:variable name="revdate"   select="date"/>
		<xsl:variable name="revauthor" select="authorinitials|author"/>
		<xsl:variable name="revremark" select="revremark|revdescription"/>

		<xsl:variable name="revcount" select="count(key('versions', $revnumber[1]))" />
		<xsl:variable name="prevrevnumber" select="(preceding-sibling::*[1])/revnumber" />

		<fo:table-row>

			<!-- if current revnumber is different to previous one -->
			<xsl:if test="not($revnumber[1] = $prevrevnumber)">
				<!-- revision # -->
				<fo:table-cell xsl:use-attribute-sets="custom.revhistory.table.revnumber.properties" number-rows-spanned="{$revcount}">
					<fo:block>
						<xsl:if test="$revnumber">
							<xsl:apply-templates select="$revnumber[1]" mode="titlepage.mode"/> 
						</xsl:if>
					</fo:block>
				</fo:table-cell>
			</xsl:if>

			<!-- revision date -->
			<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
				<fo:block>
					<xsl:apply-templates select="$revdate[1]" mode="titlepage.mode"/>
				</fo:block>
			</fo:table-cell>

			<!-- revision author -->
			<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
				<fo:block>
					<xsl:for-each select="$revauthor">
						<xsl:apply-templates select="." mode="titlepage.mode"/>
						<xsl:if test="position() != last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</fo:block>
			</fo:table-cell>

			<!-- revision remark(s)/description -->
			<fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
				<fo:block>
					<xsl:choose>
						<xsl:when test="revremark/@role = 'strong'">
							<xsl:attribute name="font-weight">bold</xsl:attribute>
						</xsl:when>
					</xsl:choose>

					<xsl:if test="$revremark">

						<xsl:choose>
							<xsl:when test="revremark/remark">
								<xsl:apply-templates select="revremark" mode="article.titlepage.verso.mode"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="$revremark[1]" mode="titlepage.mode"/>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:if>
				</fo:block>
			</fo:table-cell>

		</fo:table-row>
		
	</xsl:template>


	<xsl:template match="revhistory/revision/revremark" mode="article.titlepage.verso.mode">

		<xsl:variable name="remark" select="remark"/>
		<xsl:variable name="role" select="@role"/>

		<xsl:variable name="keep.together">
			<xsl:call-template name="pi.dbfo_keep-together"/>
		</xsl:variable>

		<xsl:variable name="pi-label-width">
			<xsl:call-template name="pi.dbfo_label-width"/>
		</xsl:variable>

		<xsl:variable name="label-width">
			<xsl:choose>
				<xsl:when test="$pi-label-width = ''">
					<xsl:value-of select="$itemizedlist.label.width"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pi-label-width"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:block>
			<xsl:value-of select="self::node()/text()" />
		</fo:block>

		<fo:list-block xsl:use-attribute-sets="custom.revhistory.revision.revremark.remarklist.properties">

			<xsl:attribute name="provisional-distance-between-starts">
				<xsl:value-of select="$label-width"/>
			</xsl:attribute>

			<xsl:if test="$keep.together != ''">
				<xsl:attribute name="keep-together.within-column">
					<xsl:value-of select="$keep.together"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates select="remark" mode="titlepage.mode"/>

		</fo:list-block>

	</xsl:template>

	<xsl:template match="revhistory/revision/revremark/remark" mode="titlepage.mode">

		<fo:list-item xsl:use-attribute-sets="compact.list.item.spacing">

			<fo:list-item-label end-indent="label-end()" xsl:use-attribute-sets="itemizedlist.label.properties">
				<fo:block>
					<xsl:call-template name="itemizedlist.label.markup">
						<xsl:with-param name="itemsymbol">
							<xsl:call-template name="list.itemsymbol">
								<xsl:with-param name="node" select="parent::itemizedlist"/>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</fo:block>
			</fo:list-item-label>
			
			<fo:list-item-body start-indent="body-start()">
				<fo:block>
					<xsl:apply-templates mode="titlepage.mode"/>
				</fo:block>
			</fo:list-item-body>

		</fo:list-item>

	</xsl:template>

</xsl:stylesheet>