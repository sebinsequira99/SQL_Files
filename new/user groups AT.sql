

mapat

select r.displayname,l.ConnectionStatusText,ue.connid,ue.user_id,ua.status,ua.status_mode 
from user_effectivedate ue
inner join rel_relationship r
on ue.connectionid=r.connectionid and ue.user_id=r.user_id
inner join lkpconnectionstatus l
on r.ConnectionStatusId=l.ConnectionStatusId
inner join user_accounts ua
on ue.user_id=ua.user_id
where ue.connid>0 and ue.eff_status='Y' and l.ConnectionStatusText='Active'
and displayname<>'Unknown, Unknown' and ua.status='Active'

--update ue
--set ue.connid=ua.connid
--from user_effectivedate ue
--inner join user_accounts ua
--on ue.user_id=ua.user_id
--where ue.user_id in(
--9321
--,12632
--,12633
--,12629
--,12631
--,15433
--,13844
--,15577
--,13513
--,15523
--,13513
--,13695
--,15669
--,10444
--,10263
--,13513
--,15615
--,15668
--,15216) and ue.connid>0
