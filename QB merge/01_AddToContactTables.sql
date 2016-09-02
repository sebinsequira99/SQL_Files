USE MAPFCAD_TEST
go

/******************Add column OldContactId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactId' AND Object_ID = Object_ID(N'CONTACT'))    
BEGIN
	ALTER TABLE CONTACT
	ADD OldContactId INT
END

/******************************************************************/
SET IDENTITY_INSERT CONTACT ON
GO
INSERT INTO CONTACT 
(
ContactId
,FName
,MName
,LName
,BusName
,BirthDate
,Gender
,SSN
,AgencyIdentifier
,SalutationId
,ContactNotes
,PlaceOfBirthCity
,PlaceOfBirthStateId
,PlaceOfBirthCountryId
,Title
,DateOfDeath
,ContactStatusId
,DoNotSendMail
,OriginatingInternalAgencyId
,Nickname
,WebsiteURL
,Temp_RefSubTypeID
,OriginatingInternalAgencyID_old
,BirthName
,MaidenFirstName
,MaidenLastName
,MarriageFirstName
,MarriageLastName
,BirthFirstName
,BirthLastName
,InqChild
,OldContactId
)
SELECT (ContactId + 100000) AS ContactID
,FName
,MName
,LName
,BusName
,BirthDate
,Gender
,SSN
,AgencyIdentifier
,SalutationId
,ContactNotes
,PlaceOfBirthCity
,PlaceOfBirthStateId
,PlaceOfBirthCountryId
,Title
,DateOfDeath
,ContactStatusId
,DoNotSendMail
,OriginatingInternalAgencyId
,Nickname
,WebsiteURL
,Temp_RefSubTypeID
,OriginatingInternalAgencyID_old
,BirthName
,MaidenFirstName
,MaidenLastName
,MarriageFirstName
,MarriageLastName
,BirthFirstName
,BirthLastName
,InqChild
,ContactID
FROM MAPFAC.DBO.CONTACT
--WHERE ContactID > 19389

--152 rows
SET IDENTITY_INSERT CONTACT OFF
GO
