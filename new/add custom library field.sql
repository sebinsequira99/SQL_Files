

--use mapeckerd

insert into cilisttemplateitem(
CIListTemplateId
,CIListTemplateItemName
,CIListTemplateItemOrder
,CIListSectionId
,CIListItemTypeId
,CIListFormatId
,ReportItemId
,IsPreferenceItem
,ColNum
,IsIndexed
,CIListTable
,CIListTableIdFld
,CIListTableTextFld
,IsFastFact)
select CIListTemplateId
,'MachUploadDoc'
,CIListTemplateItemOrder
,CIListSectionId
,CIListItemTypeId
,CIListFormatId
,ReportItemId
,IsPreferenceItem
,ColNum
,IsIndexed
,CIListTable
,CIListTableIdFld
,CIListTableTextFld
,IsFastFact
from cilisttemplateitem where cilisttemplateitemname like '%PlzUploadAdopHS%'

--cilisttemplateitem where cilisttemplateitemname like '%PlzUploadAdopHS%'
--cilisttemplateitem where cilisttemplateitemname like '%MachUploadDoc%'

--SP_AgencyFormFieldLibrary 133
