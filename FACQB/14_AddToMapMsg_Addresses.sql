USE MAPFACQB_STAGE
GO

/******************************************Add column Oldupload_id ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldAddressid' AND Object_ID = Object_ID(N'MapMsg_addresses'))    
BEGIN
ALTER TABLE MapMsg_addresses
ADD OldAddressid INT
END
GO
/********************************************************************************************************************/

INSERT INTO MapMsg_addresses
(
Msg_Type
,Msg_address
,groupId
,Msg_name
,Msg_deleted
,receiver_connId
,connectionId
,receiver_userId
,receiver_status
,receiver_archive
,sender_archive
,OldAddressid
)
SELECT Msg_Type
,Msg_address
,groupId
,Msg_name
,Msg_deleted
,((receiver_connId*-1)+100000)*-1
,CASE
	WHEN ConnectionId>0 THEN (ConnectionId+100000)
	ELSE ConnectionId
END
,(receiver_userId+100000)
,receiver_status
,receiver_archive
,sender_archive
,addressId
FROM MAPFAC.DBO.MapMsg_addresses
WHERE receiver_connId <-19389
GO

--80 ROWS