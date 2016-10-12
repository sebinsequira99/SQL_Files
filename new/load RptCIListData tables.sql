

truncate table RptCIListDataAP

insert into RptCIListDataAP(contactid)
select distinct contactid from library_customdata

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataAP'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

go

declare @start_id int=1
,@end_id int
,@column_name varchar(max)
,@runsql varchar(max) 

select @end_id=max(id) from #columns

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataAP r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns

truncate table RptCIListDataBP

insert into RptCIListDataBP(contactid)
select distinct contactid from library_customdata

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataBP'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

go

declare @start_id int=1
,@end_id int
,@column_name varchar(max)
,@runsql varchar(max) 

select @end_id=max(id) from #columns

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataBP r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns

truncate table RptCIListDataChild

insert into RptCIListDataChild(contactid)
select distinct contactid from library_customdata

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataChild'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

go

declare @start_id int=1
,@end_id int
,@column_name varchar(max)
,@runsql varchar(max) 

select @end_id=max(id) from #columns

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataChild r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns

truncate table RptCIListDataInq


insert into RptCIListDataInq(contactid)
select distinct contactid from library_customdata

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataInq'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

go

declare @start_id int=1
,@end_id int
,@column_name varchar(max)
,@runsql varchar(max) 

select @end_id=max(id) from #columns

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataInq r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns

truncate table RptCIListDataOther

insert into RptCIListDataOther(contactid)
select distinct contactid from library_customdata

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataOther'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

go

declare @start_id int=1
,@end_id int
,@column_name varchar(max)
,@runsql varchar(max) 

select @end_id=max(id) from #columns

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataOther r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns