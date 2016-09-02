


--PROCEDURE TO DELETE FROM machForm_RuleSet
--==============================================

use mapdev

IF exists (select 1 from sys.objects where name='usp_delete_machForm_RuleSet' and type='p')
DROP PROCEDURE usp_delete_machForm_RuleSet;

GO

CREATE PROCEDURE usp_delete_machForm_RuleSet
(
@RuleSetID INT									
)

AS
BEGIN
		delete from machForm_RuleSet
		where (RuleSetID=@RuleSetID)

END

EXEC usp_delete_machForm_RuleSet @RuleSetID=3
						
						
						
				