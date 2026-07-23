Class cip.dtl.NSWH.ADTA01.NAKBadFacility Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.4:ADT_A01' targetDocType='2.4:ACK' create='new' language='objectscript' >
<annotation>Create custom &amp;#39;BadFacility&amp;#39; NACK</annotation>
<assign value='"EnsembleHL7"' property='target.{MSH:SendingApplication.namespaceID}' action='set' />
<assign value='source.{MSH:FieldSeparator}' property='target.{MSH:FieldSeparator}' action='set' />
<assign value='source.{MSH:EncodingCharacters}' property='target.{MSH:EncodingCharacters}' action='set' />
<assign value='..CurrentDateTime("%q(0)")' property='target.{MSH:DateTimeOfMessage.timeofanevent}' action='set' />
<assign value='source.{MSH:MessageType.messagetype}' property='target.{MSH:MessageType.messagetype}' action='set' />
<assign value='source.{MSH:MessageType.triggerevent}' property='target.{MSH:MessageType.triggerevent}' action='set' />
<assign value='source.{MSH:MessageControlID}' property='target.{MSH:MessageControlID}' action='set' />
<assign value='source.{MSH:ProcessingID}' property='target.{MSH:ProcessingID}' action='set' />
<assign value='source.{MSH:VersionID}' property='target.{MSH:VersionID}' action='set' />
<assign value='source.{MSH:SendingApplication}' property='target.{MSH:ReceivingApplication}' action='set' />
<assign value='"ISC"' property='target.{MSH:SendingFacility.namespaceID}' action='set' />
<assign value='source.{MSH:SendingFacility}' property='target.{MSH:ReceivingFacility}' action='set' />
<assign value='"AE"' property='target.{MSA:AcknowledgmentCode}' action='set' />
<assign value='"Invalid Source Outpatient Location(s)"' property='target.{MSA:MessageControlID}' action='set' />
</transform>
}

}
