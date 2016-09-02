select connid,* from user_accounts where connid > -19389

select mu.user_id as muuser_id , u.user_id,mu.username as muusername,
u.username,mu.first_name as mufirst_name, u.first_name,mu.last_name as mulast_name,
u.last_name,mu.connid as muconnid, u.connid 
into #tempu
from user_accounts u
 RIGHT join mapfac.dbo.user_accounts mu
on mu.user_id  = u.user_id
and (mu.first_name = u.first_name
and mu.last_name = u.last_name)
and mu.connid = u.connid
where mu.connid> -19389

select muuser_id ,user_id,muusername,
username,mufirst_name,first_name,mulast_name,
last_name,muconnid,connid from #tempu where user_id is null
and muconnid > -19389


select * from user_accounts where connid between -19385 and -19389

select connid,* from user_accounts where connid < -19389

select * from user_notifications where un_user_id between 13433  and 13472

select * from user_notifications u 
join mapfac.dbo.user_notifications mu 
on mu.un_user_id = u.un_user_id
where un_user_id = 13472

select * from mapfacqb.dbo.user_notifications  where un_user_id < 19389

select * from mapfacqb.dbo.user_notifications  where un_user_id >13441

select * from user_accounts where user_id = 13440
select * from mapfacqb.dbo.user_notifications  where un_user_id = 13440
select * from mapfac.dbo.user_accounts where user_id = 14439
select * from mapfacqb.dbo.user_notifications  where un_user_id = 14439
select * from mapfac.dbo.user_notifications  where un_user_id = 14439

select mc.contactid as faccontactid,c.contactid,mc.fname as facfname,c.fname,mc.lname as faclname,c.lname 
into #temp
from contact c
right join mapfac.dbo.contact mc
on mc.contactid = c.contactid
and (mc.fname = c.fname and mc.lname = c.lname)

select faccontactid,contactid,facfname,fname,faclname,lname from #temp 
where contactid is null 
and (facfname is not null and faclname  is not null)

select * from contact where contactid >19389

select connid,* from mapfac.dbo.user_accounts where connid >-19389

select connid,* from user_accounts where connid >-19389

select r.relationshipid,mr.relationshipid,r.contactid,mr.contactid,r.displayname,mr.displayname from rel_relationship r
join mapfac.dbo.rel_relationship mr
on mr.relationshipid = r.relationshipid
and mr.contactid = r.contactid
and mr.displayname = r.displayname
order by r.contactid

select * from  mapfac.dbo.rel_relationship where contactid >  19389

select * from rel_relationship where contactid >  19389

select * from rel_lkp_relationshiptype

select * from rel_lkp_relationshiptype where relationshiptypeid = 35

select max(relationshipid) from rel_relationship

select * from rel_lkp_relationshiptype where relationshiptypeid = -101

select * from CW_HistoryDtls where cw_userid in(13458
,13454
,13453
,13455
,13451
,13450
,13438
,13437
,13436
,13435
,13433)

select * from user_accounts where connid in (-19346
,-19063
,-15575
,-19365
,-19365
,-19063
,-15398
,-19245
,-19335)

select * from CW_HistoryDtls where cw_userid in(13458
,13454
,13453
,13455
,13451
,13450
,13438
,13437
,13436
,13435
,13433)


select * from user_accounts where user_id in(13458
,13454
,13453
,13455
,13451
,13450
,13438
,13437
,13436
,13435
,13433)

select * from user_accounts where user_id in (13428
,13349
,8293
,13431
,13431
,13349
,13463
,13398
,13424)

select * from mapsystemdata where user_id>=13433 and agency=17

select m.user_id,ms.user_id,m.ap1contactid,ms.ap1contactid,m.ap1fname,ms.ap1fname,m.ap1lname,ms.ap1lname from mapsystemdata m
left join mapfacqb_stage.dbo.mapsystemdata ms
on ms.user_id  = m.user_id
and ms.ap1fname = m.ap1fname
and ms.ap1lname = m.ap1lname
where m.user_id<13433 and m.agency=17

select * from formmaker_pdftemplate where pdf_template_id in (27298
,27299
,27300
,27301
,27302)


select FP.USER_ID ,F.USER_ID from formmaker_phase_status F
 LEFT JOIN MAPFACQB_STAGE.DBO.formmaker_phase_status FP
