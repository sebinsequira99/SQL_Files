USE MAPFCAD_TEST
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'caseworker_client'))    
BEGIN
ALTER TABLE caseworker_client
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/
INSERT INTO CASEWORKER_CLIENT
(
parentid
,caseworkerid
,created_date
,ClientConnId
,CWConnId
,ConnectionId
,ImportFlag
)
SELECT (parentid+100000)
,(caseworkerid+100000)
,created_date
,((ClientConnId*-1)+100000)*-1
,((CWConnId*-1)+100000)*-1
,(ConnectionId+100000)
,'Y'
FROM MAPFAC.DBO.CASEWORKER_CLIENT

