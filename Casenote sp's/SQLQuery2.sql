

use mapdev
select useroption, setting FROM system_settings
where useroption like '%_cw_casenote_security' and setting='yes'

securitysettings

            declare @strDBName nvarchar(50)
      SELECT  DISTINCT
            @strDBName = '[' + [DBName] + ']'
      FROM
            [IrrisCentral].[dbo].[lutPrimaryAgency] LPA
            JOIN dbo.user_agencies UAG
                  ON UAG.c_account_key = LPA.SiteID
      WHERE
            UAG.agency_id = 25

declare @sec_programID nvarchar(50)
set @sec_programID = 9
declare @loginUserId nvarchar(50)
set @loginUserId = 12

declare @groupID nvarchar(50)
set @groupID = 12



declare @RunSql nvarchar(2000)
set @Runsql = 'select @caseActType= @caseActType +'','' + Cast(ActTypeId as Varchar(50)) from
		    								' + @strDBName + '.dbo.lkpActType
					WHERE isSecure = 0 or isSecure is NULL 
					or (isSecure =1  AND ((SELECT Cast(setting as Varchar(50)) FROM system_settings WHERE useroption = '''+Cast(@loginUserId as Varchar(50))+'_cw_casenote_security'') = ''yes'')
					AND ((SELECT isRead from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isUpdate from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50)) 
					AND sec_programID = '+Cast(@sec_programID as Varchar(50))+' AND sec_cwID =  '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isDelete from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50)) 
					AND sec_programID = '+Cast(@sec_programID as Varchar(50))+' AND sec_cwID =  '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isRead from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1 OR
					(SELECT isUpdate from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1 OR
					(SELECT isDelete from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1
					))'
				print @Runsql


				

select * from ContactActivity
where acttypeid=21 and createdbyconnid=-66888

select * from ContactActivity
where contactactivityid=58686

select * from securitysettings
where sec_casenotetypeID=21 and sec_cwid=13370


select * from securitysettings
where sec_cwID=8264 and sec_casenotetypeID=21

select * from ContactActivity
where caseid=19829

select * from CaseWorker where caseworkerid=8264
select connid from user_accounts where user_id=4756
select * from user_accounts where user_type='agency_user' and last_name='green'



ContactAIRSId
REFERENCES MAPDEV.dbo.AIRSGroup (ContactAIRSId)

select * from ContactActivity c
join AIRSGroup a on c.ContactAIRSId=a.ContactAIRSId

select * from ContactActivity
where acttypeid in (21,22,23,24,25)


select * from ContactActivity
where staffconnid=-130 and acttypeid=21

select * from securitysettings
where sec_casenotetypeID=21 and sec_cwID=5570

exec CaseNote_Details_new -85635,25, 100 ,0,NULL,291985,257,'','DESC',896

select * from securitysettings where sec_groupid=951 and sec_casenotetypeID=39






