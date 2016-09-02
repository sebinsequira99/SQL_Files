
---Expecting mother letter --- 1009 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select 'EXPECTING MOTHER LETTER'
,p.DearBirthParent 
,pp.account_id
,p.img_mother
,'1'
,concat(p.nickname,'_EXPECTING_MOTHER_LETTER')
,0
,p.id
,'mother'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where p.DearBirthParent<>''


---letter about them --- 339 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select 'LETTER ABOUT THEM'
,p.letter_aboutThem 
,pp.account_id
,p.img_them
,'1'
,concat(p.nickname,'_LETTER ABOUT THEM')
,0
,p.id
,'about_them'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where p.letter_aboutThem<>''

---letter about agency  --- 8 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select 'AGENCY LETTER'
,p.agency_letter 
,pp.account_id
,p.img_agency
,'1'
,concat(p.nickname,'_AGENCY_LETTER')
,0
,p.id
,'agency'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where p.agency_letter <>'';

---letter about her  --- 955 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select concat('LETTER ABOUT ',p.FirstName)
,p.DescriptionMe
,pp.account_id
,p.img_her
,'1'
,concat(p.nickname,'_LETTER_ABOUT_',p.FirstName)
,0
,(p.id-1)
,'about_her'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_her is not null) 
and p.couple < p.id 
--and pp.account_id is not null

---letter about him  --- 894 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select concat('LETTER ABOUT ',p.FirstName)
,p.DescriptionMe
,pp.account_id
,p.img_him
,'1'
,concat(p.nickname,'_LETTER_ABOUT_',p.FirstName)
,0
,p.id
,'about_him'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_him is not null) 
and p.couple > p.id 
--and pp.account_id is not null

---letter about him  --- 149 rows are inserted
-- for single parents

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select concat('LETTER ABOUT ',p.FirstName)
,p.DescriptionMe
,pp.account_id
,p.img_him
,'1'
,concat(p.nickname,'_LETTER_ABOUT_',p.FirstName)
,0
,p.id
,'about_him'
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_him is not null) 
and p.couple = 0
--and pp.account_id is not null

--letters from letter table -- 4769 rows are inserted

insert into pfcomm_api_mig.letters_dup(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select l.label,l.description,pp.account_id,l.img,'0',concat(p.nickname,'_',l.label),0,p.id,l.id from pfcomm_new.letter l
inner join pfcomm_new.Profiles p 
on l.profile_id=p.id
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname;

--- 1652 rows are updated
update `letters_dup` as l inner join pfcomm_new.letters_sort as ls 
on l.PID = ls.profile_id and concat('letter_' , l.PLabel) = ls.label
set l.`sort_order`= ls.order_by

------ Updating account table
Update `account` as a inner join pfcomm_new.`Profiles` as p on a.username=p.nickname set a.role=p.role  -------4707 rows affected
Update `account` as a inner join pfcomm_new.`Profiles` as p on a.username=p.nickname and p.profileType<>'' set a.`role_id`=p.`profileType` ----------- 4701 rows affected. 

update `account` set role_id = 5 where role_id = 1 -------- 8 rows affected
update `account` set role_id = 1 where role_id = 2 -------- 4290 rows affected

------ Updating aqb_pc_member_blocks table
truncate table pfcomm_api_mig.aqb_pc_members_blocks;

insert into pfcomm_api_mig.aqb_pc_members_blocks(
id
,content
,`share`
,approved
,unmovable
,irremovable
,uncollapsable
,collapsed_def
,title
,account_id
,visible_group
,visible
,`column`
,`order`
,`type`
,`date`
,val)

select id
,content
,`share`
,approved
,unmovable
,irremovable
,uncollapsable
,collapsed_def
,title
,owner_id
,visible_group
,visible
,`column`
,`order`
,`type`
,`date`
,val
from pfcomm.aqb_pc_members_blocks; ----------- 2380 rows are inserted

update pfcomm_api_mig.aqb_pc_members_blocks p  
inner join pfcomm_new.Profiles pp
on p.account_id=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.account_id=pr.account_id; ------------- 2187 rows affected

------ Updating aqb_pc_member_blocks table
truncate table pfcomm_api_mig.pdf_template_user;

insert into pfcomm_api_mig.pdf_template_user(
select *
from pfcomm_new.pdf_template_user); ----------- 2480 rows inserted

update pfcomm_api_mig.pdf_template_user p  
inner join pfcomm_new.Profiles pp
on p.user_id=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.user_id=pr.account_id; ------------- 2297 rows affected.