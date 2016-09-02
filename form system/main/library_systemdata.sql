

USE mapform

TRUNCATE TABLE library_systemdata

Go
DECLARE @start_row int
DECLARE @end_row int
DECLARE @contactid int
DECLARE @contactid2 int
DECLARE @UserID int
DECLARE @ConnID int
DECLARE @ConnectionID int
SET NOCOUNT ON
CREATE TABLE [dbo].#tblXML(
	[ContactID] [int] NULL,
	[AP1Fname] [nvarchar](250) Default '' ,
	[AP1MName] [nvarchar](250) Default '' ,
	[AP1Lname] [nvarchar](250) Default '' ,
	[AP1DOB] [datetime] Default '1900-01-01',
	[AP1Gender] [nvarchar](1) Default '' ,
	[AP1Nickname] [nvarchar](250) Default '' ,
	[AP1SSN] [nvarchar](250) Default '' ,
	[AP1BirthName] [varchar](250) Default '' ,
	[AP1BirthCity] [varchar](250) Default '' ,
	[AP1BirthState] [int] Default 0,
	[AP1BirthCountry] [int] Default 0,
	[AP1Email] [nvarchar](250) Default '' ,
	[AP1CellPhone] [nvarchar](250) Default ''  ,
	[AP2Fname] [nvarchar](250) Default '' ,
	[AP2MName] [nvarchar](250) Default '' ,
	[AP2Lname] [nvarchar](250) Default '' ,
	[AP2DOB] [datetime] Default '1900-01-01',
	[AP2Gender] [nvarchar](1) Default '',
	[AP2Nickname] [nvarchar](250) Default '' ,
	[AP2SSN] [nvarchar](250)  Default '',
	[AP2BirthName] [varchar](255) Default '' ,
	[AP2BirthCity] [varchar](250) Default '' ,
	[AP2BirthState] [int]  Default 0,
	[AP2BirthCountry] [int] Default 0,
	[AP2Email] [nvarchar](250) Default '' ,
	[AP2CellPhone] [nvarchar](250) Default '' ,
	[Add1] [nvarchar](250)  Default '',
	[Add2] [nvarchar](250) Default '' ,
	[City] [nvarchar](250) Default '' ,
	[Zip] [nvarchar](250) Default '' ,
	[County] [nvarchar](250) Default '' ,
	[Country] [nvarchar](250) Default ''  
) ON [PRIMARY]

