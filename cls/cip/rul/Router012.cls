/// 
Class cip.rul.Router012 Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="cip.prod.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="INT-012 Filter Outpatient Encounter from Specific Department">
<constraint name="docCategory" value="NSWH_2.3.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="HL7.{PV1:PatientClass}=&quot;O&quot;" comment="">
<rule name="" disabled="false">
<when condition="(IncludesInvalidDepartmentSource(HL7)=0)" comment="">
<send transform="" target="HL7 TCP Out"></send>
<return></return>
</when>
<otherwise>
<send transform="" target="012_BadLocation_NACK"></send>
<return></return>
</otherwise>
</rule>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
