<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:mets="http://www.loc.gov/METS/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15 http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15/pagecontent.xsd"
    xmlns:pc="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15">

    <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <xsl:result-document href="teifrommets.xml" exclude-result-prefixes="xsi pc mets">
            <TEI>
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of
                                    select="substring-before(substring-after(document-uri(), 'mets_to_tei/'), '.xml')"
                                />
                            </title>
                            <author>
                                <xsl:value-of select="mets:mets/mets:metsHdr/mets:agent/mets:name"/>
                            </author>
                        </titleStmt>

                        <publicationStmt>
                            <p/>
                        </publicationStmt>
                        <sourceDesc>
                            <p/>
                        </sourceDesc>
                    </fileDesc>
                </teiHeader>
                <facsimile>
                    <surfaceGrp>
                        <xsl:for-each select="mets:mets/mets:fileSec/mets:fileGrp/mets:file">
                            <xsl:variable name="filename">
                                <xsl:value-of select="substring-after(mets:FLocat/@href, '/./')"/>
                            </xsl:variable>
                            <xsl:element name="surface">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@ID"/>
                                </xsl:attribute>

                                <xsl:element name="graphic">
                                    <xsl:attribute name="url">
                                        <xsl:value-of
                                            select="document($filename)//pc:Page/@imageFilename"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="width">
                                        <xsl:value-of
                                            select="concat(document($filename)//pc:Page/@imageWidth, 'px')"
                                        />
                                    </xsl:attribute>
                                    <xsl:attribute name="height">
                                        <xsl:value-of
                                            select="concat(document($filename)//pc:Page/@imageHeight, 'px')"
                                        />
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:for-each
                                    select="document(substring-after(mets:FLocat/@href, '/./'))//pc:TextRegion">
                                    <xsl:element name="zone">
                                        <xsl:if test="not(descendant::pc:TextLine)">
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of select="@id"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:if test="pc:Coords/@points">
                                            <xsl:attribute name="points">
                                                <xsl:value-of select="pc:Coords/@points"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:for-each select="pc:TextLine">
                                            <xsl:element name="zone">
                                                <xsl:attribute name="xml:id">
                                                  <xsl:value-of select="@id"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="points">
                                                  <xsl:value-of select="pc:Coords/@points"/>
                                                </xsl:attribute>
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>

                            </xsl:element>
                        </xsl:for-each>
                    </surfaceGrp>
                </facsimile>
                <text>
                    <body>
                        <xsl:for-each select="mets:mets/mets:fileSec/mets:fileGrp">
                            <xsl:element name="div">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@ID"/>
                                </xsl:attribute>
                                <p>
                                    <xsl:for-each select="mets:file">
                                        <xsl:element name="pb">
                                            <xsl:attribute name="source">
                                                <xsl:value-of select="concat('#', @ID)"/>
                                            </xsl:attribute>
                                        </xsl:element>
                                        <xsl:for-each
                                            select="document(substring-after(mets:FLocat/@href, '/./'))//pc:TextLine//pc:Unicode">
                                            <xsl:element name="lb">
                                                <xsl:attribute name="source">
                                                  <xsl:value-of
                                                  select="concat('#', ancestor::pc:TextLine/@id)"/>
                                                </xsl:attribute>
                                            </xsl:element>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </p>
                            </xsl:element>
                        </xsl:for-each>
                    </body>
                </text>

            </TEI>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
