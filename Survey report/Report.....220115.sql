
-----------------Irriscentral Master Data--------------------------------------------------------------------------------------------------------------------------------
USE IRRISCENTRAL
INSERT INTO rptCategory (
				Description,
				DeletedYN,
				CreatedBY,
				CreatedDate
				)SELECT 'General',0,1,GETDATE()
								UNION ALL
								SELECT 'Users',0,1,GETDATE()
								UNION ALL
								SELECT 'Cases',0,1,GETDATE()
								UNION ALL
								SELECT 'Finance',0,1,GETDATE()


irriscentral
INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
							SELECT 'Contact Address','Contact Address','Contact address by employer/salary','/SDCSummary/Contact Address',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Event Attendance','Event Attendance','Event attendance by role','/SDCSummary/Event Attendance',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Overdue Check List','Overdue Check List','List of overdue checklist items by case worker, client','/SDCSummary/Overdue Check List',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Address List','Address List','Address list by placement','/SDCSummary/Address List',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Summary Report','Summary Report','Summary report','/SDCSummary/Summary Report',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Logging Details','Logging Details','Capturing last login date and time and frequency of logging in MAP','/SDCSummary/Logging Details',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'AF Client List','AF Client List','AF client list detail','/SDCSummary/AF Client List',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Available Children','Available Children','Available children','/SDCSummary/Availble Children',-1,0,1,GETDATE()
					        UNION ALL
							SELECT 'Mailing List','Mailing List','Mailing list','/SDCSummary/Mailing List',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Age Gender Race Count','Age Gender Race Count','This report gives the total number of contacts of age brackets, race, and gender.','/SDCSummary/Age Gender Race Count',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Case Count For Case Workers','Case Count For Case Workers','Case count for case workers by current group/phase/stage','/SDCSummary/Case Count For Caseworkers',-1,0,1,GETDATE()
							UNION ALL
							SELECT 'Stage Statistics By Group And Phase','Stage Statistics By Group And Phase','Stage statistics by group/phase','/SDCSummary/Stage Statistics By Group and Phase',-1,0,1,GETDATE()
	

INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
SELECT 'Placed NotPlaced Children','Placed NotPlaced Children','Placed notplaced children','/MAPSSRS/PlacedChildren',-1,0,1,GETDATE()

INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
SELECT 'Child Background Report','Child Background Report','Child background report','/MAPSSRS/ChildBackGroundReport',-1,0,1,GETDATE()


INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
SELECT 'Child Inquiry Report','Child Inquiry Report','Child Inquiry Report','/MAPSSRS/Child Inquiry Report',-1,0,1,GETDATE()




INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)
SELECT 'Fast Facts Data Report','Fast Facts Data Report','Fast facts data report','/MAPSSRS/FastFacts Data',-1,0,1,GETDATE()



Update rptReportMaster SET Description = 'Task freak report' WHERE reportid = -20

----------------------------AgencyDB  Masterdata--------------------------------------------------------------------------------------------------------------

--use rolesqa

				
SET IDENTITY_INSERT rptCategory ON  
INSERT INTO rptCategory(CategoryID,
						Description,
						DeletedYN,
						CreatedBY,
						CreatedDate)
						SELECT -1,'General',0,1,GETDATE()
						UNION ALL
						SELECT -2,'Users',0,1,GETDATE()
						UNION ALL
						SELECT -3,'Cases',0,1,GETDATE()
						UNION ALL
						SELECT -4,'Finance',0,1,GETDATE() 

SET IDENTITY_INSERT rptCategory OFF 


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
						    SELECT -44,'Placed NotPlaced Children','Placed NotPlaced Children','Placed notplaced children','/MAPSSRS/PlacedChildren',-1,0,1,GETDATE(),1



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
						    SELECT -43,'Child Background Report','Child Background Report','Child background report','/MAPSSRS/ChildBackGroundReport',-1,0,1,GETDATE(),1


DELETE FROM rptReports where ReportID =-44


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
						    SELECT -42,'Child Inquiry Report','Child Inquiry Report','Child inquiry report','/MAPSSRS/Child Inquiry Report',-1,0,1,GETDATE(),1


