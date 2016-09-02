

-- PROFILES TABLE

INSERT INTO pfcomm_mig_new.`profiles` SELECT 
 publishstatus as publish_status
,nickname
,now() as modified_at
,lastname as last_name
,datelastlogin as last_login 
,sex as gender
,firstname as first_name
,dateofbirth as dob
,now() as created_at
FROM pfcomm_new.`Profiles`;

-- ACCOUNT TABLE

INSERT INTO pfcomm_mig_new.account
select firstname as name
,email as emailid,nickname as username,`status`,role as role_id,now() as created_at,now() as modified_at,password
,salt,avatar,adoptionagency as agency_id,profile_no,profile_year,zoho_id
from pfcomm_new.`Profiles`
where nickname not like '%(2)%';

update pfcomm_mig_new.account as a
inner join pfcomm_mig_new.`status` as s
on a.`status`=s.status_text
set a.`status`=s.status_id;

-- UPDATE PROFILES TABLE

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.account as a
on p.nickname=a.username
or p.nickname=concat(a.username,'(2)')
set p.account_id=a.account_id;

-- CHILD TABLE

insert into pfcomm_mig_new.child(
Number_of_childern
,`Type`
,Accounts_id)
select p.noofchildren,'',pp.account_id
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname 
where p.noofchildren<>'';

-- AQB_PC_MEMBERS_BLOCKS TABLE

