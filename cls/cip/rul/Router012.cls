/// 
Class cip.rul.Router012 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="INT-012 Filter Outpatient Encounter from Specific Department">
<constraint name="docCategory" value="2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="IncludesInvalidDepartmentSource(HL7)=0" comment="">
<send transform="" target="HL7 TCP Out"></send>
<return></return>
</when>
<otherwise>
<send transform="" target="BadMessageHandler"></send>
<return></return>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
