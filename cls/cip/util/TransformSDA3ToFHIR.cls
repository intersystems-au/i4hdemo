Class cip.util.TransformSDA3ToFHIR Extends HS.FHIR.DTL.Util.API.Transform.SDA3ToFHIR
{

Method GetId(source As HS.SDA3.SuperClass, resource As %DynamicObject) As %String
{
    //set useIDMapping = 0
    set (id,identifier) = ""
    if $LISTFIND($LISTBUILD("Patient", "Practitioner", "Encounter"),resource.resourceType) > 0{
        set identifier = resource.identifier.%Get(0).value
        //set useIDMapping = 1
    }
    /*elseif resource.resourceType = "Practitioner" {
        set identifier = resource.identifier.%Get(0).value
        set identifier = $ZSTRIP(identifier,"*E'A'N")
        set id = "practitioner-"_"-" _$ZCONVERT(identifier,"L")
    }
    elseif resource.resourceType = "Encounter" {
        set identifier = resource.identifier.%Get(0).value
        set useIDMapping = 1
    }*/

    //if useIDMapping && (identifier '= "") {
    if (identifier '= "") {
        set id = ##class(cip.util.IDMap).GetId(resource.resourceType, identifier, .exist)
        if ('exist) && (id'= "") {
            set st =  ##class(cip.util.IDMap).AddId(resource.resourceType, identifier, id)
        }
        set id = resource.resourceType_"-"_id
    }

	return id
}

}
