usp_GetAgencyDetails

use mapabsc
ALTER DATABASE RolesQA_New SET SINGLE_USER WITH ROLLBACK IMMEDIATE    
ALTER DATABASE RolesQA_New MODIFY NAME = [RolesQA]
ALTER DATABASE RolesQA SET MULTI_USER

	ALTER DATABASE TestRestore
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE

	Exec master.dbo.usp_RestoreDatabase @DBName 
   
	IF  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
				  WHERE TABLE_NAME = 'user_accounts' AND COLUMN_NAME = 'Email')
	     
	UPDATE user_accounts SET username='restore'+username, Email = 'restore'+Email WHERE user_id >1 or user_id !=8125
	
Update user_accounts set username ='auto' where user_id=-1
Update user_accounts set username ='admin' where user_id=1
Update user_accounts set username ='auto' where user_id=-1
Update user_accounts set username ='admin@adoptionadvocates.org' where user_id=8125  --restore

	IF  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = 'ContactEmail' AND COLUMN_NAME = 'contactemail')
	UPDATE contactemail SET ContactEmail='restore'+ContactEmail 

    
    IF  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = 'user_notifications' AND COLUMN_NAME = 'un_email_id')
    UPDATE user_notifications SET un_email_id=LEFT('restore'+ISNULL(un_email_id,''),50) 
	WHERE  un_user_id !=
8125

SELECT * FROM user_notifications


	DECLARE @agencyid varchar(100)
	SELECT @agencyid=agency_id FROM dbo.user_agencies 

	Create Table #Tbl_agncyID (
			ID int identity(1,1),
			TableName Varchar(250),
			ColumnName varchar(250)
			)
	 INSERT INTO #Tbl_agncyID(TableName,ColumnName)
	 SELECT T.Name as TableName,C.name as ColumnName  FROM sys.columns C 
	 INNER JOIN sys.tables t on t.Object_id=c.Object_id   
	 WHERE c.name like '%agency_id%' and t.name not in ('ErrorLog' ,'settings_refmessage')
	 
	 SELECT * FROM #Tbl_agncyID
	 
	 DECLARE @TableName VARCHAR(100)
	 DECLARE @ColumnName VARCHAR(100)
	 DECLARE @count INT 
	 DECLARE @ID INT 
	 DECLARE  @sqlqry nvarchar(500)
	 
	  SET @count = 1
	  SET @id = scope_identity()
	  WHILE(@count<=@id )
	  BEGIN
		 SELECT @TableName = TableName,
				@ColumnName = ColumnName 
		 FROM #Tbl_agncyID WHERE ID = @count
		 
		 SELECT @TableName
		 --SET @sqlqry = 'SELECT * FROM  '+@TableName  + ' WHERE '+ @ColumnName +'='+@agencyid
		 --PRINT @sqlqry
		 --Exec(@sqlqry)
		 SET @sqlqry = 'UPDATE '+ @TableName +' SET '+ @ColumnName +'=25 WHERE '+ @ColumnName +'='+ @agencyid
		 Exec(@sqlqry)
		 --print @sqlqry
		 SET @count=@count+1
	 END
	 
	 DROP TABLE #Tbl_agncyID
	 



	 SELECT * FROM dbo.user_accounts WHERE USER_ID = 338


 SET IDENTITY_INSERT user_agencies ON
 
 INSERT INTO dbo.user_agencies
         (  agency_id, user_id, agency_name, address_line_1, address_line_2, city, state, zip, country, website, phone, fax, email_id, birth_parent_number, adoptive_parent_number, after_hours_number, 
                         type_of_business, technology, no_of_years_in_business, no_of_staff, services, states_licensed_in, countries_licensed_in, no_of_adoptions_year, email_id_for_notifications, alert_preference, phone_to_sms, 
                         mision_statement_check, mision_statement_text, values_check, values_text, background_check, background_text, logo, nature_of_adoption, religions, payment_option, perfect_adoption_portal, other_info, 
                         specialties, c_account_key, demo_video, ConnId, agency_tax_id, county_id, doc_process_id, theme_color, agency_description, system_description)
SELECT * FROM RolesSTAGEBkp.Dbo.user_agencies


 SET IDENTITY_INSERT user_agencies OFF

 SELECT * FROM user_agencies
 DELETE FROM user_agencies WHERE agency_id = 25


 SET IDENTITY_INSERT dbo.user_accounts ON

 INSERT Into dbo.user_accounts (user_id, username, password, first_name, last_name, email, photo, organization, title, phone, address1, address2, city, state, zipcode, country, website, mobile_number, status, summary, membership, 
                         user_posting, user_register, datejoined, last_login, last_ip, session, suspend_until, timezone, itemized_date, user_type, agency_group, agency_name, agency_id, group_id, queation, answer, due_date, race, 
                         note, over_21, marital_status, message_alert, case_worker, case_worker_parent_user_id, adoption_type, spouse_first_name, spouse_last_name, spouse_organization, spouse_title, spouse_website, referral, 
                         mailtogroups, airs_contact_id, airs_contactairs_id, doctogroups, doctousers, personal_gender, spouse_gender, message_group, quickbook_listid, quickbook_vendorid, quickbook_queue, signer1, signer2, 
                         video_msg, status_mode, edd, id_type, id_number, quickbook_custeditseq, quickbook_vendeditseq, qb_listid_online, qb_vendorid_online, qb_online_updation, qb_standalone_updation, new_encryption, ConnId, 
                         passwordchange, passwordchangedate, SBFlag, SBSaveMapDate, trace, NoGroupDataFix, acc_lock
)
SELECT * FROM RolesSTAGEBkp.Dbo.user_accounts WHERE USER_ID = 338

SET IDENTITY_INSERT dbo.user_accounts OFF

SELECT * FROM user_accounts
