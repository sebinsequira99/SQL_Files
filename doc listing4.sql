


--Document Listing
--======================================================================


IF exists (select 1 from sys.objects where name='usp_document_listing' and type='p')
DROP PROCEDURE dbo.usp_document_listing;

GO
CREATE PROCEDURE dbo.usp_document_listing(  
  @user_id				INT
, @description			VARCHAR(2000)
, @user_name			VARCHAR(100)
, @user_type			VARCHAR(100)
--, @filetag				NCHAR(4000)
--, @displayname			VARCHAR(500)
, @startrow				INT
, @endrow				INT)

AS
BEGIN

		CREATE TABLE #documents								( id			INT IDENTITY(1,1)
															, upload_id		INT
															, file_name		VARCHAR(8000)
															, description	VARCHAR(8000)
															, user_id1		INT
															, name			VARCHAR(100)
															, last_name		VARCHAR(50)
															, dateposted	DATETIME
															, upload_module	VARCHAR(8000)
															, upload_phase	INT
															, upload_stage	INT
															, upload_task	INT
															, group_name	VARCHAR(100)
															, user_type		VARCHAR(50)
															, editable		VARCHAR(1)
															, user_id2		INT
															, group_id		INT
															, dateposted2	DATETIME
															, approved_by	INT
															, filetag		NCHAR(2000)
															, phase_id		VARCHAR(50)
															, first_name	VARCHAR(50)
															, DisplayName	VARCHAR(200)
															, datepostedVal	DATETIME
															, ConnId		INT)

		--AGENCY
	
		DECLARE	@usertype varchar(20),@agency_id int,@group_id int,@connection_id int,@caseworker_parent_user_id int,@parent_id int
		SELECT	@usertype=user_type from user_accounts where user_id=@user_id
		SET		@agency_id=(SELECT agency_id from user_accounts where user_id=@user_id)
		SET		@group_id=(SELECT group_id FROM upload where user_id = @user_id)
		SET		@connection_id=(SELECT ConnectionId from upload where user_id=@user_id)
		SET		@caseworker_parent_user_id=(SELECT case_worker_parent_user_id from user_accounts where user_id=@user_id)
		SET		@parent_id=(SELECT parentid from caseworker_client where parentid=@user_id)

		IF (@usertype='agency')
		BEGIN
				INSERT INTO #documents	( upload_id
										, file_name
										, description
										, user_id1 
										, name 
										, last_name 
										, dateposted 
										, upload_module 
										, upload_phase 
										, upload_stage
										, upload_task 
										, group_name 
										, user_type
										, editable
										, user_id2 
										, group_id 
										, dateposted2 
										, approved_by 
										, filetag 
										, phase_id 
										, first_name 
										, datepostedVal 
										, ConnId)
								
				SELECT
								up.upload_id,
								up.file_name,
								up.description,
								up.user_id as user_id1,
								ua.first_name + ' ' + ua.last_name as name,
								ua.last_name,
								CONVERT(varchar(20), up.dateposted, 110) as dateposted,
								up.upload_module,
								up.upload_phase,
								up.upload_stage,
								up.upload_task,
								ug.group_name,    
								ua.user_type,
								up.editable,
								up.user_id as user_id2,
								up.group_id,
								CONVERT(varchar(20), up.dateposted, 100) as dateposted2,
								up.approved_by,
								up.filetag,
								up.phase_id,
								ua.first_name,
								up.dateposted as datepostedVal,
								up.ConnId

				FROM

								upload up
								JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)

				WHERE 

								(up.uploaded_by = ua.user_id )                                                
								AND (ua.agency_id = @agency_id 
								OR up.user_id in ( select user_id from user_accounts 
								WHERE case_worker_parent_user_id =@caseworker_parent_user_id
												 )
									 )
						




		END		

		--CASEWORKER

		ELSE IF (@usertype='agency_user')

		BEGIN

				INSERT INTO #documents								(upload_id
																	,file_name
																	,description
																	,user_id1 
																	,name 
																	,last_name 
																	,dateposted 
																	,upload_module 
																	,upload_phase 
																	,upload_stage
																	,upload_task 
																	,group_name 
																	,user_type
																	,editable
																	,user_id2 
																	,group_id 
																	,dateposted2 
																	,approved_by 
																	,filetag 
																	,phase_id 
																	,first_name 
																	,datepostedVal 
																	,ConnId)

				SELECT
												up.upload_id,
												up.file_name,
												up.description,
												up.user_id as user_id1,
												ua.first_name + ' ' + ua.last_name as name,
												ua.last_name,
												CONVERT(varchar(20), up.dateposted, 110) as dateposted,
												up.upload_module,
												up.upload_phase,
												up.upload_stage,
												up.upload_task,
												ug.group_name,
												ua.user_type,
												up.editable,
												up.user_id as user_id2,
												up.group_id,
												CONVERT(varchar(20), up.dateposted, 100) as dateposted2,
												up.approved_by,
												up.filetag,
												up.phase_id,
												ua.first_name,
												up.dateposted as datepostedVal,
												up.ConnId

				FROM

												upload up
												JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
												LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
												LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)

				WHERE
												(up.uploaded_by = ua.user_id )                                                
												AND ( up.uploaded_by = @parent_id
						
												OR up.user_id = @parent_id
												OR up.user_id = @user_id

												OR up.user_id in ( select user_id from user_accounts where case_worker=@user_id )
                  								OR (up.user_id = @caseworker_parent_user_id
												AND (up.group_id is NUll or up.group_id = 0)
												   )
                  								OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = @user_id)
												   ) 
							




		END

		--ADOPTIVE PARENT

		ELSE IF (@usertype='adoptive_parent')

		BEGIN

				INSERT INTO #documents		(upload_id
											,file_name
											,description
											,user_id1 
											,name 
											,last_name 
											,dateposted 
											,upload_module 
											,upload_phase 
											,upload_stage
											,upload_task 
											,group_name 
											,user_type
											,editable
											,user_id2 
											,group_id 
											,dateposted2 
											,approved_by 
											,filetag 
											,phase_id 
											,first_name 
											,datepostedVal 
											,ConnId)

								
					SELECT
							up.upload_id,
							up.file_name,
							up.description,
							up.user_id as user_id1,
							ua.first_name + ' ' + ua.last_name as name,
							ua.last_name,
							CONVERT(varchar(20), up.dateposted, 110) as dateposted,
							up.upload_module,
							up.upload_phase,
							up.upload_stage,
							up.upload_task,
							ug.group_name,
							ua.user_type,
							up.editable,
							up.user_id as user_id2,
							up.group_id,
							CONVERT(varchar(20), up.dateposted, 100) as dateposted2,
							up.approved_by,
							up.filetag,
							up.phase_id,
							ua.first_name,
							up.dateposted as datepostedVal,
							up.ConnId


					FROM

							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
							LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)


					WHERE

						(up.uploaded_by = ua.user_id  
						AND (up.ConnectionId = @connection_id 
						OR up.ConnectionId = 0 OR up.ConnectionId is NULL
							) 
						)                                                
						AND (up.uploaded_by = @user_id
						OR up.user_id = @user_id
						OR up.user_id = @user_id 
						OR up.group_id = @group_id
							)  
						AND upload_id not in (
						SELECT upload_id from upload up 
						WHERE  ( up.user_id = @user_id  OR up.group_id=@group_id
							   ) 
						AND (up.ConnectionId = @connection_id
						OR  up.ConnectionId is Null OR up.ConnectionId = 0
							)
						AND donotShowCasenote = 1 
						AND upload_phase = 0 
						AND upload_stage = 0 
						AND upload_task =  0
											 )
								

		END								

		SELECT			  SCOPE_IDENTITY() as total_count											
						, upload_id
						, file_name
						, description
						, user_id1 
						, name 
						, last_name 
						, dateposted 
						, upload_module 
						, upload_phase 
						, upload_stage
						, upload_task 
						, group_name 
						, user_type
						, editable
						, user_id2 
						, group_id 
						, dateposted2 
						, approved_by 
						, filetag 
						, phase_id 
						, first_name 
						, datepostedVal 
						, ConnId
						, dbo.udf_CoupleName(Connid,1,1,'Unknown',0,0) as DisplayName

		FROM #documents	

		WHERE (id>=@startrow AND id<=@endrow)
				AND ((description like case when(isnull(@description,'')!='') then ('%' + @description + '%') else description end))
				AND ((name like case when(isnull(@user_name,'')!='') then ('%' + @user_name + '%') else name end))
				AND ((user_type like case when(isnull(@user_type,'')!='') then ('%' + @user_type + '%') else user_type end))
				--AND ((filetag like case when(isnull(@filetag,'')!='') then ('%' + @filetag + '%') else filetag end))
				--AND ((displayname like case when(isnull(@displayname,'')!='') then ('%' + @displayname + '%') else displayname end))

END


EXEC dbo.usp_document_listing
						   @user_id='257'
						  ,@description=''
						  ,@user_name=''
						  ,@user_type=''
						  --,@filetag=''
						  --,@displayname=''
						  ,@startrow='1'
						  ,@endrow='100'
						  ;
