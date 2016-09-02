

mapat..form_data where form_id=2455 and connectionid in(408288
,384712
,365992
,402104
,337666
,366090
,362631
,247528
,349593
,351471
,366033
,377172
,396536
,401490)

drop table #loop

select id,data_xml into #loop 
from mapat..library_customdata 
where connectionid in(408288
,384712
,365992
,402104
,337666
,366090
,362631
,247528
,349593
,351471
,366033
,377172
,396536
,401490)

declare @start_id int
,@end_id int
,@stmt nvarchar(max)
,@data nvarchar(max)
,@id int

select @start_id=min(id) from #loop
select @end_id=max(id) from #loop

while(@start_id<=@end_id)
begin
select @data=replace(cast(data_xml as nvarchar(max)),'''','''''') from #loop where id=@start_id
set @stmt='update mapat..form_data set data_xml='''+@data+''' where id='+cast(@start_id as varchar(10))
select @start_id=min(id) from #loop where id>@start_id
select @stmt
end

