

--exec usp_UpdateRptSubformTbl 1404,'<xml>
-- <subform_1449636506407>
--  <Rec0>
--   <text_1448511359444>asaeae</text_1448511359444>
--   <text_1448511365514>gda</text_1448511365514>
--   <date_11448511370815></date_11448511370815>
--   <date_11448511372575></date_11448511372575>
--   <text_1448511374230>hadh</text_1448511374230>
--  </Rec0>
--  <Rec1>
--   <text_1448511359444>sadfasdf</text_1448511359444>
--   <text_1448511365514>ssadf</text_1448511365514>
--   <date_11448511370815>2015-12-17T18:30:00.000Z</date_11448511370815>
--   <date_11448511372575>2015-12-17T18:30:00.000Z</date_11448511372575>
--   <text_1448511374230>asdfsadf</text_1448511374230>
--  </Rec1>
-- </subform_1449636506407>
-- <subform_2123123123123>
--  <Rec0>
--   <text_1448511359444>ahdajd</text_1448511359444>
--   <text_1448511365514>jadjad</text_1448511365514>
--   <date_11448511370815></date_11448511370815>
--   <date_11448511372575>2015-12-09T18:30:00.000Z</date_11448511372575>
--   <text_1448511374230>jasdj</text_1448511374230>
--  </Rec0>
--  <Rec1>
--   <text_1448511359444>rar</text_1448511359444>
--   <text_1448511365514>ararjia</text_1448511365514>
--   <date_11448511370815>2015-12-17T18:30:00.000Z</date_11448511370815>
--   <date_11448511372575>2015-12-17T18:30:00.000Z</date_11448511372575>
--   <text_1448511374230>asdfsadf</text_1448511374230>
--  </Rec1>
-- </subform_2123123123123>
--  <subform_1449636506407>
--  <Rec0>
--   <text_1448511359444>asaeFFFae</text_1448511359444>
--   <text_1448511365514>gFFda</text_1448511365514>
--   <date_11448511370815></date_11448511370815>
--   <date_11448511372575></date_11448511372575>
--   <text_1448511374230>hFFadh</text_1448511374230>
--  </Rec0>
--  <Rec1>
--   <text_1448511359444>sadfaHHsdf</text_1448511359444>
--   <text_1448511365514>ssHHadf</text_1448511365514>
--   <date_11448511370815>2015-11-17T18:30:00.000Z</date_11448511370815>
--   <date_11448511372575>2015-11-17T18:30:00.000Z</date_11448511372575>
--   <text_1448511374230>asdfsaHHdf</text_1448511374230>
--  </Rec1>
-- </subform_1449636506407>
-- </xml>'
--,1
--,1
--,1
--,1

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_UpdateRptSubformTbl' AND type='p')
DROP PROCEDURE usp_UpdateRptSubformTbl;

GO

CREATE PROC usp_UpdateRptSubformTbl
(
 @subform_id int
,@xmldata_input xml
,@userid int
,@contactid int
,@connid int
,@connectionid int 
)

AS

