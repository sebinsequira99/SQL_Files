

describe pfcomm.bx_blogs_posts;

select * from pfcomm.bx_blogs_posts;
select * from pfcomm_api_mig.bx_blogs_posts;
select * from pfcomm.Profiles where id=6933
select * from pfcomm_api_mig.Profiles where nickname='PeteandSarah'

truncate table pfcomm_api_mig.bx_blogs_posts

alter table pfcomm_api_mig.bx_blogs_posts
add OwnerID int

insert into pfcomm_api_mig.bx_blogs_posts(PostID
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
from pfcomm.bx_blogs_posts

update pfcomm_api_mig.bx_blogs_posts p
inner join pfcomm.Profiles pp
on p.OwnerID=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.account_id=IFNULL(pr.account_id,0)

alter table pfcomm_api_mig.bx_blogs_posts
drop column OwnerID 

