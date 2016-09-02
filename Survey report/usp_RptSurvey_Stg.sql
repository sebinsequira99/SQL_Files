
--use mapsdc

--DROP TABLE #surveypro_users
--DROP TABLE #answers
--DROP TABLE #splitanswers
--DROP TABLE #splitanswers2
--DROP TABLE StgTbl_SurveyRpt

GO

ALTER PROCEDURE usp_RptSurvey_Stg  
AS
BEGIN

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
		,CaseNumber			    VARCHAR(100)
		,Survey_Completion_Date DATE
		,Answer				    VARCHAR(MAX)
		)
		
		INSERT INTO #answers
		
		SELECT sc.campaign 
			  ,su.name
			  ,ce.contactemail
			  ,ca.city
			  ,cp.phonenumber
			  ,r.rellabel
			  ,su.date
			  ,su.answer
		
		FROM #surveypro_users su
		
		INNER JOIN surveypro_campaigns sc ON sc.campaign_id=su.campaign_id
		INNER JOIN contactemail ce ON ce.ContactId=su.contactid
		INNER JOIN contactaddress ca ON ca.ContactId=su.contactid
		INNER JOIN contactphone cp ON cp.ContactID=su.contactid
		INNER JOIN rel_relationship r ON r.user_id=su.userid
		
		WHERE ce.primaryemail=1 AND cp.primaryphone=1 AND r.connid>0
		
		
		
		--SPLITTING INTO QUESTION_ANSWER SET
		

		CREATE TABLE #splitanswers
		(
		 id						INT IDENTITY(1,1)
		,Survey_Name			VARCHAR(100)
		,Parent_name			VARCHAR(100)
		,Email				    VARCHAR(100)
		,City				    VARCHAR(100)
		,Phone				    VARCHAR(100)
		,CaseNumber			    VARCHAR(100)
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
		DECLARE @CaseNumber    			VARCHAR(100)
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
		INTO StgTbl_SurveyRpt
		FROM #splitanswers s
		JOIN #splitanswers2 ss on s.id=ss.id
		JOIN surveypro_questions q on q.question_id=ss.qn
		JOIN surveypro_answers a on a.answer_id=ss.ans
		JOIN surveypro_campaigns sc on sc.campaign=s.Survey_Name

END


