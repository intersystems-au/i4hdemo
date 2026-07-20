Class cip.util.ExtraHL7toFHIR
{

/// This method is a placeholder for any additional HL7 to FHIR transformations that are not covered by the standard transformations.
ClassMethod ExtraHL7toFHIRProcess(HL7MessageId As %String, ResourceType As %String, ByRef target As %RegisteredObject, ByRef index As %Integer) As %Status
{
    if ResourceType = "Patient" {
        set sc = ..Patient(HL7MessageId, .target, .index)
        if $$$ISERR(sc) {
            return sc
        }
    }
    if ResourceType = "Encounter" {
        set sc = ..Encounter(HL7MessageId, .target, .index)
        if $$$ISERR(sc) {
            return sc
        }
    }
    return $$$OK
}

ClassMethod Patient(HL7MessageId As %String, ByRef target As %RegisteredObject, ByRef index As %Integer) As %Status
{
    set MsgObj = ##class(EnsLib.HL7.Message).%OpenId(HL7MessageId)
    if MsgObj  {
        // Birth Place extension for Patient resource
        if MsgObj.GetValueAt("PID:23") '= "" {
            set birthPlace = MsgObj.GetValueAt("PID:23") 
            set extension = ##class(HS.FHIR.DTL.vR4.Model.Base.Extension).%New()
            set extension.url = "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
            set address = ##class(HS.FHIR.DTL.vR4.Model.Datatype.Address).%New()
            set address.text = birthPlace
            set extension.valueAddress = address
            do target.extension.Insert(extension)
            set index = target.extension.Count()+1 ; next available index
        }
    }
    return $$$OK
}

ClassMethod Encounter(HL7MessageId As %String, ByRef target As %RegisteredObject, ByRef index As %Integer) As %Status
{
    set MsgObj = ##class(EnsLib.HL7.Message).%OpenId(HL7MessageId)
    if MsgObj  {
        // Example: Add a custom extension for Encounter resource if needed
        if MsgObj.GetValueAt("MSH:9.1")_"^"_ MsgObj.GetValueAt("MSH:9.2")= "ADT^A01" {
            set target.status = "in-progress"
        }
        if MsgObj.GetValueAt("PV1:3")'="" {
            set target.location = ""
            set tmp = ##class(HS.FHIR.DTL.vR4.Model.Element.Encounter.location).%New()
            set ref= ##class(HS.FHIR.DTL.vR4.Model.Base.Reference).%New()
            set ref.display = MsgObj.GetValueAt("PV1:3")
            set tmp.location = ref
            do target.location.Insert(tmp)
        }

    }
    return $$$OK
}

}