ON FP.USER_ID = F.USER_ID
WHERE F.USER_ID <=13433

SELECT * FROM  MAPFACQB.DBO.formmaker_phase_status WHERE USER_ID <13433

SELECT * FROM  formmaker_phase_status WHERE USER_ID <13433

SELECT * FROM  formmaker_status_track WHERE USER_ID <13433

select fs.phase_id as phase_id, f.phase_id as fphase_id, fs.user_id as user_id,f.user_id as fuser_id,fs.task_id as task_id,f.task_id  as ftask_id,
fs.updated_by , f.updated_by as fupdated_by,fs.updated_date , f.updated_date  as  fupdated_date 
into #temp
from formmaker_status_track f
LEFT JOIN MAPFACQB_STAGE.DBO.formmaker_status_track fs
on  fs.user_id=f.user_id and fs.task_id = f.task_id and fs.phase_id = f.phase_id and fs.updated_by = f.updated_by
and fs.updated_date = f.updated_date 
WHERE f.USER_ID <13433  
 
 select f.* from formmaker_status_track f
 join #temp t
 on  t.fuser_id=f.user_id and t.ftask_id = f.task_id and t.fphase_id = f.phase_id and t.fupdated_by = f.updated_by
 and t.fupdated_date = f.updated_date 
 where t.user_id is  null and  t.fuser_id is not null

 select * from #temp t  where t.user_id is  null and  t.fuser_id is not null

 select * from formmaker_status_track WHERE USER_ID >=13433

 SELECT * FROM formmaker_submissions  WHERE  CONNID <-19389

  SELECT * FROM MAPFACQB_STAGE.DBO.formmaker_submissions WHERE CONNID <-19389

  SELECT F.CONNID,FS.CONNID AS FSCONNID,FS.FORM_ID AS FSFORM_ID ,F.FORM_ID INTO #temp1 FROM formmaker_submissions F
  LEFT JOIN MAPFACQB_STAGE.DBO.formmaker_submissions FS
  ON FS.FORM_ID = F.FORM_ID
  AND FS.CONNID=F.CONNID
   WHERE F.CONNID>=-19389


   


   SELECT FS.* FROM formmaker_submissions FS
   JOIN #temp1 T
   ON T.FORM_ID = FS.FORM_ID
   AND FS.CONNID=T.CONNID 
   WHERE T.CONNID IS NOT NULL AND T.FSCONNID IS NULL

   SELECT * FROM MAPFACQB_STAGE.DBO.formmaker_submissions WHERE FORM_ID = 2716 AND CONNID =-19365

   SELECT * FROM formmaker_submissions WHERE FORM_ID = 2716 AND CONNID =-19365

   
   SELECT* FROM formmaker_taskstatus WHERE CONNID <-19389 AND USER_ID >=13433

SELECT* FROM formmaker_taskstatus WHERE CONNID >=-19389 order by status_id

select ft.user_id , f.user_id AS Fuser_id
,ft.phase_id , f.phase_id AS  fphase_id
,ft.stage_id , f.stage_id AS fstage_id
,ft.task_id , f.task_id AS ftask_id
,ft.connid , f.connid AS fconnid
INTO #temp2
 from formmaker_taskstatus f
left join MAPFACQB_STAGE.DBO.formmaker_taskstatus ft
on ft.user_id = f.user_id
and ft.phase_id = f.phase_id
and ft.stage_id = f.stage_id
and ft.task_id = f.task_id
and ft.connid = f.connid
WHERE f.CONNID >=-19389

SELECT * FROM formmaker_taskstatus F
JOIN #temp2 T 
ON T.Fuser_id = F.user_id
AND T.fphase_id = F.phase_id
and t.fstage_id = f.stage_id
and t.ftask_id = f.task_id
and t.fconnid = f.connid
WHERE T.USER_ID IS NULL AND T.FUSER_ID IS NOT NULL

DROP TABLE #temp2

SELECT * FROM MAPFACQB_STAGE.DBO.formmaker_taskstatus WHERE USER_ID = 13424 AND PHASE_ID = 1662 AND TASK_ID = 8

SELECT * FROM FORMMAKER_PHASES WHERE PHASE_ID = 1662

SELECT * FROM MAPFACQB_STAGE.DBO.FORMMAKER_PHASES WHERE PHASE_ID = 1662

