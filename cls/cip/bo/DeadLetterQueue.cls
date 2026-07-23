/// Dead Letter Queue
Class cip.bo.DeadLetterQueue Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

/// NoOperation method is used to handle messages that are sent to the Dead Letter Queue. It simply returns an OK status without performing any operations.
Method NoOperation(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
  
  // Suspend the message to the Dead Letter Queue for further analysis or processing.
  Set ..SuspendMessage  = 1
  
  QUIT $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.HL7.Message">
    <Method>NoOperation</Method>
  </MapItem>
</MapItems>
}

}
