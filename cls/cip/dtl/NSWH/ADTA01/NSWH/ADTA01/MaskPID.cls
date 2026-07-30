Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.MaskPID Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message, ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' create='copy' language='objectscript' >
<assign value='"XXXX"' property='target.{3:5().1}' action='set' />
<assign value='"XXXX"' property='target.{3:5().2}' action='set' />
<assign value='"XXXX"' property='target.{3:7.1}' action='set' />
<assign value='"XXXX"' property='target.{3:8}' action='set' />
<assign value='"XXXX"' property='target.{3:2.1}' action='set' />
<assign value='"XXXX"' property='target.{3:3().1}' action='set' />
</transform>
}

}
