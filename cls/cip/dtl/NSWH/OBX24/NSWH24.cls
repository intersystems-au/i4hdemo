Class cip.dtl.NSWH.OBX24.NSWH24 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Segment ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='NSWH_2.4:OBX' targetDocType='NSWH_2.4:OBX' create='copy' language='objectscript' >
<assign value='..Lookup("OBX31_Standard",source.GetValueAt("ObservationIdentifier.identifierST"),source.GetValueAt("ObservationIdentifier.identifierST"))' property='target.{ObservationIdentifier.identifierST}' action='set' />
<assign value='..Lookup("OBX8_Standard",source.GetValueAt("AbnormalFlags"),source.GetValueAt("AbnormalFlags"))' property='target.{AbnormalFlags}' action='set' />
<assign value='..Lookup("OBX11_Standard",source.GetValueAt("ObservationResultStatus"),source.GetValueAt("ObservationResultStatus"))' property='target.{ObservationResultStatus}' action='set' />
</transform>
}

}
