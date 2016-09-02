

mapssrs

exec usp_rptFFAdoptionFinalization 203,8142,-31

IF EXISTS (SELECT 1 FROM sys.objects WHERE name ='usp_rptFFAdoptionFinalization' AND type = 'P')
DROP PROC [dbo].usp_rptFFAdoptionFinalization
GO
/*
select *
	from dbo.FastFactData
	where 
*/

/****** Object:  StoredProcedure [dbo].[usp_rptFFAdoptionFinalization]    Script Date: 01/27/2015 15:09:48 ******/
-- exec usp_rptFFAdoptionFinalization 203,8421,-105,'Date1 BETWEEN ''2014-10-01'' AND ''2015-01-01'''

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].usp_rptFFAdoptionFinalization 
  @CAccountKey INT =0 
  ,@UserId INT=0
  ,@ReportId INT=0
  ,@FilterCondition VARCHAR(MAX)='1=1'

  AS      
BEGIN

	DECLARE @strDBName varchar(20),
			@RunSql Nvarchar(MAX)
			
		

   SELECT  DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@CAccountKey AS varchar(20))


--   INSERT INTO Reportlog (AgencyID ,
--						Reportid ,
--						Userid ,
--						FilterCondition ,
--						Createddate)
--						SELECT @CAccountKey,@ReportId,@UserId,@FilterCondition,GETDATE()

/*
FieldId		FieldName				Caption					DataField
-300	Adoption finalization	Finalized in country		Date1
-300	Adoption finalization	Country decree received		Date2
-300	Adoption finalization	Finalized in U.S.			Date3
-300	Adoption finalization	U.S. decree received		Date4
-300	Adoption finalization	U.S. decree sent to country	Date5
*/

   CREATE TABLE #AdoptionFinalization 
		(Client Varchar(200)
			,CaseNumber Varchar(200)
			,GroupName Varchar(200)
			,Add1 Varchar(200)
			,Add2 Varchar(200)
			,City Varchar(200)
			,StateName Varchar(200)
			,Zip Varchar(200)
			,EMail Varchar(200)
			,Phone Varchar(200)
			,FinalizedInCountry DateTime
			,CountryDecreeReceived DateTime
			,FinalizedInUS DateTime
			,USDecreeReceived DateTime
			,USDecreeSentToCountry DateTime
			)
		SET @RunSql ='Select distinct
				replace(r.DisplayName,''amp;'','''')
				,r.RelLabel
				,ug.group_name
				,ca.Address1
				,ca.Address2
				,ca.City
				,s.StateAbbreviation
				,ca.Zip
				,ce.ContactEmail
				,cp.PhoneNumber
				,convert(datetime, ff.Date1, 101)
				,convert(datetime, ff.Date2, 101)
				,convert(datetime, ff.Date3, 101)
				,convert(datetime, ff.Date4, 101)
				,convert(datetime, ff.Date5, 101)
			from ' + @strDBName + '.dbo.FastFactData ff
			left JOIN ' + @strDBName + '.dbo.Rel_Relationship r on ff.Connectionid = r.Connectionid and ff.connid = (r.ContactId * -1)
			left JOIN ' + @strDBName + '.dbo.user_effectiveDate ue on ff.Connectionid = ue.Connectionid and ff.connid = ue.connid and ue.eff_status = ''Y''
			left JOIN ' + @strDBName + '.dbo.lkpConnectionStatus cs on r.ConnectionStatusId = cs.ConnectionStatusId
			left JOIN ' + @strDBName + '.dbo.user_groups ug on ue.group_id = ug.group_id
			left JOIN ' + @strDBName + '.dbo.ContactEMail ce on r.ContactId = ce.ContactId and PrimaryEmail = ''1''
			left JOIN ' + @strDBName + '.dbo.ContactPhone cp on r.ContactId = cp.ContactId and PrimaryPhone = ''1''
			left JOIN ' + @strDBName + '.dbo.ContactAddress ca on r.ContactId = ca.ContactId and MailingAddress = ''1''
			left JOIN ' + @strDBName + '.dbo.lkpState s on ca.StateId = s.StateId
				Where ff.Rel_CustomTemplateId = -300
				and r.RelLabel is not null
				and   '+ISNULL(@FilterCondition,'1=1')

	
	PRINT(@RunSql)
	INSERT INTO #AdoptionFinalization 
	EXEC(@RunSql)
	
	SELECT Client,CaseNumber
			,GroupName 
			,Add1 
			,Add2 
			,City 
			,StateName 
			,Zip
			,EMail
			,Phone 
			,FinalizedInCountry 
			,CountryDecreeReceived 
			,FinalizedInUS 
			,USDecreeReceived 
			,USDecreeSentToCountry 

	FROM #AdoptionFinalization   
	ORDER BY Client,CaseNumber
END