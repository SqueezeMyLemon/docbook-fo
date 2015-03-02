<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	
	<!-- custom admonitions -->
	<xsl:template match="question">

		<xsl:choose>
			<xsl:when test="$admon.graphics != 0">
				<xsl:call-template name="graphical.admonition"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="nongraphical.admonition"/>
			</xsl:otherwise>
		</xsl:choose>
	
	</xsl:template>	
	
	<xsl:template name="admon.graphic">
		<xsl:param name="node" select="."/>
		<xsl:variable name="admon" select="local-name($node)" />
	
		<xsl:variable name="filename">
			<xsl:choose>			
				<!-- use "standard" icons directory -->
				<xsl:when test="$admon='note' or $admon='warning' or $admon='caution' or $admon='tip' or $admon='important'">
					<xsl:value-of select="$admon.graphics.path"/><xsl:value-of select="$admon"/>
				</xsl:when>				
				<!-- use custom icons directory -->
				<xsl:when test="$admon='question'">
					<xsl:value-of select="$custom.admon.graphics.path"/><xsl:value-of select="$admon"/>				
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$admon.graphics.path"/>note
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="$admon.graphics.extension"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$fop.extensions != 0 or $arbortext.extensions != 0">
				<xsl:value-of select="$filename"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>url(</xsl:text>
				<xsl:value-of select="$filename"/>
				<xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="question" mode="title.markup">
		<xsl:param name="allow-anchors" select="0"/>
		<xsl:variable name="title" select="(title|info/title)[1]"/>
		<xsl:choose>
			<xsl:when test="$title">
				<xsl:apply-templates select="$title" mode="title.markup">
					<xsl:with-param name="allow-anchors" select="$allow-anchors"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="gentext">
					<xsl:with-param name="key">
						<xsl:choose>
							<xsl:when test="local-name(.)='question'">Question</xsl:when>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="question/title"></xsl:template>

</xsl:stylesheet>