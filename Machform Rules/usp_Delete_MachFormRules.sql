


--PROCEDURE TO DELETE FROM machForm_RuleSetrules
--============================================

--use mapdev

IF exists (select 1 from sys.objects where name='usp_DeleteMachFormRules' and type='p')
DROP PROCEDURE usp_DeleteMachFormRules;

GO

CREATE PROCEDURE usp_DeleteMachFormRules
(
 @RuleSetID	INT
,@RulesID	INT
,@LoginUser INT									
)

AS
BEGIN
	if(isnull(@RulesId,0)=0)
	BEGIN
		UPDATE machForm_RuleSetrules
		SET deletedyn=1
		   ,modifiedby=@LoginUser
		   ,modifieddate=getdate()

		WHERE (rulesetid=@RuleSetID)
	END
	ELSE
	BEGIN	
		UPDATE machForm_RuleSetrules
		SET deletedyn=1
		   ,modifiedby=@LoginUser
		   ,modifieddate=getdate()

		WHERE (rulesetid=@RuleSetID)
		AND (rulesid=@RulesID)
	END

		

END

--EXEC usp_DeleteMachFormRules @RuleSetID=3
--									 ,@RulesId=3
--									 ,@LoginUser=1
						
						