Update rptReports SET ReportPath = '/MAPSSRS/Child Inquiry Report' WHERE ReportID= -42
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
						    SELECT -25,'Fast Facts Data Report','Fast Facts Data Report','Fast facts data report','/MAPSSRS/FastFacts Data',-1,0,1,GETDATE(),1


Update rptReports SET Description = 'Task freak report' WHERE reportid = -20
--SELECT * FROM rptReports WHERE ReportID =-20




StgFactfactdates

																														
CaseWorker																																											
Program																																												
Role																																											
Group Name																																										
ClientName																																											
Case#																																											
Case Date																																											
Applicant																																										
Date Type																																											
Clearence Date																																									
Expiry Date	
Renewal Date
Cleared	
State
Country	
	
	Stgfastfactdata
--SELECT * FROM rptFilters WHERE reportid IN(-21,-22,-23)		

INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -25,'rst.RelationshipSubTypeText','Program',8,2,6,''
UNION ALL
SELECT -25,'rt.RelationshipTypeText','Role',8,3,7,''
UNION ALL
SELECT -25,'fd.Name','Client Name',1,1,Null,''
--UNION ALL
--SELECT -25,'fd.TemplateName','Template Name',1,4,Null,''


--UPDATE rptFilters SET FieldName = 'rst.RelationshipSubTypeText' WHERE filterid =1232 
--UPDATE rptFiltersAssigned SET FieldName = 'rst.RelationshipSubTypeText' WHERE filterid =1232 
--UPDATE rptFilters SET FieldName = 'rt.RelationshipTypeText' WHERE filterid =1233 
--UPDATE rptFiltersAssigned SET FieldName = 'rt.RelationshipTypeText' WHERE filterid =1233
--DELETE FROM rptFilters WHERE filterid =1235
--DELETE FROM dbo.rptFiltersAssigned WHERE filterid =1235
SELECT * FROM rptFilters 
WHERE reportid = -25

UNION ALL
SELECT -17,'FORMAT(Stg.CaseDate,''yyyy-MM-dd'')','Case Date',4,7,Null,''
UNION ALL
SELECT -17,'Stg.Applicant','Applicant',1,8,Null,''
UNION ALL
SELECT -17,'Stg.DateType','Date Type',1,9,Null,''
UNION ALL
SELECT -17,'FORMAT(Stg.ClearenceDate,''yyyy-MM-dd'')','Clearence Date',4,10,Null,''
UNION ALL
SELECT -17,'FORMAT(Stg.ExpiryDate,''yyyy-MM-dd'')','Expiry Date',4,11,Null,''
UNION ALL
SELECT -17,'FORMAT(Stg.RenewalDate,''yyyy-MM-dd'')','Renewal Date',4,12,Null,''
UNION ALL
SELECT -17,'Stg.Cleared','Cleared',8,13,19,''
UNION ALL
SELECT -17,'Stg.State','State',8,14,1,''
UNION ALL
SELECT -17,'Stg.Country','Country',8,15,2,''

--lkpFieldTypes
--StgTaskFreakReport
INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -41,'C.Age','Age',5,2,Null,''
Union ALL
SELECT -41,'C.gender','Gender',8,1,11,''
UNIon ALL
SELECT -41,'C.RelLabel','Case Number',1,3,Null,''
Union all
SELECT -41,'ConnectionStatusText' ,'Status',8,4,9,''
UNIon ALL
SELECT -41,'C.Program','Program',8,5,6,''
Union all
SELECT -41,'G.group_name','Group Name',8,6,8,''
Union ALL
SELECT -41,'LTRIM(RTRIM(CONCAT (UA.first_name , '' '' , UA.last_name)))' ,'Caseworker',8,7,13,''














ChildName
ChildId
APName
InquiryDate
APAddress
APCounty
APEmail
APGroup
CaseNo
CaseStartDate
CaseStatus


StgChildBackGroundDetails

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
						    SELECT -43,'Child Background Report','Child Background Report','Child background report','/MAPSSRS/ChildBackGroundReport',-1,0,1,GETDATE(),1

INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -43,'C.ChildName','Child Name',1,1,Null,''
Union ALL
SELECT -43,'C.ChildId','Child Id',1,2,Null,''
UNIon ALL
SELECT -43,'FORMAT(C.RegistrationDate,''yyyy-MM-dd'')' ,'Registration Date',4,3,Null,''
UNIon ALL
SELECT -43,'CaseNo' ,'Case No',1,4,Null,''
UNIon ALL
SELECT -43,'G.group_name','Group Name',8,5,8,''
Union ALL
SELECT -43,'C.Age','Age',5,6,Null,''
Union ALL
SELECT -43,'C.gender','Gender',8,7,11,''
Union ALL
SELECT -43,'E.Ethinicity','Ethnicity',8,8,26,''
Union ALL
SELECT -43,'C.Health','Health',8,9,23,''
Union ALL
SELECT -43,'C.Education','Education',8,10,24,''
Union ALL
SELECT -43,'C.Question','Characteristics',8,11,25,''


Update rptFilters SEt FieldType = 5 WHERE FilterID=
1276
Update rptFilters SEt FieldType = 5 WHERE FilterID= 1287

SELECT * FROM rptFilters WHERE ReportID = -43
1279
1280
Update rptFilters SET Fieldname ='C.Health'  where 
FilterID = 1279
Update rptFilters SET Fieldname ='C.Education'  where 
FilterID = 1280

Update rptFilters SET FieldType=8 , LookUpId= 27 where 
FilterID = 1276

Update rptFilters SET Fieldname ='E.Ethinicity'  where FilterID =  1278


SELECT * FROM rptFilters WHERE ReportID = -43



SELECT DISTINCT Question AS Id,CAST(Question AS VARCHAR(MAX)) AS Health FROM Questionnaire WHERE CategoryID =5 AND ShowToChild =1 ORDER BY Question ASC
SELECT DISTINCT Question AS Question_id,Question FROM Questionnaire WHERE CategoryID =6 AND ShowToChild =1 ORDER BY Question ASC
SELECT DISTINCT Question AS Question_id,Question FROM Questionnaire WHERE CategoryID =7 AND ShowToChild =1 ORDER BY Question ASC


USE MAPTEST

INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'Health','Health','Health','SELECT  CAST(Question AS VARCHAR(MAX)) AS HealthId,CAST(Question AS VARCHAR(MAX)) AS Health FROM Questionnaire WHERE CategoryID =5 AND ShowToChild =1 ORDER BY Question ASC'
UNION ALL
SELECT 'Education','Education','Education','SELECT  CAST(Question AS VARCHAR(MAX)) AS Educationid,CAST(Question AS VARCHAR(MAX)) As Education  FROM Questionnaire WHERE CategoryID =6 AND ShowToChild =1 ORDER BY Question ASC'
UNION ALL
SELECT 'Characterstics','Characterstics','Characterstics','SELECT  CAST(Question AS VARCHAR(MAX)) AS Charactersticsid,CAST(Question AS VARCHAR(MAX)) AS Characterstics  FROM Questionnaire WHERE CategoryID =7 AND ShowToChild =1 ORDER BY Question ASC' 
UNION ALL
SELECT 'Ethnicity','Ethnicity','Ethnicity','SELECT ''African'' AS id , ''African'' AS Ethnicity 
Union all
SELECT ''American'' AS id , ''American'' AS Ethnicity 
Union all
SELECT ''American Indian'' AS id , ''American Indian'' AS Ethnicity 
Union all
SELECT ''Asian'' AS id , ''Asian'' AS Ethnicity 
Union all
SELECT ''Bi-Racial'' AS id , ''Bi-Racial'' AS Ethnicity 
Union all
SELECT ''Caucasian'' AS id , ''Caucasian'' AS Ethnicity 
Union all
SELECT ''Hispanic'' AS id , ''Hispanic'' AS Ethnicity 
Union all
SELECT ''Latino'' AS id , ''Latino'' AS Ethnicity 
Union all
SELECT ''Pacific Islander'' AS id , ''Pacific Islander'' AS Ethnicity 
Union all
SELECT ''ZOther'' AS id , ''Other'' AS Ethnicity 
ORDER BY ID'
Union all
SELECT 'Age','Age','Age','DECLARE @min int
SET @min =1
CREATE TABLE #Age (id int , age int)
WHILE(@min<=50)
BEGIN
Insert Into #Age
SELECT @min as id ,@min as Age 
SET @min =@min+1
END
SELECT * FROM #Age'
Go
INSERT INTO lkplookupTable (Query
,ValueField
,DisplayField
,LkpName)
SELECT 'SELECT  ''Placed'' AS Id ,''Placed'' AS PlacedYN
UNION
SELECT  ''Not Placed'' AS Id ,''Not Placed'' AS PlacedYN','PlacedYN','PlacedYN','PlacedYN'





