/// 
Class cip.rul.Router013 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="INT-013 Transform the vendor specific codes in ORU_R01 ">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-01&quot;" comment="">
<send transform="cip.dtl.NSWH.ORUR01.NSWH.ORUR01" target="Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-02&quot;" comment="">
<send transform="cip.dtl.NSWH.ORUR01.NSWH.ORUR01" target="Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-03&quot;" comment="">
<send transform="cip.dtl.NSWH.ORUR01.NSWH.ORUR01" target="Sender-3"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
