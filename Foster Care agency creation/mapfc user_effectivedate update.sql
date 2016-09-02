
mapfc

update u
set u.connid=-(r.contactid)
,u.connectionid=r.connectionid
from user_effectivedate u
join rel_relationship r
on u.user_id=r.user_id
and r.relationshiptypeid in(-101,-104)

select * from user_effectivedate
order by connid

