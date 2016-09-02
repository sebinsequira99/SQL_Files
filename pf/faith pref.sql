


select * from pfcomm_api_mig.faith;
select * from pfcomm_api_mig.faith_pref;
select * from pfcomm_api_mig.faith_new;

truncate table pfcomm_api_mig.faith

alter table pfcomm_api_mig.faith
modify faith_id int not null auto_increment primary key

insert into pfcomm_api_mig.faith(faith)
select distinct faithtext from pfcomm_api_mig.faith_new
where faithtext<>''


create table pfcomm_api_mig.faith_pref(faith_pref_id int not null auto_increment primary key
,faith_id int
,account_id int);

insert into pfcomm_api_mig.faith_pref(account_id,faith_id)
select n.account_id,t.faith_id
from pfcomm_api.faith_new as a
inner join pfcomm_api_mig.faith as t
on a.faithtext=t.faith
inner join pfcomm_api_mig.profiles as n
on a.username=n.nickname
where n.account_id is not null