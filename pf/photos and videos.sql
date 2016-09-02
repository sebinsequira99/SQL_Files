

use pfcomm_api;

drop table pfcomm_api.sys_albums_objects;

describe pfcomm_api.rayvideofiles
show create table pfcomm_api.sys_albums;
select * from pfcomm_api.profiles_new where account_id=4120
select * from pfcomm.Profiles 
select * from pfcomm_api.bx_photos_main
truncate table pfcomm_api.rayvideofiles

select * from pfcomm.Profiles where nickname like 'BobandKarin%'
select * from pfcomm_api.sys_albums where uri='profile-pictures'
select * from pfcomm.sys_albums where uri='profile-pictures' and owner in(7528
,7529)
select * from pfcomm.sys_albums_objects
select * from pfcomm_api.sys_albums_objects
select * from pfcomm.rayvideofiles
select * from pfcomm_api.rayvideofiles

insert into pfcomm_api.sys_albums(
ID
,Caption
,Uri
,Location
,Description
,Type
,account_id
,Status
,Date
,ObjCount
,LastObjId
,AllowAlbumView)
select  p.ID
,p.Caption
,p.Uri
,p.Location
,p.Description
,p.Type
,pn.account_id
,p.Status
,p.Date
,p.ObjCount
,p.LastObjId
,p.AllowAlbumView 
from pfcomm.sys_albums as p
inner join pfcomm.Profiles as pp
on p.owner=pp.id
inner join pfcomm_api.profiles_new as pn
on pp.nickname=pn.username
where pp.nickname not in('BobandKarin(2)','Dan-Laura(2)','eranney(2)','jenanddan(2)');

create table pfcomm_api.sys_albums_objects
select * from pfcomm.sys_albums_objects

insert into pfcomm_api.rayvideofiles(
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
from pfcomm.rayvideofiles as r
inner join pfcomm.Profiles as p
on r.owner=p.id
inner join pfcomm_api.profiles_new as pn
on p.nickname=pn.username


