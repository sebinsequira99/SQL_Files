

set identity_insert lkpConnectionStatus on

insert into lkpConnectionStatus(ConnectionStatusId
,ConnectionStatusText
,RelationshipSubTypeId
,ConnectionStatusIsDefault
,IsDeleted
,IsClosedStatus
,IsMergeConnection
,Rel_CustomTemplateId
,isPlacementStatus)
select ConnectionStatusId
,ConnectionStatusText
,RelationshipSubTypeId
,ConnectionStatusIsDefault
,IsDeleted
,IsClosedStatus
,IsMergeConnection
,Rel_CustomTemplateId
,isPlacementStatus
from mapfac_old_test..lkpConnectionStatus
where ConnectionStatusId in(
-14
,-13
,-12
,-11
,-10)

set identity_insert lkpConnectionStatus off

insert into lkpConnectionStatus(
ConnectionStatusText
,RelationshipSubTypeId
,ConnectionStatusIsDefault
,IsDeleted
,IsClosedStatus
,IsMergeConnection
,Rel_CustomTemplateId
,isPlacementStatus)
select 
ConnectionStatusText
,RelationshipSubTypeId
,ConnectionStatusIsDefault
,IsDeleted
,IsClosedStatus
,IsMergeConnection
,Rel_CustomTemplateId
,isPlacementStatus
from mapfac_old_test..lkpConnectionStatus
where ConnectionStatusId in(
1
,2
,3
,4
)

update lkpConnectionStatus
set RelationshipSubTypeId=9
where connectionstatusid in(16
,17
,18
,19
,-14
,-13
,-12
,-11
,-10
)

update rel_relationship
set ConnectionStatusId=
case when ConnectionStatusId=1 then 16
when ConnectionStatusId=2 then 17
when ConnectionStatusId=3 then 18
when ConnectionStatusId=4 then 19
else ConnectionStatusId
end
where connectionid>100000

update connectionstatuslog
set ConnectionStatusId=
case when ConnectionStatusId=1 then 16
when ConnectionStatusId=2 then 17
when ConnectionStatusId=3 then 18
when ConnectionStatusId=4 then 19
else ConnectionStatusId
end
where connectionid>100000