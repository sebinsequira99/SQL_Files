

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
,[q8]					varchar(max)
,[q9]					varchar(max)
,[q10]					varchar(max)
,[q11]					varchar(max)
,[q12]					varchar(max)
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
,[My Adoption Portal (MAP) was easy to use.]
,[The County provided me with detailed background information regarding my child.]
,[County Staff was responsive during the entire adoption process.]
,[The Adoption social worker explained potential delays in the adoption process.]
,[The Adoption social worker gave me accurate timeframes in which my adoption would be completed.]
,[County Staff provided me with valuable post adoption resources.]
,[I am satisfied with the Adoption social worker’s visits with our child.] 
,[I will refer my family and friends to San Diego County to adopt a child.]
,[Overall, what was your impression of the services offered by San Diego County Adoptions?]
,[What three things would improve the adoption process?]
,[Do you have suggestions for how to improve the use of My Adoption Portal (MAP)?]
,[Any additional comments regarding the overall process?]

FROM
(SELECT * 
    FROM StgTbl_SurveyRpt_149) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
(
 [My Adoption Portal (MAP) was easy to use.]
,[The County provided me with detailed background information regarding my child.]
,[County Staff was responsive during the entire adoption process.]
,[The Adoption social worker explained potential delays in the adoption process.]
,[The Adoption social worker gave me accurate timeframes in which my adoption would be completed.]
,[County Staff provided me with valuable post adoption resources.]
,[I am satisfied with the Adoption social worker’s visits with our child.] 
,[I will refer my family and friends to San Diego County to adopt a child.]
,[Overall, what was your impression of the services offered by San Diego County Adoptions?]
,[What three things would improve the adoption process?]
,[Do you have suggestions for how to improve the use of My Adoption Portal (MAP)?]
,[Any additional comments regarding the overall process?]
)) 
AS PivotTable

SELECT 
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
,t.[q8]
,t.[q9]
,t.[q10]
,t.[q11]
,t.[q12]
,s.question
,s.answer
into #tbl2
from #tbl t
join StgTbl_SurveyRpt_149 s
on t.id=s.id

select * into StgTbl_SurveyRpt_Finalization
from #tbl2


