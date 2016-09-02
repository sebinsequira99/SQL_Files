
------------------------------------------
Create Table #Tbl_agncyID (
 ID int identity(1,1),
 TableName Varchar(250),
 ColumnName varchar(250)
)
 INSERT INTO #Tbl_agncyID(TableName,ColumnName)
 SELECT T.Name as TableName,C.name as ColumnName  FROM sys.columns C 
 INNER JOIN sys.tables t on t.Object_id=c.Object_id   
 WHERE c.name like '%agency_id%' ORDER BY TableName
 ----------------------------------------
 DECLARE @TableName VARCHAR(100)
 DECLARE @ColumnName VARCHAR(100)
 DECLARE @count INT 
 DECLARE @ID INT 
 DECLARE  @sqlqry nvarchar(500)
 
  SET @count = 1
 SELECT @id = Max(ID) FROM  #Tbl_agncyID
 WHILE(@count<=@id )
 Begin
	 SELECT @TableName = TableName FROM #Tbl_agncyID WHERE ID = @count
	 SELECT @ColumnName = ColumnName FROM #Tbl_agncyID WHERE ID = @count
	 --SET @sqlqry = 'SELECT * FROM  '+@TableName  
	 --Exec(@sqlqry)

	 SET @sqlqry = 'UPDATE '+ @TableName +' SET '+ @ColumnName +' =212 '
	 PRINT @TableName
	 Exec(@sqlqry)
	 SET @count=@count+1
 END
 -------------------------------------------------------------------------

 Select * From #Tbl_agncyID


 Set IDENTITY_INSERT user_agencies ON 
 Insert Into  user_agencies ( agency_id, user_id, agency_name, address_line_1, address_line_2, city, state, zip, country, website, phone, fax, email_id, birth_parent_number, adoptive_parent_number, after_hours_number, 
                         type_of_business, technology, no_of_years_in_business, no_of_staff, services, states_licensed_in, countries_licensed_in, no_of_adoptions_year, email_id_for_notifications, alert_preference, phone_to_sms, 
                         mision_statement_check, mision_statement_text, values_check, values_text, background_check, background_text, logo, nature_of_adoption, religions, payment_option, perfect_adoption_portal, other_info, 
                         specialties, c_account_key, demo_video, agency_tax_id, county_id, doc_process_id, ConnId, theme_color, agency_description, system_description
)
Select  212, user_id, agency_name, address_line_1, address_line_2, city, state, zip, country, website, phone, fax, email_id, birth_parent_number, adoptive_parent_number, after_hours_number, 
                         type_of_business, technology, no_of_years_in_business, no_of_staff, services, states_licensed_in, countries_licensed_in, no_of_adoptions_year, email_id_for_notifications, alert_preference, phone_to_sms, 
                         mision_statement_check, mision_statement_text, values_check, values_text, background_check, background_text, logo, nature_of_adoption, religions, payment_option, perfect_adoption_portal, other_info, 
                         specialties, c_account_key, demo_video, agency_tax_id, county_id, doc_process_id, ConnId, theme_color, agency_description, system_description
From user_agencies
Set IDENTITY_INSERT user_agencies OFF

Select * From  user_agencies  
Delete from user_agencies Where agency_id = 77
Select * From  user_agencies  
 
 
 
 