UPDATE lkplookupTable SET Query =
'SELECT  CAST(Question AS VARCHAR(MAX)) AS HealthId,CAST(Question AS VARCHAR(MAX)) AS Health FROM Questionnaire WHERE CategoryID =5 AND ShowToChild =1 ORDER BY Question ASC' WHERE id =23

UPDATE lkplookupTable SET Query =
'SELECT  CAST(Question AS VARCHAR(MAX)) AS Educationid,CAST(Question AS VARCHAR(MAX)) As Education  FROM Questionnaire WHERE CategoryID =6 AND ShowToChild =1 ORDER BY Question ASC' WHERE id =24

UPDATE lkplookupTable SET Query =
'SELECT  CAST(Question AS VARCHAR(MAX)) AS Charactersticsid,CAST(Question AS VARCHAR(MAX)) AS Characterstics  FROM Questionnaire WHERE CategoryID =7 AND ShowToChild =1 ORDER BY Question ASC' WHERE id =25



INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'Ethnicity','Ethnicity','Ethnicity','SELECT ''African'' AS id , ''African'' AS Ethnicity 
Union all
SELECT ''American'' AS id , ''American'' AS Ethnicity 
Union all
SELECT ''American Indian'' AS id , ''American Indian'' AS Ethnicity 
Union all
SELECT ''Asian'' AS id , ''Asian'' AS Ethnicity 
Union all
SELECT ''Bi-Racial'' AS id , ''Bi-Racial'' AS Ethnicity 
Union all
SELECT ''Caucasian'' AS id , ''Caucasian'' AS Ethnicity 
Union all
SELECT ''Hispanic'' AS id , ''Hispanic'' AS Ethnicity 
Union all
SELECT ''Latino'' AS id , ''Latino'' AS Ethnicity 
Union all
SELECT ''Pacific Islander'' AS id , ''Pacific Islander'' AS Ethnicity 
Union all
SELECT ''ZOther'' AS id , ''Other'' AS Ethnicity 
ORDER BY ID'


INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'Age','Age','Age','DECLARE @min int
SET @min =1
CREATE TABLE #Age (id int , age int)
WHILE(@min<=50)
BEGIN
Insert Into #Age
SELECT @min as id ,@min as Age 
SET @min =@min+1
END
SELECT * FROM #Age'



Update lkplookupTable SET query = 'DECLARE @min int
SET @min =1
CREATE TABLE #Age (id int , age int)
WHILE(@min<=50)
BEGIN
Insert Into #Age
SELECT @min as id ,@min as Age 
SET @min =@min+1
END
SELECT * FROM #Age' WHERE id =27







INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'Age','Age','Age','SELECT ''African'' AS id , ''African'' AS Ethnicity 
Union all
SELECT ''American'' AS id , ''American'' AS Ethnicity 
Union all
SELECT ''American Indian'' AS id , ''American Indian'' AS Ethnicity 
Union all
SELECT ''Asian'' AS id , ''Asian'' AS Ethnicity 
Union all
SELECT ''Bi-Racial'' AS id , ''Bi-Racial'' AS Ethnicity 
Union all
SELECT ''Caucasian'' AS id , ''Caucasian'' AS Ethnicity 
Union all
SELECT ''Hispanic'' AS id , ''Hispanic'' AS Ethnicity 
Union all
SELECT ''Latino'' AS id , ''Latino'' AS Ethnicity 
Union all
SELECT ''Pacific Islander'' AS id , ''Pacific Islander'' AS Ethnicity 
Union all
SELECT ''ZOther'' AS id , ''Other'' AS Ethnicity 
ORDER BY ID'








SELECT * FROM lkpethnicity 
SELECT * FROM lkprace

