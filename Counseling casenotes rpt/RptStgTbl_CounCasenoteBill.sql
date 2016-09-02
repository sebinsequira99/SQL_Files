

mapat

IF EXISTS (select 1 from sys.objects where name='RptStgTbl_CounCasenoteBill' and type='u')
DROP TABLE RptStgTbl_CounCasenoteBill

select * into RptStgTbl_CounCasenoteBill from RptStgTbl_CounCasenoteCnt

;with duplicates as(
select row_number()over(partition by Subject,cast(Date as date),Duration,connectionid
      order by connectionid) as rowno
   ,* 
from RptStgTbl_CounCasenoteBill
where connectionid is not null
)

delete from duplicates
where rowno>1



