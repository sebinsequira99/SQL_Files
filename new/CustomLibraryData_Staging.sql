

drop table CustomLibraryData_Staging

select 
user_id
,contactid
,connectionid
,connid
,scope
,program_id
,data_xml
,created_by
,created_at
,updated_by
,updated_at into #loop 
from library_customdata 

alter table #loop
add row_id int identity(1,1)

declare @xmldata_input xml
,@start_id int=1
,@end_id int
,@contactid int

select @end_id=max(row_id) from #loop

create table #xmldata_input(id int identity(1,1)
,contactid int
,InputFieldname nvarchar(max)
,InputFieldvalue nvarchar(max))

while(@start_id<=@end_id)
begin
select @xmldata_input=data_xml from #loop where row_id=@start_id
select @contactid=contactid from #loop where row_id=@start_id

 ;
 WITH xmldata_input
 AS 
 (
 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
 ,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
 FROM @xmldata_input.nodes('//.') as [table]([column])
 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
 )

insert into #xmldata_input(contactid 
,InputFieldname
,InputFieldvalue) 
select @contactid,InputFieldname,InputFieldvalue FROM xmldata_input

set @start_id=@start_id+1

end

select * into CustomLibraryData_Staging from #xmldata_input

drop table #xmldata_input,#loop