

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_GetRptSubformData' AND type='p')
DROP PROCEDURE usp_GetRptSubformData;

GO

/*
Declare @xmlsub xml=''
exec usp_GetRptSubformData '<xml>
						<form_1404>
						<subformname>subform_1449636506407</subformname>
						</form_1404>
						</xml>',1,1,-1,1,@xmlsub OutPut

Select @xmlsub
*/

CREATE PROC usp_GetRptSubformData
(
 @xmldata_input xml
,@userid int=null
,@contactid int=null
,@connid int
,@connectionid int=null
,@xmloutput xml output
)

AS

BEGIN

	SET NOCOUNT ON
	
	DECLARE @runsql NVARCHAR(MAX)
		   ,@data_xml_output XML=''
		   ,@startid INT
		   ,@endid INT
		   ,@SubF INT
		   ,@formid INT
		   ,@FormName NVARCHAR(20)
		   ,@TblName NVARCHAR(20)
		   ,@BFL INT = 0
		   ,@EFL INT = 0
		   ,@BSL INT = 0
		   ,@ESL INT = 0
		   ,@XmlSubF XML = ''
		   ,@xml1 XML = ''
		   ,@XmlMainF XML = ''
		   ,@subform_field_name NVARCHAR(50)
		   ,@CName VARCHAR(200)
		   ,@CType VARCHAR(200)	
		   ,@RecName VARCHAR(20)

	 ;WITH xmldata_input
	 AS 
	 (
	 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') AS 'InputFieldname'
	 ,[column].value('.', 'NVARCHAR(max)') AS 'InputFieldvalue'
	 FROM @xmldata_input.nodes('//.') AS [table]([column])
	 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
	 )
	
	 SELECT * INTO #xmldata_input FROM xmldata_input 
	 WHERE InputFieldname not in('xml')
	
	 ALTER TABLE #xmldata_input
	 ADD id INT IDENTITY(1,1)
		,SubF INT
		,TblName VARCHAR(200)
	
	 --select * from #xmldata_input
	
	UPDATE #xmldata_input SET SubF=ID WHERE InputFieldname Like 'form%'

	SELECT @startid= 1 ,@endid=count(*) FROM #xmldata_input

	WHILE(@startid<=@endid)
	BEGIN

		IF EXISTS (SELECT 1 FROM #xmldata_input WHERE ID = @startid And SubF Is Not Null)

			SELECT @SubF = SubF 
				  ,@formid=(SELECT SUBSTRING(inputfieldname,CHARINDEX('_',inputfieldname)+1,LEN(inputfieldname)))
			FROM #xmldata_input 
			WHERE ID = @startid

		UPDATE #xmldata_input 
		SET SubF = @SubF 
		   ,TblName='RptTbl_'+cast(@formid AS VARCHAR(10))
		WHERE ID = @startid And SubF Is Null

		SET @startid = @startid+1

	END

	

	CREATE TABLE #result
	(id INT IDENTITY(0,1)
	,xml_output XML, RecID varchar(20))

	DELETE FROM #xmldata_input
	WHERE tblname is null

	--Select * From #xmldata_input
	CREATE TABLE #TblStr (ID INT IDENTITY(1,1),CName VARCHAR(200), CType VARCHAR(100),CLength INT)
	 
	SELECT @BFL=min(subf) FROM #xmldata_input
	SELECT @EFL=max(subf) FROM #xmldata_input

	WHILE(@BFL<=@EFL)
	BEGIN
		
		SELECT TOP 1 @TblName= tblname FROM #xmldata_input WHERE SUBF=@BFL
		SELECT @FormName = REPLACE(@TblName,'RptTbl','Form')
		SET @XmlSubF = ''			
		SELECT @BSL=min(id) FROM #xmldata_input WHERE SUBF = @BFL
		SELECT @ESL=max(id) FROM #xmldata_input WHERE SUBF = @BFL

		TRUNCATE TABLE #TblStr
		SET @runsql= 'INSERT INTO #TblStr (CName,CType,CLength) SELECT COLUMN_NAME,	DATA_TYPE,	CHARACTER_MAXIMUM_LENGTH
		FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_Name = ''' + @TblName + ''''
		--PRINT @runsql
		EXECUTE (@runsql)
		-- Create Temp Table
		CREATE TABLE  #TblRecs (Id INT)
		SELECT @startid= 2 ,@endid=count(*) FROM #TblStr

		WHILE(@startid<=@endid)
		BEGIN
			Select @CName = CName, @CType = CType + 
			CASE IsNull(CLength,'') WHEN '' Then '' 
			WHEN -1 THEN ' (Max) ' 
			ELSE ' (' + Cast(CLength As Varchar(100)) + ')' END
			FROM #TblStr WHERE ID = @startid

			SET @runsql='ALTER TABLE #TblRecs ADD '+@CName+' ' + @CType
			--PRINT @runsql
			EXEC (@runsql)

			SET @startid = @startid+1
		END
		-- End
		
		WHILE(@BSL<=@ESL)	

		BEGIN
			TRUNCATE TABLE #result
			TRUNCATE TABLE #TblRecs
			SELECT @subform_field_name=inputfieldvalue FROM #xmldata_input WHERE id=@BSL
			SET @runsql='INSERT INTO #TblRecs SELECT * FROM '+ @TblName +
			' WHERE subform_field_name = ''' + @subform_field_name 
			+ ''' and contactid='+cast(-(@connid) as varchar(20)) ---connid contactid
			--print @runsql
			EXEC(@runsql)

			SELECT @startid=min(id) FROM #TblRecs
			SELECT @endid=max(id) FROM #TblRecs
				
			WHILE(@startid<=@endid)
				
			BEGIN
				SET @RecName=(select RecID from #TblRecs WHERE id=@startid)
				SET @data_xml_output=(
				SELECT * FROM #TblRecs
				WHERE id=@startid
				FOR XML PATH(''),TYPE
				)
						
				INSERT INTO #result (xml_output , RecID)
				SELECT @data_xml_output , @RecName
									
				UPDATE #result
				SET xml_output.modify('delete /User_id[.]')
				UPDATE #result
				SET xml_output.modify('delete /Connid[.]')
				UPDATE #result
				SET xml_output.modify('delete /Contactid[.]')
				UPDATE #result
				SET xml_output.modify('delete /Connectionid[.]')
				UPDATE #result
				SET xml_output.modify('delete /CreatedBy[.]')
				UPDATE #result
				SET xml_output.modify('delete /CreatedAt[.]')
				UPDATE #result
				SET xml_output.modify('delete /Id[.]')
				UPDATE #result
				SET xml_output.modify('delete /subform_field_name[.]')
				UPDATE #result
				SET xml_output.modify('delete /UpdatedBy[.]')
				UPDATE #result
				SET xml_output.modify('delete /UpdatedAt[.]')
				UPDATE #result
				SET xml_output.modify('delete /RecID[.]')
					
				SELECT @startid=MIN(id) FROM #TblRecs WHERE id>@startid
				
			END
				
			--UPDATE #result
			--SET xml_output=CAST('<'+CAST(id AS VARCHAR(10))
			--+'>'+CAST(xml_output AS NVARCHAR(MAX))+'</rec_'+CAST(id AS VARCHAR(10))+'>' AS XML)

			UPDATE #result
			SET xml_output=CAST('<'+RecID+'>'+CAST(xml_output AS NVARCHAR(MAX))+'</'+RecID+'>' AS XML)
			
			SELECT @startid=MIN(id) FROM #result
			SELECT @endid=MAX(id) FROM #result
			SET @data_xml_output=''
			WHILE(@startid<=@endid)
				
			BEGIN
				SELECT @xml1 =xml_output FROM #result WHERE id=@startid
				SET @data_xml_output = (SELECT @data_xml_output, @XML1 FOR XML PATH(''))
				
				SET @startid=@startid+1
				
			END
				
			--select @data_xml_output for xml path(''), type,root('xml')						
				
			SELECT @data_xml_output = CAST('<'+@subform_field_name+'>'
			+CAST(@data_xml_output AS NVARCHAR(MAX))
			+'</'+@subform_field_name+'>' AS XML)
			--for xml path(''), type,root('xml')
			
			SET @XmlSubF = (SELECT @XmlSubF,@data_xml_output FOR XML PATH(''))
			SELECT @BSL = MIN(ID) From #xmldata_input WHERE ID > @BSL And SUBF = @BFL
		END
		DROP TABLE #TblRecs
		SELECT @XmlSubF = CAST('<'+@FormName+'>'+CAST(@XmlSubF AS NVARCHAR(MAX))+'</'+@FormName+'>' AS XML)
		SET @XmlMainF = (SELECT @XmlMainF,@XmlSubF FOR XML PATH(''))
		SELECT @BFL = MIN(SubF) FROM #xmldata_input WHERE SubF > @BFL

	END

	SELECT @XmlMainF = CAST('<connid_'+cast(@connid as varchar(20))
					   +'>'+CAST(@XmlMainF AS NVARCHAR(MAX))
					   +'</connid_'+cast(@connid as varchar(20))+'>' AS XML)
	SELECT @xmloutput=@XmlMainF
	--SELECT @XmlMainF AS XmLOut
	DROP TABLE #result
	DROP Table #xmldata_input
	SET NOCOUNT OFF

END






