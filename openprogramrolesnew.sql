


--query to select childs who are not adopted by anyone
=========================================================

select connectionid from OpenProgramRolesNew where connectionid not in (
SELECT distinct r.connectionid 

FROM rel_relationship r 

JOIN OpenProgramRolesNew AS o
ON r.ConnectionId = o.ConnectionId

where r.RelationshipTypeId = -101)
