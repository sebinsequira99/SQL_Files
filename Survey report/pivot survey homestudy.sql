

create table #tbl
(id						int
,Campaign_id		    int
,Survey_Name			varchar(max)
,Parent_name			varchar(max)
,Email					varchar(max)
,City					varchar(max)
,Phone					varchar(max)
,CaseNumber				varchar(max)
,Survey_Completion_Date	date
,[q1]					varchar(max)
,[q2]					varchar(max)
,[q3]					varchar(max)
,[q4]					varchar(max)
,[q5]					varchar(max)
,[q6]					varchar(max)
,[q7]					varchar(max)
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
,[I knew what to expect regarding the Home Study process.]
,[The Adoption social worker was courteous.]
,[The Adoption social worker kept me informed regarding the progress of my Home Study.]
,[The Adoption social worker was prompt in answering phone calls and setting up appointments.]
,[The Adoption social worker provided me with the different steps of the adoption process.]
,[I am satisfied with the Adoption Home Study process.]
,[Please provide two suggestions that would improve the Home Study process.]

FROM
(SELECT * 
    FROM StgTbl_SurveyRpt_148) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
(
 [I knew what to expect regarding the Home Study process.]
,[The Adoption social worker was courteous.]
,[The Adoption social worker kept me informed regarding the progress of my Home Study.]
,[The Adoption social worker was prompt in answering phone calls and setting up appointments.]
,[The Adoption social worker provided me with the different steps of the adoption process.]
,[I am satisfied with the Adoption Home Study process.]
,[Please provide two suggestions that would improve the Home Study process.]
)) 
AS PivotTable


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
,t.[q6]
,t.[q7]
,s.question
,s.answer
into #tbl2
from #tbl t
join StgTbl_SurveyRpt_148 s
on t.id=s.id

select * into StgTbl_SurveyRpt_HomeStudy
from #tbl2


