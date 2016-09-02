USE MAPFCAD_TEST
GO

/******************************************Add column OldContactActivityContent_id ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactActivityContent_id' AND Object_ID = Object_ID(N'ContactActivityContent'))    
BEGIN
ALTER TABLE ContactActivityContent
ADD OldContactActivityContent_id INT
END
GO
/********************************************************************************************************************/
INSERT INTO ContactActivityContent
(
ContactActivityId,
ActContent,
OldContactActivityContent_id
)
SELECT C.ContactActivityId
,CA.ActContent
,CA.ContactActivityContent_id
FROM MAPFAC.DBO.ContactActivityContent CA
JOIN ContactActivity C
ON C.OLDContactActivityID = CA.ContactActivityID
WHERE C.OLDContactActivityID IS NOT NULL



