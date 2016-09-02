USE MAPFACQB_STAGE
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
SELECT	C.cilistid,
		CI.cilistid AS cicilistid,
		C.CONTACTID,
		CI.CONTACTID AS CICONTACTID 
INTO #CIListtemp
FROM MAPFAC.DBO.CIList c
LEFT JOIN CIList ci
ON ci.cilistid = c.cilistid
AND ci.contactid = c.contactid
WHERE c.contactid <19389
GO

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
SELECT C.CIListTemplateId
,C.ContactId
,C.StrtDate
,C.TitleInfo
,C.Createdby
,C.CaseId
,C.ContactAirsID 
,'Y'
FROM MAPFAC.DBO.CIList C
JOIN #CIListtemp T
ON T.CONTACTID = C.CONTACTID
AND T.CILISTID = C.CILISTID
WHERE T.CILISTID IS NOT NULL 
AND T.CICILISTID IS NULL
GO
--164
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
WHERE CONTACTID >19389
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
WHERE ContactId>19389

--48