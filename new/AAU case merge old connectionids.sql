


declare @runsql nvarchar(max)
,@start_id int=1
,@end_id int
,@start_row int=1
,@end_row int
,@table_name varchar(max)
,@connectionid_old int
,@connectionid_new int

select @end_id= max(id) from temp_tablelist
select @end_row= max(rnk) from temp_userlists
--print @end_id
--print @end_row

while (@start_id<=@end_id)
begin
	set @start_row=1
	select @table_name=table_name from temp_tablelist where id=@start_id

	--print @table_name

	while (@start_row<=@end_row)
	begin
 
		select @connectionid_old=connectionid from temp_userlists where rnk=@start_row and row_no=1
		select @connectionid_new=connectionid from temp_userlists where rnk=@start_row and row_no=2

		--print @start_row
		--print @connectionid_old
		--print @connectionid_new

		set @runsql='if exists (select 1 from '+@table_name+' where connectionid='
		+cast(@connectionid_old as varchar(10))+')
		begin
		print '''+@table_name+' '+cast(@connectionid_old as varchar(10))+''' end'
		--print @runsql
		exec(@runsql)
		set @start_row=@start_row+1
	end
	set @start_id=@start_id+1
end












