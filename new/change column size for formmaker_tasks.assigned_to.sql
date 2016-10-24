

declare @name varchar(100)
,@runsql varchar(max)

select @name=name from sys.objects where type='D' and object_id=
(SELECT default_object_id from sys.columns where name='assigned_to' 
and column_id=(select ORDINAL_POSITION 
from information_schema.columns 
where TABLE_NAME='formmaker_tasks'
and column_name='assigned_to' ))

set @runsql='alter table formmaker_tasks
drop constraint '+@name
print @runsql
exec(@runsql)

alter table formmaker_tasks
alter column assigned_to varchar(max)

ALTER TABLE formmaker_tasks
ADD CONSTRAINT DF_formmaker_tasks_assigned_to
DEFAULT 'AP1'
FOR assigned_to;

select @name=name from sys.objects where type='D' and object_id=
(SELECT default_object_id from sys.columns where name='assigned_to' 
and column_id=(select ORDINAL_POSITION 
from information_schema.columns 
where TABLE_NAME='temp_formmaker_tasks'
and column_name='assigned_to' ))

set @runsql='alter table temp_formmaker_tasks
drop constraint '+@name
print @runsql
exec(@runsql)

alter table temp_formmaker_tasks
alter column assigned_to varchar(max)

ALTER TABLE temp_formmaker_tasks
ADD CONSTRAINT DF_temp_formmaker_tasks_assigned_to
DEFAULT 'AP1'
FOR assigned_to;