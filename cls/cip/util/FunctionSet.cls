Class cip.util.FunctionSet Extends %RegisteredObject
{

ClassMethod GetSDAFromHL7(pRequest As EnsLib.HL7.Message) As %Stream.GlobalCharacter
{
	set status=##class(cip.util.HL7toSDA3).GetSDA(pRequest,.sdaStream)
	quit sdaStream
}

/// To-Do, use it to find code system code from the known HL7 display value. (Maybe it's not needed)
ClassMethod LookUpTableGetKeyName(table As %String = "", value As %String = "") As %String
{
	if (table = "")||(value = "") return ""

	set KeyName=""
	&SQL(
		Select KeyName into :KeyName From Ens_Util.LookUpTable
		Where TableName = :table and DataValue = :value
	)
	if SQLCODE set KeyName = ""
	return KeyName
}

/// Returns the size of attachment for a specific HL7 message in MB. 
/// It will check all OBX segments and sum the size of all ED type attachments.
ClassMethod GetAttachmentSize(hl7ID) As %Integer
{
    set size=0

	set hl7Message = ##class(EnsLib.HL7.Message).%OpenId(hl7ID)

    set maxOBX=hl7Message.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(*)")
    set attachmentStream = ##class(%Stream.GlobalCharacter).%New()
    
    for i=1:1:maxOBX {
        
        if hl7Message.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp("_i_").OBX:ValueType") = "ED" {
            set base64Chunk = hl7Message.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp("_i_").OBX:ObservationValue")
            
            Do attachmentStream.Write(base64Chunk)
    
        }
    }

    do attachmentStream.Rewind()

    // Convert unit from bytes to MB
    set size = attachmentStream.Size/(1024*1024)

    // Quit with the total size of attachments in OBX segments
    return size
}

}
