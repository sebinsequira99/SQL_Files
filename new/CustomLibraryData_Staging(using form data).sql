

drop table CustomLibraryData_Staging

select 
form_id
,user_id
,connid
,connectionid
,data_xml
,data_json
,created_by
,updated_by
,created_at
,updated_at into #loop 
from form_data 
where form_id=2611

alter table #loop
add row_id int identity(1,1)

create table #xmldata_input(id int identity(1,1)
,contactid int
,InputFieldname nvarchar(max)
,InputFieldvalue nvarchar(max))

declare @xmldata_input xml
,@start_id int=1
,@end_id int
,@contactid int

select @end_id=max(row_id) from #loop

while(@start_id<=@end_id)
begin
select @xmldata_input=data_xml from #loop where row_id=@start_id
select @contactid=abs(connid) from #loop where row_id=@start_id

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

update customlibrarydata_staging 
set inputfieldname=replace(inputfieldname,'input_','')
where inputfieldname like 'input_%'

drop table #xmldata_input,#loop


