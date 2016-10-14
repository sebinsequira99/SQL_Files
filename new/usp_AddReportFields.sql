

ALTER PROC usp_AddReportFields
AS
BEGIN

delete from reportfieldmaster where TableId in(3,17,18)
delete from reportfieldmasterbase where TableId in(3,17,18)

Declare @library_name varchar(max)
,@library_desc varchar(max)
,@control_type varchar(50)
,@runsql varchar(max) 
,@start_id int
,@end_id int

select @start_id=min(id)
From library_master
where ContactTypeId = 1 and is_sys_lib=0 

select @end_id=max(id)
From library_master
where ContactTypeId = 1 and is_sys_lib=0 

while(@start_id<=@end_id)
begin

	Select @library_name = library_name
	,@library_desc = library_desc
	,@control_type = CASE control_type 
								   WHEN 'E' THEN '[Datetime]'
								   ELSE '[VARCHAR](max)'	
								   END
	From library_master
	where ContactTypeId = 1 and is_sys_lib=0 and id=@start_id

	IF (@library_name not in(select fieldname from ReportFieldMasterBase where TableId=3))
	begin

	INSERT INTO ReportFieldMasterBase(
	TableId
	,FieldName
	,DisplayName
	,FieldType
	,GridFilterDflt
	,DisplaySizeDflt
	,FieldDesc
	,DisplayPosition)
	
	Select (select tableid from reporttablemaster where TableName='RptCIListDataAP')
	,@library_name
	,@library_desc
	,@control_type
	,'text_filter'
	,200
	,@library_desc
	,'left'

	end

	IF (@library_name not in(select fieldname from ReportFieldMaster where TableId=3))
	BEGIN
		INSERT INTO ReportFieldMaster(
		TableId
		,FieldName
		,DisplayName
		,FieldType
		,GridFilterDflt
		,DisplaySizeDflt
		,FieldDesc
		,DisplayPosition)
		
		Select (select tableid from reporttablemaster where TableName='RptCIListDataAP')
		,@library_name
		,@library_desc
		,@control_type
		,'text_filter'
		,200
		,@library_desc
		,'left'
	END

	IF NOT EXISTS( Select 1 From information_schema.columns Where table_name='RptCIListDataAP' And COLUMN_NAME = @library_name)
	AND NOT EXISTS( Select 1 From information_schema.columns Where table_name='RptCIListDataAP_2' And COLUMN_NAME = @library_name)
	AND NOT EXISTS( Select 1 From information_schema.columns Where table_name='RptCIListDataAP_3' And COLUMN_NAME = @library_name)
	BEGIN
		SET @runsql='Alter Table RptCIListDataAP_3 Add '+@library_name+' '+@control_type
		--PRINT @runsql
		EXEC (@runsql)
	END
	select @start_id=min(id)
	From library_master
	where ContactTypeId = 1 and is_sys_lib=0 and id>@start_id
end

--Update report table ids

update  b
set b.TableId=17
from reportfieldmaster b
inner join information_schema.columns c
on b.fieldname=c.column_name
where c.table_name='RptCIListDataAP_2' and b.TableId=3

update  b
set b.TableId=18
from reportfieldmaster b
inner join information_schema.columns c
on b.fieldname=c.column_name
where c.table_name='RptCIListDataAP_3' and b.TableId=3

update  b
set b.TableId=17
from reportfieldmasterbase b
inner join information_schema.columns c
on b.fieldname=c.column_name
where c.table_name='RptCIListDataAP_2' and b.TableId=3

update  b
set b.TableId=18
from reportfieldmasterbase b
inner join information_schema.columns c
on b.fieldname=c.column_name
where c.table_name='RptCIListDataAP_3' and b.TableId=3

END


