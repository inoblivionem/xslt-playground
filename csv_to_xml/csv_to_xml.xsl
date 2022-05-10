<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
    <xsl:output indent="yes" method="xml" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="csv-encoding" as="xs:string" select="'utf-8'"/>
    
    <xsl:param name="csv-uri" as="xs:string"
        select="'file:///[...]/csv_to_xml/parrainagestotal.csv'"/> <!-- absolute path needed -->
    
    <xsl:variable name="rootel"> <!-- name of root element -->
        <xsl:text>Parrainages</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="firstel"> <!-- name of first node -->
        <xsl:text>Parrainage</xsl:text>
    </xsl:variable>
    
    <xsl:template name="csv2xml">
        <xsl:element name="{$rootel}">
            <xsl:choose>
                <xsl:when test="unparsed-text-available($csv-uri, $csv-encoding)">
                    <xsl:variable name="csv" select="unparsed-text($csv-uri, $csv-encoding)"/>
                    <xsl:variable name="header-tokens" as="xs:string*">
                        <xsl:analyze-string select="$csv" regex="\r\n?|\n">
                            <xsl:non-matching-substring>
                                <xsl:if test="position() = 1">
                                    <xsl:copy-of select="tokenize(., ',')"/>
                                </xsl:if>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable>
                    <xsl:analyze-string select="$csv" regex="\r\n?|\n">
                        <xsl:non-matching-substring>
                            <xsl:if test="not(position() = 1)">
                                <xsl:element name="{$firstel}">
                                    <xsl:for-each select="tokenize(., ',')">
                                        <xsl:variable name="pos" select="position()"/>
                                        <xsl:if test="$header-tokens[$pos][. castable as xs:string]">
                                            <xsl:element name="{$header-tokens[$pos]}">
                                                <xsl:value-of select="."/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:if>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:result-document href="xml_from_csv.xml" omit-xml-declaration="yes">
            <xsl:call-template name="csv2xml"></xsl:call-template>
        </xsl:result-document>
    </xsl:template>
    
    
    
</xsl:stylesheet>