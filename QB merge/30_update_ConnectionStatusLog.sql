

update MAPFCS.dbo.ConnectionStatusLog 
set OldConnectionID='-1'
WHERE OldConnectionID = '*'

