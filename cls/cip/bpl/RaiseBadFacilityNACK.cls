/// 
Class cip.bpl.RaiseBadFacilityNACK Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='EnsLib.HL7.Message' height='2000' width='2000' >
<context>
<property name='InvalidDepartments' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='iterator' type='%Integer' instantiate='0' deletewithcontext='0' />
<property name='OneLocation' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='100' />
</parameters>
</property>
</context>
<sequence xend='200' yend='750' >
<assign name="Set Bad Departments" property="context.InvalidDepartments " value="&quot;&quot;" action="set" xpos='200' ypos='250' />
<assign name="Get Iterator Max" property="context.iterator" value="request.GetValueAt(&quot;PV1:AssignedPatientLocation(*)&quot;)" action="set" xpos='200' ypos='350' />
<while name='Loop over Locations' condition='context.iterator&gt;0' xpos='200' ypos='450' xend='200' yend='800' >
<assign name="Get one location" property="context.OneLocation" value="request.GetValueAt(&quot;PV1:AssignedPatientLocation(&quot;_context.iterator_&quot;)&quot;)" action="set" xpos='200' ypos='250' />
<if name='Location Allowed ?' condition='##class(Ens.Util.FunctionSet).Lookup("AllowedDepartments",context.OneLocation,"")=""' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<assign name="Append Bad Dept" property="context.InvalidDepartments" value="context.InvalidDepartments_request.GetValueAt(&quot;PV1:AssignedPatientLocation(&quot;_context.iterator_&quot;)&quot;)_&quot;,&quot; " action="set" xpos='335' ypos='500' />
</true>
</if>
<assign name="decrement counter" property="context.iterator" value="context.iterator-1" action="set" xpos='200' ypos='700' />
</while>
<trace name='trACE' value='context.InvalidDepartments' xpos='200' ypos='550' />
<transform name='Construct Custom NACK' class='cip.dtl.NSWH.ADTA01.NAKBadFacility' source='request' target='response' xpos='200' ypos='650' />
</sequence>
</process>
}

}
