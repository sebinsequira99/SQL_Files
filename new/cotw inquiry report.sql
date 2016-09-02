

use mapcow

IF exists (select 1 from sys.objects where name='StgTbl_InquiryRpt' and type='u')
DROP TABLE StgTbl_InquiryRpt;

SELECT i.inquiry_id
      ,i.agency_id
      ,i.user_type
      ,i.first_name
      ,i.last_name
      ,i.email_id
	  ,i.updated_date

INTO StgTbl_InquiryRpt
FROM inquiry_master I

ALTER TABLE StgTbl_InquiryRpt
ADD contactid int
,fname varchar(200)
,lname varchar(200)
,displayname varchar(100) 
,connectionstatusid int
,GroupName varchar(max)
,userID int
,CaseNO varchar(200)

GO

UPDATE I
SET I.contactid=c.contactid
,I.fname=c.fname
,I.lname=c.lname
,I.displayname=CASE 
			   WHEN replace(r.displayname,'&amp;','&') is null 
			   THEN i.last_name + ', ' + i.first_name
			   ELSE replace(r.displayname,'&amp;','&')
			   END
,I.connectionstatusid=r.connectionstatusid
,i.caseno=r.rellabel
,i.userid=r.[user_id]
FROM StgTbl_InquiryRpt I
LEFT JOIN contact c
ON I.first_name=c.fname
AND I.last_name=c.lname
LEFT JOIN rel_relationship r
ON r.contactid=c.contactid or r.contactid2=c.contactid
INNER JOIN rel_lkp_relationshiptype rl
on r.relationshiptypeid=rl.relationshiptypeid
INNER JOIN rel_lkp_relationshipsubtype rs
on rl.relationshipsubtypeid=rs.relationshipsubtypeid
WHERE rs.Rel_SubType_isProgram=1

UPDATE I
SET I.contactid=abs(u.connid)
,I.fname=u.first_name
,I.lname=u.last_name
,I.displayname=CASE 
			   WHEN replace(r.displayname,'&amp;','&') is null 
			   THEN i.last_name + ', ' + i.first_name
			   ELSE replace(r.displayname,'&amp;','&')
			   END
,I.connectionstatusid=r.connectionstatusid
,i.caseno=r.rellabel
,i.userid=r.[user_id]
FROM StgTbl_InquiryRpt I
LEFT JOIN user_accounts u
ON i.email_id=u.username
LEFT JOIN rel_relationship r
ON r.contactid=abs(u.connid) or r.contactid2=abs(u.connid)
INNER JOIN rel_lkp_relationshiptype rl
on r.relationshiptypeid=rl.relationshiptypeid
INNER JOIN rel_lkp_relationshipsubtype rs
on rl.relationshipsubtypeid=rs.relationshipsubtypeid
WHERE rs.Rel_SubType_isProgram=1 and i.displayname is null


drop table #result,#main

select r.displayname
,ft.task_id
,replace(r.displayname,'amp;','') as formcompleted_user
,i.displayname as inquiry_user
,i.updated_date
,ft.startdate
,r.user_id
into #result
from formmaker_taskstatus ft
inner join rel_relationship r
on ft.connectionid=r.connectionid and (abs(ft.connid)=r.contactid or abs(ft.connid)=r.contactid2)
left join StgTbl_InquiryRpt i
on replace(r.displayname,'amp;','')=i.displayname
where ft.task_id in(1,2) 
and ft.stage_id=1 
and ft.phase_id=1967 
and ft.task_status='Done' 
and i.displayname is not null
order by r.displayname,ft.task_id

select formcompleted_user
,updated_date as inquiry_date
,startdate as form_submission_date
,[user_id]
into #main
from #result
where displayname in(
select displayname from #result
group by displayname 
having count(displayname)>1)
and task_id=1

UPDATE a
SET a.GroupName=STUFF((SELECT distinct ',' + g.group_name
							  FROM user_effectivedate r
							  inner join user_groups g on 
							  r.group_id=g.group_id
							  WHERE a.[userid] = r.[user_id] and eff_status='Y'
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM StgTbl_InquiryRpt a

select s.displayname
,case when m.form_submission_date is null then 'No'
else 'Yes'
end
as iscomplete
,s.first_name
,s.last_name
,s.email_id
,s.updated_date
,m.form_submission_date 
,s.caseno
,s.groupname
from StgTbl_InquiryRpt s
left join #main m
on m.formcompleted_user=s.displayname and m.inquiry_date=s.updated_date

