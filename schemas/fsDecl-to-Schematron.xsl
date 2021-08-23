<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="apos">&apos;</xsl:variable>
    <xsl:variable name="boundary">&apos;, &apos;</xsl:variable>
    <xsl:template match="/">
        <xsl:result-document href="fs.sch">
            <sch:schema queryBinding="xslt2">
                <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
                <sch:pattern>
                    <xsl:apply-templates select="//fsdDecl"/>
                </sch:pattern>
            </sch:schema>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="fsDecl">
        <xsl:variable name="names">
            <xsl:value-of select="string-join(fDecl[@optional eq 'false']/@name, ', ')"/>
        </xsl:variable>
        <xsl:variable name="f-values">
            <xsl:value-of select="replace($names, ', ', $boundary)"/>
        </xsl:variable>
        <xsl:variable name="context"
            select="'tei:fs[@type eq ' || $apos || current()/@type || $apos || ']'"/>
        <xsl:if test="fsConstraints">
            <xsl:for-each select="fsConstraints/cond">
                <xsl:variable name="condition" select="fs[following-sibling::then]/f"/>
                <xsl:variable name="then" select="fs[preceding-sibling::then]/f"/>
                <sch:rule>
                    <xsl:choose>
                        <xsl:when test="$condition[not(child::*)]">

                            <xsl:attribute name="context"
                                select="$context || '[tei:f[@name eq ' || $apos || $condition/@name || $apos || ']]'"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="context" select="
                                    $context || '[tei:f[@name eq ' || $apos || $condition/@name || $apos ||
                                    '][tei:' || $condition/*/name() || '[@' || $condition/*/name(@*) || ' eq ' || $apos || $condition/*/@* || $apos || ']]]'"
                            /> 
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each select="$then">                        
                        <xsl:variable name="test" select="'tei:f[@name eq ' || $apos || current()/@name || $apos || ']'"></xsl:variable>
                        <sch:assert>
                            <xsl:attribute name="test"
                                select="$test"
                            />Missing <xsl:value-of select="$test"/>
                        </sch:assert>
                        <xsl:if test="current()/vAlt">
                            <xsl:variable name="controlled_values" select="for $x in vAlt/symbol/@value return $apos || $x || $apos"/>                                
                            <sch:assert>
                                <xsl:attribute name="test"
                                    select="$test || '/tei:symbol/@value = (' || string-join($controlled_values, ','), ')'"
                                />Possible values of <xsl:value-of select="$test"/> are <xsl:value-of select="$controlled_values"/>
                            </sch:assert>
                        </xsl:if>
                                 
                        
                    </xsl:for-each>
                </sch:rule>
            </xsl:for-each>
        </xsl:if>
        <sch:rule>
            <xsl:attribute name="context" select="$context"/>
            
            <sch:assert>
                <xsl:attribute name="test">
                    <xsl:value-of select="concat('tei:f[@name = (', $apos, $f-values, $apos, ')]')"
                    />
                </xsl:attribute> One of the following features is required: <xsl:value-of
                    select="concat($apos, $names, $apos)"/>
            </sch:assert>
        </sch:rule>
        <xsl:apply-templates select="fDecl"/>
    </xsl:template>
    <xsl:template match="fDecl">
        <sch:rule>
            <xsl:attribute name="context">
                <xsl:value-of
                    select="concat('tei:f[@name eq ', $apos, current()/@name, $apos, ']', '[parent::tei:fs[@type eq ', $apos, current()/parent::fsDecl/@type, $apos, ']]')"
                />
            </xsl:attribute>
            <xsl:if test="vRange/vNot">
                <sch:assert>
                    <xsl:attribute name="test">tei:string/text()</xsl:attribute>
                    <xsl:text>This cannot be an empty element</xsl:text>
                </sch:assert>
            </xsl:if>
            <xsl:if test="vRange/vAlt/count(distinct-values(*/name())) = 1">
                <xsl:choose>
                    <xsl:when test="vRange/vAlt/binary">
                        <sch:assert>
                            <xsl:attribute name="test">tei:binary</xsl:attribute>
                            <xsl:text>Mandatory binary feature</xsl:text>
                        </sch:assert>
                    </xsl:when>
                    <xsl:otherwise>
                        <sch:assert>
                            <xsl:attribute name="test">
                                <xsl:variable name="symbols">
                                    <xsl:value-of
                                        select="replace(string-join(./vRange/vAlt/symbol/@value, ','), ',', $boundary)"
                                    />
                                </xsl:variable>
                                <xsl:value-of
                                    select="concat('tei:symbol[@value = (', $apos, $symbols, $apos, ')]')"
                                />
                            </xsl:attribute> Incorrect value of @value. Possible values are:
                                <xsl:value-of
                                select="concat($apos, string-join(./vRange/vAlt/symbol/@value, ', '), $apos)"
                            />
                        </sch:assert>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="vRange/vAlt/count(distinct-values(*/name())) = 2">
                <sch:assert>
                    <xsl:attribute name="test">
                        <xsl:variable name="symbols">
                            <xsl:value-of
                                select="replace(string-join(./vRange/vAlt/symbol/@value, ','), ',', $boundary)"
                            />
                        </xsl:variable>
                        <xsl:value-of
                            select="concat('tei:symbol[@value = (', $apos, $symbols, $apos, ')] or tei:binary')"
                        />
                    </xsl:attribute> Incorrect value. Possible values are: a binary element
                    or a symbol element with one of the following @value attributes <xsl:value-of
                        select="concat($apos, string-join(./vRange/vAlt/symbol/@value, ', '), $apos)"
                    />
                </sch:assert>
            </xsl:if>
        </sch:rule>

    </xsl:template>
</xsl:stylesheet>
