
Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_GetDocumentDetails]
	  @UserId		INT = 0
	, @Description  VARCHAR(MAX) = ''
	, @Name			VARCHAR(250) = ''
    , @GroupName    VARCHAR(250) = ''
	, @filetag      VARCHAR(250) = ''
	, @UserType     VARCHAR(250) = ''
	, @Connectionid INT			 = 0
	, @StRow        INT			 = 0
	, @EndRow       INT			 = 100
	, @OrderBy      Varchar(500) = 'UploadOn'--UploadOn/Description/UploadedBy/Users/FileTag/UserType
	, @OrderByDirection Varchar(10) = 'A' --D for Descending 
										  --A for Ascending
AS
BEGIN
DECLARE @LoginUserType	VARCHAR(50)	
DECLARE @Agencyid		INT 
DECLARE @TotalCount INT
DECLARE @setting INT
DECLARE @Filter VARCHAR(3)=''


CREATE TABLE #CaseWorkers(parentId INT)

SELECT @Agencyid = agency_id FROM user_agencies
SELECT @LoginUserType = user_type,@setting= CASE user_type 
						WHEN 'agency' THEN 1 
						ELSE 0 
						END  FROM User_accounts WHERE user_id =   @UserId

IF(ISNULL(@Description,'')!='')
	SET @Description = '%'+@Description+'%'
IF(ISNULL(@Name,'')!='')
	SET @Name = '%'+@Name+'%'
IF(ISNULL(@GroupName,'') != '')
	SET @GroupName = '%'+@GroupName+'%'
IF(ISNULL(@filetag,'')!='')
	SET @filetag = '%'+@filetag+'%'



--*************CW Security ********************Start***************
    
    IF(@setting =0)     
	BEGIN
		SELECT  @setting=setting 
		FROM system_settings 
		WHERE useroption =cast(@UserId as varchar(10))+'_cw_cwsecurity' 
	END 

	IF (@Setting=4)  -- Individual 
	BEGIN	
		SET @Filter='ind'
		INSERT INTO #CaseWorkers(parentid) SELECT parentid FROM CaseWorker_Client WHERE caseworkerid=@UserId
	END
	ELSE IF (@Setting=3)   -- Have grp permission
	BEGIN
		SET @Filter='Grp'
		INSERT INTO #CaseWorkers(parentid) 
		SELECT DISTINCT parentid 
		FROM CaseWorker_Client C INNER JOIN group_caseworkers g ON C.caseworkerid=g.caseworker_id
		INNER JOIN group_caseworkers g1  ON g.group_id=g1.group_id
		WHERE g1.caseworker_id=@UserId		
	END
	ELSE 
	BEGIN    -- Admin or all permission
		SET @Filter='All'
	END 
		
--*************CW Security ********************End***************
	
	 


