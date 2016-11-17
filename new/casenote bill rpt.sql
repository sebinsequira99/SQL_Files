

CREATE PROC usp_LoadRptStgTbl_CounCasenotes

AS
BEGIN

IF EXISTS (select 1 from sys.objects where name='RptStgTbl_CounCasenoteCnt' and type='u')
DROP TABLE RptStgTbl_CounCasenoteCnt;

IF EXISTS (select 1 from sys.objects where name='RptStgTbl_CounCasenoteBill' and type='u')
DROP TABLE RptStgTbl_CounCasenoteBill;

select ca.actre as Subject
,ca.connectionid as coun_connectionid
,ca.contactid
,ca.securenotesubtypeid
,ca.acttypeid
,ca.contactactivityid
,IsActComplet as [Is Complete]
,ActDate as [Date]
,ActPriority as [Priority]
,Incident as [Is Incident]
,ActDuration as [Duration]
,staffconnid

into #result from contactactivity ca 
where ActTypeId in(select acttypeid from lkpacttype where isSecure=1 and programID=32)
order by ca.actre

alter table #result
add clientname varchar(200);

update r
set r.clientname=replace(rr.displayname,'amp;','')
from #result r
inner join rel_relationship rr
on r.contactid=rr.contactid and r.coun_connectionid=rr.connectionid

select distinct contactid,displayname,connectionid into #subresult from rel_relationship where connectionid in(select r.connectionid
from rel_relationship r
where r.contactid in(select distinct contactid from #result)
and r.RelationshipTypeId in(select RelationshipTypeId from rel_lkp_relationshiptype where relationshipsubtypeid=1)
group by connectionid
having count(*)>1)

;with duplicates as(
select row_number()over(partition by contactid
      order by contactid) as row_no
   ,* 
from #subresult
)

delete from duplicates where row_no>1

select r.[Subject]
,r.coun_connectionid
,r.contactid
,r.securenotesubtypeid
,r.acttypeid
,r.contactactivityid
,r.[Is Complete]
,cast(r.[Date] as date) as [Date]
,r.[Priority]
,r.[Is Incident]
,r.[Duration]
,r.staffconnid
,s.connectionid
,s.displayname
,l.acttypetext as [Secure Case Note Type]
,ls.description as [Secure Case Note Sub-Type] 
,replace(rr.displayname,'amp;','') as [Contact 1 Full Name]
,c.lname+', '+c.fname as [Case Worker]
,rt.relationshiptypetext as [Program Type]
--,g.group_name as [Group]
into #mainresult

from #result r
left join #subresult s
on r.contactid=s.contactid
left join lkpacttype l
on r.acttypeid=l.acttypeid
left join lkpsecurecasenotesubtypes ls
on r.securenotesubtypeid=ls.subtypeid
left join rel_relationship rr
on r.coun_connectionid=rr.connectionid and r.contactid=rr.contactid 
left join contact c
on abs(r.staffconnid)=c.contactid
left join rel_lkp_relationshiptype rt
on rr.relationshiptypeid=rt.relationshiptypeid
--left join user_effectivedate ue
--on r.connectionid=ue.connectionid and eff_status='Y'
--left join user_groups g
--on ue.group_id=g.group_id
order by s.connectionid,r.[subject]

alter table #mainresult
add [Group] varchar(max)
,colourflag int

update r
SET r.[Group]=STUFF((SELECT distinct ',' + g.group_name
							  FROM user_effectivedate ue
							  left join user_groups g
							  on ue.group_id=g.group_id
							  WHERE ue.connectionid=r.coun_connectionid and eff_status='Y'
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM #mainresult r

 ;with cte as(
 select dense_rank()over(order by subject,date,duration,connectionid) as rnk
 ,row_number()over(partition by subject,date,duration,connectionid order by connectionid) as row_no,* from #mainresult 
)
select * into RptStgTbl_CounCasenoteCnt from cte

update RptStgTbl_CounCasenoteCnt
set colourflag=1
where connectionid is not null and rnk in(select rnk from RptStgTbl_CounCasenoteCnt where row_no>1);


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

drop table #mainresult,#result,#subresult

END


