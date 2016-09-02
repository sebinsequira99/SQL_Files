


--Document Listing
--======================================================================


IF exists (select 1 from sys.objects where name='usp_document_listing' and type='p')
DROP PROCEDURE usp_document_listing;


CREATE PROCEDURE usp_document_listing(@user_id int
										,@agency_id int
										,@case_worker_parent_user_id int
										,@group_id int
										,@connection_id int
										,@description varchar(100)
										,@by varchar(100)
										,@groups_users varchar(100)
										,@user_type varchar(100)
										,@filetag varchar(100))

AS
BEGIN

--AGENCY		

IF ((select user_type from user_accounts where user_id=@user_id )='agency')

BEGIN

SELECT	* FROM ( SELECT
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
								up.phase_id,
								row_number() over(order by up.upload_id desc) as rownumber,
								ua.first_name,
								dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
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
								where case_worker_parent_user_id =@case_worker_parent_user_id ))
								AND up.description like '@description%'
								AND ua.last_name like '@by%'
								AND ug.group_name like '@groups_users%'
								AND ua.user_type like '@user_type%'
								AND up.filetag like '@filetag%'
								)Lu  
								where Lu.rownumber> 0 AND Lu.rownumber <= 100  
								ORDER BY datepostedVal DESC


END		

--CASEWORKER

ELSE IF ((select user_type from user_accounts where user_id=@user_id)='agency_user')

BEGIN

SELECT	* FROM ( SELECT
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
								row_number() over(order by up.upload_id desc) as rownumber,
								ua.first_name,
								dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
								up.dateposted as datepostedVal,
								up.ConnId

						FROM

								upload up
								JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)

						WHERE
								(up.uploaded_by = ua.user_id )                                                
                                                AND 
								( up.uploaded_by in (select parentid from caseworker_client where parentid=@user_id)
							    OR up.user_id in (select parentid from caseworker_client where parentid=@user_id)
							    OR up.user_id in (@user_id)  

								OR up.user_id in ( select user_id from user_accounts where case_worker=@user_id )
                  				OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id=@user_id ) 
								AND (up.group_id is NUll or up.group_id = 0))
                  				OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = @user_id)) 
								AND up.description like '@description%'
								AND ua.last_name like '@by%'
								AND ug.group_name like '@groups_users%'
								AND ua.user_type like '@user_type%'
								AND up.filetag like '@filetag%') Lu  
								WHERE Lu.rownumber> 0 AND Lu.rownumber <= 100  
								ORDER BY datepostedVal DESC



END

--ADOPTIVE PARENT

ELSE IF ((select user_type from user_accounts where user_id=@user_id)='adoptive_parent')

BEGIN

SELECT	* FROM(SELECT
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
								row_number() over(order by up.upload_id desc) as rownumber,
								ua.first_name,
								dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
								up.dateposted as datepostedVal,
								up.ConnId

						FROM

								upload up
								JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
								LEFT JOIN user_groups ug ON (ug.group_id = up.group_id)
								LEFT JOIN user_accounts upto ON (upto.user_id = up.user_id)

						WHERE

								(up.uploaded_by = ua.user_id  
								AND (up.ConnectionId = @connection_id OR up.ConnectionId = 0 OR up.ConnectionId is NULL))                                                
								AND ( up.uploaded_by in (@user_id)
								OR up.user_id in (@user_id)
								OR up.user_id in (@user_id)  

								OR up.group_id in (@group_id))  AND upload_id not in (
								SELECT upload_id from upload up 
								WHERE  ( up.user_id  =@user_id  OR up.group_id in (@group_id)) 
								AND (up.ConnectionId = @connection_id OR  up.ConnectionId is Null OR up.ConnectionId = 0)
								AND donotShowCasenote = 1 
								AND upload_phase = 0 
								AND upload_stage = 0 
								AND upload_task =  0 
								) 
								AND up.description like '@description%') Lu  
								WHERE Lu.rownumber> 0 AND Lu.rownumber <= 100  
								ORDER BY datepostedVal DESC


END

END
	

EXEC usp_document_listing
                          @user_id=''
						  ,@agency_id='211'
						  ,@case_worker_parent_user_id='' 
						  ,@group_id=''
						  ,@connection_id=''
						  ,@description=''
						  ,@by=''
						  ,@groups_users=''
						  ,@user_type='';

