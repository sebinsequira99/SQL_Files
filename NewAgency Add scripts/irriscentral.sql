SELECT * FROM DBO.user_accounts--8139

use MAPBCFS
sp_helptext usp_getagencydetails

UPDATE [user_accounts] SET username='admin@fullcircleadoptions.com' WHERE user_id=8139

UPDATE [user_accounts] SET Password='123456' WHERE user_id=8139

SELECT * FROM  irriscentral.dbo.map_user_accounts where map_username='info@buckner.org'--267151

USE irriscentral
INSERT INTO  map_user_accounts (map_username,map_password,map_encryption)VALUES ('info@buckner.org','buckner123','Y')



INSERT INTO map_user_agencies (map_user_id,map_agency_id,user_id,status)VALUES(267151,205,8139,'Active')

SELECT * FROM map_user_agencies where map_agency_id = 205

DELETE user_accounts where user_id =8139
UPDATE user_accounts SET username='info@buckner.org',password='buckner123',first_name='Auto',last_name='Generated',email='info@buckner.org',website='http://www.buckner.org/' where user_id=8125


Delete MAPFCA.dbo.user_agencies where agency_id=190

SELECT * FROM MAPBCFS.dbo.contact where contactid=1389
SELECT * FROM MAPFCA.dbo.contact where contactid=1389--(check contact name admin or not)

Update MAPFCA.dbo.user_agencies  SET user_id=8125 


SP_CWTree is not correct in baseline merge ... take it from MAPAT other wise make error with caseworker creation 