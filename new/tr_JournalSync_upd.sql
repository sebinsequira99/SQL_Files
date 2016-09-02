

use pfcomm_test;

DROP TRIGGER IF EXISTS tr_JournalSync_upd;

DELIMITER $$

CREATE TRIGGER tr_JournalSync_upd
AFTER UPDATE ON pfcomm_test.bx_blogs_posts
FOR EACH ROW

BEGIN

-- JOURNALS
					
DELETE FROM pfcomm_mig_job.bx_blogs_posts 
where account_id=(select account_id from(select account_id from pfcomm_mig_job.account 
				  where username=(select nickname from pfcomm_test.`Profiles` 
								  where id=NEW.OwnerID)) as p);

insert into pfcomm_mig_job.bx_blogs_posts(PostCaption
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
,account_id
,Categories
,allowView
,allowRate
,allowComment
,slug)
select PostCaption
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
,Categories
,allowView
,allowRate
,allowComment
,''
from pfcomm_test.bx_blogs_posts
where OwnerID=NEW.OwnerID;

update pfcomm_mig_job.bx_blogs_posts p
inner join pfcomm_test.`Profiles` pp
on p.account_id=pp.id
inner join pfcomm_mig_job.`profiles` pr
on pp.nickname=pr.nickname
set p.account_id=IFNULL(pr.account_id,0)
where pp.id=NEW.OwnerID;

END $$
DELIMITER ;



