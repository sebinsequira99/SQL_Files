
Declare    
     @Runsql nvarchar(max)
	 ,@strDBName VARCHAR(MAX)
	 ,@ConnId INT = 0
	 ,@ConnectionId INT =0   
     ,@MatchProfileNo INT =0    

--SELECT DISTINCT @strDBName= '['+[DBName]+']'         
--FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
--WHERE MapDbName = db_name()  
--print @strDBName	  
					  
--select * from [IrrisCentral].[dbo].[lutPrimaryAgency] 
					  
--select * from Questionnaire
					  
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


/*SELECT T.Id,T.Connid,T.Connectionid,T.CoupleConnId,T.RelTypeId,T.DisplayName,
						T.Score,T.State,T.County,T.Rank  FROM (select qrs.Id as Id,  
						qrs.Connid,  
						qrs.Connectionid,
						r.connid as CoupleConnId,
						r.RelationshipTypeId as RelTypeId,
						r.DisplayName+ ' (' + ISNULL(ltrim(rtrim(r.RelLabel)),'')  +') ' AS DisplayName,  
						qrs.score as Score,
						MAX(ISNULL(S.StateName,'')) as State,
						MAX(ISNULL(C.County,C1.CountyText)) as County,
						DENSE_RANK() OVER (ORDER BY qrs.score DESC) AS 'Rank',
						ROW_NUMBER() OVER (ORDER BY qrs.score DESC) AS 'RowNo'  
                    FROM QuestionaireResult_Stage qrs  
						INNER JOIN [MapDev].dbo.rel_relationship r on  qrs.ConnectionId=r.ConnectionId
						LEFT JOIN [MapDev].dbo.ContactAddress CA ON CA.ContactId = (qrs.connid*-1)
						LEFT JOIN lkpState S ON S.StateID = CA.StateID  AND ISNULL(S.StateID,'')!=0
						LEFT JOIN lkpCountyZip C ON  C.Zip = CA.Zip   AND ISNULL(C.Zip ,'')!=0
						LEFT JOIN lkpCounty C1 ON C1.CountyID = CA.Countyid 
					WHERE r.RelationshipTypeId!=-104 AND qrs.score > 0 AND qrs.MatchingConnid = 0  and qrs.MatchingConnectionId =0   
                    GROUP BY qrs.Id,qrs.Connid,qrs.Connectionid,r.connid,r.RelationshipTypeId,
							r.DisplayName,qrs.score,r.RelLabel)T Where T.RowNo < =0 ORDER BY T.Rank*/


/*DECLARE @fdf VARCHAR(MAX)
SET @fdf = 'sdsds,sfsf,sfsfs'

SELECT * FROM dbo.ArrayListToTable(@fdf) */

