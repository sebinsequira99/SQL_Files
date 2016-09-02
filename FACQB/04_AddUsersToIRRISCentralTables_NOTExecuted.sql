USE MAPFACQB_STAGE
GO

/***************Insert newly entered users in User_Accounts to Map_User_Accounts****************/
INSERT INTO IRRISCentral.dbo.map_user_accounts 
(
map_username
,map_password
,map_encryption
)
SELECT username,
password,
'Y'
FROM USER_ACCOUNTS 
WHERE OldUserID IS NOT NULL
go

/***************Insert newly entered users in Map_User_Accounts to Map_User_Agencies****************/

INSERT INTO IRRISCENTRAL.dbo.map_user_agencies
(map_user_id,
 map_agency_id,
 user_id,
 status
 ) 
SELECT MUA.map_user_id,
'212',
UA.user_id,
'Active'
FROM IRRISCENTRAL.dbo.map_user_accounts MUA
JOIN user_accounts UA ON UA.username = MUA.map_username
WHERE UA.OldUserID IS NOT NULL 
go