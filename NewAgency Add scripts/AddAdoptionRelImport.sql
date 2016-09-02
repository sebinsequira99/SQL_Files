drop table  #Tbl_agncyID
GO
------------------------------------------
Create Table #Tbl_agncyID (
 ID int identity(1,1),
 TableName Varchar(250),
 ColumnName varchar(250)
)
 INSERT INTO #Tbl_agncyID(TableName,ColumnName)
 SELECT T.Name as TableName,C.name as ColumnName  FROM sys.columns C 
 INNER JOIN sys.tables t on t.Object_id=c.Object_id   
 WHERE c.name like '%agency_id%'
 ----------------------------------------
 DECLARE @TableName VARCHAR(100)
 DECLARE @ColumnName VARCHAR(100)
 DECLARE @count INT 
 DECLARE @ID INT 
 DECLARE  @sqlqry nvarchar(500)
 
  SET @count = 1
 SET @id = scope_identity()
  WHILE(@count<=@id )
  BEGIN
	 SELECT @TableName = TableName,
			@ColumnName = ColumnName FROM #Tbl_agncyID WHERE ID = @count
	SELECT @TableName
	 SET @sqlqry = 'SELECT * FROM  '+@TableName  
	 Exec(@sqlqry)
	-- --SET @sqlqry = 'UPDATE '+ @TableName +' SET '+ @ColumnName +' =203'
	-- --Exec(@sqlqry)
	 
	 SET @count=@count+1
 END
 
 
-- DELETE FROM  surveypro_campaigns
-- DELETE from agency_services WHERE service_id NOt IN(SELECT min( service_id) FROm agency_services
--GROUP BY service_desc)
 
-- DELETE from eventscalendar_referral WHERE referral_id NOt IN 
-- (SELECT min( referral_id) FROm eventscalendar_referral
--GROUP BY referral_desc)

--DELETE FROM users_report_permission

--DELETE FROM agency_religions WHERE religion_id NOT IN ( SELECT min( religion_id) FROm agency_religions
--GROUP BY religion_desc)
 

--DELETE FROM agency_specialties WHERE specialty_id NOT IN (SELECT min( specialty_id) FROm agency_specialties
--GROUP BY specialty_desc)
 
--delete froM user_reference

--drOP TABLE user_reference_settings_org20120331

--delete from static_form_agencies

--delete from user_reference_mapping

--delete from user_branches

--delete from qb_duplicate

--delete from user_inquires

--delete from formmaker_agencies

--delete from casenote_version

--drop TABLE test_agency

--drop TABLE user_reference_BackUp_010713


--delete from formmaker_orders

--DELETE from user_message_logs

--delete froM formmaker_agencies