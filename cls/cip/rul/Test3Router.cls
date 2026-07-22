/// Reject non ADT messages and also validate ADT for mandatory segments.
Class cip.rul.Test3Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.MainV2">
<ruleSet name="Filter non ADT messages" effectiveBegin="" effectiveEnd="">
<rule name="Accept ADT 2.3.1" disabled="false">
<constraint name="docCategory" value="NSWH_2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.v231.ADTA01.NSWH.v251.ADTA01" target="Test3_HL7toSDA"></send>
<return></return>
</when>
</rule>
<rule name="Accept ADT 2.4" disabled="false">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.v24.ADTA01.NSWH.v251.ADTA01" target="Test3_HL7toSDA"></send>
<return></return>
</when>
</rule>
<rule name="Send NACK for other message types received." disabled="false">
<when condition="1" comment="">
<send transform="" target="Test3_Rejection"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
