Class UnitTest.Transform.MaskDemographics Extends %UnitTest.TestCase
{

/// Test masking in 1st name provided and Patient IDs (2).
Method TestMaskDemographics()
{
    set XDataItem="ADTA01"
    set stream=##class(%Dictionary.XDataDefinition).%OpenId(..%ClassName(1)_"||"_XDataItem)
    set hl7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(stream.Data)
    set DocType="NSWH_"_hl7.GetValueAt("1:12.1")_":"_$e(XDataItem,1,3)_"_"_$e(XDataItem,4,6) 
    do hl7.PokeDocType(DocType) 

    // Assert Validation did completes succesfully
    do $$$AssertStatusOK(##class(cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID).Transform(hl7,.target),"Test Masking of demographic fields in PID.")

    // Check values masked Family Names
    do $$$AssertTrue(target.GetValueAt("PID:PatientName(1).familylastname.familyname")="XXXX")

    // Check values masked Given Name
    do $$$AssertTrue(target.GetValueAt("PID:PatientName(1).givenname")="XXXX")

    // Check values masked DOB
    do $$$AssertTrue(target.GetValueAt("PID:DateTimeOfBirth.timeofanevent")="XXXX")

    // Check values masked Family Gender
    do $$$AssertTrue(target.GetValueAt("PID:Sex")="XXXX")
    
    // Check values masked Family Name
    do $$$AssertTrue(target.GetValueAt("PID:PatientIdentifierList().ID")="XXXX")
    
    // Check values masked Home Phone Number
    ;do $$$AssertTrue(target.GetValueAt("PID:PhoneNumberHome()")="XXXX")
}

XData ADTA01 [ MimeType = application/test ]
{
MSH|^~\&|PAS|SH-01|||20260701105407||ADT^A01|MSG00000001|T|2.3.1|||AL|NE|||^M 
EVN|A01|20260618002000||PADMN_I|40019031^Alice Hargrave^^^^^^USERS|20260623171451 
PID|1||MRN-20000000-001~MRN-90000000-001||TESTFAMILYNAME^^TESTGIVENNAME^^MR||19660101|M||4^Neither Aboriginal/Torres Strait Is^ETHGR|42 HARBOUR VIEW DRIVE^^SYDNEY^NSW^2000^AUS||+61 412 345 678||1201^English^SPOKL|5^Married or De facto^MARRY|NSP^Not Specified^RELIG||28184930741|-||4^Neither Aboriginal/Torres Strait Is^ ETHGR|1101|N||1^Eligible Australian resident^OVSVS||NSP^Not Specified^NATNL||N^M 
PD1|||GOOGONG FAMILY PRACTICE^GPPRC^GOOGONGFP-MC|8003622500066957^Gp Clinic^Googong Family Practice^^^NSP^^prof_carers^GOOGONGFP-MC^L^^^MAIN~8003622500066957^Gp Clinic^Googong Family Practice^^^NSP^^prof_carers^GOOGONGFP-MC^L^^^MEDIC||||||||^M 
NK1|1|Mary Ann Smith (Spouse) - +61 412 345 679|Spouse|42 HARBOUR VIEW DRIVE^^SYDNEY^NSW^2000^AUS|+61 412 345 678||NOK^Person to Contact - Primary^PETYP^^NSP|20231127|||||||1|||||1201^English^SPOKL|||||||||||||1996099^^^^PAPCA||||^M 
NK1|2|Mary Ann Smith (Spouse) - +61 412 345 679|Spouse|42 HARBOUR VIEW DRIVE^^SYDNEY^NSW^2000^AUS|||MOTBY^Mother-Baby^PETYP^^NSP|20240530|||||||2|20240530000000||||1201^English^SPOKL|||||||||||||8712028^^^^004~8712028^^^^0~28184930730^^^^018^AUSHIC~28184930742^^^^018^AUSHIC~2045197^^^^PAPCA||||^M 
PV1|02231111|I|MRN-20240815-001^^^SYDNEY_HOSP^MR~ACC-2024-08150001^^^SYDNEY_HOSP^AN|2|||DR5678^Dr James Chen|||OBS||||07|||0002006690_N215^Volante^Sonia^^^DR^^prof_carers^^L^^^MAIN~0002006690^Volante^Sonia^^^DR^^prof_carers^^L^^^HL7~0002006690_N215^Volante^Sonia^^^DR^^prof_carers^^L^^^PAS~MED0002006690^Volante^Sonia^^^DR^^prof_carers^^L^^^MEDIC|DC|VISIT00000001|DC^20260618001300||||||||||||||||||||O||||20260618001300||||||||^M 
PV2||||MRN-20240815-001||||20260618001300||||||||||FALSE||||Y|||||||||||||||^M
}

}
