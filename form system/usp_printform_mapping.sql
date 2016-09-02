


exec usp_printform_mapping @user_id,1588,'ap1fname','ap1firstname'
exec usp_printform_mapping @user_id,1588,'ap1lname','ap1lastname'
exec usp_printform_mapping @user_id,1588,'ap1email','email1'
exec usp_printform_mapping @user_id,1588,'ap1email','email2'
exec usp_printform_mapping @user_id,1588,'ap1cellphone','ap1cellph'

exec usp_printform_mapping 1588,'ap1fname','ap1firstname'

exec usp_printform_mapping @user_id,@print_id,@formfield,@templatefield

--contactemail where contactid=88768
--contact where contactid=88768
--contactphone where contactid=88768

--user_accounts where connid=-88768

--update contactemail
--set primaryemail=0
--where contactemailid=44847

--update forms_template_mapping_questions_save
--set answer=1
--where id=7
--and printId = 1588

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_printform_mapping' AND type='p')
DROP PROCEDURE usp_printform_mapping;
GO

CREATE PROC usp_printform_mapping 
 @user_id int  
,@print_id int 
,@formfield varchar(200)   
,@templatefield varchar(200)  
 
AS
BEGIN

declare @column_name varchar(100)	 	  
	   ,@runsql varchar(max)
	   ,@contactid int 

select @contactid=abs(connid) from user_accounts where user_id=@user_id

SELECT * into #formmaker_printform_mapping
FROM formmaker_printform_mapping WHERE print_id=@print_id 
and template_fields=@templatefield

update #formmaker_printform_mapping
set form_fields=replace((replace(form_fields,'[[library.','')),']]','')

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

--select * from #mapping

if (@formfield='AP1BirthCity'
 or @formfield='AP1BirthCountry'
 or @formfield='AP1BirthName'
 or @formfield='AP1BirthState'
 or @formfield='AP1DOB'
 or @formfield='AP1Fname'
 or @formfield='AP1Gender'
 or @formfield='AP1Lname'
 or @formfield='AP1MName'
 or @formfield='AP1Nickname'
 or @formfield='AP1SSN')

begin

set @column_name=replace
				(replace
				(replace
				(replace
				(replace(@formfield,'AP1','')
					    ,'DOB','BirthDate')
					    ,'BirthCity','PlaceOfBirthCity')
					    ,'BirthState','PlaceOfBirthStateId')
					    ,'BirthCountry','PlaceOfBirthCountryId')

set @runsql='select '+ @column_name +
						' from contact
						where contactid='+cast(@contactid as varchar(20))
end

else if (@formfield='AP1Add1'
	  or @formfield='AP1Add2'
	  or @formfield='AP1City'
	  or @formfield='AP1State'
	  or @formfield='AP1Zip'
	  or @formfield='AP1Country'
	  or @formfield='AP1County')

begin

set @column_name=replace
				(replace
				(replace
				(replace
				(replace(@formfield,'AP1Add','Address')
								   ,'AP1state','stateid')
								   ,'AP1county','countyid')
								   ,'AP1country','countryid')
								   ,'AP1zip','zip')

set @runsql='select '+ @column_name +
					   ' from contactaddress
					   where contactid='+cast(@contactid as varchar(20))+' 
					   and MailingAddress=(select answer from #mapping 
										   where component_name=''address'' and field_name=''primary'')
					   and AddLeaveDate>=(select answer from #mapping 
										 where component_name=''address'' and field_name=''end_date'')
					   and AddStartDate<=(select answer from #mapping 
										 where component_name=''address'' and field_name=''start_date'')
					   and AddressTypeId=(select answer from #mapping 
										  where component_name=''address'' and field_name=''type''))'

end

if (@formfield='AP1CellPhone')

begin
set @runsql='select PhoneNumber
from contactphone
where contactid='+cast(@contactid as varchar(20))+' 
and PrimaryPhone=(select answer from #mapping 
				  where component_name=''phone'' and field_name=''primary'')

and PhoneTypeID=(select answer from #mapping 
				 where component_name=''phone'' and field_name=''type'')'

end

if (@formfield='AP1Email')

begin

set @runsql='select ContactEmail
from contactemail
where contactid='+cast(@contactid as varchar(20))+' 
and PrimaryEmail=(select answer from #mapping 
				  where component_name=''email'' and field_name=''primary'')
and EmailTypeID=(select answer from #mapping 
				 where component_name=''email'' and field_name=''type'')'
end

create table #result(fieldname varchar(200)
					,fieldvalue varchar(max))
print @runsql
insert into #result(fieldvalue)
exec(@runsql)

update #result
set fieldname=(select distinct form_fields from #mapping)

select * from #result

drop table #result
drop table #mapping
drop table #formmaker_printform_mapping

END