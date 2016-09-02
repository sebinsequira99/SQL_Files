Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROC usp_CalculateMatchingScore --0,0,-1432,625,01,0
(
	 @ConnID int =0
	,@ConnectionId int=0
	,@MchConnID int =0
	,@MchConnectionID int =0
	,@ExecAll bit=0
	,@ExecMatchAll bit=0
)
AS
BEGIN

--CategoryType 
--1= Yes?no
--2=Scale
--3=Reverse Scale
--4=Single Choice
--5=Multiple Choice

DECLARE  @SessionID  INT
		,@MinCntAp Int
		,@MinCntCd Int
		,@MaxCntAp Int
		,@MaxCntCd Int
		,@MatchConnID INT
		,@MatchConnectionID INT
		,@MinCntCdBkp int
		,@MinCntQstns int
		,@MaxCntQstns int
		,@MatchQstnID int
		,@ChildAnswer varchar(max)
		,@AnswerType Int
		,@NoOfOptions int
		,@IsScalable Int
		,@Range1 Int
		,@Range2 int				
		,@Answer varchar(max)
		,@Weightage Decimal(10,3)
		,@Score Decimal(10,3)
		,@QuestionID INT
		,@Weightage1 Decimal(10,3)
		,@Weightage2 Decimal(10,3)
		,@Weightage3 Decimal(10,3)
		,@Weightage4 Decimal(10,3)
		,@IsAcceptable bit
		,@NoOfQstns int
		,@NeedBabyBoy bit=1
		,@NeedBabyGirl bit=1
		,@ChildGender Varchar(10)


SET @Score=0

INSERT INTO MatchScoreCalcSession(ExecDate) SELECT GETDATE()
SET @SessionID=Scope_Identity()

IF @ExecAll=1
BEGIN
	INSERT INTO tbl_Qstn_ConnId(SessionID,ConnId,ConnectionID) SELECT DISTINCT  @SessionID,A.Connid,A.ConnectionID
	FROM Questionnaire Q 
	INNER JOIN QuestionnaireAnswers A ON Q.ID=A.QuestionID 
	WHERE  Q.ShowToApplicant=1
END
ELSE
BEGIN
	INSERT INTO tbl_Qstn_ConnId(SessionID,ConnId,ConnectionID) SELECT   @SessionID,@ConnID,@ConnectionID  
END

IF @ExecMatchAll=1
BEGIN
	INSERT INTO tbl_Qstn_MatchConnId(SessionID,ConnID,ConnectionID) SELECT DISTINCT  @SessionID,A.Connid,A.ConnectionID
		FROM Questionnaire Q 
		INNER JOIN QuestionnaireAnswers A ON Q.ID=A.QuestionID 
		WHERE  Q.ShowToChild=1 
END
ELSE
BEGIN
	INSERT INTO tbl_Qstn_MatchConnId(SessionID,ConnId,ConnectionID) SELECT   @SessionID,@MchConnID,@MchConnectionID  
END

SELECT @NoOfQstns= COUNT(1) FROM Questionnaire WHERE  ShowToApplicant=1

INSERT INTO tbl_Qstn_ApplicantQuestionare(SessionID,QuestionID,MatchingQstnID,AnswerType,NoOfOptions,IsScalable,Range1,Range2,Connid,ConnectionID,Answer,Weightage)
	SELECT @SessionID,Q.ID as  QuestionID,Q.matchingQuestionID,Q.AnswerType,Q.NoOfOptions,Q.IsScalable,Q.Range1,Q.Range2,A.Connid,A.ConnectionID,A.Answer,A.weighTage
	FROM Questionnaire Q
	LEFT JOIN QuestionnaireAnswers A ON Q.ID=A.QuestionID AND ISNULL(A.IsSkipped,0)=0
	LEFT JOIN tbl_Qstn_ConnId C ON  A.ConnID=C.ConnID and A.CONNECTIONID=C.CONNECTIONID 
	 WHERE  Q.ShowToApplicant=1 AND C.SessionID=@SessionID


INSERT INTO tbl_Qstn_ChildQuestionare(SessionID,QuestionID,MatchingQstnID,AnswerType,NoOfOptions,IsScalable,Range1,Range2,Connid,ConnectionID,Answer,Weightage)
	SELECT @SessionID,Q.ID as  QuestionID,Q.matchingQuestionID,Q.AnswerType,Q.NoOfOptions,Q.IsScalable,Q.Range1,Q.Range2,A.Connid,A.ConnectionID,A.Answer,A.weighTage
	FROM Questionnaire Q
	LEFT JOIN QuestionnaireAnswers A ON Q.ID=A.QuestionID AND ISNULL(A.IsSkipped,0)=0
	WHERE  Q.ShowToChild=1


SELECT @MinCntAp = MIN(ID) , @MaxCntAp = MAX(ID) FROM tbl_Qstn_ConnId	   WHERE SessionID=@SessionID
SELECT @MinCntCd = MIN(ID) , @MaxCntCd = MAX(ID) FROM tbl_Qstn_MatchConnId WHERE SessionID=@SessionID


