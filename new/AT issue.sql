 
 

mapat

EXEC CaseNote_Details_new -98051,25, 100 ,0,NULL,438410,257,'','DESC',0

EXEC CaseNote_Details_new -98051,25, 100 ,0,NULL,0,257,'','DESC',0

select * from rel_relationship where ConnectionId= 438410

select * from ContactActivity where  connectionid=315276 and connid=-98051

select * into ContactActivity_060117 from ContactActivity where  connectionid=315276 and connid=-98051

--update ContactActivity 
--set ConnectionId= 438410 
--where connectionid=315276 and connid=-98051