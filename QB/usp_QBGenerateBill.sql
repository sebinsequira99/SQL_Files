
--usp_QBGenerateBill

--qbvendorbills
--qbchildcategory
--rel_relationship where connectionid=102267
--connectionstatuslog where connectionid=102264

--usp_QBGenerateBill '2015-11-05','2015-11-17'
--usp_QBBillDetails '2015-11-05','2015-11-17'
--select * into qbvendorbills_test from qbvendorbills
--usp_QBGenerateBill -20401,-20403,102267,'2015-11-13','2015-11-26',12.00

--delete from qbvendorbills_test where id>5
--exec usp_QBGenerateBill -20401,-20403,102267,'2015-11-13','2015-11-26',12.00
--exec usp_QBGenerateBill -19390,-20402,102264,'2015-11-13','2015-11-26',20.00

use mapfacqb 

ALTER PROCEDURE usp_QBGenerateBill
(
 @parentconnid	  int
,@childconnid	  int
,@connectionid	  int
,@realfromdate	  datetime
,@realtodate	  datetime
,@unitprice		  decimal(10,2)
)
AS
BEGIN
SET NOCOUNT ON

DECLARE @FromDate datetime
	   ,@ToDate datetime
	   ,@StartDate datetime
	   ,@EndDate datetime
	   ,@start_id int=1
	   ,@end_id int

SET @realfromdate=convert(varchar(10),@realfromdate,20)
SET @realtodate=convert(varchar(10),@realtodate,20)

SELECT 
 pConnID
,cConnID
,connectionID
,fromDate
,toDate
,amount
,generatedOn 
INTO #GeneratedBills
FROM qbvendorbills
WHERE connectionid=@connectionid

ALTER TABLE #GeneratedBills
ADD row_id int identity(1,1)

select @end_id=count(*) from #GeneratedBills 

WHILE(@start_id<=@end_id)

BEGIN

SELECT @StartDate=fromdate 
      ,@EndDate=todate 
FROM #GeneratedBills WHERE row_id=@start_id

IF(@StartDate is null and @EndDate is null)
BEGIN
	SET @StartDate=@realfromdate
	SET @EndDate=@realtodate
END

ELSE IF(@StartDate>=@realfromdate and @EndDate<=@realtodate)
BEGIN

		--Condition 1 multiple rows/first row/startdate=fromdate
		IF ((select count(*) from #GeneratedBills)>1 and @start_id=1 and @StartDate=@realfromdate)
		BEGIN
			SET @StartDate=@EndDate
			SELECT @EndDate=fromdate 
							FROM #GeneratedBills
							WHERE row_id=@start_id+1
			print 'Condition 1 '+cast(@StartDate as varchar(10))
			print 'Condition 1 '+cast(@EndDate as varchar(10))
		END

		--Condition 2 multiple rows/not first row and last row/startdate<>fromdate
		ELSE IF ((select count(*) from #GeneratedBills)>1 and @start_id<>1 and @start_id<>@end_id and @StartDate<>@realfromdate)
		BEGIN
			SET @StartDate=@EndDate
			SELECT @EndDate=fromdate 
							FROM #GeneratedBills
							WHERE row_id=@start_id+1
			print 'Condition 2 '+cast(@StartDate as varchar(10))
			print 'Condition 2 '+cast(@EndDate as varchar(10))
			print @start_id
			print @end_id
		END

		--Condition 3 multiple rows/first row/startdate<>fromdate
		ELSE IF ((select count(*) from #GeneratedBills)>1 and @start_id=1 and @StartDate<>@realfromdate)
		BEGIN
			SET @EndDate=@StartDate
			SET @StartDate=@realfromdate
			print 'Condition 3 '+cast(@StartDate as varchar(10))
			print 'Condition 3 '+cast(@EndDate as varchar(10))

			INSERT INTO qbvendorbills
			(
			 pConnID
			,cConnID
			,connectionID
			,fromDate
			,toDate
			,amount
			,generatedOn
			)
			
			SELECT 
			 @parentconnid	
			,@childconnid	
			,@connectionid	
			,(select toDate from #GeneratedBills where row_id=@start_id)
			,(select fromdate from #GeneratedBills where row_id=@start_id+1)
			,@unitprice*(select datediff(day
						               ,(select toDate from #GeneratedBills where row_id=@start_id)
						               ,(select fromdate from #GeneratedBills where row_id=@start_id+1)))
			,getdate()

		END

		--Condition 4 single row/startdate=fromdate
		ELSE IF ((select count(*) from #GeneratedBills)=1 and @StartDate=@realfromdate)
		BEGIN
			SET @StartDate=@EndDate
			SET @EndDate=@realtodate
			print 'Condition 4 '+cast(@StartDate as varchar(10))
			print 'Condition 4 '+cast(@EndDate as varchar(10))
		END

		--Condition 5 single row/startdate<>fromdate
		ELSE IF ((select count(*) from #GeneratedBills)=1 and @StartDate<>@realfromdate)
		BEGIN
			SET @EndDate=@StartDate
			SET @StartDate=@realfromdate
			print 'Condition 5 '+cast(@StartDate as varchar(10))
			print 'Condition 5 '+cast(@EndDate as varchar(10))
		END

		--Condition 6 multiple rows/last row/endate<todate
		ELSE IF ((select count(*) from #GeneratedBills)>1 and @start_id=@end_id and @enddate<@realtodate)
		BEGIN
			SET @StartDate=@EndDate
			SELECT @EndDate=@realtodate
			print 'Condition 6 '+cast(@StartDate as varchar(10))
			print 'Condition 6 '+cast(@EndDate as varchar(10))
		END
		
		--Condition 7 multiple rows/last row/endate>=todate
		ELSE IF ((select count(*) from #GeneratedBills)>1 and @start_id=@end_id and @enddate>=@realtodate)
		BEGIN
			SET @Enddate=@EndDate
			print 'Condition 7 '+cast(@StartDate as varchar(10))
			print 'Condition 7 '+cast(@EndDate as varchar(10))
		END
END

IF(@enddate<=@realtodate)
BEGIN

	INSERT INTO qbvendorbills
	(
	 pConnID
	,cConnID
	,connectionID
	,fromDate
	,toDate
	,amount
	,generatedOn
	)
	
	SELECT 
	 @parentconnid	
	,@childconnid	
	,@connectionid	
	,@StartDate	
	,@EndDate	
	,@unitprice*(select datediff(day,@StartDate,@EndDate))
	,getdate()

END		

SET @start_id=@start_id+1

END

DROP TABLE #GeneratedBills

SET NOCOUNT OFF

END

