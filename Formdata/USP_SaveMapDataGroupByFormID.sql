

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_SaveMapDataGroupByFormID] 
(
	@formdata XML
)
AS 
BEGIN
			
SET ARITHABORT ON ;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON ;
SET ANSI_NULLS ON
SET NOCOUNT ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;


Declare @FormfieldInfo Table
		(TableName varchar(max),
		FieldName varchar(max),
		DisplayName varchar(max),
		FieldType varchar(50),
		FieldSize int,
		DefltVal varchar(max),
		Req bit,
		ContactPrefix varchar(50),
		LkpTable varchar(max),
		LkpField varchar(max))

Declare	@RunSql varchar(max),
	@SPRunSql nvarchar(max),
	@ParamDef nvarchar(max),
	@CIListTemplateItemId int,
	@MAPFormDataId int,
	@ContactAIRSId int,
	@ContactId int,
	@ContactPrefix varchar(50),
	@AgencyDB varchar(50),
	@TableName varchar(max),
	@FieldName varchar(max),
	@DefltVal varchar(max),
	@FieldType varchar(50),
	@SaveData varchar(max),
	@LkpTable  varchar(max),
	@MaxCnt INT ,
	@StrtCnt INT,
	@SaveFieldName varchar(max),
	@SaveDate	varchar(50),
	@SaveNumber	varchar(50),
	@SaveText	varchar(max),
	@AgencyId	int,
	@SaveFieldData varchar(max),
	@FormName VARCHAR(MAX),@FormFieldName VARCHAR(MAX) , 	
	@Sql NVARCHAR(max),@sqlParamDef nvarchar(Max),
	@FormID INT,
	@User_Id INT,
	@ConnId INT,
	@ConnectionID INT,
	@FormmakerID INT


				
SET NOCOUNT ON;

CREATE TABLE #FormTbl
(
	id int identity(1,1),
	FormName varchar(MAX),
	FormID INT,
	PageId INT,
	FieldName Varchar(MAX),
	Libraryfieldname varchar(MAX)
)
--select @formdata			
SELECT @FormID		 =  i.value('FormId[1]','int') from @formdata.nodes('/data') i(i);
SELECT @User_Id		 =  i.value('UserId[1]', 'int') from @formdata.nodes('/data') i(i);
SELECT @ConnId		 =  i.value('Connid[1]', 'int') from @formdata.nodes('/data') i(i);
SELECT @ConnectionID =  i.value('ConnectionID[1]', 'int') from @formdata.nodes('/data') i(i);
			

BEGIN TRY
/*---SaveMap data Log----*/
INSERT INTO FormmakerSaveStatusLog( UserId ,FormID ,ConnId ,ConnectionId ,Status,StartDate )
SELECT	@User_Id , @FormID,@ConnId,@ConnectionID,'STARTED',GETDATE()
			
SET @FormmakerID = SCOPE_IDENTITY()
			
UPDATE  dbo.user_accounts
SET		SBFlag = 'started'
		,SBSaveMapDate = getdate()
WHERE user_id = @User_Id


-- Get DBName of Agency

SET  @AgencyDB = (SELECT TOP 1 DBName
From IrrisCentral.dbo.lutPrimaryAgency
where MapDbName = db_name())
			
--Get @AgencyId
SET  @AgencyId = (SELECT TOP 1 siteid
From IrrisCentral.dbo.lutPrimaryAgency
where MapDbName = db_name())
			
			
-- Inorder to retrieve feildNames using formid from formmaker tables
			
INSERT INTO #FormTbl (FormName,FormID,PageId,FieldName,Libraryfieldname)
SELECT     DISTINCT 'Formmaker_'+FP.formname  as FormName ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name--,FS.Data_id
FROM		formmaker_submissions FS
INNER JOIN	formmaker_properties FP ON (FS.FORM_ID = FP.FORM_ID)
INNER JOIN	formmaker_pages FPG ON (FP.FORM_ID = FPG.FORM_ID)
INNER JOIN	formmaker_fields FF ON ( (FPG.PAGE_ID = FF.PAGE_ID) AND (use_library = 1) )
WHERE  FS.FORM_ID = @FormID 
GROUP BY 'Formmaker_'+FP.formname   ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name


