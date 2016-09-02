
SELECT * FROM rulesengine_ruleset where FormID = 1663
SELECT * FROM rulesengine_rules WHERE FormID = 1663

SELECT * FROM MachFormProgramRole where FormID = 1663



--TRUNCATE TABLE rulesengine_ruleset
--TRUNCATE TABLE rulesengine_rules WHERE formid = 1662 order by rule_name
--TRUNCATE TABLE rulesengine_rulesetrules
--DROP TABLE #MachFormProgramRole WHERE formid = 1662

--ALTER TABLE rulesengine_ruleset ADD InFlag int 
--ALTER TABLE rulesengine_rules ADD InFlag int 
--ALTER TABLE rulesengine_rulesetrules ADD InFlag int 


CREATE TABLE #MachFormProgramRole_18_06_15
(rowid int identity(1,1)
,Id	int
,FormId	int
,FormFieldId	varchar(max)
,FormFieldText	varchar(max)
,FieldOptionId	varchar(max)
,FieldOptionText	varchar(max)
,FieldOptionId2	varchar(max)
,FieldOptionText2	varchar(max)
,RelationshipTypeId	int
,RelationshipSubTypeId	int
,GroupId	int
,OperatorId	varchar(max)
,CreatedBy	int
,CreatedByDate	datetime
,LastUpdatedBy	int
,LastUpdatedDate	datetime
,SequenceNo	int
,AutoApproved	int
,OpenAccountYN	varchar(max)
,FormCnt INT
)

insert into #MachFormProgramRole_18_06_15
select * ,RANK() OVER 
    (PARTITION BY formid,FormFieldId ORDER BY id DESC) AS Rank
 from 	 MachFormProgramRole  order by formid


DECLARE @agencyid INT 
DECLARE @Rmin INT 
DECLARE @Rmax INT 
DECLARE @id INT 
DECLARE @mincnt INT 
DECLARE @maxCnt INT 
DECLARE @FromId INT 
DECLARE @FromCnt INT 
DECLARE @FormFieldId VARCHAR(MAX)
DECLARE @OperatorId VARCHAR(MAX)
DECLARE @FieldOptionId VARCHAR(MAX)
DECLARE @FieldOptionText VARCHAR(MAX)
DECLARE @FieldOptionText2 VARCHAR(MAX)
DECLARE @Formid INT 
DECLARE @Rule_id  INT 
SELECT @agencyid=map_agency_id FROM irriscentral.dbo.lutprimaryagency where MAPDBName = db_name()

SET @mincnt =1
 SELECT @maxCnt =MAX(rowID) FROM #MachFormProgramRole_18_06_15
 WHILE(@mincnt<=@maxCnt)
 BEGIN
      
	 DECLARE @machformid INT
	 SET @FromCnt =1
	 SET @Rule_id = 0
	 SELECT @machformid=id,@FromId = FormId from #MachFormProgramRole_18_06_15 WHERE rowID = @mincnt

	 INSERT INTO rulesengine_ruleset (
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
	FROM #MachFormProgramRole_18_06_15
	WHERE id=@machformid

	DECLARE @rulesetid INT
	SET @rulesetid = SCOPE_IDENTITY()
	
	SELECT @formid=FormId ,@FormFieldId = FormFieldId,@OperatorId=OperatorId,@FieldOptionId=FieldOptionId,@FieldOptionText=FieldOptionText,@FieldOptionText2 =FieldOptionText2
	FROM #MachFormProgramRole_18_06_15 WHERE id =  @machformid

	SELECT @Rule_id = rule_id 
	FROM rulesengine_rules
	WHERE FormID= @formid AND field_id = @FormFieldId AND operator=@OperatorId AND Field_Option_ID=@FieldOptionId AND Field_Option_Text=@FieldOptionText AND Field_Option_Text2 = @FieldOptionText2


	IF(@Rule_id =0)
	BEGIN 
	INSERT INTO rulesengine_rules(
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
	SELECT 'Rule'+cast(FormCnt AS VARCHAR(100)),'Rule'+cast(FormCnt AS VARCHAR(100)),FormFieldId,OperatorId,'','','', 1,Getdate(),@agencyid,0,0,'',Formid,FieldOptionId,FieldOptionText,FieldOptionText2,1
	FROM #MachFormProgramRole_18_06_15 WHERE id =  @machformid and ISNULL(FormFieldId,'')!='' and ISNULL(OperatorId,'')!=''  AND ISNULL(FieldOptionText,'')!='' 

	DECLARE @rulesid INT
	SET @rulesid = SCOPE_IDENTITY()

	INSERT INTO rulesengine_rulesetrules(
	 rule_id
	,ruleset_id
	,rules_exec_order
	,InFlag
	)
	SELECT @rulesid,@rulesetid,null,1
	END
	ELSE 
	BEGIN
		 INSERT INTO rulesengine_rulesetrules(
		 rule_id
		,ruleset_id
		,rules_exec_order
		,InFlag
		)
		SELECT @Rule_id,@rulesetid,null,1 
	END 
	SET @mincnt=@mincnt+1
END

Go

UPDATE S SET rule_name = CONCAT('Rule',K.Rank1),rule_description = CONCAT('Rule',K.Rank1)
FROM rulesengine_rules S 
INNER JOIN (SELECT rule_id ,RANK() OVER 
    (PARTITION BY formid ORDER BY rule_id DESC) Rank1 FROM rulesengine_rules_18_06_15 )K ON K.rule_id =s.rule_id AND  s.InFlag= 1



