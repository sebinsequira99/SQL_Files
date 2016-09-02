


--PROCEDURE TO INSERT AND UPDATE machForm_RuleSet,machForm_RuleSetRules
--========================================================================

USE mapdev

IF exists (select 1 from sys.objects where name='usp_EditMachFormRules_test' and type='p')
DROP PROCEDURE usp_EditMachFormRules_test;

GO

CREATE PROCEDURE usp_EditMachFormRules_test
(
 @RuleSetName			VARCHAR(20)	 
,@FormID				INT		 
,@RelationshipSubTypeID	INT			 
,@RelationshipTypeID	INT		 
,@Condition				VARCHAR(20)
,@GroupID				INT			 
,@EnableYN				BIT
,@LoginUser				INT
,@RuleSetId				INT
,@xmlData				XML			  	 
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

			WHERE RuleSetName=@RuleSetName

			declare @date int
			set @date=convert(int,getdate());

WITH XmlData(rulesid,modifiedby,modifieddate) 
AS 
(
 select modifiedby=@loginuser
,modifieddate=@date
,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/ machForm_RuleSetRules') as [Table]([Column])
)

update machForm_RuleSetRules
set rulesid=x.rulesid
   ,modifiedby=x.modifiedby
   ,modifieddate=convert(datetime,x.modifieddate)
   from xmldata x
where rulesetid=@rulesetid

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
SELECT @rulesetid_inserted=scope_identity();	

WITH XmlData(rulesetid,rulesid,createdby,createddate) AS 
(
SELECT rulesetid=@rulesetid_inserted
,createdby=@loginuser
,createddate=@date
,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
FROM @xmlData.nodes('/ machForm_RuleSetRules') as [Table]([Column])
)

insert into machForm_RuleSetRules(rulesetid,rulesid,createdby,createddate)
select rulesetid,rulesid,createdby,convert(datetime,createddate) from XmlData

	END

END TRY

BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrorNumber
			      ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

END

EXEC usp_EditMachFormRules_test 
						  @RuleSetName='c'			
						  ,@FormID=1				
						  ,@RelationshipSubTypeID=1
						  ,@RelationshipTypeID=1	
						  ,@Condition='1'				
						  ,@GroupID=45				
						  ,@EnableYN=1				
						  ,@LoginUser=1			
						  ,@RuleSetId=''
						  ,@xmldata='
						  
						    <machForm_RuleSetRules>
						  
						      <RulesID>3</RulesID>
						  
						    </machForm_RuleSetRules>
						  
						    <machForm_RuleSetRules>
						  
						      <RulesID>7</RulesID>

						    </machForm_RuleSetRules>

						    <machForm_RuleSetRules>

						      <RulesID>5</RulesID>

						    </machForm_RuleSetRules>

						    <machForm_RuleSetRules>

						      <RulesID>2</RulesID>

						    </machForm_RuleSetRules>'
						  


select * from machForm_RuleSet
select * from machForm_RuleSetrules