





create table #databases(dbid int identity(1,1)
						,dbname varchar(50))

insert into #databases(dbname)
SELECT name
FROM sysdatabases
where name not in('master','tempdb','model','msdb','ReportServer$SQLEXPRESS','ReportServer$SQLEXPRESSTempDB')


DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @sql varchar(100);
DECLARE @sql_t varchar(1000);
DECLARE @sql_a varchar(1000);
DECLARE @table_id int; 
DECLARE @table_count int;
DECLARE @table_name varchar(100);
DECLARE @column_name varchar(100);
DECLARE @sql_insert varchar(1000);
DECLARE @sql_delete varchar(1000);
DECLARE @agency_id int;

SET @dbid = 1;
SELECT @dbcount=COUNT(dbid)
FROM #databases;


WHILE  @dbid <= @dbcount
BEGIN
		SELECT @dbname=dbname 
		FROM #databases 
		WHERE dbid=@dbid ;

		set @sql='use ' + @dbname;
		print @sql
		exec(@sql)
		set @sql_t='drop table #delete_contacts
		create table #delete_contacts(table_id int identity(1,1)
										,database_name varchar(100)
										,schemaname varchar(50)
										,table_name varchar(100)
										,column_name varchar(100))
		insert into #delete_contacts(database_name,schemaname,table_name,column_name)
		select table_catalog,table_schema,table_name,column_name
		from ' + @dbname + '.information_schema.columns where column_name like ''%contactid%''
		drop table #deletecontacts 
		select contactid into #deletecontacts from ' + @dbname + '.dbo.contact where fname=''test'' or lname=''test'' or fname=''media'' or lname=''media'' '
		print(@sql_t)
		set @sql_a='select table_catalog,table_schema,table_name,column_name
		from ' + @dbname + '.information_schema.columns where column_name like ''%contactid%'''
		drop table #delete_contacts
		create table #delete_contacts(table_id int identity(1,1)
										,database_name varchar(100)
										,schemaname varchar(50)
										,table_name varchar(100)
										,column_name varchar(100))
		insert into #delete_contacts(database_name,schemaname,table_name,column_name)
		exec(@sql_a)


SET @table_id = 1;
SELECT @table_count=COUNT(table_id)
FROM #delete_contacts;

WHILE  @table_id <= @table_count
		BEGIN
				SELECT @table_name=table_name 
				FROM #delete_contacts 
				WHERE table_id=@table_id
				SELECT @column_name=column_name
				FROM #delete_contacts
				WHERE table_id=@table_id
				SET @table_id=@table_id+1;
				SET @sql_insert=' insert into ContactCleanup.dbo.DataCount(contact_id,dbname,table_name,BeforeCount) 
				select ' + @column_name + ',db_name(),'''+ @table_name +''',(select count(1) from ' + @table_name + ') from '  + @table_name + '
				where ' + @column_name + ' in(select contactid from #deletecontacts)
				IF exists (select 1 from contactcleanup.information_schema.tables where table_name='''+ @table_name +''')
				insert into ContactCleanup.dbo.' + @table_name + ' select * from ' + @table_name + '
				where ' + @column_name + ' in(select contactid from #deletecontacts)
				else select * into ContactCleanup.dbo.' + @table_name + ' from ' + @table_name;
				print @sql_insert
				--EXEC(@sql_insert)
		
				SET @sql_delete=' delete dbo.' + @table_name + 
				' from dbo.' + @table_name + ' c join #deletecontacts d on c.contactid=d.contactid
				update ContactCleanup.dbo.DataCount
				set aftercount=(select count(1) from ' + @table_name + ') where table_name=''' + @table_name + '''';
				print @sql_delete
				--EXEC(@sql_delete)
		END

		SET @dbid=@dbid+1;

END





