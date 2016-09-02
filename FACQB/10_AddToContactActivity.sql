USE MAPFACQB_STAGE
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
,CASE
	WHEN ContactId > 19389 THEN (CONTACTID+100000) 
	ELSE CONTACTID
	END AS CONTACTID
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
,CASE
	WHEN ownerConnID<-19389 THEN ((ownerConnID*-1)+100000)*-1
	ELSE ownerConnID
END AS ownerConnID
,isDelete
,MapImported
,(ConnectionId+100000)
,((ConnID*-1)+100000)*-1
,CreatedByConnid
,CASE
	WHEN StaffConnid<-19389 THEN ((StaffConnid*-1)+100000)*-1
	ELSE StaffConnid
END AS StaffConnid
,event_reg_id
,ContentFlag
,formID
,SecureNoteSubTypeId
,ContactActivityID
FROM MAPFAC.DBO.ContactActivity
WHERE CONNID<-19389
go

--71