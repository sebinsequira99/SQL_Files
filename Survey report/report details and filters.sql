


SELECT * FROM mapssrs.dbo.reportlog order by id desc

USE IRRISCENTRAL

INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
SELECT 'Orientation Survey','Orientation Survey','Survey Details','/MAPSSRS/Orientation Survey',-1,0,1,GETDATE()


use rolesqa

INSERT INTO rptReports(
						 ReportID
						,ReportName
						,DisplayText
						,Description
						,ReportPath
						,CategoryID
						,DeletedYN
						,CreatedBY
						,CreatedDate
						,ReportType)
SELECT -47,'Orientation Survey','Orientation Survey','Survey Details','/MAPSSRS/Orientation Survey',-1,0,1,GETDATE(),1


INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)

SELECT -47,'s.Parent_name','Parent Name',1,3,Null,''
UNION ALL
SELECT -47,'s.Email','Email',1,4,Null,''
UNION ALL
SELECT -47,'s.City','City',1,5,Null,''
UNION ALL
SELECT -47,'s.Phone','Phone',1,6,Null,''
UNION ALL
SELECT -47,'s.CaseNumber','CaseNumber',1,7,Null,''
UNION ALL
SELECT -47,'FORMAT(s.Survey_Completion_Date,''yyyy-MM-dd'')','Survey Completion Date',4,8,Null,''
UNION ALL
SELECT -47,'s.Question','Question',8,1,41,''
UNION ALL
SELECT -47,'s.Answer','Answer',8,2,42,''


INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('SurveyName','SurveyName','SurveyName'
,'SELECT DISTINCT campaign_id,campaign AS SurveyName FROM surveypro_campaigns ORDER BY campaign ASC')
