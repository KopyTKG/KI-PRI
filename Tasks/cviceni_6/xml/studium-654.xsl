<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Course Details - MRL</title>
            </head>
            <body>
                <h1>Course Details - MRL</h1>
                <table>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Instructor</th>
                        <th>Credits</th>
                        <th>Status</th>
                        <th>Completion</th>
                    </tr>
                    <xsl:for-each select="//predmet[@kod='MRL']">
                        <tr>
                            <td><xsl:value-of select="@kod"/></td>
                            <td><xsl:value-of select="nazev"/></td>
                            <td><xsl:value-of select="vyucujici"/></td>
                            <td><xsl:value-of select="kredity"/></td>
                            <td><xsl:value-of select="status"/></td>
                            <td><xsl:value-of select="zakonceni"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
