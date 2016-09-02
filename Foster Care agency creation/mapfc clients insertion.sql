
mapfc

--individual

set identity_insert rel_relationship on

insert into rel_relationship(
 RelationshipID
,ContactId
,RelationshipTypeId
,RecRelationshipId
,RelationshipDateLastUpdated
,RelSeq
,ConnId
,ConnectionId
,ContactId2
,DisplayName
)

select -(contactid)
,contactid
,0
,-100000
,getdate()
,0
,-(contactid)
,-(contactid)
,0
,lname+', '+fname

from contact where contactid>1391

set identity_insert rel_relationship off

update r
set r.user_id=u.user_id
from rel_relationship r
join user_accounts u
on r.connid=u.connid
where r.contactid >1391


--single

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RecRelationshipId
,RelationshipDateLastUpdated
,ConnId
,RelSeq
,ContactId2
,DisplayName
)

select 
contactid
,-3005
,-110000
,getdate()
,-(contactid)
,10
,0
,lname+', '+fname

from contact where contactid>1391
and contactid not in(1395
,1396
,1423
,1424
,1426
,1427
,1428
,1429)


update r
set r.connectionid=r.relationshipid
,r.rellabel=r.relationshipid
from rel_relationship r
where r.contactid >1391 and r.RelationshipTypeId=-3005

update r
set r.user_id=u.user_id
from rel_relationship r
join user_accounts u
on r.connid=u.connid
where r.contactid >1391 and r.RelationshipTypeId=-3005

--partners

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RelationshipDateLastUpdated
,ConnId
,RelSeq
,ContactId2
,DisplayName
,createdby
,createddate
)

select 
contactid
,-3004
,getdate()
,-(contactid)
,0
,0
,lname+', '+fname
,1
,getdate()

from contact where contactid>1391
and contactid in(1395
,1396
,1428
,1429
,1427
,1426
,1423
,1424)


update r
set r.user_id=u.user_id
from rel_relationship r
join user_accounts u
on r.connid=u.connid
where r.contactid >1391 and r.RelationshipTypeId=-3004

update r
set r.connectionid=91
from rel_relationship r
where r.contactid >1391 and r.RelationshipID in(91
,92)


--child placement

--parent

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RelationshipDateLastUpdated
,ConnId
,RelSeq
,Rellabel
,ConnectionStatusId
,ContactId2
,DisplayName
,User_ID
,createdby
,createddate
)

select 
contactid
,-101
,getdate()
,28
,0
,'FosterCare151116.28-FP'
,-10
,0
,lname+', '+fname
,8200
,1
,getdate()

from contact where contactid=1422

rel_relationship where contactid=1422


update rel_relationship
set ConnectionId=RelationshipID
where contactid=1422 and RelationshipTypeId=-101

--child

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RelationshipDateLastUpdated
,ConnId
,connectionid
,RelSeq
,Rellabel
,ConnectionStatusId
,ContactId2
,DisplayName
,User_ID
,createdby
,createddate
)

select 
contactid
,-104
,getdate()
,77
,166
,0
,'Foster151116.47-Child'
,-10
,0
,lname+', '+fname
,8255
,1
,getdate()

from contact where contactid=1477

rel_relationship where contactid=1477


update rel_relationship
set rellabel='Foster151116.20-Child'
where contactid=1450 and RelationshipTypeId=-104



--child placement for partners

--parent

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RelationshipDateLastUpdated
,ConnId
,RelSeq
,Rellabel
,ConnectionStatusId
,ContactId2
,DisplayName
,User_ID
,createdby
,createddate
)

select 
1429
,-101
,getdate()
,91
,0
,'FosterCare151116.32-FP'
,-10
,1428
,'POORMAN, ROSS & AIMIE'
,8204
,1
,getdate()


rel_relationship where contactid=1429

update rel_relationship
set ConnectionId=RelationshipID
where contactid=1429 and RelationshipTypeId=-101

--child

insert into rel_relationship(
ContactId
,RelationshipTypeId
,RelationshipDateLastUpdated
,ConnId
,connectionid
,RelSeq
,Rellabel
,ConnectionStatusId
,ContactId2
,DisplayName
,User_ID
,createdby
,createddate
)

select 
contactid
,-104
,getdate()
,84
,177
,0
,'Foster151116.54-Child'
,-10
,0
,lname+', '+fname
,8262
,1
,getdate()

from contact where contactid=1484

rel_relationship where contactid=1484



update rel_relationship
set ConnectionStatusId=1
where RelationshipTypeId in(-101,-104)