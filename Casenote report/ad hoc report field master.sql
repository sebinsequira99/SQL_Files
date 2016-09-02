

mapat

sys.objects where name like '%report%' and type='u'

ReportMaster
ReportFieldMaster where tableid=15
ReportFieldMasterBase where tableid=15
ReportTableMaster
ReportTblRelation

RptMAPCasenoteDetail

set identity_Insert ReportFieldMasterBase ON
insert into ReportFieldMasterBase(TableId,FieldID,
FieldName
,DisplayName
,FieldType
,FieldSize
,GridFilterDflt
,DisplaySizeDflt
,FieldDesc
,DisplayPosition)
values
(15,193,'Program','Program','text',150,'text_filter',30,'Program','right')
,(15,194,'ProgramType','ProgramType','text',150,'text_filter',30,'ProgramType','right')
,(15,195,'GroupName','GroupName','text',150,'text_filter',30,'GroupName','right')

set identity_Insert ReportFieldMasterBase OFF

set identity_Insert ReportFieldMaster ON
insert into ReportFieldMaster(TableId,FieldID,
FieldName
,DisplayName
,FieldType
,FieldSize
,GridFilterDflt
,DisplaySizeDflt
,FieldDesc
,DisplayPosition)
values
(15,193,'Program','Program','text',150,'text_filter',30,'Program','right')
,(15,194,'ProgramType','ProgramType','text',150,'text_filter',30,'ProgramType','right')
,(15,195,'GroupName','GroupName','text',150,'text_filter',30,'GroupName','right')

set identity_Insert ReportFieldMaster OFF