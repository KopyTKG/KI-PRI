<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Courses in the First Semester</title>
                <style>
                    .KI { background-color: #f2f2f2; }
                    .KF { background-color: #dff2f2; }
                </style>
            </head>
            <body>
                <h1>Courses in the First Semester</h1>
                <ul>
                    <xsl:for-each select="uni-rocnik[@cislo='1']/semestr[1]/predmet">
                        <li style="{concat('background-color: #', substring(@katedra, 1, 1), 'f2f2f2')}">
                            <xsl:value-of select="@kod"/> - <xsl:value-of select="nazev"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
