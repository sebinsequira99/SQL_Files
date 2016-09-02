


truncate table library_master

;
with lib as 
(		
	 Select TableName,
					FieldName,
					DisplayName,
					FieldType,
					FieldSize,
					DefltVal,
					Req,
					CASE isnull(lkpTable,'')
						 WHEN '' THEN 0
						 Else 1
					END as is_LkpTable,
					lkptable,
					lkpfield,			
					ReadOnly				
			from MapFieldCatBase

			union

			Select  dbo.udf_CleanString(CT.CIListTemplateName, '') as TableName,
					dbo.udf_CleanString(CILTI.CIListTemplateItemName, '') + '_' + REPLACE(cast(CILTI.CIListTemplateItemId as varchar(4)), '-','_') as FieldName,
					dbo.udf_CleanString(CT.CIListTemplateName, '') + ' - ' + dbo.udf_XMLClean(CILTI.CIListTemplateItemName) as DisplayName,
						CASE CILIT.CIListItemTypeText
						 WHEN 'Number' THEN 'Text'
						 WHEN 'CheckBox' THEN 'CheckBox'
						 WHEN 'Yes/No' THEN 'Text'
						 WHEN 'Text' THEN 'Text'
						 WHEN 'Pull Down' THEN 'Text'
						 WHEN 'Date' THEN 'Datetime'
						 WHEN 'Password' THEN 'Text'
						 WHEN 'Hidden Field' THEN 'RadioButton'
						 WHEN 'Memo' THEN 'Text'
						 WHEN 'GUID Field' THEN 'Text'
						 WHEN 'Lookup Table' THEN 'Multiselect'
					END	as FieldType,
						CASE CILIT.CIListItemTypeText
						 WHEN 'Text' THEN 255
						 WHEN 'Pull Down' THEN 255
						 WHEN 'Lookup Table' THEN 255
						 WHEN 'Password' THEN 255
						 WHEN 'Hidden Field' THEN 255
						 WHEN 'Memo' THEN 2000
						 WHEN 'GUID Field' THEN 255
					END	as FieldSize,
					CILTI.CIListTemplateItemId as DefltVal,
					null as Req,
					CASE CILIT.CIListItemTypeText
						 WHEN 'Pull Down' THEN '1'
						 WHEN 'Yes/No' THEN '1'
						 WHEN 'Lookup Table' THEN '1'
						 WHEN 'Hidden Field' THEN '1'
						Else '0'
					END as is_LkpTable,
					CILTI.CIListTable as lkptable,
					CILTI.CIListTableTextFld as lkpfield,
					'U'	as ReadOnly			
					
			From dbo.CIListTemplate CT
				inner join dbo.CIListTemplateItem CILTI on CT.CIListTemplateId = CILTI.CIListTemplateId
				inner join dbo.CIListItemType CILIT on CILTI.CIListItemTypeId = CILIT.CIListItemTypeId 
			Where isnull(TableName,'') = ''
				and isCase = 0
				
				and CT.CIListTemplateId <> 0
				and CILIT.CIListItemTypeText not in ('Section Header','Table Entry')

		union

			Select 'Medical Info' as TableName,
			'Med_1' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '''') as FieldName,
			'Parent 1 ' + MGST.MedGenSubTypeText as DisplayName,
			'Text'	as FieldType,
			CASE 
				WHEN MGST.IsMedGenDate = '1' THEN 26
				WHEN MGST.IsMedGenNote = '1' THEN 2000
				WHEN MGST.IsMedGenAge = '1' THEN 255
				WHEN MGST.IsMedGenPulldown = '1' THEN 26
				WHEN MGST.IsMedGenDate = '1' THEN 26
			END	as FieldSize,
				MGST.MedGenSubTypeId as DefltVal,
				0 as Req,
			MGST.IsMedGenPulldown as is_LkpTable,
			case IsMedGenPulldown 
			when 1 then 'MedGenPulldown'
			else '' 
			end as LkpTable,
			case IsMedGenPulldown 
			when 1 then 'MedGenPullDownText'
			else '' 
			end as LkpField,
			'U'	as ReadOnly
		From dbo.MedGenSubType MGST
			Where MedGenTypeId = 1

		union

			Select 'Medical Info' as TableName,
			'Med_2' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '''') as FieldName,
			'Parent 2 ' + MGST.MedGenSubTypeText as DisplayName,
			'Text'	as FieldType,
			CASE 
				WHEN MGST.IsMedGenDate = '1' THEN 26
				WHEN MGST.IsMedGenNote = '1' THEN 2000
				WHEN MGST.IsMedGenAge = '1' THEN 255
				WHEN MGST.IsMedGenPulldown = '1' THEN 26
				WHEN MGST.IsMedGenDate = '1' THEN 26
			END	as FieldSize,
				MGST.MedGenSubTypeId as DefltVal,
				0 as Req,
			MGST.IsMedGenPulldown as is_LkpTable,
			case IsMedGenPulldown 
			when 1 then 'MedGenPulldown'
			else '' 
			end as LkpTable,
			case IsMedGenPulldown 
			when 1 then 'MedGenPullDownText'
			else '' 
			end as LkpField,
			'U'	as ReadOnly
		From MedGenSubType MGST
			Where MedGenTypeId = 1
)

select * into #libraryfields from lib

update #libraryfields
set FieldType='Signature'
where DisplayName like '%signature field%'

insert into library_master
(
 library_name
,library_desc
,is_sys_lib
,[scope_id]
,program_id
,created_by
,created_at
,updated_by
,updated_at
,control_type
,data_type
,field_size
,field_json
)

