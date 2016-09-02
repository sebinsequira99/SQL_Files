

use pfcomm_api
select * from pfcomm_api.profiles_new 

alter table pfcomm_api.profiles_new 
add waiting_id int;
alter table pfcomm_api.profiles_new 
add religion_id int;
alter table pfcomm_api.profiles_new 
add faith_id int;
alter table pfcomm_api.profiles_new 
add ethnicity_id int;
alter table pfcomm_api.profiles_new 
add education_id int;

select * from pfcomm_api.religions
select * from pfcomm_api.ethnicity
select * from pfcomm_api.education

select * from pfcomm_api.religion_new
select * from pfcomm_api.ethnicity_new
select * from pfcomm_api.education_new

update pfcomm_api.profiles_new as p
inner join pfcomm_api.religion_new as rn
on p.username=rn.username
inner join pfcomm_api.religions as r
on rn.religiontext=r.religion
set p.religion_id=r.religionid


update pfcomm_api.profiles_new as p
inner join pfcomm_api.ethnicity_new as rn
on p.username=rn.username
inner join pfcomm_api.ethnicity as r
on rn.ethnicitytext=r.ethnicity
set p.ethnicity_id=r.ethnicity_id


update pfcomm_api.profiles_new as p
inner join pfcomm_api.education_new as rn
on p.username=rn.username
inner join pfcomm_api.education as r
on rn.educationtext=r.education_text
set p.education_id=r.education_id







