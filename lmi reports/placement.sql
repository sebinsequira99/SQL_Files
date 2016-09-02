

use maplmi

IF exists (select 1 from sys.objects where name='StgTbl_PlacementRpt' and type='u')
DROP TABLE StgTbl_PlacementRpt;

;with placed as(
SELECT DISTINCT
   ISNULL(C.FName,'')+' '+ISNULL(C.LName,'') As ChildName
  , R1.RelLabel As CaseNo
  , C.Gender
  , CASE WHEN R2.Connectionid is null then 'Not Placed' Else 'Placed' END PlacedYN
  , Isnull(C1.FName,'')+' '+Isnull(C1.LName,'')+' '+Isnull(C2.FName,'')+' '+Isnull(C2.LName,'')as ParentsName 
  , LS.statename AS ParentState
  , CT.CountryText AS ParentCountry
  , LC.CountryText AS ChildCountry
  , R2.RelLabel AS ParentCaseNo
  --, R2.RelationshipDateLastUpdated AS PlacedDate
  , Case WHEN R2.RelationshipDateLastUpdated >R1.RelationshipDateLastUpdated Then R2.RelationshipDateLastUpdated ELSE R1.RelationshipDateLastUpdated END AS PlacedDate
  , UE.user_id
  , Ue.Connectionid
  , Ue.Connid

FROM 
Contact c
INNER JOIN USER_accounts UA WITH(NOLOCK)  ON ABS(UA.Connid) = C.ContactId
INNER JOIN Rel_relationship R1 WITH(NOLOCK) ON (R1.ContactID = C.ContactID OR R1.ContactID2=C.ContactID) AND R1.RelationshipTypeId = -104
INNER JOIN rel_relationship R2 WITH(NOLOCK) ON R1.Connectionid = R2.Connectionid AND R2.RelationshipTypeId = -101
LEFT JOIN Contact C1 WITH(NOLOCK) ON C1.Contactid = R2.ContactId 
LEFT JOIN Contact C2 WITH(NOLOCK) ON C2.Contactid = R2.ContactId2 
LEFT JOIN Contactaddress CA WITH(NOLOCK) ON CA.ContactId = C1.ContactId and CA.mailingaddress=1 
--or CA.ContactId=C2.Contactid
LEFT JOIN Contactaddress CAC WITH(NOLOCK) ON CAC.ContactId = C.ContactId and CAC.mailingaddress=1
LEFT JOIN lkpCountry CT WITH(NOLOCK) ON CT.CountryID = CA.Countryid
LEFT JOIN lkpCountry LC WITH(NOLOCK) ON LC.CountryID = CAC.Countryid
LEFT JOIN lkpstate LS WITH(NOLOCK) ON LS.stateID = CA.stateid
LEFT JOIN User_effectivedate UE WITH(NOLOCK) ON UE.user_id = UA.user_id AND R1.Connectionid = UE.connectionid 
WHERE  R1.RelationshipTypeId = -104 and  LTRIM(RTRIM(ISNULL(C.FName,'')+' '+ISNULL(C.LName,''))) !=''
)

select * into StgTbl_PlacementRpt
from placed
where placedyn='placed'
order by childname

;with dup as 
(
select row_number()over(partition by ChildName
									,ParentsName
									,ChildCountry
									,placeddate
order by childname) as slno,* from StgTbl_PlacementRpt
)

delete from dup
where slno>1

alter table StgTbl_PlacementRpt
add PhysicalPlacementDate datetime

update p
set p.PhysicalPlacementDate=f.date1
from StgTbl_PlacementRpt p
join fastfactdata f
on p.connectionid=f.connectionid
where f.Rel_CustomTemplateId=-147