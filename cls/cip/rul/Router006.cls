/// 
Class cip.rul.Router006 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="If ADT Message Event type">
<constraint name="source" value="Test3"></constraint>
<constraint name="docCategory" value="2.3.1"></constraint>
<constraint name="docName" value="ACK_R01,ADT_A07,ADT_A06,ADT_A05,ADT_A04,ADT_A03,ADT_A02,ADT_A01,ADR_A19"></constraint>
<when condition="HL7.{MSH:MessageType.messagetype}=&quot;ADT&quot;" comment="">
<send transform="" target="HL7FileOperation"></send>
</when>
<when condition="(HL7.{MSH:MessageType.messagetype}=&quot;ORU&quot;)||(HL7.{MSH:MessageType.messagetype}=&quot;ORM&quot;)" comment="">
<send transform="" target="Ens.Alert"></send>
</when>
<otherwise>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
