

mapatfs_newtest

alter table library_master
add CilistTemplateID int default -100

alter table library_master
add CilistTemplateItemID int 

alter table library_master
add CilistAreaID int 

alter table library_master
add ContactTypeID int default 1

update l
set l.CilistTemplateID=cti.CIListTemplateId
,l.CilistTemplateItemID=cti.CIListTemplateItemId
from library_master l
inner join cilisttemplateitem cti
on (select dbo.udf_CleanString(cti.CIListTemplateItemName, '') 
+ '_' 
+ REPLACE(cast(cti.CIListTemplateItemId as varchar(4)), '-','_') )=l.library_name

update library_master 
set CilistTemplateID=-100
where CilistTemplateID is null

update l
set l.CIListAreaId=ca.CIListAreaId
,l.ContactTypeID=ca.ContactTypeID
from library_master l
inner join cilisttemplateitem cti
on l.CIListTemplateItemId=cti.CIListTemplateItemId
inner join cilisttemplate ct
on cti.CIListTemplateId=ct.CIListTemplateId
inner join cilistarea ca
on ct.CIListAreaId=ca.CIListAreaId

update library_master 
set ContactTypeID=1
where ContactTypeID is null