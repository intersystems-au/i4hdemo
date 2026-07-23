Class cip.bo.RejectionHandler001 Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method ProcessRejectedMessage(pRequest As EnsLib.HL7.Message, Output pResponse As EnsLib.HL7.Message) As %Status
{
    Set tSC = $$$OK
    Try {
        Set tMsgType   = pRequest.GetValueAt("MSH:9.1")
        Set tTrigger   = pRequest.GetValueAt("MSH:9.2")
        Set tControlId = pRequest.GetValueAt("MSH:10")
        Set tPatientId = pRequest.GetValueAt("MSH:10")
        Set tSendingApp= pRequest.GetValueAt("MSH:3")

        // 1. Log the rejection to the Interoperability Event Log
        $$$LOGALERT("FHIR REJECTION: Message type '"_tMsgType_"^"_tTrigger_"' rejected per business rule. "_"MsgControlID="_tControlId_", PatientID="_tPatientId_", SendingApp="_tSendingApp_". Not delivered downstream.")

        // 2. Write a formal audit record (appears in %SYS.Audit) - OPTIONAL
        set tEventSource = "NSWDemo"
        set tEventType   = "INT_001"
        set tEventname   = "HL7MessageRejected"
        set tDescription = "INT-001 rejected "_tMsgType_" msg "_tControlId
        Set tAuditData = "MsgType="_tMsgType_"^"_tTrigger_
            "|ControlID="_tControlId_
            "|PatientID="_tPatientId_
            "|Rule=INT-001.RejectNonADT"
        set st= ..WriteAuditRecord(tEventSource, tEventType, tEventname, tDescription, tAuditData)
 
        do ##class(cip.dtl.NSWH.NACK.FHIRTransformation).Transform(pRequest,.pResponse)
        
    }
    Catch ex {
        Set tSC = ex.AsStatus()
    }
    Quit tSC
}

Method WriteAuditRecord(pEventSource As %String, pEventType As %String, pEventname As %String, pDescription As %String, pData As %String) As %Status
{
    // Emit a user audit event. Requires the audit event to be defined & enabled.
    // Namespace/Event/Source correspond to a registered System Audit Event.
    // Run the following command once in %SYS to register a custom audit event
    Quit $System.Security.Audit(
        pEventSource,                    // EventSource
        pEventType,                      // EventType (use a registered event)
        pEventname,                      // Event name
        pDescription,                    // Description
        pData)                           // Data
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.HL7.Message">
    <Method>ProcessRejectedMessage</Method>
  </MapItem>
</MapItems>
}

}