SELECT @start_row =MIN(contactid) FROM Contact
SELECT @end_row= Max(contactid) FROM Contact
--Declare @I As Int =1
--Declare @J As Int = 2		
WHILE (@start_row <= @end_row) --(@I <= @J)--
BEGIN  
		Select @contactid=Null, @contactid2 = Null, @UserID = Null,@ConnID=Null, @ConnectionId = Null

		SET @contactid = @start_row 
		
		SELECT @contactid2 = contactid2 
		FROM rel_relationship 
		WHERE contactid=@contactid and relationshiptypeid=-101

		IF(isnull(@contactid2,0)=0)
			SELECT @contactid2 = contactid 
			FROM rel_relationship 
			WHERE contactid2=@contactid and relationshiptypeid=-101

		SELECT Top 1 @UserID =  user_id,@ConnID = connid,@ConnectionId=ConnectionId  
		FROM rel_relationship 
		WHERE (contactid=@contactid or contactid2=@contactid) And [relationshiptypeid] in (-101,-5001)

		If (IsNull(@UserID,0) = 0)
			SELECT Top 1 @UserID =  user_id,@ConnID = connid,@ConnectionId=ConnectionId  
			FROM rel_relationship 
			WHERE (contactid=@contactid or contactid2=@contactid)

		DELETE FROM #tblXML
		
		INSERT INTO #tblXML([ContactID],
							[AP1Fname] ,
							[AP1MName] ,
							[AP1Lname],
							[AP1DOB],
							[AP1Gender] ,
							[AP1Nickname] ,
							[AP1SSN] ,
							[AP1BirthName] ,
							[AP1BirthCity] ,
							[AP1BirthState] ,
							[AP1BirthCountry] ,
							[AP1Email] ,
							[AP1CellPhone] ,
							[Add1],
							[Add2] ,
							[City],
							[Zip],
							[County],
							[Country])

		SELECT	TOP 1 @contactid ContactID,
				 IsNull(c.FName,'') as AP1Fname
				,IsNull(c.MName,'') as AP1MName
				,IsNull(c.LName,'') as AP1Lname
				,IsNull(c.BirthDate,'1900-01-01') as AP1DOB
				,IsNull(c.Gender,'') as AP1Gender
				,IsNull(c.Nickname,'') as AP1Nickname
				,IsNull(c.SSN,'') as AP1SSN
				,IsNull(c.BirthName,'') as AP1BirthName
				,IsNull(c.PlaceOfBirthCity,'') as AP1BirthCity
				,IsNull(c.PlaceOfBirthStateId,0) as AP1BirthState
				,IsNull(c.PlaceOfBirthCountryId,0) as AP1BirthCountry
				,IsNull(ce.ContactEmail,'') as AP1Email
				,IsNull(cp.PhoneNumber,'') as AP1CellPhone
				,IsNull(ca.Address1,'') as Add1
				,IsNull(ca.Address2,'') as Add2
				,IsNull(ca.City,'') As City
				,IsNull(ca.Zip,'') As Zip
				,IsNull(lc.Countytext,'') as County
				,IsNull(cn.Countrytext,'') as Country 
		FROM contact c
		left join contactaddress ca
		on c.contactid=ca.contactid and (ca.MailingAddress=1 Or (
		ca.MailingAddress=0 And Not Exists(Select 1 From contactaddress cad 
		Where cad.MailingAddress=1 And cad.contactid = @contactid)))	
		left join lkpcounty lc
		on ca.countyid=lc.countyid
		left join lkpcountry cn
		on ca.countryid=cn.countryid
		left join contactemail ce
		on c.contactid=ce.contactid and (ce.PrimaryEmail=1 Or (
		ce.PrimaryEmail=0 And Not Exists(Select 1 From contactemail cem 
		Where cem.PrimaryEmail=1 And cem.contactid = @contactid)))
		left join contactphone cp
		on c.contactid=cp.contactid and (cp.PrimaryPhone=1 Or (
		cp.PrimaryPhone=0 And Not Exists(Select 1 From contactphone cph 
		Where cph.PrimaryPhone=1 And cph.contactid = @contactid)))
		where c.contactid=@contactid

		UPDATE #tblXML 
		SET 
		[AP2Fname]=B.[AP2Fname] ,
		[AP2MName]=B.[AP2MName] ,
		[AP2Lname]=B.[AP2Lname] ,
		[AP2DOB]=B.[AP2DOB] ,
		[AP2Gender]=B.[AP2Gender],
		[AP2Nickname]=B.[AP2Nickname],
		[AP2SSN]=B.[AP2SSN],
		[AP2BirthName]=B.[AP2BirthName],
		[AP2BirthCity]=B.[AP2BirthCity],
		[AP2BirthState]=B.[AP2BirthState],
		[AP2BirthCountry]=B.[AP2BirthCountry],
		[AP2Email]=B.[AP2Email],
		[AP2CellPhone]=B.[AP2CellPhone]
		FROM  (SELECT Top 1 IsNull(cc.FName,'') as AP2Fname
					  ,IsNull(cc.MName,'') as AP2MName
					  ,IsNull(cc.LName,'') as AP2Lname
					  ,IsNull(cc.BirthDate,'1900-01-01') as AP2DOB
					  ,IsNull(cc.Gender,'') as AP2Gender
					  ,IsNull(cc.Nickname,'') as AP2Nickname
					  ,IsNull(cc.SSN,'') as AP2SSN
					  ,IsNull(cc.BirthName,'') as AP2BirthName
					  ,IsNull(cc.PlaceOfBirthCity,'') as AP2BirthCity
					  ,IsNull(cc.PlaceOfBirthStateId,0) as AP2BirthState
					  ,IsNull(cc.PlaceOfBirthCountryId,0) as AP2BirthCountry
					  ,IsNull(ee.ContactEmail,'') as AP2Email
					  ,IsNull(pp.PhoneNumber,'') as AP2CellPhone
					  FROM contact cc
					left join contactemail ee
					on ee.contactid=cc.contactid and (ee.PrimaryEmail=1 Or (
					ee.PrimaryEmail=0 And Not Exists(Select 1 From contactemail cema 
					Where cema.PrimaryEmail=1 And cema.contactid = @contactid2)))
					left join contactphone pp
					on pp.contactid=@contactid2 and (pp.PrimaryPhone=1 Or (
					pp.PrimaryPhone=0 And Not Exists(Select 1 From contactphone cpho 
					Where cpho.PrimaryPhone=1 And cpho.contactid = @contactid2)))
					where cc.contactid=@contactid2) B

		INSERT INTO library_systemdata
		(
		user_id
		,Contactid
		,connectionid
		,connid
		,data_XML
		,created_at
		,created_by
		)
		SELECT @UserID As UserID
			  ,@contactid As contactid
			  ,@ConnectionId
			  ,@connid
			  ,(
			  SELECT * FROM #tblXML
		      FOR XML PATH('Library'))
			  ,GETDATE()
			  ,@UserID
		
		SELECT @start_row = MIN(contactid) FROM Contact Where contactid > @contactid
		--Set @I = @I + 1
END
--Select * From #tblXML
Drop Table #tblXML
--Select * From library_systemdata Order By contactid
SET NOCOUNT OFF