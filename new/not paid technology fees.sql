

mapfcs

formmaker_tasks where task like '%technology%'

formmaker_phases where phase_id in(
1980
,1976
,1973
,1975)

formmaker_usergroups where pg_phase_id in(
1980
,1976
,1973
,1975)

formmaker_taskstatus where user_id in(select user_id from user_effectivedate where group_id in(903
,906
,901
,897) and eff_status='Y')
and ((task_id=21		and stage_id=1	and phase_id=1980)
or (task_id=29		and stage_id=1	and phase_id=1976)
or (task_id=42		and stage_id=1	and phase_id=1973)
or (task_id=42		and stage_id=1	and phase_id=1975))

user_accounts where user_id in(
select user_id from user_effectivedate where group_id in(903
,906
,901
,897) and eff_status='Y' and user_id not in(
107902
,108670
,113310
,108718
,113322
,108685
,113321
,113621
,108420
,113416
,113617))


