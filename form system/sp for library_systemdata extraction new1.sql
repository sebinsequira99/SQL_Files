

--exec usp_Edit_Contact_Details 20449 

--select @AgencyDB=db_name()
--select @AP1LName=fieldvalue from #XmlData
--where fieldname='AP1Lname'

--Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
--Values (@user_id,'AP1','AP1ContactId',Cast(@ContactId as varchar(50)))

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_Edit_Contact_Details' AND type='p')
DROP PROC usp_Edit_Contact_Details;
GO

CREATE PROC usp_Edit_Contact_Details
(
 @AgencyName varchar(20)
,@user_id int
,@AP1LName varchar(50)
) 
AS
BEGIN

	DECLARE @fieldname varchar(max)
		   ,@fieldvalue varchar(max)
		   ,@startrow int=1
		   ,@endrow int
		   ,@contactid int
		   ,@contactid2 int
		   ,@Runsql varchar(max)
		   ,@xmldata xml
		   ,@ConnId int
	       ,@strlname varchar(20)='AP1Lname'
		   ,@AgencyDB varchar(20)
		   ,@ContactAIRSId int
		   ,@icontactid int
		   ,@iaddressid int=0
		   ,@addressid int
		   ,@phoneid int
		   ,@emailid int	
		   ,@phoneid2 int
		   ,@emailid2 int
	
	SET NOCOUNT ON 


	Exec MAPAddNewGroup @AgencyName, @AP1LName, 0, @ContactAIRSId output, @iContactId output

	Update Library_systemdata
	Set ContactId = @iContactId
	Where [user_id] = @user_id

	Update user_accounts
	Set airs_contactairs_id = @ContactAIRSId,
		airs_contact_id = @iContactId,
		ConnId = (@iContactId * -1)
	Where [user_id] = @user_id
	
	SELECT @xmldata=data_xml FROM library_systemdata WHERE [user_id]=@user_id
	;
	WITH XmlData
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(100)')	as 'Fieldname'
	,[column].value('.', 'NVARCHAR(100)')	as 'Fieldvalue'
	FROM @xmlData.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','varchar(50)')<>''
	)
	
	SELECT * INTO #XmlData FROM XmlData
	DELETE FROM #XmlData WHERE fieldname in ('xml','syslibrary')
	
	ALTER TABLE #XmlData
	ADD id INT IDENTITY(1,1)
	
	--alter table #XmlData
	--add displayname varchar(max)
	--go
	
	--update x
	--set x.displayname=m.displayname
	--from #XmlData x
	--join mapfieldcatbase m
	--on x.fieldname=m.fieldname
	
	SELECT @endrow=max(id) FROM #XmlData
	SELECT @contactid=contactid FROM library_systemdata 
	WHERE [user_id]=@user_id
	SELECT @contactid2=contactid2 FROM rel_relationship 
	WHERE connectionid=(SELECT connectionid FROM library_systemdata 
					    WHERE [user_id]=@user_id)
		  AND contactid=@contactid
		  AND RelationshipTypeId=-101

	SELECT @ConnId = ConnId
	FROM user_accounts
	WHERE [user_id] = @user_id

	SELECT @addressid = addressid
	FROM contactaddress
	WHERE contactid = @contactid and mailingaddress=1

	IF(isnull(@addressid,0)=0)
	SELECT @addressid = addressid
	FROM contactaddress
	WHERE contactid = @contactid

	SELECT @phoneid = contactphoneid
	FROM contactphone
	WHERE contactid = @contactid and primaryphone=1

	IF(isnull(@phoneid,0)=0)
	SELECT @phoneid = contactphoneid
	FROM contactphone
	WHERE contactid = @contactid

	SELECT @emailid = contactemailid
	FROM contactemail
	WHERE contactid = @contactid and primaryemail=1

	IF(isnull(@emailid,0)=0)
	SELECT @emailid = contactemailid
	FROM contactemail
	WHERE contactid = @contactid
		
	SELECT @phoneid2 = contactphoneid
	FROM contactphone
	WHERE contactid = @contactid2 and primaryphone=1

	IF(isnull(@phoneid2,0)=0)
	SELECT @phoneid2 = contactphoneid
	FROM contactphone
	WHERE contactid = @contactid2

	SELECT @emailid2 = contactemailid
	FROM contactemail
	WHERE contactid = @contactid2 and primaryemail=1

	IF(isnull(@emailid2,0)=0)
	SELECT @emailid2 = contactemailid
	FROM contactemail
	WHERE contactid = @contactid2


		WHILE(@startrow<=@endrow)
		BEGIN
		
			SELECT @fieldname=fieldname
			      ,@fieldvalue=fieldvalue FROM #XmlData
			WHERE id=@startrow
			
			IF (@fieldname='AP1BirthCity'
			OR  @fieldname='AP1BirthCountry'
			OR  @fieldname='AP1BirthName'
			OR  @fieldname='AP1BirthState'
			OR  @fieldname='AP1DOB'
			OR  @fieldname='AP1Fname'
			OR  @fieldname='AP1Gender'
			OR  @fieldname='AP1Lname'
			OR  @fieldname='AP1MName'
			OR  @fieldname='AP1Nickname'
			OR  @fieldname='AP1SSN')

			BEGIN
				SET @Runsql='update contact
				set ' +replace
					  (replace
					  (replace
					  (replace
					  (replace(@fieldname,'AP1','')
										 ,'DOB','BirthDate')
										 ,'BirthCity','PlaceOfBirthCity')
										 ,'BirthState','PlaceOfBirthStateId')
										 ,'BirthCountry','PlaceOfBirthCountryId')+ '='''+@fieldvalue+''' 
				where contactid='+cast(@contactid as varchar(20))
				PRINT @Runsql
				EXEC (@Runsql)
			END

			ELSE IF (@fieldname='Add1'
				 OR  @fieldname='Add2'
				 OR  @fieldname='City'
				 OR  @fieldname='State'
				 OR  @fieldname='Zip'
				 OR  @fieldname='Country'
				 OR  @fieldname='County')
			
			BEGIN

				IF(@iaddressid not in (select addressid from contactaddress) and @addressid is null)
				BEGIN
				
					INSERT INTO contactaddress(AddressTypeId
											  ,ContactId
											  ,Address1
											  ,Address2
											  ,City
											  ,StateId
											  ,Zip
											  ,CountryId
											  ,Countyid
											  ,MailingAddress
											  ,ZipNumeric)
					VALUES(1
						  ,@contactid
						  ,(select fieldvalue from #XmlData
						    where fieldname='Add1')
						  ,(select fieldvalue from #XmlData
						    where fieldname='Add2')
						  ,(select fieldvalue from #XmlData
						    where fieldname='City')
						  ,(select fieldvalue from #XmlData
						    where fieldname='State')
						  ,(select fieldvalue from #XmlData
						    where fieldname='Zip')
						  ,(select fieldvalue from #XmlData
						    where fieldname='Country')
						  ,(select fieldvalue from #XmlData
						    where fieldname='County')
						  ,1
						  ,(select fieldvalue from #XmlData
						    where fieldname='Zip'))
	
					SELECT @iaddressid=@@identity
	
				END

				ELSE
				BEGIN
					SET @Runsql='update contactaddress 
					set ' +replace
						  (replace
						  (replace
						  (replace(@fieldname,'Add','Address')
											 ,'state','stateid')
											 ,'county','countyid')
											 ,'country','countryid')+ '='''+@fieldvalue+''' 
					where addressid=@addressid and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)
				END

			END
			
			ELSE IF (@fieldname='AP1CellPhone')
			BEGIN

				IF (@phoneid is null)
				BEGIN
					INSERT INTO contactphone(ContactID
								,PhoneTypeID
								,PrimaryPhone
								,PhoneNumber)
					VALUES(@contactid
					      ,1
					      ,1
					      ,(select fieldvalue from #XmlData
					        where fieldname='AP1CellPhone'))

				END

				ELSE
				BEGIN

					SET @Runsql='update contactphone
					set PhoneNumber='''+@fieldvalue+''' 
					where ContactPhoneID=@phoneid and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)
				END
			END
			
			ELSE IF (@fieldname='AP1Email')
			BEGIN

				IF (@emailid is null)
				BEGIN
					INSERT INTO contactemail(ContactId
								,EmailTypeID
								,ContactEmail
								,PrimaryEmail)
					VALUES(@contactid
					      ,1
					      ,(select fieldvalue from #XmlData
					  	where fieldname='AP1Email')
					      ,1)
				END 

				ELSE
				BEGIN

					SET @Runsql='update contactemail
					set ContactEmail='''+@fieldvalue+''' 
					where contactemailid=@emailid and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

				END

			END 

			ELSE IF (@fieldname='AP2BirthCity'
			     OR  @fieldname='AP2BirthCountry'
			     OR  @fieldname='AP2BirthName'
			     OR  @fieldname='AP2BirthState'
			     OR  @fieldname='AP2DOB'
			     OR  @fieldname='AP2Fname'
			     OR  @fieldname='AP2Gender'
			     OR  @fieldname='AP2Lname'
			     OR  @fieldname='AP2MName'
			     OR  @fieldname='AP2Nickname'
			     OR  @fieldname='AP2SSN') 
			
			BEGIN

				IF(@contactid2 IS NULL)

				BEGIN
					
					Exec MAPAddNewGroup @AgencyName, @AP1LName, 0, @ContactAIRSId output, @iContactId output

					--Update Library_systemdata
					--Set ContactId = @iContactId
					--Where [user_id] = @user_id

					--Update user_accounts
					--Set airs_contactairs_id = @ContactAIRSId,
					--	airs_contact_id = @iContactId,
					--	ConnId = (@iContactId * -1)
					--Where [user_id] = @user_id

					SET @Runsql='update contact
					set ' +replace
						  (replace
						  (replace
						  (replace
						  (replace(@fieldname,'AP2','')
											 ,'DOB','BirthDate')
											 ,'BirthCity','PlaceOfBirthCity')
											 ,'BirthState','PlaceOfBirthStateId')
											 ,'BirthCountry','PlaceOfBirthCountryId')+ '='''+@fieldvalue+''' 
					where contactid='+cast(@iContactId as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

				END

				ELSE

				BEGIN

					SET @Runsql='update contact
					set ' +replace
						  (replace
						  (replace
						  (replace
						  (replace(@fieldname,'AP2','')
											 ,'DOB','BirthDate')
											 ,'BirthCity','PlaceOfBirthCity')
											 ,'BirthState','PlaceOfBirthStateId')
											 ,'BirthCountry','PlaceOfBirthCountryId')+ '='''+@fieldvalue+''' 
					where contactid='+cast(@contactid2 as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

				END

			END
			
			ELSE IF (@fieldname='AP2CellPhone')
				
			BEGIN

				IF(@phoneid2 IS NULL)

				BEGIN
					INSERT INTO contactphone(ContactID
								,PhoneTypeID
								,PrimaryPhone
								,PhoneNumber)
					VALUES(@contactid
					      ,1
					      ,1
					      ,(select fieldvalue from #XmlData
					        where fieldname='AP2CellPhone'))
				END

				ELSE
				BEGIN
					set @Runsql='update contactphone
					set PhoneNumber='''+@fieldvalue+''' 
					where contactphoneid=@phoneid2 and contactid='+cast(@contactid2 as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)
				END
			END
			ELSE IF (@fieldname='AP2Email')
			BEGIN
				IF(@emailid2 IS NULL)
				BEGIN
					INSERT INTO contactemail(ContactId
								,EmailTypeID
								,ContactEmail
								,PrimaryEmail)
					VALUES(@contactid
					      ,1
					      ,(select fieldvalue from #XmlData
					  	where fieldname='AP1Email')
					      ,1)
				END
				ELSE
				BEGIN
					SET @Runsql='update contactemail
					set ContactEmail='''+@fieldvalue+''' 
					where contactemailid=@emailid2 and contactid='+cast(@contactid2 as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)
				END
			END
			
			SET @startrow=@startrow+1
	
		END
	
	SET NOCOUNT OFF
	
	DROP TABLE #XmlData

END