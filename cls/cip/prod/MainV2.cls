Class cip.prod.MainV2 Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cip.prod.MainV2" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="BadMessageHandler" Category="Version2,Test1,Test2,Test3,Test4,Test5" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Bad messages are sent to this operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="Version2,Test5,Test4,Test3,Test2,Test1" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.AlertRule</Setting>
  </Item>
  <Item Name="EMailAlert" Category="Version2," ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="INT_001" Category="Version2,Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5001</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test3_Router</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_002" Category="Version2,Test1" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 inbound - route by MSH-4" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5002</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4,NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test1_Router</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_003" Category="Version2,Test4,Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5003</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">003_ValidateORUMissingOBX</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_004" Category="Version2,Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-004 inbound - mask PID only" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5004</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test2_Router</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_005" Category="Version2,Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-005 inbound - convert v2.4 to v2.3.1 only" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5005</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test2_Router</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_006" Category="Version2,Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1,NSWH_2.4</Setting>
    <Setting Target="Adapter" Name="Port">5006</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Test3_Router</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
  </Item>
  <Item Name="INT_007" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5007</Setting>
  </Item>
  <Item Name="INT_008" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5008</Setting>
  </Item>
  <Item Name="INT_009" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5009</Setting>
  </Item>
  <Item Name="INT_010" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5010</Setting>
  </Item>
  <Item Name="INT_011" Category="Version2,Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5011</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">011_MapGenderToStandard</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_012" Category="Version2,Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5012</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">012_FilterOutpatientBadDepartment</Setting>
  </Item>
  <Item Name="INT_013" Category="Version2,Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5013</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">013_TransformVendorOBXCodes</Setting>
  </Item>
  <Item Name="003_ValidateORUMissingOBX" Category="Test4,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dmr-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router003</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="011_MapGenderToStandard" Category="Test4,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router011</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="012_FilterOutpatientBadDepartment" Category="Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router012</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ResponseFrom">012_BadLocation_NACK</Setting>
  </Item>
  <Item Name="012_BadLocation_NACK" Category="Version2,Test4" ClassName="cip.bpl.RaiseBadFacilityNACK" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="013_TransformVendorOBXCodes" Category="Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router013</Setting>
  </Item>
  <Item Name="Test4_Router" Category="Version2,Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test4Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="ResponseFrom">Sender-1,Sender-2,Sender-3,Test4_RejectBadDept_BPL</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
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
  <Item Name="Test 5" Category="Version2," ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Test5_Router_WIP</Setting>
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
  <Item Name="Test5_Router_WIP" Category="Version2,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test5Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="Test4_Sender-2" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22242</Setting>
  </Item>
  <Item Name="Test4_Sender-3" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22243</Setting>
  </Item>
  <Item Name="Test4_Sender-1" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22241</Setting>
  </Item>
  <Item Name="Test5_Sender-1" Category="Version2,Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22251</Setting>
  </Item>
  <Item Name="Test5_Sender-2" Category="Version2,Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22252</Setting>
  </Item>
  <Item Name="Test5_Sender-3" Category="Version2,Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22253</Setting>
  </Item>
  <Item Name="Test1_SH01" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-01" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22211</Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test1_SH02" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-02" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22212</Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test1_SH03" Category="Version2,Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-03" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22213</Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Test2_Destination" Category="Version2,Test2" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="Shared outbound for INT-004 and INT-005 (masked ADT^A01 v2.4 / converted ADT^A01 v2.3.1)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
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
    <Setting Target="Adapter" Name="Credentials">superuser</Setting>
    <Setting Target="Adapter" Name="HTTPPort">80</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/csp/testns/fhir/r4</Setting>
  </Item>
  <Item Name="Test3_Router" Category="Version2,Test3" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Test3Router</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
    <Setting Target="Host" Name="ResponseFrom">Test3_Rejection</Setting>
  </Item>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Test4_RejectBadDept_BPL" Category="Version2,Test4" ClassName="cip.bpl.RaiseBadFacilityNACK" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
