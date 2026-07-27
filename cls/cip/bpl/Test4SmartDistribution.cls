/// Distribute messages to Outbound interfaces based on interface name and Facility
Class cip.bpl.Test4SmartDistribution Extends Ens.BusinessProcessBPL
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
<property name='SendingFacility' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='TargetOutboundInterface' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1250' >
<if name='Type="ADT"' condition='request.GetValueAt("MSH:9.1")="ADT"' xpos='200' ypos='250' xend='200' yend='600' >
<true>
<assign name="Get Source (MSH)" property="context.SendingFacility" value="request.GetValueAt(&quot;MSH:SendingFacility.namespaceID&quot;)" action="set" xpos='470' ypos='400' disabled="true">
<annotation><![CDATA[Retrieve Sending Facility]]></annotation>
</assign>
<assign name="Get Source PV1" property="context.SendingFacility" value="request.GetValueAt(&quot;PV1:AssignedPatientLocation.facilityHD.namespaceID&quot;)" action="set" xpos='470' ypos='500' >
<annotation><![CDATA[Retrieve Sending Facility]]></annotation>
</assign>
</true>
<false>
<assign name="Get Source (MSH)" property="context.SendingFacility" value="request.GetValueAt(&quot;MSH:SendingFacility.namespaceID&quot;)" action="set" xpos='200' ypos='400' disabled="true"/>
<assign name="Get Source PV1" property="context.SendingFacility" value="request.GetValueAt(&quot;PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation.facilityHD.namespaceID&quot;)" action="set" xpos='200' ypos='500' />
</false>
</if>
<assign name="Resolve Target" property="context.TargetOutboundInterface" value="&quot;Test4_Sender-&quot;_+$piece(context.SendingFacility,&quot;-&quot;,2)" action="set" xpos='200' ypos='700' >
<annotation><![CDATA[Resolve target as "Test4_Sender-" Facility number  (eg resolve 'SH-01' to 'Sender-1')]]></annotation>
</assign>
<trace name='Trace' value='"Sending to: "_context.TargetOutboundInterface' xpos='1261' ypos='464' />
<scope name='Try Sender Interface out' xpos='200' ypos='800' xend='200' yend='1150' >
<call name='Distribute' target='@context.TargetOutboundInterface' async='0' xpos='200' ypos='900' >
<annotation><![CDATA[distribute to Resolved Target host]]></annotation>
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='EnsLib.HL7.Message' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<faulthandlers>
<catchall xpos='200' ypos='1000' xend='200' yend='350' >
<alert name='Alert' value='"Resolved Interface named: """_context.TargetOutboundInterface_""" is not registered"' xpos='200' ypos='250' />
</catchall>
</faulthandlers>
</scope>
</sequence>
</process>
}

}
