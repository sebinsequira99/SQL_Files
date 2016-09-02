

mapform

user_agencies

USP_ViewMAPDataGroupBYID 

library_systemdata


EXEC ViewMAPDataGroup  '222', '63977', 'add1,add2,city,state,county,country'


ALTER PROCEDURE [dbo].[USP_ViewMAPDataGroupBYID]
(
	@AgencyId int,
	@User_Id int,
	@FieldIDs varchar(MAX)
)
AS
Declare	@RunSql varchar(MAX),
		@RunSPSql nvarchar(2000),
		@SPRunsql nvarchar(2000),
		@ParamDef nvarchar(1000),
		@AgencyDB varchar(50),
		@ContactPrefix varchar(50),
		@ContactAIRSId int,
		@ContactId int,
		@CIListDate varchar(26),
		@CIListNumber varchar(50),
		@CIListText varchar(MAX),
		@TableName varchar(50),
		@FieldName varchar(MAX),
		@DefltVal varchar(200),
		@FieldType varchar(50),
		@LkpTable  varchar(50),
		@MaxCnt INT ,
		@StrtCnt INT,
		@ArrayLtFld VARCHAR(MAX),
		@DisplayId	INT,
		@AP1ContactId int,
		@AP2ContactId int,
		@sqlContactParamDef NVARCHAR(MAX),
		@SqlContactId		NVARCHAR(MAX),
		@SqlCId2			NVARCHAR(MAX),
		@sqlCId2ParamDef	NVARCHAR(MAX),
		@FieldNameCSV as VARCHAR(MAX)='',
		@SaveFieldName as VARCHAR(MAX)

		
Declare @FormfieldInfo Table
		(
			TableId	 INT IDENTITY(1,1),
			TableName varchar(50),
			FieldName varchar(200),
			DisplayName varchar(200),
			FieldType varchar(50),
			FieldSize int,
			DefltVal varchar(200),
			Req bit,
			ContactPrefix varchar(50),
			LkpTable varchar(200),
			LkpField varchar(200)
		)
		
Declare @DisplayFormfield Table
		(
			DisplayId INT IDENTITY(1,1),
			FieldName  varchar(200),
			FieldValue varchar(max)--FieldValue varchar(500)
		)
		
DECLARE @tmpFieledValues TABLE 
		( 
			FieldID INT,
			FieldName VARCHAR(MAX)
		)
	
BEGIN
print 'start'

INSERT INTO @tmpFieledValues(FieldID,FieldName) SELECT field_id,REPLACE(name,'input_','') FROM formmaker_fields F INNER JOIN ArrayListToTable(@FieldIDs) T ON F.Field_id =T.ArrayVal
SELECT @FieldNameCSV=@FieldNameCSV+FieldName + ', ' FROM @tmpFieledValues 
SET  @FieldNameCSV=SUBSTRING(@FieldNameCSV, 0, LEN(@FieldNameCSV))
SET  @SaveFieldName=@FieldNameCSV
-- Get DBName of Agency
Select @AgencyDB = DBName
From IrrisCentral.dbo.lutPrimaryAgency
where SiteID = @AgencyId

-- Checking Ap2ContactId and inserting into MapFormData 
Select @AP2ContactId = Cast(Coalesce(FieldData,'0') as int)
		From MapFormData
		where [user_id] = @User_Id
			and ContactPrefix = 'AP2'
			and FieldName = 'AP2ContactId'
			
IF( ISNULL(@AP2ContactId,0)= 0 )
BEGIN
		
		Select  @AP1ContactId = Cast(Coalesce(FieldData,'0') as int)
			From	MapFormData
			where [user_id] = @User_Id
				and ContactPrefix = 'AP1'
				and FieldName = 'AP1ContactId'
			
			Set @sqlContactParamDef	= '@ContactId int output'
			SET @SqlContactId		= 'SELECT @ContactId = '+@AgencyDB+'.DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),2)'
			Exec sp_executesql @SqlContactId,@sqlContactParamDef,@ContactId = @AP2ContactId output
			
			
			IF ( @AP2ContactId = @AP1ContactId )
			BEGIN
				Set @sqlCId2ParamDef	= '@ContactId2 int output'
				SET @SqlCId2			= 'SELECT @ContactId2 = '+@AgencyDB+'.DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),1)'
				Exec sp_executesql @SqlCId2,@sqlCId2ParamDef,@ContactId2 = @AP2ContactId output
			END
			
			
			IF( @AP2ContactId <> @AP1ContactId  and @AP2ContactId is not null and @AP2ContactId > 0 )

				Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
				Values (@User_Id,'AP2','AP2ContactId',Cast(@AP2ContactId as varchar(50)))
END	

