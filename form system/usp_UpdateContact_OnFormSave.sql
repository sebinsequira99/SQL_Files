

ALTER PROC usp_UpdateContact_OnFormSave
(
 @contactid int
) 
AS
BEGIN

	DECLARE @fieldname varchar(max)
		   ,@fieldvalue varchar(max)
		   ,@startrow int=1
		   ,@endrow int
		   --,@contactid int
		   ,@contactid2 int
		   ,@Runsql varchar(max)
		   ,@xmldata xml
		   ,@ConnId int
	       ,@AgencyName varchar(20)
		   ,@AP2Lname varchar(50)
		   ,@ContactAIRSId int
		   ,@icontactid int
		   ,@iaddressid int=0
		   ,@addressid int
		   ,@phoneid int
		   ,@emailid int	
		   ,@phoneid2 int
		   ,@emailid2 int
	
	SET NOCOUNT ON 


	--Insert into MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
	--Values (@user_id,'AP1','AP1ContactId',Cast(@ContactId as varchar(50)))

	SELECT @xmldata=data_xml FROM library_systemdata WHERE contactid=@contactid
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

	ALTER TABLE #XmlData
	ADD lkpid varchar(20)

	select * into #XmlData_desc
	from #XmlData

    UPDATE x
    SET x.lkpid=CASE x.fieldname 
				WHEN 'AP1BirthState' 
				THEN isnull(ls.stateid,'')
				WHEN 'AP1BirthCountry' 
				THEN isnull(c.countryid,'')
				WHEN 'AP2BirthState' 
				THEN isnull(ls.stateid,'')
				WHEN 'AP2BirthCountry' 
				THEN isnull(c.countryid,'')
				WHEN 'AP1State' 
				THEN isnull(ls.stateid,'')
				WHEN 'AP1Country' 
				THEN isnull(c.countryid,'')
				WHEN 'AP1County' 
				THEN isnull(lc.countyid,'')
				WHEN 'AP2State' 
				THEN isnull(ls.stateid,'')
				WHEN 'AP2Country' 
				THEN isnull(c.countryid,'')
				WHEN 'AP2County' 
				THEN isnull(lc.countyid,'')
				END
    FROM #XmlData x
    LEFT JOIN lkpstate ls
    ON x.fieldvalue=ls.statename
    LEFT JOIN lkpcountry c
    ON x.fieldvalue=c.countrytext
    LEFT JOIN lkpcounty lc
    ON x.fieldvalue=lc.countytext

    UPDATE #XmlData
    SET fieldvalue=lkpid
    WHERE lkpid IS NOT NULL
					
	SELECT @endrow=max(id) FROM #XmlData
	--SELECT @contactid=contactid FROM library_systemdata 
	--WHERE [user_id]=@user_id
	SELECT @contactid2=contactid2 FROM rel_relationship 
	WHERE connectionid=(SELECT connectionid FROM library_systemdata 
					    WHERE contactid=@contactid)
		  AND contactid=@contactid
		  AND RelationshipTypeId=-101

	--SET @ContactAIRSId=(SELECT TOP 1 ContactAIRSId FROM AIRSGroup
	--ORDER BY ContactAIRSId DESC)

	--UPDATE user_accounts
	--SET airs_contactairs_id = @ContactAIRSId,
	--	airs_contact_id = @contactid,
	--	ConnId = (@contactid * -1)
	--WHERE [user_id] = @user_id

	SET @ConnId = -(@contactid)

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

				IF (@fieldname='AP1Fname')
				BEGIN
					UPDATE user_accounts
					SET first_name=(select fieldvalue FROM #XmlData where fieldname='AP1Fname')
					where connid=@connid	
				END

				IF (@fieldname='AP1Lname')
				BEGIN
					UPDATE user_accounts
					SET last_name=(select fieldvalue FROM #XmlData where fieldname='AP1Lname')
					where connid=@connid	
				END

			END

			ELSE IF (@fieldname='AP1Add1'
				 OR  @fieldname='AP1Add2'
				 OR  @fieldname='AP1City'
				 OR  @fieldname='AP1State'
				 OR  @fieldname='AP1Zip'
				 OR  @fieldname='AP1Country'
				 OR  @fieldname='AP1County')
			
			BEGIN

				IF(@iaddressid not in (select addressid from contactaddress) and @addressid is null)
				BEGIN

				DECLARE @ZipNumeric int
					   ,@zip int
				SELECT @zip=fieldvalue from #XmlData
						    where fieldname='AP1Zip'
				IF isnumeric(left(@Zip,5)) = 1
				SET @ZipNumeric = left(@Zip,5)

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
						    where fieldname='AP1Add1')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1Add2')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1City')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1State')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1Zip')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1Country')
						  ,(select fieldvalue from #XmlData
						    where fieldname='AP1County')
						  ,1
						  ,@ZipNumeric)

					SELECT @iaddressid=@@identity

					UPDATE user_accounts
					SET address1=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Add1'),'')
					   ,address2=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Add2'),'')
					   ,city=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1City'),'')
					   ,state=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1State'),'')
					   ,zipcode=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Zip'),'')
					   ,country=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Country'),'')
					where connid=@connid
	
				END

				ELSE
				BEGIN


					SET @Runsql='update contactaddress 
					set ' +replace
						  (replace
						  (replace
						  (replace
						  (replace(@fieldname,'AP1Add','Address')
											 ,'AP1state','stateid')
											 ,'AP1county','countyid')
											 ,'AP1country','countryid')
											 ,'AP1zip','zip')+ '='''+@fieldvalue+''' 
					where addressid=' +cast(@addressid as varchar(20))+' and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					UPDATE user_accounts
					SET address1=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Add1'),'')
					   ,address2=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Add2'),'')
					   ,city=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1City'),'')
					   ,state=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1State'),'')
					   ,zipcode=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Zip'),'')
					   ,country=isnull((select fieldvalue from #XmlData_desc where fieldname='AP1Country'),'')
					where connid=@connid
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
					where ContactPhoneID='+cast(@phoneid as varchar(20))+' and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					IF (@fieldname='AP1CellPhone')
					BEGIN
						UPDATE user_accounts
						SET phone=(select fieldvalue FROM #XmlData where fieldname='AP1CellPhone')
						where connid=@connid	
					END

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
					where contactemailid='+cast(@emailid as varchar(20))+' and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					IF (@fieldname='AP1Email')
					BEGIN
						UPDATE user_accounts
						SET email=(select fieldvalue FROM #XmlData where fieldname='AP1Email')
						where connid=@connid	
					END

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

					SELECT @AP2Lname=fieldvalue from #XmlData
						    where fieldname='AP2Lname'

					Exec MAPAddNewGroup @AgencyName, @AP2LName, 0, @ContactAIRSId output, @iContactId output

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
					
					IF (@fieldname='AP2Fname')
					BEGIN
						UPDATE user_accounts
						SET first_name=(select fieldvalue FROM #XmlData where fieldname='AP2Fname')
						where connid=@connid	
					END

					IF (@fieldname='AP2Lname')
					BEGIN
						UPDATE user_accounts
						SET last_name=(select fieldvalue FROM #XmlData where fieldname='AP2Lname')
						where connid=@connid	
					END
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
					where contactphoneid='+cast(@phoneid2 as varchar(20))+' and contactid='+cast(@contactid2 as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					IF (@fieldname='AP2CellPhone')
					BEGIN
						UPDATE user_accounts
						SET phone=(select fieldvalue FROM #XmlData where fieldname='AP2CellPhone')
						where connid=-(@contactid2)	
					END

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
					  		where fieldname='AP2Email')
					      ,1)
				END
				ELSE
				BEGIN
					SET @Runsql='update contactemail
					set ContactEmail='''+@fieldvalue+''' 
					where contactemailid='+cast(@emailid2 as varchar(20))+' and contactid='+cast(@contactid2 as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					IF (@fieldname='AP2Email')
					BEGIN
						UPDATE user_accounts
						SET email=(select fieldvalue FROM #XmlData where fieldname='AP2Email')
						where connid=-(@contactid2)	
					END

				END
			END
			
			SET @startrow=@startrow+1
	
		END
	
	SET NOCOUNT OFF
	
	DROP TABLE #XmlData
	DROP TABLE #XmlData_desc
END



