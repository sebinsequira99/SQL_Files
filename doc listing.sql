



--
--======================================================================


IF exists (select 1 from sys.objects where name='usp_document_listing' and type='p')
DROP PROCEDURE usp_document_listing;


CREATE PROCEDURE usp_document_listing(@agency_id int
										,@description varchar(100)
										,@by varchar(100)
										,@groups_users varchar(100)
										,@user_type varchar(100))


AS
BEGIN

 --agency		

if (@agency_id <> null)	
begin
	
Select	* From(SELECT
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
                            Rolesqa.dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
                            up.dateposted as datepostedVal,
                            up.ConnId						

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)
                                                        left JOIN user_accounts upto ON (upto.user_id = up.user_id)
						WHERE
							(up.uploaded_by = ua.user_id )                                                
                                                AND 
							(  ua.agency_id = '211'  

	  OR up.user_id in ( select user_id from user_accounts where case_worker_parent_user_id ='8125' )) 
	  AND up.description=@description
	  AND up.user_id=@by
	  AND up.group_id=@groups_users
	  AND ua.user_type=@user_type) Lu  where Lu.rownumber> 0 AND Lu.rownumber <= 100  ORDER BY datepostedVal DESC


 SELECT count(*) as total_count

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)

						WHERE
							(up.uploaded_by = ua.user_id )

						AND
							(  ua.agency_id = '211'  

	  OR up.user_id in ( select user_id from user_accounts where case_worker_parent_user_id ='8125' )) 
	  AND up.description=@description
	  AND up.user_id=@by
	  AND up.group_id=@groups_users
	  AND ua.user_type=@user_type
				
end		

else if 
begin
Select	* From(SELECT
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
                                                        Rolesqa.dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
                                                        up.dateposted as datepostedVal,
                                                        up.ConnId

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)
                                                        left JOIN user_accounts upto ON (upto.user_id = up.user_id)
						WHERE
							(up.uploaded_by = ua.user_id )                                                
                                                AND 
							( up.uploaded_by in (17129,17103,17161,17168,17101,17110,17105,17103,18180,18186,18190,17085,17086,17093,17102,17111,17116)
                   or up.user_id in (17129,17103,17161,17168,17101,17110,17105,17103,18180,18186,18190,17085,17086,17093,17102,17111,17116)
                   or up.user_id in (17129)  

	    OR up.user_id in ( select user_id from user_accounts where case_worker='17129' )
                  					OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id='17129' ) and (up.group_id is NUll or up.group_id = 0))
                  					OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = '17129')) 
									AND up.description=@description
									AND up.user_id=@by
									AND up.group_id=@groups_users
									AND ua.user_type=@user_type) Lu  where Lu.rownumber> 0 AND Lu.rownumber <= 100  ORDER BY datepostedVal DESC

SELECT count(*) as total_count

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)

						WHERE
							(up.uploaded_by = ua.user_id )

						AND
							( up.uploaded_by in (17129,17103,17161,17168,17101,17110,17105,17103,18180,18186,18190,17085,17086,17093,17102,17111,17116)
                   or up.user_id in (17129,17103,17161,17168,17101,17110,17105,17103,18180,18186,18190,17085,17086,17093,17102,17111,17116)
                   or up.user_id in (17129)  

	    OR up.user_id in ( select user_id from user_accounts where case_worker='17129' )
                  					OR (up.user_id in ( select case_worker_parent_user_id from user_accounts where user_id='17129' ) and (up.group_id is NUll or up.group_id = 0))
                  					OR up.group_id in (SELECT group_id FROM group_caseworkers where caseworker_id = '17129')) 
									AND up.description=@description
									AND up.user_id=@by
									AND up.group_id=@groups_users
									AND ua.user_type=@user_type


end
else
begin

Select	* From(SELECT
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
                                                        Rolesqa.dbo.udf_CoupleName(ua.Connid,1,1,'Unknown',0,0) as DisplayName,
                                                        up.dateposted as datepostedVal,
                                                        up.ConnId

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)
                                                        left JOIN user_accounts upto ON (upto.user_id = up.user_id)
						WHERE
							(up.uploaded_by = ua.user_id  AND (up.ConnectionId = 345523 OR up.ConnectionId = 0 OR up.ConnectionId is NULL))                                                
                                                AND 
							( up.uploaded_by in (18183)
                   or up.user_id in (18183)
                   or up.user_id in (18183)  

	  OR up.group_id in (945))  AND upload_id not in (
                            select upload_id from upload up where  ( up.user_id  ='18183'  OR up.group_id in (945)) 
                            AND (up.ConnectionId = 345523 OR  up.ConnectionId is Null OR up.ConnectionId = 0)
                            AND donotShowCasenote = 1 
                            AND upload_phase = 0 
                            AND upload_stage = 0 
                            AND upload_task =  0 
                            )
							AND up.description=@description) Lu  where Lu.rownumber> 0 AND Lu.rownumber <= 100  ORDER BY datepostedVal DESC

SELECT count(*) as total_count

						FROM
							upload up
							JOIN user_accounts ua ON (up.uploaded_by = ua.user_id)
							left JOIN user_groups ug ON (ug.group_id = up.group_id)

						WHERE
							(up.uploaded_by = ua.user_id  AND (up.ConnectionId = 345523 OR up.ConnectionId = 0 OR up.ConnectionId is NULL))

						AND
							( up.uploaded_by in (18183)
                   or up.user_id in (18183)
                   or up.user_id in (18183)  

	  OR up.group_id in (945))  AND upload_id not in (
                            select upload_id from upload up where  ( up.user_id  ='18183'  OR up.group_id in (945)) 
                            AND (up.ConnectionId = 345523 OR  up.ConnectionId is Null OR up.ConnectionId = 0)
                            AND donotShowCasenote = 1 
                            AND upload_phase = 0 
                            AND upload_stage = 0 
                            AND upload_task =  0 
                            )
							AND up.description=@description





end

END
	

EXEC usp_document_listing
							@agency_id=
							,@description=
							,@by=
							,@groups_users=
							,@user_type= ;
;

