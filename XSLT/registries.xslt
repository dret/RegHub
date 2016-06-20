<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="https://github.com/dret/RegHub">
  <xsl:output name="MD" method="text"/>
  <xsl:template match="registries">
    <xsl:result-document href="README.md" format="MD">
      <xsl:text># RegHub

Manage Protocol Registries in a simple GitHub-based workflow.

</xsl:text>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>