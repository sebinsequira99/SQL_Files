


USE MAPFCAD_TEST
go
/******************************************Add column OldContactId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'CONTACTADDRESS'))    
BEGIN
	ALTER TABLE CONTACTADDRESS
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactAIRS'))    
BEGIN
	ALTER TABLE ContactAIRS
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactEmail'))    
BEGIN
	ALTER TABLE ContactEmail
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactEthnicity'))    
BEGIN
	ALTER TABLE ContactEthnicity
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactMarraigeHistory'))    
BEGIN
	ALTER TABLE ContactMarraigeHistory
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactPhone'))    
BEGIN
	ALTER TABLE ContactPhone
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactRace'))    
BEGIN
	ALTER TABLE ContactRace
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'ContactReligion'))    
BEGIN
	ALTER TABLE ContactReligion
	ADD OldContactId INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactAIRSId' AND Object_ID = Object_ID(N'AIRSGroup'))    
BEGIN
	ALTER TABLE AIRSGroup
	ADD OldContactAIRSId INT
END
GO


--select * from lkpethnicity
--select * from lkprace
--select * from lkpphonetype
--select * from lkpreligion


/********************************************************************************************************************/

/*******Insert into ContactAddress table from MAPFAC to MAPFACQB******/

SET IDENTITY_INSERT CONTACTADDRESS ON
GO
INSERT INTO CONTACTADDRESS
(
AddressId
,AddressTypeId
,ContactId
,Address1
,Address2
,City
,StateId
,Zip
,CountryId
,Countyid
,AddStartDate
,AddLeaveDate
,MailingAddress
,AddressProvinceID
,ZipNumeric
,OldContactId
)

SELECT (AddressId+100000)
,AddressTypeId
,(ContactId + 100000)
,Address1
,Address2
,City
,StateId
,Zip
,CountryId
,Countyid
,AddStartDate
,AddLeaveDate
,MailingAddress
,AddressProvinceID
,ZipNumeric
,ContactId
FROM MAPFAC.DBO.CONTACTADDRESS
where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
SET IDENTITY_INSERT CONTACTADDRESS OFF
GO
--97

--3

/*******Insert into AIRSGroup table from MAPFAC to MAPFACQB******/

 SET IDENTITY_INSERT AIRSGROUP ON
 GO

 INSERT INTO AIRSGROUP
 (
 ContactAIRSId
,AIRSGroupName
,DateCreated
,AIRSGroupSequence
,OldContactAIRSId
 )

SELECT CASE WHEN A.CONTACTAIRSID <0 THEN ((A.CONTACTAIRSID *-1)+ 100000) *-1
ELSE A.CONTACTAIRSID + 100000
END
,A.AIRSGroupName
,A.DateCreated
,A.AIRSGroupSequence 
,A.CONTACTAIRSID
FROM mapfac.dbo.AIRSGROUP a
join  MAPFAC.DBO.ContactAIRS c
on a.contactairsid = c.contactairsid


 SET IDENTITY_INSERT AIRSGROUP OFF
 GO

 --100 rows
 /*******Insert into ContactAIRS table from MAPFAC to MAPFACQB******/
INSERT INTO ContactAIRS
(
ContactAIRSId
,ContactId
,ContactAIRSSequence
,OPTypeId
,MemberSeq
,OldContactId
)
SELECT CASE WHEN CONTACTAIRSID <0 THEN ((CONTACTAIRSID *-1)+ 100000) *-1
ELSE CONTACTAIRSID + 100000
END
,(ContactId + 100000)
,ContactAIRSSequence
,OPTypeId
,MemberSeq
,ContactId
 FROM MAPFAC.DBO.ContactAIRS

 --100

/*******Insert into ContactEmail table from MAPFAC to MAPFACQB******/

SET IDENTITY_INSERT ContactEmail ON
GO

INSERT INTO ContactEmail
(
ContactEmailID
,ContactId
,EmailTypeID
,ContactEmail
,PrimaryEmail
,OldContactId
)
SELECT ContactEmailID + 100000
,(ContactId + 100000)
,EmailTypeID
,ContactEmail
,PrimaryEmail
,ContactId
 FROM MAPFAC.DBO.ContactEmail
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)

SET IDENTITY_INSERT ContactEmail OFF
GO

--56



 --2

/*******Insert into ContactEthnicity table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactEthnicity ON
GO
 --2
INSERT INTO ContactEthnicity
(
ContactEthnicityId
,ContactId
,EthnicityId
,OldContactId
)
SELECT ContactEthnicityId + 100000
,(ContactId + 100000)
,EthnicityId
,ContactId
 FROM MAPFAC.DBO.ContactEthnicity
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
 go
 --6
SET IDENTITY_INSERT ContactEthnicity OFF
GO

/*******Insert into ContactMarraigeHistory table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactMarraigeHistory ON
GO

INSERT INTO ContactMarraigeHistory
(
ContactMarraigeId
,ContactId
,MaritalStatusId
,MarraigeDate
,PlaceOfMarraige
,NameofSpouse
,HowTerminated
,TerminationDate
,MarraigeComments
,TermReasonId
,OldContactId
)
SELECT ContactMarraigeId + 100000
,(ContactId + 100000)
,MaritalStatusId
,MarraigeDate
,PlaceOfMarraige
,NameofSpouse
,HowTerminated
,TerminationDate
,MarraigeComments
,TermReasonId
,ContactId
 FROM MAPFAC.DBO.ContactMarraigeHistory
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
 go
 --30
SET IDENTITY_INSERT ContactMarraigeHistory OFF
GO
/*******Insert into ContactPhone table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactPhone ON
GO

INSERT INTO ContactPhone
(
ContactPhoneID
,ContactID
,PhoneTypeID
,PrimaryPhone
,PhoneNumber
,Ext
,OldContactId
)
SELECT (ContactPhoneID + 100000)
,(ContactID + 100000)
,PhoneTypeID
,PrimaryPhone
,PhoneNumber
,Ext
,ContactId
 FROM MAPFAC.DBO.ContactPhone
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
 go
 
SET IDENTITY_INSERT ContactPhone OFF
GO
--95
/*******Insert into ContactRace table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactRace ON
GO


INSERT INTO ContactRace
(
ContactRaceId
,ContactId
,RaceID
,OldContactId
)
SELECT (ContactRaceId + 100000)
,(ContactId + 100000)
,RaceID
,ContactId
 FROM MAPFAC.DBO.ContactRace
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
 go

SET IDENTITY_INSERT ContactRace OFF
GO
--6
/*******Insert into ContactReligion table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactReligion ON
GO

INSERT INTO ContactReligion
(
ContactReligionID
,ContactID
,ReligionId
,OldContactId
)
SELECT (ContactReligionID + 100000)
,(ContactId + 100000)
,ReligionId
,ContactId
 FROM MAPFAC.DBO.ContactReligion
 where ContactId + 100000 in(select contactid from MAPFCAD_TEST.DBO.CONTACT)
 go

SET IDENTITY_INSERT ContactReligion OFF
GO

--6