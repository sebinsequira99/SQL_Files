USE MAPFCAD_TEST
go

/******************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'CIList'))    
BEGIN
	ALTER TABLE CIList
	ADD ImportFlag VARCHAR (5)
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'ContactMedGen'))    
BEGIN
	ALTER TABLE ContactMedGen
	ADD ImportFlag VARCHAR (5)
END
GO
/**********************************************************************************************/
/*********************Insert into CIList***********************/

INSERT INTO CIList
(
 CIListTemplateId
,ContactId
,StrtDate
,TitleInfo
,Createdby
,CaseId
,ContactAirsID 
,ImportFlag
)
SELECT CIListTemplateId
,ContactId+100000
,StrtDate
,TitleInfo
,Createdby
,CaseId
,ContactAirsID 
,'Y'
FROM MAPFAC.DBO.CIList
GO

/*********************Insert into ContactMedGen***********************/

INSERT INTO ContactMedGen
(
MedGenSubTypeId
,MedGenPullDownId
,MedGenNote
,MedGenDate
,ContactId
,MedGenDateUnknown
,ImportFlag
)
SELECT MedGenSubTypeId
,MedGenPullDownId
,MedGenNote
,MedGenDate
,ContactId+100000
,MedGenDateUnknown
,'Y'
FROM MAPFAC.DBO.ContactMedGen


