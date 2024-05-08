<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XHTML/1.0 Transitional" encoding="UTF-8" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/fakulty">
        <html>
            <head>
                <title>Faculty Information</title>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h1>Faculty Information</h1>
                <xsl:for-each select="fakulta">
                    <h2>Faculty of <xsl:value-of select="@děkan"/></h2>
                    <xsl:for-each select="katedra">
                        <h3>Department: <xsl:value-of select="@zkratka_katedry"/></h3>
                        <table>
                            <tr>
                                <th>Leader Name</th>
                                <th>Telephone</th>
                                <th>Email</th>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="vedoucí/jméno"/></td>
                                <td><xsl:value-of select="vedoucí/telefon"/></td>
                                <td><xsl:value-of select="vedoucí/email"/></td>
                            </tr>
                        </table>
                        <h4>Employees</h4>
                        <table>
                            <tr>
                                <th>Name</th>
                                <th>Telephone</th>
                                <th>Email</th>
                                <th>Position</th>
                            </tr>
                            <xsl:for-each select="zaměstnanci/zaměstnanec">
                                <tr>
                                    <td><xsl:value-of select="jméno"/></td>
                                    <td><xsl:value-of select="telefon"/></td>
                                    <td><xsl:value-of select="email"/></td>
                                    <td><xsl:value-of select="pozice"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <h4>Subjects</h4>
                        <table>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Description</th>
                            </tr>
                            <xsl:for-each select="předměty/předmět">
                                <tr>
                                    <td><xsl:value-of select="@zkratka"/></td>
                                    <td><xsl:value-of select="název"/></td>
                                    <td><xsl:value-of select="popis"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                    <h3>Fields of Study</h3>
                    <table>
                        <tr>
                            <th>Field Name</th>
                        </tr>
                        <xsl:for-each select="Obor">
                            <tr>
                                <td><xsl:value-of select="název"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
