

select * into rulesengine_ruleset_18_06_15		  from 	 rulesengine_ruleset 		
select * into rulesengine_rules_18_06_15		  from 	 rulesengine_rules 		
select * into rulesengine_rulesetrules_18_06_15	  from 	 rulesengine_rulesetrules
select * into MachFormProgramRole_18_06_15	  from 	 MachFormProgramRole order by formid

alter table MachFormProgramRole_18_06_15
add rowid int identity(1,1)

alter table MachFormProgramRole_18_06_15
alter column id  int 

drop table MachFormProgramRole_18_06_15
truncate table rulesengine_rulesetrules_18_06_15
truncate table rulesengine_rules_18_06_15
truncate table rulesengine_ruleset_18_06_15
drop table #rules
select * from MachFormProgramRole where formid=1662
select* from rulesengine_ruleset_18_06_15 where formid=1662
select* from rulesengine_rules_18_06_15 where formid=1662
select* from rulesengine_ruleset_18_06_15 where formid=1662 and Pgm_Role=-101



create table MachFormProgramRole_18_06_15(rowid int identity(1,1)
,Id	int
,FormId	int
,FormFieldId	varchar(max)
,FormFieldText	varchar(max)
,FieldOptionId	varchar(max)
,FieldOptionText	varchar(max)
,FieldOptionId2	varchar(max)
,FieldOptionText2	varchar
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
,OpenAccountYN	varchar(max))

insert into MachFormProgramRole_18_06_15

select *  from 	 MachFormProgramRole order by formid






SELECT lkp.Operator AS Operator, R.Field_Option_Text AS FieldOptionText, R.Field_Option_Text2 AS FieldOptionText2,R1.Pgm_ID as RelationshipTypeId, R1.Pgm_Role as RelationshipSubTypeId, R1.Group_ID as GroupId, R1.Exec_Order as SequenceNo,field_id As Fieldid,Condition
   FROM rulesengine_ruleset_18_06_15 R1
   INNER JOIN rulesengine_rulesetrules_18_06_15 R2 ON R2.ruleset_id = R1.ruleset_id
   INNER JOIN rulesengine_rules_18_06_15 R ON R.rule_id = R2.rule_id
   INNER JOIN lkp_FilterOperator LKP ON R.operator=CAST(LKP.OperatorId AS VARCHAR(10))
   WHERE R1.FormID = 1662 AND R1.Pgm_Role = -101 ORDER BY Exec_Order ASC

   select* from rulesengine_ruleset_18_06_15 where formid=1662 and Pgm_Role=-101
  select* from  MachFormProgramRole where formid=1662 and RelationshipTypeId=-101







