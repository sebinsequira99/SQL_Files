USE MAPFACQB_STAGE
GO

/******************************************Add column Oldupload_id ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldAddressid' AND Object_ID = Object_ID(N'MapMsg_message_addresses'))    
BEGIN
ALTER TABLE MapMsg_message_addresses
ADD OldAddressid INT
END
GO
/********************************************************************************************************************/
INSERT INTO MapMsg_message_addresses
(
Msg_Id
,addressId
,addressSeq
,addressType
,OldAddressid
)
SELECT MA.Msg_Id
,M.addressId
,MA.addressSeq
,MA.addressType
,MA.Addressid
FROM MAPFAC.DBO.MapMsg_message_addresses MA
JOIN MapMsg_addresses M
ON M.OldAddressid = MA.addressId
WHERE M.OldAddressid IS NOT NULL
GO

--80 ROWS