--SELECT * FROM #FormTbl ORDER BY 1

SET @StrtCnt  = 1
SET @MaxCnt   = SCOPE_IDENTITY()
			

			
--While loop
WHILE @StrtCnt <= @MaxCnt
BEGIN
Begin Try
					
		SELECT @FormName	   = FormName,@FormFieldName = FieldName, @SaveFieldName	= Libraryfieldname 
				FROM   #FormTbl 
				WHERE Id = @StrtCnt
					
		Set @sqlParamDef	= '@SaveText Varchar(max) output'
		SET @Sql		    = ' SELECT   @SaveText = '+ @FormFieldName +' FROM '+ @FormName + 
								' WHERE USER_ID = '+ CAST(@User_Id as varchar(20))+' AND CONNID = '+ CAST(@ConnId as varchar(20)) +' 
								AND CONNECTIONID = ' +CAST(@ConnectionID as varchar(20))
		--print @Sql
		Exec sp_executesql @Sql,@sqlParamDef,@SaveText = @SaveText output

		SET @SaveFieldName  = @SaveFieldName
		SET @SaveDate		= null
		SET @SaveNumber		= null
		SET @SaveText       = @SaveText

--SELECT @SaveFieldName as SaveFieldName
--SELECT @SaveText as SaveText
			
