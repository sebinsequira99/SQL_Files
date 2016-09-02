

use pfcomm_api;
show tables;
describe pfcomm_api.profiles_new

SELECT * FROM pfcomm.profiles

drop table pfcomm_api.profiles_new

null as waiting_id
,null as religion_id
,null as faith_id
,null as ethnicity_id
,null as education_id

,null as accounts_id

CREATE TABLE pfcomm_api.profiles_new SELECT 
 status
,publishstatus as publish_status
,nickname as username
,now() as modified_at
,lastname as last_name
,datelastlogin as last_login 
,sex as gender
,firstname as first_name
,dateofbirth as dob
,now() as created_at
 FROM pfcomm.profiles

SELECT * FROM pfcomm_api.profiles
SELECT avatar FROM pfcomm.profiles
SELECT * FROM pfcomm_api.profiles_new
order by username

SELECT * FROM pfcomm_api.account
SELECT * FROM pfcomm_api.account_new

drop table pfcomm_api.account_new

CREATE TABLE pfcomm_api.account_new
select firstname as name
,email as emailid,nickname as username,status,role as role_id,now() as created_at,now() as modified_at,password
,salt,avatar,adoptionagency as agency_id,profile_no,profile_year,zoho_id
from pfcomm.profiles
where nickname not like '%(2)%'

ALTER TABLE pfcomm_api.account_new
ADD account_id int not null auto_increment primary key


ALTER TABLE pfcomm_api.profiles_new
ADD profile_id int not null auto_increment primary key

ALTER TABLE pfcomm_api.profiles_new
ADD account_id int 

ALTER TABLE pfcomm_api.profiles_new
ADD FOREIGN KEY (account_id)
REFERENCES pfcomm_api.account_new(account_id)


SELECT * FROM pfcomm.profiles
where couple<>0
order by id

SELECT * FROM pfcomm.profiles 
where nickname not like '%(2)%'
order by p.lastname

update pfcomm_api.profiles_new as p
inner join pfcomm_api.account_new as a
on p.username=a.username
or p.username=concat(a.username,'(2)')
set p.account_id=a.account_id

select
nickname as username
,waiting
,religion
,faith
,ethnicity
,education from 
pfcomm.profiles

select * from pfcomm_api.adoption_type_preference
select * from pfcomm_api.faith_new




