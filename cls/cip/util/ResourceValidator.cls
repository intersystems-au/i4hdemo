Class cip.util.ResourceValidator Extends HS.FHIRServer.Util.ResourceValidator
{

// @API

/// ValidateResource validates a FHIR Resource.  If a validation error is found, a
/// compound %Status is thrown in a StatusException.  The compound %Status starts with a
/// $$$ValidationFailure code, followed by additional %Status objects for each detected
/// validation error.
/// @Input pResourceObject : (required) %DynamicObject representation of the FHIR resource.
/// @Throws	a StatusException containing a compound %Status representing all validation errors.
Method ValidateResource(pResourceObject As %DynamicObject, pIsInTransaction As %Boolean = 0) As %Status
{
	if '$IsObject(pResourceObject) || 'pResourceObject.%IsA("%DynamicObject") {
		$$$ThrowFHIR($$$HSFHIRErrAPIContractViolation, "pResourceObject")
	}

	Set resourceType = pResourceObject.resourceType
	
	If (resourceType="") || '$$$IsValidResourceType(..metaAPI, resourceType) {
		$$$ThrowFHIR($$$ERROR($$$HSFHIRErrResourceTypeUnknown, resourceType))
	}
	Set tSC = ..ValidateObject(pResourceObject, resourceType, resourceType, pIsInTransaction)
	If ($$$ISERR(tSC)) {
		Set rootsc = $$$ERROR($$$HSFHIRErrValidationFailure, $$$OutcomeIs($$$HTTP400, "error", "invalid"))
		$$$FHIRAddError(rootsc, tSC)
		$$$ThrowStatus(rootsc)
	}
    quit tSC
}

}
