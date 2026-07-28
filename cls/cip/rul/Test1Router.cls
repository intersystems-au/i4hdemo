/// 
Class cip.rul.Test1Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Test 1 Scenario - routing based on MSH-4">
<constraint name="docName" value="ADT_A01,ADT_A04,ADT_A08,ORM_O01,ORU_R01"></constraint>
<when condition="1" comment="guard: only NSWH_2.3.1/NSWH_2.4 doc categories allowed before routing">
<rule name="" disabled="false">
<when condition="HL7.{MSH:4}=&quot;SH-01&quot;" comment="Route to SH-01">
<send transform="" target="Test1_SH01"></send>
</when>
<when condition="HL7.{MSH:4}=&quot;SH-02&quot;" comment="Route to SH-02">
<send transform="" target="Test1_SH02"></send>
</when>
<when condition="HL7.{MSH:4}=&quot;SH-03&quot;" comment="Route to SH-03">
<send transform="" target="Test1_SH03"></send>
</when>
</rule>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