SELECT * FROM formmaker_usergroups F
LEFT JOIN MAPFACQB_STAGE.DBO.formmaker_usergroups FU
ON FU.PG_PHASE_ID = F.PG_PHASE_ID
AND FU.PG_GROUP_ID = F.PG_GROUP_ID

SELECT * FROM formmaker_agencies WHERE AGENCY_ID = 77

SELECT 
FC.PHASE_ID AS  FCPHASE_ID, F.PHASE_ID
 ,FC.TASK_ID AS FCTASK_ID, F.TASK_ID
 ,FC.USER_ID AS FCUSER_ID, F.USER_ID
 ,FC.CONNID  AS FCCONNID, F.CONNID
INTO #temp3
FROM formmaker_client_disable F
LEFT JOIN MAPFACQB.DBO.formmaker_client_disable FC
ON  FC.PHASE_ID = F.PHASE_ID
AND FC.TASK_ID = F.TASK_ID
AND FC.USER_ID = F.USER_ID
AND FC.CONNID = F.CONNID
WHERE F.CONNID <-19389

SELECT F.* FROM formmaker_client_disable F
JOIN #temp3 T 
ON  T.PHASE_ID = F.PHASE_ID
AND T.TASK_ID = F.TASK_ID
AND T.USER_ID = F.USER_ID
AND T.CONNID = F.CONNID
WHERE T.USER_ID IS NOT NULL AND T.FCUSER_ID IS  NULL

SELECT * FROM formmaker_client_disable WHERE CONNID <-19389

SELECT * FROM formmaker_fieldoptions

SELECT * FROM formmaker_fields

SELECT	c.cilistid,
		ci.cilistid AS cicilistid,
		C.CONTACTID,
		CI.CONTACTID AS CICONTACTID 
INTO #CIListtemp
FROM CIList c
LEFT JOIN mapfacqb.dbo.CIList ci
ON ci.cilistid = c.cilistid
AND ci.contactid = c.contactid
WHERE c.contactid <19389

SELECT * FROM CIList WHERE CONTACTID >19389

SELECT * FROM #CIListtemp WHERE CICILISTID IS NULL

SELECT C.* 
FROM CIList C
JOIN #CIListtemp T
ON T.CONTACTID = C.CONTACTID
AND T.CILISTID = C.CILISTID
WHERE T.CILISTID IS NOT NULL AND T.CICILISTID IS NULL
 
select * from mapfacqb.dbo.CIList where contactid<19365
select * from CIListTemplateItem

select DISTINCT (CONTACTID) from ContactMedGen where contactid >19389 

SELECT * FROM CONTACT WHERE CONTACTID IN (19406
,19407
,19421
,19430
,19431
,19436
,19437
,19450
,19451
,19454
,19469
,19470
,19478
,19479
,19491
,19492
,19501
,19502
,19505
,19506
,19508
,19509
,19517
,19518)

SELECT * FROM CONTACT WHERE ContactID < 19389 

select * from CONTACTADDRESS WHERE contactid <19389

SELECT * FROM mapfac.dbo.AIRSGROUP a
join  MAPFAC.DBO.ContactAIRS c
on a.contactairsid = c.contactairsid
 WHERE c.contactid <19389

 SELECT * FROM ContactEthnicity WHERE contactid <19389

 SELECT * FROM user_notifications WHERE un_user_id <13433

 SELECT * FROM REL_RELATIONSHIP
WHERE contactid < 19389

--44127

SELECT * FROM REL_RELATIONSHIP WHERE apid is not null

SELECT * FROM ConnectionStatusLog C
JOIN REL_RELATIONSHIP R
ON R.CONNECTIONID = C.CONNECTIONID
WHERE R.contactid < 19389

SELECT * FROM User_EffectiveDate
WHERE CONNID >= -19389

select apid,bmid,bfid from MAPFAC.DBO.REL_RELATIONSHIP
WHERE contactid > 19389

select ca.contactactivityid , c.contactactivityid , ca.connid, c.connid from ContactActivity c
right join mapfac.dbo.ContactActivity ca
on ca.contactactivityid = c.contactactivityid 
and ca.connid = c.connid
WHERE ca.CONNID>=-19389

select * from UPLOAD
WHERE ConnId >=-19389 

select * from MapMsg_addresses
WHERE receiver_connId >=-19389