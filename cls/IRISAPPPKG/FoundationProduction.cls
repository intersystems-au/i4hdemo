Class IRISAPPPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="IRISAPPPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>3</ActorPoolSize>
  <Item Name="dummyTest" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessClass">EnsLib.HL7.Operation.FileOperation</Setting>
    <Setting Target="Host" Name="Filename">%f_%Q%!+(_a)</Setting>
    <Setting Target="Adapter" Name="FilePath">/tmp</Setting>
  </Item>
</Production>
}

}
