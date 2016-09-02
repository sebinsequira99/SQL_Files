

mapsdc

maplmi..StgTbl_PlacementRpt

select connectionid,rellabel from rel_relationship
where relationshiptypeid in(-101,-102,-103,-104) 
group by connectionid,rellabel
having count(connectionid)>1
order by connectionid


;with dup as
(
select row_number()over(partition by connectionid,relationshiptypeid,displayname order by connectionid) as row_no,*
from rel_relationship
where relationshiptypeid in(-101,-102,-103,-104) 
)

select * from dup where row_no >1
and connectionid is not null


select distinct replace(displayname,'amp;','') as [Client Name]
from rel_relationship where connectionid is null and DisplayName<>'Unknown, Unknown'

select * from rel_relationship where contactid=163668

update rel_relationship set connectionid=574699
,rellabel='Adopt160307.01-BP'
where RelationshipID=574699

user_effectivedate 
where user_id=156746


