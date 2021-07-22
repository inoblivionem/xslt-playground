<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>
    
    <xsl:template match="/">
        
        <xsl:result-document href="out/test.xml">
            
            <xsl:copy-of select="."/>
            <xsl:if test=""></xsl:if>
        </xsl:result-document>
        
    </xsl:template>
    
    
</xsl:stylesheet>