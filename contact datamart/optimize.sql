use rolesdev

DECLARE @id int 
DECLARE @DBName VARCHAR(200)
DECLARE @Count int 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].RptContact_test') AND type in (N'U'))
DROP TABLE [dbo].RptContact_test

--SELECT @DBName = db_name()
--EXEC @id = IRRISCENTRAL.DBO.usp_InsertReportJobLogs 'ContactAncTable.sql',@DBName

	SELECT ca.ContactId,MAX(ca.AddressId) AS AddressId
	INTO #tempAddress							  		 
	FROM contact c						  			
	INNER JOIN contactaddress ca
	ON ca.ContactId = c.ContactId
	AND ca.MailingAddress = 1
	WHERE ISNULL(ca.AddLeaveDate,'') = '' or ca.AddLeaveDate = '1900-01-01 00:00:00.000'
	GROUP BY ca.ContactId
	
	select ca.contactid,ca.address1,ca.address2,ca.zip,ca.stateid,ca.city,ca.countyid
	into #address
	from contactaddress ca
	join #tempAddress t
	on t.AddressId=ca.AddressId and ca.MailingAddress = 1

	SELECT ce.ContactId,max(ce.ContactEmailid) as ContactEmailid
	INTO #tempEmail					  		
	FROM contact c						  			
	INNER JOIN contactemail ce
	ON ce.ContactId = c.ContactId
	AND ce.primaryemail = 1
	WHERE ISNULL(ce.contactemail,'') <> ''
	GROUP BY ce.ContactId

	SELECT cp.ContactId,max(cp.ContactPhoneID) as ContactPhoneID
	INTO #tempPhone				  		
	FROM contact c						  			
	INNER JOIN contactphone cp
	ON cp.ContactId = c.ContactId
	AND cp.PrimaryPhone = 1
	WHERE ISNULL(cp.PhoneNumber,'') <> ''
	GROUP BY cp.ContactId

Select C.ContactId,
		C.Lname + ', ' + C.Fname as FullName,
		C.FName,
		C.LName,
		C.BirthDate,
		CASE C.BirthDate
			When '01/01/1900' then 0
			Else (floor(DateDiff(dd, C.BirthDate, getdate())/365.25))
		End as Age,
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
		t.Address1 as Address1,	
		t.Address2 as Address2,	
		t.City as City,	
		ls.StateAbbreviation as State,	
		lc.CountyText as County,	
		t.Zip as Zip,	
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
left join  #address t on t.ContactId = C.ContactId
--left JOIN ContactAddress CA ON  ca.ContactId = t.ContactId and ca.AddressId = t.AddressId and ca.MailingAddress = 1
LEFT JOIN #tempEmail TE on TE.ContactId = C.ContactId
left JOIN ContactEmail CE ON CE.ContactId = TE.ContactId  AND CE.CONTACTEMAILID  = TE.CONTACTEMAILID
left join lkpstate ls
on t.stateid=ls.stateid
left join lkpcounty lc
on t.countyid=lc.countyid
LEFT JOIN #tempphone TP on TP.ContactId = C.ContactId
left JOIN ContactPhone CP ON CP.ContactId = TP.ContactId  AND CP.CONTACTPHONEID  = TP.CONTACTPHONEID
go

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

--UPDATE R
--SET	r.Salary=
--(SELECT TOP 1 RID_Value 
-- FROM Rel_Relationship R1
-- INNER JOIN RelationshipInfoData RID on R1.RelationshipID = RID.RelationshipID
-- WHERE R1.ContactAIRSId = (C.ContactId * -1)
-- AND R1.RelationshipTypeId = -10
-- AND RID.RID_ItemName = 'Annual_Salary'
-- ORDER BY R1.RelationshipID desc )
--FROM RptContact_test r
--JOIN contact c
--ON c.contactid=r.contactid		

 select r1.contactid,max(R.relationshipid) as relationshipid 
into #temp 
 from RelationshipInfoData r
 join Rel_Relationship R1 on r.relationshipid = r1.relationshipid
 join contact c on c.contactid = r1.contactid
 where  r.RID_ItemName = 'Annual_Salary'
 AND R1.RelationshipTypeId = -10
group by r1.contactid


UPDATE R
SET r.Salary=r1.RID_Value
FROM RptContact_test r
join  #temp t
on t.contactid = r.contactid
join RelationshipInfoData r1 
on r1.relationshipid = t.relationshipid
where  r1.RID_ItemName = 'Annual_Salary'		

--SELECT @Count = Count(1) FROM RptContact_test
--EXEC IRRISCENTRAL.DBO.[usp_UpdateReportJobLogs] @id,@Count