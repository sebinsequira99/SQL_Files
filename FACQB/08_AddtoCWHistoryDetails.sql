USE MAPFACQB_STAGE
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'CW_HistoryDtls'))    
BEGIN
ALTER TABLE CW_HistoryDtls
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

INSERT INTO CW_HistoryDtls
(
CW_UserID
,Group_ID
,ConnID
,ConnectionID
,StartDate
,EndDate
,ActiveYN
,CreatedBy
,CreatedDate
,LastModifiedBy
,LastModifiedDate
,ImportFlag
)
SELECT C.CW_UserID
,C.Group_ID
,((C.ConnID *-1)+100000)*-1
,C.ConnectionID+100000
,C.StartDate
,C.EndDate
,C.ActiveYN
,C.CreatedBy+100000
,C.CreatedDate
,C.LastModifiedBy+100000
,C.LastModifiedDate
,'Y'
FROM MAPFAC.DBO.CW_HistoryDtls c
JOIN USER_ACCOUNTS U 
ON U.USER_ID = C.CW_UserID
WHERE C.ConnID < -19389
go

--68

INSERT INTO CW_HistoryDtls
(
CW_UserID
,Group_ID
,ConnID
,ConnectionID
,StartDate
,EndDate
,ActiveYN
,CreatedBy
,CreatedDate
,LastModifiedBy
,LastModifiedDate
,ImportFlag
)
SELECT (CW_UserID+100000)
,Group_ID
,ConnID
,ConnectionID
,StartDate
,EndDate
,ActiveYN
,CreatedBy
,CreatedDate
,LastModifiedBy
,LastModifiedDate
,'Y'
FROM MAPFAC.DBO.CW_HistoryDtls
WHERE CW_UserID IN (13458
,13454
,13453
,13455
,13451
,13450
,13438
,13437
,13436
,13435
,13433)

--19

