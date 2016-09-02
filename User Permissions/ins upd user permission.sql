



--PROCEDURE TO INSERT AND UPDATE
--======================================================================


IF exists (select 1 from sys.objects where name='usp_ins_upd' and type='p')
DROP PROCEDURE usp_ins_upd;

GO

CREATE PROCEDURE usp_ins_upd(@menuid				int
								,@menu_name			Varchar(50)
								,@parent_menu_id	int
								,@deletedyn			bit
								,@created_by		Varchar(50)
								,@updated_by		Varchar(50)
								,@userid			int
								,@group_id			int
								,@enabledyn			bit
								,@isgroup			bit
								,@created_by2		Varchar(50)
								,@updated_by2		Varchar(50))
AS
BEGIN
 		
		   IF(@menuid in (select menuid from sys_menu))

				BEGIN

						UPDATE sys_menu
						SET menu_name=@menu_name
							,parent_menu_id=@parent_menu_id
							,deletedyn=@deletedyn
							,created_by=@created_by
							,updated_by=@updated_by
							,updated_date=getdate()
						WHERE menuid=@menuid;


						UPDATE sys_permissions
						SET userid=@userid
							,group_id=@group_id
							,enabledyn=@enabledyn
							,isgroup=@isgroup
							,created_by=@created_by2
							,updated_by=@updated_by2
							,updated_date=getdate()
						WHERE menuid=@menuid;


				END


			ELSE

				BEGIN


						INSERT INTO sys_menu(menu_name
												,parent_menu_id
												,deletedyn
												,created_by)

						VALUES(@menu_name
								,@parent_menu_id
								,@deletedyn
								,@created_by);


						INSERT INTO sys_permissions(userid
													,group_id
													,menuid
													,enabledyn
													,isgroup
													,created_by)

						VALUES(@userid
								,@group_id
								,@menuid
								,@enabledyn
								,@isgroup
								,@created_by2);

				
				END

	

				
		

END

EXEC usp_ins_upd @menuid=
						,@menu_name=		
						,@parent_menu_id=
						,@deletedyn=		
						,@created_by=
						,@updated_by=
						,@userid=		
						,@group_id=		
						,@enabledyn=			
						,@isgroup=		
						,@created_by2=
						,@updated_by2=
					
				