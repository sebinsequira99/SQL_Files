


ALTER FUNCTION [dbo].[fn_GetCurrentPhaseName](@User_Id int,@ConnId Int,@Connectionid Int, @GrpId int ,@GetPhaseId bit)  
    RETURNS varchar(50)  
AS   
BEGIN  
  
Declare @PhaseName as varchar(50)  
DECLARE @phaseID as Varchar(50)  

;with phases as
(
SELECT fd.disable,fts.approve,ft.task,fts.task_status,pg_phase_id,fts.stage_id
,fts.task_id,pg_order,fts.user_id,fts.connectionid
,row_number() over(partition by pg_phase_id,fts.stage_id,fts.task_id,ft.task,fts.connectionid order by approve desc)
as dup
FROM formmaker_usergroups fug  
left join formmaker_tasks ft ON(ft.phase_id = fug.pg_phase_id )  
left join formmaker_client_disable fd ON(fd.phase_id  = ft.phase_id  
and (fd.user_id =@User_Id or fd.connid = @ConnId) and fd.stage_id=ft.stage_id and fd.task_id = ft.task_id  
and fd.connectionid = @Connectionid)  
left join formmaker_taskstatus fts ON  
(fts.phase_id  = ft.phase_id and (fts.user_id = @User_Id or fts.connid =@ConnId) and fts.stage_id=ft.stage_id   
and fts.task_id = ft.task_id and fts.connectionid = @Connectionid)  
WHERE fug.pg_group_id =@GrpId  
AND 
  (ISNULL(fd.disable,'N') = 'N'   or fd.disable = '')
  )

select @phaseID=phase_id,@PhaseName= phase  from formmaker_phases fp  
where fp. phase_id = 
(select top 1 pg_phase_id from phases
where dup=1 and isnull(approve,0)<>1
order by pg_order)   

        if(@GetPhaseId=1)  
        SET @PhaseName=@phaseID  
          
    RETURN @PhaseName  
END  