-- Inorder to retrieve feildNames from function [ArrayListToTable]
SET @StrtCnt  = 1
SET @MaxCnt   = ( SELECT MAX(Id) FROM dbo.[ArrayListToTable](@SaveFieldName))
print 'loop'
print @MaxCnt
--While loop
WHILE @StrtCnt <= @MaxCnt
BEGIN
print 'inside the loop'
		SET @ArrayLtFld  = ( SELECT  LTRIM(RTRIM(Replace(Replace(ArrayVal, char(10), ''), char(13), ''))) as ArrayVal FROM dbo.[ArrayListToTable](@SaveFieldName) WHERE Id = @StrtCnt )

		Insert into @FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,ContactPrefix,LkpTable,LkpField) exec SP_AgencyFormFieldLibrary @AgencyId, @ArrayLtFld
IF @@RowCount <> 0 	
BEGIN

Select 		@TableName = TableName,
			@FieldName = FieldName,
			@DefltVal = DefltVal,
			@ContactPrefix = ContactPrefix,
			@LkpTable = LkpTable,
			@FieldType = FieldType
from @FormfieldInfo
 
  Print 'Run test'
  print @TableName
  print @FieldName
If @TableName = 'MAPSystemData'
	Begin
	print 'inside the table'
	if   @FieldName like '%Marriage%' print 'yes'
	
		If @FieldName like '%Relationship%' or @FieldName like '%FName%' or @FieldName like '%LName%' or @FieldName like '%MName%' or @FieldName like '%Gender%' or @FieldName like '%DOB%' or @FieldName like '%SSN%' or @FieldName like '%BirthCity%' or @FieldName




 like '%BirthState%' or @FieldName like '%BirthCountry%' or @FieldName like '%Salutation%' or @FieldName like '%Salary%' or @FieldName like '%nickname%' or @FieldName like '%BirthName%'
			Begin
				 Print 'Run SP_MAPContactShow'
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_MAPContactShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN			
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				

			End
		Else If @FieldName like '%Add%' or (@FieldName like '%City' and @FieldName not like '%Ethnicity%') or @FieldName like '%State%' or @FieldName like '%Zip%' or @FieldName like '%Country%' or @FieldName like '%County%'
			Begin
				  Print 'Run SP_MAPAddressShow'
				INSERT INTO @DisplayFormfield(FieldValue)Exec SP_MAPAddressShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End
		Else If @FieldName like '%Race%' or @FieldName like '%Ethnicity%' or @FieldName like '%Religion%' or @FieldName like '%Language%' or @FieldName like '%Marriage%' or @FieldName like '%Marraige%' or @FieldName like '%TerminationDate%' or @FieldName like '



%TermReason%' or @FieldName like '%Spouse%'
			Begin
				  Print ' SP_MAPContactBGShow'
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_MAPContactBGShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				--SELECT * FROM @DisplayFormfield
				
			End		
		Else If @FieldName like '%Email%' or @FieldName like '%Phone%' 
			Begin
				-- Print 'Run SP_MAPContactContactShow'
				
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_MAPContactContactShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
		Else If @FieldName like '%Education%' or @FieldName like '%Degree%' or @FieldName like '%Institution%'  
			Begin
				-- Print 'Run SP_MAPEducationShow'
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_MAPEducationShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
		Else If @FieldName = 'EDD' 
			Begin
				-- Print 'Run SP_MAPEducationShow'
				INSERT INTO @DisplayFormfield(FieldValue) Select convert(varchar, edd, 101)	From user_accounts
					Where [User_id] = @user_id
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
--		Else If @FieldName like '%ReferralSource%'  
--			Begin
--				-- Print 'Run SP_MAPReferralShow'
--				Exec SP_MAPReferralShow @AgencyDB, @user_id, @ContactPrefix, @FieldName
--			End		
	End
Else If @TableName = 'Function'
	Begin
		If @FieldName like 'Husband%' or @FieldName like 'Wife%'
			Begin
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_HusbandWife @AgencyId, @user_id, @FieldName
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
		Else If @FieldName = 'CurrentDate'  
			Begin
				INSERT INTO @DisplayFormfield(FieldValue) Select CONVERT(varchar(30), GETDATE(), 101)
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
		Else If @FieldName = 'FamilyName'  
			Begin	
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_NameFunction @AgencyId, @user_id, 1
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
		Else If @FieldName = 'LastNameFamilyName'  
			Begin
				INSERT INTO @DisplayFormfield(FieldValue) Exec SP_NameFunction @AgencyId, @user_id, 2
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
			End		
	End
