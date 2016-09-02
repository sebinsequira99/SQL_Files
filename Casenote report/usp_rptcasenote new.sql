

--usp_RptCasenote 136,257,-50,'c.CasenoteType= ''event registration'''

ALTER PROC usp_RptCasenote
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
     
	 CREATE TABLE #RptCasenote(case_note_id				INT
							  ,ClientName				NVARCHAR(MAX)
							  ,CwName					NVARCHAR(MAX)
							  ,CaseNumber				NVARCHAR(MAX)
							  ,ActRe					NVARCHAR(MAX)
							  ,casenote_subject			NVARCHAR(MAX)
							  ,DateCreated				DATETIME
							  ,created_dttm				DATETIME
							  ,updated_by				NVARCHAR(MAX)
							  ,updated_dttm				DATETIME
							  ,CasenoteType				NVARCHAR(MAX)
							  ,GroupName				NVARCHAR(MAX)
							  ,Program					NVARCHAR(MAX)
							  ,Role						NVARCHAR(MAX))

	    SET @RunSql ='SELECT c.case_note_id
						 ,c.ClientName
						 ,c.CWName
						 ,c.CaseNumber
						 ,c.ActRe
						 ,c.casenote_subject
						 ,c.DateCreated
						 ,c.created_dttm
						 ,c.updated_by
						 ,c.updated_dttm
						 ,c.CasenoteType
						 ,c.GroupName
						 ,c.Program
						 ,c.Role

	 FROM ' +@strDBName+'.dbo.CasenoteRpt_StgTbl c'
	 --IF(@usertype ! = 'Agency')
     --SET @RunSql =@RunSql +' INNER JOIN  '+@strDBName + '.dbo.[uf_FinancialSecurity]('+CAST(@UserId AS VARCHAR(30))+') U
						--ON (Stg.ConnId=U.ConnId  AND Stg.ConnectionId=U.ConnectionId)'
     SET @RunSql =@RunSql + ' WHERE '+ISNULL(@FilterCondition,'1=1	 ORDER BY ClientName')
     --Print @RunSql
	 INSERT INTO #RptCasenote 
	 EXEC(@RunSql)

    --INSERT INTO rptQuery(Query) SELECT @RunSql

	 SELECT * FROM #RptCasenote 

END

