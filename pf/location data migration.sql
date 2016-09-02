


-- insert into pfcomm_api_mig.countries(country,country_code)
-- select replace(LKey,'_',''),`value` from pfcomm.sys_pre_values
-- where `Key`='Country';

-- insert into pfcomm_api_mig.states(country_id,state,statecode)
-- select c.country_id,s.state,s.statecode from pfcomm.States as s
-- inner join pfcomm_api_mig.countries as c
-- on s.countrycode=c.country_code;

truncate table pfcomm_api_mig.contactdetails;

insert into pfcomm_api_mig.contactdetails(StreetAddress                                        
,City
,State
,Country
,Region
,mobile_num
,home_num
,office_num
,DefaultContact
,Zip
,fax_num
,AllowDefaultContact
,Account_id
,website)
SELECT p.Street_Address,p.City,0,0,0,0,0,0,0,p.zip,p.Fax_Number,p.allow_contact
,ifnull(pp.account_id,0),p.WEB_URL 
FROM pfcomm_new.Profiles as p
inner join pfcomm_api_mig.profiles as pp
on p.nickname=pp.nickname and p.nickname not like '%(2)%';

update pfcomm_api_mig.contactdetails as c
inner join pfcomm_api_mig.account as a
on c.account_id=a.account_id
inner join pfcomm_new.Profiles as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_api_mig.countries as cc
on cc.country_code=p.country
inner join pfcomm_api_mig.states as s
on p.state=s.state
set c.state=s.state_id
,c.country=cc.country_id;

update pfcomm_api_mig.contactdetails as c
inner join pfcomm_api_mig.account as a
on c.account_id=a.account_id
inner join pfcomm_new.Profiles as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_api_mig.regions as r
on p.region=r.region
set c.region=r.regionid;


