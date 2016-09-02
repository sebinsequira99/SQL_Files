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
)
SELECT CW_UserID
,Group_ID
,((ConnID *-1)+100000)*-1
,ConnectionID+100000
,StartDate
,EndDate
,ActiveYN
,CreatedBy+100000
,CreatedDate
,LastModifiedBy+100000
,LastModifiedDate
FROM MAPFAC.DBO.CW_HistoryDtls
WHERE ConnID < -19389

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
)
SELECT CW_UserID
,Group_ID
,((ConnID *-1)+100000)*-1
,ConnectionID+100000
,StartDate
,EndDate
,ActiveYN
,CreatedBy+100000
,CreatedDate
,LastModifiedBy+100000
,LastModifiedDate
FROM MAPFAC.DBO.CW_HistoryDtls
WHERE ConnID < -19389