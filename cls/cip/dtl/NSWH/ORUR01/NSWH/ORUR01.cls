Class cip.dtl.NSWH.ORUR01.NSWH.ORUR01 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NSWH_2.4:ORU_R01' targetDocType='NSWH_2.4:ORU_R01' create='copy' language='objectscript' >
<foreach property='target.{PIDgrpgrp()}' key='k1' >
<foreach property='target.{PIDgrpgrp(k1).ORCgrp()}' key='k2' >
<foreach property='source.{PIDgrpgrp(k1).ORCgrp(k2).OBXgrp()}' key='k3' >
<subtransform class='cip.dtl.NSWH.PID.NSWH' targetObj='target.{PIDgrpgrp(k1).PIDgrp.PID}' sourceObj='source.{PIDgrpgrp(k1).PIDgrp.PID}' />
<subtransform class='cip.dtl.NSWH.OBX24.NSWH24' targetObj='target.{PIDgrpgrp(k1).ORCgrp(k2).OBXgrp(k3).OBX}' sourceObj='source.{PIDgrpgrp(k1).ORCgrp(k2).OBXgrp(k3).OBX}' />
</foreach>
</foreach>
</foreach>
</transform>
}

}
