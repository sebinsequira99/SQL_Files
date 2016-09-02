

mapat

select  substring(mm.msg_subject,charindex('-',mm.msg_subject,1)+2,len(mm.msg_subject)) as casenote into #casenote from mapmsg_addresses ma 
join mapmsg_message_addresses mma on ma.addressid = mma.addressid
join  mapmsg_messages mm on mm.msg_id = mma.msg_id
where mm.msg_subject like '%casenote%' 
order by mm.msg_datetime desc

select r.subject,c.casenote,r.contactid from RptStgTbl_CounCasenoteBill r
left join #casenote c
on r.subject=c.casenote

drop table #casenote





	