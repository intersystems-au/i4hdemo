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
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.AlertRule</Setting>
  </Item>
  <Item Name="EMailAlert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HL7FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="006_Convert FHIR" Category="Test3" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router006</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="INT_001" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5001</Setting>
  </Item>
  <Item Name="INT_002" Category="Test1" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="INT-002 inbound - route by MSH-4" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">5002</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NSWH_2.4,NSWH_2.3.1</Setting>
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
    <Setting Target="Host" Name="TargetConfigNames">006_Convert FHIR</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_007" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5007</Setting>
  </Item>
  <Item Name="INT_008" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5008</Setting>
  </Item>
  <Item Name="INT_009" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5009</Setting>
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
  <Item Name="HL7 TCP Out" Category="Test4,Test3" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">localhost</Setting>
    <Setting Target="Adapter" Name="Port">9000</Setting>
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
</Production>
}

}
