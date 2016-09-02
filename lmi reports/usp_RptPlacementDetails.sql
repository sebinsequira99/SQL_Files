
--use mapssrs
--usp_RptPlacementDetails 51,1,1
--,'c.CasenoteType= ''event registration'''

ALTER PROC usp_RptPlacementDetails
   @AgencyId INT =0 
  ,@UserId INT=0
  ,@ReportId INT=0
  ,@FilterCondition VARCHAR(MAX)=null 

AS      
BEGIN

   DECLARE @strDBName varchar(20),
   @RunSql Nvarchar(MAX),
   @usertype Varchar(50)
    
   INSERT INTO Reportlog (AgencyID ,
						  Reportid ,
						  Userid ,
						  FilterCondition ,
						  Createddate)
   SELECT @AgencyId,@ReportId,@UserId,@FilterCondition ,GETDATE()
     

   SELECT DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@AgencyId AS varchar(20))

   SET @RunSql ='SELECT @usertype = user_type FROM ' +@strDBName+'.dbo.user_accounts where user_id ='+CAST(@UserId AS VARCHAR(50))
   PRINT @RunSql
   EXECUTE sp_executesql @RunSql, N'@usertype VARCHAR(50) OUTPUT',  @usertype=@usertype OUTPUT
   PRINT @usertype
   
   /******************/
     
	 CREATE TABLE #RptPlacementDetails(ChildName varchar(200)
	 								  ,CaseNo varchar(200)
	 								  ,PlacedYN varchar(10)
	 								  ,ParentsName varchar(200)
	 								  ,ParentState varchar(100)
	 								  ,ParentCountry varchar(100)
	 								  ,ChildCountry varchar(100)
	 								  ,ParentCaseNo varchar(200)
	 								  ,PlacedDate datetime
									  ,PhysicalPlacementDate datetime)

	    SET @RunSql ='SELECT P.ChildName
						    ,P.CaseNo
						    ,P.PlacedYN
						    ,P.ParentsName
						    ,P.ParentState
						    ,P.ParentCountry
						    ,P.ChildCountry
						    ,P.ParentCaseNo
						    ,P.PlacedDate
							,P.PhysicalPlacementDate

	 FROM ' +@strDBName+'.dbo.StgTbl_PlacementRpt P'
	 --IF(@usertype ! = 'Agency')
     --SET @RunSql =@RunSql +' INNER JOIN  '+@strDBName + '.dbo.[uf_FinancialSecurity]('+CAST(@UserId AS VARCHAR(30))+') U
						--ON (Stg.ConnId=U.ConnId  AND Stg.ConnectionId=U.ConnectionId)'
     SET @RunSql =@RunSql + ' WHERE '+ISNULL(@FilterCondition,'1=1')
     --Print @RunSql
	 INSERT INTO #RptPlacementDetails
	 EXEC(@RunSql)

    --INSERT INTO rptQuery(Query) SELECT @RunSql

	 SELECT * FROM #RptPlacementDetails

END

