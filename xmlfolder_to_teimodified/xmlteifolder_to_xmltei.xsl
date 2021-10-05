<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei xs" version="3.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8" version="1.1"/>
    
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node() | @*"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:revisionDesc" name="update-revDesc">
        <xsl:element name="revisionDesc">
            <xsl:for-each select="tei:change">
                <xsl:copy-of select="." _exclude-result-prefixes="tei xs"/>
            </xsl:for-each>
            <change>hi</change>
        </xsl:element>
    </xsl:template>
 
    <xsl:template match="/">
        <xsl:for-each select="collection('documents_folder')">
            <xsl:result-document
                href="out/{substring-before(substring-after(document-uri(),'documents_folder'), '.xml')}.xml">
                <xsl:apply-templates/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
