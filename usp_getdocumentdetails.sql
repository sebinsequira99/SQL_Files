Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC USP_GetDocumentDetails '17129','a','a','a','','','','0','100'
CREATE PROCEDURE USP_GetDocumentDetails
	  @UserId		INT = 0
	, @Description  VARCHAR(MAX) = ''
	, @Name			VARCHAR(250) = ''
    , @GroupName    VARCHAR(250) = ''
	, @filetag      VARCHAR(250) = ''
	, @UserType     VARCHAR(250) = ''
	, @Connectionid INT			 = 0
	, @StRow        INT			 = 0
	, @EndRow       INT			 = 100
AS
BEGIN
DECLARE @LoginUserType	VARCHAR(50)	
DECLARE @Agencyid		INT 
DECLARE @DescriptionYN	BIT
DECLARE @NameYN			BIT
DECLARE @GroupNameYN	BIT
DECLARE @filetagYN		BIT
DECLARE @UserTypeYN		BIT
DECLARE @TotalCount INT
SELECT @Agencyid = agency_id FROM user_agencies
SELECT LoginUserType = user_type FROM User_accounts WHERE user_id =   17129

SET @DescriptionYN	= 0
SET @NameYN			= 0
SET @GroupNameYN	= 0
SET @filetagYN		= 0
SET @UserTypeYN		= 0

IF(ISNULL(@Description,'')='')
SET @DescriptionYN = 1
IF(ISNULL(@Name,'')='')
SET @NameYN = 1
IF(ISNULL(@GroupName,'')='')
SET @GroupNameYN = 1
IF(ISNULL(@filetag,'')='')
SET @filetagYN = 1
IF(ISNULL(@UserType,'')='')
SET @UserTypeYN = 1

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
									, documenttype      VARCHAR(1))