BEGIN

	SET NOCOUNT ON
	BEGIN TRAN
	BEGIN TRY

		DECLARE  @TblName VARCHAR(200)
				,@runsql NVARCHAR(max)
				,@dsql NVARCHAR(max)
				,@startid INT
				,@endid INT
				,@inserted_id INT
				,@field_name VARCHAR(1200)
				,@field_value VARCHAR(max)
				,@SubF INT
				,@RecF INT
				,@BFL INT = 0
				,@EFL INT = 0
				,@BSL INT = 0
				,@ESL INT = 0
				,@BTL INT = 0
				,@ETL INT = 0
				,@FormName NVARCHAR(200) = ''
				,@RecName NVARCHAR(100) = ''

		Set @TblName='RptTbl_'+cast(@subform_id as varchar(10))

		CREATE TABLE #xmldata_input
		(
		 id int identity(1,1)
		,InputFieldname NVARCHAR(max)
		,InputFieldvalue NVARCHAR(max)
		,SubF Int
		,RecF Int
		)

		;WITH xmldata_input
		AS 
		(
		SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
		,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
		FROM @xmldata_input.nodes('//.') as [table]([column])
		WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
		)

		INSERT into #xmldata_input (InputFieldname,InputFieldvalue)
		SELECT InputFieldname,InputFieldvalue FROM xmldata_input 
		where InputFieldname not in('xml') and InputFieldname not like 'form%'

		UPDATE #xmldata_input
		SET InputFieldvalue=replace(InputFieldvalue,'undefined','')
 
		UPDATE #xmldata_input SET SubF = ID WHERE InputFieldname Like 'SubForm%'
		UPDATE #xmldata_input SET RecF = ID WHERE InputFieldname Like 'Rec%'

		--select * from #xmldata_input
 
		SELECT @startid= 1 ,@endid=count(*) from #xmldata_input

		--To update serial no of subform and records.

		WHILE(@startid<=@endid)
		BEGIN
			If EXISTS (Select 1 From #xmldata_input Where ID = @startid And SubF Is Not Null)
				Select @SubF = SubF From #xmldata_input Where ID = @startid
			Update #xmldata_input Set SubF = @SubF Where ID = @startid And SubF Is Null

			If EXISTS (Select 1 From #xmldata_input Where ID = @startid And RecF Is Not Null)
				Select @RecF = RecF From #xmldata_input Where ID = @startid
			If @startid >1
				Update #xmldata_input Set RecF = @RecF Where ID = @startid And RecF Is Null 

			Set @startid = @startid+1
		END
 
		--Select * From #xmldata_input
		--IF EXISTS (SELECT 1 FROM sys.objects WHERE name=@TblName AND type='u')
 		
		Select @BFL = Min(SubF) From #xmldata_input
		Select @EFL = Max(SubF) From #xmldata_input

		--Looping SubForms

		WHILE(@BFL<=@EFL)
		BEGIN
			Select Top 1 @FormName=inputfieldname From #xmldata_input Where SubF = @BFL
			Select @BSL = Min(RecF) From #xmldata_input Where SubF = @BFL  And inputfieldname Not LIKE 'SubForm%'
			Select @ESL = Max(RecF) From #xmldata_input Where SubF = @BFL  And inputfieldname Not LIKE 'SubForm%'

			--Looping Records

			WHILE(@BSL<=@ESL)
			BEGIN
				Select Top 1 @RecName=inputfieldname From #xmldata_input Where RecF = @BSL 
				And inputfieldname Not LIKE 'SubForm%'

				SET @dsql='select recid into ##recs from '+@TblName+' where subform_field_name='''+@FormName+
														           ''' and User_id='+cast(@userid as varchar(20))+
														           ' and Connid='+cast(@connid as varchar(20))+
														           ' and Contactid='+cast(@contactid as varchar(20))+
														           ' and Connectionid='+cast(@connectionid as varchar(20))

				print @dsql
				exec (@dsql)

				IF(@RecName not in(select recid from ##recs))

				BEGIN

					Set @runsql='INSERT INTO '+@TblName
					+'(subform_field_name,RecID,User_id,Connid,Contactid ,Connectionid,CreatedBy,CreatedAt,UpdatedBy,UpdatedAt)
					Select '''+@FormName+ 
					''','''+@RecName+ 
					''','+cast(@userid as varchar(10))+
					','+cast(@connid as varchar(10))+
					','+cast(@contactid as varchar(10))+
					','+cast(@connectionid as varchar(10))+
					','+cast(@userid as varchar(10))+
					',getdate()
					,''''
					,'''''

					--PRINT @runsql
					EXEC(@runsql)
					Set @inserted_id = 0
					SET @inserted_id=@@identity
					Select @BTL = Min(ID) From #xmldata_input Where RECF = @BSL  
					And inputfieldname Not LIKE 'Rec%' 
					And inputfieldname Not LIKE 'SubForm%'
					Select @ETL = Max(ID) From #xmldata_input Where RECF = @BSL  
					And inputfieldname Not LIKE 'Rec%' 
					And inputfieldname Not LIKE 'SubForm%'

					--Looping Fields to Update

					WHILE(@BTL<=@ETL)
					BEGIN
						select @field_name=inputfieldname 
						,@field_value=inputfieldvalue 
						from #xmldata_input
						where id=@BTL And inputfieldname Not LIKE 'Rec%'

						set @runsql='update '+@TblName
						+' set '+@field_name+' = '''+@field_value
						+''' where id = '+cast(@inserted_id as varchar(10))
						--PRINT @runsql
						EXEC(@runsql)
						Select @BTL = Min(ID) From #xmldata_input Where ID > @BTL 
						AND RECF = @BSL And inputfieldname Not LIKE 'Rec%' 
						And inputfieldname Not LIKE 'SubForm%'
					END

				END

				ELSE 

				BEGIN

					Select @BTL = Min(ID) From #xmldata_input Where RECF = @BSL  
					And inputfieldname Not LIKE 'Rec%' 
					And inputfieldname Not LIKE 'SubForm%'
					Select @ETL = Max(ID) From #xmldata_input Where RECF = @BSL  
					And inputfieldname Not LIKE 'Rec%' 
					And inputfieldname Not LIKE 'SubForm%'

					WHILE(@BTL<=@ETL)
					BEGIN
						select @field_name=inputfieldname 
						,@field_value=inputfieldvalue 
						from #xmldata_input
						where id=@BTL And inputfieldname Not LIKE 'Rec%'

						set @runsql='update '+@TblName
						+' set '+@field_name+' = '''+@field_value
						+''' where subform_field_name='''+@FormName
								 +''' and User_id='+cast(@userid as varchar(20))
								 +' and Connid='+cast(@connid as varchar(20))
								 +' and Contactid='+cast(@contactid as varchar(20))
								 +' and Connectionid='+cast(@connectionid as varchar(20))
								 +' and RecID='''+@RecName+''''

						PRINT @runsql
						EXEC(@runsql)

						Select @BTL = Min(ID) From #xmldata_input Where ID > @BTL 
						AND RECF = @BSL And inputfieldname Not LIKE 'Rec%' 
						And inputfieldname Not LIKE 'SubForm%'

					END
				END

				Select @BSL = Min(RecF) From #xmldata_input Where RECF > @BSL 
				AND SubF = @BFL  
				And inputfieldname Not LIKE 'SubForm%'

				drop table ##recs

			END
			Select @BFL = Min(SubF) From #xmldata_input Where SubF > @BFL
		END
 
 
		DROP TABLE #xmldata_input
	END TRY

	BEGIN CATCH

		IF (@@TRANCOUNT>0)
		ROLLBACK TRAN
		print error_number()
		print error_message()
		
	END CATCH

	IF (@@TRANCOUNT>0)
	COMMIT TRAN

	SET NOCOUNT OFF

 END



