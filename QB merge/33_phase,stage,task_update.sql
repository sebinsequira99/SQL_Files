

formmaker_phases

--alter table formmaker_phases
--add old_phase_id int

--insert into formmaker_phases(
--phase
--,agency_id
--,phase_order
--,default_phase
--,notification_type
--,message_groups
--,caseworkers
--,description
--,parentId
--,effectiveDate
--,old_phase_id)

--select phase
--,234
--,phase_order
--,default_phase
--,notification_type
--,message_groups
--,caseworkers
--,description
--,parentId
--,effectiveDate
--,phase_id
--from mapfac_old_test..formmaker_phases

formmaker_stages

--insert into formmaker_stages(stage_id
--,phase_id
--,stage
--,notification_type
--,message_groups
--,caseworkers
--,stage_old_order)

--select s.stage_id
--,p.phase_id
--,s.stage
--,s.notification_type
--,s.message_groups
--,s.caseworkers
--,s.stage_old_order
--from mapfac_old_test..formmaker_stages s
--inner join formmaker_phases p
--on s.phase_id=p.old_phase_id

formmaker_tasks

--insert into formmaker_tasks(task_id
--,stage_id
--,phase_id
--,task
--,action
--,link
--,form
--,webpage
--,survey
--,event
--,status
--,template
--,notification_type
--,message_groups
--,caseworkers
--,task_order
--,autoApprove
--,old_task_id
--,reference_type
--,reference_mapid
--,document_filter
--,page_document_flg
--,formtype
--,event_sub_cat
--,event_name
--,form_type
--,assigned_to)
--select t.task_id
--,t.stage_id
--,p.phase_id
--,t.task
--,t.action
--,t.link
--,t.form
--,t.webpage
--,t.survey
--,t.event
--,t.status
--,t.template
--,t.notification_type
--,t.message_groups
--,t.caseworkers
--,t.task_order
--,t.autoApprove
--,t.old_task_id
--,t.reference_type
--,t.reference_mapid
--,t.document_filter
--,t.page_document_flg
--,t.formtype
--,t.event_sub_cat
--,t.event_name
--,'G'
--,'AP1'
--from mapfac_old_test..formmaker_tasks t
--inner join formmaker_phases p
--on t.phase_id=p.old_phase_id

formmaker_usergroups

--insert into formmaker_usergroups(
--pg_phase_id
--,pg_group_id
--,pg_order)
--select p.phase_id
--,ug.group_id
--,fu.pg_order 
--from mapfac_old_test..formmaker_usergroups fu
--inner join mapfac_old_test..user_groups u
--on fu.pg_group_id=u.group_id
--inner join user_groups ug
--on u.group_name=ug.group_name
--inner join formmaker_phases p
--on fu.pg_phase_id=p.old_phase_id

--update ft
--set ft.phase_id=p.phase_id
--from formmaker_taskstatus ft
--inner join formmaker_phases p
--on ft.phase_id=p.old_phase_id
--where ImportFlag='Y' 