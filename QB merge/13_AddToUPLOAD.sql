USE MAPFCAD_TEST
GO

/******************************************Add column Oldupload_id ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'Oldupload_id' AND Object_ID = Object_ID(N'UPLOAD'))    
BEGIN
ALTER TABLE UPLOAD
ADD Oldupload_id INT
END
GO
/********************************************************************************************************************/
INSERT INTO UPLOAD
(
file_name
,description
,user_id
,dateposted
,upload_module
,upload_phase
,upload_stage
,upload_task
,key_id
,group_id
,uploaded_by
,editable
,filetag
,approved_by
,formDocument
,phase_id
,reference_parentid
,document_type
,ConnectionId
,ConnId
,donotShowCasenote
,Oldupload_id
)

SELECT
file_name
,description
,(user_id+100000)
,dateposted
,upload_module
,upload_phase
,upload_stage
,upload_task
,key_id
,group_id
,uploaded_by+100000
,editable
,filetag
,approved_by+100000
,formDocument
,phase_id
,reference_parentid
,document_type
,(ConnectionId+100000)
,((ConnId*-1)+100000)*-1
,donotShowCasenote
,upload_id
FROM MAPFAC.DBO.UPLOAD
