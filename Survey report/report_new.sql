

use rolesqa

drop table StgTbl_SurveyRpt_qa

truncate table StgTbl_SurveyRpt

insert into StgTbl_SurveyRpt
select * from mapsdc.dbo.StgTbl_SurveyRpt where campaign_id=143

select * into StgTbl_SurveyRpt_146
from mapsdc.dbo.StgTbl_SurveyRpt where campaign_id=146

select * into StgTbl_SurveyRpt_147
from mapsdc.dbo.StgTbl_SurveyRpt where campaign_id=147

select * from rptfilters where reportid=-45

--delete from rptFiltersAssigned where filterid=1320
--delete from rptfilters where filterid=1320

--select * into rptfilters_bak from rptfilters

insert into lkplookuptable(LkpName,DisplayField,ValueField,Query,Parameter)
values(
'Orientation_Survey_Answers'	
,'Orientation_Survey_Answers'	
,'Orientation_Survey_Answers'	
,'select distinct answer as Orientation_Survey_Answers from mapsdc.dbo.surveypro_answers where question_id in(select question_id from mapsdc.dbo.surveypro_questions where campaign_id=147)'	
,NULL)

SELECT DISTINCT len(question) as length,question as Orientation_Survey_questions from mapsdc.dbo.surveypro_questions where campaign_id=147
SELECT DISTINCT answer as Orientation_Survey_Answers from mapsdc.dbo.surveypro_answers where question_id in(select question_id from mapsdc.dbo.surveypro_questions where campaign_id=147)

rptfilters

campaign_id	campaign
143			Adult Child Reference 02-21
146			Request For Reference AD10
147			Orientation Survey
select distinct campaign_id,campaign from mapsdc.dbo.surveypro_campaigns

update lkplookuptable
set query='SELECT DISTINCT campaign_id,campaign AS Adult_Child_Reference_02_21_Questions FROM surveypro_campaigns ORDER BY campaign ASC'
where id=37



