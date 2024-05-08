<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>First Year Winter Semester Courses</title>
            </head>
            <body>
                <h1>First Year Winter Semester Courses</h1>
                <table>
                    <tr>
                        <th>Code</th>
                        <th>Credits</th>
                        <th>Instructor</th>
                        <!-- Other Columns -->
                    </tr>
                    <xsl:for-each select="uni-rocnik[@cislo='1']/semestr[@nazev='zimni']/predmet">
                        <tr>
                            <td><xsl:value-of select="@kod"/></td>
                            <td><xsl:value-of select="kredity"/></td>
                            <td><xsl:value-of select="vyucujici"/></td>
                            <!-- Other Details -->
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
