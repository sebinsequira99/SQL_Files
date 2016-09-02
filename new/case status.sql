

lkpconnectionstatus where connectionstatusid=15

select distinct replace(displayname,'amp;','') from rel_relationship where connectionstatusid=15

connectionstatuslog where connectionid in(select connectionid from rel_relationship where connectionstatusid=15)


select * from rel_relationship where displayname like '%TRAJANO, DOLORES%'

select * from connectionstatuslog where connectionid =543702
order by ConnectionStatusStartDate


select distinct replace(r.displayname,'amp;','') as clientname
,l.ConnectionStatusText
,c.ConnectionStatusLogRemarks
,cast(c.ConnectionStatusStartDate as date) as ConnectionStatusStartDate
 from connectionstatuslog c
join rel_relationship r
on c.connectionid=r.connectionid
and (abs(c.connid)=r.contactid or abs(c.connid)=r.contactid2 or c.connid=r.connid)
and r.connectionstatusid=15
join lkpconnectionstatus l
on c.ConnectionStatusId=l.ConnectionStatusId
where c.connectionid in(select connectionid from rel_relationship where connectionstatusid=15)
and (c.connid in(select connid from rel_relationship where connectionstatusid=15)
or abs(c.connid) in(select contactid from rel_relationship where connectionstatusid=15)
or abs(c.connid) in(select contactid2 from rel_relationship where connectionstatusid=15))
and replace(r.displayname,'amp;','') in(select distinct replace(displayname,'amp;','') from rel_relationship where connectionstatusid=15)
order by clientname,connectionstatusstartdate
