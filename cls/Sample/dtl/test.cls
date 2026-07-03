Class Sample.dtl.test Extends Ens.DataTransformDTL [ DependsOn =  ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='EnsLib.HL7.Message' targetDocType='2.1:ACK' sourceClass='EnsLib.HL7.Message' sourceDocType='2.1:ACK' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
