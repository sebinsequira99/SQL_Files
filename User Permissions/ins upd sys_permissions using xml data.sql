





--PROCEDURE TO INSERT AND UPDATE SYS_PERMISSIONS
--======================================================================

USE rolesqa

IF exists (select 1 from sys.objects where name='usp_edit_sys_permissions' and type='p')
DROP PROCEDURE usp_edit_sys_permissions;

GO

CREATE PROCEDURE usp_edit_sys_permissions
(
@xmlData XML
)


AS

BEGIN

BEGIN TRY


WITH XmlData AS 
(

SELECT

 [Table].[Column].value('menuid[1]', 'INT')		as 'menuid'
,[Table].[Column].value('userid[1]', 'INT')		as 'userid'
,[Table].[Column].value('group_id[1]', 'INT')	as 'group_id'
,[Table].[Column].value(' enabledyn[1]', 'BIT')	as 'enabledyn'
,[Table].[Column].value(' isgroup[1]', 'BIT')	as 'isgroup'
,[Table].[Column].value(' Loginuser[1]', 'INT')	as 'Loginuser'

FROM @xmlData.nodes('/ User_Permissions')		as [Table]([Column])

)



MERGE INTO sys_permissions p
USING XmlData x ON ((p.menuid = x.menuid) and (p.userid=x.userid or p.group_id=x.group_id))
WHEN MATCHED

	THEN 

		UPDATE SET 

				     p.userid				=	CASE
												WHEN (x.isgroup=0) THEN (x.userid)
												ELSE null
												END
				     ,p.group_id			=	CASE
												WHEN (x.isgroup=1) THEN (x.group_id)
												ELSE null
												END
				     ,p.enabledyn			=	x.enabledyn
				     ,p.isgroup				=	x.isgroup
					 ,p.LastModifiedBy		=	x.Loginuser
					 ,p.LastModifiedDate	=	getdate()


WHEN NOT MATCHED

	THEN 

			INSERT (menuid
				   ,userid
				   ,group_id
				   ,enabledyn
				   ,isgroup
				   ,CreatedBy)

			VALUES (x.menuid
				   ,CASE
					WHEN (x.isgroup=0) THEN (x.userid)
				    ELSE null
					END
				   ,CASE
					WHEN (x.isgroup=1) THEN (x.group_id)
					ELSE null
					END
				   ,x.enabledyn
				   ,x.isgroup
				   ,x.Loginuser);

					
END TRY

BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
       ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;



END


--EXEC usp_edit_sys_permissions @xmldata='
--  <User_Permissions>

--    <menuid>4</menuid>
--    <userid>21</userid>
--    <group_id>8</group_id>
--    <enabledyn></enabledyn>
--	<isgroup>0</isgroup>
--	<Loginuser>1</Loginuser>


--  </User_Permissions>
--  <User_Permissions>

--    <menuid>20</menuid>
--    <userid>4747</userid>
--    <group_id>88</group_id>
--    <enabledyn>1</enabledyn>
--	<isgroup>1</isgroup>
--	<Loginuser>1</Loginuser>

--  </User_Permissions>

--  <User_Permissions>

  
--    <menuid>6</menuid>
--    <userid></userid>
--    <group_id>8</group_id>
--    <enabledyn></enabledyn>
--	<isgroup>1</isgroup>
--	<Loginuser>1</Loginuser>

--  </User_Permissions>


--    <User_Permissions>

  
--    <menuid>6</menuid>
--    <userid>155</userid>
--    <group_id></group_id>
--    <enabledyn>1</enabledyn>
--	<isgroup>0</isgroup>
--	<Loginuser>1</Loginuser>

--  </User_Permissions>

--  <User_Permissions>

--    <menuid>5</menuid>
--    <userid>21</userid>
--    <group_id></group_id>
--    <enabledyn>1</enabledyn>
--	<isgroup>0</isgroup>
--	<Loginuser>1</Loginuser>

--  </User_Permissions>'

