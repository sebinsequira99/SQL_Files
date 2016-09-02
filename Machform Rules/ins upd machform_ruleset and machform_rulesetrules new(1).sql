


--PROCEDURE TO INSERT AND UPDATE machForm_RuleSet,machForm_RuleSetRules
--========================================================================

IF exists (select 1 from sys.objects where name='usp_EditMachFormRules_test' and type='p')
DROP PROCEDURE usp_EditMachFormRules_test;

GO

CREATE PROCEDURE usp_EditMachFormRules_test
(
 @RuleSetId				INT=null
,@RuleSetName			VARCHAR(20)=''	 
,@FormID				INT=null			 
,@RelationshipSubTypeID	INT=null			 
,@RelationshipTypeID	INT=null			 
,@Condition				VARCHAR(20)='' 
,@GroupID				INT=null			 
,@EnableYN				BIT=null
,@LoginUser				INT=null
,@xmlData				XML=''			  	 
)

AS

BEGIN

BEGIN TRY


IF EXISTS(select 1 from machForm_RuleSet where RuleSetName=@rulesetname)

	BEGIN

			UPDATE machForm_RuleSet
			SET	 FormID=@FormID
				,RelationshipSubTypeID=@RelationshipSubTypeID
				,RelationshipTypeID=@RelationshipTypeID
				,Condition=@Condition
				,GroupID=@GroupID
				,EnableYN=@EnableYN
				,ModifiedBy=@LoginUser
				,ModifiedDate=getdate()

			WHERE RuleSetName=@RuleSetName;



WITH XmlData(modifiedby,modifieddate,rulesetrulesid,RulesID) 
AS 
(
  select modifiedby=@loginuser
,(select getdate()) as modifieddate
,(select rulesetrulesid from machForm_RuleSetRules where rulesetid=@rulesetid)
,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/Data/Values') as [Table]([Column])
)

update machForm_RuleSetRules
set rulesid=x.rulesid
   ,modifiedby=x.modifiedby
   ,modifieddate=x.modifieddate
   from xmlData x
where (rulesetid=@rulesetid)

--merge into machForm_RuleSetRules m
--using xmldata x
--on (rulesetid=@rulesetid) and (x.rulesetrulesid in())
--when matched
--then
--update
--set rulesid=x.rulesid
--   ,modifiedby=x.modifiedby
--   ,modifieddate=x.modifieddate;

	END

ELSE

	BEGIN


			INSERT INTO machForm_RuleSet(RuleSetName			
										,FormID					
										,RelationshipSubTypeID	
										,RelationshipTypeID		
										,Condition				
										,GroupID				
										,EnableYN				
										,CreatedBY
										,CreatedDate)				

			VALUES( @RuleSetName			
				   ,@FormID				
				   ,@RelationshipSubTypeID	
				   ,@RelationshipTypeID	
				   ,@Condition				
				   ,@GroupID				
				   ,@EnableYN				
				   ,@LoginUser
				   ,getdate())	
			
DECLARE @rulesetid_inserted	INT
SELECT @rulesetid_inserted=ident_current('machForm_RuleSet');	

WITH XmlData(rulesetid,createdby,createddate,RulesID) AS 
(
SELECT rulesetid=@rulesetid_inserted
		,createdby=@loginuser
		,(select getdate()) as createddate
		,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/Data/Values') as [Table]([Column])
)

insert into machForm_RuleSetRules(rulesetid,rulesid,createdby,createddate)
select rulesetid,rulesid,createdby,createddate from XmlData

	END

END TRY

BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrorNumber
			      ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

END

EXEC usp_EditMachFormRules_test 
							@RuleSetId=108
						  ,@RuleSetName='l'			
						  ,@FormID=1				
						  ,@RelationshipSubTypeID=1
						  ,@RelationshipTypeID=1	
						  ,@Condition='3'				
						  ,@GroupID=45				
						  ,@EnableYN=1				
						  ,@LoginUser=1			
						  ,@xmldata='
						  <Data>
							<Values>    
								<RulesID>1</RulesID> 
								<RulesID>2</RulesID> 
								<RulesID>3</RulesID> 
								<RulesID>7</RulesID> 
							</Values>
						  </Data>'
						  


select * from machForm_RuleSet
select * from machForm_RuleSetrules