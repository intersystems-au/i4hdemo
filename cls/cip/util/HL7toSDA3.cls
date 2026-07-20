Class cip.util.HL7toSDA3 Extends HS.Gateway.HL7.HL7ToSDA3 [ Not ProcedureBlock ]
{

/// Input: One HL7 message in EnsLib.HL7.Message
/// Output: SDA3 XML string
ClassMethod GetSDA(pRequest As EnsLib.HL7.Message, Output pXML As %Stream.GlobalCharacter, pLogAlerts As %Boolean = 1, pObservationMode As %Boolean = 0, pMultiLineOBXCompatibilityMode As %Boolean = 0, pKeepDuplicateOBXIdentifiers As %Boolean = 0) As %Status
{
    set ^||CIP.HL7MsgID=pRequest.%Id() //^||CIP.HL7MsgID should be changed to the standard name for the particular organization
    set sc = ##super(pRequest, .pXML, pLogAlerts, pObservationMode, pMultiLineOBXCompatibilityMode, pKeepDuplicateOBXIdentifiers)
    kill ^||CIP.HL7MsgID //^||CIP.HL7MsgID should be changed to the standard name for the particular organization 
    quit sc
}

/// Callback method for custom processing of Patient streamlet
ClassMethod OnPatient()
{
    //set cr=$c(13,10)
    do ..write(cr_"<CustomPairs>")
    do ..write(cr_"<NVPair>")
    do ..write(cr_"<Name>HL7MessageObjectId</Name>")
    do ..write(cr_"<Value>"_^||CIP.HL7MsgID_"</Value>")
    do ..write(cr_"</NVPair>")    
    do ..write(cr_"</CustomPairs>")

	Quit
}

/// Callback method for custom processing of Encounter streamlet
ClassMethod OnEncounter()
{
    //set cr=$c(13,10)
    do ..write(cr_"<CustomPairs>")
    do ..write(cr_"<NVPair>")
    do ..write(cr_"<Name>HL7MessageObjectId</Name>")
    do ..write(cr_"<Value>"_^||CIP.HL7MsgID_"</Value>")
    do ..write(cr_"</NVPair>")    
    do ..write(cr_"</CustomPairs>")

	Quit
}

}
