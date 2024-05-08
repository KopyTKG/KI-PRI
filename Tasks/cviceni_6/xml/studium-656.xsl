<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Courses by Semester (Credits > 2)</title>
            </head>
            <body>
                <h1>Courses by Semester (Credits > 2)</h1>
                <xsl:for-each select="uni-rocnik/semestr">
                    <h2><xsl:value-of select="@nazev"/> Semester</h2>
                    <table>
                        <tr>
                            <th>Code</th>
                            <th>Name</th>
                            <th>Instructor</th>
                            <th>Credits</th>
                        </tr>
                        <xsl:for-each select="predmet[kredity > 2]">
                            <tr>
                                <td><xsl:value-of select="@kod"/></td>
                                <td><xsl:value-of select="nazev"/></td>
                                <td><xsl:value-of select="vyucujici"/></td>
                                <td><xsl:value-of select="kredity"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
