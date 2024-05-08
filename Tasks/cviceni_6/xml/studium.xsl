<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/uni-studium">
        <html>
            <head>
                <title>Study Program Details</title>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h2 { color: #333; }
                </style>
            </head>
            <body>
                <h1>Study Program Details</h1>
                <xsl:for-each select="uni-rocnik">
                    <h2>Year <xsl:value-of select="@cislo"/></h2>
                    <xsl:for-each select="semestr">
                        <h3><xsl:value-of select="@nazev"/> Semester</h3>
                        <table>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Instructor</th>
                                <th>Credits</th>
                                <th>Status</th>
                                <th>Completion</th>
                            </tr>
                            <xsl:for-each select="predmet">
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
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
