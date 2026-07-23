Class cip.util.FHIRSearchString [ Abstract ]
{

ClassMethod Patient(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	set withIdentifierSystem=""
	set searchParameter="identifier"
	set qrySearch=""
	
	; Loop through identifiers, looking for the unique identifier that uniquely Identifies a patient
	for i=0:1:(resource.identifier.%Size()-1) {
		if resource.identifier.%Get(i).system=withIdentifierSystem {
			set:qrySearch'="" qrySearch=qrySearch_"&"			
			set qrySearch=qrySearch_searchParameter_"="_withIdentifierSystem_"|"_resource.identifier.%Get(i).value
		}
	} 
	
	quit qrySearch
}

ClassMethod Encounter(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	
	set withEncounterTypeText="EncounterNumber"
	set withEncounterUse="official" 
	set searchParameter="identifier"
	set qrySearch=""
	
	; Loop through identifiers, looking for the unique identifier 
	for i=0:1:(resource.identifier.%Size()-1) {
		if resource.identifier.%Get(i).type.text=withEncounterTypeText,resource.identifier.%Get(i).use=withEncounterUse {
			set qrySearch=searchParameter_"="_resource.identifier.%Get(i).value
			quit
		}
	} 
	
	quit qrySearch
}

// Condition Resource linked to Encounter

ClassMethod Condition(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{

	// Search for condition resource that may have already been associated with this encounter
	set qrySearch="category="_resource.category.%Get(0).coding.%Get(0).code_"&code="_resource.code.coding.%Get(0).code
	quit qrySearch
}

ClassMethod Organization(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	//set qrySearch =  ..AnyOfIdentifiers(resource)
    //quit qrySearch
	
	// Assumes only 1 identifier forresource type organisation
	set searchParameter="identifier"
	set qrySearch=""
	
	; Loop through identifiers, looking for the unique identifier 
	for i=0:1:(resource.identifier.%Size()-1) {
		set qrySearch=searchParameter_"="_resource.identifier.%Get(i).value
		quit:qrySearch'=""
	}
	quit qrySearch
}

ClassMethod Location(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	//quit ..AnyOfIdentifiers(resource)
	

	// Assumes only 1 identifier for resource type Location 
	set qrySearch="identifier="_resource.identifier.%Get(0).value
	quit qrySearch
}

ClassMethod Practitioner(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	
	quit ..AnyOfIdentifiers(resource)

	set searchParameter="identifier"
	set qrySearch=""

	; Loop through identifiers, looking for the unique identifier. Cannot match on First/Last name alone 
	for i=0:1:(resource.identifier.%Size()-1) {
		set searchValue=resource.identifier.%Get(i).system_"|"_resource.identifier.%Get(i).value
		if $tr(searchValue,"|")'="" {
			set qrySearch=searchParameter_"="_searchValue
		}
		quit:qrySearch'=""
	}

	quit qrySearch
}

ClassMethod AnyOfIdentifiers(resource As %DynamicObject) As %String
{

	set searchParameter="identifier"
	set qrySearch=""

	; Loop through identifiers, looking for the unique identifier. Cannot match on First/Last name alone 
	for i=0:1:(resource.identifier.%Size()-1) {
		set searchValue=resource.identifier.%Get(i).system_"|"_resource.identifier.%Get(i).value
		if $tr(searchValue,"|")'="" {
			set qrySearch=searchParameter_"="_searchValue
		}
		quit:qrySearch'=""
	}

	quit qrySearch
}

ClassMethod ServiceRequest(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	
	set withTypeText="PlacerId"
	set withUse="official" 
	set searchParameter="identifier"
	set qrySearch=""

	; Loop through identifiers, looking for the unique identifier 
	for i=0:1:(resource.identifier.%Size()-1) {
		if resource.identifier.%Get(i).type.text=withTypeText,resource.identifier.%Get(i).use=withUse {
			set qrySearch=searchParameter_"="_resource.identifier.%Get(i).value
			quit
		}
	} 
	quit qrySearch
}

ClassMethod DiagnosticReport(resource As %DynamicObject, ByRef bundle As %DynamicObject, ByRef jsonAddEntries As %DynamicArray) As %String
{
	/// Add purge option to purge previous DiagnosticReport resources with the same PlacerID, including all their referenced Observations
	set withTypeText="FillerId"
	set withUse="official" 
	set searchParameter="identifier"
	set qrySearch=""
	
	/// Loop through identifiers, looking for the unique identifier 
	for i=0:1:(resource.identifier.%Size()-1) {
		if resource.identifier.%Get(i).type.text=withTypeText,resource.identifier.%Get(i).use=withUse {
			set identifier=resource.identifier.%Get(i).value
			set qrySearch=searchParameter_"="_identifier
			quit
		}
	} 

	/// If able to identify a QueryString for the Diagnostic report, find all ObservationItems, and
	/// get them deleted.
	if qrySearch'="" {
		set qryResponse=..SearchRepository("Observation","_has:DiagnosticReport:result:identifier="_identifier) 
		if $IsObject(qryResponse),qryResponse.total>0 { 

			// iterate through all observations
			// add DELETE entries for these observations to the bundle:
			for i=1:1:qryResponse.total {
				set dEntry={}
				set dEntry.request={}.%FromJSON("{""method"":""DELETE"",""url"":""Observation/"_qryResponse.entry.%Get(i-1).resource.id_"""}")
				do jsonAddEntries.%Push(dEntry)
			}

		}
	}

	quit qrySearch
}

}
