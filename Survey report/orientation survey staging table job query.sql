

CREATE PROCEDURE USP_orientationSurveyStg
AS
BEGIN

IF EXISTS (select 1 from sys.objects where name='StgTbl_SurveyRpt_147' and type='u')
DROP TABLE StgTbl_SurveyRpt_147;

IF EXISTS (select 1 from sys.objects where name='StgTbl_SurveyRpt_orientation' and type='u')
DROP TABLE StgTbl_SurveyRpt_orientation;



		SELECT * INTO #surveypro_users FROM surveypro_users
		
		ALTER TABLE #surveypro_users
		ADD contactid INT

		UPDATE s
		SET s.contactid=-(u.connid)
		FROM #surveypro_users s
		INNER JOIN user_accounts u
		ON s.userid=u.user_id
		
		
		CREATE TABLE #answers
		(
		 id						INT			 IDENTITY(1,1)
		,Survey_Name			VARCHAR(100)
		,Parent_name			VARCHAR(100)
		,Email				    VARCHAR(100)
		,City				    VARCHAR(100)
		,Phone				    VARCHAR(100)
		,CaseNumber			    NVARCHAR(MAX)
		,Survey_Completion_Date DATE
		,Answer				    VARCHAR(MAX)
	    ,contactid				INT
		,userid					INT
		)
		
		INSERT INTO #answers
		(
		 Survey_Name			
		,Parent_name			
		,Email				    
		,City				    	    
		,Survey_Completion_Date 
		,Answer				    
		,contactid	
		,userid
		)
					
		SELECT sc.campaign 
			  ,su.name
			  ,ua.email
			  ,ca.city	 
			  ,su.date
			  ,su.answer
			  ,su.contactid
			  ,su.userid
		
		FROM #surveypro_users su
		
		INNER JOIN surveypro_campaigns sc ON sc.campaign_id=su.campaign_id
		--INNER JOIN contactemail ce ON ce.ContactId=su.contactid
		INNER JOIN user_accounts ua ON ua.user_id=su.userid
		INNER JOIN contactaddress ca ON ca.ContactId=su.contactid
		--INNER JOIN contactphone cp ON cp.ContactID=su.contactid
		--INNER JOIN rel_relationship r ON r.user_id=su.userid
		
		--WHERE r.connid>0
		--AND ce.primaryemail=1 
		--AND cp.primaryphone=1 
		
		UPDATE #answers
		SET Phone=(select top 1 cp.phonenumber)
		FROM #answers a
		INNER JOIN contactphone cp
		ON cp.ContactID=a.contactid
		WHERE cp.primaryphone=1

		UPDATE #answers
		SET CaseNumber=STUFF((SELECT distinct ',' + r.rellabel
							  FROM rel_relationship r
							  WHERE a.userid = r.user_id and r.connid>0
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
		FROM #answers a
		
			
		--SPLITTING INTO QUESTION_ANSWER SET
		

		CREATE TABLE #splitanswers
		(
		 id						INT IDENTITY(1,1)
		,Survey_Name			VARCHAR(100)
		,Parent_name			VARCHAR(100)
		,Email				    VARCHAR(100)
		,City				    VARCHAR(100)
		,Phone				    VARCHAR(100)
		,CaseNumber			    NVARCHAR(MAX)
		,Survey_Completion_Date DATE
		,Answer				    VARCHAR(100)
		,answers				VARCHAR(100)
		)
		
		DECLARE @answer					VARCHAR(100)
		DECLARE @start_row				INT=1
		DECLARE @end_row				INT
		DECLARE @Survey_Name   			VARCHAR(100)
		DECLARE @Parent_name			VARCHAR(100)
		DECLARE @Email	    			VARCHAR(100)
		DECLARE @City   				VARCHAR(100)
		DECLARE @Phone	    			VARCHAR(100)
		DECLARE @CaseNumber    			NVARCHAR(MAX)
		DECLARE @Survey_Completion_Date DATE
		
		SELECT @end_row=count(1) from #answers
		
		WHILE (@start_row <= @end_row) 
		BEGIN  
				  	    					
				SELECT   @answer				 = answer
						,@Survey_Name   		 = Survey_Name
						,@Parent_name			 = Parent_name
						,@Email	    			 = Email
						,@City   				 = City
						,@Phone	    			 = Phone
						,@CaseNumber    		 = CaseNumber
						,@Survey_Completion_Date = Survey_Completion_Date
		
				FROM #answers
				WHERE id=@start_row
		
				INSERT INTO #splitanswers(answers)	      
				SELECT value FROM udf_Split_into_rows(@answer)
		
				UPDATE #splitanswers
				SET Survey_Name				= @Survey_Name
				   ,Parent_name			 	= @Parent_name			
				   ,Email	    			= @Email	    			
				   ,City   				 	= @City   				
				   ,Phone	    			= @Phone	    			
				   ,CaseNumber    		 	= @CaseNumber    		
				   ,Survey_Completion_Date	= @Survey_Completion_Date
				   ,Answer			     	= @Answer
		
				WHERE Survey_Name			    is null			
				  AND Parent_name			    is null			 
				  AND Email	    			    is null	
				  AND City   				    is null	
				  AND Phone	    		        is null	
				  AND CaseNumber    		 	is null	
				  AND Survey_Completion_Date	is null	
				  AND Answer			  		is null	
						   
				SET @start_row=@start_row+1
		
		END
		
		--SPLITTING INTO QUESTIONS AND ANSWERS
		
		
		CREATE TABLE #splitanswers2
		(
		 id		INT IDENTITY(1,1)
		,qn		VARCHAR(50)
		,ans	VARCHAR(50)
		)
		
		DECLARE @qn_ans VARCHAR(MAX)
		DECLARE @start_row1 int=1
		DECLARE @end_row1 int
		
		SELECT @end_row1=count(1) from #splitanswers
		
		WHILE (@start_row1 <= @end_row1) 
		BEGIN  
		
				SELECT @qn_ans = answers 
				FROM #splitanswers 
				WHERE id=@start_row1
		
				INSERT INTO #splitanswers2 
				SELECT qn,ans FROM udf_Split_into_columns(@qn_ans);
		
				SET @start_row1=@start_row1+1
		
		END
		
		DELETE FROM #splitanswers2
		WHERE ans like '%#%'
		
		
		SELECT s.id
			  ,sc.Campaign_id
			  ,s.Survey_Name
			  ,s.Parent_name
			  ,s.Email
			  ,s.City
			  ,s.Phone
			  ,s.CaseNumber
			  ,s.Survey_Completion_Date
			  ,q.question
			  ,a.answer
		INTO StgTbl_SurveyRpt_147
		FROM #splitanswers s
		JOIN #splitanswers2 ss on s.id=ss.id
		JOIN surveypro_questions q on q.question_id=ss.qn
		JOIN surveypro_answers a on a.answer_id=ss.ans
		JOIN surveypro_campaigns sc on sc.campaign=s.Survey_Name

		WHERE sc.Campaign_id=147
		

--StgTbl_SurveyRpt_147

--PIVOT QUESTIONS

create table #tbl
(id						 int
,Campaign_id			 int
,Survey_Name			 varchar(max)
,Parent_name			 varchar(max)
,Email					 varchar(max)
,City					 varchar(max)
,Phone					 varchar(max)
,CaseNumber				 nvarchar(max)
,Survey_Completion_Date	 date
,[q1]					 varchar(max)
,[q2]					 varchar(max)
,[q3]					 varchar(max)
,[q4]					 varchar(max)
,[q5]					 varchar(max)
,[q6]					 varchar(max)
,[q7]					 varchar(max)
,[q8]					 varchar(max)
,[q9]					 varchar(max)
,[q10]				     varchar(max)
)

insert into #tbl

SELECT 
 id
,Campaign_id
,Survey_Name
,Parent_name
,Email
,City
,Phone
,CaseNumber
,Survey_Completion_Date
,[Role]
,[The information on iadoptu.org was clearly organized]
,[The information on iadoptu.org was helpful and I understand what is required to become a Foster/Adoptive Resource Parent.]
,[The information on the video at http://iadoptu.org/content/getting-started was informative regarding the current needs]
,[My first contact with the Agency was friendly and helpful.]
,[The presentation at the orientation was clear and concise]
,[The presenter at the orientation was knowledgeable and answered all my questions.]
,[The orientation made clear the steps needed to become a Foster/ Adoptive Resource Parent.]
,[What information about the foster/adoptive process was lacking from the iadoptu.org site?]
,[Please provide two suggestions to improve the contents of the http://iadoptu.org/content and the orientation.]
FROM
(SELECT * 
 FROM StgTbl_SurveyRpt_147) AS SourceTable
PIVOT
(
max(answer)
FOR question IN 
([Role]
,[The information on iadoptu.org was clearly organized]
,[The information on iadoptu.org was helpful and I understand what is required to become a Foster/Adoptive Resource Parent.]
,[The information on the video at http://iadoptu.org/content/getting-started was informative regarding the current needs]
,[My first contact with the Agency was friendly and helpful.]
,[The presentation at the orientation was clear and concise]
,[The presenter at the orientation was knowledgeable and answered all my questions.]
,[The orientation made clear the steps needed to become a Foster/ Adoptive Resource Parent.]
,[What information about the foster/adoptive process was lacking from the iadoptu.org site?]
,[Please provide two suggestions to improve the contents of the http://iadoptu.org/content and the orientation.]
)) AS PivotTable


select 
 t.id
,t.Campaign_id
,t.Survey_Name
,t.Parent_name
,t.Email
,t.City
,t.Phone
,t.CaseNumber
,t.Survey_Completion_Date
,t.[q1]	
,t.[q2]	
,t.[q3]	
,t.[q4]	
,t.[q5]	
,t.[q6]	
,t.[q7]	
,t.[q8]	
,t.[q9]	
,t.[q10]	
,s.question
,s.answer

into #tbl2
from #tbl t
join StgTbl_SurveyRpt_147 s
on t.id=s.id


select * into StgTbl_SurveyRpt_orientation
from #tbl2


--UPDATING ANSWERS

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
FROM StgTbl_SurveyRpt_orientation
INSERT INTO #qns
(qn)
VALUES('q1'),('q2'),('q3'),('q4'),('q5'),('q6'),('q7'),('q8'),('q9'),('q10') 

DECLARE @mincnt		INT 
	   ,@startrow	INT 
	   ,@endrow		INT 
	   ,@maxCnt		INT 
	   ,@answer_n	NVARCHAR(MAX) 
	   ,@name		VARCHAR(100) 
	   ,@qn			VARCHAR(MAX) 
	   ,@dquery		NVARCHAR(MAX) 
	   ,@squery		NVARCHAR(MAX)

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
				SET @answer_n = 0
				SET @squery= '
				 SELECT @answer_n = ISNULL(answer,0) from StgTbl_SurveyRpt_orientation
				 WHERE answer= '+@qn+' and Email= '''+@name+'''' 
				-- print @squery 
				EXECUTE sp_executesql @squery, N'@answer_n NVARCHAR(max) output',@answer_n OUTPUT
				SELECT @answer_n =REPLACE(@answer_n,'''','') 

				SET @dquery='
				 UPDATE StgTbl_SurveyRpt_orientation
				 SET '+@qn+' = '''+@answer_n+''' where Email= '''+@name +'''' print @dquery exec(@dquery)
				SET @startrow=@startrow+1 
		END
		SET @startrow=1
	SET @mincnt=@mincnt+1 
END


DROP TABLE #surveypro_users
		  ,#answers
		  ,#splitanswers
		  ,#splitanswers2
		  ,#tbl
		  ,#tbl2
		  ,#names
		  ,#qns

END
