

ALTER PROCEDURE usp_CasenoteRpt_Stg
AS
BEGIN

IF exists (select 1 from sys.objects where name='CasenoteRpt_StgTbl' and type='u')
DROP TABLE CasenoteRpt_StgTbl;
DROP TABLE #CasenoteRpt_StgTbl

SELECT cv.case_note_id
	  ,ca.connid
	  ,ca.connectionid
	  ,rs.displayname
	  ,rs.rellabel as CaseNumber
	  ,u.first_name + ' ' + u.last_name 
	   as CwName
	  ,ca.ActRe
	  ,cv.casenote_subject
	  ,ca.DateCreated
	  ,cv.created_dttm
      ,cv.updated_by
      ,cv.updated_dttm

INTO #CasenoteRpt_StgTbl	  

FROM contactactivity ca

LEFT JOIN casenote_version cv
ON ca.contactactivityid=cv.case_note_id
JOIN user_accounts u
ON ca.createdbyconnid=u.connid
LEFT JOIN rel_relationship rs 
ON ca.connid=rs.connid and ca.connectionid=rs.connectionid

WHERE rs.rellabel NOT IN('#error','')

UPDATE c
SET connid=(SELECT dbo.udf_CoupleConnId(connid,1))
FROM #CasenoteRpt_StgTbl c

SELECT cs.case_note_id
	  ,rr.displayname as clientname
	  ,cs.connid
	  ,cs.CwName
	  ,cs.CaseNumber
	  ,cs.ActRe
	  ,cs.casenote_subject
	  ,cs.DateCreated
	  ,cs.created_dttm
	  ,cs.updated_by
	  ,cs.updated_dttm

INTO CasenoteRpt_StgTbl

FROM #CasenoteRpt_StgTbl cs

JOIN rel_relationship rr 
ON cs.connid=rr.connid
WHERE cs.connid <> 0
ORDER BY rr.displayname

DROP TABLE #CasenoteRpt_StgTbl

END





