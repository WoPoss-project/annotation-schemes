<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:let name="lemma_markers" value="
                ('aequus', 'iniquus', 'aptus', 'ineptus', 'certus', 'incertus',
                'dubius', 'illicitus', 'licitus', 'necessarius', 'certo', 'dubium', 'necessarium', 'necessario', 'facultas',
                'possibilitas', 'potestas', 'necessitas', 'necessitudo', 'probabilitas', 'voluntas', 'certe', 'dubie', 'forsitam',
                'forstan', 'fortasse', 'indubitate', 'indubitanter', 'necessarie', 'possibiliter', 'probabiliter', 'debeo', 'possum',
                'nequeo', 'queo', 'malo', 'volo', 'nolo', 'licet', 'decet', 'oportet', 'valeo', 'valet', 'necesse', 'ius')"
        />
        <sch:rule context="tei:w[not(@function)][not(ancestor::tei:seg[@type eq 'marker'])][not(descendant::tei:seg[@type eq 'marker'])]">
            <sch:report test="@lemma = $lemma_markers">Possible modal marker?</sch:report>
            <sch:report test="@pos eq 'VERB' and matches(., '[ae]nd[aeiou][smeoa]?(rum)?$') and @lemma[not(contains(., 'nd'))]">Possible modal marker?</sch:report>
            <sch:report test="@pos eq 'ADJ' and matches(@lemma, '[ai]bilis')">Possible modal marker?</sch:report>
            <sch:report test="@pos eq 'VERB' and matches(., '.+tur[aeiou][smeoa]?(rum)?') and @lemma[not(contains(., 'tur'))]">Possible modal marker?</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>
