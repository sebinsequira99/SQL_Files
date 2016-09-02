

use pfcomm_api

select * from pfcomm.profiles
select * from pfcomm_api.profiles_new
describe pfcomm_api.Birthfather_pref

truncate table pfcomm_api.Birthfather_status

select * from pfcomm_api.adoption_type
select * from pfcomm_api.adoption_type_preference
select * from pfcomm_api.adoptiontype_new
select * from pfcomm_api.Age_group
select * from pfcomm_api.age_group_preference
select * from pfcomm_api.childage_new
select * from pfcomm_api.Ethnicity
select * from pfcomm_api.Ethnicity_pref
select * from pfcomm_api.childethnicity_new
select * from pfcomm_api.Birthfather_status
select * from pfcomm_api.Birthfather_pref
select * from pfcomm_api.BFStatus_new

select * from pfcomm_api.faith
select * from pfcomm_api.faith_pref

select nickname,adoptiontype,ChildAge,BirthFatherStatus,ChildEthnicity,faith from pfcomm.profiles

truncate table pfcomm_api_mig.Birthfather_pref;

insert into pfcomm_api_mig.Birthfather_pref(account_id,birthfather_status_id)
select n.account_id,t.birthfather_status_id
from pfcomm_api_mig.BFStatus_new as a
inner join pfcomm_api_mig.Birthfather_status as t
on a.BFStatustext=t.Birthfather_status
inner join pfcomm_api_mig.`profiles` as n
on a.username=n.username
where n.account_id is not null;