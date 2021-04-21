<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15 http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15/pagecontent.xsd" xmlns:pc="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15">
    
    <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>
    
    <xsl:template match="/">
        <xsl:result-document href="../out/teifromxmlpage.xml" exclude-result-prefixes="xi xsi pc">
            <TEI>
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title><xsl:value-of select="substring-before(substring-after(document-uri(),'source/'),'.xml')"/></title>
                            <author><xsl:value-of select="pc:PcGts/pc:Metadata/pc:Creator"/>
                            </author>
                        </titleStmt>
                    </fileDesc>
                    <revisionDesc>
                        <xsl:element name="change"><xsl:attribute name="when"><xsl:value-of select="pc:PcGts/pc:Metadata/pc:Created"/></xsl:attribute>Creation</xsl:element>
                        <xsl:element name="change"><xsl:attribute name="when"><xsl:value-of select="pc:PcGts/pc:Metadata/pc:LastChange"/></xsl:attribute>Last change</xsl:element>
                    </revisionDesc>
                </teiHeader>
                <sourceDoc>
                    <xsl:element name="surfaceGrp"><xsl:attribute name="xml:id"><xsl:value-of select="pc:PcGts/pc:Page/pc:TextRegion/@id"/></xsl:attribute></xsl:element>
                    <surface>
                        <xsl:element name="graphic">
                            <xsl:attribute name="uri"><xsl:value-of select="pc:PcGts/pc:Page/@imageFilename"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="width"><xsl:value-of select="pc:PcGts/pc:Page/@imageWidth"/></xsl:attribute>
                            <xsl:attribute name="height"><xsl:value-of select="pc:PcGts/pc:Page/@imageHeight"/></xsl:attribute>
                        </xsl:element>
                        <xsl:for-each select="pc:PcGts/pc:Page/pc:TextRegion/pc:TextLine">
                            <xsl:element name="zone"><xsl:attribute name="xml:id"><xsl:value-of select="@id"/></xsl:attribute>
                                <xsl:attribute name="points"><xsl:value-of select="pc:Coords/@points"/></xsl:attribute>
                            <xsl:element name="line"><xsl:value-of select="pc:TextEquiv/pc:Unicode"/></xsl:element>
                            </xsl:element>
                        </xsl:for-each>
                    </surface>
                </sourceDoc>
            </TEI>
        </xsl:result-document>
    </xsl:template>
    <!-- pc:PcGts/pc:Page/pc:TextRegion/pc:TextLine/pc:Baseline's missing, I didn't know where to put it -->

</xsl:stylesheet>
