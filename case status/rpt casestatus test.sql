

mapsdc
mapat
mapeckerd
mapdlnt
sys.objects where name like '%case%status%'
rptreports
udf_GetCaseCurrentStatus
user_accounts where last_name='aarons'
contact
user_agencies
user_groups where group_id=886

rel_relationship where displayname like '%Bunny, Bugs%'
ContactAddress where contactid=168258
lkpstate

user_accounts where connid in (-81592)
Rel_Relationship where contactid=81592 or contactid2=81592
Rel_Relationship where connid in (-72816
,-72817
,-72819)
contact where contactid in (81592,81593)

--================================================--
select * from Rel_Relationship where displayname like '%MC CLELLAN, HEAVEN%' and connectionid in (445287
,480892)

select * from ConnectionStatusLog where connectionid in (329334
,369183
,445287
,480892
,-72816)
and connid in (-72816,-72817)
--================================================--

--================================================--

with rel as
(
select * from Rel_Relationship where displayname like '%LEWELLYN, SUNNY%' and connectionid in (453374
,483933)
)

,con as
(
select * from ConnectionStatusLog where connectionid in (453374
,483933
,339219
,-81592
,371047)
and connid in (-81593
,-81592)
)

select * from con c
left join rel r 
on r.connectionid=c.connectionid 
AND (ABS(c.ConnId)=r.ContactID OR ABS(c.ConnId)=r.ContactID2 or c.ConnId = R.connid)
left join user_effectiveDate ed on c.ConnectionId = ed.ConnectionId 
and dbo.udf_CoupleConnId(r.ConnId, 1) = ed.Connid and ed.end_date is null

user_effectiveDate where connectionid in (453374
,483933)
select dbo.udf_CoupleConnId(-81592, 1) = ed.Connid

--========================================--



mapssrs

Usp_rptCaseStatus_test 196,8125,-18
Usp_rptCaseStatus_test 136,257,-18
Usp_rptCaseStatus_test 133,3035,-18
Usp_rptCaseStatus_test 203,8142,-18
Usp_rptCaseStatus 196,8125,-18
RptCaseStatus_StgTbl


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER PROC [dbo].[Usp_rptCaseStatus_test] 
  @CAccountKey INT =0 
  ,@UserId INT=0
  ,@ReportId INT=0
  ,@FilterCondition VARCHAR(MAX)='1=1'

  AS      
BEGIN

	DECLARE @strDBName varchar(20),
			@RunSql Nvarchar(MAX),
			@FixFunction varchar(200)			
		
   SELECT DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@CAccountKey AS varchar(20))

--	Set @FixFunction = @strDBName + '.dbo.udf_CoupleName'
	Set @FixFunction = @strDBName + '.dbo.udf_MAPCWList'
	
--	Set @FilterCondition = replace(@FilterCondition,'dbo.udf_CoupleName',@FixFunction)
	Set @FilterCondition = replace(@FilterCondition,'dbo.udf_MAPCWList',@FixFunction)

   INSERT INTO Reportlog (AgencyID ,
						Reportid ,
						Userid ,
						FilterCondition ,
						Createddate)
						SELECT @CAccountKey,@ReportId,@UserId,@FilterCondition,GETDATE()

   CREATE TABLE #CaseStatus
		(ConnectionStatus Varchar(MAX)
			,ConnectionStatusStartDate DateTime
			,CWName Varchar(5000)
			,IsClosedStatus Varchar(2)
			,ConnectionId int
			,CaseNumber Varchar(200)
			,Client Varchar(100)
			,City Varchar(100)
			,StateName Varchar(4)
			,Email Varchar(150)
			,RelationshipTypeText Varchar(250)
			,GroupName Varchar(250)
			)
