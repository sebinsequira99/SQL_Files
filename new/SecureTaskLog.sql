

IF EXISTS (select 1 from sys.objects where name='SecureTaskTracking' and type='u')
DROP TABLE SecureTaskTracking

CREATE TABLE SecureTaskTracking(
TrackingID int identity(1,1) primary key
,UserID int
,ConnID int
,ConnectionID int
,TaskID int
,ReceiverID int
,SentDate datetime
,UpdatedDate datetime
)

IF EXISTS (select 1 from sys.objects where name='SecureTaskLog' and type='u')
DROP TABLE SecureTaskLog

CREATE TABLE SecureTaskLog(
LogID int identity(1,1) primary key
,TrackingID int
,StatusText varchar(100)
,CreatedDate datetime
)