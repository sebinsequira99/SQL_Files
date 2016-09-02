

use pfcomm_api_mig;

describe pfcomm_api.bx_photos_main

truncate table pfcomm_api_mig.bx_photos_main;

insert into pfcomm_api_mig.bx_photos_main(
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

update pfcomm_api_mig.bx_photos_main b
inner join pfcomm_new.Profiles p
on b.account_id=p.id
inner join pfcomm_api_mig.profiles as pp
on p.nickname=pp.nickname
set b.account_id=pp.account_id;




