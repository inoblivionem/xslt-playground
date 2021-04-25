<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl" xmlns:str="http://exslt.org/strings"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <!-- WORKS WITH XSLT1.0 ! -->

<!--setting up variable-->
    <xsl:variable name="id" select="tei:TEI/@xml:id"/>

<!--output config-->
    <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>

    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>
    

    <xsl:template match="//*">
        <xsl:choose>
            <xsl:when test="(name() != 'div')">
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="* | text() | @*"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="ancestor::tei:text">
                        <xsl:variable name="currentdiv">
                            <xsl:number/>
                        </xsl:variable>
                        <xsl:copy-of select="tei:div"/>
                        <xsl:element name="{local-name()}">
                            <xsl:apply-templates select="@*"/>
                            <xsl:for-each select="child::tei:p">
                                <xsl:variable name="currentp">
                                    <xsl:number/>
                                </xsl:variable>
                                <xsl:element name="{local-name()}">

                                    <xsl:apply-templates select="@*"/>
                                    <xsl:for-each select="str:tokenize(string(.), ' ')">
                                        <w
                                            xml:id="{concat($id, '-', $currentdiv, '-', $currentp, '-',position())}">
                                            <xsl:value-of select="."/>
                                        </w>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{name()}">
                            <xsl:apply-templates select="* | text() | @*"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/">
        <exsl:document href="tokenizedfile.xml" method="xml" encoding="UTF-8">
                <xsl:apply-templates/>
        </exsl:document>
    </xsl:template>
    
<!-- 2 issues with this tokenizer : first it can't put namespace in the root element of the tokenized file and I can't find any solution other than adding it by hand 
    second, you'll have to adjust in the xsl file your number of div elements in your arborescence since it only works for text/body/div/p
    to sum up : you can have as many p as you want in a div and you can have as many div as you want in your body, but you can't put a div in a div without adjusting the xsl file -->


</xsl:stylesheet>
