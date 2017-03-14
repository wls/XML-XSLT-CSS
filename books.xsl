<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- All this does is make simple HTML, the format is in the CSS file -->

<xsl:template match="/">
  <html>
  <head>
  <title>Books</title>
  <link rel="StyleSheet" href="books.css" type="text/css" media="screen" />
  </head>
  <body>
    <h1>Books</h1>
    <table>
    <tr>
      <th>Title</th>
      <th>Author</th>
      <th>ISBN</th>
    </tr>
    <xsl:for-each select="BOOKS/BOOK">
	<xsl:sort select="TITLE" order="ascending" />
    <tr>
      <td><xsl:value-of select="TITLE"/></td>
      <td><xsl:value-of select="AUTHOR"/></td>
      <td><xsl:value-of select="ISBN"/></td>
    </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>