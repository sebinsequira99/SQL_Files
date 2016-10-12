USE MAPFACQB_STAGE
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'MapMsg_messages'))    
BEGIN
ALTER TABLE MapMsg_messages
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/
INSERT INTO MapMsg_messages
(
Msg_Id
,fromId
,msg_subject
,Msg_Body
,Msg_DateTime
,msg_status
,Msg_attachment
,ConnId
,Msg_parentId
,with_payment
,payment_amount
,payment_order_id
,inquiry_message
,invoiceID
,casenoteid
,sender_status
,ConnectionId
,msg_attachment_Old
,ImportFlag
)
SELECT M.Msg_Id
,CASE
	WHEN M.fromId>=13433 THEN (M.fromId + 100000)
	ELSE M.fromId
END
,M.msg_subject
,M.Msg_Body
,M.Msg_DateTime
,M.msg_status
,M.Msg_attachment
,CASE
	WHEN M.ConnId<-19389 THEN ((M.ConnId*-1)+100000)*-1
	ELSE M.ConnId
END
,M.Msg_parentId
,M.with_payment
,M.payment_amount
,M.payment_order_id
,M.inquiry_message
,M.invoiceID
,M.casenoteid
,M.sender_status
,CASE 
	WHEN M.ConnId<-19389 AND M.ConnectionId>0 THEN (M.ConnectionId + 100000)
	ELSE M.ConnectionId
END
,M.msg_attachment_Old
,'Y'
FROM MAPFAC.DBO.MapMsg_messages M
JOIN MapMsg_message_addresses MA
ON MA.Msg_Id = M.Msg_Id
WHERE MA.OldAddressid IS NOT NULL
GO

--80