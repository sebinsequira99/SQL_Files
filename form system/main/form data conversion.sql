

--use mapform

TRUNCATE TABLE form_data_test

CREATE TABLE #forms(id int identity(1,1)
				   ,form_id int
				   ,form_tablename varchar(max))

INSERT INTO #forms(form_id,form_tablename)
SELECT form_id,('formmaker_'+formname) from mapat.dbo.formmaker_properties where form_id=863

DECLARE @form_id int
       ,@start_row int=1
       ,@end_row int
	   ,@formtblname varchar(max)
	   ,@runsql nvarchar(max)
	   ,@d_sql nvarchar(max)
	   ,@dsql nvarchar(max)
	   ,@data_xml xml
	   ,@start_id int=1
       ,@end_id int
	   ,@user_id int
	   ,@connectionid int

SELECT @end_row= count(*) FROM #forms

WHILE(@start_row<=@end_row)

BEGIN

SELECT @form_id=form_id FROM #forms WHERE id=@start_row
SELECT @formtblname=form_tablename FROM #forms WHERE id=@start_row

CREATE TABLE #users(id int identity(1,1)
				   ,[user_id] int
				   ,connectionid int)

SET @d_sql='SELECT user_id,connectionid from mapat.dbo.'+@formtblname
PRINT @d_sql

INSERT INTO #users([user_id],connectionid)
EXEC (@d_sql)

SELECT @end_id=count(*) FROM #users

WHILE(@start_id<=@end_id)
BEGIN

SELECT @user_id=[user_id] FROM #users WHERE id=@start_id
SELECT @connectionid=connectionid FROM #users WHERE id=@start_id

IF(@connectionid is null)
BEGIN
SET @connectionid=0
END

SET @dsql='
SELECT * INTO ##TempFormTable
FROM mapat.dbo.'+@formtblname+' where user_id='+cast(@user_id as varchar(10))+' 
and isnull(connectionid,0)='+cast(@connectionid as varchar(10))+'
ALTER TABLE ##TempFormTable
DROP COLUMN data_id,user_id,key_id,connid,connectionid,isxml,formfulldata'

print @dsql

exec (@dsql)

SET @runsql='select (select form_id from #forms where id='+cast(@start_row as varchar(10))+')
				 , f.[user_id]
				 , isnull(f.connid,0)
				 , isnull(f.connectionid,0)
				 , (select '
					+(select STUFF((SELECT distinct ',' + concat(name,' as',' '''+name+'/value_0''')
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
					+(select STUFF((SELECT distinct ',' + concat(name,' as',' '''+name+'/value_0''')
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

PRINT @runsql

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

