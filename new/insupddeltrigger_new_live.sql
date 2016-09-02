

use pfcomm_mig_new;

DROP TRIGGER IF EXISTS tr_DBSync;

DELIMITER $$

CREATE TRIGGER tr_DBSync
AFTER INSERT ON pfcomm_mig_new.SyncLog
FOR EACH ROW

BEGIN

-- PROFILES TABLE

IF NEW.UpdateYN=0 and NEW.DeleteYN=0 

THEN

IF NEW.Area='Avatar'
THEN

UPDATE pfcomm_mig_new.account as a
inner join pfcomm_new.`Profiles` as p
on a.username=p.nickname 
and nickname not like '%(2)%'
and p.id=NEW.ProfileID
set a.avatar=p.avatar;

END IF;

IF NEW.Area='Profiles' 

THEN

INSERT INTO pfcomm_mig_new.`profiles`(publish_status 
,nickname
,modified_at 
,last_name 
,last_login 
,gender 
,first_name
,dob 
,created_at) 

SELECT publishstatus 
,nickname
,datelastedit 
,lastname 
,datelastlogin 
,sex 
,firstname
,dateofbirth 
,datereg 
FROM pfcomm_new.`Profiles`
WHERE id=NEW.ProfileID or Couple=NEW.ProfileID;

-- ACCOUNT TABLE

INSERT INTO pfcomm_mig_new.account(`name`
,emailid 
,username 
,role_id 
,created_at 
,modified_at 
,`password`
,salt
,avatar
,agency_id 
,profile_no
,profile_year
,zoho_id)
select firstname 
,email 
,nickname 
,role 
,DateReg 
,datelastedit 
,password
,salt
,avatar
,adoptionagency 
,profile_no
,profile_year
,zoho_id
from pfcomm_new.`Profiles`
where nickname not like '%(2)%'
and id=NEW.ProfileID;

update pfcomm_mig_new.account as a
inner join pfcomm_new.`Profiles` p
on a.username=p.nickname and p.id=NEW.ProfileID
inner join pfcomm_mig_new.`status` as s
on p.`status`=s.status_text
set a.`status`=s.status_id
where account_id=last_insert_id();

-- UPDATE PROFILES TABLE

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.account as a
on p.nickname=a.username
or p.nickname=concat(a.username,'(2)')
set p.account_id=a.account_id
where a.account_id=last_insert_id();

-- CHILD TABLE

insert into pfcomm_mig_new.child(
Number_of_childern
,`Type`
,Accounts_id)
select p.noofchildren,'',pp.account_id
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname 
where p.noofchildren<>'' and p.id=NEW.ProfileID;

END IF;

-- Flipbooks and e-pubs

-- AQB_PC_MEMBERS_BLOCKS TABLE
                                  
IF NEW.Area='Flipbook' or NEW.Area='epub'
THEN

DELETE FROM pfcomm_mig_new.aqb_pc_members_blocks 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
from pfcomm_new.aqb_pc_members_blocks
where owner_id=NEW.ProfileID;

update pfcomm_mig_new.aqb_pc_members_blocks p  
inner join pfcomm_new.`Profiles` pp
on p.account_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.account_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- PDF_TEMPLATE_USER TABLE
                                  
IF NEW.Area='pdfs' or NEW.Area='pdfdetails' or NEW.Area='PDF'
THEN

DELETE FROM pfcomm_mig_new.pdf_template_user 
where user_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);

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
from pfcomm_new.pdf_template_user
where user_id=NEW.ProfileID;

update pfcomm_mig_new.pdf_template_user p  
inner join pfcomm_new.`Profiles` pp
on p.user_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.user_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- BX_GROUPS_MAIN table

IF NEW.Area='Agency'
THEN

insert into pfcomm_mig_new.bx_groups_main 
select * from pfcomm_new.bx_groups_main 
where author_id=NEW.ProfileID;

update pfcomm_mig_new.bx_groups_main p  
inner join pfcomm_new.`Profiles` pp
on p.author_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.author_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- UPDATE PROFILES

