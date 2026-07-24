/// This class is used to accept ANY HL7 Message in the and define the DocType as "NSWH_"_<HL7Version>
Class cip.HL7.Service.TCPService Extends EnsLib.HL7.Service.TCPService
{

Parameter SETTINGS = "-MessageSchemaCategory";

Property MessageSchemaCategory As %String;

/// Override this method to implement your own custom method for resolving the DocType of an incoming message.
/// Returning nonzero means you are overriding the framework's standard DocType resolution.
Method OnResolveDocType(pDoc As EnsLib.EDI.Document, ByRef pDocType As %String) As %Boolean
{
    set HL7Version=pDoc.GetValueAt("1:12.1")
    set MSHType=pDoc.GetValueAt("1:9.1")_"_"_pDoc.GetValueAt("1:9.2")
    set ResolvedDocType=##class(EnsLib.HL7.Schema).ResolveSchemaTypeToDocType(HL7Version,MSHType,,"Standard") 
     
    if $P(pDocType,":",1)'=("NSWH_"_HL7Version) {
        set pDocType="NSWH_"_HL7Version_":"_$piece(ResolvedDocType,":",2)  
        quit 1
    }
    
    Quit 0
}

}