IF(@LoginUserType  = 'agency')
	BEGIN
	SELECT				
								@TotalCount = COUNT(1)

							FROM
								upload up
								INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
							WHERE
								(up.uploaded_by = ua.user_id 
								AND ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )                                  
									 AND ((ua.first_name LIKE  '%'+@Name+'%' OR 1 = @NameYN)  OR (ua.last_name LIKE '%'+@Name+'%' OR 1 = @NameYN) )                                                                                          
								     AND (
										  (ug.group_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) 	OR (
																											(upto.first_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN)																																	
																											 OR(upto.last_name LIKE '%'+@GroupName+'%' OR 1 = 	@GroupNameYN)
																										   )
										 )															
								AND (up.filetag LIKE '%'+@filetag+'%' OR 1 = @filetagYN)
								AND (ua.user_type LIKE @UserType OR 1 = @UserTypeYN)
								    )
							   )AND (ua.agency_id = @Agencyid OR up.user_id in ( SELECT user_id FROM user_accounts WHERE case_worker_parent_user_id = 8125 ))
					           

	SET ROWCOUNT  @EndRow
			INSERT INTO	#TmpDocumentDetails( upload_id	,file_name, description	, user_id1, name, last_name, dateposted, upload_module, upload_phase, upload_stage	
											, upload_task, group_name, user_type, editable, user_id2, group_id, dateposted2, approved_by	
											, filetag, phase_id	, first_name, DisplayName, datepostedVal, ConnId,documenttype)		
				
	
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
								, dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName
								, up.dateposted as datepostedVal
								, up.ConnId
								, up.document_type

							FROM
								upload up
								INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
							WHERE
								(up.uploaded_by = ua.user_id 
								AND ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )                                  
									 AND ((ua.first_name LIKE  '%'+@Name+'%' OR 1 = @NameYN)  OR (ua.last_name LIKE '%'+@Name+'%' OR 1 = @NameYN) )                                                                                          
								     AND (
										  (ug.group_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) 	OR (
																											(upto.first_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN)																																	
																											 OR(upto.last_name LIKE '%'+@GroupName+'%' OR 1 = 	@GroupNameYN)
																										   )
										 )															
								AND (up.filetag LIKE '%'+@filetag+'%' OR 1 = @filetagYN)
								AND (ua.user_type LIKE @UserType OR 1 = @UserTypeYN)
								    )
							   )AND (ua.agency_id = @Agencyid OR up.user_id in ( SELECT user_id FROM user_accounts WHERE case_worker_parent_user_id = 8125 ))
					            ORDER BY up.upload_id DESC
			SET ROWCOUNT 0

	END
	ELSE IF(@LoginUserType  = 'agency_user')
	BEGIN

	     SELECT @TotalCount = COUNT(1)
					  
      FROM
       upload up
       INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
	   LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
       LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
      WHERE
       (up.uploaded_by = ua.user_id AND 
	   ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )  
	   AND ((ua.first_name LIKE  '%'+@Name+'%' OR 1 = @NameYN) OR (ua.last_name LIKE '%'+@Name+'%' OR 1 = @NameYN)) 
	   AND ((ug.group_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) 
	   OR ((upto.first_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) OR (upto.last_name LIKE '%'+@GroupName+'%' OR 1 = 	@GroupNameYN))) 
	   AND ((up.filetag LIKE '%'+@filetag+'%' OR 1 = @filetagYN)) AND ((ua.user_type LIKE @UserType OR 1 = @UserTypeYN))))
	   AND (up.uploaded_by in (SELECT parentid AS user_id FROM caseworker_client WHERE caseworkerid = @UserId)
       or up.user_id in (SELECT parentid AS user_id FROM caseworker_client WHERE caseworkerid = @UserId)
       or up.user_id = @UserId OR up.user_id in ( select user_id from user_accounts where case_worker=@UserId )
       OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id=@UserId ) 
	   and (up.group_id is NUll or up.group_id = 0))
       OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = @UserId)
	 ) 
	 
	 SET ROWCOUNT  @EndRow

			INSERT INTO	#TmpDocumentDetails( upload_id	,file_name, description	, user_id1, name, last_name, dateposted, upload_module, upload_phase, upload_stage	
											, upload_task, group_name, user_type, editable, user_id2, group_id, dateposted2, approved_by	
											, filetag, phase_id	, first_name, DisplayName, datepostedVal, ConnId,documenttype)
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
					, dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName
					, up.dateposted as datepostedVal
					, up.ConnId
					, up.document_type
      FROM
       upload up
       INNER JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
	   LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
       LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
      WHERE
       (up.uploaded_by = ua.user_id AND 
	   ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )  
	   AND ((ua.first_name LIKE  '%'+@Name+'%' OR 1 = @NameYN) OR (ua.last_name LIKE '%'+@Name+'%' OR 1 = @NameYN)) 
	   AND ((ug.group_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) 
	   OR ((upto.first_name LIKE '%'+@GroupName+'%' OR 1 = @GroupNameYN) OR (upto.last_name LIKE '%'+@GroupName+'%' OR 1 = 	@GroupNameYN))) 
	   AND ((up.filetag LIKE '%'+@filetag+'%' OR 1 = @filetagYN)) AND ((ua.user_type LIKE @UserType OR 1 = @UserTypeYN))))
	   AND (up.uploaded_by in (SELECT parentid AS user_id FROM caseworker_client WHERE caseworkerid = @UserId)
       or up.user_id in (SELECT parentid AS user_id FROM caseworker_client WHERE caseworkerid = @UserId)
       or up.user_id = @UserId OR up.user_id in ( select user_id from user_accounts where case_worker=@UserId )
       OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id=17129 ) 
	   and (up.group_id is NUll or up.group_id = 0))
       OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = 17129)
	 ) 
	 ORDER BY up.upload_id DESC
	
	  SET ROWCOUNT 0
	END
	ELSE 
	BEGIN
	  
	 SELECT
				@TotalCount = COUNT(1)
      FROM
       upload up
       JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
       LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
       LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
      WHERE
       (up.uploaded_by = ua.user_id AND 
	   ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )) AND (up.ConnectionId = @Connectionid OR up.ConnectionId = 0 OR up.ConnectionId is NULL))                                                
        AND (up.uploaded_by = @UserId or up.user_id in (@UserId) or up.user_id in (@UserId)  
        OR up.group_id in (SELECT Group_id FROM user_effectivedate WHERE User_ID = @UserId))  AND upload_id not in (
                            select upload_id from upload up where  ( up.user_id  =@UserId  OR up.group_id in 
							(SELECT Group_id FROM user_effectivedate WHERE User_ID = @UserId)) 
                            AND (up.ConnectionId = @Connectionid OR  up.ConnectionId is Null OR up.ConnectionId = 0)
                            AND donotShowCasenote = 1 
                            AND upload_phase = 0 
                            AND upload_stage = 0 
                            AND upload_task =  0 
                            )
							
	 SET ROWCOUNT  @EndRow
	 INSERT INTO	#TmpDocumentDetails( upload_id	,file_name, description	, user_id1, name, last_name, dateposted, upload_module, upload_phase, upload_stage	
											, upload_task, group_name, user_type, editable, user_id2, group_id, dateposted2, approved_by	
											, filetag, phase_id	, first_name, DisplayName, datepostedVal, ConnId,documenttype)
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
				, dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName
				, up.dateposted as datepostedVal
				, up.ConnId
				, up.document_type
      FROM
       upload up
       JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
       LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
       LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)
      WHERE
       (up.uploaded_by = ua.user_id AND 
	   ((up.description LIKE  '%'+@Description+'%' OR 1 = @DescriptionYN )) AND (up.ConnectionId = @Connectionid OR up.ConnectionId = 0 OR up.ConnectionId is NULL))                                                
        AND (up.uploaded_by = @UserId or up.user_id in (@UserId) or up.user_id in (@UserId)  
        OR up.group_id in (SELECT Group_id FROM user_effectivedate WHERE User_ID = @UserId))  AND upload_id not in (
                            select upload_id from upload up where  ( up.user_id  =@UserId  OR up.group_id in 
							(SELECT Group_id FROM user_effectivedate WHERE User_ID = @UserId)) 
                            AND (up.ConnectionId = @Connectionid OR  up.ConnectionId is Null OR up.ConnectionId = 0)
                            AND donotShowCasenote = 1 
                            AND upload_phase = 0 
                            AND upload_stage = 0 
                            AND upload_task =  0 
                            )
							 ORDER BY up.upload_id DESC

			SET ROWCOUNT 0
	END

	SELECT Upload_id,File_name, Description	, User_id1, Name, Last_name, Dateposted, Upload_module, Upload_phase, Upload_stage	
		, Upload_task, Group_name, User_type, Editable, User_id2, Group_id, Dateposted2, Approved_by	
		, Filetag, Phase_id	, First_name, Displayname, DatepostedVal, ConnId ,Documenttype,@TotalCount AS TotalCount
		FROM #TmpDocumentDetails
		WHERE ID >  @StRow  AND ID <=  @EndRow 
		--ORDER BY  Id desc
END




