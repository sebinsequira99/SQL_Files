

select * into StgTbl_SurveyRpt_147_bak
from StgTbl_SurveyRpt_147
drop table StgTbl_SurveyRpt_147_bak


 WITH TempEmp (parent_name,question,duplicateRecCount)
AS
(
SELECT parent_name,question,ROW_NUMBER() OVER(PARTITION by parent_name,question ORDER BY parent_name) 
AS duplicateRecCount
FROM StgTbl_SurveyRpt_147_bak
)
--Now Delete Duplicate Records
DELETE FROM TempEmp
WHERE duplicateRecCount > 1 
 --See affected table
Select * from StgTbl_SurveyRpt_147_bak

select * from StgTbl_SurveyRpt_147_bak
group by id
,Campaign_id
,Survey_Name
,Parent_name
,Email
,City
,Phone
,CaseNumber
,Survey_Completion_Date
,question
,answer

SELECT question,ROW_NUMBER() OVER(PARTITION by question ORDER BY parent_name) 
AS row_no
FROM StgTbl_SurveyRpt_147_bak

select * into 
StgTbl_SurveyRpt_orientation_bak
from StgTbl_SurveyRpt_orientation

drop table StgTbl_SurveyRpt_orientation_bak


declare @answer varchar(100)
select @answer=answer from StgTbl_SurveyRpt_orientation_bak
where answer=q2 and parent_name='SARA KELLEY'
print @answer

update StgTbl_SurveyRpt_orientation_bak
set q2=@answer where parent_name='SARA KELLEY'