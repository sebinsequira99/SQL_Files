USE MAPFCAD_TEST
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldContactActivityID' AND Object_ID = Object_ID(N'ContactActivity'))    
BEGIN
ALTER TABLE ContactActivity
ADD OldContactActivityID INT
END
GO
/********************************************************************************************************************/
INSERT INTO ContactActivity
(
ContactTypeId
,ContactAIRSId
,StaffContactAIRSId
,ActPriority
,ActTypeId
,ActDate
,ActRe
,ActDuration
,IsActComplet
,ActDateCompleted
,ContactId
,CaseId
,DoNotPrint
,Incident
,CreatedByContactAIRSID
,DateCreated
,MiscFileID
,EncryptionPublicKey
--,SignatureTimeStamp
,isReadOnly
,FilePathName
,DigitallySignedOwnerID
,PriorityCode
,FileUploadMiscFileId
,FileUploadFilePathName
,fileupload_menu_Id
,FileFlag
,ownerConnID
,isDelete
,MapImported
,ConnectionId
,ConnId
,CreatedByConnid
,StaffConnid
,event_reg_id
,ContentFlag
,formID
,SecureNoteSubTypeId
,OldContactActivityID
)

SELECT ContactTypeId
,ContactAIRSId
,StaffContactAIRSId
,ActPriority
,ActTypeId
,ActDate
,ActRe
,ActDuration
,IsActComplet
,ActDateCompleted
,CONTACTID+100000
,CaseId
,DoNotPrint
,Incident
,CreatedByContactAIRSID
,DateCreated
,MiscFileID
,EncryptionPublicKey
--,SignatureTimeStamp
,isReadOnly
,FilePathName
,DigitallySignedOwnerID
,PriorityCode
,FileUploadMiscFileId
,FileUploadFilePathName
,fileupload_menu_Id
,FileFlag
,((ownerConnID*-1)+100000)*-1
,isDelete
,MapImported
,(ConnectionId+100000)
,((ConnID*-1)+100000)*-1
,CreatedByConnid
,((StaffConnid*-1)+100000)*-1
,event_reg_id
,ContentFlag
,formID
,SecureNoteSubTypeId
,ContactActivityID
FROM MAPFAC.DBO.ContactActivity

