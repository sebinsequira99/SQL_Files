

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_collaborative_relationships_rpt' AND type='p')
DROP PROCEDURE usp_collaborative_relationships_rpt;
GO

CREATE PROC usp_collaborative_relationships_rpt
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
     
	 CREATE TABLE #RptCollabRelRpt([Family] varchar(300)
								  ,[Name of Agency (other than Little Miracles) providing services in your adoption process] varchar(300)
								  ,[Agency Address] varchar(max)
								  ,[City State Zip Code] varchar(500)
								  ,[Agency contact person] varchar(200)
								  ,[Agency phone number] varchar(200)
								  ,[If you have completed home study, has it been submitted to USCIS?] varchar(50)
								  ,[If you do not have a placing or home study agency, would you like referral from LMI?] varchar(50)
								  ,[The above named agency is our:] varchar(200)
								  ,[Is the agency Accredited (Hague or Universal)?] varchar(100)
								  )

	    SET @RunSql ='select replace(r.displayname,''amp;'','''') 
						    ,f.input_agencyname
						    ,f.input_agadd 
						    ,f.input_csz 
						    ,f.input_contactper 
						    ,f.input_agphno
						    ,f.input_subuscis 
						    ,f.input_reflmi 
						    ,f.input_agencyrole 
						    ,f.input_accredited  
					  from '+@strDBName+'.dbo.formmaker_30_homestudyagencyinformation f
					  left join '+@strDBName+'.dbo.rel_relationship r
					  on f.connectionid=r.connectionid
					  and (abs(f.connid)=r.contactid or abs(f.connid)=r.contactid2)'
	 --IF(@usertype ! = 'Agency')
     --SET @RunSql =@RunSql +' INNER JOIN  '+@strDBName + '.dbo.[uf_FinancialSecurity]('+CAST(@UserId AS VARCHAR(30))+') U
						--ON (Stg.ConnId=U.ConnId  AND Stg.ConnectionId=U.ConnectionId)'
     SET @RunSql =@RunSql + ' WHERE replace(r.displayname,''amp;'','''') is not null and '+ISNULL(@FilterCondition,'1=1')
     --Print @RunSql
	 INSERT INTO #RptCollabRelRpt 
	 EXEC(@RunSql)

    --INSERT INTO rptQuery(Query) SELECT @RunSql

	 SELECT * FROM #RptCollabRelRpt 
	 order by [Family]

END


