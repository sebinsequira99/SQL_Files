

select * from pfcomm_api_mig.aqb_pc_members_blocks;
select * from pfcomm_api_mig.pdf_template_user;
select * from pfcomm.aqb_pc_members_blocks;
select * from pfcomm.pdf_template_user;


select * from pfcomm_api_mig.Profiles where account_id=4657


describe pfcomm.pdf_template_user;

truncate table pfcomm_api_mig.aqb_pc_members_blocks;

insert into pfcomm_api_mig.aqb_pc_members_blocks(
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
from pfcomm.aqb_pc_members_blocks;

update pfcomm_api_mig.aqb_pc_members_blocks p  
inner join pfcomm.Profiles pp
on p.account_id=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.account_id=pr.account_id;


truncate table pfcomm_api_mig.pdf_template_user;

insert into pfcomm_api_mig.pdf_template_user(
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
from pfcomm.pdf_template_user;

update pfcomm_api_mig.pdf_template_user p  
inner join pfcomm.Profiles pp
on p.user_id=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.user_id=pr.account_id;


truncate table pfcomm_api_mig.bx_groups_main ;

insert into pfcomm_api_mig.bx_groups_main select * from pfcomm.bx_groups_main ;

update pfcomm_api_mig.bx_groups_main p  
inner join pfcomm.Profiles pp
on p.author_id=pp.id
inner join pfcomm_api_mig.profiles pr
on pp.nickname=pr.nickname
set p.author_id=pr.account_id;








