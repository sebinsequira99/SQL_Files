

CREATE PROC usp_LoadStgTbl_RptTaskStatus
AS
BEGIN

IF EXISTS (select 1 from sys.objects where name='rpttaskstatus' and type='u')
DROP TABLE rpttaskstatus

select p.phase,ft.phase_id,ft.stage_id,ft.task_id,ft.task_status
,r.connectionid,r.contactid,ft.user_id,replace(r.displayname,'amp;','') as clientname
,r.rellabel,rt.relationshiptypetext,r.connectionstatusid,lc.connectionstatustext,ft.startdate
into #result
from formmaker_taskstatus ft
inner join formmaker_phases p
on ft.phase_id=p.phase_id
inner join rel_relationship r
on ft.connectionid=r.connectionid and abs(ft.connid)=r.contactid
inner join rel_lkp_relationshiptype rt
on r.relationshiptypeid=rt.relationshiptypeid
inner join lkpconnectionstatus lc
on r.connectionstatusid=lc.connectionstatusid

alter table #result
add taskname varchar(max) 

alter table #result
add GroupName varchar(max) 

alter table #result
add casestatus_startdate datetime

alter table #result
add email varchar(500)

alter table #result
add phone varchar(100)

update r
set r.taskname=t.task
from #result r
inner join formmaker_tasks t
on r.phase_id=t.phase_id
and r.stage_id=t.stage_id
and r.task_id=t.task_id

UPDATE a
SET a.GroupName=STUFF((SELECT distinct ',' + g.group_name
							  FROM user_effectivedate r
							  inner join user_groups g on 
							  r.group_id=g.group_id
							  WHERE a.[user_id] = r.[user_id] and eff_status='Y'
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM #result a

update r
set r.casestatus_startdate=c.ConnectionStatusStartDate
from #result r
inner join connectionstatuslog c
on r.connectionid=c.connectionid
and r.connectionstatusid=c.connectionstatusid

update r
set r.email=ce.ContactEmail
from #result r
inner join contactemail ce
on r.contactid=ce.contactid
and ce.PrimaryEmail=1

update r
set r.phone=cp.PhoneNumber
from #result r
inner join contactphone cp
on r.contactid=cp.contactid
and cp.PrimaryPhone=1

select * into rpttaskstatus from #result

drop table #result

END