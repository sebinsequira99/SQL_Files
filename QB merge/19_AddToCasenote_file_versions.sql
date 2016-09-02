USE MAPFCAD_TEST
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'Casenote_file_versions'))    
BEGIN
ALTER TABLE Casenote_file_versions
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

INSERT INTO Casenote_file_versions
(
Caseversion_id
,ContactActivityId
,Miscfile_id
,created_dttm
,updated_dttm
,ImportFlag
)

SELECT CV.Caseversion_id
,CA.ContactActivityId
,MF.Miscfileid
,CV.created_dttm
,CV.updated_dttm
,'Y'
 FROM MAPFAC.DBO.Casenote_file_versions CV
JOIN ContactActivity CA
ON CA.OLDContactActivityId = CV.ContactActivityId
JOIN MISCFILE MF
ON MF.OLDMISCFILEID = CV.MISCFILE_ID


