Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message, ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.3:ADT_A01' targetDocType='NSWH_2.3:ADT_A01' create='copy' language='objectscript' >
<assign value='"XXXX"' property='target.{PID:PatientName.givenname}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientName.familyname}' action='set' />
<assign value='"XXXX"' property='target.{PID:DateofBirth.timeofanevent}' action='set' />
<assign value='"XXXX"' property='target.{PID:Sex}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientIDExternalID.ID}' action='set' />
<assign value='"XXXX"' property='target.{PID:PatientIDInternalID().ID}' action='set' />
</transform>
}

}
