

	--sp_helptext USP_SaveMapDataGroupByFormID 


	--DECLARE @STR VARCHAR(MAX)
	--SET @Str = 'SELECT '
	 
	--SELECT    @Str = @Str + Column_Name + ',' FROM Information_Schema.Columns
	--WHERE    TABLE_Name = 'Formmaker_25_acknowledgmentofreceiptofadoptionassistanceinformationmdip' AND 
	--        Column_Name like '%input_%'
	 
	 
	--SELECT @Str = SUBSTRING(@Str,0,len(@Str)) + ' into ##temptable FROM Formmaker_25_acknowledgmentofreceiptofadoptionassistanceinformationmdip 
	--WHERE USER_ID = '+ CAST(3874 as varchar(20))+' AND CONNID = '+ CAST(-68982 as varchar(20)) +' AND CONNECTIONID = ' +CAST(120265 as varchar(20)) 
	
	----SELECT @Str

	--EXEC (@Str)

	--select * from ##temptable


	use rolesqa

	DECLARE @STR VARCHAR(MAX)
	SET @Str = 'SELECT '
	 
	SELECT    @Str = @Str + Column_Name + ',' FROM Information_Schema.Columns
	WHERE    TABLE_Name = @FormName AND 
	        Column_Name like '%input_%'
	 
	 
	SELECT @Str = SUBSTRING(@Str,0,len(@Str)) + ' into ##temptable FROM' + @FormName +
	' WHERE USER_ID = '+ CAST(@User_Id as varchar(20))+' AND CONNID = '+ CAST(@ConnId as varchar(20)) +' AND CONNECTIONID = ' +CAST(@ConnectionID as varchar(20)) 
	
	--SELECT @Str

	EXEC (@Str)

	select * from ##temptable