select lf.FieldName
	  ,lf.DisplayName
	  ,case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end
	  ,1
	  ,null
	  ,1
	  ,getdate()
	  ,1
	  ,getdate()
	  ,case 
	   when lf.FieldType='text'								then 'T'
	   when lf.FieldType='date' or lf.FieldType='datetime'	then 'E'
	   when lf.FieldType='CheckBox'							then 'B'
	   end
	  ,''
	  ,lf.FieldSize
	  ,CASE 
	   when lf.FieldType='text' and lf.is_lkptable=0
	   then '{"type":"text","label":"'+(select lf.DisplayName)+'","name":"'+(select lf.FieldName)+'","placeholder":"","default":"","validate":{"require":false,"minlength":0,"maxlength":'+isnull(cast((select lf.FieldSize) as varchar(10)),'''''')+'},"columnsize":12,"is_sys_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end) as varchar(10)))+
	   ',"is_cus_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 0
	   when 'Function'		then 0
	   when 'MAPSystemData' then 0
	   else 1
	   end) as varchar(10)))
	   +',"is_multi_component":'
	   +(select cast((case
	   when lf.DisplayName like '%address%' then 1
	   when lf.DisplayName like '%city%' then 1
	   when lf.DisplayName like '%state%' then 1
	   when lf.DisplayName like '%county%' then 1
	   when lf.DisplayName like '%country%' then 1
	   when lf.DisplayName like '%zip%' then 1
	   when lf.DisplayName like '%email%' then 1
	   when lf.DisplayName like '%phone%' then 1
	   else 0
	   end) as varchar(10)))
	   +',"component":'
	   +(select cast((case
	   when lf.DisplayName like '%address%' then '"address"'
	   when lf.DisplayName like '%city%' then '"address"'
	   when lf.DisplayName like '%state%' then '"address"'
	   when lf.DisplayName like '%county%' then '"address"'
	   when lf.DisplayName like '%country%' then '"address"'
	   when lf.DisplayName like '%zip%' then '"address"'
	   when lf.DisplayName like '%email%' then '"email"'
	   when lf.DisplayName like '%phone%' then '"phone"'
	   else '""'
	   end) as varchar(10)))+',"name_labels":[]}'

	   when lf.FieldType='text' and lf.is_lkptable=1
	   then '{"type":"select","label":"'+(select lf.DisplayName)+'","name":"'+(select lf.FieldName)+'","placeholder":"--Select--","default":"","name_labels":[],"columnsize":12,"items":[{"label":"Option 1","value":"option_1"}],"is_sys_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end) as varchar(10)))+
	   ',"is_cus_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 0
	   when 'Function'		then 0
	   when 'MAPSystemData' then 0
	   else 1
	   end) as varchar(10)))
	   +',"is_multi_component":'
	   +(select cast((case
	   when lf.DisplayName like '%address%' then 1
	   when lf.DisplayName like '%city%' then 1
	   when lf.DisplayName like '%state%' then 1
	   when lf.DisplayName like '%county%' then 1
	   when lf.DisplayName like '%country%' then 1
	   when lf.DisplayName like '%zip%' then 1
	   when lf.DisplayName like '%email%' then 1
	   when lf.DisplayName like '%phone%' then 1
	   else 0
	   end) as varchar(10)))
	   +',"component":'
	   +(select cast((case
	   when lf.DisplayName like '%address%' then '"address"'
	   when lf.DisplayName like '%city%' then '"address"'
	   when lf.DisplayName like '%state%' then '"address"'
	   when lf.DisplayName like '%county%' then '"address"'
	   when lf.DisplayName like '%country%' then '"address"'
	   when lf.DisplayName like '%zip%' then '"address"'
	   when lf.DisplayName like '%email%' then '"email"'
	   when lf.DisplayName like '%phone%' then '"phone"'
	   else '""'
	   end) as varchar(10)))+',"name_labels":[],"lkp":"'+(select lf.lkptable)+'","lkp_value":"'+(select lf.lkpfield)+'","lkp_text":"'+(select lf.lkpfield)+'"}'

	   when lf.FieldType='date' or lf.FieldType='datetime'
	   then '{"type":"date","label":"'+(select lf.DisplayName)+'","name":"'+(select lf.FieldName)+'","format":"dd-MMMM-yyyy","default":"","columnsize":12,"is_sys_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end) as varchar(10)))+
	   ',"is_cus_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 0
	   when 'Function'		then 0
	   when 'MAPSystemData' then 0
	   else 1
	   end) as varchar(10)))+',"name_labels":[]}'

	   when lf.FieldType='CheckBox'
	   then '{"type":"checkbox","label":"'+(select lf.DisplayName)+'","name":"'+(select lf.FieldName)+'","inline":false,"default":"","columnsize":12,"items":[{"label":"","value":""}],"is_sys_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end) as varchar(10)))+
	   ',"is_cus_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 0
	   when 'Function'		then 0
	   when 'MAPSystemData' then 0
	   else 1
	   end) as varchar(10)))+',"name_labels":[]}'

	   when lf.FieldType='signature'
	   then '{"type":"signature","label":"'+(select lf.DisplayName)+'","name":"'+(select lf.FieldName)+'","placeholder":"","default":"","validate":{"require":false,"minlength":0,"maxlength":'+isnull(cast((select lf.FieldSize) as varchar(10)),'''''')+'},"columnsize":12,"is_sys_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 1
	   when 'Function'		then 1
	   when 'MAPSystemData' then 1
	   else 0
	   end) as varchar(10)))+
	   ',"is_cus_lib":'
	   +(select cast((case lf.TableName
	   when 'FormFunction'	then 0
	   when 'Function'		then 0
	   when 'MAPSystemData' then 0
	   else 1
	   end) as varchar(10)))
	   +',"name_labels":[],"position":"left"}'

	   END

FROM #libraryfields lf

DROP TABLE #libraryfields


