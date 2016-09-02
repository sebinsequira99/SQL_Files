

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
,[q2]					 varchar(max)
,[q3]					 varchar(max)
,[q4]					 varchar(max)
,[q5]					 varchar(max)
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
,[How did you hear about Adoptions Together's home study services:]
,[Location]
,[Please choose the best situation that describes your family- Family Structure]
,[Parenting Experience]
,[When was your Home Study Completed ?  (Please include month and year)]

FROM
(SELECT * 
    FROM StgTbl_SurveyRpt_111) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
([How did you hear about Adoptions Together's home study services:]
,[Location]
,[Please choose the best situation that describes your family- Family Structure]
,[Parenting Experience]
,[When was your Home Study Completed ?  (Please include month and year)]

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
,t.[q2]	
,t.[q3]	
,t.[q4]	
,t.[q5]		
,s.question
,s.answer

into #tbl2
from #tbl t
join StgTbl_SurveyRpt_111 s
on t.id=s.id

select * into StgTbl_SurveyRpt_HomeStudyServices
from #tbl2






