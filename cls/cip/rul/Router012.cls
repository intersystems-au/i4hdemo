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
<when condition="HL7.{PV1:PatientClass}=&quot;O&quot;&amp;&amp;((IncludesInvalidDepartmentSource(HL7)=1))" comment="">
<send transform="" target="012_BadLocation_NACK"></send>
<return></return>
</when>
<otherwise>
<rule name="" disabled="false">
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-01&quot;" comment="">
<send transform="" target="Sender-1"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-02&quot;" comment="">
<send transform="" target="Sender-2"></send>
<return></return>
</when>
<when condition="HL7.{MSH:SendingFacility.namespaceID}=&quot;SH-03&quot;" comment="">
<send transform="" target="Sender-3"></send>
<return></return>
</when>
</rule>
<return></return>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