SELECT DISTINCT Question AS Question_id,Question FROM Questionnaire WHERE CategoryID =5 AND ShowToChild =1 ORDER BY Question ASC--Health
SELECT DISTINCT Question AS Question_id,Question FROM Questionnaire WHERE CategoryID =6 AND ShowToChild =1 ORDER BY Question ASC
SELECT DISTINCT Question AS Question_id,Question FROM Questionnaire WHERE CategoryID =7 AND ShowToChild =1 ORDER BY Question ASC


drop down to select health of child
- drop down to select education of child
- drop down to select characteristics of child


INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -42,'C.ChildName','Child Name',1,1,Null,''
Union ALL
SELECT -42,'C.ChildId','Child Id',1,2,Null,''
UNIon ALL
SELECT -42,'C.APName','Inquiring Parent Name',1,3,Null,''
Union all
SELECT -42,'FORMAT(C.InquiryDate,''yyyy-MM-dd'')' ,'Inquiry Date',4,4,Null,''
UNIon ALL
SELECT -42,'C.APCounty','Parent County',8,5,20,''
Union all
SELECT -42,'C.APEmail','Email',1,6,Null,''
Union ALL
SELECT -42,'C.APGroup','Parent Group',8,7,8,''
Union all
SELECT -42,'CaseNo' ,'Case No',1,8,Null,''
UNIon ALL
SELECT -42,'FORMAT(C.CaseStartDate,''yyyy-MM-dd'')','Start Date',4,9,Null,''
Union all
SELECT -42,'C.CaseStatus','Status',8,10,9,''
Union ALL
SELECT -42,'C.Age','Age',5,2,Null,''
Union ALL
SELECT -42,'C.gender','Gender',8,2,11,''
UNIon ALL
SELECT -42,'C.homestudyStatus','HomeStudyYN',8,2,21,''

UPDATE rptFilters SET LookUpId =22 WHERE  ReportID =-42 and DisplayText= 'Parent Group'



UPDATE rptFilters SET sequence =2 WHERE  ReportID =-42 and DisplayText IN ('Age','Gender','HomeStudyYN')

SELECT * FROM rptFilters WHERE ReportID =-42 and DisplayText= 'Parent Group'



SELECT * FROM rptFilters WHERE ReportID =-42



UpDATE rptFilters SET DisplayText ='Inquiring Parent Name'  WHERE FilterID IN(
1257)
UpDATE rptFilters SET DisplayText ='Parent County'  WHERE FilterID IN(
1259)
UpDATE rptFilters SET DisplayText ='Parent Group'  WHERE FilterID IN(
1261)


UpDATE rptFilters SET FieldName ='FORMAT(C.InquiryDate,''yyyy-MM-dd'')'  WHERE FilterID IN(
1258)
UpDATE rptFilters SET FieldName ='FORMAT(C.CaseStartDate,''yyyy-MM-dd'')'  WHERE FilterID IN(
1263)
Filterassigned
 
FORMAT(Stg.DueDate,'yyyy-MM-dd')
FORMAT(Stg.CompletedDate,'yyyy-MM-dd')


SELECT * FROM rptFilters WHERE FilterID IN(1263,
1258)

rptFilters WHERE reportid = -42

use mapeckerd

lkplookupTable
2	Country	CountryText	CountryID	SELECT DISTINCT CountryText As CountryID,CountryText FROM lkpCountry ORDER BY CountryText ASC	NULL

INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'County','CountyText','CountyID','SELECT DISTINCT CountyText As CountryID,CountyText FROM LkpCounty ORDER BY CountyText ASC'



Update lkplookupTable SET Query =
'SELECT DISTINCT CountyText As CountyID,CountyText  FROM LkpCounty WHERE CountyText is not NULL 
ORDER BY CountyText ASC' WHERE Id = 20




mapeckerd
Rolesqa

INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'HomeStudyYN','HomeStudyYN','HomeStudyYN','SELECT  ''Yes'' AS Id ,''Yes'' AS HomeStudyYN UNION SELECT  ''No'' AS Id ,''No'' AS HomeStudyYN'

INSERT INTO lkplookupTable (
LkpName,
DisplayField,
ValueField,
Query
)
SELECT 'ParentGroup','GroupName','Groupid','SELECT DISTINCT group_name AS group_id,group_name FROM user_groups WHERE grouprole_type_id = -101 ORDER BY group_name ASC'

