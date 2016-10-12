

mapatfs_newtest

--RptCIListDataAP
Select library_name 
from library_master
where ContactTypeId = 1 and is_sys_lib=0

--RptCIListDataBP
Select library_name 
from library_master
where ContactTypeId = 5 and is_sys_lib=0

--RptCIListDataChild
Select library_name 
from library_master
where ContactTypeId = 8 and is_sys_lib=0

--RptCIListDataInq
Select library_name 
from library_master
where ContactTypeId = 3 and is_sys_lib=0

--RptCIListDataOther
Select library_name 
from library_master
where is_sys_lib=0 and (ContactTypeId not in (1,3,5,8)
or CIListTemplateId = -100)



