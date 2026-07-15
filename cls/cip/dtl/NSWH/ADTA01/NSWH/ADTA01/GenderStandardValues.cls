Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.3.1:ADT_A01' targetDocType='NSWH_2.3.1:ADT_A01' create='copy' language='objectscript' >
<assign value='..Lookup("Gender",source.GetValueAt("PID:8"),"U")' property='target.{PID:Sex}' action='set' />
</transform>
}

}
