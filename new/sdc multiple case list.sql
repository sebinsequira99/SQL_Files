

mapsdc

--EXEC clientlist_multiplecases '196', '' , '', '', '' ,'' ,'' , '' , '' , '' ,'','0','8125';

IF exists (select 1 from sys.objects where name='Tblclientlist_multiplecases' and type='u')
DROP TABLE Tblclientlist_multiplecases;

CREATE TABLE Tblclientlist_multiplecases
			(
			 GroupName	varchar(max)
			,Program	varchar(max)
			,[Role]	varchar(max)
			,ClientName varchar(max)	
			,CurrentCaseStatus varchar(max)
			,CaseNumber varchar(max)
			,username varchar(max)	
			,PhaseName varchar(max)
			,connectionid int
			);

INSERT INTO Tblclientlist_multiplecases 
EXEC clientlist_multiplecases '196', '' , '', '', '' ,'' ,'' , '' , '' , '' ,'','0','8125';

--drop table #clients
--drop table #aps
--drop table #childs

;with dup as(
select row_number()over(partition by clientname order by clientname) as rno,* from Tblclientlist_multiplecases)

select dense_rank()over(order by clientname) as rnk,* into #clients from dup

--select * from #clients 
--where rnk in(select distinct rnk from #clients where rno>1)
--order by clientname

select * into #aps from #clients where [Role]='Adoptive Parent' 
and rnk in(select distinct rnk from #clients where rno>1)
select * into #childs from #clients where [Role]='Child' 

select a.*,c.clientname as childname into #result from #aps a
left join #childs c
on a.connectionid=c.connectionid
order by a.clientname


;with dup as (
select row_number()over(partition by GroupName	
,Program	
,Role	
,ClientName	
,CurrentCaseStatus	
,CaseNumber	
,username	
,PhaseName	
,connectionid	
,childname order by ClientName)as sno,* from #result)

delete from dup where sno>1

--select * from #result
--order by clientname

alter table #result
add casestartdate datetime

alter table #result
add cwnames varchar(max)

alter table #result
add contactid int

update r
set r.casestartdate=rl.relationshipdatelastupdated
from #result r
inner join rel_relationship rl
on r.casenumber=rl.rellabel
and r.clientname=rl.displayname
and r.connectionid=rl.connectionid

update r
set r.contactid=rl.contactid
from #result r
inner join rel_relationship rl
on r.casenumber=rl.rellabel
and r.clientname=rl.displayname
and r.connectionid=rl.connectionid

UPDATE r
SET r.cwnames=STUFF((SELECT distinct ',' + concat(ua.first_name,' ',ua.last_name)
							  FROM cw_historydtls c
							  inner join user_accounts ua
							  on c.cw_userid=ua.user_id
							  WHERE r.contactid=abs(c.connid) and r.connectionid=c.connectionid and c.enddate is null
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM #result r

IF exists (select 1 from sys.objects where name='Tbl_Multiplecaselist' and type='u')
DROP TABLE Tbl_Multiplecaselist;

select * into Tbl_Multiplecaselist from #result