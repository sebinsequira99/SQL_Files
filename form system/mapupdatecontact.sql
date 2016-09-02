Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[MAPUpdateContact] 
	@AgencyId varchar(150),
	@ContactId int,
	@user_id int,
	@SaveType varchar(20)
AS
	Declare	@RunSql varchar(2000),
		@Fname varchar(50),
		@Mname varchar(50),
		@LName varchar(50),
		@BirthDate DateTime,
		@Gender varchar(50),
		@RelationShip varchar(75),
		@EmpSalary varchar(50),
		@SSN varchar(50),
		@ContactAIRSId int,
		@RelContactAIRSId int,
		@Salutation varchar(50)
SET NOCOUNT ON 

If @SaveType = 'AP1'
	Begin
		Select @Fname = AP1Fname,
--				@Mname = AP1Mname,
				@LName = AP1LName,
--				@BirthDate = Coalesce(AP1DOB,'1/1/1900'),
				@Gender = AP1Gender
--				@SSN = AP1SSN,
--				@Salutation = AP1Salutation
			From MAPSystemData
			where [user_id] = @user_id
		set @Fname = replace(@Fname,'''','''''')
		set @LName = replace(@LName,'''','''''')

		Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
			Set Fname = ''' + COALESCE(@Fname, 'null') + ''',
				LName = ''' + COALESCE(@LName, 'null') + ''',
				Gender = ''' + COALESCE(@Gender, '') + '''
			Where ContactId = ' + Cast(@ContactId as varchar(10)) 

--		-- Print @Runsql
		Exec (@Runsql)

	End

If @SaveType = 'AP2'
	Begin
		Select @Fname = AP2Fname,
				@LName = COALESCE(AP2LName, AP1LName),
				@Gender = AP2Gender
			From MAPSystemData
			where [user_id] = @user_id

		set @Fname = replace(@Fname,'''','''''')
		set @LName = replace(@LName,'''','''''')

		Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
			Set Fname = ''' + Coalesce(@Fname, 'null') + ''',
				LName = ''' + Coalesce(@LName, 'null') + ''',
				Gender = ''' + Coalesce(@Gender, '') + '''
			Where ContactId = ' + Cast(@ContactId as varchar(10)) 

--		-- Print @Runsql
		Exec (@Runsql)

	End
If @SaveType like 'Rel%'
	Begin
		If @SaveType = 'Rel1'
			Begin
				Select @Fname = Rel1FName,
						@LName = COALESCE(Rel1LName, AP1LName),
						@Gender = Rel1Gender,
						@RelationShip = Rel1Relationship,
						@BirthDate = Rel1DOB,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel1'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel1'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel1'
			End

		If @SaveType = 'Rel2'
			Begin
				Select @Fname = Rel2FName,
						@LName = COALESCE(Rel2LName, AP1LName),
						@Gender = Rel2Gender,
						@RelationShip = Rel2Relationship,
						@BirthDate = Rel2DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel2'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel2'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel2'
			End

		If @SaveType = 'Rel3'
			Begin
				Select @Fname = Rel3FName,
						@LName = COALESCE(Rel3LName, AP1LName),
						@Gender = Rel3Gender,
						@RelationShip = Rel3Relationship,
						@BirthDate = Rel3DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel3'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel3'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel3'
			End

		If @SaveType = 'Rel4'
			Begin
				Select @Fname = Rel4FName,
						@LName = COALESCE(Rel4LName, AP1LName),
						@Gender = Rel4Gender,
						@RelationShip = Rel4Relationship,
						@BirthDate = Rel4DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel4'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel4'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel4'
			End

		If @SaveType = 'Rel5'
			Begin
				Select @Fname = Rel5FName,
						@LName = COALESCE(Rel5LName, AP1LName),
						@Gender = Rel5Gender,
						@RelationShip = Rel5Relationship,
						@BirthDate = Rel5DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel5'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel5'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel5'
			End

		If @SaveType = 'Rel6'
			Begin
				Select @Fname = Rel6FName,
						@LName = COALESCE(Rel6LName, AP1LName),
						@Gender = Rel6Gender,
						@RelationShip = Rel6Relationship,
						@BirthDate = Rel6DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel6'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel6'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel6'
			End

		If @SaveType = 'Rel7'
			Begin
				Select @Fname = Rel7FName,
						@LName = COALESCE(Rel7LName, AP1LName),
						@Gender = Rel7Gender,
						@RelationShip = Rel7Relationship,
						@BirthDate = Rel7DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel7'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel7'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel7'
			End

		If @SaveType = 'Rel8'
			Begin
				Select @Fname = Rel8FName,
						@LName = COALESCE(Rel8LName, AP1LName),
						@Gender = Rel8Gender,
						@RelationShip = Rel8Relationship,
						@BirthDate = Rel8DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel8'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel8'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel8'
			End

		If @SaveType = 'Rel9'
			Begin
				Select @Fname = Rel9FName,
						@LName = COALESCE(Rel9LName, AP1LName),
						@Gender = Rel9Gender,
						@RelationShip = Rel9Relationship,
						@BirthDate = Rel9DOB,
						@ContactAIRSId = ContactAIRSId

					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel9'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel9'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel9'
			End

		If @SaveType = 'Rel10'
			Begin
				Select @Fname = Rel10FName,
						@LName = COALESCE(Rel10LName, AP1LName),
						@Gender = Rel10Gender,
						@RelationShip = Rel10Relationship,
						@BirthDate = Rel10DOB,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData 
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Rel10'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Rel10'
				Exec MAPPhoneAddEdit @AgencyId, @user_id, 'Rel10'
			End

		Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
			Set Fname = ''' + Coalesce(@Fname, '') + ''',
				LName = ''' + Coalesce(@LName, '') + ''',
				BirthDate = ''' + Coalesce(cast(@BirthDate as varchar(26)), '') + ''',
				Gender = ''' + Coalesce(@Gender, '') + '''
			Where ContactId = ' + Cast(@ContactId as varchar(10)) 

		-- Print @Runsql
		Exec (@Runsql)

		Set @RelContactAIRSId = @ContactId * -1
		Exec MAPAddRelationship @AgencyId, @user_id, @RelContactAIRSId, @RelationShip, @ContactAIRSId

	End

If @SaveType like 'Ref%'
	Begin
		If @SaveType = 'Ref1'
			Begin
				Select @Fname = Ref1FName,
						@LName = COALESCE(Ref1LName, ''),
						@RelationShip = Ref1Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref1'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref1'
			End
		If @SaveType = 'Ref2'
			Begin
				Select @Fname = Ref2FName,
						@LName = COALESCE(Ref2LName, ''),
						@RelationShip = Ref2Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref2'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref2'
			End
		If @SaveType = 'Ref3'
			Begin
				Select @Fname = Ref3FName,
						@LName = COALESCE(Ref3LName, ''),
						@RelationShip = Ref3Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref3'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref3'
			End
		If @SaveType = 'Ref4'
			Begin
				Select @Fname = Ref4FName,
						@LName = COALESCE(Ref4LName, ''),
						@RelationShip = Ref4Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref4'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref4'
			End

		If @SaveType = 'Ref5'
			Begin
				Select @Fname = Ref5FName,
						@LName = COALESCE(Ref5LName, ''),
						@RelationShip = Ref5Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref5'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref5'
			End

		If @SaveType = 'Ref6'
			Begin
				Select @Fname = Ref6FName,
						@LName = COALESCE(Ref6LName, ''),
						@RelationShip = Ref6Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref6'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref6'
			End

		If @SaveType = 'Ref7'
			Begin
				Select @Fname = Ref7FName,
						@LName = COALESCE(Ref7LName, ''),
						@RelationShip = Ref7Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref7'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref7'
			End

		If @SaveType = 'Ref8'
			Begin
				Select @Fname = Ref8FName,
						@LName = COALESCE(Ref8LName, ''),
						@RelationShip = Ref8Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref8'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref8'
			End

		If @SaveType = 'Ref9'
			Begin
				Select @Fname = Ref9FName,
						@LName = COALESCE(Ref9LName, ''),
						@RelationShip = Ref9Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref9'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref9'
			End
		If @SaveType = 'Ref10'
			Begin
				Select @Fname = Ref10FName,
						@LName = COALESCE(Ref10LName, ''),
						@RelationShip = Ref10Relationship,
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Ref10'
				Exec MAPEmailAddEdit @AgencyId, @user_id, 'Ref10'
			End

		Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
			Set Fname = ''' + Coalesce(@Fname, '') + ''',
				LName = ''' + Coalesce(@LName, '') + '''
			Where ContactId = ' + Cast(@ContactId as varchar(10)) 

--		-- Print @Runsql
		Exec (@Runsql)

		Set @RelContactAIRSId = @ContactId * -1
		Exec MAPAddRelationship @AgencyId, @user_id, @RelContactAIRSId, @RelationShip, @ContactAIRSId
	End

		If @SaveType = 'Emp1'
			Begin
				Select @Fname = Emp1FName,
						@LName = COALESCE(Emp1LName, ''),
						@RelationShip = Emp1Relationship,
						@EmpSalary = COALESCE(Emp1Salary, ''),
						@ContactAIRSId = ContactAIRSId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Emp1'

				Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
					Set Fname = ''' + Coalesce(@Fname, '') + ''',
						LName = ''' + Coalesce(@LName, '') + '''
					Where ContactId = ' + Cast(@ContactId as varchar(10)) 

		--		-- Print @Runsql
				Exec (@Runsql)

				Set @RelContactAIRSId = @ContactId * -1
				Exec MAPAddRelationship @AgencyId, @user_id, @RelContactAIRSId, @RelationShip, @ContactAIRSId, 2, @EmpSalary
			End


		If @SaveType = 'Emp2'
			Begin
				Select @Fname = Emp2FName,
						@LName = COALESCE(Emp2LName, ''),
						@RelationShip = Emp2Relationship,
						@EmpSalary = COALESCE(Emp2Salary, ''),
						@ContactAIRSId = AP2ContactId
					From MAPSystemData
					where [user_id] = @user_id

				Exec MAPAddressAddEdit @AgencyId, @user_id, 'Emp2'

				Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
					Set Fname = ''' + Coalesce(@Fname, '') + ''',
						LName = ''' + Coalesce(@LName, '') + '''
					Where ContactId = ' + Cast(@ContactId as varchar(10)) 

		--		-- Print @Runsql
				Exec (@Runsql)

				Set @ContactAIRSId = @ContactAIRSId * -1
				Set @RelContactAIRSId = @ContactId * -1
				Exec MAPAddRelationship @AgencyId, @user_id, @RelContactAIRSId, @RelationShip, @ContactAIRSId, 2, @EmpSalary
			End

/*
If @SaveType = 'CaseWorker'
	Begin
		Select @Fname = CaseWorkerFName,
				@LName = CaseWorkerLName
			From MAPSystemData 
			where [user_id] = @user_id

		Set @Runsql = 'Update ' + @AgencyId + '.dbo.Contact
			Set Fname = ''' + isnull(@Fname, '') + ''',
				LName = ''' + isnull(@LName, '') + ''',
			Where ContactId = ' + Cast(@ContactId as varchar(10)) 

		-- Print @Runsql
		Exec (@Runsql)

	End
*/

SET NOCOUNT OFF

