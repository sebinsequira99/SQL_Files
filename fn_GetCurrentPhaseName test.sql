
maplmi

and (isnull(fts.approve,1)<>0 and isnull(fts.task_status,'')<>'done')

select * from sys.objects where name like '%formmaker%' and type='u'

USP_TaskStatusList -24084,67358

select * from information_schema.columns where column_name like '%task%'

select * from user_accounts where last_name like'%Keeney%'
select * from rel_relationship where displayname like'%Keeney, Jennifer%'
84115
12681 -26057  84117 896
rel_relationship where connectionid=93936

12927
-26702
95444

SELECT dbo.fn_GetCurrentPhaseName (12899, -26620, 93936, 320, 0) AS current_phase --Homestudy

SELECT dbo.fn_GetCurrentPhaseName (12681, -26057, 84117, 896, 0) AS current_phase
SELECT dbo.fn_GetCurrentPhaseName (12681, 84115, 84117, 896, 0) AS current_phase

SELECT dbo.fn_GetCurrentPhaseName (9584, -24084, 67358, 347, 0) AS current_phase
SELECT dbo.fn_GetCurrentPhaseName (9584, 67356, 67358, 347, 0) AS current_phase

SELECT dbo.fn_GetCurrentPhaseName (12927,-26702, 95444, 82, 0) AS current_phase

declare @User_Id int = 12927, 
@ConnId int = -26702,
@Connectionid int = 95444,
@GrpId int = 82,
@GetPhaseId int = 0

 --select phase_id, phase  from formmaker_phases fp  

 --                                   where  

 --                                   fp. phase_id =   

 --                                   (  

                                    SELECT fd.disable,fts.approve,ft.task,fts.task_status,pg_phase_id,* FROM formmaker_usergroups fug  

                                    left join formmaker_tasks ft ON(ft.phase_id = fug.pg_phase_id )  

                                    left join formmaker_client_disable fd ON(fd.phase_id  = ft.phase_id  

                                    and (fd.user_id =@User_Id or fd.connid = @ConnId) and fd.stage_id=ft.stage_id and fd.task_id = ft.task_id  

                                    and fd.connectionid = @Connectionid)  

                                    left join formmaker_taskstatus fts ON  

                                    (fts.phase_id  = ft.phase_id and (fts.user_id = @User_Id or fts.connid =@ConnId) and fts.stage_id=ft.stage_id   

                                    and fts.task_id = ft.task_id and fts.connectionid = @Connectionid)  

                                    WHERE fug.pg_group_id =@GrpId  

                                    AND (  

           (ISNULL(fd.disable,'N') = 'N'   or fd.disable = '')  )

   --                                 AND   

   --        (ISNULL(fts.approve,0) != 1)  
   --  )
	  --and isnull(fts.task_status,'')<>'done'
      order by fug.pg_order    
           





declare @User_Id int = 12927, 
@ConnId int = -26702,
@Connectionid int = 95444,
@GrpId int = 82,
@GetPhaseId int = 0


select fts.approve,* from formmaker_taskstatus fts
left join formmaker_usergroups fug on fts.phase_id = fug.pg_phase_id
WHERE fug.pg_group_id =@GrpId and (fts.user_id = @User_Id or fts.connid =@ConnId) 
and fts.connectionid = @Connectionid and fts.approve<>1

formmaker_taskstatus where approve=0

user_accounts where user_id=12899

user_groups where group_id=320





select * into formmaker_taskstatus_14_09_15 from formmaker_taskstatus

delete from formmaker_taskstatus
where phase_id=1797 and (user_id=9584 or connid=-24084) and connectionid=67358 


declare @User_Id int = 12927, 
@ConnId int = -26702,
@Connectionid int = 95444,
@GrpId int = 82,
@GetPhaseId int = 0

select ft.task,fts.approve from formmaker_tasks ft
join formmaker_taskstatus fts
on fts.phase_id=ft.phase_id
where fts.phase_id=167 and
(fts.user_id=12927 or fts.connid=-26702) and fts.connectionid=95444



SELECT fts.approve,ft.task,pg_phase_id,link,* FROM formmaker_usergroups fug  

left join formmaker_tasks ft ON(ft.phase_id = fug.pg_phase_id )   

left join formmaker_taskstatus fts ON  

(fts.phase_id  = ft.phase_id and (fts.user_id = 12927 or fts.connid =-26702) and fts.stage_id=ft.stage_id   

and fts.task_id = ft.task_id and fts.connectionid = 95444)  

WHERE fug.pg_group_id =82 and fug.pg_phase_id=167


select phase_id, phase  from formmaker_phases fp  
where  
fp. phase_id =  1893


drop table #dups

select user_id,phase_id,task_id,approve,row_number()over(partition by user_id,phase_id,task_id order by user_id) as dup
into #dups
from formmaker_taskstatus 
order by row_number()over(partition by user_id,phase_id,task_id order by user_id)

select distinct user_id from #dups
where dup>1


