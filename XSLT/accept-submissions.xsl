<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:variable name="registries" select="doc('../registries.xml')/registries"/>
  <xsl:template match="/">
    <xsl:for-each select="collection('../submissions/')">
      <xsl:variable name="submission" select="/submission"/>
      <!-- testing if all fields are defined in the registry. -->
      <xsl:for-each select="$submission/*[not(local-name() eq 'value')]">
        <xsl:if test="not(local-name() = $registries/registry[@id eq $submission/@registry]/field/@id)">
          <xsl:message terminate="no">
            <xsl:text>Unknown field "</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>": not defined in registry "</xsl:text>
            <xsl:value-of select="../@registry"/>
            <xsl:text>"</xsl:text>
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
      <!-- testing if fields required in the registry are present. -->
      <xsl:for-each select="$registries/registry[@id eq $submission/@registry]/field[@occurrence eq 'mandatory']">
        <xsl:if test="empty($submission/*[local-name() eq current()/@id])">
          <xsl:message terminate="no">
            <xsl:text>Required field "</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>" defined in registry "</xsl:text>
            <xsl:value-of select="../@id"/>
            <xsl:text>" not present</xsl:text>
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
      <xsl:variable name="subdate" select="$submission/@date"/>
      <xsl:result-document href="../_posts/{format-number(year-from-dateTime($subdate), '0000')}-{format-number(month-from-dateTime($subdate), '00')}-{format-number(day-from-dateTime($subdate), '00')}-submission.md" method="text">
        <xsl:text>---&#xa;</xsl:text>
        <xsl:text>layout: submission&#xa;</xsl:text>
        <xsl:text>registry: </xsl:text>
        <xsl:value-of select="$submission/@registry"/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>---&#xa;</xsl:text>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>