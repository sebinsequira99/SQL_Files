USE MAPFCAD_TEST
go

/******************Add column OldMapFormDataId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_pdftemplate'))    
BEGIN
	ALTER TABLE formmaker_pdftemplate
	ADD ImportFlag VARCHAR (5)
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_phase_status'))    
BEGIN
	ALTER TABLE formmaker_phase_status
	ADD ImportFlag VARCHAR (5)

END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_status_track'))    
BEGIN
	ALTER TABLE formmaker_status_track
	ADD ImportFlag VARCHAR (5)

END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_submissions'))    
BEGIN
	ALTER TABLE formmaker_submissions
	ADD ImportFlag VARCHAR (5)

END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_taskstatus'))    
BEGIN
	ALTER TABLE formmaker_taskstatus
	ADD ImportFlag VARCHAR (5)

END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'formmaker_client_disable'))    
BEGIN
	ALTER TABLE formmaker_client_disable
	ADD ImportFlag VARCHAR (5)

END
GO

/******************************************************************/

INSERT INTO formmaker_pdftemplate
(
pdf_field_name
,form_field_name
,agency_id
,form_name
,ImportFlag
)
SELECT pdf_field_name
,form_field_name
,agency_id
,form_name
,'Y'
FROM MAPFAC.DBO.formmaker_pdftemplate 
GO
/******************************************************************/

INSERT INTO formmaker_phase_status
(
Agency_Id
,User_Id
,Phase_Id
,Alloc_date
,Start_date
,End_date
,Update_date
,ImportFlag
)
SELECT 212
,(User_Id+100000)
,Phase_Id
,Alloc_date
,Start_date
,End_date
,Update_datE
,'Y'
FROM MAPFAC.DBO.formmaker_phase_status 

--34
GO

/*********************Insert into formmaker_status_track*****************************/


INSERT INTO formmaker_status_track
(
Phase_id
,stage_id
,task_id
,user_id
,updated_by
,updated_date
,task_status
,ConnId
,ConnectionId
,ImportFlag
)
SELECT Phase_id
,stage_id
,task_id
,USER_ID+100000
, updated_by+100000
,updated_date
,task_status
,ConnId
,ConnectionId
,'Y'
FROM MAPFAC.DBO.formmaker_status_track 

GO


/*********************Insert into formmaker_submissions*****************************/

INSERT INTO formmaker_submissions 
(
form_id
,data_id
,event_id
,fromperson
,subject
,timereceived
,followup
,key_id
,agency_id
,submission_flag
,ConnId
,ConnectionId
,ImportFlag
)
SELECT form_id
,data_id
,event_id
,fromperson
,subject
,timereceived
,followup
,key_id
,212
,submission_flag
,((ConnId*-1)+100000)*-1
,ConnectionId+100000
,'Y'
FROM MAPFAC.DBO.formmaker_submissions
GO
--44

/*********************Insert into formmaker_taskstatus*****************************/

INSERT INTO formmaker_taskstatus
(
user_id
,phase_id
,stage_id
,task_id
,task_status
,dateposted
,key_id
,approve
,agency_id
,remarks
,startdate
,enddate
,groupid
,ConnectionId
,ConnId
,Contactactivityid
,ImportFlag
)
SELECT user_id+100000
,phase_id
,stage_id
,task_id
,task_status
,dateposted
,key_id
,approve
,212
,remarks
,startdate
,enddate
,groupid
,ConnectionId+100000
,((ConnId*-1)+100000)
,Contactactivityid
,'Y'
FROM MAPFAC.DBO.formmaker_taskstatus

GO

/*********************Insert into formmaker_client_disable*****************************/


INSERT INTO formmaker_client_disable
(
phase_id
,stage_id
,task_id
,user_id
,disable
,ConnectionId
,ConnId
,ImportFlag
)

SELECT phase_id
,stage_id
,task_id
,user_id+100000
,disable
,ConnectionId+100000
,((ConnId*-1)+100000)*-1
,'Y'
FROM MAPFAC.DBO.formmaker_client_disable

GO

--104