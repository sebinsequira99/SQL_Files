


--PROCEDURE FOR MENU LISTING
--=================================

use rolesqa


IF exists (select 1 from sys.objects where name='usp_menu_listing' and type='p')
DROP PROCEDURE usp_menu_listing;

GO

CREATE PROCEDURE usp_menu_listing
(
@user_id int
,@group_id int
)

AS

BEGIN

IF (isnull(@group_id,0)=0)

	BEGIN

			SELECT m.menuid AS MENU_ID
				   ,m.menu_name AS MENU_NAME
				   ,m.parent_menu_id as PARENT_MENU_ID
				   ,isnull(p.enabledyn,0) AS ENABLED_YN 

			FROM sys_menu m
			LEFT JOIN sys_permissions p
			ON (m.menuid=p.menuid and p.userid=@user_id) where m.deletedyn=0

	END

ELSE

	BEGIN

			SELECT m.menuid AS MENU_ID
				   ,m.menu_name AS MENU_NAME
				   ,m.parent_menu_id as PARENT_MENU_ID
				   ,isnull(p.enabledyn,0) AS ENABLED_YN 

			FROM sys_menu m
			LEFT JOIN sys_permissions p
			ON (m.menuid=p.menuid and p.group_id=@group_id) where m.deletedyn=0
						 
	END																	
																		
END																		 
																		
																		
--EXEC usp_menu_listing @user_id=21								
--					  ,@group_id=''

