/// 
Class cip.rul.Router007 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="Placeholder for potential rule for configured thresholds/setup - TBC by NSW Health what they come back with" effectiveBegin="" effectiveEnd="">
<rule name="Verify threshold/setup for rejection" disabled="false">
<when condition="1" comment="">
<send transform="" target="BadMessageHandler,Ens.Alert"></send>
<return></return>
</when>
</rule>
<rule name="Verify threshold/setup for ORU successful processing" disabled="false">
<constraint name="source" value="INT_007"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp1"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP2&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp2"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP3&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp3"></send>
<return></return>
</when>
</rule>
<rule name="Verify threshold/setup for ORM successful processing" disabled="false">
<constraint name="source" value="INT_007"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp1"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP2&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp2"></send>
<return></return>
</when>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP3&quot;" comment="">
<comment text="NOTE: The logic for deriving destination is still to be confirmed by NSW Health"></comment>
<send transform="" target="007_DST_Hosp3"></send>
<return></return>
</when>
</rule>
<rule name="TESTING ONLY - Verify threshold/setup for ORU successful processing" disabled="true">
<constraint name="source" value="TEST_INT_007"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="HL7.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<send transform="" target="TEST_007_DST_Hosp1"></send>
<return></return>
</when>
</rule>
<rule name="TESTING ONLY - Verify threshold/setup for ORM successful processing" disabled="true">
<constraint name="source" value="TEST_INT_007"></constraint>
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
<when condition="HL7.{PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID}=&quot;SYDNEY_HOSP1&quot;" comment="">
<send transform="" target="TEST_007_DST_Hosp1"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
