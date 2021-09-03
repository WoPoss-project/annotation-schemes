<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:let name="counterpart" value="collection('*')//tei:TEI[@source = current()//tei:TEI/@source]"/>
    <sch:pattern>
        <sch:rule context="tei:seg">
            <sch:let name="type" value="@type"/>
            <sch:let name="types" value="('participant', 'negation', 'scope', 'marker')"/>
            <sch:let name="part_types"
                value="('animate', 'inanimate', 'inanimate_patient', 'animate_patient')"/>
            <sch:assert test="@type">@type attribute is mandatory with one of these values:
                    <sch:value-of select="$types"/></sch:assert>
            <sch:assert test="
                    if (@corresp) then
                        every $x in tokenize(@corresp, '\s+')
                            satisfies substring($x, 2) = //tei:fs/@xml:id
                    else
                        true()">@corresp does not have a corresponding ID in feature
                structures</sch:assert>
            <sch:assert test="
                    if (@part) then
                        every $x in tokenize(@part, '\s+')
                            satisfies $x = //tei:fs[@type eq $type]/@xml:id
                    else
                        true()">@part does not have a corresponding ID in feature
                structures</sch:assert>
            <sch:report test="tei:w/following-sibling::text()[matches(., '\S')]">Segmentation
                issue</sch:report>
            <sch:report test="
                    if (@part) then
                        descendant::tei:seg[substring(@corresp, 2) eq current()/@part]
                    else
                        false()">Unnecessary nested segs</sch:report>
            <sch:report test="
                if (@type eq 'marker') then
                descendant::tei:seg[@type eq 'marker']
                else
                false()">Unnecessary nested segs</sch:report>
            <sch:assert test="
                    if (@type eq 'participant') then
                        @subtype = $part_types
                    else
                        true()">Attribute subtype is mandatary with one of these values:
                    <sch:value-of select="$part_types"/></sch:assert>
            <sch:assert test="
                    if (@type eq 'participant') then
                        every $x in tokenize(@ana, '\s+')
                            satisfies $x = //tei:fs[@type eq 'scope']/@xml:id
                    else
                        true()">Attribute @ana is missing or no corresponding ID was
                found in feature structures</sch:assert>
            <sch:assert test="
                    if (@type eq 'negation') then
                        every $x in tokenize(@ana, '\s+')
                            satisfies $x = //tei:fs[@type = ('marker', 'scope')]/@xml:id
                    else
                        true()">Attribute @ana is missing or no corresponding ID was
                found in feature structures</sch:assert>
            <sch:assert test="
                    if (@type = ('scope', 'marker')) then
                        @part or @corresp
                    else
                        true()">Either attribute @part or @corresp is
                missing</sch:assert>
            <sch:let name="corresp" value="
                    for $x in tokenize(@corresp, '\s+')
                    return
                        substring($x, 2)"/>
            <sch:report
                test="if (@corresp and not(@part)) then (following::tei:seg[some $x in tokenize(@part, '\s+') 
                satisfies $x = $corresp] or preceding::tei:seg[some $x in tokenize(@part, '\s+') satisfies $x = $corresp]) else false() "
            >@part attribute missing</sch:report>            
            <sch:report test="if (@copyOf) then @copyOf = following::tei:seg/@copyOf else false()">Value of reference is not unique</sch:report>
            <sch:report test="substring(@copyOf, 2) = $counterpart//tei:seg/@xml:id">This ID is not reference in parallel gospel</sch:report>
        </sch:rule>

        <sch:rule context="tei:fs[@type eq 'scope']">
            <sch:assert test="tei:f[@name eq 'SoA'] or tei:f[@name eq 'dynamicity']">SoA description
                missing</sch:assert>
            <sch:assert test="@xml:id = //tei:fs[@type eq 'relation']/tei:f[@name eq 'scope']/@fVal"
                >This scope is not part of a modal relation</sch:assert>
            <sch:assert test="
                    some $x in //tei:body//tei:seg[@type eq 'scope']/tokenize(@corresp, '\s+')
                        satisfies $x = '#' || current()/@xml:id">ID not referenced in
                text</sch:assert>
        </sch:rule>
        <sch:rule context="tei:fs[@type eq 'marker']">
            <sch:assert test="
                    some $x in //tei:body//tei:seg[@type eq 'marker']/tokenize(@corresp, '\s+')
                        satisfies $x = '#' || current()/@xml:id">ID not referenced in
                text</sch:assert>
            <sch:assert test="
                    if (tei:f[@name eq 'pertinence']/tei:binary/@value eq 'true') then
                        @xml:id = //tei:fs[@type eq 'relation']/tei:f[@name eq 'marker']/@fVal
                    else
                        true()">This marker is not part of a modal relation</sch:assert>
        </sch:rule>
        <sch:rule context="tei:fs[@type eq 'relation']">
            <sch:let name="repeated_relation" value="
                    following-sibling::tei:fs[@type eq 'relation'][tei:f[@name eq 'marker']/@fVal = current()/tei:f[@name eq 'marker']/@fVal]
                    [tei:f[@name eq 'scope']/@fVal = current()/tei:f[@name eq 'scope']/@fVal][tei:f[@name eq 'modality']/tei:symbol/@value = current()/tei:f[@name eq 'modality']/tei:symbol/@value]
                    [tei:f[@name eq 'type']/tei:symbol/@value = current()/tei:f[@name eq 'type']/tei:symbol/@value]
                    [tei:f[@name eq 'subtype']/tei:symbol/@value = current()/tei:f[@name eq 'subtype']/tei:symbol/@value]
                    [tei:f[@name eq 'degree']/tei:symbol/@value = current()/tei:f[@name eq 'degree']/tei:symbol/@value]"/>
            <sch:assert test="tei:f[@name eq 'marker']/@fVal = //tei:fs[@type eq 'marker']/@xml:id"
                >Marker ID not available</sch:assert>
            <sch:assert test="tei:f[@name eq 'scope']/@fVal = //tei:fs[@type eq 'scope']/@xml:id"
                >Scope ID not available</sch:assert>
            <sch:report test="$repeated_relation">Relation <sch:value-of
                    select="$repeated_relation/@xml:id"/> is identical to this one</sch:report>
        </sch:rule>
        <sch:rule context="tei:s">
            <sch:report test="text()[matches(., '\S')]">No text nodes allowed as children of
                s</sch:report>
        </sch:rule>
        <sch:rule context="tei:w">
            <sch:assert test="
                    if (@msd) then
                        substring(@msd, 2) = //tei:fs/@xml:id
                    else
                        true()">No corresponding ID found in feature
                structures</sch:assert>
            <sch:assert test="
                    if (ancestor::tei:TEI[@xml:lang eq 'la'] and (ancestor::tei:seg or descendant::tei:seg) and not(ancestor::tei:supplied)) then
                        @rend or @msd
                    else
                        true()">Morphological analysis missing</sch:assert>

        </sch:rule>
        <sch:rule context="tei:note">
            <sch:report test="string-length(.) eq 0">Empty note</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>
