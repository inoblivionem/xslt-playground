<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="http://nwda-db.wsulibs.wsu.edu/xsl/project.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude">
    
<!-- I messed up and did that based on ead 2002 oops -->
    
    <xsl:template match="tei:TEI">
        <xsl:result-document href="ead2002fromtei.xml" method="xml" indent="yes"
            doctype-system="ead.dtd"
            doctype-public="+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN"
            exclude-result-prefixes="tei xi">
            <ead>
                <eadheader>
                    <eadid>
                        <xsl:copy-of select="."/>
                        <xsl:value-of
                            select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:idno[@type = 'ark']"
                        />
                    </eadid>
                    <filedesc>
                        <titlestmt>
                            <titleproper>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"
                                />
                            </titleproper>
                            <author>
                                <xsl:for-each
                                    select="tei:text/tei:front/tei:div/tei:list/tei:item/tei:ref/tei:persName">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>
                            </author>
                        </titlestmt>
                        <publicationstmt>
                            <publisher>
                                <xsl:for-each
                                    select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:editor">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>

                            </publisher>
                            <date>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when"
                                />
                            </date>
                            <address>
                                <addressline>
                                    <xsl:value-of
                                        select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'papier']/tei:pubPlace"
                                    />
                                </addressline>
                            </address>
                        </publicationstmt>
                    </filedesc>
                    <profiledesc>
                        <creation>
                            <xsl:value-of
                                select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/>

                            <date>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when"
                                />
                            </date>
                        </creation>
                    </profiledesc>
                </eadheader>
                <archdesc level="item">
                    <did>
                        <repository>
                            <corpname>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution"/>
                                <subarea>
                                    <xsl:value-of
                                        select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"
                                    />
                                </subarea>
                            </corpname>
                        </repository>
                        <unitid>
                            <xsl:value-of
                                select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msPart/tei:msIdentifier/tei:idno"
                            />
                        </unitid>
                        <unittitle>
                            <xsl:value-of
                                select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msPart/tei:msContents/tei:msItem/tei:title"
                            />
                        </unittitle>
                        <unitdate>
                            <xsl:value-of
                                select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msPart/tei:msContents/tei:msItem/tei:docDate/@when"
                            />
                        </unitdate>
                        <physdesc>
                            <extent>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"
                                />
                            </extent>
                        </physdesc>
                        <abstract>
                            <xsl:value-of
                                select="tei:teiHeader/tei:profileDesc/tei:abstract[@xml:lang = 'fre']"
                            />
                        </abstract>
                        <langmaterial>
                            <language>
                                <xsl:value-of
                                    select="tei:teiHeader/tei:profileDesc/tei:langUsage/tei:language"
                                />
                            </language>
                        </langmaterial>
                    </did>
                    <dsc>
                        <c01 level="series">
                            <did>
                                <unitid><xsl:value-of select="@xml:id"/></unitid>
                                <unittitle><xsl:value-of select="tei:text/tei:front/tei:titlePage/tei:docTitle/tei:titlePart"/><xsl:text>, </xsl:text><xsl:value-of select="tei:text/tei:front/tei:div/tei:dateline/tei:date"/></unittitle>
                            </did>
                            
                                <xsl:for-each select="tei:text/tei:body/tei:div">
                                    <c02 level="subseries">
                                    <did>
                                        <unitid><xsl:value-of select="@xml:id"/></unitid>
                                        
                                        <xsl:if test="@type='article'">
                                            <unittitle><xsl:value-of select="./tei:head"/></unittitle>
                                        </xsl:if>
                                        <xsl:if test="@type='roman'">
                                            <unittitle><xsl:value-of select="./tei:head"/><xsl:text>, chapitre </xsl:text><xsl:value-of select="./tei:div/@n"/></unittitle>
                                        </xsl:if>
                                    </did>
                                    </c02>
                                </xsl:for-each>
                            
                        </c01>
                    </dsc>
                </archdesc>
            </ead>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
