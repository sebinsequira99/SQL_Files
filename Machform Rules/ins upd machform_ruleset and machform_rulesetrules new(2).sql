


--PROCEDURE TO INSERT AND UPDATE machForm_RuleSet,machForm_RuleSetRules
--========================================================================

IF exists (select 1 from sys.objects where name='usp_Edit_MachForm_Ruleset' and type='p')
DROP PROCEDURE usp_Edit_MachForm_Ruleset;

GO

CREATE PROCEDURE usp_Edit_MachForm_Ruleset
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


WITH XmlData(modifiedby,modifieddate,RulesID) 
AS 
(
 select modifiedby=@loginuser
,(select getdate()) as modifieddate
,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/ machForm_RuleSetRules') as [Table]([Column])
)

SELECT * INTO #temp_update
FROM
((SELECT *,row_number() over(order by RulesID) as row_a from XmlData) as a
JOIN
(SELECT RuleSetrulesid,row_number() over(order by RuleSetrulesid) as row_b from machForm_RuleSetrules where rulesetid=@rulesetid)b
ON(a.row_a=b.row_b));

MERGE INTO machForm_RuleSetRules m
USING #temp_update t
ON (m.RuleSetrulesid=t.RuleSetrulesid)
WHEN MATCHED
THEN
UPDATE
SET rulesid=t.rulesid
   ,modifiedby=t.modifiedby
   ,modifieddate=t.modifieddate;


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
	  ,[Table].[Column].value('RulesID[1]', 'INT')	AS 'RulesID'
FROM @xmlData.nodes('/ machForm_RuleSetRules') AS [Table]([Column])
)

INSERT INTO machForm_RuleSetRules(rulesetid,rulesid,createdby,createddate)
SELECT rulesetid,rulesid,createdby,createddate FROM XmlData

	END

END TRY

BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrorNumber
			      ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

END

--EXEC usp_Edit_MachForm_Ruleset 
--						   @RuleSetId=104
--						  ,@RuleSetName='k'			
--						  ,@FormID=1				
--						  ,@RelationshipSubTypeID=1
--						  ,@RelationshipTypeID=1	
--						  ,@Condition='1'				
--						  ,@GroupID=45				
--						  ,@EnableYN=1				
--						  ,@LoginUser=1			
--						  ,@xmldata='
						  
--						    <machForm_RuleSetRules>
						  
--						      <RulesID>7</RulesID>
						  
--						    </machForm_RuleSetRules>
						  
--						    <machForm_RuleSetRules>
						  
--						      <RulesID>5</RulesID>

--						    </machForm_RuleSetRules>

--						    <machForm_RuleSetRules>

--						      <RulesID>3</RulesID>

--						    </machForm_RuleSetRules>

--						    <machForm_RuleSetRules>

--						      <RulesID>2</RulesID>

--						    </machForm_RuleSetRules>'
