/// 
Class cip.rul.Router003 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="If ADT Message Event type">
<constraint name="source" value="Test3"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="(HL7.{MSH:MessageType.messagetype}=&quot;ORU&quot;)||(HL7.{MSH:MessageType.messagetype}=&quot;ORM&quot;)" comment="">
<send transform="" target="HL7 TCP Out"></send>
</when>
<otherwise>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
