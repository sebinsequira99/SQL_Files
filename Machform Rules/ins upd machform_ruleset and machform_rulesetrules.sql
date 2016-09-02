


--PROCEDURE TO INSERT AND UPDATE machForm_RuleSet,machForm_RuleSetRules
--========================================================================

USE mapdev

IF exists (select 1 from sys.objects where name='usp_EditMachFormRules' and type='p')
DROP PROCEDURE usp_EditMachFormRules;

GO

CREATE PROCEDURE usp_EditMachFormRules
(
 @RuleSetName			VARCHAR(20)=''	 
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

IF EXISTS(select 1 from machForm_RuleSet where RuleSetName=@RuleSetName)

	BEGIN

			UPDATE machForm_RuleSet
			SET  FormID=@FormID
				,RelationshipSubTypeID=@RelationshipSubTypeID
				,RelationshipTypeID=@RelationshipTypeID
				,Condition=@Condition
				,GroupID=@GroupID
				,EnableYN=@EnableYN
				,ModifiedBy=@LoginUser
				,ModifiedDate=getdate()

			WHERE RuleSetName=@RuleSetName;


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
						
	END;

WITH XmlData AS 
(

SELECT

 [Table].[Column].value('RuleSetID[1]', 'INT')	as 'RuleSetID'
,[Table].[Column].value('RulesID[1]', 'INT')	as 'RulesID'
,[Table].[Column].value('DeletedYN[1]', 'BIT')	as 'DeletedYN'
,[Table].[Column].value(' Loginuser[1]', 'INT')	as 'Loginuser'

FROM @xmlData.nodes('/ machForm_RuleSetRules') as [Table]([Column])

)


MERGE INTO machForm_RuleSetRules m
USING XmlData x ON (m.RuleSetID = x.RuleSetID) AND (m.RulesID = x.RulesID)

WHEN MATCHED

	THEN 

		UPDATE SET 

				      m.RuleSetID		=	x.RuleSetID					
				     ,m.RulesID			=	x.RulesID	 
				     ,m.DeletedYN		=	x.DeletedYN
					 ,m.ModifiedBy		=	x.Loginuser
					 ,m.ModifiedDate	=	getdate()


WHEN NOT MATCHED

	THEN 

			INSERT (RuleSetID		
				   ,RulesID		
				   ,DeletedYN		
				   ,CreatedBY		
				   ,CreatedDate)

			VALUES ( x.RuleSetID		
					,x.RulesID		
				    ,x.DeletedYN		
					,x.Loginuser		
				    ,getdate());


					
END TRY

BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrorNumber
			      ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

END

--EXEC usp_EditMachFormRules @RuleSetName='a'			
--						  ,@FormID=1				
--						  ,@RelationshipSubTypeID=1
--						  ,@RelationshipTypeID=1	
--						  ,@Condition='a'				
--						  ,@GroupID=45				
--						  ,@EnableYN=1				
--						  ,@LoginUser=1			
						  	
--						  ,@xmldata='
						  
--						    <machForm_RuleSetRules>
						  
--						      <RuleSetID>3</RuleSetID>
--						      <RulesID>1</RulesID>
--						      <DeletedYN>0</DeletedYN>
--						  	<Loginuser>1</Loginuser>
						  
--						    </machForm_RuleSetRules>
						  
						  
--						    <machForm_RuleSetRules>
						  
--						      <RuleSetID>3</RuleSetID>
--						      <RulesID>2</RulesID>
--						      <DeletedYN>0</DeletedYN>
--						  	<Loginuser>1</Loginuser>
						  
						  
--						    </machForm_RuleSetRules>
						  
						  
--						    <machForm_RuleSetRules>
						  
--						      <RuleSetID>3</RuleSetID>
--						      <RulesID>3</RulesID>
--						      <DeletedYN>0</DeletedYN>
--						  	<Loginuser>1</Loginuser>
						  
						  
--						    </machForm_RuleSetRules>
						  
						  
--						    <machForm_RuleSetRules>
						  
--						      <RuleSetID>3</RuleSetID>
--						      <RulesID>5</RulesID>
--						      <DeletedYN>0</DeletedYN>
--						  	<Loginuser>1</Loginuser>
						  
						  
--						    </machForm_RuleSetRules>'
						  