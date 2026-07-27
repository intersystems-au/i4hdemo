Class cip.dtl.NSWH.NACK.FHIRTransformation Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' targetDocType='2.3.1:ACK' create='new' language='objectscript' >
<assign value='"EnsembleHL7"' property='target.{MSH:SendingApplication.namespaceID}' action='set' />
<assign value='source.{MSH:1}' property='target.{MSH:1}' action='set' />
<assign value='source.{MSH:2}' property='target.{MSH:2}' action='set' />
<assign value='..CurrentDateTime("%q(0)")' property='target.{MSH:DateTimeOfMessage.timeofanevent}' action='set' />
<assign value='source.{MSH:9.1}' property='target.{MSH:MessageType.messagetype}' action='set' />
<assign value='source.{MSH:9.2}' property='target.{MSH:9.2}' action='set' />
<assign value='source.{MSH:10}' property='target.{MSH:10}' action='set' />
<assign value='source.{MSH:11}' property='target.{MSH:11}' action='set' />
<assign value='source.{MSH:12}' property='target.{MSH:12}' action='set' />
<assign value='source.{MSH:3}' property='target.{MSH:5}' action='set' />
<assign value='"ISC"' property='target.{MSH:SendingFacility.namespaceID}' action='set' />
<assign value='source.{MSH:4}' property='target.{MSH:6}' action='set' />
<assign value='"AE"' property='target.{MSA:AcknowledgmentCode}' action='set' />
<assign value='"Message Type Rejected from FHIR Transformations"' property='target.{MSA:MessageControlID}' action='set' />
</transform>
}

}
