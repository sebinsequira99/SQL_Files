

ALTER PROCEDURE [dbo].[MAPEmailAddEdit] 
	@AgencyId varchar(150),
	@user_id int,
	@SaveType varchar(20)

AS 
	Declare	@RunSql nvarchar(2000),
				@ContactId int,
				@Email varchar(100),
				@ParamDef  nvarchar(1000),
				@ChkEmail int

If @SaveType = 'AP1'
	Begin
		Select @ChkEmail = AP1EMailId,
				@ContactId = AP1ContactId,
				@Email = AP1Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'AP2'
	Begin
		Select @ChkEmail = AP2EMailId,
				@ContactId = AP2ContactId,
				@Email = AP1Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref1'
	Begin
		Select @ChkEmail = Ref1EMailId,
				@ContactId = Ref1ContactId,
				@Email = Ref1Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref2'
	Begin
		Select @ChkEmail = Ref2EMailId,
				@ContactId = Ref2ContactId,
				@Email = Ref2Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref3'
	Begin
		Select @ChkEmail = Ref3EMailId,
				@ContactId = Ref3ContactId,
				@Email = Ref3Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref4'
	Begin
		Select @ChkEmail = Ref4EMailId,
				@ContactId = Ref4ContactId,
				@Email = Ref4Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref5'
	Begin
		Select @ChkEmail = Ref5EMailId,
				@ContactId = Ref5ContactId,
				@Email = Ref5Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref6'
	Begin
		Select @ChkEmail = Ref6EMailId,
				@ContactId = Ref6ContactId,
				@Email = Ref6Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref7'
	Begin
		Select @ChkEmail = Ref7EMailId,
				@ContactId = Ref7ContactId,
				@Email = Ref7Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref8'
	Begin
		Select @ChkEmail = Ref8EMailId,
				@ContactId = Ref8ContactId,
				@Email = Ref8Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref9'
	Begin
		Select @ChkEmail = Ref9EMailId,
				@ContactId = Ref9ContactId,
				@Email = Ref9Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Ref10'
	Begin
		Select @ChkEmail = Ref10EMailId,
				@ContactId = Ref10ContactId,
				@Email = Ref10Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel1'
	Begin
		Select @ChkEmail = Rel1EMailId,
				@ContactId = Rel1ContactId,
				@Email = Rel1Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel2'
	Begin
		Select @ChkEmail = Rel2EMailId,
				@ContactId = Rel2ContactId,
				@Email = Rel2Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel3'
	Begin
		Select @ChkEmail = Rel3EMailId,
				@ContactId = Rel3ContactId,
				@Email = Rel3Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel4'
	Begin
		Select @ChkEmail = Rel4EMailId,
				@ContactId = Rel4ContactId,
				@Email = Rel4Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel5'
	Begin
		Select @ChkEmail = Rel5EMailId,
				@ContactId = Rel5ContactId,
				@Email = Rel5Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel6'
	Begin
		Select @ChkEmail = Rel6EMailId,
				@ContactId = Rel6ContactId,
				@Email = Rel6Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel7'
	Begin
		Select @ChkEmail = Rel7EMailId,
				@ContactId = Rel7ContactId,
				@Email = Rel7Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel8'
	Begin
		Select @ChkEmail = Rel8EMailId,
				@ContactId = Rel8ContactId,
				@Email = Rel8Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel9'
	Begin
		Select @ChkEmail = Rel9EMailId,
				@ContactId = Rel9ContactId,
				@Email = Rel9Email
			From MAPSystemData
			where [user_id] = @user_id

	End
Else If @SaveType = 'Rel10'
	Begin
		Select @ChkEmail = Rel10EMailId,
				@ContactId = Rel10ContactId,
				@Email = Rel10Email
			From MAPSystemData
			where [user_id] = @user_id

	End

SET @Email = REPLACE(@Email,'''','''''')

If @ChkEmail is not null
	Begin
		Set @RunSql = 'Update ' + @AgencyId + '.dbo.ContactEmail
			Set ContactEmail = ''' + COALESCE(@Email,'') + '''
			Where ContactEmailID = ' + Cast(@ChkEmail as varchar(10)) 
		Exec (@RunSql)
	End
Else
	Begin
		Set @RunSql = 'Insert into ' + @AgencyId + '.dbo.ContactEmail (ContactId, EmailTypeId,PrimaryEmail,ContactEmail)
			Values (' + COALESCE(Cast(@ContactId as varchar(10)),'Null') + ',
					 1,
					 ''1'',
					 ''' + COALESCE(@Email,'') + ''')'

		Exec(@RunSql)
		Select @ChkEmail = @@Identity

		If @SaveType = 'AP1'
			Begin
				Update MAPSystemData
					Set AP1EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'AP2'
			Begin
				Update MAPSystemData
					Set AP2EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref1'
			Begin
				Update MAPSystemData
					Set Ref1EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref2'
			Begin
				Update MAPSystemData
					Set Ref2EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref3'
			Begin
				Update MAPSystemData
					Set Ref3EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref4'
			Begin
				Update MAPSystemData
					Set Ref4EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref5'
			Begin
				Update MAPSystemData
					Set Ref5EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref6'
			Begin
				Update MAPSystemData
					Set Ref6EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref7'
			Begin
				Update MAPSystemData
					Set Ref7EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref8'
			Begin
				Update MAPSystemData
					Set Ref8EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref9'
			Begin
				Update MAPSystemData
					Set Ref9EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Ref10'
			Begin
				Update MAPSystemData
					Set Ref10EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel1'
			Begin
				Update MAPSystemData
					Set Rel1EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel2'
			Begin
				Update MAPSystemData
					Set Rel2EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel3'
			Begin
				Update MAPSystemData
					Set Rel3EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel4'
			Begin
				Update MAPSystemData
					Set Rel4EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel5'
			Begin
				Update MAPSystemData
					Set Rel5EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel6'
			Begin
				Update MAPSystemData
					Set Rel6EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel7'
			Begin
				Update MAPSystemData
					Set Rel7EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel8'
			Begin
				Update MAPSystemData
					Set Rel8EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel9'
			Begin
				Update MAPSystemData
					Set Rel9EMailId = @ChkEmail
						Where [user_id] = @user_id
			End
		Else If @SaveType = 'Rel10'
			Begin
				Update MAPSystemData
					Set Rel10EMailId = @ChkEmail
						Where [user_id] = @user_id
			End	End


