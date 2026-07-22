Class cip.dtl.FHIR.SDA3.vR4.Encounter.Encounter Extends Ens.DataTransformDTL [ DependsOn = (HS.SDA3.Encounter, HS.FHIR.DTL.vR4.Model.Resource.Encounter), ProcedureBlock ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

ClassMethod classDisplay(code As %String) As %String
{
    quit $Case(code, 
                "AMB": "ambulatory", 
                "EMER": "emergency", 
                "FF": "field",
                "HH": "home health",
                "IMP": "inpatient encounter", 
                "Acute": "inpatient acute",
                "OBSENC": "observation encounter", 
                "PRENC": "pre-admission", 
                "SS": "short dtay", 
                "VR": "virtual",
                :"")
}

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.SDA3.Encounter' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Encounter' create='existing' language='objectscript' >
<annotation> Transforms HS.SDA3.Encounter (SDA3) to Practitioner (vR4) </annotation>
<comment>
<annotation>Apply native DTL as a subtransform</annotation>
</comment>
<subtransform class='HS.FHIR.DTL.SDA3.vR4.Encounter.Encounter' targetObj='target' sourceObj='source' aux='.aux' />
<comment>
<annotation>1. Remove contained inline resources converted from SDA CustomPair.
    2. Override ##class(HS.FHIR.DTL.Util.SDA3.Handler.CustomPairs).Extension() when it&#39;s required, to only convert selected CustomPair.

    For example:HL7MessageObjectId related information is not required, it should be removed.</annotation>
</comment>
<assign value='""' property='target.contained' action='set' />
<comment>
<annotation>Customised Encounter</annotation>
</comment>
<if condition='$isobject(target.class)' >
<true>
<assign value='..classDisplay(target.class.code)' property='target.class.display' action='set' />
</true>
</if>
<assign value='""' property='target.extension' action='set' />
<assign value='""' property='target.serviceProvider' action='set' />
<comment>
<annotation>Convert the additional HL7 content that is not handled by the standard SDA-to-FHIR transformations.</annotation>
</comment>
<assign value='""' property='HL7MessageId' action='set' />
<foreach property='source.CustomPairs()' key='cusKey' >
<if condition='source.CustomPairs.(cusKey).Name="HL7MessageObjectId"' >
<true>
<assign value='source.CustomPairs.(cusKey).Value' property='HL7MessageId' action='set' />
</true>
</if>
</foreach>
<if condition='HL7MessageId&apos;=""' >
<true>
<assign value='##class(cip.util.ExtraHL7toFHIR).ExtraHL7toFHIRProcess(HL7MessageId,"Encounter",.target)' property='status' action='set' />
</true>
</if>
</transform>
}

}
