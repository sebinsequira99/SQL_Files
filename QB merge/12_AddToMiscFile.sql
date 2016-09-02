USE MAPFCAD_TEST
GO

/******************************************Add column OldConnectionID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldMiscFileID' AND Object_ID = Object_ID(N'MiscFile'))    
BEGIN
ALTER TABLE MiscFile
ADD OldMiscFileID INT
END
GO
/********************************************************************************************************************/

INSERT INTO MiscFile
(
MiscFileName
,MiscFileShow
,MiscFileDate
,MiscFileTypeId
,ContactAIRSId
,ContactId
,IsMassEmail
,MiscfileDisplayName
,MiscfileDirectory
,ContactActivityId
,ConnId
,isVersion
,OldMiscFileID
)

SELECT M.MiscFileName
,M.MiscFileShow
,M.MiscFileDate
,M.MiscFileTypeId
,M.ContactAIRSId
,M.CONTACTID+100000
,M.IsMassEmail
,M.MiscfileDisplayName
,M.MiscfileDirectory
,C.ContactActivityId
,((M.ConnID*-1)+100000)*-1
,M.isVersion
,M.MiscFileId
FROM MAPFAC.DBO.MiscFile M
JOIN CONTACTACTIVITY C
ON M.ContactActivityId = C.OLDContactActivityId

