<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Last Semester Courses by Credits</title>
            </head>
            <body>
                <h1>Last Semester Courses by Credits</h1>
                <table>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Credits</th>
                    </tr>
                    <xsl:for-each select="(uni-rocnik/semestr/predmet)[last()]">
                        <xsl:sort select="kredity" data-type="number" order="descending"/>
                        <tr>
                            <td><xsl:value-of select="@kod"/></td>
                            <td><xsl:value-of select="nazev"/></td>
                            <td><xsl:value-of select="kredity"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
