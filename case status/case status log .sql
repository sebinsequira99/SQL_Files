

usp_clientsearch

select dbo.udf_CoupleConnId(371047,1)

select dbo.udf_CoupleConnectionID(-81592)
select dbo.udf_CoupleConnid(-81592,1)
select dbo.udf_FindLatestConnectionID(-81592)

sys.objects where type='FN'

rel_relationship where connectionid=453374 and connid=-81592

User Details - ConnID--81592, CoupleConnectionID-339219, ConnectionID-453374 and ProgramTypeID--100
User Details - ConnID--81592, CoupleConnectionID-339219, ConnectionID-483933 and ProgramTypeID--100
User Details - ConnID--81593, CoupleConnectionID-371047, ConnectionID-483933 and ProgramTypeID--100

user_accounts where connid in (339219
,371047)
ConnectionStatusLog where (ConnId = -81592 or ConnId = [MAPSDC].dbo.udf_CoupleConnectionID(339219)
)  and ConnectionId = 453374  and (ConnectionStatusLogIsDeleted is NULL 
or ConnectionStatusLogIsDeleted = 0)


Agency Database Selected - MAPSDC
Logged in User ID Missing
------------------------------
Some Required IDs are Missing
ConnId - '-81592', ConnectionID - '453374', AgencyID - '', CoupleConnID - '339219', 
C_AccountKey - '', User Id - 119118
------------------------------
Query to get RelationshipTypeID 
select top 1 RelationshipSubTypeId from Rel_lkp_RelationshipSubType where RelationshipSubTypeId
in (select RelationshipSubTypeId from Rel_lkp_RelationshipType where RelationshipTypeId in(
select RelationshipTypeId from rel_relationship  where connectionid='453374'))
RelationshipSubTypeID - -100
Case Status Grid XML page
-12

User Details - ConnID--81592, CoupleConnectionID-339219, ConnectionID-453374 and ProgramTypeID--100

Connection Status Grid Query 
SELECT C.ConnectionStatusLogId,C.ConnectionStatusId,L.ConnectionStatusText,
L.RelationshipSubTypeId,C.ConnectionStatusLogRemarks,L.IsClosedStatus,C.CWConnId,
C.ConnectionStatusLogIsDeleted,
CONVERT(VARCHAR(10), C.ConnectionStatusDate, 110) as ConnectionStatusDate, 
CONVERT(VARCHAR(8), C.ConnectionStatusDate, 108) as ConnectionStatusTime, 
CONVERT(VARCHAR(10), C.ConnectionStatusStartDate, 110) as ConnectionStatusStartDate, 
CONVERT(VARCHAR(8), C.ConnectionStatusStartDate, 108) as ConnectionStatusStartTime 
FROM [MAPSDC].dbo.lkpConnectionStatus L
INNER JOIN [MAPSDC].dbo.ConnectionStatusLog C
ON C.ConnectionStatusId = L.ConnectionStatusId where
(C.ConnId = -81592 or C.ConnId = [MAPSDC].dbo.udf_CoupleConnectionID(339219)
)  and C.ConnectionId = 453374 and (C.ConnectionStatusLogIsDeleted is NULL 
or C.ConnectionStatusLogIsDeleted = 0) 
order by C.ConnectionStatusStartDate desc,C.ConnectionStatusLogId desc