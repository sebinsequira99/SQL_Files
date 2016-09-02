


--PROCEDURE TO INSERT AND UPDATE SYS_MENU
--======================================================================

USE rolesqa

IF exists (select 1 from sys.objects where name='usp_edit_sys_menu' and type='p')
DROP PROCEDURE usp_edit_sys_menu;

GO

CREATE PROCEDURE usp_edit_sys_menu
(
@xmlData XML
)

AS

BEGIN

BEGIN TRY


WITH XmlData AS 
(

SELECT

 [Table].[Column].value('menuid[1]', 'INT')				as 'menuid'
,[Table].[Column].value('menu_name[1]', 'varchar(20)')	as 'menu_name'
,[Table].[Column].value('parent_menu_id[1]', 'INT')		as 'parent_menu_id'
,[Table].[Column].value(' deletedyn[1]', 'BIT')			as 'deletedyn'
,[Table].[Column].value(' Loginuser[1]', 'INT')			as 'Loginuser'

FROM @xmlData.nodes('/ User_Permissions')				as [Table]([Column])

)



MERGE INTO sys_menu m
USING XmlData x ON (m.menuid = x.menuid)
WHEN MATCHED

	THEN 

		UPDATE SET 

				      m.menu_name=x.menu_name
					 ,m.parent_menu_id=x.parent_menu_id
					 ,m.deletedyn=x.deletedyn
					 ,m.LastModifiedBy=x.Loginuser
					 ,m.LastModifiedDate=getdate()


WHEN NOT MATCHED

	THEN 

			INSERT (menu_name
					,parent_menu_id
					,deletedyn
					,Createdby)

			VALUES (x.menu_name
					,x.parent_menu_id
					,x.deletedyn
					,x.Loginuser);



END TRY

BEGIN CATCH
    SELECT 
         ERROR_NUMBER() AS ErrorNumber
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


END


--EXEC usp_edit_sys_menu @xmldata='
--  <User_Permissions>

--	<menuid>1</menuid>
--    <menu_name>Task Freak</menu_name>
--    <parent_menu_id>0</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>

--  </User_Permissions>
--  <User_Permissions>
--	<menuid>2</menuid>
--    <menu_name>Templates</menu_name>
--    <parent_menu_id>1</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>

--  <User_Permissions>

--	<menuid>3</menuid>
--	<menu_name>Create</menu_name>
--    <parent_menu_id>2</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>
--  <User_Permissions>

--	<menuid>4</menuid>
--	<menu_name>Edit</menu_name>
--    <parent_menu_id>2</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>

--    <User_Permissions>

--	<menuid>5</menuid>
--	<menu_name>Delete</menu_name>
--    <parent_menu_id>2</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>



--    <User_Permissions>

--	<menuid>6</menuid>
--	<menu_name>Print</menu_name>
--    <parent_menu_id>2</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>



--    <User_Permissions>

--	<menuid>7</menuid>
--	<menu_name>Template Mapping</menu_name>
--    <parent_menu_id>1</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>


--    <User_Permissions>

--	<menuid>8</menuid>
--	<menu_name>Create</menu_name>
--    <parent_menu_id>7</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>
--  <User_Permissions>

--	<menuid>9</menuid>
--	<menu_name>Edit</menu_name>
--    <parent_menu_id>7</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>

--    <User_Permissions>

--	<menuid>10</menuid>
--	<menu_name>Delete</menu_name>
--    <parent_menu_id>7</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>



--    <User_Permissions>

--	<menuid>11</menuid>
--	<menu_name>Print</menu_name>
--    <parent_menu_id>7</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>


--  <User_Permissions>

--	<menuid>12</menuid>
--	<menu_name>Matching</menu_name>
--    <parent_menu_id>0</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>


--      <User_Permissions>

--	<menuid>13</menuid>
--	<menu_name>Execute Matching</menu_name>
--    <parent_menu_id>12</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>
--  <User_Permissions>

--	<menuid>14</menuid>
--	<menu_name>Edit</menu_name>
--    <parent_menu_id>12</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>

--  <User_Permissions>

--	<menuid>15</menuid>
--	<menu_name>Delete</menu_name>
--    <parent_menu_id>12</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>



--    <User_Permissions>

--	<menuid>16</menuid>
--	<menu_name>Print</menu_name>
--    <parent_menu_id>12</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>


--  <User_Permissions>

--	<menuid>17</menuid>
--	<menu_name>Finance</menu_name>
--    <parent_menu_id>0</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>


--  <User_Permissions>

--	<menuid>18</menuid>
--	<menu_name>Allow Discount Entry</menu_name>
--    <parent_menu_id>17</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>
--  <User_Permissions>

--	<menuid>19</menuid>
--	<menu_name>Edit</menu_name>
--    <parent_menu_id>17</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>

--  <User_Permissions>

--	<menuid>20</menuid>
--	<menu_name>Delete</menu_name>
--    <parent_menu_id>17</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>



--    <User_Permissions>

--	<menuid>21</menuid>
--	<menu_name>Print</menu_name>
--    <parent_menu_id>17</parent_menu_id>
--    <deletedyn></deletedyn>
--    <Loginuser>1</Loginuser>


--  </User_Permissions>'


