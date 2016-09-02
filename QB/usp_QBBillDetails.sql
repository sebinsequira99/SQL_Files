
--usp_QBBillDetails

--qbvendorbills
--qbchildcategory
--rel_relationship where connectionid=102267
--connectionstatuslog where connectionid=102264

--usp_QBBillDetails '2015-11-05','2015-11-17'

ALTER PROCEDURE usp_QBBillDetails
(
 @FromDate datetime
,@ToDate datetime
)
AS
BEGIN
SET NOCOUNT ON

DECLARE @StartDate datetime
	   ,@EndDate datetime

SET @StartDate=convert(varchar(10),@FromDate,20)
SET @EndDate=convert(varchar(10),@ToDate,20)

SELECT 
 replace(r.displayname,'amp;','') as ParentName
,c1.lname+', '+c1.fname as ChildName
,IM.Name as CategoryName 
,IM.UnitPrice
,CASE 
 WHEN r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate and r.ConnectionStatusId<>-12
 THEN DATEDIFF(day,r.relationshipdatelastupdated,@EndDate) 
 WHEN r.ConnectionStatusId=-12 and r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate
 THEN DATEDIFF(day,@StartDate,r.relationshipdatelastupdated) 
 WHEN r.relationshipdatelastupdated <=@StartDate and r.ConnectionStatusId<>-12
 THEN DATEDIFF(day,@StartDate,@EndDate) 
 ELSE null
 END
 as NoOfDays 
,UnitPrice * (select 
 CASE 
 WHEN r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate and r.ConnectionStatusId<>-12
 THEN DATEDIFF(day,r.relationshipdatelastupdated,@EndDate) 
 WHEN r.ConnectionStatusId=-12 and r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate
 THEN DATEDIFF(day,@StartDate,r.relationshipdatelastupdated) 
 WHEN r.relationshipdatelastupdated <=@StartDate and r.ConnectionStatusId<>-12
 THEN DATEDIFF(day,@StartDate,@EndDate) 
 ELSE null
 END) as Total
,r.connectionid
,r.relationshipdatelastupdated
,r.ConnectionStatusId
,lc.ConnectionStatusText
,parentconnid
,r.contactid as parentcontactid
,childconnid
,c1.contactid as childContactId
,connid
,relenddate
,user_id as parentuserid
,categoryId
,r.createdby
,r.createddate
,modifiedby
,updatedby
,@FromDate as Input_FromDate
,@ToDate as Input_ToDate
,CASE 
 WHEN r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate and r.ConnectionStatusId<>-12
 THEN r.relationshipdatelastupdated
 WHEN r.ConnectionStatusId=-12 and r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate
 THEN @StartDate
 WHEN r.relationshipdatelastupdated <=@StartDate and r.ConnectionStatusId<>-12
 THEN @StartDate
 ELSE null
 END
 as Real_FromDate 
,CASE 
 WHEN r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate and r.ConnectionStatusId<>-12
 THEN @EndDate
 WHEN r.ConnectionStatusId=-12 and r.relationshipdatelastupdated >= @StartDate and r.relationshipdatelastupdated < @EndDate
 THEN r.relationshipdatelastupdated
 WHEN r.relationshipdatelastupdated <=@StartDate and r.ConnectionStatusId<>-12
 THEN @EndDate
 ELSE null
 END
 as Real_ToDate 

FROM QBChildCategory CC

JOIN QBItemMaster IM

ON CC.CategoryId=IM.QBItemMasterID and

IM.name like '%age %'

JOIN Rel_relationship R

ON CC.connectionid=R.connectionid

AND r.relationshiptypeid=43

LEFT JOIN contact c1

ON abs(cc.childconnid)=c1.contactid

LEFT JOIN lkpconnectionstatus lc

ON r.ConnectionStatusId=lc.ConnectionStatusId

WHERE r.relationshipdatelastupdated < @EndDate

SET NOCOUNT OFF

END

