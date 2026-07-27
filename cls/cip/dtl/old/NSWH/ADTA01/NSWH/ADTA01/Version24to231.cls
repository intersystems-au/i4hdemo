Class cip.dtl.old.NSWH.ADTA01.NSWH.ADTA01.Version24to231 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.4:ADT_A01' targetDocType='NSWH_2.3.1:ADT_A01' create='copy' language='objectscript' >
<assign value='"2.3.1"' property='target.{MSH:12}' action='set' />
<assign value='""' property='target.{MSH:17}' action='set' />
<assign value='""' property='target.{MSH:19}' action='set' />
<foreach property='target.{ROL()}' key='k0' >
<assign value='""' property='target.{ROL(k0):9}' action='set' />
<assign value='""' property='target.{ROL(k0):10}' action='set' />
<assign value='""' property='target.{ROL(k0):11}' action='set' />
<assign value='""' property='target.{ROL(k0):12}' action='set' />
</foreach>
<foreach property='target.{NK1()}' key='k1' >
<assign value='""' property='target.{NK1(k1):6}' action='set' />
</foreach>
<assign value='' property='target.{ZAC}' action='remove' />
</transform>
}

}
