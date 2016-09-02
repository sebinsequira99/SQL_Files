

mapform

drop table #fieldoptions

create table #fieldoptions(
 fieldid int 
,fieldname nvarchar(max)
,options nvarchar(max))


declare @s int
       ,@e int

select @s=min(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id
select @e=max(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id


while(@s<=@e)
begin

insert into #fieldoptions(fieldid,fieldname,options)

SELECT DISTINCT ff.field_id
			   ,iif(ff.label is null or cast(ff.label as nvarchar(max))=''
				   ,cast(ff.caption as nvarchar(max))
				   ,cast(ff.label as nvarchar(max)))
	           ,STUFF((SELECT distinct ',' + fo.optionname
	                   from mapat.dbo.formmaker_fields ff 
	                   left join mapat.dbo.formmaker_fieldoptions fo
	                   on ff.field_id=fo.field_id
	                   where ff.page_id=@page_id
	                   and ff.field_id=@s
	                   FOR XML PATH('')
	                   ,TYPE).value('.', 'NVARCHAR(MAX)')
	                   ,1,1,'') 

from mapat.dbo.formmaker_fields ff 
left join mapat.dbo.formmaker_fieldoptions fo
on ff.field_id=fo.field_id
where ff.page_id =@page_id
and ff.field_id=@s

select @s=min(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id and field_id>@s

end
