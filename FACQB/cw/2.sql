select connid,* from user_accounts where connid < -19389

select * from contactemail where contactid = 19493

SELECT (USER_ID + 100000)
,'restore'+username
,password
,first_name
,last_name
,'restore'+email
,phone
,address1
,address2
,city
,state
,zipcode
,country
,website
,user_type
,datejoined
,status
,agency_id
,(airs_contact_id + 100000)
,(airs_contactairs_id + 100000)
,((ConnId *-1)+100000) *-1
,case_worker_parent_user_id
,Status_Mode
,membership
FROM USER_ACCOUNTS
where CONNID < -19389

INSERT INTO user_notifications (un_user_id, un_email_id, un_notify_email, un_notify_sms, un_phone_number, un_carrier_id) 
SELECT (un_user_id+100000)
	,	un_email_id
	,	'1'
	,	0
	,	''
	,	'11'
FROM MAPFAC.DBO.user_notifications
where un_user_id between 13433  and 13472

select * from user_notifications where un_user_id between 13433  and 13472

select * from  USER_ACCOUNTS  where user_id = 13440

select * from rel_relationship where contactid > 19389 order by contactid

SELECT CASE 
			WHEN RELATIONSHIPID<0 THEN ((RELATIONSHIPID *-1) + 100000) * -1
			ELSE RELATIONSHIPID + 100000
			END,
		CONTACTID + 100000,
		RELATIONSHIPTYPEID,
		RECRELATIONSHIPID,
		RELATIONSHIPDATELASTUPDATED,
		CONNECTIONSTATUSID,
		CASE 
			WHEN CONNID<0 THEN ((CONNID *-1) + 100000) * -1
			ELSE CONNID + 100000
			END,
		CASE 
			WHEN CONNECTIONID<0 THEN ((CONNECTIONID *-1) + 100000) * -1
			ELSE CONNECTIONID + 100000
			END,
		RELSEQ,
		RELENDDATE,
		RELLABEL,
		CASE
			WHEN CONTACTID2>0 THEN CONTACTID2 + 100000
			ELSE CONTACTID2
			END,
		DISPLAYNAME,
		USER_ID + 100000,
		CASE
			WHEN CREATEDBY>0 THEN CREATEDBY + 100000
			ELSE CREATEDBY
			END,
		CREATEDDATE,
		CASE
			WHEN UPDATEDBY>0 THEN UPDATEDBY + 100000
			ELSE UPDATEDBY
			END,
		UPDATEDDATE
FROM REL_RELATIONSHIP
WHERE contactid > 19389
order by contactid

select * from rel_lkp_relationshiptype where relationshiptypeid = -101

SELECT C.* FROM CONNECTIONSTATUSLOG C
JOIN REL_RELATIONSHIP R
ON R.CONNECTIONID = C.CONNECTIONID
AND R.CONNID = C.CONNID
WHERE R.contactid > 19389

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
FROM MAPFAC.DBO.ConnectionStatusLog C
JOIN MAPFAC.DBO.REL_RELATIONSHIP R
ON R.CONNECTIONID = C.CONNECTIONID
WHERE R.contactid > 19389

select * from user_effectivedate 
where connid < -19389
JOIN MAPFAC.DBO.REL_RELATIONSHIP R
ON R.CONNECTIONID = u.CONNECTIONID
WHERE R.contactid > 19389

select * from CW_HistoryDtls where connid < -19389

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
FROM CW_HistoryDtls
WHERE ConnID < -19389

select * from CW_HistoryDtls where cw_userid in(13458
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
select * from rel_relationship where connectionid = 103081

select connid,* from user_accounts where connid < -19389 and user_type = 'agency_user'

select connid,* from user_accounts where user_id = 13473

select * from user_accounts where connid in (-19346
,-19063
,-15575
,-19365
,-19365
,-19063
,-15398
,-19245
,-19335)

select * from user_accounts where user_id in (13428
,13349
,8293
,13431
,13431
,13349
,13463
,13398
,13424)

