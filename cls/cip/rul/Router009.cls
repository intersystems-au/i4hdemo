/// 
Class cip.rul.Router009 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="Rule Set to route INT-008 messages to different destination endpoints" effectiveBegin="" effectiveEnd="">
<rule name="Route to correct destination endpoint" disabled="false">
<constraint name="source" value="INT_009"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="009_DST_Hosp1"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP2&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="009_DST_Hosp2"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP3&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="009_DST_Hosp3"></send>
<return></return>
</when>
</rule>
<rule name="TESTING - Route to correct destination endpoint" disabled="true">
<constraint name="source" value="TEST_INT_009"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<send transform="" target="TEST_009_DST_Hosp1"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
