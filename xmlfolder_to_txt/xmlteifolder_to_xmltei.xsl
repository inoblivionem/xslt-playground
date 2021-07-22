<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="@* | node()">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="/">
        <xsl:for-each select="collection('documents_folder')">
            <xsl:result-document method="xml"
                href="out/{substring-before(substring-after(document-uri(),'documents_folder'), '.xml')}.xml">
                <xsl:apply-templates/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
