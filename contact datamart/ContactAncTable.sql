DECLARE @id int 
DECLARE @DBName VARCHAR(200)
DECLARE @Count int 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].RptContact') AND type in (N'U'))
DROP TABLE [dbo].RptContact


SELECT @DBName = db_name()
EXEC @id = IRRISCENTRAL.DBO.usp_InsertReportJobLogs 'ContactAncTable.sql',@DBName

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
		Case 
			When C.BirthName is NULL then (select top 1 C2.FName + ' ' + C2.LName
														from dbo.Rel_Relationship R
															inner join dbo.Rel_Relationship R2 on R.RecRelationshipId = R2.RelationshipID
															inner join Contact C2 on (R2.ContactAIRSId * -1) = C2.contactId
														where R2.RelationshipTypeId = -42
															and R.ContactAIRSId = (C.ContactId * -1))
			When C.BirthName = '' then (select top 1 C2.FName + ' ' + C2.LName
														from dbo.Rel_Relationship R
															inner join dbo.Rel_Relationship R2 on R.RecRelationshipId = R2.RelationshipID
															inner join Contact C2 on (R2.ContactAIRSId * -1) = C2.contactId
														where R2.RelationshipTypeId = -42
															and R.ContactAIRSId = (C.ContactId * -1))
			else C.BirthName
		end  as BirthName,
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
		dbo.udf_XMLClean(dbo.udf_PrimaryAddress(C.ContactId, 'Address1')) as Address1,	
		dbo.udf_XMLClean(dbo.udf_PrimaryAddress(C.ContactId, 'Address2')) as Address2,	
		dbo.udf_XMLClean(dbo.udf_PrimaryAddress(C.ContactId, 'City')) as City,	
		dbo.udf_PrimaryAddress(C.ContactId, 'StateAbbreviation') as State,	
		dbo.udf_PrimaryAddress(C.ContactId, 'CountyText') as County,	
		dbo.udf_PrimaryAddress(C.ContactId, 'Zip') as Zip,	
		dbo.udf_PrimaryEmail(C.ContactId) as Email,	
		dbo.udf_PrimaryPhone(C.ContactId,'Number') as Phone,	
		dbo.udf_ContactRace(C.ContactId) as Race,	
		dbo.udf_ContactReligion(C.ContactId) as Religion,	
		dbo.udf_ContactAncestry(C.ContactId) as Ancestry,	
		dbo.udf_ContactLanguages(C.ContactId) as Languages,	
		dbo.udf_ContactEthnicity(C.ContactId) as Ethnicity,
		(select top 1 RID_Value 
			from Rel_Relationship R1
				inner join RelationshipInfoData RID on R1.RelationshipID = RID.RelationshipID
						Where R1.ContactAIRSId = (C.ContactId * -1)
							and R1.RelationshipTypeId = -10
							and RID.RID_ItemName = 'Annual_Salary'
						order by R1.RelationshipID desc ) as Salary,
		dbo.udf_CoupleName((C.ContactId * -1),1,1,'Unknown',0,0) as CoupleFullName,
		dbo.udf_CoupleName((C.ContactId * -1),1,2,'Unknown',0,0) as CoupleFirstName
into RptContact
From Contact C

SELECT @Count = Count(1) FROM RptContact
EXEC IRRISCENTRAL.DBO.[usp_UpdateReportJobLogs] @id,@Count

