<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="https://github.com/dret/RegHub">
  <xsl:output name="MD" method="text"/>
  <xsl:template match="registries">
    <xsl:result-document href="README.md" format="MD">
      <xsl:text># RegHub

RegHub is designed to manage protocol registries in a simple GitHub-based workflow. This repository is both the repository for RegHub itself, as well as [the registry for RegHub field types. Registered RegHub field types](field-types) are fields that have a well-defined global meaning when using RegHub. RegHub allows extension fields as well, but for these, their meaning depends on the context where they are used.

For more information about what RegHub is and how to use it, please refer to the [RegHub overview](overview.md).

</xsl:text>
      <xsl:text>## Registries

The following registries are maintained in this repository:

</xsl:text>
      <xsl:for-each select="registry">
        <xsl:variable name="registry" select="doc(concat('../', @id, '/registry.xml'))"/>
        <xsl:text>* [</xsl:text>
        <xsl:value-of select="$registry/registry/name/text()"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>)&#xa;</xsl:text>
      </xsl:for-each>
      <xsl:text>&#xa;</xsl:text>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>