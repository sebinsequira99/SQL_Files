

--exec usp_UpdateRptSubformTbl_Data '<xml>
--   <form_1404>
--   <subform_1449636506407>
--    <Rec0>
--     <text_1448511359444>asaeae</text_1448511359444>
--     <text_1448511365514>gda</text_1448511365514>
--     <date_11448511370815></date_11448511370815>
--     <date_11448511372575></date_11448511372575>
--     <text_1448511374230>hadh</text_1448511374230>
--    </Rec0>
--    <Rec1>
--     <text_1448511359444>sadfasdf</text_1448511359444>
--     <text_1448511365514>ssadf</text_1448511365514>
--     <date_11448511370815>2015-12-17T18:30:00.000Z</date_11448511370815>
--     <date_11448511372575>2015-12-17T18:30:00.000Z</date_11448511372575>
--     <text_1448511374230>asdfsadf</text_1448511374230>
--    </Rec1>
--   </subform_1449636506407>
--   <subform_2123123123123>
--    <Rec0>
--     <text_1448511359444>ahdajd</text_1448511359444>
--     <text_1448511365514>jadjad</text_1448511365514>
--     <date_11448511370815></date_11448511370815>
--     <date_11448511372575>2015-12-09T18:30:00.000Z</date_11448511372575>
--     <text_1448511374230>jasdj</text_1448511374230>
--    </Rec0>
--    <Rec1>
--     <text_1448511359444>rar</text_1448511359444>
--     <text_1448511365514>ararjia</text_1448511365514>
--     <date_11448511370815>2015-12-17T18:30:00.000Z</date_11448511370815>
--     <date_11448511372575>2015-12-17T18:30:00.000Z</date_11448511372575>
--     <text_1448511374230>asdfsadf</text_1448511374230>
--    </Rec1>
--   </subform_2123123123123>
--    </form_1404>
--   <form_1439>
--   <subform_1449636506456>
--    <Rec0>
--     <select_1449575057568>Test1</select_1449575057568>
--    </Rec0>
--    <Rec1>
--     <select_1449575057568>Test2</select_1449575057568>
--    </Rec1>
--   </subform_1449636506456>
--   </form_1439>
--   <form_1444>
--   <subform_1449636506525>
--    <Rec0>
--     <text_1449665815423>Test3</text_1449665815423>
--    </Rec0>
--    <Rec1>
--     <text_1449665815423>Test4</text_1449665815423>
--    </Rec1>
--   </subform_1449636506525>
--   </form_1444>
--   </xml>',1,1,1,1


IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_UpdateRptSubformTbl_Data' AND type='p')
DROP PROCEDURE usp_UpdateRptSubformTbl_Data;
GO

CREATE PROC usp_UpdateRptSubformTbl_Data
(
 @xmldata_input_main xml
,@userid int
,@contactid int
,@connid int
,@connectionid int
)

AS
BEGIN

SET NOCOUNT ON

	DECLARE @startid int=1
		   ,@endid int
		   ,@subform_id INT
		   ,@xml1 xml
		   ,@nodename varchar(100)
	
	;WITH xmldata_input
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
	,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
	FROM @xmldata_input_main.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
	)
	
	SELECT * INTO #xmldata_input_main FROM xmldata_input where InputFieldname like'form%'
	
	ALTER TABLE #xmldata_input_main
	ADD id int identity(1,1)
	
	--select * from #xmldata_input_main
	
	select @endid=count(*) from #xmldata_input_main
	
	SELECT @xmldata_input_main AS xmldata_input_main INTO #XMLTBL
	
	WHILE(@startid<=@endid)
	
	BEGIN
		
		SELECT @NodeName = inputfieldname from #xmldata_input_main where id=@startid
		SELECT @subform_id=CAST(substring(@NodeName,charindex('_',@NodeName)+1,len(@NodeName)) AS INT)
		--PRINT @subform_id

		SELECT @xml1= T.N.query('.')
		FROM #XMLTBL
		CROSS APPLY xmldata_input_main.nodes('//*[local-name()=sql:variable("@NodeName")]') as T(N)
		--select @xml1
		EXEC usp_UpdateRptSubformTbl @subform_id,@xml1,@userid,@contactid,@connid,@connectionid
		SET @startid=@startid+1						 
	END
	
	DROP TABLE #xmldata_input_main
	DROP TABLE #XMLTBL

	SET NOCOUNT OFF

END