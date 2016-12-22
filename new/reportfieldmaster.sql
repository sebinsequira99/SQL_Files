

set identity_insert reportfieldmaster on

insert into reportfieldmaster(
TableId	
,FieldId	
,FieldName	
,DisplayName	
,FieldType	
,FieldSize	
,GridFilterDflt	
,DisplaySizeDflt	
,FieldDesc	
,DisplayPosition)
select 600	
,6009	
,'GroupName'	
,'Group'	
,'[VARCHAR](max)'	
,NULL	
,'Text_filter'	
,0	
,'Group'	
,'left'

set identity_insert reportfieldmaster off

