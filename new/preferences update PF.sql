

delete from pfcomm_mig_new.waiting_new;

insert into pfcomm_mig_new.waiting_new(username,waitingtext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.waiting, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.waiting) - LENGTH(REPLACE(t.waiting, ',', '')));
 
delete from pfcomm_mig_new.religion_new;

insert into pfcomm_mig_new.religion_new(username,religiontext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.religion, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.religion) - LENGTH(REPLACE(t.religion, ',', '')));
 
delete from pfcomm_mig_new.ethnicity_new;

insert into pfcomm_mig_new.ethnicity_new(username,ethnicitytext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.ethnicity, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.ethnicity) - LENGTH(REPLACE(t.ethnicity, ',', '')));

delete from pfcomm_mig_new.education_new;

insert into pfcomm_mig_new.education_new(username,educationtext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.education, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.education) - LENGTH(REPLACE(t.education, ',', '')));
 
delete from pfcomm_mig_new.adoptiontype_new;

insert into pfcomm_mig_new.adoptiontype_new(username,adoptiontypetext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.adoptiontype, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.adoptiontype) - LENGTH(REPLACE(t.adoptiontype, ',', '')));
 
delete from pfcomm_mig_new.childage_new;

insert into pfcomm_mig_new.childage_new(username,childagetext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.ChildAge, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.ChildAge) - LENGTH(REPLACE(t.ChildAge, ',', '')));
 
delete from pfcomm_mig_new.childethnicity_new;

insert into pfcomm_mig_new.childethnicity_new(username,childethnicitytext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.ChildEthnicity, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.ChildEthnicity) - LENGTH(REPLACE(t.ChildEthnicity, ',', '')));
 
delete from pfcomm_mig_new.bfstatus_new;

insert into pfcomm_mig_new.bfstatus_new(username,BFStatustext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.BirthFatherStatus, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.BirthFatherStatus) - LENGTH(REPLACE(t.BirthFatherStatus, ',', '')));
 
delete from pfcomm_mig_new.faith_new;

insert into pfcomm_mig_new.faith_new(username,faithtext)
SELECT nickname,SUBSTRING_INDEX(SUBSTRING_INDEX(t.faith, ',', n.n), ',', -1) value
  FROM pfcomm_new.Profiles t CROSS JOIN 
(
   SELECT a.N + b.N * 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.faith) - LENGTH(REPLACE(t.faith, ',', '')));
 
update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.religion_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.religions as r
on rn.religiontext=r.religion
set p.religion_id=r.religionid
where rn.religiontext<>'';

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.ethnicity_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.ethnicity as r
on rn.ethnicitytext=r.ethnicity
set p.ethnicity_id=r.ethnicity_id
where rn.ethnicitytext<>'' and p.profile_id<2000 and p.Status<4;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.education_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.education as r
on rn.educationtext=r.education_text
set p.education_id=r.education_id
where rn.educationtext<>'' and p.profile_id>=6000 and p.Status<4;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.waiting_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.waiting as r
on rn.waitingtext=r.waiting_text
set p.waiting_id=r.waiting_id
where rn.waitingtext<>'' and p.profile_id>6000 and p.Status<4;


