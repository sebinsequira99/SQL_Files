
------------------------------------------
Create Table Tbl_agncyID (
 ID int identity(1,1),
 TableName Varchar(250),
 ColumnName varchar(250)
)
 INSERT INTO Tbl_agncyID(TableName,ColumnName)
 SELECT T.Name as TableName,C.name as ColumnName  FROM sys.columns C 
 INNER JOIN sys.tables t on t.Object_id=c.Object_id   
 WHERE c.name like '%agency_id%'
 ----------------------------------------
 DECLARE @TableName VARCHAR(100)
 DECLARE @ColumnName VARCHAR(100)
 DECLARE @count INT 
 DECLARE @ID INT 
 DECLARE  @sqlqry nvarchar(500)
 
  SET @count = 1
 SELECT @id = Max(ID) FROM  Tbl_agncyID
 WHILE(@count<=@id )
 Begin
	 SELECT @TableName = TableName FROM Tbl_agncyID WHERE ID = @count
	 SELECT @ColumnName = ColumnName FROM Tbl_agncyID WHERE ID = @count
	 --SET @sqlqry = 'SELECT * FROM  '+@TableName  
	 --Exec(@sqlqry)
	 SET @sqlqry = 'UPDATE '+ @TableName +' SET '+ @ColumnName +' =211'
	 Exec(@sqlqry)
	 SET @count=@count+1
 END
 -------------------------------------------------------------------------
 DELETE FROM user_ACCOUNTS WHERE user_id =8125
 
 
 
 SELECT * FROM user_ACCOUNTS
 SET identity_insert user_ACCOUNTS ON 
 INSERT INTO user_ACCOUNTS
 
 (user_id,
username,
password,
first_name,
last_name,
email,
photo,
organization,
title,
phone,
address1,
address2,
city,
state,
zipcode,
country,
website,
mobile_number,
status,
summary,
membership,
user_posting,
user_register,
datejoined,
last_login,
last_ip,
session,
suspend_until,
timezone,
itemized_date,
user_type,
agency_group,
agency_name,
agency_id,
group_id,
queation,
answer,
due_date,
race,
note,
over_21,
marital_status,
message_alert,
case_worker,
case_worker_parent_user_id,
adoption_type,
spouse_first_name,
spouse_last_name,
spouse_organization,
spouse_title,
spouse_website,
referral,
mailtogroups,
airs_contact_id,
airs_contactairs_id,
doctogroups,
doctousers,
personal_gender,
spouse_gender,
message_group,
quickbook_listid,
quickbook_vendorid,
quickbook_queue,
signer1,
signer2,
video_msg,
status_mode,
edd,
id_type,
id_number,
quickbook_custeditseq,
quickbook_vendeditseq,
qb_listid_online,
qb_vendorid_online,
qb_online_updation,
qb_standalone_updation,
new_encryption,
ConnId,
passwordchange,
passwordchangedate,
SBFlag,
SBSaveMapDate,
trace) SELECT user_id,
username,
password,
first_name,
last_name,
email,
photo,
organization,
title,
phone,
address1,
address2,
city,
state,
zipcode,
country,
website,
mobile_number,
status,
summary,
membership,
user_posting,
user_register,
datejoined,
last_login,
last_ip,
session,
suspend_until,
timezone,
itemized_date,
user_type,
agency_group,
agency_name,
agency_id,
group_id,
queation,
answer,
due_date,
race,
note,
over_21,
marital_status,
message_alert,
case_worker,
case_worker_parent_user_id,
adoption_type,
spouse_first_name,
spouse_last_name,
spouse_organization,
spouse_title,
spouse_website,
referral,
mailtogroups,
airs_contact_id,
airs_contactairs_id,
doctogroups,
doctousers,
personal_gender,
spouse_gender,
message_group,
quickbook_listid,
quickbook_vendorid,
quickbook_queue,
signer1,
signer2,
video_msg,
status_mode,
edd,
id_type,
id_number,
quickbook_custeditseq,
quickbook_vendeditseq,
qb_listid_online,
qb_vendorid_online,
qb_online_updation,
qb_standalone_updation,
new_encryption,
ConnId,
passwordchange,
passwordchangedate,
SBFlag,
SBSaveMapDate,
trace FROM rolesqa.dbo.user_ACCOUNTS where user_id = 8125
  
 SELECT * FROM rolesqa.dbo.user_ACCOUNTS where user_id = 8125


 usp_getagencydetails











 UPDATE user_ACCOUNTS 

 --DELETE FROM user_Agencies WHERE agency_id = 25

 SELECT * FROM rolesqa.dbo.user_Agencies


 UPDATE user_Agencies SET 
 agency_id =211,
user_id = 8125,
c_account_key=211


SET identity_insert user_Agencies OFF 
INSERT INTO user_Agencies(
agency_id,
user_id,
agency_name,
address_line_1,
address_line_2,
city,
state,
zip,
country,
website,
phone,
fax,
email_id,
birth_parent_number,
adoptive_parent_number,
after_hours_number,
type_of_business,
technology,
no_of_years_in_business,
no_of_staff,
services,
states_licensed_in,
countries_licensed_in,
no_of_adoptions_year,
email_id_for_notifications,
alert_preference,
phone_to_sms,
mision_statement_check,
mision_statement_text,
values_check,
values_text,
background_check,
background_text,
logo,
nature_of_adoption,
religions,
payment_option,
perfect_adoption_portal,
other_info,
specialties,
c_account_key,
demo_video,
ConnId,
agency_tax_id,
county_id,
doc_process_id)SELECT agency_id,
user_id,
agency_name,
address_line_1,
address_line_2,
city,
state,
zip,
country,
website,
phone,
fax,
email_id,
birth_parent_number,
adoptive_parent_number,
after_hours_number,
type_of_business,
technology,
no_of_years_in_business,
no_of_staff,
services,
states_licensed_in,
countries_licensed_in,
no_of_adoptions_year,
email_id_for_notifications,
alert_preference,
phone_to_sms,
mision_statement_check,
mision_statement_text,
values_check,
values_text,
background_check,
background_text,
logo,
nature_of_adoption,
religions,
payment_option,
perfect_adoption_portal,
other_info,
specialties,
c_account_key,
demo_video,
ConnId,
agency_tax_id,
county_id,
doc_process_id FROM rolesqa.dbo.user_Agencies