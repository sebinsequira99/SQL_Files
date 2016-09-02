USE MAPFACQB_STAGE
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
,CASE
	WHEN M.ContactId > 19389 THEN (M.CONTACTID+100000) 
	ELSE M.CONTACTID
	END AS CONTACTID
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
WHERE M.ConnId <-19389
GO

--58 rows
