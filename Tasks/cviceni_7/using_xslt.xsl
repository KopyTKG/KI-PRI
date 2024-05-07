<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
<h2>Collection of Students</h2>
<table border = "1">
<tr bgcolor ="#32218D">
<th>Note</th>
<th>First name</th>
<th>Last name</th>
<th>faculty</th>
<th>studyYear </th>
</tr>
<xsl:for-each select="studenti/student">
<tr>
<td><xsl:value-of select="note"/></td>
<td><xsl:value-of select="Fname"/></td>
<td><xsl:value-of select="Lname"/></td>
<td><xsl:value-of select="faculty"/></td>
<td><xsl:value-of select="studyYear"/></td>
</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:transform>