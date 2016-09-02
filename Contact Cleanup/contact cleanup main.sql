

--create database ContactCleanup

--create table DataCount(deleted_id int identity(1,1)
--								,contact_id int
--								,agencyid int
--								,dbname varchar(50)
--								,table_name varchar(50)
--								,BeforeCount int
--								,AfterCount int
--								)

--select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media'

create table #delete_contacts(table_id int identity(1,1)
								,database_name varchar(100)
								,schemaname varchar(50)
								,table_name varchar(100)
								,column_name varchar(100))

insert into #delete_contacts(database_name,schemaname,table_name,column_name)

select table_catalog,table_schema,table_name,column_name
from information_schema.columns where column_name like '%contactid%'

--create table DataCount(AgencyID int
--						,DBName varchar(100)
--						,Table_name varchar(100)
--						,BeforeCount int
--						,AfterCount int)

DECLARE @table_id int; 
DECLARE @table_count int;
DECLARE @table_name varchar(100);
DECLARE @column_name varchar(100);
DECLARE @database_name varchar(100);
DECLARE @sql_insert varchar(1000);
DECLARE @sql_delete varchar(1000);

SET @table_id = 1;
SELECT @table_count=COUNT(table_id)
FROM #delete_contacts;
SELECT @database_name= database_name FROM #delete_contacts;


WHILE  @table_id <= @table_count
BEGIN
		SELECT @table_name=table_name 
		FROM #delete_contacts 
		WHERE table_id=@table_id
		SELECT @column_name=column_name
		FROM #delete_contacts
		WHERE table_id=@table_id
		SET @table_id=@table_id+1;
		SET @sql_insert=' insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ' + @column_name + ',(select agency_id from user_agencies),db_name(),'''+ @table_name +''',(select count(1) from ' + @table_name + ') from '  + @table_name + '
		where ' + @column_name + ' in(select contactid from contact where fname=''test'' or lname=''test'' or fname=''media'' or lname=''media'')
		select * into ContactCleanup.dbo.' + @table_name + ' from ' + @table_name + '
		where ' + @column_name + ' in(select contactid from contact where fname=''test'' or lname=''test'' or fname=''media'' or lname=''media'')';
		print @sql_insert
		--EXEC(@sql_insert)

		SET @sql_delete=' delete from ' + @database_name + '.dbo.' + @table_name + 
		' where ' + @column_name + ' in(select contactid from contact where fname=''test'' or lname=''test'' or fname=''media'' or lname=''media'')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ' + @table_name + ') where table_name=''' + @table_name + '''';
		print @sql_delete
		--EXEC(@sql_delete)
END


DECLARE @table_id int; 
DECLARE @table_count int;
DECLARE @table_name varchar(100);
DECLARE @column_name varchar(100);
DECLARE @database_name varchar(100);
DECLARE @sql_insert varchar(1000);
DECLARE @sql_delete varchar(1000);

SET @table_id = 1;
SELECT @table_count=COUNT(table_id)
FROM #delete_contacts;
SELECT @database_name= database_name FROM #delete_contacts;


WHILE  @table_id <= @table_count
BEGIN
		SELECT @table_name=table_name 
		FROM #delete_contacts 
		WHERE table_id=@table_id
		SELECT @column_name=column_name
		FROM #delete_contacts
		WHERE table_id=@table_id
		SET @table_id=@table_id+1;
		SET @sql_insert='select * from ' + @table_name + ' 
		where ' + @column_name + ' in(select contactid from contact where fname=''test'' or lname=''test'' or fname=''media'' or lname=''media'')';
		print @sql_insert
		--EXEC(@sql_insert)

END