SELECT DISTINCT group_name AS group_id,group_name FROM user_groups WHERE grouprole_type_id = -101 ORDER BY group_name ASC
SELECT DISTINCT group_name AS group_id,group_name FROM user_groups WHERE grouprole_type_id= -101 ORDER BY group_name ASC
SELECT DISTINCT group_name AS group_id,group_name FROM user_groups ORDER BY group_name ASC

SELECT * FROM user_groups WHERE grouprole_type_id= -101 ORDER BY group_name ASC

SELECT  'Yes' AS Id ,'Yes' AS HomeStudyYN UNION SELECT  'No' AS Id ,'No' AS HomeStudyYN

SELECT  ''Yes'' AS Id ,''Yes'' AS HomeStudyYN
UNION
SELECT  ''No'' AS Id ,''No'' AS HomeStudyYN

DELETE FROM rptFiltersAssigned WHERE reportid = -42
LkpCounty  ORDER BY CountyText ASC


DELETE FROM LkpCounty WHERE CountyID in 
(3140,

3139,

3144)

SELECT DISTINCT CountyText As CountryID,CountyText FROM LkpCounty ORDER BY CountyText ASC








DELETE FROM 
rptFiltersAssigned where reportid = -41

DELETE FROM rptFilters where reportid = -41

ROLESQA


INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -41,'LTRIM(RTRIM(CONCAT (UA.first_name , '' '' , UA.last_name)))' ,'Caseworker',8,3,13,''
UNIon ALL
SELECT -41,'ConnectionStatusText' ,'Status',8,3,9,''
UNIon ALL


SELECT * FROM 

INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -41,'C.RelLabel','Case Number',1,3,Null,''
Union all
SELECT -41,'C.group_name','Group Name',8,2,8,''

Update rptFilters SET sequence = 4 WHERE Filterid = 1237

SELECT * FROM rptFilters WHERE ReportID = -41
1236
1237
FieldName
C.Age
DisplayText
Age
FieldType
5
sequence
1
LookUpId
NULL

INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -20,'Stg.CaseWorker','CaseWorker',8,1,13,''
UNION ALL
SELECT -20,'Stg.Program','Program',8,2,6,''
UNION ALL
SELECT -20,'Stg.Role','Role',8,3,7,''
UNION ALL
SELECT -20,'Stg.GroupName','Group Name',8,4,8,''
UNION ALL
SELECT -20,'Stg.ClientName','Client Name',1,5,Null,''
UNION ALL
SELECT -20,'Stg.Case#','Case#',1,6,Null,''
UNION ALL
SELECT -20,'FORMAT(Stg.CaseDate,''yyyy-MM-dd'')','Case Date',4,7,Null,''
UNION ALL
SELECT -20,'Stg.ProjectName','Project Name',1,8,Null,''
UNION ALL
SELECT -20,'Stg.Task','Task',1,9,Null,''
UNION ALL
SELECT -20,'FORMAT(Stg.DueDate,''yyyy-MM-dd'')','Due Date',4,10,Null,''
UNION ALL
SELECT -20,'FORMAT(Stg.CompletedDate,''yyyy-MM-dd'')','Completed Date',4,11,Null,''
UNION ALL
SELECT -20,'Stg.Status','Status',5,12,Null,''
UNION ALL
SELECT -20,'Stg.Country','Country',8,13,2,''


SELECT * FROM irriscentral.dbo.lutprimaryagency where mapdbname ='MAPCCDIOBR'

UPDATE rptFilters SET FieldType =8 ,LookUpId =2 WHERE FilterID = 1219 

SELECT * FROM rptFilters WHERE reportid =-20 

ProjectName
Task
DueDate
Status
CompletedDate
Country

SELECT * FROM lkplookupTable


SELECT * FROM rptFilters 
WHERE ReportID = -17


SELECT * FROM rptFilters WHERE FIlterid IN
(1204)


UPDATE  rptFilters SET FieldType = 8,LookUpId=19 WHERE FIlterid IN
(1204)
FieldType
1



INSERT INTO lkplookupTable (Query
,ValueField
,DisplayField
,LkpName)

