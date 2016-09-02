


exec usp_Getcaseworkeractivitylogs -79534,272754


CaseWorkerActivityLog where connid=-79534 and connectionid=272754


CREATE PROC usp_Getcaseworkeractivitylogs 
(
	@Connid int=0,
	@connectionid int=0 
)
AS
BEGIN
DECLARE @strDBName AS VARCHAR(100),
		@strQry NVARCHAR(MAX),
		@Connidout int
		
	SELECT DISTINCT @strDBName =  '['+[DBName]+']'                  
    FROM [IrrisCentral].[dbo].[lutPrimaryAgency]                     
    WHERE MAPDBName = db_name()
    
    SELECT @Connidout = UA.connid FROM user_accounts UA
	INNER JOIN CaseWorkerActivityLog CW ON CW.CaseWorkerId = UA.user_id
    GROUP BY UA.connid			   
   

	SET @strQry = 'SELECT ID AS unq_id,
						  ActivityIdentifier AS identifier,				  
						 UA.first_name+'' ''+UA.last_name AS cwname ,
						   R1.RelLabel as caselabel,
						   upper(substring(CW.Action ,1,1)) +
	                       lower(substring(CW.Action,2,1000))as activity,
						   CONVERT(VARCHAR(10), CW.ActivityTime,101)  +'' ''+ CONVERT(VARCHAR(8),CW.ActivityTime,108)as activitytime,
						   --CA.ActRe AS notesubject,
						   CASE ISNULL(CW.Subject,'''')WHEN '''' THEN CAST(CA.ActRe as VARCHAR(MAX))  ELSE CAST(CW.Subject AS VARCHAR(MAX)) END notesubject
					FROM CaseWorkerActivityLog CW
					INNER JOIN ' + @strDBName + '.dbo.rel_relationship R1 on R1.Connectionid = CW.Connectionid 
					INNER JOIN ' + @strDBName + '.dbo.rel_relationship R2 ON(R2.Connectionid = R1.connid and R2.connid = '+ cast(@Connid as VARCHAR(10))+')
					LEFT JOIN user_accounts UA ON CW.CaseWorkerId= UA.user_id --and user_type =''agency_user''
					LEFT JOIN' + @strDBName + '.dbo.contactactivity CA ON CA.ContactActivityId = CW.ContactActivityId
					WHERE CW.ConnId = ' + cast(@Connid as VARCHAR(10))
				IF(isnull(@connectionid,0)!=0)
				SET @strQry = @strQry + ' AND CW.Connectionid='  + cast(@connectionid as VARCHAR(10))+' OR isnull(CW.Connectionid,0) =0'
				
				SET @strQry = @strQry + 'ORDER BY CW.ActivityTime DESC'
	--PRINT @strQry
    EXEC(@strQry)
END




