
lkpacttype

select * from system_settings
where useroption like '%_cw_casenote_security' and setting='yes'

select connid from user_accounts where user_id=12801

exec CaseNote_Details_new -90036,25, 100 ,0,NULL,343092,257,'','DESC',800
exec CaseNote_Details_new -90036,25, 100 ,0,NULL,343092,12801,'','DESC',800

EXEC usp_Add_CaseNote 164,90036, 0 ,-90036,
                                       1,-85430 ,8,3
                                       ,'2015-06-06 10:06:00','test',0,1,
                                        '0','-85430','0',343092,
                                        -85430,'',0,0

select * from ContactActivity where ContactActivityId=86493

12801
insert into securitysettings(sec_cwID,sec_programID,sec_casenotetypeID,isCreate,isRead,isUpdate,isDelete,sec_groupID)
values(12801,9,39,1,1,1,0,800)


update securitysettings
set sec_cwID=12801
,sec_programID=9
,sec_casenotetypeID=39
,isCreate=0
,isRead=0
,isUpdate=0
,isDelete=0
,sec_groupID=800

where securityid=203


select * from securitysettings

exec usp_Get_CasenoteData 164, 'Case Note *',86493,12801,800


select l.issecure from lkpacttype l
right join contactactivity c on l.ActTypeId=c.acttypeid

select * from contactactivity where contactactivityid in(86497)

