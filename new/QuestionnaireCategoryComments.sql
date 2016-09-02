

/*=============================================================
Object name : QuestionnaireCategoryComments 
Description:	
===============================================================*/

IF exists (select 1 from sys.objects where name='QuestionnaireCategoryComments' and type='u')
DROP TABLE QuestionnaireCategoryComments;

CREATE TABLE QuestionnaireCategoryComments
(
 ID				INT			IDENTITY(1,1)
,CategoryID		INT			
,ConnID			INT			
,ConnectionID	INT		   
,Comment		VARCHAR(MAX)     
,UpdatedDate	DATETIME	 
);


--pk

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='PK_QuestionnaireCategoryComments_ID' AND type='pk')
BEGIN
  ALTER TABLE QuestionnaireCategoryComments
  DROP CONSTRAINT PK_QuestionnaireCategoryComments_ID;
END

ALTER TABLE QuestionnaireCategoryComments
ADD CONSTRAINT PK_QuestionnaireCategoryComments_ID 
PRIMARY KEY(ID);