Else If charindex('Med_',@FieldName) > 0
	Begin
		Declare 
				@MedDate varchar(26),
				@MedNumber int,
				@MedText varchar(max),
				@MedText2 varchar(max)

		If charindex('Med_1',@FieldName) > 0
		begin
			Select  @ContactId = Cast(Coalesce(FieldData,'0') as int)
							From MapFormData
							where [user_id] = @User_Id
							and ContactPrefix = 'AP1'
							and FieldName = 'AP1ContactId'
		end
		Else
		begin
			Select  @ContactId = Cast(Coalesce(FieldData,'0') as int)
								From MapFormData
								where [user_id] = @User_Id
								and ContactPrefix = 'AP2'
								and FieldName = 'AP2ContactId'
		end

		Set @ParamDef = '@MedDate varchar(26) output, @MedNumber int output, @MedText varchar(3000) output'
		Set @SPRunsql = 'Select @MedDate = MedGenDate,
										@MedNumber = coalesce(MedGenPullDownId, 0),
										@MedText = MedGenNote from ' + @AgencyDB + '.dbo.ContactMedGen 
								where ContactId = ' + Cast(@ContactId as varchar(10)) + '
									and MedGenSubTypeId = ' + Cast(@DefltVal as varchar(10)) 
		-- Print @SPRunsql

		Exec sp_executesql @SPRunsql,@ParamDef,@MedDate=@MedDate output,@MedNumber=@MedNumber output,@MedText=@MedText output

--		-- Print '@MedDate = ' + @MedDate
--		-- Print '@MedNumber = ' + Cast(@MedNumber as varchar(10))
--		-- Print '@MedText = ' + @MedText
		If @LkpTable > ''
			Begin
				select @MedNumber = coalesce(@MedNumber,0)
				Set @RunSql = 'Select MedGenPullDownText
						From ' + @AgencyDB + '.dbo.MedGenPullDown
						Where MedGenPullDownId = ' + Cast(@MedNumber as varchar(10))
				
				
--				-- Print @RunSql
/***********************/
				INSERT INTO @DisplayFormfield(FieldValue) exec (@RunSql)
				IF @@RowCount <> 0
				BEGIN			
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
				
/**********************/
			End
		Else If @FieldType = 'date' or @FieldType = 'Datetime'
			Begin
				Set @RunSql = 'Select MedGenDate
									 from ' + @AgencyDB + '.dbo.ContactMedGen 
									where ContactId = ' + Cast(@ContactId as varchar(10)) + '
									and MedGenSubTypeId = ' + Cast(@DefltVal as varchar(10)) 
				-- Print @RunSql
				INSERT INTO @DisplayFormfield(FieldValue) exec (@RunSql)
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
			End
		Else 
			Begin
				Set @RunSql = 'Select coalesce(MedGenNote,'''')
									 from ' + @AgencyDB + '.dbo.ContactMedGen 
									where ContactId = ' + Cast(@ContactId as varchar(10)) + '
									and MedGenSubTypeId = ' + Cast(@DefltVal as varchar(10)) 
				-- Print @RunSql
				INSERT INTO @DisplayFormfield(FieldValue) exec (@RunSql)
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
			end
	End
--Else If @TableName = 'User_Accounts'
--	Begin
--	End

Else
	Begin
		Declare @CIListData Table
				(CIListDate varchar(26),
				CIListNumber varchar(50),
				CIListText varchar(max))

		Select @ContactId = airs_contact_id
			from user_accounts
			where [User_Id] = @User_Id

		Insert into @CIListData(CIListDate,CIListNumber,CIListText) exec ViewCIListData 	@AgencyId, 0, @ContactId,	@DefltVal
		--select * from @CIListData
		
		If @FieldType = 'date' or @FieldType = 'Datetime' 
		BEGIN
				INSERT INTO @DisplayFormfield(FieldValue) Select convert(varchar,CIListDate,101) from @CIListData
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
		END	
		Else If  @FieldType = 'int' or @FieldType = 'Real'
		BEGIN
				INSERT INTO @DisplayFormfield(FieldValue) Select CIListNumber from @CIListData
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				
				ELSE 
				BEGIN
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
				END
		END	
		
		Else
		BEGIN
		PRINT '**************************************'
				
				INSERT INTO @DisplayFormfield(FieldValue) Select CIListText	from @CIListData
				IF @@RowCount <> 0
				BEGIN
					SELECT @DisplayId = DisplayId FROM @DisplayFormfield
					
					UPDATE @DisplayFormfield
					SET		FieldName = @FieldName
					WHERE	DisplayId = @DisplayId
				END
				ELSE 
				BEGIN
					
					INSERT INTO @DisplayFormfield(FieldName,FieldValue) VALUES (@FieldName,' ')
					
				END
		END
			
	End
	
/*********WHILE LOOP CLOSE***************/
END
DELETE @CIListData ;
SET    @StrtCnt = @StrtCnt + 1
END
/*********WHILE LOOP CLOSE***************/
SELECT T1.FieldID,T.FieldName,T.FieldValue FROM @DisplayFormfield T INNER JOIn @tmpFieledValues T1 ON T.FieldName=T1.FieldName	
where T.FieldName is not null

END


 

