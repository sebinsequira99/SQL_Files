
use MAPGoL

SELECT * FROM formmaker_properties WHERE formname LIKE'%34_%'

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
DECLARE @sql_insert varchar(500);


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

		set @sql_insert='with form as 
(
SELECT DISTINCT ''formmaker_''+F.Formname as formname,f.form_id FROM Formmaker_Properties F 
INNER JOIN Formmaker_Pages P ON P.Form_id=F.Form_id
INNER JOIN  formmaker_fields FF ON FF.Page_id=P.Page_id
INNER JOIN ' + @dbname + '.dbo.Missinglibraryfields_11_06_15 ms ON MS.field_id = ff.field_id
)

insert into #forms(dbName,formid,formname)
select ''' + @dbname + ''',fs.form_id,fs.formname from form fs';
print @sql_insert

		exec(@sql_insert)

		SET @dbid=@dbid+1;

END

drop table #count
drop table #forms

		create table #count(dbid int identity(1,1)
										,database_name varchar(100)
										,cnt int)

		create table #forms(dbName varchar(100)
							,formid int
							,formname varchar(max))
							
							select * into forms from #forms

select * from rolesdev.dbo.forms where dbname in ('AAIMERGE'
,'CFSMerge'
,'MapAAdv'
,'MAPAAU'
,'MAPABI'
,'MAPABSC'
,'MAPACC'
,'MAPACT'
,'MAPADCT'
,'MapAgape'
,'MAPAoI'
,'MAPAT'
,'MapAuA'
,'MAPBCFS'
,'MAPBH'
,'MAPBright'
,'MAPCCD'
,'MAPCCDIOBR'
,'MAPCCK'
,'MAPCCN'
,'MAPCD03'
,'MAPCH'
,'MAPCOW'
,'MAPCPMQ'
,'MAPCSS'
,'MAPCSSMT'
,'MAPDLNT'
,'MapDRC'
,'MAPebg'
,'MAPEckerd'
,'MAPfac'
,'MAPFBA'
,'MAPFCA'
,'MAPGoL'
,'MAPHATW'
,'MAPHaven'
,'MAPHOA'
,'MAPHOAA'
,'MAPHope'
,'MAPifi'
,'MAPLMI'
,'MAPLSSMT'
,'MAPMAPSW'
,'MAPOWAS'
,'MAPPAA'
,'MAPS'
,'MAPSCL'
,'MAPtdh'
,'MapTRH'
)

