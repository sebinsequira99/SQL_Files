

ALTER PROCEDURE usp_CasenoteRpt_Stg
AS
BEGIN

IF exists (select 1 from sys.objects where name='CasenoteRpt_StgTbl' and type='u')
DROP TABLE CasenoteRpt_StgTbl;

SELECT cv.case_note_id
	  ,ca.connid
	  ,u.first_name + ' ' + u.last_name 
	   as CwName
	  ,STUFF((SELECT DISTINCT ',' + r.rellabel
			  FROM rel_relationship r
			  WHERE r.user_id=ua.user_id and r.connid>0
			  FOR XML PATH(''),TYPE).value('.', 'NVARCHAR(MAX)'),1,1,'') 
	   as CaseNumber
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
JOIN user_accounts ua
ON ca.connid=ua.connid
JOIN user_accounts u
ON ca.createdbyconnid=u.connid


update c
set connid=(select dbo.udf_CoupleConnId(connid,1))
from #CasenoteRpt_StgTbl c

select rr.displayname as clientname
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
where cs.connid <> 0
order by rr.displayname

drop table #CasenoteRpt_StgTbl
END

