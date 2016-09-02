USE MAPFCAD_TEST
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'casenote_version'))    
BEGIN
ALTER TABLE casenote_version
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

INSERT INTO casenote_version
(
case_note_id
,agency_id
,case_note_content
,updated_by
,updated_dttm
,created_dttm
,filename
,dup_filename
,fileid
,casenote_subject
,ImportFlag
)
SELECT case_note_id
,agency_id
,case_note_content
,updated_by
,updated_dttm
,created_dttm
,filename
,dup_filename
,fileid
,casenote_subject
,'Y'
FROM MAPFAC.DBO.casenote_version

