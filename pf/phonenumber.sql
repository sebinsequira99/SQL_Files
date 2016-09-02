


alter table pfcomm_api_mig.contactdetails
modify mobile_num varchar(255) not null default 0;

update pfcomm_api_mig.contactdetails c
inner join pfcomm_api_mig.profiles p
on c.account_id=p.account_id
inner join pfcomm_new.Profiles pp
on p.nickname=pp.nickname
set c.mobile_num=pp.phonenumber;

update pfcomm_api_mig.contactdetails c
inner join pfcomm_api_mig.profiles p
on c.account_id=p.account_id
inner join pfcomm_new.Profiles pp
on p.nickname=pp.nickname
set c.mobile_num=pp.CONTACT_NUMBER
where c.mobile_num=0;

