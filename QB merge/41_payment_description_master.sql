

mapfcs..payment_description_master --23
mapfac_old_test..payment_description_master --64
mapfc_old_test..payment_description_master --13

insert into mapfcs..payment_description_master(
type
,agency_id
,description
,quickbook_add
,quickbook_listid
,pid
,account_id
,quickbook_queue
,quickbook_editseq
,qb_listid_online
,qb_online_updation) 
select type
,agency_id
,description
,quickbook_add
,quickbook_listid
,pid
,account_id
,quickbook_queue
,quickbook_editseq
,qb_listid_online
,qb_online_updation
from mapfac_old_test..payment_description_master 
where description not in(select description from mapfcs..payment_description_master)

update mapfcs..payment_description_master
set agency_id=8125
where agency_id=5017

update mapfcs..payment_description_master
set pid=934
where desc_id=945

