

set identity_insert mapfcs..formmaker_printform on

insert into mapfcs..formmaker_printform(print_id
,agency_id
,form_type
,template_name
,print_content
,created_by
,created_on
,filename)
select print_id
,234
,form_type
,template_name
,'234'
,8125
,created_on
,filename
from mapfac_old_test..formmaker_printform

set identity_insert mapfcs..formmaker_printform off