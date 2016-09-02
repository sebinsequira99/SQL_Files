USE MAPFACQB_STAGE
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'User_EffectiveDate'))    
BEGIN
ALTER TABLE User_EffectiveDate
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/
INSERT INTO User_EffectiveDate
(
user_id
,group_id
,effectiveDate
,eff_status
,end_date
,ConnectionId
,ConnId
,NoGroup
,ImportFlag
)
SELECT user_id + 100000
,group_id
,effectiveDate
,eff_status
,end_date
,ConnectionId + 100000
,((ConnId * -1)+100000)*-1
,NoGroup
,'Y'
FROM MAPFAC.DBO.User_EffectiveDate
WHERE CONNID < -19389
GO

--43
INSERT INTO User_EffectiveDate
(
user_id
,group_id
,effectiveDate
,eff_status
,end_date
,ConnectionId
,ConnId
,NoGroup
,ImportFlag
)
SELECT user_id 
,group_id
,effectiveDate
,eff_status
,end_date
,ConnectionId 
,ConnId 
,NoGroup
,'Y'
FROM MAPFAC.DBO.User_EffectiveDate
WHERE USER_ID IN (13463)
GO