

use rolesqa

alter table formmaker_tasks
add form_type varchar(5) default 'G';

alter table formmaker_tasks
add assigned_to varchar(10) default 'AP1';

update formmaker_tasks
set form_type='G',assigned_to ='AP1'

alter table user_agencies 
add task_link_expiry int

IF EXISTS (select 1 from sys.objects where name='secure_task_validate' and type='u')
DROP TABLE secure_task_validate

CREATE TABLE secure_task_validate(
 SecureTaskValidateId int identity(1,1) primary key
,userId int
,connId int
,connectionId int
,groupId int
,phaseId int
,stageId int
,taskId int
,emailId varchar(200)
,securityCode varchar(15)
,createdDate datetime 
,modifiedDate datetime 
,expiredFlag int default 0
)

IF EXISTS (select 1 from sys.objects where name='SecureTaskLog' and type='u')
DROP TABLE SecureTaskLog

CREATE TABLE SecureTaskLog(
LogID int identity(1,1) primary key
,TrackingID int
,StatusText varchar(100)
,CreatedDate datetime
)