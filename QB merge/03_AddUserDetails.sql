USE MAPFCAD_TEST
GO

/******************************************Add column OldContactId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldUserID' AND Object_ID = Object_ID(N'User_Accounts'))    
BEGIN
	ALTER TABLE User_Accounts
	ADD OldUserID INT
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldUserID' AND Object_ID = Object_ID(N'user_notifications'))    
BEGIN
	ALTER TABLE user_notifications
	ADD OldUserID INT
END
GO
/******************************************************************************************************************/
/**************Insert into User_Accounts from MAPFAC to MAPFACQB***************/
SET IDENTITY_INSERT User_Accounts ON
GO

INSERT INTO [dbo].[user_accounts]
           (
		   [USER_ID],
           [username]
           ,[password]
           ,[first_name]
           ,[last_name]
           ,[email]
           ,[phone]
           ,[address1]
           ,[address2]
           ,[city]
           ,[state]
           ,[zipcode]
           ,[country]
           ,[website]
           ,[user_type]
           ,[datejoined]
           ,[status]
           ,[agency_id]
           ,[airs_contact_id]
           ,[airs_contactairs_id]
           ,[ConnId]
			,case_worker_parent_user_id
			,Status_Mode
			,membership
			,OldUserID
           )
    SELECT (USER_ID + 100000)
		,	username
		,	password
		,	first_name
		,	last_name
		,	email
		,	phone
		,	address1
		,	address2
		,	city
		,	state
		,	zipcode
		,	country
		,	website
		,	user_type
		,	datejoined
		,	status
		,	agency_id
		,	(airs_contact_id + 100000)
		,	(airs_contactairs_id + 100000)
		,	((ConnId *-1)+100000) *-1
		,	case_worker_parent_user_id
		,	Status_Mode
		,	membership
		,   USER_ID
		FROM MAPFAC.DBO.USER_ACCOUNTS
		where username not in(select username from mapfcad_test.dbo.user_accounts)
SET IDENTITY_INSERT User_Accounts OFF
GO

--51
/**************Insert into user_notifications from MAPFAC to MAPFACQB***************/
INSERT INTO user_notifications 
(
un_user_id, 
un_email_id, 
un_notify_email, 
un_notify_sms, 
un_phone_number, 
un_carrier_id,
OldUserID
) 
SELECT (un_user_id+100000)
	,	un_email_id
	,	'1'
	,	0
	,	''
	,	'11'
	,	un_user_id
FROM MAPFAC.DBO.user_notifications


--56
