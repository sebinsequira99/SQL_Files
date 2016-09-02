

alter table pfcomm_api_mig.child
modify child_id int not null auto_increment primary key;

truncate table pfcomm_api_mig.child;

insert into pfcomm_api_mig.child(
Number_of_childern
,`Type`
,Accounts_id)
select p.noofchildren,'',pp.account_id
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname 
where p.noofchildren<>'';

