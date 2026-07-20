Class cip.dtl.FHIR.SDA3.vR4.Patient.Patient Extends Ens.DataTransformDTL [ DependsOn = (HS.SDA3.Patient, HS.FHIR.DTL.vR4.Model.Resource.Patient), ProcedureBlock ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.SDA3.Patient' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='existing' language='objectscript' >
<annotation> Transforms HS.SDA3.Patient (SDA3) to Patient (vR4) </annotation>
<comment>
<annotation>Apply native DTL as a subtransform</annotation>
</comment>
<subtransform class='HS.FHIR.DTL.SDA3.vR4.Patient.Patient' targetObj='target' sourceObj='source' aux='.aux' />
<comment>
<annotation>1. Remove contained inline resources converted from SDA CustomPair.
2. Override ##class(HS.FHIR.DTL.Util.SDA3.Handler.CustomPairs).Extension() when it&#39;s required, to only convert selected CustomPair.

For example:HL7MessageObjectId related information is not required, it should be removed.</annotation>
</comment>
<assign value='""' property='target.contained' action='set' />
<comment>
<annotation>Remove the existing extension mappings in order to build extensions for FHIR AU Core.</annotation>
</comment>
<assign value='""' property='target.extension' action='set' />
<comment>
<annotation>AU Core extention for Patient -&gt; indigenousStatus</annotation>
</comment>
<if condition='$isobject(source.Race)' >
<true>
<assign value='##class(HS.FHIR.DTL.vR4.Model.Base.Extension).%New() ' property='tmp' action='set' />
<assign value='"http://hl7.org.au/fhir/StructureDefinition/indigenous-status"' property='tmp.url' action='set' />
<assign value='##class(HS.FHIR.DTL.vR4.Model.Datatype.Coding).%New()' property='valueCoding' action='set' />
<assign value='"https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"' property='valueCoding.system' action='set' />
<assign value='source.Race.Code' property='valueCoding.code' action='set' />
<assign value='source.Race.Description' property='valueCoding.display' action='set' />
<assign value='valueCoding' property='tmp.valueCoding' action='set' />
<assign value='target.extension.Insert(tmp)' property='status' action='set' />
<assign value='target.extension.Count()+1' property='index' action='set' />
</true>
</if>
<comment>
<annotation>Extension for Resident Status</annotation>
</comment>
<if condition='$isobject(source.Citizenship)' >
<true>
<assign value='##class(HS.FHIR.DTL.vR4.Model.Base.Extension).%New() ' property='tmp' action='set' />
<assign value='"http://wahealth.com/fhir/StructureDefination/ResidencyStatus"' property='tmp.url' action='set' />
<assign value='##class(HS.FHIR.DTL.vR4.Model.Datatype.Coding).%New()' property='valueCoding' action='set' />
<assign value='source.Citizenship.Code' property='valueCoding.code' action='set' />
<assign value='source.Citizenship.Description' property='valueCoding.display' action='set' />
<assign value='valueCoding' property='tmp.valueCoding' action='set' />
<assign value='target.extension.Insert(tmp)' property='status' action='set' />
<assign value='target.extension.Count()+1' property='index' action='set' />
</true>
</if>
<comment>
<annotation>Minor adjustment for identifier -&gt; MRN</annotation>
</comment>
<foreach property='target.identifier()' key='ideKey' >
<if condition='target.identifier.(ideKey).type.text = "MRN"' >
<true>
<assign value='' property='target.identifier.(ideKey).extension' action='clear' >
<annotation>identifier.extension doesn&#39;t exist in AU Core</annotation>
</assign>
<assign value='"http://hdwa/identifiers/patient"' property='target.identifier.(ideKey).system' action='set' >
<annotation>identifier.system is mandatory in AU Core</annotation>
</assign>
</true>
</if>
</foreach>
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
<assign value='##class(cip.util.ExtraHL7toFHIR).ExtraHL7toFHIRProcess(HL7MessageId,"Patient",.target)' property='status' action='set' />
</true>
</if>
</transform>
}

}
