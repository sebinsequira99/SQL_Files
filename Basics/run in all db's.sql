

create table #databases(dbid int identity(1,1)
						,dbname varchar(50))

insert into #databases(dbname)
SELECT MAPDBName
FROM IRRISCENTRAL.DBO.lutprimaryagency where agencyflag='R'

DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @runsql nvarchar(max);
DECLARE @reccount int
DECLARE @ParmDefinition nvarchar(50)

SET @dbid = 1;
SELECT @dbcount=COUNT(dbid)
FROM #databases;

WHILE  @dbid <= @dbcount
BEGIN
		SELECT @dbname=dbname 
		FROM #databases 
		WHERE dbid=@dbid ;

		set @runsql='select @reccount=count(*)
					 from '+@dbname+'.dbo.formmaker_tasks ft 
					 join '+@dbname+'.dbo.task_upload tu
					 on ft.phase_id=tu.phase_id and ft.stage_id = tu.stage_id and ft.task_id = tu.task_id
					 join '+@dbname+'.dbo.upload u
					 on ft.task_id=u.upload_task and ft.stage_id=u.upload_stage and ft.phase_id=u.upload_phase
					 where tu.upload_method not in (''u'')'
		Print @runsql
		SET @ParmDefinition = '@reccount int OUTPUT'   

		EXEC sp_executesql @runsql,@ParmDefinition,@reccount = @reccount OUTPUT;
		Print 	@reccount
		set @runsql='insert into ##uploaddata(task_id,stage_id,phase_id,task
		,link,file_up_id,upload_method,upload_id,dateposted,dbname,reccount
		)
					 select top(1) ft.task_id
						   ,ft.stage_id
						   ,ft.phase_id
						   ,ft.task
						   ,ft.link 
						   ,tu.file_up_id
						   ,tu.upload_method
						   ,u.upload_id
						   ,u.dateposted
						   ,'''+@dbname+''' as dbname
						   ,'+cast(@reccount as varchar(10))+'
					 from '+@dbname+'.dbo.formmaker_tasks ft 
					 join '+@dbname+'.dbo.task_upload tu
					 on ft.phase_id=tu.phase_id and ft.stage_id = tu.stage_id and ft.task_id = tu.task_id
					 join '+@dbname+'.dbo.upload u
					 on ft.task_id=u.upload_task and ft.stage_id=u.upload_stage and ft.phase_id=u.upload_phase
					 where tu.upload_method not in (''u'')
					 order by u.dateposted desc'
		print(@runsql)
		--exec(@runsql)

		SET @dbid=@dbid+1;
END

DROP TABLE #databases





					 		
