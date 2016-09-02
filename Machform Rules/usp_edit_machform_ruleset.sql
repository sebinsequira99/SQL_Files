

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

IF EXISTS(select 1 from machForm_RuleSet where (RuleSetName=@rulesetname AND RuleSetId = @RuleSetId))

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

			WHERE RuleSetName=@RuleSetName
			AND RuleSetId = @RuleSetId

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

WITH XmlData
AS 
(
select [Table].[Column].value('.', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/Data/Values/Id') as [Table]([Column])
)

MERGE INTO machForm_RuleSetRules m
USING XmlData x ON (m.RuleSetID = @RuleSetId) AND (m.RulesID = x.RulesID)

WHEN NOT MATCHED

	THEN 

			INSERT (RuleSetID		
				   ,RulesID			
				   ,CreatedBY		
				   ,CreatedDate)

			VALUES ( @rulesetid_inserted		
					,x.RulesID		
					,@LoginUser		
				    ,getdate());

	END

END TRY

BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrorNumber
			      ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

END

--EXEC usp_Edit_MachForm_Ruleset 
--								 @RuleSetId=1
--								,@RuleSetName='n'	 
--								,@FormID=1			 
--								,@RelationshipSubTypeID=-100			 
--								,@RelationshipTypeID=-101			 
--								,@Condition='3' 
--								,@GroupID=45			 
--								,@EnableYN=1
--								,@LoginUser=257
--								,@xmlData=
--										  '<Data>
--										  	 <Values>    
--										  	 	<Id>8</Id> 
--										  	 	<Id>7</Id>
--										  	 	<Id>2</Id>
--										  	 	<Id>1</Id>
--										  	 </Values>
--										  </Data>'		