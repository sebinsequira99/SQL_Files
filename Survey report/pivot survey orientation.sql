

--StgTbl_SurveyRpt_147

--drop table #tbl2

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
,[q6]					 varchar(max)
,[q7]					 varchar(max)
,[q8]					 varchar(max)
,[q9]					 varchar(max)
,[q10]				     varchar(max)
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
,[Role]
,[The information on iadoptu.org was clearly organized]
,[The information on iadoptu.org was helpful and I understand what is required to become a Foster/Adoptive Resource Parent.]
,[The information on the video at http://iadoptu.org/content/getting-started was informative regarding the current needs of San Diego Foster and Adoptive Resource Family Services.]
,[My first contact with the Agency was friendly and helpful.]
,[The presentation at the orientation was clear and concise]
,[The presenter at the orientation was knowledgeable and answered all my questions.]
,[The orientation made clear the steps needed to become a Foster/ Adoptive Resource Parent.]
,[What information about the foster/adoptive process was lacking from the iadoptu.org site?]
,[Please provide two suggestions to improve the contents of the http://iadoptu.org/content and the orientation.]
FROM
(SELECT * 
    FROM StgTbl_SurveyRpt_147) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
([Role]
,[The information on iadoptu.org was clearly organized]
,[The information on iadoptu.org was helpful and I understand what is required to become a Foster/Adoptive Resource Parent.]
,[The information on the video at http://iadoptu.org/content/getting-started was informative regarding the current needs of San Diego Foster and Adoptive Resource Family Services.]
,[My first contact with the Agency was friendly and helpful.]
,[The presentation at the orientation was clear and concise]
,[The presenter at the orientation was knowledgeable and answered all my questions.]
,[The orientation made clear the steps needed to become a Foster/ Adoptive Resource Parent.]
,[What information about the foster/adoptive process was lacking from the iadoptu.org site?]
,[Please provide two suggestions to improve the contents of the http://iadoptu.org/content and the orientation.]
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
,t.[q6]	
,t.[q7]	
,t.[q8]	
,t.[q9]	
,t.[q10]	
,s.question
,s.answer

into #tbl2
from #tbl t
join StgTbl_SurveyRpt_147 s
on t.id=s.id

--drop table StgTbl_SurveyRpt_orientation
--select * into StgTbl_SurveyRpt_orientation
--from #tbl2






