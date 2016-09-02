

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].RptMAPCaseNoteDetail') AND type in (N'U'))
DROP TABLE [dbo].RptMAPCaseNoteDetail

GO 

DECLARE @id int 
DECLARE @DBName VARCHAR(200)
DECLARE @Count int 

SELECT @DBName = db_name()
EXEC @id = IRRISCENTRAL.DBO.usp_InsertReportJobLogs 'RptMAPFinancialDetail.sql',@DBName

Select * into RptMAPCaseNoteDetail
	From (select 	Distinct 
	dbo.udf_CoupleContactId(A.ConnId, 1) as MAPCNContactId1,	
	dbo.udf_CoupleContactId(A.ConnId, 2) as MAPCNContactId2,
	dbo.udf_CoupleContactId(A.StaffConnid, 1) as MAPCNCWContactId1,
	dbo.udf_CoupleContactId(A.ownerConnID, 1) as MAPCNCrContactId1,
	A.connectionid,
	cast(IsActComplet as varchar(10)) as isdone, 
	AT.ActTypeText + ' *' as ActType, 
	ActDate as thedate, 
	ActPriority as priority, 
	ActRe as subject, 
	cast(A.Incident as varchar(10)) as Incident,
	A.ActDuration,
	A.ActPriority,
	LA.ActTypeText AS SecureCaseNoteType,
	ST.Description AS SecureCaseNoteSubType,
	g.group_name AS GroupName

from ContactActivity A
left outer join lkpActType AT on AT.ActTypeId = A.ActTypeId
LEFT JOIN lkpsecurecasenotesubtypes ST ON A.securenotesubtypeid=ST.subtypeid
LEFT JOIN SecureCaseNoteSubTypes SM ON  SM.securenotesubtypeid =ST.subtypeid
LEFT JOIN  lkpActType LA ON SM.SecureNoteTypeID=LA.ActTypeId
LEFT JOIN user_effectivedate u
ON A.connectionid=u.connectionid
AND u.eff_status='Y'
LEFT JOIN user_groups g
ON u.group_id=g.group_id

where A.Connid is not null
		
UNION All
				
select 	Distinct 
	dbo.udf_ContactIDs(I.ContactAIRSId, 1) as MAPCNContactId1,	
	dbo.udf_ContactIDs(I.ContactAIRSId, 2) as MAPCNContactId2,
	dbo.udf_ContactIDs(I.InqStaffContactAiRSId, 1) as MAPCNCWContactId1,
	0 as MAPCNCrContactId1,
	-1 as connectionid,
	'1' as isdone, 
	'Inquiry Note' as ActType, 
	InquiryDate as thedate, 
	'1' as priority, 
	'Inquiry Note' as subject, 
	'0' as Incident,
	0 as ActDuration,
	0 as ActPriority,
	'' AS SecureCaseNoteType,
	'' AS SecureCaseNoteSubType,
	null AS GroupName

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
	-1 as connectionid,
	'1' as isdone, 
	'E-Mail' as ActType, 
	LDate as thedate, 
	'1' as priority, 
	LDesc as subject, 
	'0' as Incident,
	0 as ActDuration,
	0 as ActPriority,
	'' AS SecureCaseNoteType,
	'' AS SecureCaseNoteSubType,
	null AS GroupName

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
	-1 as connectionid,
	'1' as isdone, 
	'Letter' as ActType, 
	LDate as thedate, 
	'1' as priority, 
	LDesc as subject, 
	'0' as Incident,
	0 as ActDuration,
	0 as ActPriority,
	'' AS SecureCaseNoteType,
	'' AS SecureCaseNoteSubType,
	null AS GroupName

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
	um.connectionid,
	'1' as isdone, 
	'Message' as ActType, 
	dateposted as thedate, 
	'1' as priority, 
	subject as subject, 
	'0' as Incident,
	0 as ActDuration,
	0 as ActPriority,
	'' AS SecureCaseNoteType,
	'' AS SecureCaseNoteSubType,
	g.group_name AS GroupName

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
	up.connectionid,
	'1' as isdone, 
	'Document' as ActType, 
	dateposted as thedate, 
	'1' as priority, 
	up.description as subject, 
	'0' as Incident,
	0 as ActDuration,
	0 as ActPriority,
	'' AS SecureCaseNoteType,
	'' AS SecureCaseNoteSubType,
	g.group_name AS GroupName

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


ALTER TABLE RptMAPCaseNoteDetail
ADD Program varchar(200)
ALTER TABLE RptMAPCaseNoteDetail
ADD ProgramType varchar(200)


UPDATE rc
SET rc.program=rst.RelationshipSubTypeText
   ,rc.programtype=rt.RelationshipTypeText

FROM RptMAPCaseNoteDetail rc
JOIN rel_relationship r
ON rc.connectionid = r.connectionid
JOIN rel_lkp_relationshiptype rt
ON r.RelationshipTypeId=rt.RelationshipTypeId
JOIN rel_lkp_relationshipsubtype rst
ON rt.RelationshipSubTypeId=rst.RelationshipSubTypeId
AND rst.Rel_SubType_isProgram=1


SELECT @Count = Count(1) FROM RptMAPCaseNoteDetail
EXEC IRRISCENTRAL.DBO.[usp_UpdateReportJobLogs] @id,@Count