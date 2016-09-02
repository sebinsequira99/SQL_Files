


--Document Listing
--======================================================================


IF exists (select 1 from sys.objects where name='usp_document_listing' and type='p')
DROP PROCEDURE usp_document_listing;


CREATE PROCEDURE usp_document_listing(@user_id int
										,@description varchar(100)
										,@user_name varchar(100)
										,@groups_users varchar(100)
										,@user_type varchar(100)
										,@filetag varchar(100)
										,@startrow int
										,@endrow int
										)

AS
BEGIN

CREATE TABLE #table									(id int identity(1,1)
													,upload_id int
													,file_name varchar(8000)
													,description varchar(8000)
													,user_id1 int
													,name varchar(100)
													,last_name varchar(50)
													,dateposted datetime
													,upload_module varchar(8000)
													,upload_phase int
													,upload_stage int
													,upload_task int
													,group_name varchar(100)
													,user_type varchar(50)
													,editable varchar(1)
													,user_id2 int
													,group_id int
													,dateposted2 datetime
													,approved_by int
													,filetag nchar(2000)
													,phase_id varchar(50)
													,first_name varchar(50)
													,DisplayName varchar(200)
													,datepostedVal datetime
													,ConnId int)

--AGENCY
	
DECLARE @user varchar(20)
SELECT @user=user_type from user_accounts where user_id=@user_id

IF (@user='agency')

BEGIN

				

INSERT INTO #table									(upload_id
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
													,DisplayName 
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
                                AND ( up.uploaded_by in (select parentid from caseworker_client where parentid=@user_id)
								AND (up.description like case when(isnull(@description,'')!='') then ('%' + @description + '%') else up.description end)
								AND (ua.last_name like case when(isnull(@user_name,'')!='') then ('%' + @user_name + '%') else ua.last_name end)
								AND (ug.group_name like case when(isnull(@groups_users,'')!='') then ('%' + @groups_users + '%') else ug.group_name end)
								AND (ua.user_type like case when(isnull(@user_type,'')!='') then ('%' + @user_type + '%') else ua.user_type end)
								AND (up.filetag like case when(isnull(@filetag,'')!='') then ('%' + @filetag + '%') else up.filetag end)
							    OR up.user_id in (select parentid from caseworker_client where parentid=@user_id)
							    OR up.user_id in (@user_id)  

								OR up.user_id in ( select user_id from user_accounts where case_worker=@user_id )
                  				OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id=@user_id ) 
								AND (up.group_id is NUll or up.group_id = 0))
                  				OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = @user_id)) 
								
						



END		

--CASEWORKER

ELSE IF (@user='agency_user')

BEGIN

INSERT INTO #table									(upload_id
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
													,DisplayName 
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
                                AND ( up.uploaded_by in (select parentid from caseworker_client where parentid=@user_id)
								AND (up.description like case when(isnull(@description,'')!='') then ('%' + @description + '%') else up.description end)
								AND (ua.last_name like case when(isnull(@user_name,'')!='') then ('%' + @user_name + '%') else ua.last_name end)
								AND (ug.group_name like case when(isnull(@groups_users,'')!='') then ('%' + @groups_users + '%') else ug.group_name end)
								AND (ua.user_type like case when(isnull(@user_type,'')!='') then ('%' + @user_type + '%') else ua.user_type end)
								AND (up.filetag like case when(isnull(@filetag,'')!='') then ('%' + @filetag + '%') else up.filetag end)
							    OR up.user_id in (select parentid from caseworker_client where parentid=@user_id)
							    OR up.user_id in (@user_id)  

								OR up.user_id in ( select user_id from user_accounts where case_worker=@user_id )
                  				OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id=@user_id ) 
								AND (up.group_id is NUll or up.group_id = 0))
                  				OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = @user_id)) 




END

--ADOPTIVE PARENT

ELSE IF (@user='adoptive_parent')

BEGIN

INSERT INTO #table									(upload_id
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
													,DisplayName 
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
								AND (up.ConnectionId = (select ConnectionId from upload where user_id=@user_id) OR up.ConnectionId = 0 OR up.ConnectionId is NULL))                                                
								AND ( up.uploaded_by in (@user_id)
								AND (up.description like case when(isnull(@description,'')!='') then ('%' + @description + '%') else up.description end)
								OR up.user_id in (@user_id)
								OR up.user_id in (@user_id)  

								OR up.group_id in (SELECT group_id FROM upload where user_id = @user_id))  AND upload_id not in (
								SELECT upload_id from upload up 
								WHERE  ( up.user_id  =@user_id  OR up.group_id in (SELECT group_id FROM upload where user_id = @user_id)) 
								AND (up.ConnectionId = (select ConnectionId from upload where user_id=@user_id)
								OR  up.ConnectionId is Null OR up.ConnectionId = 0)
								AND donotShowCasenote = 1 
								AND upload_phase = 0 
								AND upload_stage = 0 
								AND upload_task =  0 
								) 
								
					
							

								

END

SELECT												SCOPE_IDENTITY() as total_count											
													,upload_id
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
													,DisplayName 
													,datepostedVal 
													,ConnId 	
FROM #table	
WHERE id>=@startrow	and id<=@endrow						


END

EXEC usp_document_listing
                          @user_id='981'
						  ,@description='<p>Adoption Preparation Resource Guide</p>'
						  ,@user_name='Solutions1'
						  ,@groups_users=''
						  ,@user_type='agency'
						  ,@filetag='File'
						  ,@startrow='1'
						  ,@endrow='100'
						  ;