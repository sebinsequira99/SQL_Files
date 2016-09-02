
--use mapssrs
--usp_RptInquiry 51,257,-50
--,'I.field_value= ''google'''

ALTER PROC usp_RptInquiry
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
     
	 CREATE TABLE #RptInquiry(inquiry_id			bigint		
							 ,agency_id				int		
							 ,user_type				varchar(200)
							 ,first_name			varchar(200)
							 ,last_name				varchar(200)
							 ,email_id				varchar(300)
							 ,user_id				int		
							 ,inquiry_detail_id		bigint		
							 ,field_name			varchar(250)
							 ,field_value			varchar(MAX)
							 ,contactid				int		
							 ,fname					varchar(200)
							 ,lname					varchar(200)
							 ,displayname			varchar(100)
							 ,connectionstatusid	int		
							 ,connectionstatustext  varchar(100))

	    SET @RunSql ='SELECT I.inquiry_id			
							,I.agency_id				
							,I.user_type				
							,I.first_name			
							,I.last_name				
							,I.email_id				
							,I.user_id				
							,I.inquiry_detail_id		
							,I.field_name			
							,I.field_value			
							,I.contactid				
							,I.fname					
							,I.lname					
							,I.displayname			
							,I.connectionstatusid	
							,I.connectionstatustext 

	 FROM ' +@strDBName+'.dbo.StgTbl_InquiryRpt I'
	 --IF(@usertype ! = 'Agency')
     --SET @RunSql =@RunSql +' INNER JOIN  '+@strDBName + '.dbo.[uf_FinancialSecurity]('+CAST(@UserId AS VARCHAR(30))+') U
						--ON (Stg.ConnId=U.ConnId  AND Stg.ConnectionId=U.ConnectionId)'
     SET @RunSql =@RunSql + ' WHERE '+ISNULL(@FilterCondition,'1=1')
     --Print @RunSql
	 INSERT INTO #RptInquiry 
	 EXEC(@RunSql)

    --INSERT INTO rptQuery(Query) SELECT @RunSql

	 SELECT * FROM #RptInquiry 

END

