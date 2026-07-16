Class cip.rul.Router005 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="INT-005 convert v2.4 to v2.3.1">
<constraint name="source" value="INT_005"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition='(HL7.{MSH:MessageType.messagetype}=&quot;ADT&quot;)&amp;&amp;(HL7.{MSH:MessageType.triggerevent}=&quot;A01&quot;)' comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to231" target="004_005_DST"></send>
</when>
<otherwise>
<trace value='"INT-005: unexpected message type [" _ HL7.{MSH:9} _ "], routed to BadMessageHandler"'></trace>
<send transform="" target="BadMessageHandler"></send>
</otherwise>
</rule>
<rule name="Unmatched - wrong source/docCategory/docName">
<otherwise>
<trace value='"INT-005: message did not match source/docCategory/docName constraints, routed to BadMessageHandler"'></trace>
<send transform="" target="BadMessageHandler"></send>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
