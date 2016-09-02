

ALTER PROC usp_RptSurvey
   @CAccountKey INT =0 
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
      SELECT @CAccountKey,@ReportId,@UserId,@FilterCondition ,GETDATE()
     

   SELECT DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@CAccountKey AS varchar(20))

   SET @RunSql ='SELECT @usertype = user_type FROM ' +@strDBName+'.dbo.user_accounts where user_id ='+CAST(@UserId AS VARCHAR(50))
   PRINT @RunSql
   EXECUTE sp_executesql @RunSql, N'@usertype VARCHAR(50) OUTPUT',  @usertype=@usertype OUTPUT
   PRINT @usertype
   
   /******************/
     
     SET @RunSql ='SELECT s.id	
						 ,s.Campaign_id	
						 ,s.Survey_Name	
						 ,s.Parent_name	
						 ,s.Email	
						 ,s.City	
						 ,s.Phone	
						 ,s.CaseNumber	
						 ,s.Survey_Completion_Date	
						 ,s.question	
						 ,s.answer

	 FROM ' +@strDBName+'.dbo.StgTbl_SurveyRpt s'
	 --IF(@usertype ! = 'Agency')
     --SET @RunSql =@RunSql +' INNER JOIN  '+@strDBName + '.dbo.[uf_FinancialSecurity]('+CAST(@UserId AS VARCHAR(30))+') U
						--ON (Stg.ConnId=U.ConnId  AND Stg.ConnectionId=U.ConnectionId)'
     SET @RunSql =@RunSql + ' WHERE '+ISNULL(@FilterCondition,'1=1')
     
    -- INSERT INTO rptQuery(Query) SELECT @RunSql
    
	CREATE TABLE #RptSurveyTbl
    (	 
	  Id						INT
	 ,Campaign_Id				INT
	 ,Survey_Name				VARCHAR(100)
	 ,Parent_name				VARCHAR(100)
	 ,Email						VARCHAR(MAX)
	 ,City						VARCHAR(100)
	 ,Phone						VARCHAR(100)
	 ,CaseNumber				VARCHAR(100)
	 ,Survey_Completion_Date	DATETIME
	 ,Question					VARCHAR(MAX)
	 ,Answer					VARCHAR(100)
    )
	PRINT(@RunSql)
    INSERT INTO #RptSurveyTbl
    EXEC (@RunSql)
    
  
	SELECT   Id						
			,Campaign_Id				
			,Survey_Name				
			,Parent_name				
			,Email						
			,City						
			,Phone						
			,CaseNumber				
			,CONVERT(VARCHAR(20),Survey_Completion_Date,110) AS Survey_Completion_Date
			,Question				
			,Answer					

	FROM #RptSurveyTbl
	ORDER BY Id

END






