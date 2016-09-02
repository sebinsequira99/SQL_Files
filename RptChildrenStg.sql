
---------------------------------All Children in the agency-----------------------------------------------------------------------------------------------------------------------
IF EXISTS ( SELECT  1 FROM information_schema.Tables WHERE TABLE_NAME='RptGetAllChildrenStg')
 BEGIN 
  DROP TABLE dbo.RptGetAllChildrenStg
 END 
SELECT  DISTINCT
   C.fname+' '+C.LNAME AS Displayname
  ,CONVERT(int,ROUND(DATEDIFF(hour, case c.BirthDate when '1900-01-01 00:00:00.000' THEN Null Else c.BirthDate end,GETDATE())/8766.0,0)) AS Age
  ,c.gender
  ,RST.RelationshipSubTypeText AS Program
  --,dbo.[udf_MAPGroupList] (R1.[user_id],R1.Connectionid)
  ,R1.RelLabel
  ,CA.Address1
  ,CS.ConnectionStatusText
  , case c.BirthDate when '1900-01-01 00:00:00.000' THEN Null Else convert(varchar(20),c.BirthDate,110) end as DOB
  ,R.CONNID
  ,R1.CONNECTIONID
  ,R1.User_id
  ,ug.group_id
 
 INTO RptGetAllChildrenStg 

FROM  DBO.CONTACT C WITH(NOLOCK) 
 Left Join dbo.ContactAddress CA on CA.ContactId = C.ContactId
 LEFT JOIN dbo.Rel_relationship R WITH(NOLOCK) ON (C.CONTACTID*-1 = R.CONNID  AND CONNECTIONID > 0)
 LEFT JOIN dbo.Rel_relationship R1 WITH(NOLOCK) ON (R.CONNECTIONID = R1.CONNID)
 INNER JOIN dbo.Rel_lkp_RelationshipType RT   WITH (NOLOCK) ON R1.RelationshipTypeId = RT.RelationshipTypeId 
 INNER JOIN dbo.Rel_lkp_RelationshipSubType RST WITH (NOLOCK) ON RT.RelationshipSubTypeId = RST.RelationshipSubTypeId  AND ISNULL(RST.Rel_SubType_isProgram,0) = 1
 LEFT JOIN dbo.User_Accounts  UA  WITH(NOLOCK) ON ( C.CONTACTID*-1 = UA.connid ) 
 LEFT JOIN DBO.USER_EFFECTIVEDATE UE WITH(NOLOCK) ON (UA.USER_ID = UE.USER_ID AND UE.eff_status ='Y')
 LEFT JOIN dbo.user_Groups UG  WITH(NOLOCK) ON  (UG.group_id = UE.group_id)
 LEFT JOIN dbo.lkpConnectionStatus CS WITH(NOLOCK) ON (cs.ConnectionStatusId =R1.ConnectionStatusId)
 WHERE (R1.RelationshipTypeId =-104 ) AND c.BirthDate <=GETDATE() 
AND ISNULL(C.fname+C.LNAME,'')!=''
order by C.fname+' '+C.LNAME


