

--DROP TABLE #forms
--DROP TABLE #users
--DROP TABLE ##TempFormTable

use MAPATFS_NEW

--TRUNCATE TABLE form_data_test

SET NOCOUNT ON

CREATE TABLE #forms(id int identity(1,1)
				   ,form_id int
				   ,form_tablename varchar(max))

INSERT INTO #forms(form_id,form_tablename)
SELECT form_id,('formmaker_'+formname) from mapat.dbo.formmaker_properties

select * from #forms

DECLARE @form_id int
       ,@start_row int=1
       ,@end_row int
	   ,@formtblname varchar(max)
	   ,@runsql nvarchar(max)
	   ,@d_sql nvarchar(max)
	   ,@dsql nvarchar(max)
	   ,@data_xml xml
	   ,@start_id int
       ,@end_id int
	   ,@user_id int
	   ,@connectionid int
	   ,@col varchar(20)
	   ,@column varchar(20)

SELECT @end_row= count(*) FROM #forms

WHILE(@start_row<=@end_row)

BEGIN

	--print 'in the main loop'
	print @start_row
	SELECT @form_id=form_id FROM #forms WHERE id=@start_row
	SELECT @formtblname=form_tablename FROM #forms WHERE id=@start_row
	
	CREATE TABLE #users(id int identity(1,1)
					   ,[user_id] int
					   ,connectionid int)
	
	SET @d_sql='SELECT user_id,connectionid from mapat.dbo.'+@formtblname
	PRINT @d_sql
	
	INSERT INTO #users([user_id],connectionid)
	EXEC (@d_sql)
	
	SELECT @start_id=1
		  ,@end_id=count(*) FROM #users

	--select * from #users

	WHILE(@start_id<=@end_id)
	BEGIN

		--print 'in the sub loop'

		SELECT @user_id=[user_id] FROM #users WHERE id=@start_id
		SELECT @connectionid=connectionid FROM #users WHERE id=@start_id
		
		IF(@connectionid is null)
		BEGIN
		SET @connectionid=0
		END

		set @d_sql='declare @col varchar(20)
		select @col=column_name from mapat.information_schema.columns 
		where table_name='''+@formtblname+ ''' and column_name=''isxml'''
		--print @d_sql
		exec(@d_sql)

		set @d_sql='declare @column varchar(20)
		select @column=column_name from mapat.information_schema.columns 
		where table_name='''+@formtblname+ ''' and column_name=''formfulldata'''
		--print @d_sql
		exec(@d_sql)

		IF(@col is not null and @column is not null)
		BEGIN
			SET @dsql='
			SELECT * INTO ##TempFormTable
			FROM mapat.dbo.'+@formtblname+' where user_id='+cast(@user_id as varchar(10))+' 
			and isnull(connectionid,0)='+cast(@connectionid as varchar(10))+'
			ALTER TABLE ##TempFormTable
			DROP COLUMN data_id,user_id,key_id,connid,connectionid,isxml,formfulldata'
		END

		ELSE 
		BEGIN
			SET @dsql='
			SELECT * INTO ##TempFormTable
			FROM mapat.dbo.'+@formtblname+' where user_id='+cast(@user_id as varchar(10))+' 
			and isnull(connectionid,0)='+cast(@connectionid as varchar(10))+'
			ALTER TABLE ##TempFormTable
			DROP COLUMN data_id,user_id,key_id,connid,connectionid'
		END

		exec (@dsql)
		
		SET @runsql='select (select form_id from #forms where id='+cast(@start_row as varchar(10))+')
						 , f.[user_id]
						 , isnull(f.connid,0)
						 , isnull(f.connectionid,0)
						 , (select '
							+(select STUFF((SELECT distinct ',' + concat(name,' as',' '''+name+'''')
											FROM    tempdb.sys.columns 
											WHERE object_id = OBJECT_ID('tempdb..##TempFormTable')
											FOR XML PATH(''),TYPE).value('.', 'NVARCHAR(MAX)')
											,1
											,1
											,''))
							+' from ##TempFormTable 
							   for xml path(''''), type, root(''xml''))
						 , isnull(
						   (select dbo.qfn_XmlToJson((select '
							+(select STUFF((SELECT distinct ',' + concat(name,' as',' '''+name+'''')
											FROM    tempdb.sys.columns 
											WHERE object_id = OBJECT_ID('tempdb..##TempFormTable')
											FOR XML PATH('')
											,TYPE).value('.', 'NVARCHAR(MAX)')
											,1
											,1
											,''))
							+' from ##TempFormTable 
							   for xml path(''''), type, root(''xml''))))
							   ,0)
						 , 8125
						 , 8125
						 , getdate()
						 , getdate()
		from mapat.dbo.'+@formtblname+' f
		where f.user_id='+cast(@user_id as varchar(10))+' and isnull(f.connectionid,0)='+cast(@connectionid as varchar(10))
		
		--PRINT @runsql
		
		INSERT INTO form_data_test(form_id
							 ,[user_id]
							 ,connid
							 ,connectionid
							 ,data_xml
							 ,data_json
							 ,created_by
							 ,updated_by
							 ,created_at
							 ,updated_at)
		
		EXEC (@runsql)
		
		SET @start_id=@start_id+1
		
		DROP TABLE ##TempFormTable
		
	
	END
	
	SET @start_row=@start_row+1

	DROP TABLE #users

	END

DROP TABLE #forms

SET NOCOUNT OFF