Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[SaveMedData] 
	@AgencyId int,
	@ContactId int,
	@MedGenSubTypeId int,
	@MedDate varchar(26),
	@MedNumber varchar(26),
	@MedText varchar(2000)
AS 

Declare	@RunSql varchar(3000),
	@SPRunSql nvarchar(3000),
	@ParamDef nvarchar(1000),
	@ContactMedGenId int,
	@MedGenPullDownId int,
	@AgencyDB varchar(50)

Select @AgencyDB = DBName
From IrrisCentral.dbo.lutPrimaryAgency
where SiteID = @AgencyId


Set @ParamDef = '@ContactMedGenId int output'
Set @SPRunsql = 'Select top 1 @ContactMedGenId = ContactMedGenId from ' + @AgencyDB + '.dbo.ContactMedGen 
						where ContactId = ' + Cast(@ContactId as varchar(10)) + '
							and MedGenSubTypeId = ' + Cast(@MedGenSubTypeId as varchar(10)) 
-- Print @SPRunsql

Exec sp_executesql @SPRunsql,@ParamDef,@ContactMedGenId=@ContactMedGenId output

select @ContactMedGenId = coalesce(@ContactMedGenId,0)
	-- Print @ContactMedGenId

-- If Pulldown value Find Pulldownid
If @MedText = 'Pulldown'
	Begin
--		 Print @MedNumber
		Set @MedNumber = replace(@MedNumber, '''', '')
		Set @ParamDef = '@MedGenPullDownId int output'
		Set @SPRunsql = 'Select top 1 @MedGenPullDownId = MedGenPullDownId from ' + @AgencyDB + '.dbo.MedGenPullDown 
								where replace(MedGenPullDownText, '''''''', '''') = ''' + @MedNumber + '''
									and MedGenSubTypeId = ' + Cast(@MedGenSubTypeId as varchar(10)) 
--		 Print @SPRunsql

		Exec sp_executesql @SPRunsql,@ParamDef,@MedGenPullDownId=@MedGenPullDownId output
	

		select @MedGenPullDownId = coalesce(@MedGenPullDownId,0)
		Set @MedNumber = Cast(@MedGenPullDownId as varchar(10))
	-- Print @MedGenPullDownId

	End
If @MedDate is null or @MedDate = ''
	Set @MedDate = Cast(GetDate() as varchar(26))
If @ContactMedGenId = 0
	Begin
		Set @RunSql = 'Insert into ' + @AgencyDB + '.dbo.ContactMedGen (MedGenSubTypeId, ContactId, MedGenDate, MedGenPullDownId, MedGenNote)
				Values (' + Cast(@MedGenSubTypeId as varchar(10)) + ', 
							' + Cast(@ContactId as varchar(10)) + ', 
							''' + coalesce(@MedDate,'') + ''', 
							' + coalesce(@MedNumber,'Null') + ', 
							''' + coalesce(@MedText,'') + ''')'
		-- Print @RunSql

		Exec(@RunSql)

	End			
Else
	Begin
		Set @RunSql = 'Update ' + @AgencyDB + '.dbo.ContactMedGen Set 
				MedGenDate = ''' + coalesce(@MedDate,'') + ''',
				MedGenPullDownId = ' + coalesce(@MedNumber,'Null') + ',
				MedGenNote = ''' + coalesce(@MedText,'') + '''
			Where ContactMedGenId = ' + Cast(@ContactMedGenId as varchar(10))

		-- Print @RunSql
		Exec(@RunSql)
	End



Return @@Error





