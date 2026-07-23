Class cip.util.FunctionSet Extends %RegisteredObject
{

ClassMethod GetSDAFromHL7(pRequest As EnsLib.HL7.Message) As %Stream.GlobalCharacter
{
	set status=##class(cip.util.HL7toSDA3).GetSDA(pRequest,.sdaStream)
	quit sdaStream
}

/// To-Do, use it to find code system code from the known HL7 display value. (Maybe it's not needed)
ClassMethod LookUpTableGetKeyName(table As %String = "", value As %String = "") As %String
{
	if (table = "")||(value = "") return ""

	set KeyName=""
	&SQL(
		Select KeyName into :KeyName From Ens_Util.LookUpTable
		Where TableName = :table and DataValue = :value
	)
	if SQLCODE set KeyName = ""
	return KeyName
}

}
