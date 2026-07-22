/// 
Class cip.rul.Test5Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.MainV2">
<ruleSet name="Rule Set to route Test Scenario 5 messages to different destination endpoints and perform validation" effectiveBegin="" effectiveEnd="">
<rule name="Verify threshold/setup for ORM and ORU rejection " disabled="true">
<constraint d5p1:type="comment" xmlns:d5p1="http://www.w3.org/2001/XMLSchema-instance" text=""></constraint>
<constraint d5p1:type="comment" xmlns:d5p1="http://www.w3.org/2001/XMLSchema-instance" text=""></constraint>
<constraint d5p1:type="comment" xmlns:d5p1="http://www.w3.org/2001/XMLSchema-instance" text=""></constraint>
<when condition="1" comment="">
<send transform="" target="BadMessageHandler,Ens.Alert"></send>
</when>
<comment text="NOTE: This is yet to be defined by NSW Health"></comment>
</rule>
<rule name="Route ORU to correct destination endpoint" disabled="false">
<constraint name="source" value="Test 5"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP2&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP3&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-3"></send>
<return></return>
</when>
</rule>
<rule name="Route ORM to correct destination endpoint" disabled="false">
<constraint name="source" value="Test 5"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
</rule>
<comment text="Messages that fail validation automatically sent to Bad Message Handler and NACK&apos;d"></comment>
</ruleSet>
</ruleDefinition>
}

}
