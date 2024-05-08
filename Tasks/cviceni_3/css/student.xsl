<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Students</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th style="text-align:left">First name</th>
	    <th style="text-align:left">Last name</th>
	    <th style="text-align:left">Faculty</th>
	    <th style="text-align:left">Major</th>
	    <th style="text-align:left">Year</th>
	    <th style="text-align:left">Email</th>
          </tr>
          <xsl:for-each select="students/student">
            <tr>
              <td>
                <xsl:value-of select="Fname"/>
              </td>
              <td>
                <xsl:value-of select="Lname"/>
              </td>
              <td>
                <xsl:value-of select="Faculty"/>
              </td>
              <td>
                <xsl:value-of select="Major"/>
              </td>
              <td>
                <xsl:value-of select="Year"/>
              </td>
              <td>
                <xsl:value-of select="Email"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
