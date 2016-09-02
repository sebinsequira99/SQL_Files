Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE rolesqa

IF exists (select 1 from sys.objects where name='USP_SaveQuestionnaireAnswers' and type='p')
DROP PROCEDURE USP_SaveQuestionnaireAnswers;

GO


CREATE  PROCEDURE USP_SaveQuestionnaireAnswers
					@formdata XML
AS
BEGIN
	Set nocount on
	DECLARE  @ConniD			INT,
			 @ConnectionID		INT, 
			 @Date              DATETIME,
			 @Applicant1Fname	VARCHAR(100),
			 @Applicant1Lname	VARCHAR(100),
			 @Applicant2Fname	VARCHAR(100),
			 @Applicant2Lname	VARCHAR(100),
			 @Email				VARCHAR(100),
			 @IsSkipped              BIT
			
 -- Temp table creation       
    CREATE TABLE #QuestionnaireAnswers
				 (			 userid				int			
							,group_id			int			
							,menuid				int			not null
							,enabledyn			bit			not null
							,isgroup			bit			not null
							,CreatedBy			int			not null
							,CreatedDate		datetime	
							,LastModifiedBy		int	
							,LastModifiedDate	datetime
				 )
	--Insert data from xml to  temp table

		  SELECT @ConniD = i.value('ConniD[1]', 'INT') ,
				 @ConnectionID = i.value('ConnectionID[1]', 'INT') ,
				 @Date = i.value('Date[1]', 'DATETIME') ,
				 @Applicant1Fname = i.value('Applicant1Fname[1]', 'VARCHAR(100)') ,
				 @Applicant1Lname = i.value('Applicant1Lname[1]', 'VARCHAR(100)') ,
				 @Applicant2Fname = i.value('Applicant2Fname[1]', 'VARCHAR(100)') ,
				 @Applicant2Lname = i.value('Applicant2Lname[1]', 'VARCHAR(100)') ,
				 @Email = i.value('Email[1]', 'VARCHAR(100)') 
			FROM @formdata.nodes('/Data/Values') i(i)
			
			
			


			 INSERT INTO	#QuestionnaireAnswers 
				(  ConniD			
				  ,ConnectionID	 
				  ,Date			
				  ,Applicant1Fname	
				  ,Applicant1Lname	
				  ,Applicant2Fname	
				  ,Applicant2Lname	
				  ,Email
				  ,QuestionID
				  ,Answer
				  ,weightage
				  ,IsSkipped)	
	        SELECT   @ConniD,
					 @ConnectionID,
					 @Date,
					 @Applicant1Fname,
					 @Applicant1Lname,
					 @Applicant2Fname,
					 @Applicant2Lname,
					 @Email,
	                 i.value('QuestionID[1]', 'INT'),
					 i.value('Answer[1]', 'NVARCHAR(MAX)'),
					 i.value('Weightage[1]', 'DECIMAL(5,2)'),
					 i.value('IsSkipped[1]','BIT')
			FROM @formdata.nodes('/ Users / users') i(i)
				 
   
   -- Check QuestionnaireAnswers table contain any records with connid and connectionid 
   
   INSERT INTO QuestionnaireAnswers 
            (  QuestionID		
			  ,ConniD			
			  ,ConnectionID	 
			  ,Answer			
			  ,Date			
			  ,Applicant1Fname	
			  ,Applicant1Lname	
			  ,Applicant2Fname	
			  ,Applicant2Lname	
			  ,Email
			  ,Weightage
			  ,IsChanged
			  ,IsSkipped)
	SELECT 	
			  QuestionID		
			  ,ConniD			
			  ,ConnectionID	 
			  ,Answer			
			  ,Date			
			  ,Applicant1Fname	
			  ,Applicant1Lname	
			  ,Applicant2Fname	
			  ,Applicant2Lname	
			  ,Email
			  ,Weightage
			  ,1
			  ,IsSkipped
	 FROM   #QuestionnaireAnswers 	
	 WHERE isnull(Answer,'') != '' AND QuestionID NOT IN (SELECT QuestionID FROM QuestionnaireAnswers Where connid =@ConniD and connectionid =@ConnectionID)
	 
	 UPDATE Q1 SET Q1.Answer = Q2.Answer,Q1.IsChanged =1,Q1.weightage = Q2.weightage,Q1.IsSkipped = Q2.IsSkipped
	 FROM QuestionnaireAnswers Q1
	 INNER JOIN #QuestionnaireAnswers Q2 ON  Q1.ConniD =Q2.ConniD AND Q1.ConnectionID = Q2.ConnectionID
					          AND Q1.QuestionID = Q2.QuestionID 
     WHERE Q1.Answer != Q2.Answer OR Q1.weightage != Q2.weightage OR Q1.IsSkipped != Q2.IsSkipped
	 				          
	
	Set nocount off
   
END



