
select value into #lib_fields from udf_Split_into_rows('ap1firstname,ap1lastname,email1,ap1cellph,email2');

SELECT * into #formmaker_printform_mapping
FROM formmaker_printform_mapping WHERE print_id=1588 
and template_fields in (select value from #lib_fields)

update #formmaker_printform_mapping
set form_fields=replace((replace(form_fields,'[[library.','')),']]','')

drop table #mapping

select 
 f.temp_map_id
,f.print_id
,f.form_fields
,f.template_fields 
,f.field_label
,f.sequence_number
,f.form_name 
,fts.id as qn_id
,fts.printId
,fts.template_fields as template_fields_2
,fts.form_fields as form_fields_2
,fts.question_id
,fts.answer
,ft.id
,ft.component_name
,ft.field_name
,ft.question
,ft.question_type
,ft.que_order
into #mapping
from #formmaker_printform_mapping f
left join forms_template_mapping_questions_save fts
on f.template_fields=fts.template_fields
left join forms_template_mapping_questions ft
on fts.question_id=ft.id

alter table #mapping
add fieldvalue varchar(max)



--SELECT value into #lib_fields from udf_Split_into_rows(@field_list);

--SELECT * into #formmaker_printform_mapping
--FROM formmaker_printform_mapping WHERE print_id=@print_id 
--and template_fields in (select value from #lib_fields)

--update #formmaker_printform_mapping
--set form_fields=replace((replace(form_fields,'[[library.','')),']]','')

--select * into mapping
--from #formmaker_printform_mapping f
--left join forms_template_mapping_questions_save fts
--on f.template_fields=fts.template_fields
--left join forms_template_mapping_questions ft
--on fts.question_id=ft.id

--update m
--set m.fieldvalue=case 
--				 when m.form_fields='AP1BirthCity'
--				   or m.form_fields='AP1BirthCountry'
--				   or m.form_fields='AP1BirthName'
--				   or m.form_fields='AP1BirthState'
--				   or m.form_fields='AP1DOB'
--				   or m.form_fields='AP1Fname'
--				   or m.form_fields='AP1Gender'
--				   or m.form_fields='AP1Lname'
--				   or m.form_fields='AP1MName'
--				   or m.form_fields='AP1Nickname'
--				   or m.form_fields='AP1SSN'

--				then 

--				 when m.form_fields='AP1Add1'
--				   or m.form_fields='AP1Add2'
--				   or m.form_fields='AP1City'
--				   or m.form_fields='AP1State'
--				   or m.form_fields='AP1Zip'
--				   or m.form_fields='AP1Country'
--				   or m.form_fields='AP1County'

--				 then 
--					   from contactaddress
--					   where contactid=88768
--					   and MailingAddress=(select answer from #mapping 
--										   where component_name='address' and field_name='primary')
--					   and AddLeaveDate=(select answer from #mapping 
--										 where component_name='address' and field_name='end_date')
--					   and AddStartDate=(select answer from #mapping 
--										 where component_name='address' and field_name='start_date')
--					   and AddressTypeId=(select answer from #mapping 
--										  where component_name='address' and field_name='type'))

--				 when m.form_fields='AP1CellPhone'

--				 then (select PhoneNumber
--					   from contactphone
--					   where contactid=88768
--					   and PrimaryPhone=(select answer from #mapping 
--										   where component_name='phone' and field_name='primary')
--					   and PhoneTypeID=(select answer from #mapping 
--										 where component_name='phone' and field_name='type'))

--				 when m.form_fields='AP1Email'

--				 then (select ContactEmail
--					   from contactemail
--					   where contactid=88768
--					   and PrimaryEmail=(select answer from #mapping 
--										   where component_name='email' and field_name='primary')
--					   and EmailTypeID=(select answer from #mapping 
--										 where component_name='email' and field_name='type'))

--				 end
--				 from #mapping