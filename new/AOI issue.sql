


select * from mapaoi..payment_invoicemaster where invoiceAmount=50.00
order by paiddate desc

select * from mapaoi..formmaker_taskstatus where stage_id=1
and task_id=17
and phase_id=1826
order by dateposted desc

select * from mapaoi..formmaker_submissions where connectionid=12944 

select * from mapaoi..formmaker_taskstatus where connectionid=12944 and stage_id=1
and task_id=17
and phase_id=1826

select * from mapaoi..formmaker_tasks where stage_id=1
and task_id=17
and phase_id=1826