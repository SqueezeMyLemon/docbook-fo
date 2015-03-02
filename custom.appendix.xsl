<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- 
  ***********************************************
  **  Appendices                               **          
  *********************************************** 
-->
	
	<xsl:template match="article/appendix">
		<xsl:variable name="id">
			<xsl:call-template name="object.id"/>
		</xsl:variable>

		<xsl:variable name="title">
			<xsl:apply-templates select="." mode="object.title.markup"/>
		</xsl:variable>

		<xsl:variable name="titleabbrev">
			<xsl:apply-templates select="." mode="titleabbrev.markup"/>
		</xsl:variable>

		<fo:block id='{$id}' break-before="page">
			<xsl:if test="$axf.extensions != 0">
				<xsl:attribute name="axf:outline-level">
					<xsl:value-of select="count(ancestor::*)+2"/>
				</xsl:attribute>
				<xsl:attribute name="axf:outline-expand">false</xsl:attribute>
				<xsl:attribute name="axf:outline-title">
					<xsl:value-of select="normalize-space($titleabbrev)"/>
				</xsl:attribute>
			</xsl:if>

			<fo:block xsl:use-attribute-sets="article.appendix.title.properties">
				<fo:marker marker-class-name="section.head.marker">
					<xsl:choose>
						<xsl:when test="$titleabbrev = ''">
							<xsl:value-of select="$title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$titleabbrev"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:marker>
				<xsl:copy-of select="$title"/>
			</fo:block>

			<xsl:call-template name="make.component.tocs"/>

			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>


</xsl:stylesheet>