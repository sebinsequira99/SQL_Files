


lkpconnectionstatus where connectionstatusid=15


select replace(displayname,'amp;','') as clientname,* from rel_relationship where connectionstatusid=15

connectionstatuslog where connectionid in(select connectionid from rel_relationship where connectionstatusid=15)


select replace(r.displayname,'amp;','') as clientname
,l.ConnectionStatusText
,c.ConnectionStatusLogRemarks
,c.ConnectionStatusStartDate
 from connectionstatuslog c
join rel_relationship r
on c.connectionid=r.connectionid
and (abs(c.connid)=r.contactid or abs(c.connid)=r.contactid2 or c.connid=r.connid)
join lkpconnectionstatus l
on c.ConnectionStatusId=l.ConnectionStatusId
where c.connectionid in(select connectionid from rel_relationship where connectionstatusid=15)
order by clientname,connectionstatusstartdate