CREATE TABLE #TmpDocumentDetails (    Id				INT				IDENTITY(1,1) 
									, upload_id			INT
									, file_name			VARCHAR(MAX)
									, description		VARCHAR(MAX)
									, user_id1			INT
									, name				VARCHAR(MAX)
									, last_name			VARCHAR(MAX)
									, dateposted		VARCHAR(20)
									, upload_module		VARCHAR(MAX)
									, upload_phase		INT
									, upload_stage		INT
									, upload_task		INT
									, group_name		VARCHAR(100)
									, user_type			VARCHAR(50)
									, editable			VARCHAR(1)
									, user_id2			INT
									, group_id			INT
									, dateposted2		VARCHAR(20)
									, approved_by		INT
									, filetag			NCHAR(2000)
									, phase_id			VARCHAR(50)
									, first_name		VARCHAR(MAX)
									, DisplayName		VARCHAR(MAX)
									, datepostedVal		DATETIME
									, ConnId			INT
									, documenttype      VARCHAR(1)
									, user_type2        VARCHAR(50)
									, UAConnid			INT )
			
			--select CURRENT_TIMESTAMP


			SELECT		@TotalCount =	 	COUNT(*)
						FROM
								upload up
								INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
								--LEFT JOIN vw_caseworker_client c ON c.parentid = up.user_id

						WHERE

						
						--new where
						( @Description = '' OR up.description LIKE  @Description  )
							AND 
						(@filetag = '' OR up.filetag LIKE @filetag)   
							AND 
						(@Name = '' OR ( ua.first_name LIKE  @Name OR ua.last_name LIKE @Name)) 
							AND 
						( @UserType = '' OR ua.user_type = @UserType ) 
							AND
						( @GroupName = '' OR (ug.group_name LIKE @GroupName OR  upto.first_name LIKE @GroupName OR upto.last_name LIKE @GroupName)) 
							AND
						(@LoginUserType != 'agency' OR (@LoginUserType = 'agency' AND ua.agency_id = @Agencyid))
							AND
						(@LoginUserType != 'agency_user' OR ( @LoginUserType = 'agency_user' 
									AND
								(
									(up.user_id = @UserId)--to get all document uploaded for the logged in user
									--OR 	(c.caseworkerid = @userId)--to get documents of clients who are under logged in CW
									--CW security
									OR  
									( 
										(
											(@Filter= 'grp' OR @Filter= 'ind') AND EXISTS (SELECT 1 FROM #CaseWorkers where parentid=up.user_id)
										)
										OR @Filter = 'all'						 
									) 									
								)
							)
						)
							AND
						(@LoginUserType != 'adoptive_parent' OR (@LoginUserType = 'adoptive_parent'	AND					
								(@Connectionid=0 OR up.ConnectionId = @Connectionid OR up.ConnectionId = 0 OR up.ConnectionId is NULL)    
								AND	up.user_id = @UserId--to get all document uploaded for the logged in user
								AND NOT (ISNULL(up.donotShowCasenote,0)= 1 AND up.upload_phase = 0 AND up.upload_stage = 0 AND up.upload_task =  0) --to hide documents created via CI list form
								
							)
						)
						

						--select CURRENT_TIMESTAMP

			SET ROWCOUNT  @EndRow					  
			INSERT INTO	#TmpDocumentDetails( upload_id	,file_name, description	, user_id1, name, last_name, dateposted, upload_module, upload_phase, upload_stage	
											, upload_task, group_name, user_type, editable, user_id2, group_id, dateposted2, approved_by	
											, filetag, phase_id	, first_name, DisplayName, datepostedVal, ConnId,documenttype,user_type2,UAConnid)		
				SELECT				
								  up.upload_id
								, up.file_name
								, up.description
								, up.user_id as user_id1
								, ua.first_name + ' ' + ua.last_name as name
								, ua.last_name
								, CONVERT(varchar(20), up.dateposted, 110) as dateposted
								, up.upload_module
								, up.upload_phase
								, up.upload_stage
								, up.upload_task
								, ug.group_name
								, ua.user_type
								, up.editable
								, up.user_id as user_id2
								, up.group_id
								, CONVERT(varchar(20), up.dateposted, 100) as dateposted2
								, up.approved_by
								, up.filetag
								, up.phase_id
								, ua.first_name
								,'' as DisplayName
								--, dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName
								, up.dateposted as datepostedVal
								, up.ConnId
								, up.document_type
								, upto.user_type AS user_type2
								, ua.Connid
						FROM
								upload up
								INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
								--LEFT JOIN vw_caseworker_client c ON c.parentid = up.user_id
						WHERE


						--new where
						( @Description = '' OR up.description LIKE  @Description  )
							AND 
						(@filetag = '' OR up.filetag LIKE @filetag)   
							AND 
						(@Name = '' OR ( ua.first_name LIKE  @Name OR ua.last_name LIKE @Name)) 
							AND 
						( @UserType = '' OR ua.user_type = @UserType ) 
							AND
						( @GroupName = '' OR (ug.group_name LIKE @GroupName OR  upto.first_name LIKE @GroupName OR upto.last_name LIKE @GroupName)) 
							AND
						(@LoginUserType != 'agency' OR (@LoginUserType = 'agency' AND ua.agency_id = @Agencyid))   -- Agency Administrator
							AND
						(@LoginUserType != 'agency_user' OR ( @LoginUserType = 'agency_user'						--	Case Worker
									AND
								(
									(up.user_id = @UserId)--to get all document uploaded for the logged in user
									--OR 	(c.caseworkerid = @userId)--to get documents of clients who are under logged in CW
									--CW security
									OR  
									( 
										(
											(@Filter= 'grp' OR @Filter= 'ind') AND EXISTS (SELECT 1 FROM #CaseWorkers where parentid=up.user_id)
										)
										OR @Filter = 'all'						 
									) 									
								)
							)
						)
							AND
						(@LoginUserType != 'adoptive_parent' OR (@LoginUserType = 'adoptive_parent'	AND					-- End user(AP,BP,CH)
								(@Connectionid=0 OR up.ConnectionId = @Connectionid OR up.ConnectionId = 0 OR up.ConnectionId is NULL)    
								AND	up.user_id = @UserId--to get all document uploaded for the logged in user
								AND NOT (ISNULL(up.donotShowCasenote,0)= 1 AND up.upload_phase = 0 AND up.upload_stage = 0 AND up.upload_task =  0) --to hide documents created via CI list form
								
							)
						)
						
							
						--ends
						 
								
							
						ORDER BY up.upload_id DESC
						--select CURRENT_TIMESTAMP

	SET ROWCOUNT 0
	UPDATE    #TmpDocumentDetails SET DisplayName = dbo.udf_CoupleName(UAConnid,1,1,'Unknown',0,0)
	WHERE ID >  @StRow  AND ID <=  @EndRow 

	SELECT Upload_id,File_name, Description	, User_id1, Name, Last_name, Dateposted, Upload_module, Upload_phase, Upload_stage	
		, Upload_task, Group_name, User_type, Editable, User_id2, Group_id, Dateposted2, Approved_by	
		, Filetag, Phase_id	, First_name, Displayname, DatepostedVal, ConnId ,Documenttype,user_type2,@TotalCount AS TotalCount, CAST(floor(abs(ISNULL(ConnId,0))/10000) AS VARCHAR)+'/'+CAST(floor(abs(ISNULL(ConnId,0))) AS VARCHAR) AS filePath
		FROM #TmpDocumentDetails
		WHERE ID >  @StRow  AND ID <=  @EndRow 
		ORDER BY			
				CASE WHEN @OrderBy ='UploadOn'	AND  @OrderByDirection = 'D'
					THEN Dateposted END DESC,
				CASE WHEN @OrderBy ='UploadOn' AND  @OrderByDirection = 'A'
					THEN Dateposted END ASC,
				CASE WHEN @OrderBy = 'Description' AND  @OrderByDirection ='D' 
					THEN Description END DESC,
				CASE WHEN @OrderBy ='Description' AND  @OrderByDirection = 'A'
					THEN Description END ASC,
				CASE WHEN @OrderBy ='UploadedBy' AND  @OrderByDirection ='D'
					THEN Name END DESC,
				CASE WHEN @OrderBy ='UploadedBy' AND  @OrderByDirection = 'A'
					THEN Name END ASC,
				CASE WHEN @OrderBy ='Users' AND  @OrderByDirection ='D'
					THEN Displayname END DESC,
				CASE WHEN @OrderBy ='Users' AND  @OrderByDirection = 'A'
					THEN Displayname END ASC,
				CASE WHEN @OrderBy ='FileTag' AND  @OrderByDirection = 'D'
					THEN LEFT(Filetag,100) END DESC,
				CASE WHEN @OrderBy ='FileTag' AND  @OrderByDirection = 'A'
					THEN LEFT(Filetag,100) END ASC,
				CASE WHEN @OrderBy ='UserType' AND  @OrderByDirection = 'D'
					THEN User_type END DESC,
				CASE WHEN @OrderBy ='UserType' AND  @OrderByDirection = 'A'
					THEN User_type END ASC
					
  		DROP TABLE #TmpDocumentDetails
		DROP TABLE #CaseWorkers
		--select CURRENT_TIMESTAMP

END

