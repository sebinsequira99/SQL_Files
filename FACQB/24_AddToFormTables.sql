USE MAPFACQB_STAGE
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
FROM MAPFAC.DBO.formmaker_pdftemplate where pdf_template_id in (27298
,27299
,27300
,27301
,27302)
--5
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
WHERE USER_ID >=13433
--34
GO

/*********************Insert into formmaker_status_track*****************************/

SELECT	fs.phase_id		as phase_id,
		f.phase_id		as fphase_id,
		fs.user_id		as user_id,
		f.user_id		as fuser_id,
		fs.task_id		as task_id,
		f.task_id		as ftask_id,
		fs.updated_by	as  updated_by,
		f.updated_by	as fupdated_by,
		fs.updated_date as updated_date, 
		f.updated_date  as  fupdated_date 
INTO #temp
FROM MAPFAC.DBO.formmaker_status_track f
LEFT JOIN formmaker_status_track fs
ON  fs.user_id=f.user_id 
	AND fs.task_id = f.task_id 
	AND fs.phase_id = f.phase_id 
	AND fs.updated_by = f.updated_by
	AND fs.updated_date = f.updated_date 
WHERE f.USER_ID <13433
GO

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
SELECT f.Phase_id
,f.stage_id
,f.task_id
,f.user_id
,f.updated_by
,f.updated_date
,f.task_status
,f.ConnId
,f.ConnectionId 
,'Y'
FROM MAPFAC.DBO.formmaker_status_track f
 JOIN #temp t
 ON  t.fuser_id=f.user_id 
 AND t.ftask_id = f.task_id 
 AND t.fphase_id = f.phase_id 
 AND t.fupdated_by = f.updated_by
 AND t.fupdated_date = f.updated_date 
 WHERE t.user_id IS  NULL 
 AND  t.fuser_id IS NOT NULL

GO
--147

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
,CASE
	WHEN (user_id>=13433) THEN USER_ID+100000
	ELSE USER_ID
END
,CASE
	WHEN (updated_by>=13433) THEN updated_by+100000
	ELSE updated_by
END
,updated_date
,task_status
,ConnId
,ConnectionId
,'Y'
FROM MAPFAC.DBO.formmaker_status_track 
WHERE USER_ID >=13433
GO
--245

/*********************Insert into formmaker_submissions*****************************/

  SELECT	F.CONNID AS CONNID,
			FS.CONNID AS FSCONNID,
			FS.FORM_ID AS FSFORM_ID ,
			F.FORM_ID AS FORM_ID
  INTO #temp1 FROM MAPFAC.DBO.formmaker_submissions F
  LEFT JOIN formmaker_submissions FS
  ON FS.FORM_ID = F.FORM_ID
  AND FS.CONNID=F.CONNID
  WHERE F.CONNID>=-19389
GO
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
SELECT FS.form_id
,FS.data_id
,FS.event_id
,FS.fromperson
,FS.subject
,FS.timereceived
,FS.followup
,FS.key_id
,FS.agency_id
,FS.submission_flag
,FS.ConnId
,FS.ConnectionId
,'Y'
FROM MAPFAC.DBO.formmaker_submissions FS
JOIN #temp1 T
ON T.FORM_ID = FS.FORM_ID
AND FS.CONNID=T.CONNID 
WHERE T.CONNID IS NOT NULL AND T.FSCONNID IS NULL
GO
--11

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
WHERE CONNID <-19389
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
WHERE CONNID <-19389
GO
--294
SELECT	ft.user_id ,
		f.user_id AS Fuser_id,
		ft.phase_id , 
		f.phase_id AS fphase_id,
		ft.stage_id , 
		f.stage_id AS fstage_id,
		ft.task_id , 
		f.task_id AS ftask_id,
		ft.connid , 
		f.connid AS fconnid
INTO #temp2
FROM MAPFAC.DBO.formmaker_taskstatus f
LEFT JOIN formmaker_taskstatus ft
ON ft.user_id = f.user_id
AND ft.phase_id = f.phase_id
AND ft.stage_id = f.stage_id
AND ft.task_id = f.task_id
AND ft.connid = f.connid
WHERE f.CONNID >=-19389

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
SELECT F.user_id
,F.phase_id
,F.stage_id
,F.task_id
,F.task_status
,F.dateposted
,F.key_id
,F.approve
,212
,F.remarks
,F.startdate
,F.enddate
,F.groupid
,F.ConnectionId
,F.ConnId
,F.Contactactivityid
,'Y'
FROM MAPFAC.DBO.formmaker_taskstatus  F
JOIN #temp2 T 
ON T.Fuser_id = F.user_id
AND T.fphase_id = F.phase_id
AND t.fstage_id = f.stage_id
AND t.ftask_id = f.task_id
AND t.fconnid = f.connid
WHERE T.USER_ID IS NULL AND T.FUSER_ID IS NOT NULL
GO
--61
/*********************Insert into formmaker_client_disable*****************************/
SELECT 
FC.PHASE_ID AS  FCPHASE_ID, F.PHASE_ID
 ,FC.TASK_ID AS FCTASK_ID, F.TASK_ID
 ,FC.USER_ID AS FCUSER_ID, F.USER_ID
 ,FC.CONNID  AS FCCONNID, F.CONNID
INTO #temp3
FROM MAPFAC.DBO.formmaker_client_disable F
LEFT JOIN formmaker_client_disable FC
ON  FC.PHASE_ID = F.PHASE_ID
AND FC.TASK_ID = F.TASK_ID
AND FC.USER_ID = F.USER_ID
AND FC.CONNID = F.CONNID
WHERE F.CONNID >=-19389
GO

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
SELECT F.phase_id
,F.stage_id
,F.task_id
,F.user_id
,F.disable
,F.ConnectionId
,F.ConnId
,'Y'
FROM MAPFAC.DBO.formmaker_client_disable F
JOIN #temp3 T 
ON  T.PHASE_ID = F.PHASE_ID
AND T.TASK_ID = F.TASK_ID
AND T.USER_ID = F.USER_ID
AND T.CONNID = F.CONNID
WHERE T.USER_ID IS NOT NULL AND T.FCUSER_ID IS  NULL
GO
--19
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
WHERE CONNID <-19389

GO

--104