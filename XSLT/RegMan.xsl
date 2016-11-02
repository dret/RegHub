<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
  <xsl:variable name="submissions" select="'submissions'"/>
  <xsl:include href="reader.xsl"/>
  <xsl:template match="/">
    <xsl:call-template name="read-submissions">
      <xsl:with-param name="submissions" select="$submissions"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>