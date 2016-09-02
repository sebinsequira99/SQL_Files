USE MAPFACQB_STAGE
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
,caseworkerid
,created_date
,((ClientConnId*-1)+100000)*-1
,CWConnId
,(ConnectionId+100000)
,'Y'
FROM MAPFAC.DBO.CASEWORKER_CLIENT
WHERE  clientconnid <-19389 
and CWConnId >=-19389
GO

--46

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
SELECT parentid
,(caseworkerid+100000)
,created_date
,ClientConnId
,((CWConnId*-1)+100000)*-1
,ConnectionId
,'Y'
FROM MAPFAC.DBO.CASEWORKER_CLIENT
WHERE  CWConnId <-19389 
and clientconnid >=-19389 
GO

--10

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
SELECT parentid
,(caseworkerid+100000)
,created_date
,ClientConnId
,((CWConnId*-1)+100000)*-1
,ConnectionId
,'Y'
FROM MAPFAC.DBO.CASEWORKER_CLIENT
WHERE  CWConnId <-19389 
and clientconnid <-19389 
GO

--6