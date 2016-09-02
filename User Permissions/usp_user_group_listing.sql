

--PROCEDURE TO LIST USERS(CW) AND GROUPS
--=============================================

USE rolesqa

IF exists (select 1 from sys.objects where name='usp_user_group_listing' and type='p')
DROP PROCEDURE usp_user_group_listing;

GO
			
CREATE PROCEDURE usp_user_group_listing
(
@ListType		INT, -- 1-CW,2-Group
@StRow			INT = 0,
@EndRow			INT = 100
)

AS

	BEGIN

			IF (@ListType=1)

				BEGIN

						SELECT  U.User_id as ID, ISNULL(U.first_name,'') +' ' +	ISNULL(U.last_name,'') AS [USER_NAME] 
						FROM user_Accounts u
						WHERE user_type=  'Agency_User' AND (U.first_name!='')
						ORDER BY U.first_name,U.last_name
		
				END
	
			ELSE IF (@ListType=2)

				BEGIN
		
						SELECT group_id as ID, ISNULL(group_name,'') [GROUP_NAME]
						FROM User_Groups G 
						WHERE group_name!=''
						ORDER BY group_name


				END



	END



--exec usp_user_group_listing @ListType=1,	 -- 1-CW,2-Group
--								@StRow=0,
--								@EndRow=100


