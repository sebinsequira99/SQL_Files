

-- SHOW FULL COLUMNS FROM pfcomm_api_mig.letter;
-- SHOW FULL COLUMNS FROM pfcomm.letter;
-- SHOW FULL COLUMNS FROM pfcomm.Profiles;

-- show create table pfcomm_api_mig.letter
-- show create table pfcomm.Profiles

-- CREATE TABLE `letter` (
--    `id` int(11) NOT NULL AUTO_INCREMENT,
--   `label` varchar(300) NOT NULL,
--   `description` text NOT NULL,
--   `account_id` int(11) NOT NULL,
--   `img` varchar(300) DEFAULT NULL,
--   `isDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter',
--   `slug` varchar(250) NOT NULL,
--   `sort_order` int(11) NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=2063 DEFAULT CHARSET=utf8
 
-- describe pfcomm_api_mig.letter
-- describe pfcomm.Profiles

-- select * from pfcomm.letter
-- select * from pfcomm.letters_sort
-- select * from pfcomm_api_mig.letter
-- select * from pfcomm.Profiles
-- select * from pfcomm_api_mig.Profiles

-- select * from pfcomm.letter where profile_id=7467;
-- select * from pfcomm.letters_sort where profile_id=7467;

truncate table pfcomm_api_mig.letter;

insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select l.label,l.description,pp.account_id,l.img,'0',concat(p.nickname,'_',l.label),ls.order_by from pfcomm_new.letter l
inner join pfcomm_new.letters_sort ls
on l.id=replace(ls.label,'letter_','') and l.profile_id=ls.profile_id
inner join pfcomm_new.Profiles p 
on l.profile_id=p.id
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname;

insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select 'EXPECTING MOTHER LETTER'
,p.DearBirthParent 
,pp.account_id
,p.img_mother
,'1'
,concat(p.nickname,'_EXPECTING_MOTHER_LETTER')
,ls.order_by
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
inner join pfcomm_new.letters_sort ls
on p.id=ls.profile_id and ls.label='letter_mother'
where p.DearBirthParent<>'';

insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select 'AGENCY LETTER'
,p.agency_letter 
,pp.account_id
,p.img_agency
,'1'
,concat(p.nickname,'_AGENCY_LETTER')
,ls.order_by
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
inner join pfcomm_new.letters_sort ls
on p.id=ls.profile_id and ls.label='letter_agency'
where p.agency_letter <>'';


insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select concat('LETTER ABOUT ',p.FirstName)
,p.DescriptionMe  
,pp.account_id
,p.img_him
,'1'
,concat(p.nickname,'LETTER_ABOUT_',p.FirstName)
,ls.order_by
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
inner join pfcomm_new.letters_sort ls
on p.id=ls.profile_id and ls.label='letter_about_him'
where p.DescriptionMe<>'' and p.sex='male';

insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select concat('LETTER ABOUT ',p.FirstName)
,p.DescriptionMe  
,pp.account_id
,p.img_her
,'1'
,concat(p.nickname,'LETTER_ABOUT_',p.FirstName)
,ls.order_by
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
inner join pfcomm_new.letters_sort ls
on p.id=ls.profile_id and ls.label='letter_about_her'
where p.DescriptionMe<>'' and p.sex='female';

insert into pfcomm_api_mig.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order)
select 'LETTER ABOUT THEM'
,p.letter_aboutThem 
,pp.account_id
,p.img_them
,'1'
,concat(p.nickname,'LETTER_ABOUT_THEM')
,ls.order_by
from pfcomm_new.Profiles p
inner join pfcomm_api_mig.profiles pp
on p.nickname=pp.nickname
inner join pfcomm_new.letters_sort ls
on p.id=ls.profile_id and ls.label='letter_about_them'
where p.letter_aboutThem<>'';




