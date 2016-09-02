

--exec usp_GetRptSubformData_main'<xml>
--						<form_1404>
--						<subformname>subform_1449636506407</subformname>
--						</form_1404>
--						</xml>'
--						,'-1,-102495'

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_GetRptSubformData_main' AND type='p')
DROP PROCEDURE usp_GetRptSubformData_main;

GO

CREATE PROC usp_GetRptSubformData_main
(
 @xml_input xml
,@connid_list varchar(max)
)

AS
BEGIN

	SET NOCOUNT ON
	
	DECLARE @startid int=1
		   ,@endid int
		   ,@connid int
		   ,@XmlOut xml=''
		   ,@xmlsub xml=''

	SELECT value into #connids from udf_Split_into_rows(@connid_list)

	ALTER TABLE #connids
	ADD ID INT IDENTITY(1,1)

	SELECT @endid=max(id) from #connids

	WHILE(@startid<=@endid)

	BEGIN

		SELECT @connid=value from #connids where id=@startid
		exec usp_GetRptSubformData @xml_input,null,null,@connid,null,@xmlsub output
		SET @XmlOut = (SELECT @XmlOut,@XmlSub FOR XML PATH(''))
		SET @startid=@startid+1

	END

	SET NOCOUNT OFF
	SELECT @XmlOut FOR XML PATH(''),root('xml')
	DROP TABLE #connids

END









