/// 
Class cip.bpl.TransformHL7toSDA Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='sdaStream' type='%Stream.GlobalCharacter' instantiate='1' deletewithcontext='0' />
<property name='transformedRequest' type='EnsLib.HL7.Message' instantiate='0' deletewithcontext='0' />
</context>
<sequence xend='200' yend='550' >
<transform name='Transform to HL7v2.5.1' class='cip.dtl.NSWHADTA01toSDAADTA01' source='request' target='context.transformedRequest' xpos='200' ypos='250' >
<annotation><![CDATA[Align with pivot version]]></annotation>
</transform>
<assign name="Transform to SDA" property="context.sdaStream" value="##class(cip.util.FunctionSet).GetSDAFromHL7(request)" action="set" xpos='200' ypos='350' />
<call name='Dispatch to FHIR Transformation' target='006_Transform SDA to FHIR' async='1' xpos='200' ypos='450' >
<annotation><![CDATA[Send to FHIR Transformation Process]]></annotation>
<request type='cip.util.XMLMessage' >
<assign property="callrequest.ContentStream" value="context.sdaStream" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
