
select * into #CaseNote_Details_result
from #CaseNote_Details

alter table ContactActivity
add issecure int
alter table ContactActivity
add isread int

--select * from ContactActivity

--select * from lkpacttype

--select * from securitysettings
;
with issecure_tbl as(SELECT l.issecure,l.acttypeid from lkpacttype l
JOIN ContactActivity c on l.ActTypeId=c.acttypeid)

UPDATE c SET c.issecure = i.issecure
FROM ContactActivity AS c JOIN issecure_tbl AS i ON c.acttypeid = i.acttypeid

;
with isread_tbl as(SELECT s.isread,s.sec_casenotetypeID,s.sec_groupID,s.sec_cwID from securitysettings s
JOIN ContactActivity cc on s.sec_casenotetypeID=cc.acttypeid and s.sec_groupID=1 and s.sec_cwID=1)

UPDATE cc SET cc.isread = r.isread
FROM ContactActivity AS cc JOIN isread_tbl AS r ON r.sec_casenotetypeID=cc.acttypeid and r.sec_groupID=1 and r.sec_cwID=1

--INSERT INTO ContactActivity(isread)
--SELECT s.isread from securitysettings s
--RIGHT JOIN ContactActivity c on s.sec_casenotetypeID=c.acttypeid and s.sec_groupID=@groupID and s.sec_cwID=@loginUserId

DECLARE @user_type VARCHAR(20)
SELECT @user_type=user_type from user_accounts where user_id=@loginUserId

DECLARE @setting varchar(10)
SELECT @setting=setting 
FROM system_settings 
where useroption=cast(@loginUserId as varchar(10))+'_cw_casenote_security'

	IF(@user_type='agency')

		BEGIN

				SELECT 
				    *
				FROM
				    #CaseNote_Details_result
				WHERE
				    Row_No > @Start_id
				    AND Row_No <= @END_id  
				ORDER BY Row_No

		END

	ELSE IF(@user_type='agency_user' and @setting!='yes')

		BEGIN

				SELECT 
				    *
				FROM
				    #CaseNote_Details_result
				WHERE
					issecure!=1
				    AND Row_No > @Start_id
				    AND Row_No <= @END_id 

				ORDER BY Row_No

		END


	ELSE IF(@user_type='agency_user' and @setting='yes')

		BEGIN

				SELECT 
				    *
				FROM
				    #CaseNote_Details_result
				WHERE
					isread!=0
				    AND Row_No > @Start_id
				    AND Row_No <= @END_id 

				ORDER BY Row_No

		END
