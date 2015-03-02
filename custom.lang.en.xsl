<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">

<!-- ******************************************************************** -->
<!-- In these files, % with a letter is used for a placeholder: -->
<!--   %t is the current element's title -->
<!--   %s is the current element's subtitle (if applicable)-->
<!--   %n is the current element's number label-->
<!--   %p is the current element's page number (if applicable)-->
<!-- ******************************************************************** -->

	<xsl:param name="local.l10n.xml" select="document('')"/>

	<l:i18n>

		<l:l10n language="en">
		
			<l:gentext key="Rev" text="Rev." />
			<l:gentext key="Date" text="Date" />
			<l:gentext key="Description" text="Description" />
			<l:gentext key="Question" text="Question" />
			
			<l:context name="title-numbered">
				<l:template name="article/appendix" text="Appendix %n. %t"/>
			</l:context>
			
		</l:l10n>
	
	</l:i18n>

</xsl:stylesheet>