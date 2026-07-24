Class cip.dtl.NSWH.ADTA01.NSWH.ADTA01.Version24to23 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.4:ADT_A01' targetDocType='2.3:ADT_A01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"2.3"' property='target.{MSH:VersionID}' action='set' />
<assign value='source.{EVN}' property='target.{EVN}' action='set' />
<assign value='source.{PID}' property='target.{PID}' action='set' />
<assign value='source.{PD1}' property='target.{PD1}' action='set' />
<assign value='source.{PR1grp()}' property='target.{PR1grp()}' action='set' />
<comment>
<annotation>Marshalling ROL Required PR1 segment to be OPTIONAL</annotation>
</comment>
<foreach property='source.{ROL()}' key='k1' disabled='1' >
<assign value='source.{ROL(k1)}' property='target.{PR1grp(1).ROL(k1)}' action='set' />
</foreach>
<assign value='source.{NK1()}' property='target.{NK1()}' action='set' />
<assign value='source.{PV1}' property='target.{PV1}' action='set' />
<assign value='source.{PV2}' property='target.{PV2}' action='set' />
<assign value='source.{ZPV}' property='target.{ACC}' action='set' disabled='1' />
<assign value='source.{DB1()}' property='target.{DB1()}' action='set' />
<assign value='source.{OBX()}' property='target.{OBX()}' action='set' />
<assign value='source.{AL1()}' property='target.{AL1()}' action='set' />
<assign value='source.{DG1()}' property='target.{DG1()}' action='set' />
<assign value='source.{DRG}' property='target.{DRG}' action='set' />
<assign value='source.{GT1()}' property='target.{GT1()}' action='set' />
<assign value='source.{IN1grp()}' property='target.{IN1grp()}' action='set' />
<assign value='source.{ACC}' property='target.{ACC}' action='set' />
<assign value='source.{UB1}' property='target.{UB1}' action='set' />
<assign value='source.{UB2}' property='target.{UB2}' action='set' />
<comment>
<annotation>Transform ROLi2 into PR1grp().2.ROL() - Required PR1 segment to be OPTIONAL</annotation>
</comment>
<foreach property='source.{ROLi2()}' key='k2' disabled='1' >
<assign value='source.{ROLi2(k2)}' property='target.{PR1grp(1).ROL(k1+k2+1)}' action='set' />
</foreach>
<comment>
<annotation>ZAC segment is not represented in target 2.3.1 message structure</annotation>
</comment>
<comment>
<annotation>PDA segment is not represented in target 2.3.1 message structure</annotation>
</comment>
</transform>
}

}
