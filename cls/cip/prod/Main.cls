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
  <Item Name="test2.ADT.MaskAndConvert" Category="Test2" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="Applies INT-004 mask PID + INT-005 convert ADT^A01 v2.4 to v2.3.1" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.RouterTest2</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="test2.hl7.v231.TCP" Category="Test2" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="Test 2 outbound - sends the masked/converted ADT^A01 (v2.3.1) downstream over MLLP" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress"></Setting>
    <Setting Target="Adapter" Name="Port">9004</Setting>
    <Setting Target="Adapter" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="INT_001" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5001</Setting>
  </Item>
  <Item Name="INT_002" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5002</Setting>
  </Item>
  <Item Name="INT_003" Category="Test4,Test5" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5003</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">003_ValidateORUMissingOBX</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_004" Category="Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5004</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames"></Setting>
  </Item>
  <Item Name="INT_005" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5005</Setting>
  </Item>
  <Item Name="INT_006" Category="Test3" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.4,2.3.1</Setting>
    <Setting Target="Adapter" Name="Port">5006</Setting>
    <Setting Target="Host" Name="TargetConfigNames">006_ConvertADT to FHIR</Setting>
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
  <Item Name="INT_010" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5010</Setting>
  </Item>
  <Item Name="INT_011" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5011</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">011_MapGenderToStandard</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_012" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5012</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="INT_013" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Adapter" Name="Port">5013</Setting>
  </Item>
  <Item Name="test2.hl7.v24.TCP" Category="Test2" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="Test 2 inbound - INT-004 mask PID, then INT-005 convert v2.4 to v2.3.1" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Service.TCPService</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.4</Setting>
    <Setting Target="Adapter" Name="Port">9004</Setting>
    <Setting Target="Host" Name="TargetConfigNames">test2.ADT.MaskAndConvert</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="Message SINK" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="Speak to STEVE" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9000</Setting>
  </Item>
  <Item Name="HL7 TCP Out" Category="Test4,Test3" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">localhost</Setting>
    <Setting Target="Adapter" Name="Port">9000</Setting>
  </Item>
  <Item Name="003_ValidateORUMissingOBX" Category="Test3,Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router003</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="011_MapGenderToStandard" Category="Test3,Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router011</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="012_FilterOutpatientBadDepartment" Category="Test3,Test4" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation">dm-z</Setting>
    <Setting Target="Host" Name="BusinessRuleName">cip.rul.Router011</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
</Production>
}

}
