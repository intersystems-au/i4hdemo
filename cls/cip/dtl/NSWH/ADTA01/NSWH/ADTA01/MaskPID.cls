Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID Extends Ens.DataTransformDTL [ ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass="EnsLib.HL7.Message" targetClass="EnsLib.HL7.Message" sourceDocType="NSWH_2.4:ADT_A01" targetDocType="NSWH_2.4:ADT_A01" create="copy" language="objectscript" >

  <!-- PID-5.1: last name -->
  <assign value='"XXXX"' property='target.{PID:5.1}' action='set' />
  <!-- PID-5.2: first name -->
  <assign value='"XXXX"' property='target.{PID:5.2}' action='set' />
  <!-- PID-7: date of birth -->
  <assign value='"XXXX"' property='target.{PID:7}' action='set' />
  <!-- PID-8: gender -->
  <assign value='"X"' property='target.{PID:8}' action='set' />

</transform>
}

}
