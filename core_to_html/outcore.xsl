<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>

    <xsl:variable name="name-currentfile">text1-tok.xml</xsl:variable>

    <xsl:template match="/">
        <exsl:document href="html-core.html" method="html">
            <html>
                <head>
                    <title>Edition numérique de <xsl:value-of select=".//tei:titleStmt/tei:title"
                        /></title>
                    <link rel="stylesheet" type="text/css" href="css-core.css"/>
                </head>
                <body>
                    <h1>
                        <xsl:for-each select="//tei:titleStmt/tei:title">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </h1>
                </body>
                <div id="text">
                    <xsl:for-each select="//tei:w">
                        <xsl:variable name="w-id" select="concat($name-currentfile, '#', @xml:id)"/>
                        <span>
                            <xsl:value-of select="."/>

                            <xsl:if test="document('core.xml')//tei:ptr[@target = $w-id]">
                                


                                <sup>
                                    <xsl:attribute name="id">
                                        <xsl:text>note_</xsl:text>
                                        <xsl:number/>
                                    </xsl:attribute>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>#note_</xsl:text>
                                            <xsl:number/>
                                        </xsl:attribute>
                                            <xsl:number/>
                                        
                                    </a>
                                </sup>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                        </span>
                    </xsl:for-each>
                </div>
                <div id="notes">
                    <h2>Notes</h2>
                    <xsl:for-each select="//tei:w">
                        <xsl:variable name="w-id" select="concat($name-currentfile, '#', @xml:id)"/>
                        <xsl:if test="document('core.xml')//tei:ptr[@target = $w-id]">
                            <p>
                                <xsl:attribute name="id">
                                    <xsl:text>note_</xsl:text>
                                    <xsl:number/>
                                </xsl:attribute>
                                <xsl:number/>
                                <xsl:text>. </xsl:text>
                                <xsl:for-each
                                    select="document('core.xml')//tei:ptr[@target = $w-id]">
                                    <xsl:if
                                        test="ancestor::tei:app//tei:ptr[substring-before(@target, '#') != $name-currentfile]">

                                        <xsl:for-each
                                            select="ancestor::tei:app//tei:ptr[substring-before(@target, '#') != $name-currentfile]">
                                            <xsl:variable name="current-filename"
                                                select="substring-before(@target, '#')"/>
                                            <xsl:variable name="siglum"
                                                select="substring-before($current-filename, '.')"/>
                                            <xsl:variable name="current-w-id"
                                                select="substring-after(@target, '#')"/>
                                            <xsl:value-of select="$siglum"/>
                                            <xsl:text> : </xsl:text>
                                            <xsl:apply-templates
                                                select="document($current-filename)//tei:w[@xml:id = $current-w-id]"/>
                                            <xsl:for-each
                                                select="document('core.xml')//tei:ptr[@target = concat($current-filename, '#', $current-w-id)]">
                                                <xsl:if
                                                  test="document('core.xml')//ancestor::tei:app//tei:rdg[tei:ptr[@target = concat($current-filename, '#', $current-w-id)]]/@type">
                                                  <xsl:text> (</xsl:text>
                                                  <xsl:value-of
                                                  select="document('core.xml')//ancestor::tei:app//tei:rdg[tei:ptr[@target = concat($current-filename, '#', $current-w-id)]]/@type"/>
                                                  <xsl:text>)</xsl:text>
                                                  <xsl:text> ; </xsl:text>
                                                </xsl:if>
                                                <xsl:if
                                                  test="document('core.xml')//ancestor::tei:app//tei:rdgGrp[tei:rdg/tei:ptr[@target = concat($current-filename, '#', $current-w-id)]]/@type">
                                                  <xsl:text> (</xsl:text>
                                                  <xsl:value-of
                                                  select="document('core.xml')//ancestor::tei:app//tei:rdgGrp[tei:rdg/tei:ptr[@target = concat($current-filename, '#', $current-w-id)]]/@type"/>
                                                  <xsl:text>)</xsl:text>
                                                  <xsl:text> ; </xsl:text>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </html>


        </exsl:document>
    </xsl:template>

</xsl:stylesheet>
