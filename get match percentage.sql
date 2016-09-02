Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_GetMatchPercentage]      
        @ConnId			INT = 0      
       ,@ConnectionId	INT =0   
       ,@MatchProfileNo	INT =0    
AS   
Declare    
     @Runsql nvarchar(max),           
     @strDBName VARCHAR(MAX)     
BEGIN      
  
/* finding agency according to CAccountKey*/        
SELECT  DISTINCT @strDBName= '['+[DBName]+']'         
FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
WHERE MapDbName = db_name()   
  
 EXEC usp_CalculateMatchingScore 0,0,@ConnId,@ConnectionId,1,0
       
       SET @Runsql = 'SELECT T.Id,T.Connid,T.Connectionid,T.CoupleConnId,T.RelTypeId,T.DisplayName,
						T.Score,T.State,T.County,T.Rank  FROM (select qrs.Id as Id,  
						qrs.Connid,  
						qrs.Connectionid,
						r.connid as CoupleConnId,
						r.RelationshipTypeId as RelTypeId,
						r.DisplayName+ '' ('' + ISNULL(ltrim(rtrim(r.RelLabel)),'''')  +'') '' AS DisplayName,  
						qrs.score as Score,
						MAX(ISNULL(S.StateName,'''')) as State,
						MAX(ISNULL(C.County,C1.CountyText)) as County,
						DENSE_RANK() OVER (ORDER BY qrs.score DESC) AS ''Rank'',
						ROW_NUMBER() OVER (ORDER BY qrs.score DESC) AS ''RowNo''  
                    FROM QuestionaireResult_Stage qrs  
						INNER JOIN ' + @strDBName + '.dbo.rel_relationship r on  qrs.ConnectionId=r.ConnectionId
						LEFT JOIN ' + @strDBName + '.dbo.ContactAddress CA ON CA.ContactId = (qrs.connid*-1)
						LEFT JOIN lkpState S ON S.StateID = CA.StateID  AND ISNULL(S.StateID,'''')!=0
						LEFT JOIN lkpCountyZip C ON  C.Zip = CA.Zip   AND ISNULL(C.Zip ,'''')!=0
						LEFT JOIN lkpCounty C1 ON C1.CountyID = CA.Countyid 
					WHERE r.RelationshipTypeId!=-104 AND qrs.score > 0 AND qrs.MatchingConnid = ' + cast(@ConnId as varchar(1000)) + '  and qrs.MatchingConnectionId =' + cast(@ConnectionId as varchar(1000)) + '   
                    GROUP BY qrs.Id,qrs.Connid,qrs.Connectionid,r.connid,r.RelationshipTypeId,
							r.DisplayName,qrs.score,r.RelLabel)T Where T.RowNo < =' + CAST(@MatchProfileNo AS Varchar(20))
							+ ' ORDER BY T.Rank'					
							
							
   --print @Runsql   
   Exec (@Runsql)  
    
END


