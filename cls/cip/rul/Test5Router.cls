/// 
Class cip.rul.Test5Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.MainV2">
<ruleSet name="Rule Set to route Test Scenario 5 messages to different destination endpoints and perform validation" effectiveBegin="" effectiveEnd="">
<rule name="Verify threshold/setup for ORM and ORU rejection" disabled="false">
<constraint name="source" value="Test 5"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORM_O01,ORU_R01"></constraint>
<when condition="1" comment="">
<comment text="NOTE: The logic for the threshold is still to be confirmed by NSW Health"></comment>
<send transform="" target="Ens.Alert,Test5_DeadLetterQueue"></send>
<return></return>
</when>
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
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY-HOSP1&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY-HOSP2&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY-HOSP3&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="Test5_Sender-3"></send>
<return></return>
</when>
</rule>
<rule name="Process ADT with Gender Specified with non-standard value" disabled="false">
<constraint name="source" value="Test 5"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="HL7.{PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SH-1&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Test5_Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SH-2&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Test5_Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SH-3&quot;" comment="">
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Test5_Sender-3"></send>
<return></return>
</when>
</rule>
<comment text="Messages that fail validation automatically sent to Bad Message Handler and NACK"></comment>
</ruleSet>
</ruleDefinition>
}

}
