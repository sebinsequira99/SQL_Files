

create table #tbl
(id						 int
,Campaign_id			 int
,Survey_Name			 varchar(max)
,Parent_name			 varchar(max)
,Email					 varchar(max)
,City					 varchar(max)
,Phone					 varchar(max)
,CaseNumber				 varchar(max)
,Survey_Completion_Date	 date
,[q1]					 varchar(max)
)

insert into #tbl

SELECT 
 id
,Campaign_id
,Survey_Name
,Parent_name
,Email
,City
,Phone
,CaseNumber
,Survey_Completion_Date
,[Please tell us why you signed up for this seminar (check all that apply):]

FROM
(SELECT * 
    FROM StgTbl_SurveyRpt_110) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
([Please tell us why you signed up for this seminar (check all that apply):]
)) AS PivotTable


select 
 t.id
,t.Campaign_id
,t.Survey_Name
,t.Parent_name
,t.Email
,t.City
,t.Phone
,t.CaseNumber
,t.Survey_Completion_Date
,t.[q1]	
,s.question
,s.answer

into #tbl2
from #tbl t
join StgTbl_SurveyRpt_110 s
on t.id=s.id

select * into StgTbl_SurveyRpt_FamilyForeverEvaluation
from #tbl2






