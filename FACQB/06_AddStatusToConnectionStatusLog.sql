USE MAPFACQB_STAGE
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldConnectionID' AND Object_ID = Object_ID(N'CONNECTIONSTATUSLOG'))    
BEGIN
ALTER TABLE CONNECTIONSTATUSLOG
ADD OldConnectionID VARCHAR(5)
END
GO
/********************************************************************************************************************/
INSERT INTO CONNECTIONSTATUSLOG
(
ConnectionStatusId
,ConnId
,ConnectionId
,ConnectionStatusDate
,CWConnId
,ConnectionStatusLogRemarks
,ConnectionStatusLogIsDeleted
,ConnectionStatusStartDate
,OldConnectionID
)
SELECT C.ConnectionStatusId
,CASE
	WHEN C.CONNID<0 THEN ((C.CONNID *-1) + 100000) * -1
	ELSE C.CONNID + 100000
	END
,C.ConnectionId + 100000
,C.ConnectionStatusDate
,C.CWConnId
,C.ConnectionStatusLogRemarks
,C.ConnectionStatusLogIsDeleted
,C.ConnectionStatusStartDate
,C.ConnectionId
FROM MAPFAC.DBO.ConnectionStatusLog C
JOIN MAPFAC.DBO.REL_RELATIONSHIP R
ON R.CONNECTIONID = C.CONNECTIONID
WHERE R.contactid > 19389

--357

INSERT INTO CONNECTIONSTATUSLOG
(
ConnectionStatusId
,ConnId
,ConnectionId
,ConnectionStatusDate
,CWConnId
,ConnectionStatusLogRemarks
,ConnectionStatusLogIsDeleted
,ConnectionStatusStartDate
,OldConnectionID
)
SELECT 
ConnectionStatusId
,ConnId
,ConnectionId
,ConnectionStatusDate
,CWConnId
,ConnectionStatusLogRemarks
,ConnectionStatusLogIsDeleted
,ConnectionStatusStartDate
,ConnectionID
FROM MAPFAC.DBO.ConnectionStatusLog
WHERE ConnectionId = 104167