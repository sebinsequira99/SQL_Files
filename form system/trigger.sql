USE [MAPDEV]
GO
/****** Object:  Trigger [dbo].[AddNewGroup]    Script Date: 9/9/2015 10:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Vince Rossignol>
-- Create date: <06/14/2010>
-- Description:	<Add New Group>
-- =============================================
ALTER TRIGGER [dbo].[AddNewGroup] 
   ON  [dbo].[MAPSystemData]
   AFTER INSERT, Update
AS 
BEGIN
	SET NOCOUNT ON;
Declare @AgencyDB varchar(150),
			@AP1LName varchar(50),
			@ContactAIRSId int,
			@ContactTypeId int,
			@ContactId int,
			@AgencyId int,
			@Group_Id varchar(50),
			@GroupId varchar(5),
			@user_id int,
			@ConnId int
	
	Select @AgencyId = Agency,
			@AP1LName = AP1LName,
			@user_id = [user_id]
		From inserted

	Select @AgencyDB = DBName
		From IrrisCentral.dbo.lutPrimaryAgency
		where SiteID = @AgencyId

	Select @ContactAIRSId = ContactAIRSId
		from MAPSystemData
		where [user_id] = @user_id
 
	Select @Group_Id = group_id,
			@ConnId = ConnId
		from user_accounts
		where [user_id] = @user_id
 
--				print @Group_Id
			
	If @AP1LName is not null and @AgencyDB is not null and @user_id is not null and @ContactAIRSId is null and @ConnId is null
		Begin
			set @AP1LName = replace(@AP1LName,'''','''''')
			Exec MAPAddNewGroup @AgencyDB, @AP1LName, 0, @ContactAIRSId output, @ContactId output

			Update MAPSystemData
				Set ContactAIRSId = @ContactAIRSId,
					AP1ContactId = @ContactId
				Where [user_id] = @user_id

			Update user_accounts
				Set airs_contactairs_id = @ContactAIRSId,
					airs_contact_id = @ContactId,
					ConnId = (@ContactId * -1)
				Where [user_id] = @user_id

			Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
				Values (@user_id,'AP1','AP1ContactId',Cast(@ContactId as varchar(50)))

/*	Because of update to User_Accounts Groups being added with that update trigger 
		print @Group_Id
			If @Group_id <> ''
				Begin
					While charindex(',',@Group_Id) > 0
						Begin
							Set @GroupId = substring(@Group_Id, 1, charindex(',',@Group_Id)-1)
						print @GroupId

							If @GroupId <> 0 and @GroupId <> '' and @GroupId is not null
								Exec SP_RoleAddEdit @user_id, @GroupId

							Set @Group_Id = substring(@Group_Id, charindex(',',@Group_Id) + 1, len(@Group_Id))
						End

						print @Group_Id
					If @Group_id <> 0 and @Group_id <> ''
						Exec SP_RoleAddEdit @user_id, @Group_id
				End
*/
			Exec MAPUpdateContact @AgencyDB, @ContactId, @user_id, 'AP1'

--			If Update(AP2Fname) or Update(AP2Mname)or Update(AP2LName)or Update(AP2DOB)or Update(AP2Gender)or Update(AP2SSN)or Update(AP2Salutation)
--				Exec MAPAdditionalContact @AgencyDB, @user_id, 'AP2'

			If Update(AP1Email)
				Exec MAPEmailAddEdit @AgencyDB, @user_id, 'AP1'

			If Update(Add1) or Update(Add2)or Update(City)or Update(State)or Update(Zip)or Update(Country)
				Exec MAPAddressAddEdit @AgencyDB, @user_id

--			If Update(HomePhone)
--				Exec MAPHPhoneAddEdit @AgencyDB, @user_id

			If Update(AP1WorkPhone)or Update(AP1CellPhone)
				Exec MAPOtherPhoneAddEdit @AgencyDB, @user_id, 'AP1'

		End
	Else if @ConnId is not null
		Begin
			Update MAPSystemData
				Set AP1ContactId = (@ConnId * -1)
				Where [user_id] = @user_id

			Update user_accounts
				Set airs_contact_id = (@ConnId * -1)
				Where [user_id] = @user_id

			Set @ContactId = (@ConnId * -1)
			Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
				Values (@user_id,'AP1','AP1ContactId',Cast(@ContactId as varchar(50)))

		End
END


