/// INT-002: routes by MSH-4 (sending facility) to one of 3 destinations.
Class cip.rul.Router002 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Verify routing using MSH segment">
<constraint name="docName" value="ADT_A01,ORM_O01,ORU_R01"></constraint>
<when condition="HL7.{MSH:4}=&quot;SH-01&quot;" comment="Route to SH-01">
<send transform="" target="002_DST_SH01"></send>
</when>
<when condition="HL7.{MSH:4}=&quot;SH-02&quot;" comment="Route to SH-02">
<send transform="" target="002_DST_SH02"></send>
</when>
<when condition="HL7.{MSH:4}=&quot;SH-03&quot;" comment="Route to SH-03">
<send transform="" target="002_DST_SH03"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
