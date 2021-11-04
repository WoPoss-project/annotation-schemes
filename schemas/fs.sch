<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
   <sch:pattern>
      <sch:rule
         context="tei:fs[@type eq 'marker'][tei:f[@name eq 'pertinence'][tei:binary[@value eq 'true']]]">
         <sch:assert test="tei:f[@name eq 'utterance']">Missing tei:f[@name eq
            'utterance']</sch:assert>
         <sch:assert test="tei:f[@name eq 'polarity']">Missing tei:f[@name eq
            'polarity']</sch:assert>
      </sch:rule>
      <sch:rule context="tei:fs[@type eq 'marker']">
         <sch:assert test="tei:f[@name = ('pertinence', 'modal')]"> One of the following features is
            required: 'pertinence, modal'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'pertinence'][parent::tei:fs[@type eq 'marker']]">
         <sch:assert test="tei:binary">Mandatory binary feature</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'modal'][parent::tei:fs[@type eq 'marker']]">
         <sch:assert test="tei:binary">Mandatory binary feature</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'diachrony'][parent::tei:fs[@type eq 'marker']]">
         <sch:assert test="tei:symbol[@value = ('post-modal', 'pre-modal')]"> Incorrect value of
            @value. Possible values are: 'post-modal, pre-modal'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'utterance'][parent::tei:fs[@type eq 'marker']]">
         <sch:assert test="tei:symbol[@value = ('non-interrogative', 'interrogative')]"> Incorrect
            value of @value. Possible values are: 'non-interrogative, interrogative'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'polarity'][parent::tei:fs[@type eq 'marker']]">
         <sch:assert test="tei:symbol[@value = ('affirmative', 'negative')]"> Incorrect value of
            @value. Possible values are: 'affirmative, negative'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:fs[@type eq 'scope'][tei:f[@name eq 'dynamicity']]">
         <sch:assert test="tei:f[@name eq 'control']">Missing tei:f[@name eq 'control']</sch:assert>
      </sch:rule>
      <sch:rule context="tei:fs[@type eq 'scope'][tei:f[@name eq 'control']]">
         <sch:assert test="tei:f[@name eq 'dynamicity']">Missing tei:f[@name eq
            'dynamicity']</sch:assert>
      </sch:rule>
      <sch:rule context="tei:fs[@type eq 'scope']">
         <sch:assert test="tei:f[@name = ('utterance', 'polarity')]"> One of the following features
            is required: 'utterance, polarity'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'utterance'][parent::tei:fs[@type eq 'scope']]">
         <sch:assert test="tei:symbol[@value = ('non-interrogative', 'interrogative')]"> Incorrect
            value of @value. Possible values are: 'non-interrogative, interrogative'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'polarity'][parent::tei:fs[@type eq 'scope']]">
         <sch:assert test="tei:symbol[@value = ('affirmative', 'negative')]"> Incorrect value of
            @value. Possible values are: 'affirmative, negative'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'control'][parent::tei:fs[@type eq 'scope']]">
         <sch:assert test="tei:symbol[@value = ('+-control')] or tei:binary"> Incorrect value.
            Possible values are: a binary element or a symbol element with one of the following
            @value attributes '+-control'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'dynamicity'][parent::tei:fs[@type eq 'scope']]">
         <sch:assert test="tei:symbol[@value = ('+-dynamic')] or tei:binary"> Incorrect value.
            Possible values are: a binary element or a symbol element with one of the following
            @value attributes '+-dynamic'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'SoA'][parent::tei:fs[@type eq 'scope']]"/>
      <sch:rule
         context="tei:fs[@type eq 'relation'][tei:f[@name eq 'modality'][tei:symbol[@value eq 'dynamic']]]">
         <sch:assert test="tei:f[@name eq 'type']">Missing tei:f[@name eq 'type']</sch:assert>
         <sch:assert test="tei:f[@name eq 'type']/tei:symbol/@value = ('possibility', 'necessity')"
            >Possible values of tei:f[@name eq 'type'] are 'possibility' 'necessity'</sch:assert>
         <sch:assert test="tei:f[@name eq 'participant_control']">Missing tei:f[@name eq
            'participant_control']</sch:assert>
      </sch:rule>
      <sch:rule
         context="tei:fs[@type eq 'relation'][tei:f[@name eq 'modality'][tei:symbol[@value eq 'deontic']]]">
         <sch:assert test="tei:f[@name eq 'type']">Missing tei:f[@name eq 'type']</sch:assert>
         <sch:assert
            test="tei:f[@name eq 'type']/tei:symbol/@value = ('authority', 'acceptability', 'volition', 'intention')"
            >Possible values of tei:f[@name eq 'type'] are 'authority' 'acceptability' 'volition'
            'intention'</sch:assert>
      </sch:rule>
      <sch:rule
         context="tei:fs[@type eq 'relation'][tei:f[@name eq 'type'][tei:symbol[@value eq 'authority']]]">
         <sch:assert test="tei:f[@name eq 'subtype']">Missing tei:f[@name eq 'subtype']</sch:assert>
         <sch:assert
            test="tei:f[@name eq 'subtype']/tei:symbol/@value = ('obligation', 'recommendation', 'permission')"
            >Possible values of tei:f[@name eq 'subtype'] are 'obligation' 'recommendation'
            'permission'</sch:assert>
      </sch:rule>
      <sch:rule
         context="tei:fs[@type eq 'relation'][tei:f[@name eq 'type'][tei:symbol[@value eq 'acceptability']]]">
         <sch:assert test="tei:f[@name eq 'degree']">Missing tei:f[@name eq 'degree']</sch:assert>
         <sch:assert
            test="tei:f[@name eq 'degree']/tei:symbol/@value = ('absolutely_necessary', 'desirable', 'acceptable', 'undesirable', 'unacceptable')"
            >Possible values of tei:f[@name eq 'degree'] are 'absolutely_necessary' 'desirable'
            'acceptable' 'undesirable' 'unacceptable'</sch:assert>
      </sch:rule>
      <sch:rule
         context="tei:fs[@type eq 'relation'][tei:f[@name eq 'modality'][tei:symbol[@value eq 'epistemic']]]">
         <sch:assert test="tei:f[@name eq 'degree']">Missing tei:f[@name eq 'degree']</sch:assert>
         <sch:assert
            test="tei:f[@name eq 'degree']/tei:symbol/@value = ('absolutely_certain', 'probable', 'possible', 'improbable', 'impossible')"
            >Possible values of tei:f[@name eq 'degree'] are 'absolutely_certain' 'probable'
            'possible' 'improbable' 'impossible'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:fs[@type eq 'relation']">
         <sch:assert test="tei:f[@name = ('modality')]"> One of the following features is required:
            'modality'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'modality'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert test="tei:symbol[@value = ('deontic', 'dynamic', 'epistemic')]"> Incorrect
            value of @value. Possible values are: 'deontic, dynamic, epistemic'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'subtype'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert
            test="tei:symbol[@value = ('obligation', 'recommendation', 'permission', 'prospective', 'inevitability')]"
            > Incorrect value of @value. Possible values are: 'obligation, recommendation,
            permission, prospective, inevitability'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'participant_control'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert
            test="tei:symbol[@value = ('participant-imposed', 'participant-inherent', 'situational')]"
            > Incorrect value of @value. Possible values are: 'participant-imposed,
            participant-inherent, situational'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'function'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert test="tei:symbol[@value = ('rhetoric', 'pragmatic')]"> Incorrect value of
            @value. Possible values are: 'rhetoric, pragmatic'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'context'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert test="tei:symbol[@value = ('non-official', 'official')]"> Incorrect value of
            @value. Possible values are: 'non-official, official'</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'source'][parent::tei:fs[@type eq 'relation']]">
         <sch:assert
            test="tei:symbol[@value = ('moral/ethical_norms', 'religious_norms', 'unspecified_norms')]"
            > Incorrect value of @value. Possible values are: 'moral/ethical_norms, religious_norms,
            unspecified_norms'</sch:assert>
      </sch:rule>

      <!--      Verb features-->

      <sch:rule context="tei:f[@name eq 'Tense']">
         <sch:assert test="tei:symbol/@value = ('Fut', 'Past', 'Pqp', 'Pres')">Possible values: Fut,
            Past, Pqp, Pres</sch:assert>    
         <sch:assert test="parent::tei:fs/tei:f[@name eq 'Voice']">Voice feature is mandatory</sch:assert>
         <sch:assert test="
               if (tei:symbol/@value eq 'Past') then
                  parent::tei:fs/tei:f[@name eq 'Aspect']
               else
                  true()">Aspect feature is mandatory</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'VerbForm']">
         <sch:assert test="tei:symbol/@value = ('Fin', 'Gdv', 'Ger', 'Inf', 'Part')">Possible
            values: Fin, Gdv, Ger, Inf, Part.</sch:assert>
         <sch:assert test="
               if (tei:symbol/@value = ('Inf', 'Part')) then
                  parent::tei:fs/tei:f[@name eq 'Tense']
               else
                  true()">Voice feature is mandatory</sch:assert>
         <sch:assert test="
               if (tei:symbol/@value = 'Fin') then
               parent::tei:fs/tei:f[@name eq 'Person'] and parent::tei:fs/tei:f[@name eq 'Number'] 
               and parent::tei:fs/tei:f[@name eq 'Mood'] and parent::tei:fs/tei:f[@name eq 'Tense']
               else
                  true()">Person, Number, Mood and Tense features are mandatory</sch:assert>
         <sch:assert test="
               if (tei:symbol/@value = ('Gdv', 'Part')) then
                  parent::tei:fs/tei:f[@name eq 'Case'] and
                  parent::tei:fs/tei:f[@name eq 'Gender'] and parent::tei:fs/tei:f[@name eq 'Number']
               else
                  true()">Case, Person and Number features are mandatory</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'Aspect']">
         <sch:assert test="tei:symbol/@value = ('Imp', 'Perf')">Possible values: Imp,
            Perf.</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'Number']">
         <sch:assert test="tei:symbol/@value = ('Plur', 'Sing')">Possible values: Plur,
            Sing.</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'Voice']">
         <sch:assert test="tei:symbol/@value = ('Act', 'Pass')">Possible values: Act,
            Pass.</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'Mood']">
         <sch:assert test="tei:symbol/@value = ('Imp', 'Ind', 'Sub')">Possible values: Imp, Ind,
            Sub</sch:assert>
      </sch:rule>
      <sch:rule context="tei:f[@name eq 'Person']">
         <sch:assert test="tei:symbol/@value = ('1', '2', '3')">Possible values: 1, 2,
            3.</sch:assert>
      </sch:rule>
      
<!--      Noun features-->
      <sch:rule context="tei:f[@name eq 'Gender']">
         <sch:assert test="tei:symbol/@value = ('Masc', 'Fem', 'Neut')">Possible values: Masc,
            Fem, Neut.</sch:assert>
         <sch:assert test="parent::tei:fs/tei:f[@name eq 'Number'] and parent::tei:fs/tei:f[@name eq 'Case']">Number feature is mandatory</sch:assert>
      </sch:rule>
      
      <sch:rule context="tei:f[@name eq 'Case']">
         
         <sch:assert test="tei:symbol/@value = ('Abl', 'Acc', 'Dat', 'Gen', 'Loc', 'Nom', 'Voc')">Possible
            values: Abl, Acc, Dat, Gen, Loc, Nom, Voc.</sch:assert>
      </sch:rule>
         
<!--         Other-->
         <sch:rule context="tei:f[@name eq 'Degree']">
            <sch:assert test="tei:symbol/@value = ('Cmp', 'Pos', 'Sup')">Possible values: Cmp, Pos, Sup.</sch:assert>
      </sch:rule>
   </sch:pattern>
</sch:schema>
