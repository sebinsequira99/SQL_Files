
mapssrs

usp_rptcurrentCaseStatus 196,0,0,'CurrentCaseStatus=''map hs family'''

ALTER PROC [dbo].[Usp_rptCurrentCaseStatus] 
   @AgencyId INT =0 
  ,@UserId INT=0
  ,@ReportId INT=0
  ,@FilterCondition VARCHAR(MAX)='1=1'

  AS      
BEGIN

	DECLARE @strDBName varchar(20),
			@RunSql Nvarchar(MAX)
		
   SELECT  DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@AgencyId AS varchar(20))

   INSERT INTO Reportlog (AgencyID ,
						Reportid ,
						Userid ,
						FilterCondition ,
						Createddate)
						SELECT @AgencyId,@ReportId,@UserId,@FilterCondition,GETDATE()
	
	CREATE TABLE #CurrentCaseStatus
				(
				 GroupName	varchar(max)
				,Program	varchar(max)
				,[Role]	varchar(max)
				,ClientName varchar(max)	
				,CurrentCaseStatus varchar(max)
				,CaseNumber varchar(max)
				,PhaseName varchar(max)
				)

	SET @RunSql ='Select GroupName
				        ,Program
				        ,Role
				        ,replace(ClientName,''amp;'','''')
				        ,CurrentCaseStatus
				        ,CaseNumber
				        ,PhaseName 
				  from '+@strDBName+'.dbo.CurrentCaseStatus where '+isnull(@FilterCondition,'1=1')
	
	PRINT(@RunSql)
	INSERT INTO #CurrentCaseStatus
	EXEC(@RunSql)

	SELECT GroupName
		  ,Program
		  ,Role
		  ,ClientName
		  ,CurrentCaseStatus
		  ,CaseNumber
		  ,PhaseName 
	FROM #CurrentCaseStatus
	ORDER BY ClientName

END

