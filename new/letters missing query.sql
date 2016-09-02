

select p.nickname
,case when p.DearBirthParent='' then '0' else '1' end as 'ExpectingMotherLetter'
,case when p.letter_aboutThem='' then '0' else '1' end as 'LetterAboutThem'
,case when p.agency_letter='' then '0' else '1' end as 'AgencyLetter'
,case when p.DescriptionMe='' then '0' else '1' end as 'LetterAboutHim/Her'
,group_concat(l.label) as 'CustomLetters'
from pfcomm_new.Profiles as p
left join pfcomm_new.letter as l
on p.id=l.profile_id
group by p.nickname
having LetterAboutThem='0'