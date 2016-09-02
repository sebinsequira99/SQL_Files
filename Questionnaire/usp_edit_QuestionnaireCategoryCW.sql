		

--exec usp_edit_QuestionnaireCategoryCW @CaseworkerId=257
--									 ,@xmlData = '<Data><Values>
--												  <id>1</id>
--												  <weightage>50</weightage>
--												  </Values><Values>
--												  <id>2</id>
--												  <weightage>15</weightage>
--												  </Values><Values>
--												  <id>3</id>
--												  <weightage>25</weightage>
--												  </Values><Values>
--												  <id>4</id>
--												  <weightage>10.00</weightage>
--												  </Values><Values>
--												  <id>5</id>
--												  <weightage>10.00</weightage>
--												  </Values><Values>
--												  <id>6</id>
--												  <weightage>25.00</weightage>
--												  </Values><Values>
--												  <id>7</id>
--												  <weightage>35.00</weightage>
--												  </Values><Values>
--												  <id>8</id>
--												  <weightage>30.00</weightage>
--												  </Values><Values>
--												  <id>9</id>
--												  <weightage>100.00</weightage>
--												  </Values></Data>'



--PROCEDURE TO INSERT AND UPDATE QuestionnaireCategoryCW
--======================================================================

USE mapdev

IF exists (select 1 from sys.objects where name='usp_edit_QuestionnaireCategoryCW' and type='p')
DROP PROCEDURE usp_edit_QuestionnaireCategoryCW;

GO

CREATE PROCEDURE usp_edit_QuestionnaireCategoryCW
(
 @CaseworkerId	INT=null
,@xmlData		XML=''			  	 
)

AS

BEGIN

WITH XmlData
AS 
(

SELECT i.value('id[1]', 'INT') as 'id',
       i.value('weightage[1]', 'DECIMAL(18,2)')  as 'Weightage'
FROM @xmlData.nodes('/Data/Values') i(i)

)

SELECT * INTO #xmlData FROM xmlData


IF NOT EXISTS (SELECT 1 FROM QuestionnaireCategoryCW WHERE CaseworkerId = @CaseworkerId)
BEGIN
	INSERT INTO QuestionnaireCategoryCW (ID
										,Category
										,CategoryType
										,Seq
										,Weightage
										,ShowToApplicant
										,ShowToChild
										,CaseworkerId
										,CreatedBy
										,CreatedDate
                                      )

									  SELECT  x.id
									         ,qc.Category
											 ,qc.CategoryType
											 ,qc.Seq 
											 ,x.Weightage
											 ,qc.ShowToApplicant
											 ,qc.ShowToChild
											 ,@CaseworkerId
											 ,@CaseworkerId
											 ,GETDATE()
									  FROM  #xmlData x
									  Inner join QuestionnaireCategory QC ON QC.ID = x.id
									  
END

ELSE

BEGIN
	   UPDATE q SET q.Weightage	   = x.Weightage		 
					 ,q.ModifiedBy	   = @CaseworkerId	 
					 ,q.ModifiedDate   = getdate()
				FROM
				QuestionnaireCategoryCW q
				Inner JOIN QuestionnaireCategory QC ON QC.id = q.id
				INNER JOIN #xmlData X ON x.id = q.id
				WHERE q.CaseworkerId = @CaseworkerId

END

END

