

IF EXISTS (SELECT 1 FROM sys.objects
WHERE name = 'CasenoteRpt_StgTbl'
AND type = 'u')
DROP TABLE CasenoteRpt_StgTbl;

GO 

Select * into CasenoteRpt_StgTbl
	From (select 	Distinct 
	dbo.udf_CoupleContactId(A.ConnId, 1) as MAPCNContactId1,	
	dbo.udf_CoupleContactId(A.ConnId, 2) as MAPCNContactId2,
	dbo.udf_CoupleContactId(A.StaffConnid, 1) as MAPCNCWContactId1,
	dbo.udf_CoupleContactId(A.ownerConnID, 1) as MAPCNCrContactId1,
	A.connid,
	A.connectionid,
	A.contactactivityid,
	AT.ActTypeText as CasenoteType, 
	ActDate as DateCreated, 
	ActRe as ActRe, 
	--LA.ActTypeText AS SecureCaseNoteType,
	--ST.Description AS SecureCaseNoteSubType,
	g.group_name AS GroupName,
	cv.case_note_id,
	cv.casenote_subject,
    cv.created_dttm,
    cast(cv.updated_by as varchar(200)) as updated_by,		
    cv.updated_dttm

from ContactActivity A
LEFT JOIN lkpActType AT on AT.ActTypeId = A.ActTypeId
--LEFT JOIN lkpsecurecasenotesubtypes ST ON A.securenotesubtypeid=ST.subtypeid
--LEFT JOIN SecureCaseNoteSubTypes SM ON  SM.securenotesubtypeid =ST.subtypeid
--LEFT JOIN  lkpActType LA ON SM.SecureNoteTypeID=LA.ActTypeId
LEFT JOIN user_effectivedate u
ON A.connectionid=u.connectionid
AND u.eff_status='Y'
LEFT JOIN user_groups g
ON u.group_id=g.group_id
LEFT JOIN casenote_version cv
ON A.contactactivityid = cv.case_note_id

where A.Connid is not null
		
UNION All
				
select 	Distinct 
	dbo.udf_ContactIDs(I.ContactAIRSId, 1) as MAPCNContactId1,	
	dbo.udf_ContactIDs(I.ContactAIRSId, 2) as MAPCNContactId2,
	dbo.udf_ContactIDs(I.InqStaffContactAiRSId, 1) as MAPCNCWContactId1,
	0 as MAPCNCrContactId1,
	I.connid,
	-1 as connectionid,
	null as contactactivityid,
	'Inquiry Note' as CasenoteType, 
	InquiryDate as DateCreated, 
	'Inquiry Note' as ActRe, 
	--'' AS SecureCaseNoteType,
	--'' AS SecureCaseNoteSubType,
	null AS GroupName,
	null as case_note_id,
	null as casenote_subject,
    null as created_dttm,
    null as updated_by,		
    null as updated_dttm

	 from Inquiry I
	left outer join lkpInquiryType IT on I.InqTypeId = IT.InqTypeId
	where I.ContactAIRSId  in (select airs_contactairs_id 
			from  dbo.user_accounts uac
			inner join  dbo.user_agencies uag on uac.agency_id = uag.agency_id
			where airs_contactairs_id is not null)
	  and rtrim(ltrim(cast(InqNotes as varchar(255)))) > ''
	  and InqNotes is not null 
	 
	UNION All
		
select 	Distinct 
	dbo.udf_ContactIDs(CL.ContactAIRSId, 1) as MAPCNContactId1,	
	dbo.udf_ContactIDs(CL.ContactAIRSId, 2) as MAPCNContactId2,
	dbo.udf_ContactIDs(CL.StaffContactAirsID, 1) as MAPCNCWContactId1,
	dbo.udf_ContactIDs(CL.StaffContactAirsID, 1) as MAPCNCrContactId1,
	cl.connid,
	-1 as connectionid,
	null as contactactivityid,
	'E-Mail' as CasenoteType, 
	LDate as DateCreated, 
	LDesc as ActRe, 
	--'' AS SecureCaseNoteType,
	--'' AS SecureCaseNoteSubType,
	null AS GroupName,
	null as case_note_id,
	null as casenote_subject,
    null as created_dttm,
    null as updated_by,		
    null as updated_dttm

		from ContactLetter CL
		where CL.ContactAIRSId  in (select airs_contactairs_id 
	from  dbo.user_accounts uac
	inner join  dbo.user_agencies uag on uac.agency_id = uag.agency_id
	where  airs_contactairs_id is not null)
		and CL.LetterTemplateTypeId = 2
		
UNION All
		
select 	Distinct 
	dbo.udf_ContactIDs(CL.ContactAIRSId, 1) as MAPCNContactId1,	
	dbo.udf_ContactIDs(CL.ContactAIRSId, 2) as MAPCNContactId2,
	dbo.udf_ContactIDs(CL.StaffContactAirsID, 1) as MAPCNCWContactId1,
	dbo.udf_ContactIDs(CL.StaffContactAirsID, 1) as MAPCNCrContactId1,
	cl.connid,
	-1 as connectionid,
	null as contactactivityid,
	'Letter' as CasenoteType, 
	LDate as DateCreated, 
	LDesc as ActRe, 
	--'' AS SecureCaseNoteType,
	--'' AS SecureCaseNoteSubType,
	null AS GroupName,
	null as case_note_id,
	null as casenote_subject,
    null as created_dttm,
    null as updated_by,		
    null as updated_dttm

	 from ContactLetter CL
	 where CL.ContactAIRSId  in (select airs_contactairs_id 
	from  dbo.user_accounts uac
	inner join  dbo.user_agencies uag on uac.agency_id = uag.agency_id
	where airs_contactairs_id is not null)
		and CL.LetterTemplateTypeId = 1

UNION All
	
select 	Distinct 
	dbo.udf_ContactIDs(MapAt.dbo.udf_MsgClientId(um.message_id,0), 1) as MAPCNContactId1,
	dbo.udf_ContactIDs(MapAt.dbo.udf_MsgClientId(um.message_id,0), 2) as MAPCNContactId2,
	dbo.udf_ContactIDs(MapAt.dbo.udf_MsgClientId(um.message_id,1), 1) as MAPCNCWContactId1,
	dbo.udf_ContactIDs(MapAt.dbo.udf_MsgClientId(um.message_id,1), 1) as MAPCNCrContactId1,
	um.senderconnid as connid,
	um.connectionid,
	null as contactactivityid,
	'Message' as CasenoteType, 
	dateposted as DateCreated, 
	subject as ActRe, 
	--'' AS SecureCaseNoteType,
	--'' AS SecureCaseNoteSubType,
	g.group_name AS GroupName,
	null as case_note_id,
	null as casenote_subject,
    null as created_dttm,
    null as updated_by,		
    null as updated_dttm

	 from  dbo.user_messages um
		inner join  dbo.user_accounts ua on um.sender = ua.[user_id]
		inner join  dbo.user_agencies uag on ua.agency_group = uag.agency_id
		LEFT JOIN user_effectivedate u
		ON um.connectionid=u.connectionid
		AND u.eff_status='Y'
		LEFT JOIN user_groups g
		ON u.group_id=g.group_id
		where ua.status <> 'Delete'
		and dbo.udf_ContactIDs(MapAt.dbo.udf_MsgClientId(um.message_id,0), 1) is not null
		
Union

SELECT
	dbo.udf_CoupleContactId(ua1.ConnId, 1) as MAPCNContactId1,
	dbo.udf_CoupleContactId(ua1.ConnId, 2) as MAPCNContactId2,
	dbo.udf_CoupleContactId(ua2.ConnId,1) as MAPCNCWContactId1,
	dbo.udf_CoupleContactId(ua2.ConnId,1) as MAPCNCrContactId1,
	up.connid,
	up.connectionid, 
	null as contactactivityid,
	'Document' as CasenoteType, 
	dateposted as DateCreated,  
	up.description as ActRe, 
	--'' AS SecureCaseNoteType,
	--'' AS SecureCaseNoteSubType,
	g.group_name AS GroupName,
	null as case_note_id,
	null as casenote_subject,
    null as created_dttm,
    null as updated_by,		
    null as updated_dttm

FROM  dbo.upload up
		inner JOIN  dbo.user_accounts ua1 ON (up.[user_id] = ua1.[user_id])
		left outer JOIN  dbo.user_accounts ua2 ON (up.uploaded_by = ua2.[user_id] and ua2.user_type in ('agency','agency_user'))
		inner join  dbo.user_agencies uag on ua1.agency_group = uag.agency_id
		LEFT JOIN user_effectivedate u
		ON up.connectionid=u.connectionid
		AND u.eff_status='Y'
		LEFT JOIN user_groups g
		ON u.group_id=g.group_id
		where ua1.user_type not in ('agency','agency_user')
							and ua1.status <> 'Delete') as tmp
							where connectionid!=0;

