<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
  <xsl:template name="read-submissions">
    <xsl:param name="registries"/>
    <xsl:for-each select="collection('../submissions/')">
      <xsl:variable name="subdate" select="/submission/@date"/>
      <xsl:result-document href="../_posts/{format-number(year-from-dateTime($subdate), '0000')}-{format-number(month-from-dateTime($subdate), '00')}-{format-number(day-from-dateTime($subdate), '00')}-submission.md" method="text">
        <xsl:text>---&#xa;</xsl:text>
        <xsl:text>layout: submission&#xa;</xsl:text>
        <xsl:text>---&#xa;</xsl:text>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>