-- update pfcomm_mig_new.`profiles` as p
-- inner join pfcomm_new.`Profiles` as pp
-- on p.nickname=pp.nickname
-- inner join pfcomm_mig_new.`status` as r
-- on pp.`Status`=r.status_text
-- set p.`Status`=r.status_id
-- where pp.id=NEW.ProfileID;

-- CONTACTDETAILS TABLE

IF NEW.Area='Profiles'
THEN

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
on p.nickname=pp.nickname and p.nickname not like '%(2)%'
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.countries as cc
on cc.country_code=p.country
set c.country=cc.country_id
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.states as s
on p.state=s.state
set c.state=s.state_id
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.regions as r
on p.region=r.region
set c.region=r.regionid
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.`profiles` p
on c.account_id=p.account_id
inner join pfcomm_new.`Profiles` pp
on p.nickname=pp.nickname
set c.mobile_num=pp.phonenumber
where pp.id=NEW.ProfileID;

-- update pfcomm_mig_new.contactdetails c
-- inner join pfcomm_mig_new.`profiles` p
-- on c.account_id=p.account_id
-- inner join pfcomm_new.`Profiles` pp
-- on p.nickname=pp.nickname
-- set c.mobile_num=pp.CONTACT_NUMBER
-- where c.mobile_num=0 and pp.id=NEW.ProfileID;

END IF;

-- PHOTOS AND VIDEOS

IF NEW.Area='Photos'
or NEW.Area='Videos'
or NEW.Area='Albums'
or NEW.Area='PhotoTitle'
or NEW.Area='PhotoViews'
or NEW.Area='SortAlbum'
or NEW.Area='AlbumTitle'
or NEW.Area='VideoStatus'
or NEW.Area='VideoTitle'
or NEW.Area='VideoViews'
or NEW.Area='HomeVideo'
THEN

DELETE FROM pfcomm_mig_new.sys_albums 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
where pp.id=NEW.ProfileID;

DELETE FROM pfcomm_mig_new.rayvideofiles 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
on p.nickname=pn.nickname
where p.id=NEW.ProfileID;

DELETE FROM pfcomm_mig_new.bx_photos_main 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
,`Hash` from pfcomm_new.bx_photos_main
where `owner`=NEW.ProfileID;

update pfcomm_mig_new.bx_photos_main b
inner join pfcomm_new.`Profiles` p
on b.account_id=p.id
inner join pfcomm_mig_new.`profiles` as pp
on p.nickname=pp.nickname
set b.account_id=pp.account_id
where p.id=NEW.ProfileID;

delete from pfcomm_mig_new.sys_albums_objects;
insert into pfcomm_mig_new.sys_albums_objects
select * from pfcomm_new.sys_albums_objects;

END IF;

-- Expecting mother letter
								
IF NEW.Area='letters'
THEN

DELETE FROM pfcomm_mig_new.letter 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
where p.DearBirthParent<>'' and p.id=NEW.ProfileID;

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
where p.letter_aboutThem<>'' and p.id=NEW.ProfileID;

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
where p.agency_letter <>'' and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
on p.nickname=pp.nickname
where p.id=NEW.ProfileID;

update pfcomm_mig_new.letter as l 
inner join pfcomm_new.letters_sort as ls 
on l.PID = ls.profile_id and concat('letter_' , l.PLabel) = ls.label
set l.`sort_order`= ls.order_by
where ls.profile_id=NEW.ProfileID;

END IF;

IF NEW.Area='Profiles'
THEN
-- Updating account table

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname 
set a.role=p.role 
where p.id=NEW.ProfileID; 

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname and p.profileType<>'' 
set a.`role_id`=p.`profileType`
where p.id=NEW.ProfileID;

update pfcomm_mig_new.`account` 
set role_id = 5 
where role_id = 1 
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

update pfcomm_mig_new.`account` 
set role_id = 1 
where role_id = 2
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=1 WHERE a.username=p.nickname and p.ProfileType=2
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);
                                
UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=8 WHERE a.username=p.nickname and p.ProfileType=8
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);
                                
UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=4 WHERE a.username=p.nickname and p.ProfileType=4
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

