Class cip.rul.CustomFunctionRules Extends Ens.Rule.FunctionSet
{

/// Returns True if any PV1:AssignedPatientLocation().facilityHD is not in table 'IncludedDepartments' 
ClassMethod IncludesInvalidDepartmentSource(hl7) As %Boolean
{
    set i=hl7.GetValueAt("PV1:AssignedPatientLocation(*)")
    for loc=1:1:i {
        if ..Lookup("IncludedDepartments", hl7.GetValueAt("PV1:AssignedPatientLocation("_loc_").facilityHD"),"NotFound") = "NotFound" {
            return 1 // Includes Invalid department source
        }
    }
    return 0 // All department sources are valid
}

}
