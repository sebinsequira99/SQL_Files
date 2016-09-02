



--PROCEDURE TO INSERT AND UPDATE SYS_MENU
--======================================================================
USE rolesqa

IF exists (select 1 from sys.objects where name='usp_edit_sys_menu' and type='p')
DROP PROCEDURE usp_edit_sys_menu;

GO

CREATE PROCEDURE usp_edit_sys_menu(@menuid				int
									,@menu_name			Varchar(50)
									,@parent_menu_id	int
									,@deletedyn			bit
									,@AddedBy			int)

AS
BEGIN
 		
		   IF EXISTS(select 1 from sys_menu where menuid=@menuid)

				BEGIN

						UPDATE sys_menu
						SET menu_name=@menu_name
							,parent_menu_id=@parent_menu_id
							,deletedyn=@deletedyn
							,LastModifiedBy=@AddedBy
							,LastModifiedDate=getdate()
						WHERE menuid=@menuid;


				END


			ELSE

				BEGIN


						INSERT INTO sys_menu(menu_name
												,parent_menu_id
												,deletedyn
												,CreatedBy)

						VALUES(@menu_name
								,@parent_menu_id
								,@deletedyn
								,@AddedBy);


				
				END

	

				
		

END

--EXEC usp_edit_sys_menu @menuid=7
--						,@menu_name='g'
--						,@parent_menu_id=0
--						,@deletedyn=0
--						,@AddedBy=1

					
