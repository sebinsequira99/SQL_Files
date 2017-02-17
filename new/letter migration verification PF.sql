

select * from pfcomm_new.Profiles where nickname like '%carolyn%jeff%'

select * from profiles where nickname like '%carolyn%jeff%'
select * from SyncLog where profileid in(
9489,9490)
select * from letter where account_id=5178

select * from pfcomm_mig_new.letter_bk_020217 
limit 10;

describe pfcomm_new.letter

select ll.label,ll.description,ll.pid,a.account_id,pp.profile_id,pp.nickname
,a.username,p.DearBirthParent,p.DescriptionMe,p.letter_aboutThem,p.agency_letter
,l.label as old_letter_label,l.description as old_letter_desc
from pfcomm_mig_new.letter ll
inner join pfcomm_mig_new.account a
on a.account_id=ll.account_id
inner join pfcomm_mig_new.profiles pp
on a.username=pp.nickname
inner join pfcomm_new.Profiles p
on pp.nickname=p.nickname
inner join pfcomm_new.letter l
on p.id=l.profile_id
where pp.nickname like 'carolyn%jeffr%';


