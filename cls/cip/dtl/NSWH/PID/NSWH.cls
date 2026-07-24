Class cip.dtl.NSWH.PID.NSWH Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Segment ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='2.4:PID' targetDocType='2.4:PID' create='copy' language='objectscript' >
<annotation>Generic 2.3.1 and 2.4 PID segment transformation</annotation>
<assign value='..Lookup("PID8_Standard",source.GetValueAt(8),"U")' property='target.{8}' action='set' />
</transform>
}

}
