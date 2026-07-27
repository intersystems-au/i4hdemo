Class UnitTest.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID Extends %UnitTest.TestCase
{

/// Test masking in 1st name provided and Patient IDs (2).
Method TestMaskDemographics()
{
    set PID=##class(EnsLib.HL7.Segment).%New()
    do PID.PokeDocType("NSWH_2.4:PID")
    do PID.SetValueAt("TestFamilyName","PID:PatientName(1).familylastname.familyname")
    do PID.SetValueAt("TestGivenName","PID:PatientName(1).givenname")
    do PID.SetValueAt("010119660900","PID:DateTimeOfBirth.timeofanevent")
    do PID.SetValueAt("Female","PID:Sex")

    do PID.SetValueAt("PatientID123","PID:PatientID.ID")
    do PID.SetValueAt("PatientIDsAAA","PID:PatientIdentifierList(1).ID")
    do PID.SetValueAt("PatientIDsBBB","PID:PatientIdentifierList(2).ID")

    // Assert Validation did completes succesfully
    do $$$AssertStatusOK(##class(cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID).Transform(PID,.target),"Test Masking of demographic fields in PID.")

    // Check values masked Family Names
    do $$$AssertTrue(target.GetValueAt("PID:PatientName(1).familylastname.familyname")="XXXX")

    // Check values masked Given Name
    do $$$AssertTrue(target.GetValueAt("PID:PatientName(1).givenname")="XXXX")

    // Check values masked DOB
    do $$$AssertTrue(target.GetValueAt("PID:DateTimeOfBirth.timeofanevent")="XXXX")

    // Check values masked Family Gender
    do $$$AssertTrue(target.GetValueAt("PID:Sex")="XXXX")
    
    // Check values masked Family Name
    do $$$AssertTrue(target.GetValueAt("PID:PatientIdentifierList(1).ID")="XXXX")
    do $$$AssertTrue(target.GetValueAt("PID:PatientIdentifierList(2).ID")="XXXX")
}

}
