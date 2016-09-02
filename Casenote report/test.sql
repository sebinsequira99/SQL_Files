


ALTER PROC usp_CasenoteRpt_Stg_test

AS
BEGIN

  IF EXISTS (SELECT
      1
    FROM sys.objects
    WHERE name = 'CasenoteRpt_StgTbl_test'
    AND type = 'u')
    DROP TABLE CasenoteRpt_StgTbl_test;

  SELECT
	cv.case_note_id,
	ca.connid,
	rs.connectionid,
	REPLACE(rs.displayname, 'amp;', '') AS ClientName,
	rs.rellabel as CaseNumber,
	u.first_name + ' ' + u.last_name
	AS CwName,
	ca.ActRe,
	cv.casenote_subject,
	ca.DateCreated,
	cv.created_dttm,
	cv.updated_by,
	cv.updated_dttm 
  
  INTO CasenoteRpt_StgTbl_test

  FROM contactactivity ca

  JOIN rel_relationship rs
    ON ca.connid = -(rs.contactid) or ca.connid = -(rs.contactid2)
  LEFT JOIN casenote_version cv
    ON ca.contactactivityid = cv.case_note_id
  LEFT JOIN user_accounts u
    ON ca.createdbyconnid = u.connid
  WHERE ca.ActRe <> '' 
  AND rs.rellabel IS NOT NULL
  AND rs.rellabel NOT IN ('#error', '')
  AND (CAST(rs.connectionid AS varchar(250)) <> rs.rellabel)
  AND rs.connectionid = ca.connectionid
    AND (
       (SELECT
      dbo.udf_CoupleConnId(ca.connid, 0))
    = ca.connid
    OR (SELECT
      dbo.udf_CoupleConnId(ca.connid, 2))
    = ca.connid
    OR (SELECT
      dbo.udf_CoupleConnectionId(ca.connid))
    = ca.connid
    )
  ORDER BY rs.displayname



  ;
  WITH TempDup (case_note_id, duplicateRecCount)
  AS (SELECT
    case_note_id,
    ROW_NUMBER() OVER (PARTITION BY
    case_note_id, connid, connectionid, ClientName, CaseNumber, CwName
	, ActRe, casenote_subject, DateCreated, created_dttm, updated_dttm
    ORDER BY ClientName)
    AS duplicateRecCount
  FROM CasenoteRpt_StgTbl_test)

  --Delete Duplicate Records
  DELETE FROM TempDup
  WHERE duplicateRecCount > 1

  DROP TABLE #contact_activity
  , #CasenoteRpt_StgTbl
  , #CasenoteRpt_StgTbl_sub

END