

aaimerge

user_groups where group_name like '%international%application%'
user_groups where group_name like '%domestic%application%'

formmaker_usergroups where pg_group_id in(
944
,945
)

formmaker_submissions

formmaker_taskstatus where groupid like '%944%' or groupid like '%945%'
formmaker_taskstatus where phase_id in(2059
,2060
,2058
,2062
,2061)

drop table #result

select p.phase,ft.phase_id,ft.stage_id,ft.task_id,ft.task_status
,r.connectionid,r.contactid,ft.user_id,replace(r.displayname,'amp;','') as clientname
,r.rellabel,rt.relationshiptypetext,ft.startdate
into #result
from formmaker_taskstatus ft
inner join formmaker_phases p
on ft.phase_id=p.phase_id
inner join rel_relationship r
on ft.connectionid=r.connectionid and abs(ft.connid)=r.contactid
inner join rel_lkp_relationshiptype rt
on r.relationshiptypeid=rt.relationshiptypeid
where ft.phase_id in(2059
,2060
,2058
,2062
,2061)

alter table #result
add taskname varchar(max) 

alter table #result
add GroupName varchar(max) 

alter table #result
add effectivedate datetime

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

Update #result 
Set taskname=REPLACE(REPLACE(taskname,CHAR(13), ' '), CHAR(10), ' ')

update r
set r.effectivedate=e.effectivedate
from #result r
inner join user_effectivedate e
on r.user_id=e.user_id
and (e.group_id=944 or e.group_id=945)


