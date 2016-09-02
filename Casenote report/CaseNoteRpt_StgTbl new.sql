
mapat

--select * from CasenoteRpt_StgTbl where clientname like '%chen, ellen%'
--order by group_name

--select count(*) from CasenoteRpt_StgTbl
casenote_version where case_note_id in(52814
,52815
,53027
,53028
,53029
,54009
,54175
,54228
,54272
,55431
,57969
,60878
,63636
,63647
,63648
,63668
,63669
,65403
,81987
,81995
,84446
,84447
,84448
,84449
,84450
,84451
,86469
,88718
,91892
,96143
,96144
,98475
,99159
,99160
,99363
,100145
,101238
,101854
,101855
,103062
,103212)
contactactivity where connid=-79534 and connectionid=272754


DROP TABLE #CasenoteRpt_StgTbl
DROP TABLE #CasenoteRpt_StgTbl_sub


  IF EXISTS (SELECT
      1
    FROM sys.objects
    WHERE name = 'CasenoteRpt_StgTbl'
    AND type = 'u')
    DROP TABLE CasenoteRpt_StgTbl;

  SELECT
    ca.connid,
    rs.connectionid,
    rs.displayname,
    rs.rellabel AS CaseNumber,
	rs.user_id,
	g.group_name as GroupName


    INTO #CasenoteRpt_StgTbl
	
  FROM contactactivity ca
  JOIN rel_relationship rs
  ON ca.connid = -(rs.contactid)
  LEFT JOIN user_effectivedate u
  ON A.connectionid=u.connectionid
  AND u.eff_status='Y'
  LEFT JOIN user_groups g
  ON u.group_id=g.group_id
  WHERE rs.rellabel IS NOT NULL
  AND rs.rellabel NOT IN ('#error', '')
  AND (CAST(rs.connectionid AS varchar(200)) <> rs.rellabel)


  SELECT
    cc.connid,
    ct.connectionid,
    cc.contactactivityid,
    cc.createdbyconnid,
    ct.displayname,
    ct.CaseNumber,
	ct.user_id,
    cc.ActRe,
    cc.DateCreated,
	ct.RelationshipTypeId,
	ct.RelationshipTypeText,
	ct.RelationshipSubTypeId,
	ct.RelationshipSubTypeText
	
	INTO #CasenoteRpt_StgTbl_sub

  FROM #CasenoteRpt_StgTbl ct
  LEFT JOIN contactactivity cc
    ON ct.connectionid = cc.connectionid
    AND (
    ct.connid = cc.connid
    OR (SELECT
      dbo.udf_CoupleConnId(ct.connid, 0))
    = cc.connid
    OR (SELECT
      dbo.udf_CoupleConnId(ct.connid, 2))
    = cc.connid
    OR (SELECT
      dbo.udf_CoupleConnectionId(ct.connid))
    = cc.connid
    )

  SELECT
    cv.case_note_id,
    ss.connid,
    ss.connectionid,
    REPLACE(ss.displayname, 'amp;', '') AS ClientName,
    ss.CaseNumber,
    c.lname + ', ' + c.fname 
    AS CwName,
	ss.user_id,
    ss.ActRe,
    cv.casenote_subject,
    ss.DateCreated,
    cv.created_dttm,
    cv.updated_by,
    cv.updated_dttm,
	ss.RelationshipTypeId,
	ss.RelationshipTypeText as Type,
	ss.RelationshipSubTypeId,
	ss.RelationshipSubTypeText as Program

  INTO CasenoteRpt_StgTbl

  FROM #CasenoteRpt_StgTbl_sub ss

  LEFT JOIN casenote_version cv
  ON ss.contactactivityid = cv.case_note_id
  LEFT JOIN contact c
  ON -(ss.createdbyconnid) = c.contactid
  WHERE ss.ActRe <> ''
  ORDER BY ss.displayname

  ;
  WITH TempDup (case_note_id, duplicateRecCount)
  AS (SELECT
    case_note_id,
    ROW_NUMBER() OVER (PARTITION BY
    case_note_id, connid, connectionid, ClientName, CaseNumber, CwName
	, ActRe, casenote_subject, DateCreated, created_dttm, updated_dttm
    ORDER BY ClientName)
    AS duplicateRecCount
  FROM CasenoteRpt_StgTbl)

  --Delete Duplicate Records
  DELETE FROM TempDup
  WHERE duplicateRecCount > 1

  ALTER TABLE CasenoteRpt_StgTbl
  ADD Program varchar(max)
  ALTER TABLE CasenoteRpt_StgTbl
  ADD ProgramType varchar(max)

  UPDATE rc
  SET rc.program=rst.RelationshipSubTypeText
     ,rc.programtype=rt.RelationshipTypeText
  
  FROM CasenoteRpt_StgTbl rc
  JOIN rel_relationship r
  ON rc.connectionid = r.connectionid
  JOIN rel_lkp_relationshiptype rt
  ON r.RelationshipTypeId=rt.RelationshipTypeId
  JOIN rel_lkp_relationshipsubtype rst
  ON rt.RelationshipSubTypeId=rst.RelationshipSubTypeId
  AND rst.Rel_SubType_isProgram=1
  
  


