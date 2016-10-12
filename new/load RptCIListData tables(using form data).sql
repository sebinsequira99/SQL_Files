

truncate table RptCIListDataAP_test

insert into RptCIListDataAP_test(contactid)
select distinct abs(connid) from form_data

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataAP_test'
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
from RptCIListDataAP_test r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns

truncate table RptCIListDataBP_test

insert into RptCIListDataBP_test(contactid)
select distinct abs(connid) from form_data

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataBP_test'
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
from RptCIListDataBP_test r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns
