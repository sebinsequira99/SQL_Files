


DECLARE @id int 
DECLARE @DBName VARCHAR(200)
DECLARE @Count int 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].RptContact_test') AND type in (N'U'))
DROP TABLE [dbo].RptContact_test

--SELECT @DBName = db_name()
--EXEC @id = IRRISCENTRAL.DBO.usp_InsertReportJobLogs 'ContactAncTable.sql',@DBName

Select C.ContactId,
		C.Lname + ', ' + C.Fname as FullName,
		C.FName,
		C.LName,
		C.BirthDate,
		CASE C.BirthDate
			When '01/01/1900' then 0
			Else (floor(DateDiff(dd, C.BirthDate, getdate())/365.25))
		End as Age ,
		C.Gender,
		C.SSN,
		C.PlaceOfBirthCity,
		CASE C.DoNotSendMail
			WHEN '1' then 'No'
			Else 'Yes'
		END as SendMail,
		(Select StateAbbreviation
			from lkpState 
			where StateID = C.PlaceOfBirthStateId) as PlaceofBirthState,
		(Select CountryText
			from lkpCountry 
			where CountryID = C.PlaceOfBirthCountryId) as PlaceofBirthCountry,
		ca.Address1 as Address1,	
		ca.Address2 as Address2,	
		ca.City as City,	
		ls.StateAbbreviation as State,	
		lc.CountyText as County,	
		ca.Zip as Zip,	
		ce.ContactEmail as Email,	
		cp.PhoneNumber as Phone,	
		(select STUFF((SELECT distinct ',' + CR.RaceText
							  FROM vw_ContactRace CR
							  WHERE cr.contactid = c.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')) 
		as Race,
		(select STUFF((SELECT distinct ',' + R.ReligionText
							  FROM ContactReligion CR
							  LEFT JOIN lkpReligion R on CR.ReligionID = R.ReligionID
							  WHERE cr.contactid = c.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')) 
		as Religion,
		(select STUFF((SELECT distinct ',' + LC.CultureText
							  FROM ContactCulture CC
							  LEFT JOIN lkpCulture LC 
							  ON CC.CultureID = LC.CultureID
							  WHERE cc.contactid = c.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')) 
		as Ancestry,	
		(select STUFF((SELECT distinct ',' + LL.LanguageText
							  FROM ContactLanguage CL
							  LEFT JOIN lkpLanguage LL 
							  ON CL.LanguageID = LL.LanguageID
							  WHERE cl.contactid = c.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')) 
		as Languages,	
		(select STUFF((SELECT distinct ',' + LE.EthnicityTypeText
							  FROM ContactEthnicity CE
							  LEFT JOIN lkpEthnicity LE 
							  ON CE.EthnicityID = LE.EthnicityID
							  WHERE ce.contactid = c.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')) 
		as Ethnicity,
		dbo.udf_CoupleName((C.ContactId * -1),1,1,'Unknown',0,0) as CoupleFullName,
		dbo.udf_CoupleName((C.ContactId * -1),1,2,'Unknown',0,0) as CoupleFirstName
into RptContact_test
From Contact C
left join contactaddress ca 
on c.contactid=ca.contactid
and ca.mailingaddress=1
left join lkpstate ls
on ca.stateid=ls.stateid
left join lkpcounty lc
on ca.countyid=lc.countyid
left join contactemail ce
on c.contactid=ce.contactid
and ce.primaryemail=1
left join contactphone cp
on c.contactid=cp.contactid
and cp.primaryphone=1

ALTER TABLE RptContact_test
ADD BirthName varchar(max)
   ,Salary Varchar(200)

GO

UPDATE R
SET	r.BirthName=	
CASE WHEN C.BirthName is NULL then 
(SELECT TOP 1 C2.FName + ' ' + C2.LName
 FROM dbo.Rel_Relationship R
 	INNER JOIN dbo.Rel_Relationship R2 on R.RecRelationshipId = R2.RelationshipID
 	INNER JOIN Contact C2 on (R2.ContactAIRSId * -1) = C2.contactId
 WHERE R2.RelationshipTypeId = -42
 	AND R.ContactAIRSId = (C.ContactId * -1))
WHEN C.BirthName = '' then 
(SELECT TOP 1 C2.FName + ' ' + C2.LName
 FROM dbo.Rel_Relationship R
 	INNER JOIN dbo.Rel_Relationship R2 on R.RecRelationshipId = R2.RelationshipID
 	INNER JOIN Contact C2 on (R2.ContactAIRSId * -1) = C2.contactId
 WHERE R2.RelationshipTypeId = -42
 	AND R.ContactAIRSId = (C.ContactId * -1))
ELSE C.BirthName
END
FROM RptContact_test r
JOIN contact c
ON c.contactid=r.contactid

UPDATE R
SET	r.Salary=
(SELECT TOP 1 RID_Value 
 FROM Rel_Relationship R1
 INNER JOIN RelationshipInfoData RID on R1.RelationshipID = RID.RelationshipID
 WHERE R1.ContactAIRSId = (C.ContactId * -1)
 AND R1.RelationshipTypeId = -10
 AND RID.RID_ItemName = 'Annual_Salary'
 ORDER BY R1.RelationshipID desc )
FROM RptContact_test r
JOIN contact c
ON c.contactid=r.contactid				

--SELECT @Count = Count(1) FROM RptContact_test
--EXEC IRRISCENTRAL.DBO.[usp_UpdateReportJobLogs] @id,@Count