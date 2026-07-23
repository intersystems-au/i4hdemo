Class cip.rul.CustomFunctionRules Extends Ens.Rule.FunctionSet
{

/// Returns True if any PV1:AssignedPatientLocation().facilityHD is not in table 'AllowedDepartments' (i.e. includes an invalid department source)' 
ClassMethod IncludesInvalidDepartmentSource(hl7) As %Boolean
{
    set i=hl7.GetValueAt("PV1:AssignedPatientLocation(*)")
    for loc=1:1:i {
        if ..Lookup("AllowedDepartments", hl7.GetValueAt("PV1:AssignedPatientLocation("_loc_").facilityHD"),"NotFound") = "NotFound" {
            return 1 // Includes Invalid department source
        }
    }
    return 0 // All department sources are valid
}

/// Returns the size of attachment in OBX segments for ORU messages
ClassMethod GetAttachmentSize(hl7Message) As %Integer
{
    set size=0

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
