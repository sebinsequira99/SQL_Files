
use mapform

--************************exec after insert******************************************************************

--update forms_test
--set definition_xml=replace(cast(definition_xml as nvarchar(max)),'&amp;#039;','&#039;')

--update forms_test
--set definition_xml=replace(cast(definition_xml as nvarchar(max)),'&amp;','&')
--where id not in(select form_id from mapat.dbo.formmaker_properties where formtext like '%&%')

--***********************************************************************************************************

--TRUNCATE TABLE forms_test

CREATE TABLE #forms(id int identity(1,1)
				   ,form_id int)

INSERT INTO #forms(form_id)
SELECT form_id from mapat.dbo.formmaker_properties
--where form_id
--in(
--1497
--,
--2051
--,2455
--,
--2546
--)

DECLARE @form_id int
       ,@start_row int=1
       ,@end_row int

SELECT @end_row= count(*) FROM #forms

WHILE(@start_row<=@end_row)

BEGIN

SELECT @form_id=form_id FROM #forms WHERE id=@start_row

DECLARE @form_settings_xml xml

SET @form_settings_xml=(SELECT formname as form_name
							  ,case when formtype=1 then 'N' 
							        when formtype=2 then 'P' 
							   end as [type]
							  ,formlabel as form_label
							  ,formtext as [description]
							  ,case when adminalert='Y' then 1 else 0 end as send_admin_mail
							  ,case when autorespond='Y' then 1 else 0 end as send_auto_respond
							  ,'showmsg' as on_submit
							  ,submissionmsg as on_submit_msg
							  ,'a4' as print_format
							  ,1 as use_pdf_mapping
							  ,0 as has_header
							  ,'' as page_header
					    FROM mapat.dbo.formmaker_properties
					    WHERE form_id=@form_id
					    FOR XML PATH('form_settings'),TYPE)

CREATE TABLE #pages(id int identity(1,1)
				   ,page_id int)

INSERT INTO #pages(page_id)
SELECT page_id FROM mapat.dbo.formmaker_pages WHERE form_id=@form_id
order by [grouping]

DECLARE @page_id int
       ,@start_id int=1
       ,@end_id int
       ,@page_xml nvarchar(max)=''
	   ,@page_label varchar(max)
	   ,@field_xml nvarchar(max)=''

SELECT @end_id= count(*) FROM #pages

WHILE(@start_id<=@end_id)

BEGIN

SELECT @page_id=page_id FROM #pages WHERE id=@start_id

SELECT @page_label=pagename FROM mapat.dbo.formmaker_pages WHERE page_id=@page_id

create table #fieldoptions
(
 fieldid int 
,fieldname nvarchar(max)
,options nvarchar(max)
,asdefault nvarchar(200)
)

declare @s int
       ,@e int

