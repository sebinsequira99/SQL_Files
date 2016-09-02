

---------------------------------RptAFClientListStg-----------------------------------------------------------------------------------------------------------------------
IF EXISTS ( SELECT  1 FROM information_schema.Tables WHERE TABLE_NAME='RptAFClientListStg')
 BEGIN 
  DROP TABLE dbo.RptAFClientListStg
 END 
SELECT DISTINCT
   --RTRIM(LTRIM(C.Fname+' '+C.Lname)) AS Name
   LTRIM(RTRIM(REPLACE(Replace(dbo.udf_CoupleName((C.ContactId * -1),1,0,'Unknown',0,0),'&amp;','&'),'amp;','&'))) AS Name
  ,R1.RelLabel 
  ,R1.RelationshipDateLastUpdated AS CasestartDate
  ,R1.RelationshipDateLastUpdated AS PhysicalPlacementDate
  ,RST.RelationshipSubTypetext as Program
  ,RT.RelationshipTypetext as Roles
  ,[dbo].[fn_GetCurrentPhaseName](ue.User_id,ue.ConnId,ue.ConnectionID,ue.group_id,1)  as PhaseId   
  ,[dbo].[fn_GetCurrentPhaseName](ue.User_id,ue.ConnId,ue.ConnectionID,ue.group_id,0) as PhaseName
  ,FS.Stage
  ,ft.task AS Task
  ,Isnull(UA1.first_name+' '+ UA1.last_name,'') as CaseWorker
  ,CA.Address1
  ,CP.PhoneNumber
  ,CE.ContactEmail
  ,ISNULL(UA.status_mode,'') as status
  ,CS.ConnectionStatusText as StatusType
  ,UG.group_name
  ,ug.group_id
  ,R.Connid 
  ,R1.connectionid
 
 INTO RptAFClientListStg 
  
FROM dbo.Contact C
 LEFT JOIN dbo.ContactAddress CA WITH(NOLOCK) ON CA.ContactId = C.ContactId AND CA.MailingAddress = 1 AND isnull(CA.Address1,'')<>''
 LEFT JOIN dbo.ContactPhone CP WITH(NOLOCK) ON  CP.ContactId = C.ContactId AND CP.PrimaryPhone = 1 AND isnull(CP.PhoneNumber,'')<>''
 LEFT JOIN dbo.ContactEmail CE WITH(NOLOCK) ON CE.ContactId = C.ContactId AND CE.PrimaryEmail = 1 AND isnull(CE.ContactEmail,'')<>''
 LEFT JOIN dbo.rel_relationship R WITH(NOLOCK) ON R.Connid = C.Contactid*-1 
 LEFT JOIN dbo.rel_relationship R1 WITH(NOLOCK) ON  ( (R.Connectionid = R1.Connid) AND  (R1.connid > 0) )
 LEFT JOIN dbo.rel_lkp_relationshiptype RT WITH(NOLOCK) ON R1.RelationshipTypeId=RT.RelationshipTypeId 
 LEFT JOIN dbo.rel_lkp_relationshipsubtype RST WITH(NOLOCK) ON (RT.RelationshipSubTypeId=RST.RelationshipSubTypeId ) and RST.Rel_SubType_isProgram=1
 LEFT JOIN dbo.lkpConnectionStatus CS WITH(NOLOCK) ON CS.ConnectionStatusId = R1.ConnectionStatusId
 LEFT JOIN dbo.User_accounts UA WITH(NOLOCK) on (C.contactid*-1 = UA.connid) and UA.user_type<>'agency_user'
 LEFT JOIN dbo.user_effectivedate UE WITH(NOLOCK) ON (UA.User_id = UE.user_id) AND UE.connectionid=R1.connectionid AND eff_status='Y'
 LEFT JOIN caseworker_client  CC WITH(NOLOCK) ON  (CC.ParentId=Ue.user_id)
 LEFT JOIN User_accounts  UA1 WITH(NOLOCK) ON  (CC.caseworkerid=UA1.user_id)
 LEFT JOIN dbo.user_groups UG WITH(NOLOCK) ON  (UG.group_id = UE.group_id)
 LEFT JOIN DBO.formmaker_usergroups fug  WITH(NOLOCK) ON (UG.group_id = FUG.pg_group_id)
 LEFT JOIN DBO.formmaker_stages FS WITH(NOLOCK) ON (FUG.pg_phase_id= FS.phase_id)
 LEFT JOIN formmaker_taskstatus fts  WITH(NOLOCK)  on (fts.user_id = ua.user_id and fts.phase_id =FUG.pg_phase_id and   fts.task_status ='DONE' AND (fts.approve = '0' OR fts.approve is NULL))
 LEFT JOIN  dbo.formmaker_tasks  ft WITH(NOLOCK) on (fts.task_id = ft.task_id and ft.phase_id = fts.phase_id )
WHERE ISNULL(C.Fname,'')<> '' AND ISNULL(R1.RelLabel,'')!=''  and UG.group_name is not null