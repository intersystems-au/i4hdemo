/// Reject non ADT messages and also validate ADT for mandatory segments.
Class cip.rul.Router001 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="Filter non ADT messages" effectiveBegin="2026-07-13" effectiveEnd="">
<rule name="Accept ADT" disabled="false">
<constraint name="source" value="INT_001"></constraint>
<constraint name="docCategory" value="NSWH_2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="HL7.{MSH:9.1}=&quot;ADT&quot;" comment="">
<send transform="" target="006_Transform HL7 to SDA"></send>
<return></return>
</when>
</rule>
<rule name="Reject ORM and ORU" disabled="false">
<constraint name="source" value="INT_001"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORM_O01,ORU_R01"></constraint>
<when condition="(HL7.{MSH:9.1}=&quot;ORM&quot;)||(HL7.{MSH:9.1}=&quot;ORU&quot;)" comment="">
<send transform="" target="001_RejectionHandler"></send>
<return></return>
</when>
</rule>
<rule name="Default Catch All" disabled="false">
<when condition="1" comment="">
<send transform="" target="001_RejectionHandler"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
