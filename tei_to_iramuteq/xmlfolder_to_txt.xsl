<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs tei xi dc xsl" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xsl:output method="text" indent="no" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:for-each select="collection('corpus')">
            <xsl:result-document method="xml"
                href="../out/{substring-before(substring-after(document-uri(),'tei_to_iramuteq/corpus'), '.xml')}.txt" indent="no" omit-xml-declaration="yes">
                <xsl:variable name="can"><xsl:value-of select="tei:TEI/@xml:id"/></xsl:variable>
                <xsl:for-each select="//tei:text/tei:group/tei:text/tei:body">
                    <xsl:text>**** </xsl:text> <xsl:text>*candidat_</xsl:text><xsl:value-of select="$can"/><xsl:text> *type_</xsl:text><xsl:value-of select="../@type"/><xsl:text> *theme_</xsl:text><xsl:value-of select="tei:div/@type"/><xsl:text>
</xsl:text>
                    <xsl:for-each select="tei:div">
                        <xsl:for-each select="tei:head"><xsl:text>*-titre 
</xsl:text>
                        <xsl:value-of select="."/><xsl:text>
</xsl:text></xsl:for-each>
                        <xsl:for-each select="tei:p"><xsl:text>*-</xsl:text><xsl:value-of select="../@type"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text>
</xsl:text>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