--			,' + @strDBName + '.[dbo].udf_CoupleName(csl.CWConnId,0,0,''Unknown'',0,0) as CWName
--			left join ' + @strDBName + '.dbo.ContactEmail ce on r.ContactId = ce.ContactId and ce.PrimaryEmail = ''1''
--			,isNull(ContactEmail,''None'') as Email
		SET @RunSql ='Select distinct ConnectionStatusText as ConnectionStatus
			,ConnectionStatusStartDate
			,' + @strDBName + '.dbo.udf_MAPCWList(r.[user_id]) as CWNames
			,IsClosedStatus
			,csl.ConnectionId
			,RelLabel as CaseNumber
			,replace(DisplayName,''amp;'','''') as Client
			,isNull(ca.City,''None'') as City
			,isNull(StateAbbreviation,''No'') as State
			,(Select Top 1 ContactEmail
			  from ' + @strDBName + '.dbo.ContactEmail CE1
			  where CE1.ContactId = r.ContactId 
			  and CE1.PrimaryEmail = ''1'') AS Email
			,RelationshipTypeText	
			,group_name
			from ' + @strDBName + '.dbo.ConnectionStatusLog csl
			left join ' + @strDBName + '.dbo.lkpConnectionStatus cs 
			on csl.ConnectionStatusId = cs.ConnectionStatusId
			left join ' + @strDBName + '.dbo.Rel_Relationship r on csl.ConnectionId = r.ConnectionId 
			AND (ABS(csl.ConnId)=r.ContactID or csl.ConnId = R.connid)
			left JOIN ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt 
			on r.RelationshipTypeId = rt.RelationshipTypeId
			left JOIN ' + @strDBName + '.dbo.Rel_lkp_RelationshipSubType rst 
			on rt.RelationshipSubTypeId = rst.RelationshipSubTypeId
			left join ' + @strDBName + '.dbo.user_effectiveDate ed 
			on csl.ConnectionId = ed.ConnectionId 
			and ' + @strDBName + '.dbo.udf_CoupleConnId(r.ConnId, 1) = ed.Connid and ed.end_date is null
			left join ' + @strDBName + '.dbo.user_groups g on ed.group_id = g.group_id 
			left join ' + @strDBName + '.dbo.ContactAddress ca 
			on r.ContactId = ca.ContactId and ca.MailingAddress = ''1''
			left join ' + @strDBName + '.dbo.lkpState s on ca.StateId = s.StateId	
			Left Join ' + @strDBName + '.dbo.caseworker_client CC  ON r.User_id=CC.ParentID		
			Left Join ' + @strDBName + '.dbo.user_accounts UA   ON CC.CaseworkerId=UA.User_id		
			where (ConnectionStatusLogIsDeleted = ''0'' or ConnectionStatusLogIsDeleted is null)
				and Rel_SubType_isProgram = ''1''
				and   '+ISNULL(@FilterCondition,'1=1')
	
	
	
	PRINT(@RunSql)
	INSERT INTO #CaseStatus
	EXEC(@RunSql)
	
	--SELECT ConnectionStatus ,ConnectionStatusStartDate ,
	--CWName ,IsClosedStatus ,ConnectionId ,CaseNumber,
	--Client,StateName,City,Email,RelationshipTypeText,GroupName,
	--ROW_NUMBER() OVER(PARTITION by ConnectionStatus ,ConnectionStatusStartDate ,
	--CWName ,IsClosedStatus ,ConnectionId ,CaseNumber,
	--Client,StateName,City,Email,RelationshipTypeText,GroupName ORDER BY Client) 
	--AS duplicateRecCount 
	--FROM #CaseStatus  
	--WHERE duplicateRecCount > 1 
	--ORDER BY ConnectionStatus,CaseNumber
	  ;
	  WITH TempDup (ConnectionStatus ,ConnectionStatusStartDate ,
	  	CWName ,IsClosedStatus ,ConnectionId ,CaseNumber,
	  	Client,StateName,City,Email,RelationshipTypeText,GroupName,duplicateRecCount)
	  AS
	  (
	  SELECT ConnectionStatus ,ConnectionStatusStartDate ,
	  	CWName ,IsClosedStatus ,ConnectionId ,CaseNumber,
	  	Client,StateName,City,Email,RelationshipTypeText,GroupName,
		ROW_NUMBER() OVER(PARTITION by ConnectionStatus ,ConnectionStatusStartDate ,
	  	CWName ,IsClosedStatus ,ConnectionId ,CaseNumber,
	  	Client,StateName,City,Email,RelationshipTypeText,GroupName ORDER BY Client)
	  AS duplicateRecCount
	  FROM #CaseStatus
	  )

	  select * from TempDup
	  --WHERE duplicateRecCount > 1 
	  ORDER BY Client

END









