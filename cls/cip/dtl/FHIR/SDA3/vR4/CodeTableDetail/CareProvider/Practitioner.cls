Class cip.dtl.FHIR.SDA3.vR4.CodeTableDetail.CareProvider.Practitioner Extends Ens.DataTransformDTL [ DependsOn = (HS.SDA3.CodeTableDetail.CareProvider, HS.FHIR.DTL.vR4.Model.Resource.Practitioner), ProcedureBlock ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.SDA3.CodeTableDetail.CareProvider' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Practitioner' create='existing' language='objectscript' >
<annotation> Transforms HS.SDA3.CodeTableDetail.CareProvider (SDA3) to Practitioner (vR4) </annotation>
<comment>
<annotation>Apply native DTL as a subtransform</annotation>
</comment>
<subtransform class='HS.FHIR.DTL.SDA3.vR4.CodeTableDetail.CareProvider.Practitioner' targetObj='target' sourceObj='source' aux='.aux' />
<comment>
<annotation>1. Remove contained inline resources converted from SDA CustomPair.
2. Override ##class(HS.FHIR.DTL.Util.SDA3.Handler.CustomPairs).Extension() when it&#39;s required, to only convert selected CustomPair.

For example:HL7MessageObjectId related information is not required, it should be removed.</annotation>
</comment>
</transform>
}

}
