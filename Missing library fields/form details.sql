
use rolesqa

create table #databases(dbid int identity(1,1)
						,dbname varchar(50))

insert into #databases(dbname)
SELECT name
FROM sys.databases
where name not in('master','tempdb','model','msdb','ReportServer$SQLEXPRESS','ReportServer$SQLEXPRESSTempDB')


DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @sql varchar(100);
DECLARE @sql_insert varchar(max);


SET @dbid = 1;
SELECT @dbcount=COUNT(dbid)
FROM #databases;


WHILE  @dbid <= @dbcount
BEGIN
		SELECT @dbname=dbname 
		FROM #databases 
		WHERE dbid=@dbid ;

		set @sql='use ' + @dbname + ' go';
		print @sql
		exec(@sql)

		set @sql_insert='alter table Missinglibraryfields_11_06_15
add FormId int
alter table Missinglibraryfields_11_06_15
add FormName varchar(max);
go
		with form as 
(
SELECT ''formmaker_''+F.Formname as formname,f.form_id,ms.field_id FROM Formmaker_Properties F 
INNER JOIN Formmaker_Pages P ON P.Form_id=F.Form_id
INNER JOIN  formmaker_fields FF ON FF.Page_id=P.Page_id
RIGHT JOIN ' + @dbname + '.dbo.Missinglibraryfields_11_06_15 ms ON MS.field_id = ff.field_id
)

UPDATE m SET m.FormId = fs.form_id
			 ,m.FormName=fs.formname
FROM Missinglibraryfields_11_06_15 AS m JOIN form AS fs ON m.field_id = fs.field_id';
print @sql_insert

		SET @dbid=@dbid+1;

END


							
			