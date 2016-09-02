



--PROCEDURE TO INSERT AND UPDATE SYS_PERMISSIONS
--======================================================================
USE rolesqa

IF exists (select 1 from sys.objects where name='usp_edit_sys_permissions' and type='p')
DROP PROCEDURE usp_edit_sys_permissions;

GO

CREATE PROCEDURE usp_edit_sys_permissions(@menuid				int
											,@userid			int
											,@groupid			int
											,@enabledyn			bit
											,@isgroup			bit
											,@AddedBy			int)


AS
BEGIN



			IF EXISTS(select 1 from sys_permissions 
			WHERE (((menuid=@menuid) and (userid=@userid)) or ((menuid=@menuid) and (group_id=@groupid))))


				BEGIN

					IF (@isgroup=1)

						BEGIN


								UPDATE sys_permissions
								SET userid=null
									,group_id=@groupid
									,enabledyn=@enabledyn
									,isgroup=@isgroup
									,LastModifiedBy=@AddedBy
									,LastModifiedDate=getdate()
								WHERE ((menuid=@menuid) and (group_id=@groupid))

								

						END

					ELSE IF (@isgroup=0)

						BEGIN


								UPDATE sys_permissions
								SET userid=@userid
									,group_id=null
									,enabledyn=@enabledyn
									,isgroup=@isgroup
									,LastModifiedBy=@AddedBy
									,LastModifiedDate=getdate()
								WHERE ((menuid=@menuid) and (userid=@userid))

						END




				END



			ELSE


				BEGIN
							
							
					IF (@isgroup=1)

						BEGIN

								INSERT INTO sys_permissions(menuid
															,userid
															,group_id
															,enabledyn
															,isgroup
															,CreatedBy)

								VALUES(@menuid
										,null
										,@groupid
										,@enabledyn
										,@isgroup
										,@AddedBy);


						END

					ELSE IF (@isgroup=0)

						BEGIN


								INSERT INTO sys_permissions(menuid
															,userid
															,group_id
															,enabledyn
															,isgroup
															,CreatedBy)

								VALUES(@menuid
										,@userid
										,null
										,@enabledyn
										,@isgroup
										,@AddedBy);


						END
				



				END

	
END
				
		 
--EXEC usp_edit_sys_permissions @menuid=3
--								,@userid=''
--								,@groupid=45	
--								,@enabledyn=1		
--								,@isgroup=1
--								,@AddedBy=1