SET @MinCntCdBkp=@MinCntCd
 
WHILE(@MinCntAp<=@MaxCntAp)
BEGIN
	SELECT @ConnID= CONNID,@ConnectionID=ConnectionID FROM tbl_Qstn_ConnId WHERE ID=@MinCntAp
    SELECT * INTO #tbl_Qstn_ApplicantQuestionare FROM tbl_Qstn_ApplicantQuestionare WHERE CONNID=@ConnID AND ConnectionID=@ConnectionID AND SessionID=@SessionID
	
	WHILE (@MinCntCd<=@MaxCntCd)
	BEGIN
		 SELECT @MatchConnID= CONNID,@MatchConnectionID=ConnectionID FROM tbl_Qstn_MatchConnId WHERE ID=@MinCntCd
		 SELECT @MinCntQstns=MIN(ID),@MaxCntQstns=MAX(ID) FROM #tbl_Qstn_ApplicantQuestionare WHERE SessionID=@SessionID
		 WHILE(@MinCntQstns<=@MaxCntQstns)
		 BEGIN
			SET @IsAcceptable=1
			--Print 'Inside loop3'
		
			 SELECT  @QuestionID=QuestionID
					,@MatchQstnID=MatchingQstnID
					,@AnswerType =AnswerType
					,@NoOfOptions =(NoOfOptions-1)
					,@IsScalable =IsScalable
					,@Range1 =Range1
					,@Range2 =Range2		
					,@Answer =Answer
					 FROM #tbl_Qstn_ApplicantQuestionare WHERE ID=@MinCntQstns
			SET @ChildAnswer=NULL
		
			SELECT @ChildAnswer=Answer,@Weightage=Weightage FROM tbl_Qstn_ChildQuestionare WHERE CONNID=@MatchConnID AND ConnectionID=@MatchConnectionID AND SessionID=@SessionID AND QuestionID=@MatchQstnID
				
			IF @Weightage=0
			BEGIN
			SET @NoOfQstns=@NoOfQstns-1			
			END
			IF @ChildAnswer IS NOT NULL AND @Weightage>0
			BEGIN				
				IF @QuestionID=1
				BEGIN	
					IF @ChildAnswer='male'  
					BEGIN
						IF @Answer='P'
						BEGIN
							SET @Score=@Score+100
						END
						ELSE IF @Answer='A'
						BEGIN
							SET @Score=@Score+66.66
						END
						ELSE IF @Answer='WC'
						BEGIN
							SET @Score=@Score+33.3
						END
						ELSE IF @Answer='U'
						BEGIN
							SET @Score=0
							SET @IsAcceptable=0
							SET @NeedBabyBoy=0
						END
					END
				END
				ELSE IF @QuestionID=2
				BEGIN			
					IF @ChildAnswer='female'  
					BEGIN
						IF @Answer='P'
						BEGIN
							SET @Score=@Score+100
						END
						ELSE IF @Answer='A'
						BEGIN
							SET @Score=@Score+66.66
						END
						ELSE IF @Answer='WC'
						BEGIN
							SET @Score=@Score+33.3
						END
						ELSE IF @Answer='U'
						BEGIN
							SET @Score=0
							SET @IsAcceptable=0
							SET @NeedBabyGirl=0
						END
					END					
				END
				ELSE IF @QuestionID=83
				BEGIN					
					IF EXISTS (SELECT 1 FROM dbo.ArrayListToTable(@Answer)  A WHERE A.ArrayVal in (SELECT T.ARRAYVAL FROM dbo.ArrayListToTable(@ChildAnswer) T))
					 BEGIN
					  SET @Score=@Score+100				
					 END
					 ELSE
					 BEGIN
						 SET @Score=@Score+0
					END
		
				END
				ELSE
				BEGIN				
					IF (@AnswerType>0)
					BEGIN
						IF ISNULL(@IsScalable,0)=0
						BEGIN						
							IF @Weightage=100.0
							BEGIN				 
								IF @ChildAnswer='Y'  
								BEGIN
									IF @Answer='P'
									BEGIN
										SET @Score=@Score+100
									END
									ELSE IF @Answer='A'
									BEGIN
										SET @Score=@Score+66.66
									END
									ELSE IF @Answer='WC'
									BEGIN
										SET @Score=@Score+33.3
									END
									ELSE IF @Answer='U'
									BEGIN
									--	SET @Score=0
										SET @IsAcceptable=0
									END
								END								
								IF @ChildAnswer='N'  
								BEGIN
							 		IF @Answer='P'
									BEGIN
										--SET @Score=0	
										SET @IsAcceptable=0									
									END
									ELSE IF @Answer='A'
									BEGIN
										SET @Score=@Score+33.3										
									END
									ELSE IF @Answer='WC'
									BEGIN
										SET @Score=@Score+66.66
									END
									ELSE IF @Answer='U'
									BEGIN	
										SET @Score=@Score+100										
									END
								END
							END
							ELSE IF  @Weightage<100.0
							BEGIN
								SET @Weightage1=@Weightage
								SET @Weightage4=@Weightage/3
								SET @Weightage2=@Weightage4*2
								SET @Weightage3=@Weightage4								
								
								IF @ChildAnswer='Y'  
								BEGIN
									IF @Answer='P'
									BEGIN
										SET @Score=@Score+@Weightage1
									END
									ELSE IF @Answer='A'
									BEGIN
										SET @Score=@Score+@Weightage2
									END
									ELSE IF @Answer='WC'
									BEGIN
										SET @Score=@Score+@Weightage3
									END
									ELSE IF @Answer='U'
									BEGIN
										SET @Score=@Score+0									
									END
								END
								IF @ChildAnswer='N'  
								BEGIN
									IF @Answer='P'
									BEGIN
										--SET @Score=0	
										SET @IsAcceptable=0									
									END
									ELSE IF @Answer='A'
									BEGIN
										SET @Score=@Score+@Weightage3										
									END
									ELSE IF @Answer='WC'
									BEGIN
										SET @Score=@Score+@Weightage2
									END
									ELSE IF @Answer='U'
									BEGIN
										SET @Score=@Score+@Weightage1
									END
								END
							END

						END
						ELSE IF @IsScalable=1
						BEGIN						
							IF  ISNUMERIC(@ChildAnswer)=1
							BEGIN
								IF @ChildAnswer>= @Range1 AND  @ChildAnswer<= @Range2 
								BEGIN
									IF @Weightage=100.0
									BEGIN			
											IF @Answer='P'
											BEGIN																
												SET @Score=@Score+100
											END
											ELSE IF @Answer='A'
											BEGIN
												SET @Score=@Score+66.66
											END
											ELSE IF @Answer='WC'
											BEGIN
												SET @Score=@Score+33.3
											END
											ELSE IF @Answer='U'
											BEGIN
												SET @Score=@Score+0								
												SET @IsAcceptable=0	
											END					
									END
								END
							END
						END
					END
				END	
			END	
				
			 
			SET @MinCntQstns=@MinCntQstns+1
		END -- --While 3
	DELETE FROM QuestionaireResult_Stage WHERE CONNID=@ConnID AND ConnectionID=@ConnectionID AND MatchingConnID=@MatchConnID AND MatchingConnectionID=@MatchConnectionID
	
	
	SELECT @NoOfQstns= COUNT(1) FROM  tbl_Qstn_ChildQuestionare WHERE CONNID=@MatchConnID AND ConnectionID=@MatchConnectionID AND SessionID=@SessionID AND Weightage>0 
	SELECT @ChildGender=Answer FROM tbl_Qstn_ChildQuestionare WHERE CONNID=@MatchConnID AND ConnectionID=@MatchConnectionID AND SessionID=@SessionID AND QuestionID=81

	SET @NoOfQstns=ABS(@NoOfQstns)
	IF @Score>0 SET @Score=@Score/@NoOfQstns
	print 'NoOfQstns'
	print @NoOfQstns
	IF  @Score>100 SET  @Score=100.00

	SET @Score=CEILING(@Score)

	IF  @ChildGender='male'		
		BEGIN
			IF @NeedBabyBoy=0 SET @Score=0
		END
	ELSE IF @ChildGender='female'  
		BEGIN
			IF @NeedBabyGirl=0 SET @Score=0
		END 
	ELSE
		BEGIN
			SET @Score=0
		END
	 		
	print '-------'
	print @ConnID
	print @Score	
	print '-------' 
	 insert into QuestionaireResult_Stage (ConnId,ConnectionId, MatchingConnId, MatchingConnectionId,Score,LastUpdatedTime,isCommited )  values( @ConnID,@ConnectionID,@MatchConnID,@MatchConnectionID,@Score,GETDATE(),1)
	 SET @IsAcceptable=1
	 SET @Score=0
	 SET @ChildGender=''
	 SET @NeedBabyBoy=1
	 SET @NeedBabyGirl=1
	
	SET @MinCntCd=@MinCntCd+1
	END --While 2
	DROP TABLE  #tbl_Qstn_ApplicantQuestionare
	SET @MinCntAp = @MinCntAp+1
	SET @MinCntCd = @MinCntCdBkp
 
END  --While 1

DELETE FROM tbl_Qstn_ConnId				  WHERE SessionID=@SessionID
DELETE FROM tbl_Qstn_MatchConnId		  WHERE SessionID=@SessionID
DELETE FROM tbl_Qstn_ApplicantQuestionare WHERE SessionID=@SessionID
DELETE FROM tbl_Qstn_ChildQuestionare	  WHERE SessionID=@SessionID
DELETE FROM MatchScoreCalcSession		  WHERE SessionID=@SessionID

END






