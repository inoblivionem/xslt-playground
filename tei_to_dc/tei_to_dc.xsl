<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xsl:template match="tei:TEI">
        <xsl:result-document href="dcfromtei.xml" method="xml" indent="yes" exclude-result-prefixes="tei xi">
            <dc:dc>
                <dc:title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </dc:title>

                <dc:identifier>
                    <xsl:value-of select="@xml:id"/>
                </dc:identifier>

                <dc:contributer>
                    <xsl:apply-templates
                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>
                </dc:contributer>

                <dc:date>
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when"/>
                </dc:date>

                <dc:publisher>
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                </dc:publisher>

                <xsl:for-each
                    select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords[@scheme = 'dc']/tei:term">
                    <dc:subject>
                        <xsl:value-of select="."/>
                    </dc:subject>
                </xsl:for-each>


                <xsl:for-each select="tei:teiHeader/tei:profileDesc/tei:abstract">
                    <dc:description>
                        <xsl:text>(</xsl:text>
                        <xsl:value-of select="@xml:lang"/>
                        <xsl:text>) </xsl:text>
                        <xsl:apply-templates select="tei:p"/>
                    </dc:description>
                </xsl:for-each>


                <dc:language>
                    <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:langUsage/tei:language"
                    />
                </dc:language>

                <dc:rights>
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/@status"
                    />
                </dc:rights>

                <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p">
                    <dc:source>
                        <xsl:value-of select="."/>
                    </dc:source>
                </xsl:for-each>
                
                <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl">
                    <dc:source>
                        <xsl:text>Type de la source : </xsl:text>
                        <xsl:value-of select="@type"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:title[@type = 'main']"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:editor"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:publisher"/>
                        <xsl:text>, </xsl:text>
                        <xsl:text>publié le : </xsl:text>
                        <xsl:if test="@type = 'numerisation'">
                            <xsl:value-of select="tei:date/@when"/>
                            <xsl:text>.</xsl:text>
                        </xsl:if>
                        <xsl:if test="@type = 'papier'">
                            <xsl:value-of
                                select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msPart/tei:msContents/tei:msItem/tei:docDate/@when"/>
                            <xsl:text>.</xsl:text>
                        </xsl:if>
                    </dc:source>
                </xsl:for-each>



            </dc:dc>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
