

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
    rs.rellabel
    AS CaseNumber INTO #CasenoteRpt_StgTbl

  FROM contactactivity ca

  JOIN rel_relationship rs
    ON ca.connid = -(rs.contactid)
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
    cc.ActRe,
    cc.DateCreated INTO #CasenoteRpt_StgTbl_sub

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
    ss.ActRe,
    cv.casenote_subject,
    ss.DateCreated,
    cv.created_dttm,
    cv.updated_by,
    cv.updated_dttm

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


