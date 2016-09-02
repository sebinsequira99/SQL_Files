		

--exec usp_view_QuestionnaireCategoryCW @CaseworkerId=1


--PROCEDURE TO VIEW QuestionnaireCategoryCW
--======================================================================

USE mapdev

IF exists (select 1 from sys.objects where name='usp_view_QuestionnaireCategoryCW' and type='p')
DROP PROCEDURE usp_view_QuestionnaireCategoryCW;

GO

CREATE PROCEDURE usp_view_QuestionnaireCategoryCW
(
 @CaseworkerId INT=null	  	 
)

AS

BEGIN

IF EXISTS (SELECT 1 FROM QuestionnaireCategoryCW WHERE CaseworkerId = @CaseworkerId)
BEGIN

SELECT ID
	  ,Category
	  ,CategoryType
	  ,Seq
	  ,Weightage
	  ,ShowToApplicant
	  ,ShowToChild
	  ,CaseworkerId
	  ,CreatedBy
	  ,CreatedDate
	  ,ModifiedBy
	  ,ModifiedDate 
FROM QuestionnaireCategoryCW
WHERE caseworkerid=@CaseworkerId

END

ELSE

BEGIN

SELECT ID
	  ,Category
	  ,CategoryType
	  ,Seq
	  ,Weightage
	  ,ShowToApplicant
	  ,ShowToChild

FROM QuestionnaireCategory

END

END

