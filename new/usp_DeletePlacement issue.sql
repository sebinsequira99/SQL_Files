

mapdev

select * from rel_relationship 
where 
 RelationshipTypeId not in(0,-3005) and (displayname like '%bm, arun%'
or displayname like '%child1, arun%'
or displayname like '%child2, arun%'
or displayname like '%ap, arun%')


select * from rel_relationship 
where 
 RelationshipTypeId not in(0,-3005) and (displayname like '%bm, anna%'
or displayname like '%child1, anna%'
or displayname like '%child2, anna%'
or displayname like '%ap, anna%')

usp_deleteplacement