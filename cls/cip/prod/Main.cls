Class cip.prod.Main Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cip.prod.Main" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>3</ActorPoolSize>
  <Item Name="BadMessageHandler" Category="Version2,Test1,Test2,Test3,Test4,Test5" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Bad messages are sent to this operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="Version2,Test5,Test4,Test3,Test2,Test1" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.AlertRule</Setting>
  </Item>
  <Item Name="EMailAlert" Category="Version2," ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_Router" Category="Version2,Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test4Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="ResponseFrom">Sender-1,Sender-2,Sender-3,Test4_RejectBadDept_BPL</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="Validation">dmr-z</Setting>
  </Item>
  <Item Name="Test 4" Category="Version2,Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Test4_Router</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Adapter" Name="Port">5004</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
  </Item>
  <Item Name="Test 1" Category="Version2,Test1" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Test1_Router</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Adapter" Name="Port">5001</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
  </Item>
  <Item Name="Test 2" Category="Version2,Test2" ClassName="cip.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Test2_Router</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Adapter" Name="Port">5002</Setting>
  </Item>
  <Item Name="Test 3" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test3_Router</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Adapter" Name="Port">5003</Setting>
    <Setting Target="Host" Name="DocTypeResolution">Std</Setting>
  </Item>
  <Item Name="Test 5" Category="Version2,Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Test5_Router</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Adapter" Name="Port">5005</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
  </Item>
  <Item Name="Test2_Router" Category="Version2,Test2" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test2Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="Test1_Router" Category="Version2,Test1" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Applies INT-002 route by MSH-4 to one of 3 destinations" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test1Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="Test4_SmartDistribution" Category="Version2,Test4" ClassName="cip.bpl.Test4SmartDistribution" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_Sender-2" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_Sender-3" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_Sender-1" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test5_Sender-1" Category="Version2,Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test5_Sender-2" Category="Version2,Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test5_Sender-3" Category="Version2,Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Test1_SH01" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-01" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test1_SH02" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-02" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test1_SH03" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-03" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test2_Destination" Category="Version2,Test2" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="Shared outbound for INT-004 and INT-005 (masked ADT^A01 v2.4 / converted ADT^A01 v2.3.1)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test3_HL7toSDA" Category="Test3" ClassName="cip.bpl.TransformHL7toSDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Test3_SDAtoFHIR" Category="Test3" ClassName="cip.bpl.SDAtoFHIR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FHIRMetadataSet">HL7v40 / FHIR R4 Core Specification</Setting>
    <Setting Target="Host" Name="TargetConfigName">Test3_SendToFHIR</Setting>
    <Setting Target="Host" Name="TransformClass">cip.util.TransformSDA3ToFHIR</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="CustomSDAtoFHIRDTLPackage">cip.dtl.FHIR</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="Test3" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test3_Rejection" Category="Test3" ClassName="cip.bo.RejectionHandler001" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test3_SendToFHIR" Category="Test3" ClassName="HS.FHIRServer.Interop.HTTPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
  </Item>
  <Item Name="Test3_Router" Category="Version2,Test3" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test3Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
    <Setting Target="Host" Name="ResponseFrom">Test3_Rejection</Setting>
  </Item>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_RejectBadDept_BPL" Category="Version2,Test4" ClassName="cip.bpl.RaiseBadFacilityNACK" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Test5_Router" Category="Version2,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test5Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">Test5_DeadLetterQueue</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="Test5_DeadLetterQueue" Category="Test5" ClassName="cip.bo.DeadLetterQueue" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
