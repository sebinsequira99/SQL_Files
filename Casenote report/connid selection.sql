
EXEC CaseNote_Details_new -102045,211, 100 ,0,NULL,352129,8125,'','DESC',1018
EXEC CaseNote_Details_new 343293,211, 100 ,0,NULL,348168,8125,'','DESC',1018

343293
-97807

352128
-102045


select dbo.udf_CoupleConnId(-97807,1)

declare @CoupleConnid varchar(100)
Select @CoupleConnid = dbo.udf_CoupleConnectionID(343293)
print @CoupleConnid


declare @Connid1 varchar(100)
Select @Connid1 = coalesce(dbo.udf_CoupleConnId(343293,0),0)
print @Connid1

declare @Connid2 varchar(100)
Select @Connid2 = coalesce(dbo.udf_CoupleConnId(343293,2),0)
print @Connid2

declare @Connids varchar(100)
Set @Connids = @Connid1 

If @CoupleConnid <> '0' and @CoupleConnid <> ''
Set @Connids = @Connids + ',' + @CoupleConnid
If @Connid2 <> '0'
Set @Connids = @Connids + ',' + @Connid2
print @Connids

contactactivity where connid in(-101056)
select * from rel_relationship where connectionid=343293

usp_clientsearch










