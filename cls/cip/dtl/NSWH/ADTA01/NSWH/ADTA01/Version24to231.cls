Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to231 Extends Ens.DataTransformDTL [ ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass="EnsLib.HL7.Message" targetClass="EnsLib.HL7.Message" sourceDocType="NSWH_2.4:ADT_A01" targetDocType="NSWH_2.3.1:ADT_A01" create="copy" language="objectscript" >

  <!-- MSH-12: version ID -> 2.3.1 -->
  <assign value='"2.3.1"' property='target.{MSH:12}' action='set' />
  <!-- MSH-17: country code, cleared -->
  <assign value='""' property='target.{MSH:17}' action='set' />
  <!-- MSH-19: principal language, cleared -->
  <assign value='""' property='target.{MSH:19}' action='set' />

  <foreach property='target.{ROL()}' key='k0'>
    <assign value='""' property='target.{ROL(k0):9}' action='set' />
    <assign value='""' property='target.{ROL(k0):10}' action='set' />
    <assign value='""' property='target.{ROL(k0):11}' action='set' />
    <assign value='""' property='target.{ROL(k0):12}' action='set' />
  </foreach>

  <!-- NK1-6: clear empty business-phone component ("^^^^^^") on every repeat -->
  <foreach property='target.{NK1()}' key='k1'>
    <assign value='""' property='target.{NK1(k1):6}' action='set' />
  </foreach>

  <!-- ZAC: not in the sample expected output, drop it -->
  <assign value='' property='target.{ZAC}' action='remove' />

</transform>
}

}
