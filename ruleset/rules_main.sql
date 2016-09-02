

use mapdev

--rulesengine_rule -> name, desc, field_id, operator, enable flag=1, effective_date, agency_id, formId, field_oprion_id, field_option_text, field_option_text2
--[17-06-2015 17:28:42] Soumya Cleatus: rulesengine_ruleset -> name, desc, enable_lag=1, date, agency_id, condition=||, formId, pgm_id, pgm_role, group_id, exec_order


--SELECT  * FROM MachFormProgramRole_18_06_15
--SELECT * FROM MachFormProgramRole_18_06_15 


--SELECT TOP 5 * FROM rulesengine_ruleset_18_06_15 ORDER BY ruleset_id DESC

--SELECT TOP 5 * FROM rulesengine_rulesetrules_18_06_15 ORDER BY id DESC

--SELECT TOP 5 * FROM rulesengine_rules_18_06_15 ORDER BY rule_id DESC

--ALTER TABLE rulesengine_ruleset_18_06_15 ADD InFlag int 
--ALTER TABLE rulesengine_rules_18_06_15 ADD InFlag int 
--ALTER TABLE rulesengine_rulesetrules_18_06_15 ADD InFlag int 
--drop table #rule
Create table #rule(
Ruleid int identity(1,1)
,rowid int
,Id int
,FormId int
,FormFieldId varchar(MAX)
,FormFieldText varchar(MAX)
,FieldOptionId varchar(MAX)
,FieldOptionText varchar(MAX)
,FieldOptionId2 varchar(MAX)
,FieldOptionText2 varchar(MAX)
,RelationshipTypeId int
,RelationshipSubTypeId int
,GroupId int
,OperatorId varchar(MAX)
,CreatedBy int
,CreatedByDate datetime
,LastUpdatedBy int
,LastUpdatedDate datetime
,SequenceNo int
,AutoApproved int
,OpenAccountYN varchar(MAX)
)
DECLARE @agencyid INT 
DECLARE @Rmin INT 
DECLARE @Rmax INT 
DECLARE @id INT 
DECLARE @formid INT 
DECLARE @mincnt INT 
DECLARE @maxCnt INT 
SELECT @agencyid = agency_id FROM user_agencies 

SET @mincnt =1
 SELECT @maxCnt =MAX(rowID) FROM MachFormProgramRole_18_06_15 --WHERE  formid in(1662)
 SELECT 'Loop-1',@maxCnt
 WHILE(@mincnt<=@maxCnt)
 BEGIN

 DECLARE @machformid INT
 SELECT @machformid=id from MachFormProgramRole_18_06_15 WHERE rowID = @mincnt --and formid=1662
 SELECT 'mincnt',@mincnt
 SELECT 'machformid',@machformid
INSERT INTO rulesengine_ruleset_18_06_15 (
ruleset_name
,ruleset_description
,alert_flag
,enable_flag
,effective_date
,runtype
,batch
,agency_id
,condition
,action
,action_value
,FormID
,Pgm_ID
,Pgm_Role
,Group_ID
,Exec_Order
,InFlag)

SELECT 'Ruleset1','Ruleset1',0,1,Getdate(),0,0,@agencyid,'||','','',Formid,RelationshipSubTypeId,RelationshipTypeId,GroupId,SequenceNo,1
FROM MachFormProgramRole_18_06_15
WHERE id=@machformid

DECLARE @rulesetid INT
SET @rulesetid = SCOPE_IDENTITY()

SELECT @formid = formid FROM MachFormProgramRole_18_06_15 WHERE id = @minCnt

--INSERT INTO #rule 
--SELECT rowid
--,Id
--,FormId
--,FormFieldId
--,FormFieldText
--,FieldOptionId
--,FieldOptionText
--,FieldOptionId2
--,FieldOptionText2
--,RelationshipTypeId
--,RelationshipSubTypeId
--,GroupId
--,OperatorId
--,CreatedBy
--,CreatedByDate
--,LastUpdatedBy
--,LastUpdatedDate
--,SequenceNo
--,AutoApproved
--,OpenAccountYN
-- FROM MachFormProgramRole_18_06_15 WHERE Formid = @formid

SET @Rmin =1
--SET @RMAX = SCOPE_IDENTITY()
--SELECT 'Loop-2',@RMAX
--WHILE(@Rmin<=@RMAX)
--BEGIN
   --SELECT @id = id FROM #rule WHERE id = @minCnt

 --SELECT COUNT(1) FROM MachFormProgramRole_18_06_15 WHERE InFlag=1 
 INSERT INTO rulesengine_rules_18_06_15(
  rule_name
 ,rule_description
 ,field_id
 ,operator
 ,proposition
 ,action
 ,action_value
 ,enable_flag
 ,effective_date
 ,agency_id
 ,message_id
 ,proposition_type
 ,rule_field_type
 ,FormID
 ,Field_Option_ID
 ,Field_Option_Text
 ,Field_Option_Text2
 ,InFlag)

SELECT 'Rule'+cast(@Rmin as varchar(10)),'Rule'+cast(@Rmin as varchar(10)),FormFieldId,OperatorId,'','','', 1,Getdate(),@agencyid,0,0,'',Formid,FieldOptionId,FieldOptionText,FieldOptionText2,1
FROM MachFormProgramRole_18_06_15 WHERE id =  @machformid

DECLARE @rulesid INT
SET @rulesid = SCOPE_IDENTITY()

INSERT INTO rulesengine_rulesetrules_18_06_15(
 rule_id
,ruleset_id
,rules_exec_order
,InFlag
)

SELECT @rulesetid,@rulesid,null,1
--FROM MachFormProgramRole_18_06_15 WHERE id =  @minCnt

--SET @Rmin =@Rmin+1

--END

TRUNCATE TABLE #rule
SET @mincnt=@mincnt+1

END

