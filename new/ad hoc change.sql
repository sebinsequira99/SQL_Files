

mapat

  select count(*) from ProgramPhaseDetail --265823


select * from ReportFieldMaster where TableId=14 and FieldId=-3000
select * from ReportFieldMasterBase where TableId=14 and FieldId=-3000

update ReportFieldMaster
set FieldName='CaseStatus'
where TableId=14 and FieldName='CaseNumber' and FieldId=-3000

update ReportFieldMasterBase
set FieldName='CaseStatus'
where TableId=14 and FieldName='CaseNumber' and FieldId=-3000