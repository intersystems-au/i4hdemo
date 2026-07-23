/// 
Class cip.rul.Router011 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="INT-011 Map source Gender Value">
<constraint name="source" value="INT_011"></constraint>
<constraint name="docCategory" value="NSWH_2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-01&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-01&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-01&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Sender-3"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