insert into pfcomm_mig_new.aqb_pc_members_blocks(
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
from pfcomm_new.aqb_pc_members_blocks;

update pfcomm_mig_new.aqb_pc_members_blocks p  
inner join pfcomm_new.`Profiles` pp
on p.account_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.account_id=pr.account_id;

-- PDF_TEMPLATE_USER TABLE

insert into pfcomm_mig_new.pdf_template_user(
template_user_id
,user_id
,template_id
,template_file_path
,template_description
,isDeleted
,isDefault
,lastupdateddate)

select template_user_id
,user_id
,template_id
,template_file_path
,template_description
,isDeleted
,isDefault
,lastupdateddate
from pfcomm_new.pdf_template_user;

update pfcomm_mig_new.pdf_template_user p  
inner join pfcomm_new.`Profiles` pp
on p.user_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.user_id=pr.account_id;

-- BX_GROUPS_MAIN table

insert into pfcomm_mig_new.bx_groups_main 
select * from pfcomm_new.bx_groups_main ;

update pfcomm_mig_new.bx_groups_main p  
inner join pfcomm_new.`Profiles` pp
on p.author_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.author_id=pr.account_id;

-- UPDATE PROFILES

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_new.`Profiles` as pp
on p.nickname=pp.nickname
inner join pfcomm_mig_new.`status` as r
on pp.`Status`=r.status_text
set p.`Status`=r.status_id;

-- JOURNALS

alter table pfcomm_mig_new.bx_blogs_posts
add OwnerID int;

insert into pfcomm_mig_new.bx_blogs_posts(PostID
,PostCaption
,PostUri
,PostText
,PostDate
,PostStatus
,PostPhoto
,Tags
,Featured
,Views
,Rate
,RateCount
,CommentsCount
,OwnerID
,account_id
,Categories
,allowView
,allowRate
,allowComment
,slug)
select PostID
,PostCaption
,PostUri
,PostText
,PostDate
,PostStatus
,PostPhoto
,Tags
,Featured
,Views
,Rate
,RateCount
,CommentsCount
,OwnerID
,0
,Categories
,allowView
,allowRate
,allowComment
,''
from pfcomm_new.bx_blogs_posts;

update pfcomm_mig_new.bx_blogs_posts p
inner join pfcomm_new.`Profiles` pp
on p.OwnerID=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.account_id=IFNULL(pr.account_id,0);

alter table pfcomm_mig_new.bx_blogs_posts
drop column OwnerID;

-- CONTACTDETAILS TABLE


insert into pfcomm_mig_new.contactdetails(StreetAddress                                        
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
FROM pfcomm_new.`Profiles` as p
inner join pfcomm_mig_new.`profiles` as pp
on p.nickname=pp.nickname and p.nickname not like '%(2)%';

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.countries as cc
on cc.country_code=p.country
inner join pfcomm_mig_new.states as s
on p.state=s.state
set c.state=s.state_id
,c.country=cc.country_id;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.regions as r
on p.region=r.region
set c.region=r.regionid;

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.`profiles` p
on c.account_id=p.account_id
inner join pfcomm_new.`Profiles` pp
on p.nickname=pp.nickname
set c.mobile_num=pp.phonenumber;

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.`profiles` p
on c.account_id=p.account_id
inner join pfcomm_new.`Profiles` pp
on p.nickname=pp.nickname
set c.mobile_num=pp.CONTACT_NUMBER
where c.mobile_num=0;

-- PHOTOS AND VIDEOS

insert into pfcomm_mig_new.sys_albums(
ID
,Caption
,Uri
,Location
,Description
,`Type`
,account_id
,`Status`
,`Date`
,ObjCount
,LastObjId
,AllowAlbumView)
select  p.ID
,p.Caption
,p.Uri
,p.Location
,p.Description
,p.`Type`
,pn.account_id
,p.`Status`
,p.`Date`
,p.ObjCount
,p.LastObjId
,p.AllowAlbumView 
from pfcomm_new.sys_albums as p
inner join pfcomm_new.`Profiles` as pp
on p.`owner`=pp.id
inner join pfcomm_mig_new.`profiles` as pn
on pp.nickname=pn.nickname
where pp.nickname not in('BobandKarin(2)','Dan-Laura(2)','eranney(2)','jenanddan(2)');

insert into pfcomm_mig_new.sys_albums_objects
select * from pfcomm_new.sys_albums_objects;

insert into pfcomm_mig_new.rayvideofiles(
ID
,Categories
,Title
,Uri
,Tags
,Description
,Time
,Date
,account_id
,Views
,Rate
,RateCount
,CommentsCount
,Featured
,Status
,Source
,Video
,YoutubeLink
,home
,ytStatusCheck
,ytChannelId)

select r.ID
,r.Categories
,r.Title
,r.Uri
,r.Tags
,r.Description
,r.Time
,r.Date
,pn.account_id
,r.Views
,r.Rate
,r.RateCount
,r.CommentsCount
,r.Featured
,r.Status
,r.Source
,r.Video
,r.YoutubeLink
,r.home
,r.ytStatusCheck
,r.ytChannelId
from pfcomm_new.RayVideoFiles as r
inner join pfcomm_new.`Profiles` as p
on r.owner=p.id
inner join pfcomm_mig_new.`profiles` as pn
on p.nickname=pn.nickname;

insert into pfcomm_mig_new.bx_photos_main(
 ID
,Categories
,account_id
,Ext
,Size
,Title
,Uri
,`Desc`
,Tags
,`Date`
,Views
,Rate
,RateCount
,CommentsCount
,Featured
,`Status`
,`Hash`)
select 
 ID
,Categories
,`owner`
,Ext
,Size
,Title
,Uri
,`Desc`
,Tags
,`Date`
,Views
,Rate
,RateCount
,CommentsCount
,Featured
,`Status`
,`Hash` from pfcomm_new.bx_photos_main;

update pfcomm_mig_new.bx_photos_main b
inner join pfcomm_new.`Profiles` p
on b.account_id=p.id
inner join pfcomm_mig_new.`profiles` as pp
on p.nickname=pp.nickname
set b.account_id=pp.account_id;

-- Expecting mother letter

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

-- letter about them 

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

-- letter about agency 

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

-- letter about her 

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

-- letter about him  

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

-- letter about him  
-- for single parents

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

-- letters from letter table 

insert into pfcomm_mig_new.letter(label
,description
,account_id
,img
,isDefault
,slug
,sort_order
,PID
,PLabel)
select l.label,l.description,pp.account_id,l.img,'0',concat(p.nickname,'_',l.label),0,p.id,l.id 
from pfcomm_new.letter l
inner join pfcomm_new.`Profiles` p 
on l.profile_id=p.id
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname;

update pfcomm_mig_new.letter as l inner join pfcomm_new.letters_sort as ls 
on l.PID = ls.profile_id and concat('letter_' , l.PLabel) = ls.label
set l.`sort_order`= ls.order_by;

-- Updating account table

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname 
set a.role=p.role ; 

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname and p.profileType<>'' 
set a.`role_id`=p.`profileType`;

update pfcomm_mig_new.`account` set role_id = 5 where role_id = 1;
update pfcomm_mig_new.`account` set role_id = 1 where role_id = 2;

-- UPDATING PREFERENCE ID'S AND TABLES

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
set p.religion_id=r.religionid;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.ethnicity_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.Ethnicity as r
on rn.ethnicitytext=r.ethnicity
set p.ethnicity_id=r.ethnicity_id;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.education_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.education as r
on rn.educationtext=r.education_text
set p.education_id=r.education_id;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.waiting_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.waiting as r
on rn.waitingtext=r.waiting_text
set p.waiting_id=r.waiting_id;


insert into pfcomm_mig_new.birthfather_pref(account_id,birthfather_status_id)
select n.account_id,t.birthfather_status_id
from pfcomm_mig_new.bfstatus_new as a
inner join pfcomm_mig_new.Birthfather_status as t
on a.BFStatustext=t.Birthfather_status
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

insert into pfcomm_mig_new.adoption_type_preference(account_id,adoption_type_id)
select n.account_id,t.adoption_type_id
from pfcomm_mig_new.adoptiontype_new as a
inner join pfcomm_mig_new.adoption_type as t
on a.adoptiontypetext=t.adoption_type
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

insert into pfcomm_mig_new.age_group_preference(account_id,age_group_id)
select n.account_id,t.age_group_id
from pfcomm_mig_new.childage_new as a
inner join pfcomm_mig_new.Age_group as t
on a.childagetext=t.Age_group
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

insert into pfcomm_mig_new.ethnicity_pref(account_id,ethnicity_id)
select n.account_id,t.Ethnicity_id
from pfcomm_mig_new.childethnicity_new as a
inner join pfcomm_mig_new.Ethnicity as t
on a.childethnicitytext=t.ethnicity
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

insert into pfcomm_mig_new.faith_pref(account_id,faith_id)
select n.account_id,t.faith_id
from pfcomm_mig_new.faith_new as a
inner join pfcomm_mig_new.faith as t
on a.faithtext=t.faith
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;


















