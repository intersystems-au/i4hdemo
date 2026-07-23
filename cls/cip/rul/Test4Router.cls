/// 
Class cip.rul.Test4Router Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Skip Outpatient Encounters from invalid Department, or forward ADT">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="HL7.{PV1:PatientClass}=&quot;O&quot;&amp;&amp;((IncludesInvalidDepartmentSource(HL7)=1))" comment="">
<send transform="" target="Test4_RejectBadDept_BPL"></send>
<return></return>
</when>
<otherwise>
<comment text="Process Valid Patient Class and included department source"></comment>
<send transform="cip.dtl.NSWH.ADTA01.NSWH.ADTA01.GenderStandardValues" target="Test4_SmartDistribution"></send>
<return></return>
</otherwise>
</rule>
<rule name="Update Gender and non-standard codes" disabled="false">
<constraint name="docCategory" value="NSWH_2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="1" comment="">
<send transform="cip.dtl.NSWH.ORUR01.NSWH.ORUR01" target="Test4_SmartDistribution"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
