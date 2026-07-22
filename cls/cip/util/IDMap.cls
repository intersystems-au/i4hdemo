Class cip.util.IDMap Extends %Persistent
{

Property ResourceType As %String;

Property ResourceID As %String;

Property ResourceIdentifier As %String;

ClassMethod GetId(pResourceType As %String, pResourceIdentifier As %String, Output exist As %Boolean = 0) As %String
{
    Set id = ""
    &SQL(Select ResourceID into :id
        From cip_util.IDMap 
        Where ResourceType = :pResourceType And ResourceIdentifier = :pResourceIdentifier
    )
    if SQLCODE '= 0 {
       set id = ""
    }
    else {
        set exist = 1
    }

    if id = "" {
        set maxid = ""
        &SQL(Select max(ResourceID) into :maxid
            From cip_util.IDMap 
            Where ResourceType = :pResourceType)
       if SQLCODE =0 set id = maxid + 1
     }
    Quit id
}

ClassMethod AddId(pResourceType As %String, pResourceIdentifier As %String, id As %String) As %Status
{
    set st = $$$OK
    if id '= "" {
        set obj = ##class(cip.util.IDMap).%New()
        if obj {
            set obj.ResourceType = pResourceType
            set obj.ResourceID = id
            set obj.ResourceIdentifier = pResourceIdentifier
            set st= obj.%Save()
        }
    }
    quit st
}

Storage Default
{
<Data name="IDMapDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ResourceType</Value>
</Value>
<Value name="3">
<Value>ResourceID</Value>
</Value>
<Value name="4">
<Value>ResourceIdentifier</Value>
</Value>
</Data>
<DataLocation>^cip.util.IDMapD</DataLocation>
<DefaultData>IDMapDefaultData</DefaultData>
<IdLocation>^cip.util.IDMapD</IdLocation>
<IndexLocation>^cip.util.IDMapI</IndexLocation>
<StreamLocation>^cip.util.IDMapS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
