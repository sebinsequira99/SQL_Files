

--use newDB

UPDATE user_accounts SET username='restore'+username, Email = 'restore'+Email 
WHERE user_type not in('admin','agency')			

UPDATE contactemail SET ContactEmail='restore'+ContactEmail 

UPDATE user_notifications SET un_email_id=LEFT('restore'+ISNULL(un_email_id,''),50) 

UPDATE system_settings 
SET setting=replace(setting,'@','restore@')
where setting like '%@%'

						