SELECT 'SELECT  ''Yes'' AS Id ,''Yes'' AS Cleared
UNION
SELECT  ''No'' AS Id ,''No'' AS Cleared','Cleared','Cleared','Cleared'

SELECT * FROM rptFilters WHERE ReportID =-44


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
						    SELECT -1,'Contact Address','Contact Address','Contact address by employer/salary','/SDCSummary/Contact Address',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -2,'Event Attendance','Event Attendance','Event attendance by role','/SDCSummary/Event Attendance',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -3,'Overdue Check List','Overdue Check List','List of overdue checklist items by case worker, client','/SDCSummary/Overdue Check List',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -4,'Address List','Address List','Address list by placement','/SDCSummary/Address List',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -5,'Summary Report','Summary Report','Summary report','/SDCSummary/Summary Report',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -6,'Logging Details','Logging Details','Capturing last login date and time and frequency of logging in MAP','/SDCSummary/Logging Details',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -7,'AF Client List','AF Client List','AF client list detail','/SDCSummary/AF Client List',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -8,'Available Children','Available Children','Available children','/SDCSummary/Availble Children',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -9,'Mailing List','Mailing List','Mailing list','/SDCSummary/Mailing List',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -10,'Age Gender Race Count','Age Gender Race Count','This report gives the total number of contacts of age brackets, race, and gender.','/SDCSummary/Age Gender Race Count',-1,1,1,GETDATE(),1
							UNION ALL
							SELECT -11'Case Count For Case Workers','Case Count For Case Workers','Case count for caseworkers by current group/phase/stage','/SDCSummary/Case Count For Caseworkers',-1,1,1,GETDATE()
							UNION ALL
							SELECT -12,'Stage Statistics By Group And Phase','Stage Statistics By Group And Phase','Stage statistics by group/phase','/SDCSummary/Stage Statistics By Group And Phase',-1,1,1,GETDATE(),1
							
							

---------------------------------
- action drop down i.e. matched and un-matched
- matched with parents name 
- Parent county
- parent case #
- matching date


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
						    SELECT -44,'Placed NotPlaced Children','Placed NotPlaced Children','Placed notplaced children','/MAPSSRS/PlacedChildren',-1,0,1,GETDATE(),1

INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)
SELECT -44,'C.ChildName','Child Name',1,1,Null,''
Union ALL
SELECT -44,'C.ChildId','Child Id',1,2,Null,''
UNIon ALL
SELECT -44,'FORMAT(C.RegistrationDate,''yyyy-MM-dd'')' ,'Registration Date',4,3,Null,''
UNIon ALL
SELECT -44,'C.CaseNo' ,'Child Case No',1,4,Null,''
UNIon ALL
SELECT -44,'G.group_name','Group Name',8,5,8,''
Union ALL
SELECT -44,'C.Age','Age',5,6,Null,''
Union ALL
SELECT -44,'C.gender','Gender',8,7,11,''
Union ALL
SELECT -44,'E.Ethinicity','Ethnicity',8,8,26,''
Union ALL
SELECT -44,'C.PlacedYN','Action',8,9,28,''
Union ALL
SELECT -44,'C.ParentsName','Parent Name',1,10,Null,''
Union ALL
SELECT -44,'C.ParentCounty','Parent County',8,11,20,''
Union ALL
SELECT -44,'C.ParentCaseNo','Parent Case No',1,12,Null,''
Union ALL
SELECT -44,'FORMAT(C.PlacedDate,''yyyy-MM-dd'')','Placed Date',4,13,Null,''

StgPlacedChildren

SELECT * FROM rptFilters WHERE ReportID = -44

INSERT INTO lkplookupTable (Query
,ValueField
,DisplayField
,LkpName)

SELECT 'SELECT  ''Placed'' AS Id ,''Placed'' AS PlacedYN
UNION
SELECT  ''Not Placed'' AS Id ,''Not Placed'' AS PlacedYN','PlacedYN','PlacedYN','PlacedYN'

SELECT  'Yes' AS Id ,'Yes' AS PlacedYN
UNION
SELECT  'No' AS Id ,'No' AS PlacedYN

Update lkplookupTable set Query ='SELECT  ''Placed'' AS Id ,''Placed'' AS PlacedYN
UNION
SELECT  ''Not Placed'' AS Id ,''Not Placed''' WHERE id=28