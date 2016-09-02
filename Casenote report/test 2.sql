


rolesqa

contact where fname='red8'

contactactivity where connid=352128
contactactivity where connectionid in (129794,348168)
select * from contactactivity where connectionid=352129


select * from rel_relationship where contactid=97807 or contactid2=97807
select * from rel_relationship where contactid =102045 or contactid2=102045
select connectionid,* from contactactivity where connid=343293
select connid,connectionid,* from contactactivity where connectionid in(129794
,348168)
-97807


EXEC CaseNote_Details_new -102045,211, 100 ,0,NULL,352129,8125,'','DESC',1018
EXEC CaseNote_Details_new 343293,211, 100 ,0,NULL,348168,8125,'','DESC',1018


select *
FROM contactcase cc
join ContactActivity A on cc.caseid = A.caseid
WHERE (A.Connid in (-102045,352128)) 
and (CaseNotes not like '' 
and CaseNotes is not null) 

user_accounts where connid=-101553

CasenoteRpt_StgTbl where clientname like '%med%'

CasenoteRpt_StgTbl where clientname ='june, may'

