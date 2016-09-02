


use rolesqa

CREATE TABLE #sys_permissions
				 (			 userid				int			
							,group_id			int			
							,menuid				int			not null
							,enabledyn			bit			not null
							,isgroup			bit			not null
							,CreatedBy			int			not null
				 )
declare @xmlData XML
SET @xmlData='<Users>
  <users>

      <menuid>3</menuid>
    <userid>11</userid>
    <group_id>89</group_id>
    <enabledyn>0</enabledyn>
	<isgroup>1</isgroup>
	<createdby>1</createdby>


  </users>
  <users>

   <menuid>1</menuid>
    <userid>4747</userid>
    <group_id>88</group_id>
    <enabledyn>0</enabledyn>
	<isgroup>0</isgroup>
	<createdby>1</createdby>

  </users>

  <users>

  
      <menuid>2</menuid>
    <userid>15</userid>
    <group_id>8</group_id>
    <enabledyn>1</enabledyn>
	<isgroup>0</isgroup>
	<createdby>1</createdby>

  </users>
  </Users>';




INSERT INTO	#sys_permissions  
				(			 
							menuid							
							,userid				
							,group_id				
							,enabledyn			
							,isgroup			
							,CreatedBy			
				)	


SELECT
[Table].[Column].value('menuid[1]', 'INT') as 'MENU_ID',
[Table].[Column].value('userid[1]', 'INT') as ' USERID ',
[Table].[Column].value('group_id[1]', 'INT') as ' GROUP_ID',
[Table].[Column].value(' enabledyn[1]', 'INT') as ' ENABLED_YN',
[Table].[Column].value(' isgroup[1]', 'INT') as ' ISGROUP',
[Table].[Column].value(' createdby[1]', 'INT') as ' ADDED_BY'
FROM @xmlData.nodes('/ Users / users') as [Table]([Column])



			

INSERT INTO sys_permissions (menuid
							,userid
							,group_id
							,enabledyn
							,isgroup
							,CreatedBy)


select menuid
		,CASE
         WHEN (p2.isgroup=0) THEN (p2.userid)
         ELSE null
		 END
		,CASE
         WHEN (p2.isgroup=1) THEN (p2.group_id)
         ELSE null
		 END
		,enabledyn
		,isgroup
		,CreatedBy

from #sys_permissions p2

	 
	 WHERE (((menuid NOT IN (SELECT menuid FROM #sys_permissions)) and (userid NOT IN (SELECT userid FROM #sys_permissions)))
	 or ((menuid NOT IN (SELECT menuid FROM #sys_permissions)) and (group_id NOT IN (SELECT group_id FROM #sys_permissions))))
	 
	 UPDATE p1 SET p1.menuid = p2.menuid,p1.enabledyn = p2.enabledyn
	 ,p1.isgroup = p2.isgroup,p1.CreatedBy = p2.CreatedBy,p1.userid = 
    ( CASE
         WHEN (p2.isgroup=0) THEN (p2.userid)
         ELSE null
       END
    )
	,p1.group_id = 
    ( CASE
         WHEN (p2.isgroup=1) THEN (p2.group_id)
         ELSE null
       END
    )
	 FROM sys_permissions p1
	 INNER JOIN #sys_permissions p2 ON ( (p1.menuid =p2.menuid AND p1.userid = p2.userid)
					          OR (p1.menuid =p2.menuid AND p1.group_id = p2.group_id))
     WHERE p1.enabledyn != p2.enabledyn OR p1.isgroup != p2.isgroup OR p1.CreatedBy != p2.CreatedBy




	 				          

--UPDATE sys_permissions
--SET userid = 
--    ( CASE
--         WHEN (p2.isgroup=0) THEN (p2.userid)
--         ELSE null
--       END
--    )
--from #sys_permissions p2


--UPDATE sys_permissions
--SET group_id = 
--    ( CASE
--         WHEN (p2.isgroup=1) THEN (p2.group_id)
--         ELSE null
--       END
--    )
--from #sys_permissions p2


--	UPDATE sys_permissions 
--	SET menuid = p2.menuid,enabledyn = p2.enabledyn,isgroup = p2.isgroup,CreatedBy = p2.CreatedBy
--	from #sys_permissions p2





	--select * from sys_permissions

