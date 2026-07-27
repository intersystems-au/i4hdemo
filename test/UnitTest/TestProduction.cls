Class UnitTest.TestProduction Extends %UnitTest.TestProduction
{

/// Production to test.
Parameter PRODUCTION = "cip.prod.Main";

/// Code to run right before the production is started.  This is useful to:<br>
/// <ul><li>Adjust settings - see method <method>ChangeSetting</method>.</li>
/// <li>Create directories - see method <method>CreateMainDirTree</method>.</li>
/// <li>Copy files - see method <method>CopyFile</method>.</li>
/// <li>Create credentials required by the production - see method <method>CreateCredentials</method>.</li>
/// <li>etc.</li></ul>
/// If an error status is returned, the test will be aborted and failed.
/// So if a non fatal error occurs, you may invoke ..LogErrors(status,"OnBeforeProductionStart()") and return $$$OK.
Method OnBeforeProductionStart() As %Status
{
    ; Clear target output directory for FILE outbound adapters
	Quit $$$OK
}

/// Code to run right after the production is started. Used, for example, to call a method that initiates the test.
/// If an error status is returned, the test will be aborted and failed and the production will be stopped.
/// So if a non fatal error occurs, you may invoke ..LogErrors(status,"OnAfterProductionStart()") and return $$$OK.
Method OnAfterProductionStart() As %Status
{
    ; Call functions that execute ..SendRequest to production components.
    ; suggest iterating over all sub-classes of UnitTests.Hospital.MainProduction.UnitTest, and invoker their SendRequest() message ??? 
	;; Set request = ##class(Ens.AlertRequest).%New()
	;; Set tSC = ..SendRequest( "Email for Tech Service" ,request, .response,1,40)
	;; Do $$$AssertEquals(response.AlertResponse,"OK","Response should contain OK.")

	Return $$$OK
}

/// Code to run right before the production is stopped.
/// If an error status is returned, the test will be failed and aborted, the production will be stopped.
/// If a non fatal error occurs, you may invoke ..LogErrors(status,"OnBeforeProductionStop()") and return $$$OK.
Method OnBeforeProductionStop() As %Status
{
	Quit $$$OK
}

/// Code to run right after the production is stopped.
/// If an error status is returned, the test is failed.
/// If a non fatal error occurs, you may invoke ..LogErrors(status,"OnAfterProductionStop()") and return $$$OK.
Method OnAfterProductionStop() As %Status
{
	Quit $$$OK
}

/// Fill in with code to check the results for the production execution.<br>
/// This method is initialized with a local array containing user created entries of type "Info" from the Event Log, 
/// not including the start production/components entries, with the following contents:<br>
///   <b>Log</b> = last existing seq for array <b>Log()</b> <br>
///   <b>Log(seq, fieldname)</b> = fieldvalue<br>
/// To get other entries from the Event Log, or for more information about the array contents,
/// see method <method>GetEventLog</method>. <br>
/// Return $$$OK in most cases, or an error status if you want to indicate that there was a failure.  Remember 
/// that failures are automatic when unit test macros are used.<br>
Method CheckResults(ByRef Log As %String, New As %String) As %Status
{
	Quit $$$OK
}

/// Override this method if you are going to check errors with custom code.
/// It's automatically invoked when parameter <parameter>IGNOREPRODUCTIONERRORS</parameter> = 1.
Method CheckErrors() As %Status
{
	Set s = ..GetEventLog("error", "", ..BaseLogId, .Err, .n) // Retrieve all records of type "Error"
	// Insert custom code here
	Quit $$$OK
}

/// Run
ClassMethod Go() As %Status
{
	If ($Data(^UnitTestRoot) = 0) Set ^UnitTestRoot = $ZU(12)
	Set tSC = ..Run()
	Quit tSC
}

}
