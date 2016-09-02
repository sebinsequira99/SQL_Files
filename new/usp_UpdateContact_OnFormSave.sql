
--library_systemdata WHERE contactid=102587
--contact WHERE contactid=102587
--user_accounts where connid=-102587

--usp_UpdateContact_OnFormSave 102587

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_UpdateContact_OnFormSave' AND type='p')
DROP PROCEDURE usp_UpdateContact_OnFormSave;
GO

CREATE PROC usp_UpdateContact_OnFormSave
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
				THEN isnull(lss.stateid,'')
				--WHEN 'AP1BirthCountry' 
				--THEN isnull(c.countryid,'')
				WHEN 'AP2BirthState' 
				THEN isnull(lss.stateid,'')
				--WHEN 'AP2BirthCountry' 
				--THEN isnull(c.countryid,'')
				WHEN 'State' 
				THEN isnull(ls.stateid,'')
				WHEN 'Country' 
				THEN isnull(c.countryid,'')
				WHEN 'County' 
				THEN isnull(lc.countyid,'')
				END
    FROM #XmlData x
    LEFT JOIN lkpstate ls
    ON x.fieldvalue=ls.statename
	LEFT JOIN lkpstate lss
    ON x.fieldvalue=lss.stateabbreviation
    LEFT JOIN lkpcountry c
    ON x.fieldvalue=c.countrytext
    LEFT JOIN lkpcounty lc
    ON x.fieldvalue=lc.countytext

    UPDATE #XmlData
    SET fieldvalue=lkpid
    WHERE lkpid IS NOT NULL
	
	UPDATE #XmlData
    SET fieldvalue=replace(fieldvalue,0,'')
	where fieldname like '%BirthState%'

	--select * from #XmlData
					
	SELECT @endrow=max(id) FROM #XmlData
	--SELECT @contactid=contactid FROM library_systemdata 
	--WHERE [user_id]=@user_id
	SELECT @contactid2=CASE WHEN contactid=@contactid 
							THEN contactid2
							WHEN contactid2=@contactid 
							THEN contactid
							ELSE -1
					   END
					   FROM rel_relationship 
					   WHERE (contactid=@contactid or contactid2=@contactid)
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
			
			IF ((@fieldname='AP1BirthCity'
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
			and @fieldvalue is not null and @fieldvalue<>'')

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

			ELSE IF ((@fieldname='Add1'
				 OR  @fieldname='Add2'
				 OR  @fieldname='City'
				 OR  @fieldname='State'
				 OR  @fieldname='Zip'
				 OR  @fieldname='Country'
				 OR  @fieldname='County') 
				 and @fieldvalue is not null and @fieldvalue<>'' and @fieldvalue<>0)
			
			BEGIN

				IF(@iaddressid not in (select addressid from contactaddress) and @addressid is null)
				BEGIN

				DECLARE @ZipNumeric int
					   ,@zip int
				SELECT @zip=fieldvalue from #XmlData
						    where fieldname='Zip'
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
						  ,@ZipNumeric)

					SELECT @iaddressid=@@identity

					UPDATE user_accounts
					SET address1=isnull((select fieldvalue from #XmlData_desc where fieldname='Add1'),'')
					   ,address2=isnull((select fieldvalue from #XmlData_desc where fieldname='Add2'),'')
					   ,city=isnull((select fieldvalue from #XmlData_desc where fieldname='City'),'')
					   ,state=isnull((select fieldvalue from #XmlData_desc where fieldname='State'),'')
					   ,zipcode=isnull((select fieldvalue from #XmlData_desc where fieldname='Zip'),'')
					   ,country=isnull((select fieldvalue from #XmlData_desc where fieldname='Country'),'')
					where connid=@connid
	
				END

				ELSE
				BEGIN


					SET @Runsql='update contactaddress 
					set ' +replace
						  (replace
						  (replace
						  (replace
						  (replace(@fieldname,'Add','Address')
											 ,'state','stateid')
											 ,'county','countyid')
											 ,'country','countryid')
											 ,'zip','zip')+ '='''+@fieldvalue+''' 
					where addressid=' +cast(@addressid as varchar(20))+' and contactid='+cast(@contactid as varchar(20))
					PRINT @Runsql
					EXEC (@Runsql)

					UPDATE user_accounts
					SET address1=isnull((select fieldvalue from #XmlData_desc where fieldname='Add1'),'')
					   ,address2=isnull((select fieldvalue from #XmlData_desc where fieldname='Add2'),'')
					   ,city=isnull((select fieldvalue from #XmlData_desc where fieldname='City'),'')
					   ,state=isnull((select fieldvalue from #XmlData_desc where fieldname='State'),'')
					   ,zipcode=isnull((select fieldvalue from #XmlData_desc where fieldname='Zip'),'')
					   ,country=isnull((select fieldvalue from #XmlData_desc where fieldname='Country'),'')
					where connid=@connid
				END

			END
			
			ELSE IF (@fieldname='AP1CellPhone' and @fieldvalue is not null and @fieldvalue<>'')
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

					IF (@fieldname='AP1CellPhone' and @fieldvalue is not null and @fieldvalue<>'')
					BEGIN
						UPDATE user_accounts
						SET phone=(select fieldvalue FROM #XmlData where fieldname='AP1CellPhone')
						where connid=@connid	
					END

				END
			END
			
			ELSE IF (@fieldname='AP1Email' and @fieldvalue is not null and @fieldvalue<>'')
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

					IF (@fieldname='AP1Email' and @fieldvalue is not null and @fieldvalue<>'')
					BEGIN
						UPDATE user_accounts
						SET email=(select fieldvalue FROM #XmlData where fieldname='AP1Email')
						where connid=@connid	
					END

				END

			END 

			ELSE IF ((@fieldname='AP2BirthCity'
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
				 and @fieldvalue is not null and @fieldvalue<>'') 
			
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
					
					IF (@fieldname='AP2Fname' and @fieldvalue is not null and @fieldvalue<>'')
					BEGIN
						UPDATE user_accounts
						SET first_name=(select fieldvalue FROM #XmlData where fieldname='AP2Fname')
						where connid=@connid	
					END

					IF (@fieldname='AP2Lname' and @fieldvalue is not null and @fieldvalue<>'')
					BEGIN
						UPDATE user_accounts
						SET last_name=(select fieldvalue FROM #XmlData where fieldname='AP2Lname')
						where connid=@connid	
					END
				END

			END
			
			ELSE IF (@fieldname='AP2CellPhone' and @fieldvalue is not null and @fieldvalue<>'')
				
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

					IF (@fieldname='AP2CellPhone' and @fieldvalue is not null and @fieldvalue<>'')
					BEGIN
						UPDATE user_accounts
						SET phone=(select fieldvalue FROM #XmlData where fieldname='AP2CellPhone')
						where connid=-(@contactid2)	
					END

				END
			END
			ELSE IF (@fieldname='AP2Email' and @fieldvalue is not null and @fieldvalue<>'')
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

					IF (@fieldname='AP2Email' and @fieldvalue is not null and @fieldvalue<>'')
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



