Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message, ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.3.1:ADT_A01' targetDocType='NSWH_2.3.1:ADT_A01' create='copy' language='objectscript' >
<assign value='"XXXX"' property='target.{PID:PatientName().familylastname.familyname}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientName().givenname}' action='set' />
<assign value='"XXXX"' property='target.{PID:DateTimeOfBirth.timeofanevent}' action='set' />
<assign value='"XXXX"' property='target.{PID:Sex}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientID.ID}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientIdentifierList().ID}' action='set' />
</transform>
}

}
