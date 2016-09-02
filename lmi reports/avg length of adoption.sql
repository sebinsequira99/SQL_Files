

use maplmi

IF exists (select 1 from sys.objects where name='StgTbl_AdoptionlengthRpt' and type='u')
DROP TABLE StgTbl_AdoptionlengthRpt;

;with adoptionlength as
(
SELECT replace(r.displayname,'&amp;','&') as ClientName
	  ,r.createddate as StartDate
	  ,p.placeddate as PlacementDate
	  ,r.connectionid
	  ,r.relationshiptypeid
	  ,p.PhysicalPlacementDate
from StgTbl_PlacementRpt p
join rel_relationship r
on p.connectionid=r.connectionid and (relationshiptypeid=-101 or relationshiptypeid=-104)
)

select * into StgTbl_AdoptionlengthRpt
from adoptionlength

ALTER TABLE StgTbl_AdoptionlengthRpt
ADD AvgLenOfAdoption int

UPDATE s
SET s.StartDate=c.ConnectionStatusStartDate
from StgTbl_AdoptionlengthRpt s
join connectionstatuslog c
on s.connectionid=c.connectionid
where s.StartDate is null

UPDATE StgTbl_AdoptionlengthRpt
SET AvgLenOfAdoption=DATEDIFF(day,StartDate,PhysicalPlacementDate)

delete from StgTbl_AdoptionlengthRpt
where AvgLenOfAdoption is null or AvgLenOfAdoption<0

;with dup as 
(
select row_number()over(partition by clientname
order by AvgLenOfAdoption desc) as slno,* from StgTbl_AdoptionlengthRpt
)

delete from dup
where slno>1

