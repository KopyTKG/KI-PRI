<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Semesters by Total Credits</title>
            </head>
            <body>
                <h1>Semesters by Total Credits</h1>
                <ul>
                    <xsl:for-each select="uni-rocnik/semestr">
                        <li>
                            <xsl:value-of select="@nazev"/> - Total Credits: 
                            <xsl:value-of select="sum(predmet/kredity)"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