--If @SaveNumber is not null
--BEGIN
--	set @SaveData = @SaveNumber
--END
--Else If @SaveText is not null
--BEGIN
--	set @SaveData = replace(@SaveText,'''','''''')
--END
--Else 
--	Begin
--		If @SaveDate is not null
--			set @SaveData = @SaveDate
--		Else
--			set @SaveData = '01/01/1900'
--	End
set @SaveData = replace(@SaveText,'''','''''')	


--If @SaveData is null or @SaveData = ''
--	set @SaveData = ''
				
Insert into @FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,ContactPrefix,LkpTable,LkpField) exec SP_AgencyFormFieldLibrary @AgencyId, @SaveFieldName

Select 	@TableName = TableName,
			@FieldName = FieldName,
			@DefltVal = DefltVal,
			@ContactPrefix = ContactPrefix,
			@LkpTable = LkpTable,
			@FieldType = FieldType
from @FormfieldInfo
			
			--Print '----------'
			--Print @ContactPrefix
			--Print @SaveData
			--Print @TableName
			--Print @FieldName
			--Print '----------'

If @TableName = 'MAPSystemData'
	Begin 

--					 Print 'got to MAPSystemData save'
		If @SaveFieldName = 'EDD' 
			Begin
				-- Print 'EDD'
				Update user_accounts
					Set edd = @SaveData
				where [user_id] = @User_Id

			End
		Else
			Begin
				Set @MAPFormDataId = 0
				Select @MAPFormDataId = Coalesce(MapFormDataId,0)
						From MapFormData
						where [user_id] = @User_Id
							and FieldName = @SaveFieldName
							
				print @MAPFormDataId
				print @SaveData
							
				If @MAPFormDataId is not null and @MAPFormDataId > 0
							
					Begin
							--Print 'Updated <' + @SaveData + '>'
						If @SaveData = 'No Data'
							set @SaveData = ''

						Update MapFormData 
							Set FieldData = @SaveData
							Where MapFormDataId = @MAPFormDataId
					End
				Else If @SaveData <> 'No Data'
					Begin
							--Print 'Inserted <' + @SaveData + '>'
						Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
							Values (@User_Id,@ContactPrefix,@SaveFieldName,@SaveData)
					End
				--SELECT {fn NOW()}
				--exec SP_MAPSaveContact @AgencyDB, @User_Id, @ContactPrefix, @SaveFieldName
				exec [MAPSaveContact] @AgencyDB, @User_Id, @ContactPrefix, @SaveFieldName
							

			End
	End

Else If @TableName = 'Medical Info'
	Begin
		If charindex('Med_1',@FieldName) > 0
			BEGIN
				Select  @ContactId = Cast(Coalesce(FieldData,'0') as int)
				From MapFormData
				where [user_id] = @User_Id
				and ContactPrefix = 'AP1'
				and FieldName = 'AP1ContactId'
			END
		Else
			BEGIN
															
				Select  @ContactId = Cast(Coalesce(FieldData,'0') as int)
					From MapFormData
					where [user_id] = @User_Id
					and ContactPrefix = 'AP2'
					and FieldName = 'AP2ContactId'
			END
		Set @SaveText = null
		Set @SaveDate = null
		Set @SaveNumber = null
		If @LkpTable > ''
			Begin
				Set @SaveNumber = @SaveData
				Set @SaveText = 'Pulldown'
			End
		Else If @FieldType = 'date' or @FieldType = 'Datetime'
			Set @SaveDate = @SaveData
		Else 
			Set @SaveText = @SaveData
		-- Print @ContactId
		exec SaveMedData @AgencyId,@ContactId,@DefltVal,@SaveDate,@SaveNumber,@SaveText

	End
Else
	Begin
		-- Print 'got to cilist save'
		Select @ContactId = airs_contact_id
			from user_accounts
			where [User_Id] = @User_Id
		Set @SaveText = null
		Set @SaveDate = null
		Set @SaveNumber = null

		If @FieldType in ('text','TextArea','RadioButton','Checkbox','MultiSelect')
			Set @SaveText = @SaveData
		Else If @FieldType = 'date' or @FieldType = 'Datetime' or @FieldType = 'datetime'
			Set @SaveDate = @SaveData
		Else If @FieldType = 'int' or @FieldType = 'Real'
			Set @SaveNumber = @SaveData
		If @LkpTable = 'YesNoPullDown'
			Begin
				If @SaveData = 'No'
					Set @SaveNumber = 0
				Else If @SaveData = 'Yes'
					Set @SaveNumber = 1
				Else If @SaveData = 'Maybe'
					Set @SaveNumber = 2
			End	

		exec UpdateCIListItemData @AgencyId,0,@ContactId,@DefltVal,@SaveDate,@SaveNumber,@SaveText

	End
end Try
Begin Catch
	--insert into ErrorLog([user_id], Agency_Id, SP, FieldName, ErrorNumber, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, ErrorMessage)
	--SELECT
	--	@User_Id  as [user_id]
	--		,@AgencyId as Agency_Id
	--		,'SaveMAPDataGroup' AS SP
	--		,@SaveFieldName AS FieldName
	--		,ERROR_NUMBER() AS ErrorNumber
	--		,ERROR_SEVERITY() AS ErrorSeverity
	--		,ERROR_STATE() AS ErrorState
	--		,ERROR_PROCEDURE() AS ErrorProcedure
	--		,ERROR_LINE() AS ErrorLine
	--		,ERROR_MESSAGE() AS ErrorMessage

End Catch 

/*********WHILE LOOP CLOSE***************/
			 
SET    @StrtCnt = @StrtCnt + 1
END
/*********WHILE LOOP CLOSE***************/

/**************Update SB Flag**************************/
UPDATE  dbo.user_accounts
SET		SBFlag = 'completed'
		,SBSaveMapDate = getdate()
WHERE user_id = @User_Id

/************ Update Formmaker status log *************/
UPDATE	FormmakerSaveStatusLog
SET		STATUS	 = 'COMPLETED'	,
		EndDate  = GETDATE()
WHERE	id = @FormmakerID 
			
END TRY
BEGIN CATCH
		
UPDATE  dbo.user_accounts
SET		SBFlag			= NULL
		,SBSaveMapDate  = NULL
WHERE user_id = @User_Id
			
--INSERT INTO Table_ErrorLog (error,message) values (ERROR_NUMBER(),ERROR_MESSAGE())
			
UPDATE	FormmakerSaveStatusLog
SET		ErrorMsg = ERROR_MESSAGE(),
		STATUS	 = 'ERROR'	,
		EndDate  = GETDATE()
WHERE	id = @FormmakerID 

END CATCH

END

		






