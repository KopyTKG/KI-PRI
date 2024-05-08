<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
	<html>
	    <head>
		<title>All Courses</title>
	    </head>
	    <body>
		<h1>All Courses</h1>
		<ul>
		    <xsl:for-each select="//predmet">
			<li><xsl:value-of select="@kod"/> - <xsl:value-of select="nazev"/></li>
		    </xsl:for-each>
		</ul>
	    </body>
	</html>
    </xsl:template>
</xsl:stylesheet>