select @s=min(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id
select @e=max(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id

while(@s<=@e)
begin

insert into #fieldoptions(fieldid,fieldname,options
,asdefault
)

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
			   ,iif(op.asdefault='Y' and op.optionname<>'Please Select',op.optionname,'')

from mapat.dbo.formmaker_fields ff 
left join mapat.dbo.formmaker_fieldoptions fo
on ff.field_id=fo.field_id
left join mapat.dbo.formmaker_fieldoptions op
on ff.field_id=op.field_id and op.asdefault='Y'
where ff.page_id =@page_id
and ff.field_id=@s
and ff.library_field_name not in(select fieldname from mapat.dbo.mapfieldcatbase)

select @s=min(field_id) from mapat.dbo.formmaker_fields where page_id=@page_id and field_id>@s

end

SET @field_xml=
cast((
SELECT CASE 
	   when ff.type='T' and ff.library_field_name not in ('agencysignature','ap1signature','ap2signature','cwsignature')
	   then 'text' 
	   when ff.type='R'
	   then 'radio'
	   when ff.type='D'
	   then 'select'
	   when ff.type='E'
	   then 'date'
	   when ff.type='B'
	   then 'checkbox'
	   when ff.type='L'
	   then 'header'
	   when ff.type='M'
	   then 'select'
	   when ff.type='A'
	   then 'textarea'
	   when ff.type='G'
	   then 'greybar'
	   when ff.type='F'
	   then 'file'
	   when ff.library_field_name in ('agencysignature','ap1signature','ap2signature','cwsignature')
	   then 'signature'
	   else null
	   end
	   as [type]
	  ,case when ff.type<>'L'
	   then 
	   iif((ff.label is null or cast(ff.label as nvarchar(max))='')
		   ,replace(cast(ff.caption as nvarchar(max)),'&amp;','and')
		   ,replace(cast(ff.label as nvarchar(max)),'&amp;','and'))
	   else 'Header '+cast(ff.field_id as varchar(10))
	   end
	   as label
	  ,CASE 
	   when ff.library_field_name='0'
	   then ff.name
	   else ff.library_field_name
	   end
	   as name
	  ,CASE 
	   when ff.type='T' and ff.library_field_name not in ('agencysignature','ap1signature','ap2signature','cwsignature')
	   then 'Enter your text!'
	   when ff.type='A'
	   then 'Enter your details'
	   when ff.type in ('D','M')
	   then '--Select--'
	   else null
	   end
	   as placeholder
	  ,CASE 
	   when isnull(ff.tips,'')<>''
	   then ff.tips
	   else null
	   end
	   as help_text
	  ,CASE 
	   when isnull(fo.asdefault,'')<>''
	   then fo.asdefault
	   else null
	   end
	   as [default]
	  --,null as [default]
      ,CASE 
	   when ff.type in('R','B')
	   then 0
	   else null
	   end
	   as inline
	  ,CASE 
	   when ff.type='E'
	   then 'dd-MMMM-yyyy'
	   else null
	   end
	   as [format]
	  ,iif(ff.required='y'
	      ,(select 1 as required
					   ,0 as minlength
					   ,ff.text_size as maxlength	
			for xml path(''), type, root('validate'))
		  ,(select 0 as required
				  ,'undefined' as minlength
				  ,'undefined' as maxlength		
			for xml path(''), type, root('validate')))
	  ,case 
	   when f.displaycolumns='S'
	   then 12 
	   when f.displaycolumns='D' and ff.type not in('L','G')
	   then 6
	   else 12
	   end
	   as columnsize
	  ,case
	   when ff.type='G'
	   then 10 
	   end as height
	  ,case
	   when ff.type='G'
	   then '#f5f5f5'
	   end as bg
	  ,case
	   when ff.type='L'
	   then 16
	   end as size
	  ,case
	   when ff.type='L'
	   then ''
	   end as color
	  ,case
	   when ff.type='L'
	   then replace(replace(cast(ff.label as nvarchar(max)),'&amp;amp;','&amp;'),'&amp;nbsp;',' ')
	   end as html_code
	  ,iif(ff.type='F'
	      ,(select 1 as addRemoveLinks
				  ,'/api/v1/file' as url
				  ,10 as maxFilesize
				  ,1024 as filesizeBase
				  ,'' as acceptedFiles
				  ,'Drop files here or click to upload.' as dictDefaultMessage
				  ,'Your browser does not support drag and drop file uploads.' as dictFallbackMessage
			for xml path(''),type,root('dropzoneConfig'))
		  ,null)
	  ,iif(ff.type in('D','R','B','M')
	      ,cast(replace(cast((select value as label,value as value 
		   from udf_Split_into_rows(fo.options)
		   where value<>'Please Select'
		   for xml path('item'),type,root('items')) as nvarchar(max)),'&amp;','and') as xml)
		  ,null)
	  ,CASE 
	   when ff.type='M'
	   then '1'
	   else null
	   end
	   as multi
	  ,CASE 
	   when ff.library_field_name in ('agencysignature','ap1signature','ap2signature','cwsignature')
	   then 'left'
	   else null
	   end
	   as position
	  ,CASE 
	   when ff.library_field_name<>'0' and ld.lkp is not null
	   then ld.lkp
	   else null
	   end
	   as lkp
	  ,CASE 
	   when ff.library_field_name<>'0' and ld.lkp_value is not null
	   then ld.lkp_value
	   else null
	   end
	   as lkp_value
	  ,CASE 
	   when ff.library_field_name<>'0' and ld.lkp_text is not null 
	   then ld.lkp_text
	   else null
	   end
	   as lkp_text
	  ,CASE 
	   when ff.library_field_name<>'0' and ld.lkp_where is not null
	   then ld.lkp_where
	   else null
	   end
	   as lkp_where 
	  --,CASE 
	  -- when ff.type='E'
	  -- then 'dd-MMMM-yyyy'
	  -- else null
	  -- end
	  -- as opened
	  ,case when l.is_sys_lib=1
	   then 1 
	   when l.is_sys_lib=0
	   then 0 
	   else null
	   end as is_sys_lib
	  ,case when l.is_sys_lib=1
	   then 0 
	   when l.is_sys_lib=0
	   then 1 
	   else null
	   end as is_cus_lib
	  ,case when l.library_name like '%address%' then 1
	   when l.library_name like '%city%' then 1
	   when l.library_name like '%state%' then 1
	   when l.library_name like '%county%' then 1
	   when l.library_name like '%country%' then 1
	   when l.library_name like '%zip%' then 1
	   when l.library_name like '%email%' then 1
	   when l.library_name like '%phone%' then 1
	   when l.id is not null and l.library_name not like('%address%') then 0
	   when l.id is not null and l.library_name not like '%city%' then 0
	   when l.id is not null and l.library_name not like '%state%' then 0
	   when l.id is not null and l.library_name not like '%county%' then 0
	   when l.id is not null and l.library_name not like '%country%' then 0
	   when l.id is not null and l.library_name not like '%zip%' then 0
	   when l.id is not null and l.library_name not like '%email%' then 0
	   when l.id is not null and l.library_name not like '%phone%' then 0
	   else null
	   end as is_multi_component
	  ,case when l.library_name like '%address%' then 'address'
	   when l.library_name like '%city%' then 'address'
	   when l.library_name like '%state%' then 'address'
	   when l.library_name like '%county%' then 'address'
	   when l.library_name like '%country%' then 'address'
	   when l.library_name like '%zip%' then 'address'
	   when l.library_name like '%email%' then 'email'
	   when l.library_name like '%phone%' then 'phone'
	   when l.id is not null and l.library_name not like('%address%') then ''
	   when l.id is not null and l.library_name not like '%city%' then ''
	   when l.id is not null and l.library_name not like '%state%' then ''
	   when l.id is not null and l.library_name not like '%county%' then ''
	   when l.id is not null and l.library_name not like '%country%' then ''
	   when l.id is not null and l.library_name not like '%zip%' then ''
	   when l.id is not null and l.library_name not like '%email%' then ''
	   when l.id is not null and l.library_name not like '%phone%' then ''
	   else null
	   end as component
	  ,case when l.id is not null
	   then isnull(l.[scope_id],'')
	   else null 
	   end as [scope_id]
	  ,case when l.id is not null
	   then isnull(l.program_id,'')
	   else null 
	   end as program_id

from mapat.dbo.formmaker_properties f
join mapat.dbo.formmaker_pages fp
on f.form_id=fp.form_id
join mapat.dbo.formmaker_fields ff
on fp.page_id=ff.page_id
left join #fieldoptions fo
on ff.field_id=fo.fieldid
left join library_master l
on ff.library_field_name=l.library_name
left join lkpdetails ld
on ff.library_field_name=ld.fieldname
where f.form_id=@form_id and fp.page_id=@page_id
and ff.type in('T','R','D','E','B','M','L','G','A','F')
order by ff.[grouping]
for xml path('field'), type
)as nvarchar(max))

set @page_xml=@page_xml+cast(((
select  Cast('<page_name>page_'+cast(@page_id as varchar(20))+'</page_name>
<page_label>'+replace(@page_label,'&amp;','and')+'</page_label>
<active>'+(select case when @start_id=1 then '1' else '0' end)+'</active>' As XML )
,Cast('<fields>' + @field_xml + '</fields>' As XML)
For XML PATH('page'), type))
as nvarchar(max))

--Select @page_xml
drop table #fieldoptions
SET @start_id=@start_id+1

END

DECLARE @page_xml_full xml
SELECT @page_xml_full=cast('<form_json><pages> '+@page_xml+' </pages></form_json>' as xml)

--Select @page_xml_full
--Select @form_settings_xml

DECLARE @form_rules_xml xml
SET @form_rules_xml=cast('<form_rules />' as xml)

DECLARE @xmltojson xml
SET @xmltojson=(select @form_settings_xml,@page_xml_full,@form_rules_xml For XML PATH(''), type)

set identity_insert forms_test on

INSERT INTO forms_test(id
				 ,form_name
				 ,definition_json
				 ,definition_xml
				 ,is_subform
				 ,created_ip
				 ,updated_ip
				 ,created_by
				 ,updated_by
				 ,created_at
				 ,updated_at)

select @form_id
	 , f.formlabel
	 , ''				--, (select dbo.qfn_XmlToJson(@xmltojson))
	 , (Select @form_settings_xml,@page_xml_full,@form_rules_xml For XML PATH(''), type, Root('xml'))
	 , 0
	 , ''
	 , ''
	 , 8125
	 , 8125
	 , getdate()
	 , getdate()
from mapat.dbo.formmaker_properties f
where form_id=@form_id

set identity_insert forms_test off

set @start_row=@start_row+1

DROP TABLE #Pages

END

DROP TABLE #forms


