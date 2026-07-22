Class cip.prod.Main Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cip.prod.Main" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="BadMessageHandler" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Bad messages are sent to this operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="Test1,Test2,Test3,Test4,Test5" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.AlertRule</Setting>
  </Item>
  <Item Name="EMailAlert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="INT_001" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5001</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1, ORM_O01=NSWH_2.4, ORU_R01=NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">001_Reject Non ADT</Setting>
    <Setting Target="Adapter" Name="StayConnected">0</Setting>
  </Item>
  <Item Name="INT_002" Category="Test1" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="INT-002 inbound - route by MSH-4" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5002</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">*=NSWH_2.4,*=NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">002_Route by MSH-4</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_003" Category="Test4,Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5003</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">003_ValidateORUMissingOBX</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_004" Category="Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="INT-004 inbound - mask PID only" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5004</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">004_ADT Mask PID</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_005" Category="Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="INT-005 inbound - convert v2.4 to v2.3.1 only" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5005</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">005_ADT Version 2.4 to 2.3.1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_006" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1,NSWH_2.4</Setting>
    <Setting Target="Adapter" Name="Port">5006</Setting>
    <Setting Target="Host" Name="TargetConfigNames">006_Transform HL7 to SDA</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_007" Category="Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Adapter" Name="Port">5007</Setting>
    <Setting Target="Host" Name="TargetConfigNames">007_Verify thresholds for rejection</Setting>
  </Item>
  <Item Name="INT_011" Category="Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5011</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">011_MapGenderToStandard</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_012" Category="Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5012</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">012_FilterOutpatientBadDepartment</Setting>
  </Item>
  <Item Name="INT_013" Category="Test4" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5013</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">013_TransformVendorOBXCodes</Setting>
  </Item>
  <Item Name="Message SINK" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="Speak to STEVE" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9000</Setting>
  </Item>
  <Item Name="001_Reject Non ADT" Category="Test3" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router001</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="006_Transform HL7 to SDA" Category="Test3" ClassName="cip.bpl.TransformHL7toSDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="006_Transform SDA to FHIR" Category="Test3" ClassName="cip.bpl.SDAtoFHIR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">006_Save to FHIR Server_HTTP</Setting>
    <Setting Target="Host" Name="TransformClass">cip.util.TransformSDA3ToFHIR</Setting>
    <Setting Target="Host" Name="FHIRMetadataSet">HL7v40 / FHIR R4 Core Specification</Setting>
    <Setting Target="Host" Name="TraceOperations"></Setting>
    <Setting Target="Host" Name="OutputToQuickStream">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="CustomSDAtoFHIRDTLPackage">cip.dtl.FHIR</Setting>
  </Item>
  <Item Name="003_ValidateORUMissingOBX" Category="Test4,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dmr-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router003</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="011_MapGenderToStandard" Category="Test4,Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router011</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="012_FilterOutpatientBadDepartment" Category="Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router012</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ResponseFrom">012_BadLocation_NACK</Setting>
  </Item>
  <Item Name="012_BadLocation_NACK" Category="Test4" ClassName="cip.bpl.RaiseBadFacilityNACK" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="004_ADT Mask PID" Category="Test2" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Applies INT-004 mask PID only" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router004</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="005_ADT Version 2.4 to 2.3.1" Category="Test2" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Applies INT-005 convert ADT^A01 v2.4 to v2.3.1 only" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router005</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="004_005_DST" Category="Test2" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="Shared outbound for INT-004 and INT-005 (masked ADT^A01 v2.4 / converted ADT^A01 v2.3.1)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="002_Route by MSH-4" Category="Test1" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Applies INT-002 route by MSH-4 to one of 3 destinations" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router002</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="002_DST_SH01" Category="Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-01" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="002_DST_SH02" Category="Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-02" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="002_DST_SH03" Category="Test1" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="INT-002 destination for MSH-4=SH-03" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="013_TransformVendorOBXCodes" Category="Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router013</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Sender-1" Category="Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22241</Setting>
  </Item>
  <Item Name="Sender-2" Category="Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22242</Setting>
  </Item>
  <Item Name="Sender-3" Category="Test4" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22243</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="Test3" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="001_RejectionHandler" Category="Test3" ClassName="cip.bo.RejectionHandler001" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessClass">cip.bo.RejectionHandler001</Setting>
  </Item>
  <Item Name="006_Save to FHIR Server_HTTP" Category="Test3" ClassName="HS.FHIRServer.Interop.HTTPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="Credentials">superuser</Setting>
    <Setting Target="Adapter" Name="HTTPPort">80</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/csp/testns/fhir/r4/Bundle</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
  </Item>
  <Item Name="007_Verify thresholds for rejection" Category="Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router007</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="007_DST_Hosp1" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Operation.TCPOperation</Setting>
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22251</Setting>
  </Item>
  <Item Name="007_DST_Hosp2" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22252</Setting>
  </Item>
  <Item Name="007_DST_Hosp3" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22253</Setting>
  </Item>
  <Item Name="008_DST_Hosp1" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22251</Setting>
  </Item>
  <Item Name="008_DST_Hosp2" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22252</Setting>
  </Item>
  <Item Name="008_DST_Hosp3" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22253</Setting>
  </Item>
  <Item Name="INT_008" Category="Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Adapter" Name="Port">5008</Setting>
    <Setting Target="Host" Name="TargetConfigNames">008_Route to destination endpoint</Setting>
  </Item>
  <Item Name="INT_009" Category="Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4</Setting>
    <Setting Target="Adapter" Name="Port">5009</Setting>
    <Setting Target="Host" Name="TargetConfigNames">009_Route to destination endpoint</Setting>
  </Item>
  <Item Name="009_DST_Hosp1" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22251</Setting>
  </Item>
  <Item Name="009_DST_Hosp2" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22252</Setting>
  </Item>
  <Item Name="009_DST_Hosp3" Category="Test5" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.20.20.5</Setting>
    <Setting Target="Adapter" Name="Port">22253</Setting>
  </Item>
  <Item Name="008_Route to destination endpoint" Category="Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router008</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="009_Route to destination endpoint" Category="Test5" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router009</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
</Production>
}

}
