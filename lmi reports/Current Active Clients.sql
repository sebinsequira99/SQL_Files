

use maplmi

IF exists (select 1 from sys.objects where name='StgTbl_ActiveclientsRpt' and type='u')
DROP TABLE StgTbl_ActiveclientsRpt;

;with activeclients as 
(
SELECT replace(r.displayname,'amp;','') as ClientName
	  ,cs.ConnectionStatusText as CaseStatus
	  ,r.RelLabel as CaseNumber
	  ,ltrim(rtrim(ug.group_name)) as GroupName
	  ,ue.effectivedate
	  ,ue.end_date
	  ,r.connectionid
	  ,r.relationshiptypeid
	  ,r.RelationshipDateLastUpdated
	  ,csl.ConnectionStatusDate
	  ,csl.ConnectionStatusStartDate
	  ,csl.ConnectionStatusId
	  ,lcs.ConnectionStatusText

From Rel_Relationship r
LEFT JOIN lkpConnectionStatus cs on r.ConnectionStatusId = cs.ConnectionStatusId
LEFT JOIN user_effectiveDate ue on r.ConnectionId = ue.ConnectionId and ue.connid in (dbo.udf_CoupleConnId(r.connid ,1),dbo.udf_CoupleConnId(r.connid ,2),r.connid)
LEFT JOIN user_groups ug on ue.group_id = ug.group_id
LEFT JOIN rel_lkp_relationshiptype rt on r.relationshiptypeid=rt.relationshiptypeid
LEFT JOIN rel_lkp_relationshipsubtype rs on rt.relationshipsubtypeid=rs.relationshipsubtypeid
LEFT JOIN connectionstatuslog csl on r.connectionid=csl.connectionid
LEFT JOIN lkpConnectionStatus lcs on csl.ConnectionStatusId = lcs.ConnectionStatusId

where 
--cs.ConnectionStatusText='active' and 
rs.Rel_SubType_isProgram=1 
and r.rellabel is not null and r.rellabel<>''
--and (ug.group_name='HomeStudy Only' or ug.group_name='Primary Provider Services Only-Various Countries')
)

select * into StgTbl_ActiveclientsRpt
from activeclients a
where clientname not like 'test,%' 
  and clientname not like '% test %'
  and clientname not like '%, test'
  and clientname not like '%media%test%'
  and clientname not like '%client%test%'
--left join rel_relationship r 
--on a.connectionid=r.connectionid
--order by a.connectionid

alter table StgTbl_ActiveclientsRpt
add ConnectionStatusEndDate datetime
   ,Active_EndDate			datetime
   ,grp_enddate				datetime

go

update st
set st.ConnectionStatusEndDate=ss.ConnectionStatusStartDate
from StgTbl_ActiveclientsRpt st
join StgTbl_ActiveclientsRpt ss
on st.clientname=ss.clientname
where st.CaseStatus='closed' and st.ConnectionStatusText='active' and ss.ConnectionStatusText='closed'

delete from StgTbl_ActiveclientsRpt
where CaseStatus='closed' and ConnectionStatusText='closed'

update StgTbl_ActiveclientsRpt
set ConnectionStatusText=casestatus
where ConnectionStatusText is null

delete from StgTbl_ActiveclientsRpt
where ConnectionStatusText<>'active'

update StgTbl_ActiveclientsRpt
set ConnectionStatusStartDate=RelationshipDateLastUpdated
where ConnectionStatusStartDate is NULL

update StgTbl_ActiveclientsRpt
set ConnectionStatusStartDate=RelationshipDateLastUpdated
where ConnectionStatusStartDate is NULL

update StgTbl_ActiveclientsRpt
set Active_EndDate=ConnectionStatusEndDate

update StgTbl_ActiveclientsRpt
set Active_EndDate=ConnectionStatusEndDate

update StgTbl_ActiveclientsRpt
set grp_enddate=end_date

update StgTbl_ActiveclientsRpt
set Active_EndDate=convert(varchar(10),dateadd(day,1,getdate()),121)
where Active_EndDate is null

update StgTbl_ActiveclientsRpt
set end_date=convert(varchar(10),dateadd(day,1,getdate()),121)
where end_date is null

;with duptbl as 
(select row_number() 
over (partition by clientname,casestatus,casenumber,groupname,effectivedate,end_date 
order by clientname) as dup,* from StgTbl_ActiveclientsRpt
)

delete from duptbl where dup>1




