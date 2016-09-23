

create table #databases(dbid int identity(1,1)
						,dbname varchar(50))

insert into #databases(dbname)
SELECT 
'MAPCSS'
union select 'MAPTDH'
union select 'MAPLH'
union select 'MAPLMI'
union select 'MapABI'
union select 'MAPIFI'
union select 'MAPHOA'
union select 'MAPCSSMT'
union select 'MAPADCT'
union select 'AAIMerge'
union select 'MAPACC'
union select 'MAPGOL'
union select 'MAPOWAS'
union select 'MAPSCL'
union select 'MAPCCN'
union select 'MAPLSSMT'
union select 'MAPECKERD'
union select 'MAPAT'
union select 'MAPCCK'
union select 'MAPCCD'
union select 'MAPebg'
union select 'MAPAOI'
union select 'CFSMerge'
union select 'MapAuA'
union select 'MAPAAU'
union select 'MAPCH'
union select 'MAPHOAA'
union select 'MAPMAPSW'
union select 'MapTRH'
union select 'MapAAdv'
union select 'MapDRC'
union select 'MapAgape'
union select 'MAPCOW'
union select 'MAPSDC'
union select 'MAPBright'
union select 'MAPHope'
union select 'MAPCCDIOBR'
union select 'MAPDLNT'
union select 'MAPFCA'
union select 'MAPBCFS'
union select 'MAPFBA'
union select 'MAPHaven'
union select 'MAPACT'
union select 'MAPPAA'
union select 'MAPHATW'
union select 'MAPCPMQ'
union select 'MAPCPMA'
union select 'MAPABSC'
union select 'MAPBSA'
union select 'MAPFCS'
union select 'MAPHHA'
union select 'MAPNLA'

create table ##result(FamilyName varchar(500)
		,Role varchar(500)
		,RegistrationDate datetime
		,UserName varchar(500)
		,LastLogin datetime
		,CaseNumber varchar(500)
		,GroupNames varchar(max)
		,AssignedCWs varchar(max)
		,AgencyName varchar(200))

DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @runsql nvarchar(max);
DECLARE @reccount int
DECLARE @ParmDefinition nvarchar(50)

SET @dbid = 1;
SELECT @dbcount=COUNT(dbid)
FROM #databases;

WHILE @dbid <= @dbcount
BEGIN
		SELECT @dbname=dbname 
		FROM #databases 
		WHERE dbid=@dbid ;
		set @runsql='insert into ##result(FamilyName
		,Role
		,RegistrationDate
		,UserName
		,LastLogin
		,CaseNumber
		,AgencyName)
					 select replace(r.displayname,''amp;'','''')
					 ,rt.RelationshipTypeText
					 ,ua.datejoined
					 ,ua.username
					 ,ua.last_login
					 ,r.rellabel
					 ,'''+@dbname+''' as dbname
					 from '+@dbname+'.dbo.rel_relationship r 
					 inner join '+@dbname+'.dbo.rel_lkp_relationshiptype rt
					 on r.RelationshipTypeId=rt.RelationshipTypeId
					 inner join '+@dbname+'.dbo.rel_lkp_relationshipsubtype rs
					 on rt.RelationshipSubTypeId=rs.RelationshipSubTypeId
					 inner join '+@dbname+'.dbo.user_accounts ua
					 on r.user_id=ua.user_id
					 where rs.RelationshipsubTypeText=''Adoption''
					 and Rel_SubType_isProgram=1
					 and cast(ua.datejoined as date)>''2016-01-01'''
		print(@runsql)
		exec(@runsql)

		SET @dbid=@dbid+1;
END

DROP TABLE #databases
