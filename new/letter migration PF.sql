

TRUNCATE TABLE pfcomm_mig_new.letter;
                                  
insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where p.DearBirthParent<>'';



insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where p.letter_aboutThem<>'';



insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where p.agency_letter <>'';



insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_her is not null) 
and (p.couple < p.id and p.couple != 0)
and pp.account_id is not null;



insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_him is not null) 
and p.couple > p.id 
and pp.account_id is not null;




insert into pfcomm_mig_new.letter(label
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
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname
where (p.DescriptionMe <>'' or p.img_him is not null) 
and p.couple = 0
and pp.account_id is not null;



insert into pfcomm_mig_new.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select l.label
,l.description
,pp.account_id
,l.img
,'0'
,concat(p.nickname,'_',l.label)
,0
,p.id
,l.id 
from pfcomm_new.letter l
inner join pfcomm_new.`Profiles` p 
on l.profile_id=p.id
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname;

update pfcomm_mig_new.letter as l 
inner join pfcomm_new.letters_sort as ls 
on l.PID = ls.profile_id and concat('letter_' , l.PLabel) = ls.label
set l.`sort_order`= ls.order_by;


