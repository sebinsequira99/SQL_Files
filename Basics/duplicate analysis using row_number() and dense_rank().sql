

;with duplicates as(
select row_number()over(partition by invoiceTo
         ,taskID
         ,stageID
         ,phaseID
      order by invoiceTo) as row_no
   ,* 
from payment_invoicemaster
where invoiceto<>0
and isnull(taskID ,0)<>0
and isnull(stageid ,0)<>0
and isnull(phaseID,0)<>0
)

select * into #dups from duplicates

;with ranktbl as( 
select DENSE_RANK()over(order by invoiceTo
         ,taskID
         ,stageID
         ,phaseID) as [rank],* from #dups 
)

select * from ranktbl
where [rank] in(select [rank] from ranktbl where row_no>1)

drop table #dups