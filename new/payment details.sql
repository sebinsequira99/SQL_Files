

select concat(ua.first_name,' ',ua.last_name) as ClientName
,invoice_name
,description
,invoiceamount
,paiddate
,CASE
 WHEN p.status=0  THEN 'Paid w/ECheck'
 WHEN p.status=1  THEN 'Paid w/Credit Card'
 WHEN p.status=2  THEN 'Paid w/Check'
 WHEN p.status=3  THEN 'Paid w/Other'
 WHEN p.status=4  THEN 'Not Paid'
 WHEN p.status=5  THEN 'Not Notified'
 WHEN p.status=6  THEN 'Payment Sent'
 WHEN p.status=7  THEN 'Received Check'
 WHEN p.status=8  THEN 'Paid Cash'
 WHEN p.status=10 THEN 'Refund'
 WHEN p.status=12 THEN 'Over Payment'
 END as [Status]
,p.taskid
,p.stageid
,p.phaseid
,p.createddate
,p.expensedate
,p.actualduedate
,p.invoiceto
,abs(p.connid) as contactid
from mapfac..payment_invoicemaster p
inner join mapfac..user_accounts ua
on p.invoiceto=ua.user_id








