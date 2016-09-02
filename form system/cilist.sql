
mapform

rolesqa

library_master

library_systemdata
library_customdata

library_master where issystem=0

cilisttemplateitem
cilisttemplate

user_agencies

SP_AgencyFormFieldLibrary 222

library_master

sys.objects where name like '%cilist%' and type='u'

rolesqa

CIList where cilistid=8914
CIListItem where cilistid=1378
cilisttemplateitem where CIListTemplateItemId in (55)
cilisttemplate where CIListTemplateId=10


CIListItem where CIListTemplateItemId=55

select * from CIList 
select * from CIListItem
select * from cilisttemplateitem
select * from cilisttemplate

select 
top 1000
 c.CIListId
,c.CIListTemplateId
,c.ContactId
,cl.CIListId
,cl.CIListTemplateItemId
,cl.CIListItemDate
,cl.CIListNumber
,cl.CIListText
,cl.CIListItemName
,ct.CIListTemplateItemName
,ctl.CIListTemplateName
,ct.CIListItemTypeId
,ci.CIListItemTypeText
from CIList c
left join CIListItem cl
on c.cilistid=cl.cilistid
left join cilisttemplateitem ct
on cl.CIListTemplateItemId=ct.CIListTemplateItemId
left join cilisttemplate ctl
on c.CIListTemplateId=ctl.CIListTemplateId
left join cilistitemtype ci
on ct.CIListItemTypeId=ci.CIListItemTypeId






