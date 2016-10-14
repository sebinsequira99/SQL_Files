

ALTER PROC usp_Load_RptCIListDataAP_BP_Tables
AS
BEGIN

--RptCIListDataAP

truncate table RptCIListDataAP

insert into RptCIListDataAP(contactid)
select distinct abs(connid) from form_data

select column_name into #columns 
from information_schema.columns 
where table_name='RptCIListDataAP'
and column_name<>'contactid'

alter table #columns
add id int identity(1,1)

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

--RptCIListDataBP

truncate table RptCIListDataBP

insert into RptCIListDataBP(contactid)
select distinct abs(connid) from form_data

select column_name into #columns2 
from information_schema.columns 
where table_name='RptCIListDataBP'
and column_name<>'contactid'

alter table #columns2
add id int identity(1,1)

set @start_id=1
select @end_id=max(id) from #columns2

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns2 where id=@start_id
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

--RptCIListDataAP_2

truncate table RptCIListDataAP_2

insert into RptCIListDataAP_2(contactid)
select distinct abs(connid) from form_data

select column_name into #columns3 
from information_schema.columns 
where table_name='RptCIListDataAP_2'
and column_name<>'contactid'

alter table #columns3
add id int identity(1,1)

set @start_id=1
select @end_id=max(id) from #columns3

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns3 where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataAP_2 r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

--RptCIListDataAP_3

truncate table RptCIListDataAP_3

insert into RptCIListDataAP_3(contactid)
select distinct abs(connid) from form_data

select column_name into #columns4 
from information_schema.columns 
where table_name='RptCIListDataAP_3'
and column_name<>'contactid'

alter table #columns4
add id int identity(1,1)

set @start_id=1
select @end_id=max(id) from #columns4

while(@start_id<=@end_id)
begin
select @column_name=column_name from #columns4 where id=@start_id
set @runsql='update r
set r.['+@column_name+']=c.inputfieldvalue
from RptCIListDataAP_3 r
inner join CustomLibraryData_Staging c
on r.contactid=c.contactid
and c.InputFieldname='''+@column_name+''''
--print @runsql
exec(@runsql)
set @start_id=@start_id+1
end

drop table #columns,#columns2,#columns3,#columns4

END