

--exec usp_RptTblCreation 1404

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_RptTblCreation' AND type='p')
DROP PROCEDURE usp_RptTblCreation;

GO


CREATE PROC usp_RptTblCreation
(
 @Form_ID int
)
AS
BEGIN
-- (C) Faisal/Sebin	2015-12-09 For For Form System (Multi Record) Dynamic Table Creation
	SET NOCOUNT ON
	
	BEGIN TRAN
	DECLARE  @xmldata_input xml
			,@startid int=1
			,@endid int
			,@runsql nvarchar(max)
			,@subformname varchar(100)
			,@label varchar(200)
			,@type varchar(50)
			,@FName varchar(1200)
			,@TblName varchar(1200)
			,@TblID int
			,@fieldid int
			,@NewFieldName nvarchar(100)
			

	--DECLARE @Form_ID int  = 1404

	BEGIN TRY

		SELECT @xmldata_input=definition_xml from forms where id=@Form_ID
	
		SELECT @subformname=replace(form_name,' ','_') from forms where id=@Form_ID
		--Format(GETDATE(),'yyMMddHHmmss')
		SET @TblName='RptTbl_'+Cast(@Form_ID As Varchar(20))
		;
		WITH xmldata_input
		AS 
		(
		SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
		,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
		FROM @xmldata_input.nodes('//.') as [table]([column])
		WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
		)
 
		SELECT * into #xmldata_input FROM xmldata_input  
		where InputFieldname in('label','type','name') 
		and InputFieldvalue not in('n','p')

		ALTER TABLE #xmldata_input
		ADD id int identity(1,1)

		--select * from #xmldata_input

		--Pivot table #xmldata_input

		;with labels as
		(
		Select GRPNO
		, Max(label) label
		, Max([type])  [type]
		, Max([name]) [name]
		From (
		SELECT       
		GRPNO,label,[type],[name]
		FROM (  SELECT DENSE_RANK() Over (Partition By RNK Order By ID) GRPNO,*
		FROM (  Select  DENSE_RANK() Over (Order By inputfieldname) RNK,* From #xmldata_input Where inputfieldname IN 
		('label','type','name') ) as rk) AS SourceTable
		PIVOT
		(
		max(inputfieldvalue)
		FOR inputfieldname IN 
		(label
		,[type]
		,[name]
		)) AS PivotTable  ) Tst Group by GRPNO
		)

		select * into #labels from labels

		--select * from #labels

		IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE name=@TblName AND type='U')
		BEGIN
			select @TblID=max(tableid)+1 from ReportTableMaster
			set @runsql='Create table '+@TblName+' ( Id int identity(1,1)
													,subform_field_name varchar(200)
													,RecID varchar(20)
													,User_id int
													,Connid int
													,Contactid int
													,Connectionid int
													,CreatedBy int
													,CreatedAt datetime
													,UpdatedBy int
													,UpdatedAt datetime
													)'
			--PRINT @runsql
			EXEC(@runsql)

			Insert into ReportTableMaster(TableId
										 ,TableName
										 ,TableDisplayName
										 ,TableType)
			Select @TblID,@TblName,@TblName,'Master'
		
		End
		ELSE
		BEGIN
			select @TblID=tableid from ReportTableMaster Where TableName = @TblName
		END
 
 
		Delete From ReportFieldMaster WHERE TableId=@TblID
		Delete From ReportFieldMasterbase WHERE TableId=@TblID
		Select @fieldid=Isnull(min(fieldid),0) from ReportFieldMaster
		DBCC CHECKIDENT('ReportFieldMasterbase',reseed,@fieldid)
		INSERT INTO ReportFieldMasterbase(TableId
											,FieldName
											,DisplayName
											,FieldType
											,FieldSize
											,GridFilterDflt
											,DisplaySizeDflt
											,FieldDesc
											,DisplayPosition)
		Select @TblID,column_name,column_name,data_type,character_maximum_length,'text_filter',200,column_name,'left'
		FROM information_schema.columns
		WHERE table_name=@TblName And column_name = 'Contactid'

		Select @endid=count(*) from #labels
		WHILE(@startid<=@endid)
		BEGIN
 
			SELECT @label=label
					,@type=CASE [type] WHEN 'Number' THEN '[Real]'
										WHEN 'CheckBox' THEN '[VARCHAR](max)'
										WHEN 'Yes/No' THEN '[Real]'
										WHEN 'Text' THEN '[VARCHAR](max)'
										WHEN 'Select' THEN '[VARCHAR](max)'
										WHEN 'Date' THEN '[Datetime]'
										WHEN 'Password' THEN '[VARCHAR](max)'
										WHEN 'Hidden Field' THEN '[VARCHAR](max)'
										WHEN 'Memo' THEN '[VARCHAR](max)'
										WHEN 'GUID Field' THEN '[VARCHAR](max)'
										WHEN 'Table Entry' THEN '[VARCHAR](max)'
										WHEN 'Lookup Table' THEN '[VARCHAR](max)'
										ELSE '[VARCHAR](max)'	
						END
					,@FName = name
			FROM #labels 
			WHERE grpno=@startid

			If Not Exists( Select 1 From information_schema.columns Where table_name=@TblName And COLUMN_NAME = @FName)
			Begin
				SET @runsql='Alter Table '+@TblName+' Add '+@FName+' ' + @type
				--PRINT @runsql
				EXEC (@runsql)
			End

			INSERT INTO ReportFieldMasterbase(TableId
												,FieldName
												,DisplayName
												,FieldType
												,FieldSize
												,GridFilterDflt
												,DisplaySizeDflt
												,FieldDesc
												,DisplayPosition)
			Select @TblID,column_name,@label,data_type,character_maximum_length,'text_filter',200,@label,'left'
			FROM information_schema.columns
			WHERE table_name=@TblName And column_name = @FName

			Set @startid=@startid+1

		END
	
	
	
		/*
		INSERT INTO ReportFieldMasterbase(TableId
											,FieldName
											,DisplayName
											,FieldType
											,FieldSize
											,GridFilterDflt
											,DisplaySizeDflt
											,FieldDesc
											,DisplayPosition)
		Select @TblID,column_name,column_name,data_type,character_maximum_length,'text_filter',200,column_name,'left'
		FROM information_schema.columns
		WHERE table_name=@TblName And column_name Not in (Select FieldName From ReportFieldMasterbase Where TableID = @TblID) And 
		COLUMN_NAME not in ('subform_field_name','User_id','Connid','Connectionid','CreatedBy','CreatedAt','UpdatedBy','UpdatedAt','id')
																							
		select @startid=1,@endid=count(*) from #labels 											

		WHILE(@startid<=@endid)
		BEGIN
			SELECT @label = '', @NewFieldName = ''
			SELECT @label=label	FROM #labels WHERE grpno=@startid
			Select @NewFieldName = FieldName + ' ' + Cast(Abs(FieldId) As VARCHAR(20))  From ReportFieldMasterbase Where TableId = @TblID And FieldName = @label
		
			Update ReportFieldMasterbase Set FieldName = @NewFieldName
			Where TableId = @TblID And FieldName = @label

			Set @label=  @TblName +'.'+ @label
			Exec sp_rename  @label,  @NewFieldName , 'COLUMN'
			set @startid=@startid+1
		END

		*/
		Set identity_insert ReportFieldMaster on
		INSERT INTO ReportFieldMaster(TableId
									,FieldId
									,FieldName
									,DisplayName
									,FieldType
									,FieldSize
									,GridFilterDflt
									,DisplaySizeDflt
									,FieldDesc
									,DisplayPosition)
		select * from ReportFieldMasterbase where TableId=@TblID 
		set identity_insert ReportFieldMaster oFf

		Delete From [ReportTblRelation] Where MasterTableId = @TblID And AncillaryTableId = 2
		select @fieldid=IsNull(max(RelationId),0)+1 from [ReportTblRelation]
		Insert Into [ReportTblRelation]
		Select @fieldid,@TblID,2, (Select Top 1 FieldID From ReportFieldMaster 
		Where TableId =@TblID And FieldName = 'Contactid') ,41, 'Contact', 'Contact'
	
		drop table #xmldata_input
		drop table #labels

	END TRY

	BEGIN CATCH

		IF (@@TRANCOUNT>0)
		ROLLBACK TRAN
		print error_number()
		print error_message()
		
	END CATCH

	IF (@@TRANCOUNT>0)
	COMMIT TRAN
	
	Set NOCOUNT OFF
	
 END







