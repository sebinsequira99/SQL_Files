USE MAPFACQB_STAGE
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
WHERE contactid >19389


SET IDENTITY_INSERT CONTACTADDRESS OFF
GO
--97

select ca.addressid,c.addressid as caddressid,ca.contactid,c.contactid as ccontactid
into #CONTACTADDRESSTEMP
from CONTACTADDRESS c
right join MAPFAC.DBO.CONTACTADDRESS ca
on ca.AddressId = c.AddressId
and ca.ContactId = c.ContactId
WHERE ca.contactid <19389

INSERT INTO CONTACTADDRESS
(
AddressTypeId
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

SELECT C.AddressTypeId
,C.ContactId
,C.Address1
,C.Address2
,C.City
,C.StateId
,C.Zip
,C.CountryId
,C.Countyid
,C.AddStartDate
,C.AddLeaveDate
,C.MailingAddress
,C.AddressProvinceID
,C.ZipNumeric
,C.ContactId 
FROM MAPFAC.DBO.CONTACTADDRESS C
JOIN #CONTACTADDRESSTEMP CT
ON CT.ADDRESSID = C.ADDRESSID
WHERE caddressid is null

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
 WHERE c.contactid >19389

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
 WHERE contactid >19389

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
 WHERE contactid >19389

SET IDENTITY_INSERT ContactEmail OFF
GO

--56

SELECT c.contactid,
	ce.contactid AS cecontactid,
	ce.contactemailid AS cecontactemailid ,
	c.contactemailid 
INTO #tempemail
FROM ContactEmail C
RIGHT JOIN MAPFAC.DBO.CONTACTEMAIL CE
ON CE.CONTACTID = C.CONTACTID
and ce.contactemailID =c.contactemailID
WHERE ce.contactid <19389

INSERT INTO CONTACTEMAIL
(
ContactId
,EmailTypeID
,ContactEmail
,PrimaryEmail
,OldContactId
)
 SELECT C.ContactId
,C.EmailTypeID
,C.ContactEmail
,C.PrimaryEmail
,C.ContactId FROM MAPFAC.DBO.CONTACTEMAIL C
 JOIN #tempemail T
 ON T.CECONTACTID = C.CONTACTID
 AND T.CECONTACTEMAILID = C.CONTACTEMAILID
 WHERE T.contactid IS NULL AND T.CECONTACTID IS NOT NULL

 --2

/*******Insert into ContactEthnicity table from MAPFAC to MAPFACQB******/
SET IDENTITY_INSERT ContactEthnicity ON
GO

INSERT INTO ContactEthnicity
(
ContactEthnicityId
,ContactId
,EthnicityId
,OldContactId
)
SELECT ContactEthnicityId
,ContactId
,EthnicityId
,ContactId
 FROM MAPFAC.DBO.ContactEthnicity
 WHERE contactid in (19335,19350)
 go
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
 WHERE contactid >19389
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
SELECT ContactMarraigeId
,ContactId
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
 WHERE ContactMarraigeId in (2720,2721)
 go

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
 WHERE contactid >19389
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
SELECT ContactPhoneID
,ContactID
,PhoneTypeID
,PrimaryPhone
,PhoneNumber
,Ext
,ContactId
 FROM MAPFAC.DBO.ContactPhone
 WHERE ContactPhoneID IN (15010,15011)
 go

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
 WHERE contactid >19389
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
SELECT ContactRaceId
,ContactId
,RaceID
,ContactId
 FROM MAPFAC.DBO.ContactRace
 WHERE contactid IN (19335,19350)
 go

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
 WHERE contactid >19389
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
SELECT ContactReligionID
,ContactID
,ReligionId
,ContactId
 FROM MAPFAC.DBO.ContactReligion
 WHERE contactid IN (19335,19350)
 go

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
 WHERE contactid >19389
 go

SET IDENTITY_INSERT ContactReligion OFF
GO

--6