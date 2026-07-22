/// 
Class cip.rul.Router005 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Converts HL7 ADT_A01 from v2.4 to v2.3.1">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to231" target="004_005_DST"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
