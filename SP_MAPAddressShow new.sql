


EXEC ViewMAPDataGroup  '196', '158746', 'add1,add2,city,state'

Exec SP_MAPAddressShow 'mapsdc',86995,'AP12','add1'


user_accounts where user_id=158634

Select Coalesce(FieldData,0)
From MapFormData m
join user_accounts u 
on m.[user_id]=u.[user_id]
join contactaddress c
on abs(u.connid)=c.contactid
where m.[user_id]=86995
and u.address1=c.address1
and u.address2=c.address2
and u.city=c.city
and u.zipcode=c.zip
and m.fielddata=c.addressid
and m.FieldName = 'addressid'


MapFormData where [user_id]=86995
and FieldName = 'addressid'



Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER PROCEDURE [SP_MAPAddressShow] 
	@AgencyId varchar(150),
	@user_id int,
	@ContactPrefix varchar(20),
	@FieldName varchar(100)
AS
Declare	@RunSql nvarchar(2000),
		@ParamDef  nvarchar(1000),
		@RelationShip varchar(75),
		@RelationshipField varchar(75),
		@DataField varchar(50),
		@AddressId varchar(50),
		@FindAddressId int,
		@AddressIdField varchar(50),
		@ContactId varchar(50),
		@ContactAIRSId varchar(50),
		@RelContactAIRSId varchar(50)

SET NOCOUNT ON 

If @ContactPrefix = 'AP12'
	Set @ContactPrefix = ''

Set @AddressIdField = @ContactPrefix + 'AddressId'
Set @AddressId = '0'

--Select @AddressId = Coalesce(FieldData,0)
--	From MapFormData
--	where [user_id] = @User_Id
--		and FieldName = @AddressIdField

Select @AddressId = Coalesce(FieldData,0)
From MapFormData m
join user_accounts u 
on m.[user_id]=u.[user_id]
join contactaddress c
on abs(u.connid)=c.contactid
where m.[user_id]=@User_Id
and u.address1=c.address1
and u.address2=c.address2
and u.city=c.city
and u.zipcode=c.zip
and m.fielddata=c.addressid
and m.FieldName = @AddressIdField

		Print @User_id
		Print @AddressIdField
		PRINT 'Address'
		PRINT @AddressId
Select @ContactId = airs_contact_id
	From user_accounts
	where [user_id] = @User_Id

If @AddressId is null or @AddressId = '0' and @ContactPrefix = ''
	Begin
		Set @ParamDef = '@FindAddressId int output'
		Set @Runsql = 'Select top 1 @FindAddressId = AddressId from ' + @AgencyId + '.dbo.ContactAddress
			Where ContactId = ' + @ContactId + ' 
				and MailingAddress = ''1'''
		Exec sp_executesql @Runsql,@ParamDef,@FindAddressId=@FindAddressId output

		--select @FindAddressId
		Set @AddressId = Cast(Coalesce(@FindAddressId,0) as varchar(10))
	--	Print @AddressId
	--	Print @Runsql
			
		If @AddressId is not null and  @AddressId > '0' 
		and @AddressId not in 
		(select fielddata from MapFormData where [user_id] = @User_Id and fieldname='AddressId')
			Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
				Values (@User_Id,'AP12',@AddressIdField,@AddressId)
	End


		If @FieldName like '%Add1%' 
			Set @RunSql = 'Select Address1
					from ' + @AgencyId + '.dbo.ContactAddress
					Where AddressId = ' + @AddressId
		Else If @FieldName like '%Add2%'
			Set @RunSql = 'Select Address2
					from ' + @AgencyId + '.dbo.ContactAddress
					Where AddressId = ' + @AddressId
		Else If @FieldName like '%City%' 
			Set @RunSql = 'Select City
					from ' + @AgencyId + '.dbo.ContactAddress
					Where AddressId = ' + @AddressId
		Else If @FieldName like '%State%' 
			Set @RunSql = 'Select StateAbbreviation
					from ' + @AgencyId + '.dbo.ContactAddress C
					inner join ' + @AgencyId + '.dbo.lkpState S on C.StateID = S.StateID
					Where AddressId = ' + @AddressId
		Else If @FieldName like '%Country%' 
			Set @RunSql = 'Select CountryText
					from ' + @AgencyId + '.dbo.ContactAddress C
					inner join ' + @AgencyId + '.dbo.lkpCountry S on C.CountryId = S.CountryID
					Where AddressId = ' + @AddressId
		Else If @FieldName like '%County%'
			Begin
				Set @RunSql = 'Select StateName + '' - '' + CountyText
						from ' + @AgencyId + '.dbo.ContactAddress CA
						inner join ' + @AgencyId + '.dbo.lkpCounty C on CA.Countyid = C.Countyid
						inner join ' + @AgencyId + '.dbo.lkpState S on CA.StateID = S.StateID
						Where AddressId = ' + @AddressId
				print @RunSql
			End	
		Else If @FieldName like '%Zip%' 
			Set @RunSql = 'Select Zip
					from ' + @AgencyId + '.dbo.ContactAddress
					Where AddressId = ' + @AddressId

 Print @RunSql
Exec (@Runsql)

SET NOCOUNT OFF



