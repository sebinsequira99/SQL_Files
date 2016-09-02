
use rolesdev

ALTER PROC usp_printform_mapping
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
 or @formfield='AP1SSN'
 or @formfield='AP2BirthCity'
 or @formfield='AP2BirthCountry'
 or @formfield='AP2BirthName'
 or @formfield='AP2BirthState'
 or @formfield='AP2DOB'
 or @formfield='AP2Fname'
 or @formfield='AP2Gender'
 or @formfield='AP2Lname'
 or @formfield='AP2MName'
 or @formfield='AP2Nickname'
 or @formfield='AP2SSN')

begin

set @column_name=replace
				(replace
				(replace
				(replace
				(replace
				(replace(@formfield,'AP1','')
					    ,'DOB','BirthDate')
					    ,'BirthCity','PlaceOfBirthCity')
					    ,'BirthState','PlaceOfBirthStateId')
					    ,'BirthCountry','PlaceOfBirthCountryId')
						,'AP2','')

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


set @runsql=';with row_index as 
			 (select *,row_number()over(partition by AddressTypeId,mailingaddress order by addressid) 
			  as row_num from contactaddress
			  where contactid='+@contactid+' 
			  and MailingAddress=(select answer from #mapping 
			  					  where component_name=''address'' and field_name=''primary'')
			  and AddLeaveDate>=(select answer from #mapping 
			  					 where component_name=''address'' and field_name=''end_date'')
			  and AddStartDate<=(select answer from #mapping 
			  					 where component_name=''address'' and field_name=''start_date'')
			  and AddressTypeId=(select answer from #mapping 
	 							 where component_name=''address'' and field_name=''type''))

			  select '+@column_name+' from row_index 
			  where row_num=(select answer from #mapping 
			  			     where component_name=''address'' and field_name=''index'')'

end

if (@formfield='AP1CellPhone' or @formfield='AP2CellPhone')

begin

set @runsql=';with row_index as 
			 (select *,row_number()over(partition by PrimaryPhone,PhoneTypeID order by ContactPhoneID) 
			  as row_num from contactphone
where contactid='+cast(@contactid as varchar(20))+' 
and PrimaryPhone=(select answer from #mapping 
				  where component_name=''phone'' and field_name=''primary'')
and PhoneTypeID=(select answer from #mapping 
				 where component_name=''phone'' and field_name=''type''))

select PhoneNumber from row_index 
where row_num=(select answer from #mapping 
where component_name=''phone'' and field_name=''index'')'

end

if (@formfield='AP1Email' or @formfield='AP2Email')

begin

set @runsql=';with row_index as 
			 (select *,row_number()over(partition by PrimaryEmail,EmailTypeID order by ContactEmailID) 
			  as row_num from contactemail
where contactid='+cast(@contactid as varchar(20))+' 
and PrimaryEmail=(select answer from #mapping 
				  where component_name=''email'' and field_name=''primary'')
and EmailTypeID=(select answer from #mapping 
				 where component_name=''email'' and field_name=''type''))

select ContactEmail from row_index 
where row_num=(select answer from #mapping 
where component_name=''email'' and field_name=''index'')'

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


