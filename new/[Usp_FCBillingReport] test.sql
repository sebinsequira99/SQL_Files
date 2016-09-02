


--1. FromDate <= Startdate And EndDate Is Null
--	 ToDate - Startdate
--2. FromDate > Startdate And EndDate Is Null
--	 ToDate - FromDate
--3.  FromDate <= Startdate And ToDate>=EndDate 
--	 EndDate - Startdate
--4.  FromDate > Startdate And ToDate>=EndDate 
--	 EndDate - FromDate
--5.  FromDate <= Startdate And ToDate<EndDate 
--	 ToDate - Startdate
--6.  FromDate > Startdate And ToDate<EndDate 
--	 ToDate - FromDate

/*
[Usp_FCBillingReport] 227,0,0,'Billing_Date Between ''2016-01-11'' And ''2016-01-24'''
[Usp_FCBillingReport] 227,0,0,'Billing_Date = ''2015-12-28'''
[Usp_FCBillingReport] 227,0,0,'Billing_Date Like ''%2015-12-28%'''
*/
ALTER PROC [dbo].[Usp_FCBillingReport] 
   @AgencyId INT =0 
  ,@UserId INT=0
  ,@ReportId INT=0
  ,@FilterCondition VARCHAR(MAX)=NULL
  AS  
  -- (C) Faisal On 11-01-2016 For Foster Care Agency Billing Report
  -- (M) Faisal On 22-01-2016 Bringing all open cases in billing date range.
