

CREATE TABLE #names
(id int identity(1,1)
,name varchar(50)
)
CREATE TABLE #qns
(id int identity(1,1)
,qn varchar(MAX)
)
INSERT INTO #names (name)
SELECT DISTINCT EMAIL
FROM StgTbl_SurveyRpt_HomeStudyServices
INSERT INTO #qns
(qn)
VALUES('q1'),('q2'),('q3'),('q4'),('q5')
DECLARE @mincnt INT 
, @startrow INT , @endrow INT 
, @maxCnt INT , @answer NVARCHAR(MAX) 
, @name VARCHAR(100) , @qn VARCHAR(MAX) 
, @dquery NVARCHAR(MAX) , @squery NVARCHAR(MAX)

SET @mincnt =1
SET @startrow=1
SELECT @maxCnt =MAX(id) FROM #names

SELECT @endrow=MAX(id) FROM #qns
WHILE(@mincnt<=@maxCnt) 
BEGIN
	SELECT @name=name
	FROM #names where id=@mincnt
		 WHILE(@startrow<=@endrow) 
		 BEGIN
				SELECT @qn=qn FROM #qns where id=@startrow				 
				SET @answer = 0
				SET @squery= '
				 SELECT @answer = ISNULL(answer,0) from StgTbl_SurveyRpt_HomeStudyServices
				 WHERE answer= '+@qn+' and Email= '''+@name+'''' 
				print @squery 
				EXECUTE sp_executesql @squery, N'@answer NVARCHAR(max) output',@answer OUTPUT
				SELECT @answer =REPLACE(@answer,'''','') 

				SET @dquery='
				 UPDATE StgTbl_SurveyRpt_HomeStudyServices
				 SET '+@qn+' = '''+@answer+''' where Email= '''+@name +''''
				print @dquery exec(@dquery)
				SET @startrow=@startrow+1 
		END
		SET @startrow=1
	SET @mincnt=@mincnt+1 
END