-- UPDATING PREFERENCE ID'S AND TABLES

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
 WHERE n.n <= 1 + (LENGTH(t.waiting) - LENGTH(REPLACE(t.waiting, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.religion) - LENGTH(REPLACE(t.religion, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ethnicity) - LENGTH(REPLACE(t.ethnicity, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);

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
 WHERE n.n <= 1 + (LENGTH(t.education) - LENGTH(REPLACE(t.education, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.adoptiontype) - LENGTH(REPLACE(t.adoptiontype, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ChildAge) - LENGTH(REPLACE(t.ChildAge, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ChildEthnicity) - LENGTH(REPLACE(t.ChildEthnicity, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.BirthFatherStatus) - LENGTH(REPLACE(t.BirthFatherStatus, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.faith) - LENGTH(REPLACE(t.faith, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.religion_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.religions as r
on rn.religiontext=r.religion
set p.religion_id=r.religionid;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.ethnicity_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.ethnicity as r
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
inner join pfcomm_mig_new.age_group as t
on a.childagetext=t.Age_group
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

delete from pfcomm_mig_new.ethnicity_pref;

insert into pfcomm_mig_new.ethnicity_pref(account_id,ethnicity_id)
select n.account_id,t.Ethnicity_id
from pfcomm_mig_new.childethnicity_new as a
inner join pfcomm_mig_new.ethnicity as t
on a.childethnicitytext=t.ethnicity
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

delete from pfcomm_mig_new.faith_pref;

insert into pfcomm_mig_new.faith_pref(account_id,faith_id)
select n.account_id,t.faith_id
from pfcomm_mig_new.faith_new as a
inner join pfcomm_mig_new.faith as t
on a.faithtext=t.faith
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE a1 FROM pfcomm_mig_new.adoption_type_preference a1
,pfcomm_mig_new.adoption_type_preference a2 
WHERE a1.adoption_type_preference_id < a2.adoption_type_preference_id 
AND a1.account_id = a2.account_id 
AND a1.adoption_type_id=a2.adoption_type_id;

DELETE a1 FROM pfcomm_mig_new.birthfather_pref a1
,pfcomm_mig_new.birthfather_pref a2 
WHERE a1.birthfather_pref_id < a2.birthfather_pref_id 
AND a1.account_id = a2.account_id 
AND a1.birthfather_status_id=a2.birthfather_status_id;

DELETE a1 FROM pfcomm_mig_new.age_group_preference a1
,pfcomm_mig_new.age_group_preference a2 
WHERE a1.age_group_preference_id < a2.age_group_preference_id 
AND a1.account_id = a2.account_id 
AND a1.age_group_id=a2.age_group_id;

DELETE a1 FROM pfcomm_mig_new.ethnicity_pref a1
,pfcomm_mig_new.ethnicity_pref a2 
WHERE a1.ethnicity_pref_id < a2.ethnicity_pref_id 
AND a1.account_id = a2.account_id 
AND a1.ethnicity_id=a2.ethnicity_id;

DELETE a1 FROM pfcomm_mig_new.faith_pref a1
,pfcomm_mig_new.faith_pref a2 
WHERE a1.faith_pref_id < a2.faith_pref_id 
AND a1.account_id = a2.account_id 
AND a1.faith_id=a2.faith_id;

END IF;

IF NEW.Area='letters'
THEN
-- Letter as introduction
 
UPDATE pfcomm_mig_new.`letter` as l
INNER JOIN pfcomm_new.`Profiles` as p 
ON l.pid=p.id and (replace(l.plabel,'about_','')=p.defaultletter or l.label = p.defaultletter)
SET l.`isIntroduction`=1
where p.id=NEW.ProfileID;
END IF;

-- Private families changes

IF NEW.Area='Profiles'
THEN
update pfcomm_mig_new.account a
inner join pfcomm_new.Profiles p
on a.username=p.nickname 
set a.is_protected=p.publishstatus
where p.id=NEW.ProfileID;
END IF;

-- Social icon changes

IF NEW.Area='SocialAcc'
THEN

-- Facebook links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Facebook,pmp.account_id,1 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Facebook` is not null and pp.`Facebook` <> ''
and pp.id=NEW.ProfileID;

-- Twitter Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Twitter,pmp.account_id,2 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Twitter` is not null and pp.`Twitter` <> ''
and pp.id=NEW.ProfileID;

-- Google plus Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Google,pmp.account_id,3 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Google` is not null and pp.`Google` <> ''
and pp.id=NEW.ProfileID;

-- Blogger Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Blogger,pmp.account_id,4 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Blogger` is not null and pp.`Blogger` <> ''
and pp.id=NEW.ProfileID;

-- Pintrest Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Pinerest,pmp.account_id,5 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Pinerest` is not null and pp.`Pinerest` <> ''
and pp.id=NEW.ProfileID;

-- Instagram Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Instagram,pmp.account_id,6 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Instagram` is not null and pp.`Instagram` <> ''
and pp.id=NEW.ProfileID;

END IF;

-- Membership detials

IF NEW.Area='Membership'
THEN

INSERT INTO pfcomm_mig_new.sys_acl_levels_members 
SELECT pp.account_id ,s.IDLevel ,s.DateStarts ,s.DateExpires ,s.TransactionID ,s.Upgrade 
FROM pfcomm_new.sys_acl_levels_members s 
INNER JOIN pfcomm_new.Profiles p 
ON s.idmember=p.id
INNER JOIN pfcomm_mig_new.profiles pp
ON p.nickname=pp.nickname
where p.id=NEW.ProfileID;

END IF;

-- Default contact changes

IF NEW.Area='Profiles'
THEN

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.account a
on c.account_id=a.account_id
inner join pfcomm_new.Profiles p
on a.username=p.nickname
set c.defaultcontact=p.show_contact
,c.allowdefaultcontact=p.allow_contact
where p.id=NEW.ProfileID;

END IF;

IF NEW.Area='changeagency'
THEN

update pfcomm_mig_new.account a
inner join pfcomm_new.Profiles p
on a.username=p.nickname
set a.agency_id=p.AdoptionAgency
where p.id=NEW.ProfileID;

END IF;

ELSEIF NEW.UpdateYN=1 

THEN

IF NEW.Area='Avatar'
THEN

UPDATE pfcomm_mig_new.account as a
inner join pfcomm_new.`Profiles` as p
on a.username=p.nickname 
and nickname not like '%(2)%'
and p.id=NEW.ProfileID
set a.avatar=p.avatar;

END IF;

IF NEW.Area='Profiles' or NEW.Area='PublishStatus' or NEW.Area='ProfileStatus'
THEN

UPDATE pfcomm_mig_new.`profiles` as p
inner join pfcomm_new.`Profiles` as pp
on p.nickname=pp.nickname and (pp.id=NEW.ProfileID or pp.Couple=NEW.ProfileID)
set p.publish_status=pp.publishstatus 
,p.nickname=pp.nickname
,p.modified_at=pp.datelastedit
,p.last_name=pp.lastname
,p.last_login=pp.datelastlogin 
,p.gender=pp.sex 
,p.first_name=pp.firstname
,p.dob=pp.dateofbirth
,p.created_at=pp.datereg;

-- ACCOUNT TABLE

UPDATE pfcomm_mig_new.account as a
inner join pfcomm_new.`Profiles` as p
on a.username=p.nickname 
and nickname not like '%(2)%'
and p.id=NEW.ProfileID
set a.`name`=p.firstname
,a.emailid =p.email
,a.username =p.nickname
,a.`status`=p.`status`
,a.role_id =p.role
,a.created_at =p.DateReg
,a.modified_at =p.datelastedit
,a.`password`=p.`password`
,a.salt=p.salt
,a.avatar=p.avatar
,a.agency_id =p.adoptionagency
,a.profile_no=p.profile_no
,a.profile_year=p.profile_year
,a.zoho_id=p.zoho_id;

-- update pfcomm_mig_new.account as a
-- inner join pfcomm_mig_new.`status` as s
-- on a.`status`=s.status_text
-- set a.`status`=s.status_id
-- where account_id=last_insert_id();

-- UPDATE PROFILES TABLE

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.account as a
on p.nickname=a.username
or p.nickname=concat(a.username,'(2)')
set p.account_id=a.account_id
where a.account_id=(select account_id from pfcomm_mig_new.account 
					where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID));
                                 
-- CHILD TABLE

DELETE FROM pfcomm_mig_new.child 
where Accounts_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				   where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
insert into pfcomm_mig_new.child(
Number_of_childern
,`Type`
,Accounts_id)
select p.noofchildren,'',pp.account_id
from pfcomm_new.`Profiles` p
inner join pfcomm_mig_new.`profiles` pp
on p.nickname=pp.nickname 
where p.noofchildren<>'' and p.id=NEW.ProfileID;

END IF;

-- AQB_PC_MEMBERS_BLOCKS TABLE

IF NEW.Area='Flipbook' or NEW.Area='epub'
THEN

DELETE FROM pfcomm_mig_new.aqb_pc_members_blocks 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
from pfcomm_new.aqb_pc_members_blocks
where owner_id=NEW.ProfileID;

update pfcomm_mig_new.aqb_pc_members_blocks p  
inner join pfcomm_new.`Profiles` pp
on p.account_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.account_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- PDF_TEMPLATE_USER TABLE

IF NEW.Area='pdfs' or NEW.Area='pdfdetails' or NEW.Area='PDF'
THEN

DELETE FROM pfcomm_mig_new.pdf_template_user 
where user_id=(select account_id from(select account_id from pfcomm_mig_new.account 
			   where username=(select nickname from pfcomm_new.`Profiles` 
							   where id=NEW.ProfileID)) as p);
                                  
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
from pfcomm_new.pdf_template_user
where user_id=NEW.ProfileID;

update pfcomm_mig_new.pdf_template_user p  
inner join pfcomm_new.`Profiles` pp
on p.user_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.user_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- BX_GROUPS_MAIN table

IF NEW.Area='Agency'
THEN

DELETE FROM pfcomm_mig_new.bx_groups_main 
where author_id=(select account_id from(select account_id from pfcomm_mig_new.account 
			     where username=(select nickname from pfcomm_new.`Profiles` 
								 where id=NEW.ProfileID)) as p);
                               
insert into pfcomm_mig_new.bx_groups_main 
select * from pfcomm_new.bx_groups_main 
where author_id=NEW.ProfileID;

update pfcomm_mig_new.bx_groups_main p  
inner join pfcomm_new.`Profiles` pp
on p.author_id=pp.id
inner join pfcomm_mig_new.`profiles` pr
on pp.nickname=pr.nickname
set p.author_id=pr.account_id
where pp.id=NEW.ProfileID;

END IF;

-- UPDATE PROFILES

-- update pfcomm_mig_new.`profiles` as p
-- inner join pfcomm_new.`Profiles` as pp
-- on p.nickname=pp.nickname
-- inner join pfcomm_mig_new.`status` as r
-- on pp.`Status`=r.status_text
-- set p.`Status`=r.status_id
-- where pp.id=NEW.ProfileID;

-- CONTACTDETAILS TABLE

IF NEW.Area='Profiles'
THEN

DELETE FROM pfcomm_mig_new.contactdetails 
where Account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
on p.nickname=pp.nickname and p.nickname not like '%(2)%'
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.countries as cc
on cc.country_code=p.country
set c.country=cc.country_id
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.states as s
on p.state=s.state
set c.state=s.state_id
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails as c
inner join pfcomm_mig_new.account as a
on c.account_id=a.account_id
inner join pfcomm_new.`Profiles` as p
on cast(a.username as char(255))=cast(p.NickName as char(255))
inner join pfcomm_mig_new.regions as r
on p.region=r.region
set c.region=r.regionid
where p.id=NEW.ProfileID;

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.`profiles` p
on c.account_id=p.account_id
inner join pfcomm_new.`Profiles` pp
on p.nickname=pp.nickname
set c.mobile_num=pp.phonenumber
where pp.id=NEW.ProfileID;

-- update pfcomm_mig_new.contactdetails c
-- inner join pfcomm_mig_new.`profiles` p
-- on c.account_id=p.account_id
-- inner join pfcomm_new.`Profiles` pp
-- on p.nickname=pp.nickname
-- set c.mobile_num=pp.CONTACT_NUMBER
-- where c.mobile_num=0 and pp.id=NEW.ProfileID;

END IF;

-- PHOTOS AND VIDEOS

IF NEW.Area='Photos'
or NEW.Area='Videos'
or NEW.Area='Albums'
or NEW.Area='PhotoTitle'
or NEW.Area='PhotoViews'
or NEW.Area='SortAlbum'
or NEW.Area='AlbumTitle'
or NEW.Area='VideoStatus'
or NEW.Area='VideoTitle'
or NEW.Area='VideoViews'
or NEW.Area='HomeVideo'
THEN

DELETE FROM pfcomm_mig_new.sys_albums 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
where pp.id=NEW.ProfileID;

DELETE FROM pfcomm_mig_new.rayvideofiles 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
on p.nickname=pn.nickname
where p.id=NEW.ProfileID;

DELETE FROM pfcomm_mig_new.bx_photos_main 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
,`Hash` from pfcomm_new.bx_photos_main
where `owner`=NEW.ProfileID;

update pfcomm_mig_new.bx_photos_main b
inner join pfcomm_new.`Profiles` p
on b.account_id=p.id
inner join pfcomm_mig_new.`profiles` as pp
on p.nickname=pp.nickname
set b.account_id=pp.account_id
where p.id=NEW.ProfileID;

delete from pfcomm_mig_new.sys_albums_objects;
insert into pfcomm_mig_new.sys_albums_objects
select * from pfcomm_new.sys_albums_objects;

END IF;

-- Expecting mother letter

IF NEW.Area='letters'
THEN

DELETE FROM pfcomm_mig_new.letter 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
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
where p.DearBirthParent<>'' and p.id=NEW.ProfileID;

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
where p.letter_aboutThem<>'' and p.id=NEW.ProfileID;

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
where p.agency_letter <>'' and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
and pp.account_id is not null
and p.id=NEW.ProfileID;

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
on p.nickname=pp.nickname
where p.id=NEW.ProfileID;

update pfcomm_mig_new.letter as l 
inner join pfcomm_new.letters_sort as ls 
on l.PID = ls.profile_id and concat('letter_' , l.PLabel) = ls.label
set l.`sort_order`= ls.order_by
where ls.profile_id=NEW.ProfileID;

END IF;

-- Updating account table

IF NEW.Area='Profiles'
THEN

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname 
set a.role=p.role 
where p.id=NEW.ProfileID; 

Update pfcomm_mig_new.`account` as a 
inner join pfcomm_new.`Profiles` as p 
on a.username=p.nickname and p.profileType<>'' 
set a.`role_id`=p.`profileType`
where p.id=NEW.ProfileID;

update pfcomm_mig_new.`account` 
set role_id = 5 
where role_id = 1 
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

update pfcomm_mig_new.`account` 
set role_id = 1 
where role_id = 2
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=1 WHERE a.username=p.nickname and p.ProfileType=2
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);
                                
UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=8 WHERE a.username=p.nickname and p.ProfileType=8
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);
                                
UPDATE `pfcomm_mig_new`.`account` a, `pfcomm_new`.`Profiles` as p 
Set a.role_id=4 WHERE a.username=p.nickname and p.ProfileType=4
and account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				where username=(select nickname from pfcomm_new.`Profiles` 
								where id=NEW.ProfileID)) as p);

-- UPDATING PREFERENCE ID'S AND TABLES

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
 WHERE n.n <= 1 + (LENGTH(t.waiting) - LENGTH(REPLACE(t.waiting, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.religion) - LENGTH(REPLACE(t.religion, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ethnicity) - LENGTH(REPLACE(t.ethnicity, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);

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
 WHERE n.n <= 1 + (LENGTH(t.education) - LENGTH(REPLACE(t.education, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.adoptiontype) - LENGTH(REPLACE(t.adoptiontype, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ChildAge) - LENGTH(REPLACE(t.ChildAge, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.ChildEthnicity) - LENGTH(REPLACE(t.ChildEthnicity, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.BirthFatherStatus) - LENGTH(REPLACE(t.BirthFatherStatus, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
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
 WHERE n.n <= 1 + (LENGTH(t.faith) - LENGTH(REPLACE(t.faith, ',', '')))
 and (t.id=NEW.ProfileID or t.Couple=NEW.ProfileID);
 
update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.religion_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.religions as r
on rn.religiontext=r.religion
set p.religion_id=r.religionid;

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_mig_new.ethnicity_new as rn
on p.nickname=rn.username
inner join pfcomm_mig_new.ethnicity as r
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

DELETE FROM pfcomm_mig_new.birthfather_pref 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
insert into pfcomm_mig_new.birthfather_pref(account_id,birthfather_status_id)
select n.account_id,t.birthfather_status_id
from pfcomm_mig_new.bfstatus_new as a
inner join pfcomm_mig_new.Birthfather_status as t
on a.BFStatustext=t.Birthfather_status
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE FROM pfcomm_mig_new.adoption_type_preference 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);

insert into pfcomm_mig_new.adoption_type_preference(account_id,adoption_type_id)
select n.account_id,t.adoption_type_id
from pfcomm_mig_new.adoptiontype_new as a
inner join pfcomm_mig_new.adoption_type as t
on a.adoptiontypetext=t.adoption_type
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE FROM pfcomm_mig_new.age_group_preference 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
insert into pfcomm_mig_new.age_group_preference(account_id,age_group_id)
select n.account_id,t.age_group_id
from pfcomm_mig_new.childage_new as a
inner join pfcomm_mig_new.age_group as t
on a.childagetext=t.Age_group
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE FROM pfcomm_mig_new.ethnicity_pref 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
insert into pfcomm_mig_new.ethnicity_pref(account_id,ethnicity_id)
select n.account_id,t.Ethnicity_id
from pfcomm_mig_new.childethnicity_new as a
inner join pfcomm_mig_new.ethnicity as t
on a.childethnicitytext=t.ethnicity
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE FROM pfcomm_mig_new.faith_pref 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);

insert into pfcomm_mig_new.faith_pref(account_id,faith_id)
select n.account_id,t.faith_id
from pfcomm_mig_new.faith_new as a
inner join pfcomm_mig_new.faith as t
on a.faithtext=t.faith
inner join pfcomm_mig_new.`profiles` as n
on a.username=n.nickname
where n.account_id is not null;

DELETE a1 FROM pfcomm_mig_new.adoption_type_preference a1
,pfcomm_mig_new.adoption_type_preference a2 
WHERE a1.adoption_type_preference_id < a2.adoption_type_preference_id 
AND a1.account_id = a2.account_id 
AND a1.adoption_type_id=a2.adoption_type_id;

DELETE a1 FROM pfcomm_mig_new.birthfather_pref a1
,pfcomm_mig_new.birthfather_pref a2 
WHERE a1.birthfather_pref_id < a2.birthfather_pref_id 
AND a1.account_id = a2.account_id 
AND a1.birthfather_status_id=a2.birthfather_status_id;

DELETE a1 FROM pfcomm_mig_new.age_group_preference a1
,pfcomm_mig_new.age_group_preference a2 
WHERE a1.age_group_preference_id < a2.age_group_preference_id 
AND a1.account_id = a2.account_id 
AND a1.age_group_id=a2.age_group_id;

DELETE a1 FROM pfcomm_mig_new.ethnicity_pref a1
,pfcomm_mig_new.ethnicity_pref a2 
WHERE a1.ethnicity_pref_id < a2.ethnicity_pref_id 
AND a1.account_id = a2.account_id 
AND a1.ethnicity_id=a2.ethnicity_id;

DELETE a1 FROM pfcomm_mig_new.faith_pref a1
,pfcomm_mig_new.faith_pref a2 
WHERE a1.faith_pref_id < a2.faith_pref_id 
AND a1.account_id = a2.account_id 
AND a1.faith_id=a2.faith_id;

END IF;

-- Letter as introduction

IF NEW.Area='letters'
THEN

UPDATE pfcomm_mig_new.`letter` as l
INNER JOIN pfcomm_new.`Profiles` as p 
ON l.pid=p.id and (replace(l.plabel,'about_','')=p.defaultletter or l.label = p.defaultletter)
SET l.`isIntroduction`=1
where p.id=NEW.ProfileID;

END IF;

-- Private families changes

IF NEW.Area='Profiles'
THEN

update pfcomm_mig_new.account a
inner join pfcomm_new.Profiles p
on a.username=p.nickname 
set a.is_protected=p.publishstatus
where p.id=NEW.ProfileID;

END IF;

-- Social icon changes

IF NEW.Area='SocialAcc'
THEN

-- Facebook links

DELETE FROM pfcomm_mig_new.acc_social_site 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);
                                  
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Facebook,pmp.account_id,1 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Facebook` is not null and pp.`Facebook` <> ''
and pp.id=NEW.ProfileID;

-- Twitter Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Twitter,pmp.account_id,2 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Twitter` is not null and pp.`Twitter` <> ''
and pp.id=NEW.ProfileID;

-- Google plus Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Google,pmp.account_id,3 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Google` is not null and pp.`Google` <> ''
and pp.id=NEW.ProfileID;

-- Blogger Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Blogger,pmp.account_id,4 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Blogger` is not null and pp.`Blogger` <> ''
and pp.id=NEW.ProfileID;

-- Pintrest Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Pinerest,pmp.account_id,5 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Pinerest` is not null and pp.`Pinerest` <> ''
and pp.id=NEW.ProfileID;

-- Instagram Links
insert into pfcomm_mig_new.acc_social_site (url,account_id,website_id) 
SELECT pp.Instagram,pmp.account_id,6 
FROM pfcomm_new.`Profiles` as pp, pfcomm_mig_new.profiles as pmp 
where pp.nickname=pmp.nickname and pp.`Instagram` is not null and pp.`Instagram` <> ''
and pp.id=NEW.ProfileID;

END IF;

-- Membership detials

IF NEW.Area='Membership'
THEN

DELETE FROM pfcomm_mig_new.sys_acl_levels_members 
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);

INSERT INTO pfcomm_mig_new.sys_acl_levels_members 
SELECT pp.account_id ,s.IDLevel ,s.DateStarts ,s.DateExpires ,s.TransactionID ,s.Upgrade 
FROM pfcomm_new.sys_acl_levels_members s 
INNER JOIN pfcomm_new.Profiles p 
ON s.idmember=p.id
INNER JOIN pfcomm_mig_new.profiles pp
ON p.nickname=pp.nickname
where p.id=NEW.ProfileID;

END IF;

-- Default contact changes

IF NEW.Area='Profiles'
THEN

update pfcomm_mig_new.contactdetails c
inner join pfcomm_mig_new.account a
on c.account_id=a.account_id
inner join pfcomm_new.Profiles p
on a.username=p.nickname
set c.defaultcontact=p.show_contact
,c.allowdefaultcontact=p.allow_contact
where p.id=NEW.ProfileID;

END IF;

IF NEW.Area='changeagency'
THEN

update pfcomm_mig_new.account a
inner join pfcomm_new.Profiles p
on a.username=p.nickname
set a.agency_id=p.AdoptionAgency
where p.id=NEW.ProfileID;

END IF;

ELSEIF NEW.DeleteYN=1
THEN

update pfcomm_mig_new.account as a
inner join pfcomm_mig_new.`status` as s
on a.`status`=s.status_text
set a.`status`=s.status_id
where account_id=(select account_id from(select account_id from pfcomm_mig_new.account 
				  where username=(select nickname from pfcomm_new.`Profiles` 
								  where id=NEW.ProfileID)) as p);

update pfcomm_mig_new.`profiles` as p
inner join pfcomm_new.`Profiles` as pp
on p.nickname=pp.nickname
inner join pfcomm_mig_new.`status` as r
on pp.`Status`=r.status_text
set p.`Status`=r.status_id
where pp.id=NEW.ProfileID;

END IF;
END $$
DELIMITER ;


