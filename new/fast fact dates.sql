

mapat

information_schema.tables where table_name like '%fastfact%'

FastFactData
FastFactlookupTable
FastFactsConfiguration
FastFactTemplateHide
lkpFastFactFieldTypes
Stgfastfactdata


select * from cilisttemplate where CIListTemplateId=-100
select * from cilisttemplateitem where isfastfact=1


set identity_insert cilisttemplate on

insert into cilisttemplate(
CIListTemplateId
,CIListTemplateName
,CIListAreaId
,OPTypeId
,IsOnePageList
,IsMultiForm
,ColNum
,CIListTemplateSeq
,TableName
,isCase
,isGroup
,IsFastFact
,RelationshipSubTypeId
,RelationshipTypeId
,ShowAll)


           select -339   ,'Home Study Approval Date VA'	  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -340   ,'Post Placement 1 VA'		                  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -341   ,'Post Placement 2 VA'	                      ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -342   ,'Post Placement 3 VA'		                  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -343   ,'Post Placement 4 VA'		                  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -344  ,'Post Placement 5 VA'		                  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1
union select -345   ,'Post Placement 6 VA'		                  ,-100,	NULL,	0,	0,	1,	5,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	1

set identity_insert cilisttemplate off

set identity_insert cilisttemplateitem on

insert into cilisttemplateitem(CIListTemplateItemId
,CIListTemplateId
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

           select  -339,-100		 ,'Home Study Approval Date VA'	       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -340,-100		 ,'Post Placement 1 VA'		                       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -341,-100		 ,'Post Placement 2 VA'	                           ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -342,-100		 ,'Post Placement 3 VA'		                       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -343,-100		 ,'Post Placement 4 VA'		                       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -344,-100		,'Post Placement 5 VA'		                       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1
union select  -345,-100		 ,'Post Placement 6 VA'		                       ,100	,0	,5	,0	,0	,0	,1	,0	,NULL	,NULL	,NULL	,1

set identity_insert cilisttemplateitem off


SELECT * FROM (
                                SELECT RC.Rel_CustomTemplateId,Rel_CustomTemplateLabel,1 as source,''as fieldName
                                   FROM [Rel_CustomTemplates] rc 
                                   WHERE rc.IsDate = 1 AND rc.IsFastFact = 1 
                                AND RelationshipTypeId='-101' and RelationshipSubTypeId = '-100'
    AND RC.Rel_CustomTemplateId not in (SELECT TemplateId FROM FastFactTemplateHide WHERE FieldId = 0 and CIListTemplateYN = 0 )
                                UNION ALL
                              SELECT  CIListTemplateId,CIListTemplateName,0,'' AS  fieldName FROM CIListTemplate 
                              WHERE IsFastFact =1 AND ((RelationshipTypeId='-101' and RelationshipSubTypeId = '-100') OR ShowAll =1)
    AND CIListTemplateId not in (SELECT TemplateId FROM FastFactTemplateHide WHERE FieldId = 0 and CIListTemplateYN = 1 )
                                ) AS T
                                ORDER BY T.Rel_CustomTemplateLabel

SELECT * FROM  CIListTemplate  C
                            LEFT JOIN FastFactsConfiguration FC on FC.FieldId = C.CIListTemplateId
                            LEFT JOIN FastFactTemplateHide FT ON FT.TemplateId = FC.FieldId AND FT.FieldId = FC.ItemId
                            WHERE C.CIListTemplateId = -300 AND ISnull(FT.HideYN,0) !=1