ALTER TABLE CasenoteRpt_StgTbl
ADD ClientName			varchar(500)
   ,CWName				varchar(200)
   ,Program				varchar(200)
   ,[Role]				varchar(200)
   ,CaseNumber			varchar(200)
GO

UPDATE rc
SET rc.program=rst.RelationshipSubTypeText
   ,rc.[Role]=rt.RelationshipTypeText
   ,rc.clientname=REPLACE(r.displayname, 'amp;', '')
   ,rc.CWName=c.lname + ', ' + c.fname
   ,rc.CaseNumber=r.rellabel

FROM CasenoteRpt_StgTbl rc
LEFT JOIN rel_relationship r
ON rc.connectionid = r.connectionid
    AND (
    rc.connid = r.connid
    OR (SELECT
      dbo.udf_CoupleConnId(rc.connid, 0))
    = r.connid
    OR (SELECT
      dbo.udf_CoupleConnId(rc.connid, 2))
    = r.connid
    OR (SELECT
      dbo.udf_CoupleConnectionId(rc.connid))
    = r.connid
    )
LEFT JOIN rel_lkp_relationshiptype rt
ON r.RelationshipTypeId=rt.RelationshipTypeId
LEFT JOIN rel_lkp_relationshipsubtype rst
ON rt.RelationshipSubTypeId=rst.RelationshipSubTypeId
AND rst.Rel_SubType_isProgram=1
LEFT JOIN contact c
ON rc.MAPCNCWContactId1 = c.contactid