BEGIN
	SET NOCOUNT ON
	DECLARE @strDBName VARCHAR(20)
			,@RunSql NVARCHAR(MAX)
			,@ToDT As Varchar(10) = NULL
			,@ToDate As DATE = NULL
			,@FromDT As Varchar(10) = NULL
			,@FromDate As DATE = NULL
			,@FilterCondition1 VARCHAR(MAX)
			,@FilterCondition2 VARCHAR(MAX)
	--		,@AgencyId INT =227 
	--	    ,@UserId INT=0
	--	    ,@ReportId INT=0
	--	    ,@FilterCondition VARCHAR(MAX)='[Case Start Date] Between ''2015-12-07'' And ''2016-01-10'''			
	
	-- For Getting DB Name 
	SELECT  DISTINCT @strDBName= '['+[DBName]+']'         
	FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
	WHERE SiteID=Cast(@AgencyId AS VARCHAR(20))

	INSERT INTO Reportlog (AgencyID ,
						Reportid ,
						Userid ,
						FilterCondition ,
						Createddate)
						SELECT @AgencyId,@ReportId,@UserId,@FilterCondition,GETDATE()

	-- For Storing Contact Detais
	CREATE TABLE [dbo].[#TmpContact]([ContactId] [INT] NOT NULL,[Address1] [NVARCHAR](150) ,
	[Address2] [NVARCHAR](150) ,[City] [NVARCHAR](100) ,[Zip] [NVARCHAR](50) ,[State] [NVARCHAR](50)  ) 
	-- For Report OutPut
	CREATE TABLE [dbo].[#TmpFCRpt] ([Family] VARCHAR(300), [Family Adress] NVARCHAR(1000), [Child] VARCHAR(300), [Age Group] TINYINT, 
	[DOC Level] NVARCHAR(1000),[Case NO] VARCHAR(300),[No Of Days] INT, [Office Number] VARCHAR(150), [Case Start Date] DATE,
	[Case End Date] DATE,[Status] VARCHAR(50), Billing_Date DATE,Age INT, ContactID INT, ConnectionID INT, [User_ID] INT   ) 
	-- Assigning Todate
	IF @FilterCondition Is Not NULL
	BEGIN
		SET @FilterCondition1 = REPLACE(@FilterCondition, 'Billing_Date','Cast(isnull(Case When b.deletedate = ''1900-01-01'' Then NULL Else b.deletedate End,getdate()) As Date)')
		SET @FilterCondition2 = 'Case When b.RelEndDate = ''1900-01-01'' Then NULL Else b.deletedate End'
		SET @FilterCondition = REPLACE(@FilterCondition, 'Billing_Date','Cast( b.PlacementDate End As Date)')

		--SET @TmpFilter = SUBSTRING(@FilterCondition,PATINDEX('%____-__-__%',@FilterCondition),27)
		SET @ToDT = SubString(@FilterCondition,CHARINDEX('And ',@FilterCondition)+5,10) 
		SET @ToDate = TRY_PARSE(@ToDT As DATE)

		SET @FromDT = SubString(@FilterCondition,CHARINDEX('Between ',@FilterCondition)+9,10) 
		SET @FromDate = TRY_PARSE(@FromDT As DATE)

	END
	SET @RunSql = 'INSERT INTO [#TmpContact] (ContactID) SELECT DISTINCT ContactID FROM '+ @strDBName + '.Dbo.Rel_Relationship WHERE RelationshipTypeId =-101'
	EXEC(@RunSql)
	-- Updating Contact Details 
	SET @RunSql =	'UPDATE tc
	SET  Address1= ISNULL(ca.Address1,''''), Address2=ISNULL(ca.Address2,''''), 
	City= ISNULL(ca.City,''''),Zip=ISNULL(ca.Zip,''''), [State]=ISNULL(ls.StateName,'''') 
	FROM [#TmpContact] tc
	LEFT JOIN  '+ @strDBName + '.Dbo.ContactAddress ca ON tc.ContactId = ca.ContactId 
	AND (ca.MailingAddress = 1  OR (
	ca.MailingAddress=0 AND NOT EXISTS(SELECT 1 FROM  '+ @strDBName + '.Dbo.ContactAddress cad WHERE cad.MailingAddress=1 AND cad.contactid = tc.ContactId)))
	LEFT JOIN  '+ @strDBName + '.Dbo.lkpState ls ON ca.StateId = ls.StateId'

	EXEC(@RunSql)
	---- Selecting Family and child and Applying Filter
	--SET @RunSql =	'SELECT REPLACE(a.DisplayName, ''amp;'','''') Family,dbo.[udf_AddressConcat](ca.Address1,ca.Address2,ca.City,ca.Zip,ca.State)	As AddressF,
	--				b.DisplayName Child, NULL,Null,b.RelLabel CaseNo,NULL,NULL, Case When b.PlacementDate Is Null Then b.RelationshipDateLastUpdated Else b.PlacementDate End STDate, Case When b.RelEndDate = ''1900-01-01'' Then NULL Else b.RelEndDate End EndDate ,NULL,
	--				CONVERT(INT,ROUND(DATEDIFF(hour, case cb.BirthDate when ''1900-01-01'' THEN NULL Else cb.BirthDate End,GETDATE())/8766.0,0)) AS Age,
	--				a.ConnectionId, b.User_ID,b.ContactId  
	--				FROM (SELECT *  FROM '+ @strDBName + '.Dbo.Rel_Relationship WHERE RelationshipTypeId in (-101)) a Inner Join 
	--				(SELECT *  FROM '+ @strDBName + '.Dbo.Rel_Relationship WHERE RelationshipTypeId in (-104)) b On a.ConnectionID = b.ConnectionID
	--				LEFT JOIN [#TmpContact] ca On a.ContactId = ca.ContactId
	--				LEFT JOIN '+ @strDBName + '.Dbo.Contact cb On b.ContactId = cb.ContactId
	--				WHERE ' + ISNULL(@FilterCondition,'1=1')  + ' OR ' + ISNULL(@FilterCondition1,'1=1' ) + ' OR ' + ISNULL(@FilterCondition2,'1=1' )

	--				--WHERE '+ ISNULL(@FilterCondition,' 1=1 Order By a.DisplayName')

					-- Selecting Family and child and Applying Filter
	SET @RunSql =	'SELECT REPLACE(a.DisplayName, ''amp;'','''') Family,dbo.[udf_AddressConcat](ca.Address1,ca.Address2,ca.City,ca.Zip,ca.State)	As AddressF,
					c.DisplayName Child, NULL,Null,c.RelLabel CaseNo,NULL,NULL, b.PlacementDate STDate, Case When b.deletedate = ''1900-01-01'' Then NULL Else b.deletedate End EndDate ,NULL,
					CONVERT(INT,ROUND(DATEDIFF(hour, case cb.BirthDate when ''1900-01-01'' THEN NULL Else cb.BirthDate End,GETDATE())/8766.0,0)) AS Age,
					a.ConnectionId, c.User_ID,c.ContactId  
					FROM (SELECT *  FROM '+ @strDBName + '.Dbo.Rel_Relationship WHERE RelationshipTypeId in (-101)) a Inner Join 
					'+ @strDBName + '.Dbo.rel_placementtrack  b On a.connid = b.parentconnid
					inner join (SELECT *  FROM '+ @strDBName + '.Dbo.Rel_Relationship WHERE RelationshipTypeId in (-104)) c On b.ConnectionID = c.ConnectionID
					and b.connid=c.connid
					LEFT JOIN [#TmpContact] ca On a.ContactId = ca.ContactId
					LEFT JOIN '+ @strDBName + '.Dbo.Contact cb On b.ContactId = cb.ContactId
					WHERE ' + ISNULL(@FilterCondition,'1=1')  + ' OR ' + ISNULL(@FilterCondition1,'1=1' ) + ' OR ' + ISNULL(@FilterCondition2,'1=1' )

					--WHERE '+ ISNULL(@FilterCondition,' 1=1 Order By a.DisplayName')
				PRINT @RunSql
	INSERT INTO [#TmpFCRpt]([Family] , [Family Adress], [Child] , [Age Group], [DOC Level] ,[Case NO] ,[No Of Days] ,
	[Office Number] , [Case Start Date] ,[Case End Date] ,[Status],Age , ConnectionID , [User_ID], ContactID  )
	EXEC(@RunSql)
	-- Updating No Of Days
	IF @ToDate Is NULL
		SET @ToDT = CONVERT(VARCHAR(10),GETDATE(),121)
	Set @RunSql = 'UPDATE [#TmpFCRpt] SET [Age Group] = CASE WHEN IsNull(age,0) BETWEEN 0 and 12 THEN 1 ELSE 2 END,
	[Status] = CASE WHEN [Case End Date] IS NULL THEN ''Open'' ELSE ''Closed'' END ,[Billing_Date] = [Case Start Date], 
	[No Of Days] = DATEDIFF(Day,[Case Start Date],CASE WHEN [Case End Date] < ''' + @ToDT + ''' THEN [Case End Date] ELSE ''' + @ToDT + ''' END) '
	--PRINT @RunSql
	EXEC(@RunSql)
	-- Updating Doc Level( Child Level) From Disability
	Set @RunSql = 'UPDATE aa SET [DOC Level] = dd.SubItemName
	FROM [#TmpFCRpt] aa 
	INNER JOIN (
	SELECT MAX(QBChildDisabilityId) QBChildDisabilityId,connectionId, [User_ID] 
	FROM  '+ @strDBName + '.Dbo.qbChildDisabilities Group By connectionId, [USer_ID] ) bb 
	ON aa.connectionId = bb.connectionId AND aa.[User_ID] = bb.[User_ID]
	LEFT JOIN  '+ @strDBName + '.Dbo.qbChildDisabilities cc On bb.QBChildDisabilityId = cc.QBChildDisabilityId
	LEFT JOIN  '+ @strDBName + '.Dbo.QBSubProducts dd On cc.QBSubProductId = dd.QBSubProductId'
	--PRINT @RunSql
	EXEC(@RunSql)
	-- Updating Child Office Number
	Set @RunSql = 'UPDATE xx SET [Office Number] = zz.OfficeNumber
	FROM [#TmpFCRpt] xx 
	INNER JOIN (
	SELECT MAX(QBChildOfficeId) QBChildOfficeId,connectionId, [User_ID] 
	FROM '+ @strDBName + '.Dbo.qbchildoffices Group By connectionId, [USer_ID] ) yy 
	ON xx.connectionId = yy.connectionId And xx.[User_ID] = yy.[User_ID]
	INNER JOIN '+ @strDBName + '.Dbo.qbchildoffices zz On yy.QBChildOfficeId = zz.QBChildOfficeId'
	--PRINT @RunSql
	EXEC(@RunSql)

	SELECT * into #result FROM #TmpFCRpt Order By Family

	alter table #result
	add fromdate datetime

	alter table #result
	add todate datetime

	update #result
	set fromdate=@FromDate
	   ,todate=@ToDate
	
	update #result
	set [No Of Days]=case when Fromdate <=[Case Start Date] and [Case End Date] is null
						  then DATEDIFF(day,[Case Start Date],todate)
						  when FromDate > [Case Start Date] And [Case End Date] Is Null
						  then DATEDIFF(day,fromdate,todate)
						  when FromDate <= [Case Start Date] And ToDate>=[Case End Date] 
						  then DATEDIFF(day,[Case Start Date],[Case End Date])
						  when FromDate > [Case Start Date] And ToDate>=[Case End Date]
						  then DATEDIFF(day,fromdate,[Case End Date])
						  when FromDate <= [Case Start Date] And ToDate<[Case End Date] 
						  then DATEDIFF(day,[Case Start Date],ToDate)
						  when FromDate > [Case Start Date] And ToDate<[Case End Date]  
						  then DATEDIFF(day,fromdate,ToDate)
					  end

	select * from #result Order By Family
		
	SET NOCOUNT OFF
		
END


