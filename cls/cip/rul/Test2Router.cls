/// 
Class cip.rul.Test2Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Version conversion and Transformation Patient Attributes">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to23,cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID" target="Test2_Destination"></send>
<return></return>
</when>
</rule>
<rule name="Transformation Patient attributes" disabled="false">
<constraint name="docCategory" value="NSWH_2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID" target="Test2_Destination"></send>
<return></return>
</when>
</rule>
</ruleSet>
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Version conversion and transformation">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to231,cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID" target="Test2_Destination"></send>
</when>
</rule>
<rule name="" disabled="false">
</rule>
</ruleSet>
</ruleDefinition>
}

}
