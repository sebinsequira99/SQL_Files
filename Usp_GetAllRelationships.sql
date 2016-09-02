


ALTER PROCEDURE [dbo].Usp_GetAllRelationships
    
    @CAccountKey		VARCHAR(100) = '',
    @ConnId1			VARCHAR(100) = '0',
    @ConnId2			VARCHAR(100) = '0',
	@PgmConnectionId	VARCHAR(100) = '0',
	@RelTypeId			VARCHAR(100) = '0'  
AS

Declare @SqlQry nvarchar(max),
        @strDBName VARCHAR(MAX)

BEGIN
            
   /* finding agency according to CAccountKey*/

    IF ( @CAccountKey <>'' AND ISNUMERIC(@CAccountKey)=1)
 
  BEGIN 
    SELECT  DISTINCT @strDBName= '['+[DBName]+']' 
    FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
    WHERE SiteID=@CAccountKey
  END
  IF( ISNULL(@ConnId1,'0') = 0 OR RTRIM(LTRIM(@ConnId1))='')
  SET  @ConnId1='0'
  IF( ISNULL(@ConnId2,'0') = 0 OR RTRIM(LTRIM(@ConnId2))='')
  SET  @ConnId2='0'
  
 IF (@strDBName is not null)
 BEGIN
  SET @SqlQry= 'SELECT distinct r2.ConnId
				,rst.RelationshipSubTypeId
				,rst.RelationshipSubTypeText    
				,r2.connectionid as ConnectionId1
				,rt.RelationshipTypeId as RelTypeid1
				,rt.RelationshipTypeText as RelTypeText1'
			   
  If @ConnId2 = 0
   SET @SqlQry = @SqlQry + '
   ,0 AS ConnectionId2
   ,0  as RelTypeid2
   ,''none'' as RelTypeText2'

  Else 
   SET @SqlQry = @SqlQry + '
						     ,coalesce((Select Top 1 r4.connectionid
							  From ' + @strDBName + '.dbo.Rel_Relationship r3
								inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId2,'0') + ' 
								inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							 where r3.connid = r2.Connid
								and r3.connectionid <> r2.connectionid
								and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),0) as ConnectionId2
						   ,coalesce((Select Top 1 rt4.RelationshipTypeId
							 From ' + @strDBName + '.dbo.Rel_Relationship r3
								  inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId2,'0') + ' 
								  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							 where r3.connid = r2.Connid
								  and r3.connectionid <> r2.connectionid
								  and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),0) as RelTypeid2
						      
						   , coalesce((Select Top 1 rt4.RelationshipTypeText
							 From ' + @strDBName + '.dbo.Rel_Relationship r3
								  inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId2,'0') + ' 
								  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							 where r3.connid = r2.Connid
								  and r3.connectionid <> r2.connectionid
								  and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),''none'') as RelTypeText2'   
  
  SET @SqlQry = @SqlQry + '
							, CONVERT(VARCHAR(10),r.RelationshipDateLastUpdated,110) as RelStartDate1
							, CONVERT(VARCHAR(10),r.RelEndDate,110) as RelEndDate1
							, CONVERT(VARCHAR(10),(Select Top 1 r4.RelationshipDateLastUpdated
							  From ' + @strDBName + '.dbo.Rel_Relationship r3
								  inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId2,'0') + ' 
								  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							 where r3.connid = r2.Connid
								  and r3.connectionid <> r2.connectionid
								  and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),110) as RelStartDate2
						   , CONVERT(VARCHAR(10),(Select Top 1 r4.RelEndDate
							  From ' + @strDBName + '.dbo.Rel_Relationship r3
								  inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId2,'0') + ' 
								  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							 where r3.connid = r2.Connid
								  and r3.connectionid <> r2.connectionid
								  and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),110) as RelEndDate2
							,ISNULL(' + @strDBName + '.dbo.udf_CoupleConnId(r2.ConnId,1),0) as IndConnId
						    FROM ' + @strDBName + '.dbo.Rel_Relationship r
							  inner join ' + @strDBName + '.dbo.Rel_Relationship r2 on r.connectionid = r2.connectionid and r2.Connid <> ' + isnull(@ConnId1,'0')+ '
							  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt on r2.RelationshipTypeId = rt.RelationshipTypeId
							  inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipSubType rst on rt.RelationshipSubTypeId = rst.RelationshipSubTypeId
						    WHERE r.connid = ' + isnull(@ConnId1,'0') + '
							  and (rst.Rel_SubType_isProgram=0 or rst.Rel_SubType_isProgram is null)
							  AND rst.Rel_SubType_ShowHide =1 -- AND r2.ConnId <= 0
							  '

  If @ConnId2 <> 0
   SET @SqlQry = @SqlQry + '
							   union

							   SELECT distinct r2.ConnId    
									,rst.RelationshipSubTypeId
									,rst.RelationshipSubTypeText
									,coalesce((Select Top 1 r4.connectionid
							   From ' + @strDBName + '.dbo.Rel_Relationship r3
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId1,'0') + ' 
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							   where r3.connid = r2.Connid
								   and r3.connectionid <> r2.connectionid
								   and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),0) as ConnectionId1
							  ,coalesce((Select Top 1 rt4.RelationshipTypeId
							  From  ' + @strDBName + '.dbo.Rel_Relationship r3
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId1,'0') + '
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							  where r3.connid = r2.Connid
								   and r3.connectionid <> r2.connectionid
								   and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),0) as RelTypeid1	
							  ,coalesce((Select Top 1 rt4.RelationshipTypeText
								From  ' + @strDBName + '.dbo.Rel_Relationship r3
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId1,'0') + '
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
								where r3.connid = r2.Connid
								   and r3.connectionid <> r2.connectionid
								   and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),''none'') as RelTypeText1
							       
								 ,r2.connectionid as ConnectionId2
								 ,rt.RelationshipTypeId as RelTypeid2
								 ,rt.RelationshipTypeText as RelTypeText2
								 ,CONVERT(VARCHAR(10),(Select Top 1 r3.RelationshipDateLastUpdated
							   From  ' + @strDBName + '.dbo.Rel_Relationship r3
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId1,'0') + '
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							   where r3.connid = r2.Connid
								   and r3.connectionid <> r2.connectionid
								   and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),110) as RelStartDate1
								 ,CONVERT(VARCHAR(10),(Select Top 1 r3.RelEndDate
							   From  ' + @strDBName + '.dbo.Rel_Relationship r3
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r4 on r3.connectionid = r4.connectionid and r4.Connid <> ' + isnull(@ConnId1,'0') + '
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt4 on r4.RelationshipTypeId = rt4.RelationshipTypeId
							   where r3.connid = r2.Connid
								   and r3.connectionid <> r2.connectionid
								   and rt4.RelationshipSubTypeId = rt.RelationshipSubTypeId),110) as RelEndDate1
							     
								 ,CONVERT(VARCHAR(10),r.RelationshipDateLastUpdated,110) as RelStartDate2
								 ,CONVERT(VARCHAR(10), r.RelEndDate,110) as RelEndDate2     
							     ,ISNULL(' + @strDBName + '.dbo.udf_CoupleConnId(r2.ConnId,1),0) as IndConnId
							   from ' + @strDBName + '.dbo.Rel_Relationship r
								   inner join ' + @strDBName + '.dbo.Rel_Relationship r2 on r.connectionid = r2.connectionid and r2.Connid <> ' +  isnull(@ConnId2,'0') + '
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt on r2.RelationshipTypeId = rt.RelationshipTypeId
								   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipSubType rst on rt.RelationshipSubTypeId = rst.RelationshipSubTypeId
							   WHERE r.connid = ' + isnull(@ConnId2,'0') + '
								 and (rst.Rel_SubType_isProgram=0 or rst.Rel_SubType_isProgram is null)
								 AND rst.Rel_SubType_ShowHide =1 --AND r2.ConnId <= 0'

   If @PgmConnectionId <> 0
			SET @SqlQry = @SqlQry + '
								   union
								    SELECT distinct r.ConnId    
										,rst.RelationshipSubTypeId
										,rst.RelationshipSubTypeText
										,r.Connectionid AS Connectionid1
										,r.RelationshipTypeId	as RelTypeid1
										,rt.RelationshipTypeText as RelTypeText1
										--,r.AssociationConnid 
										--,r.AssociationRelationshipTypeId
										,r.connectionid as ConnectionId2
										,rt.RelationshipTypeId as RelTypeid2
										,rt.RelationshipTypeText as RelTypeText2
										,CONVERT(VARCHAR(10), r.RelationshipDateLastUpdated,110) as RelStartDate1
									 ,CONVERT(VARCHAR(10), r.RelEndDate,110) as RelEndDate1
							     	 ,CONVERT(VARCHAR(10),r.RelationshipDateLastUpdated,110) as RelStartDate2
									 ,CONVERT(VARCHAR(10), r.RelEndDate,110) as RelEndDate2     
									 ,ISNULL(' + @strDBName + '.dbo.udf_CoupleConnId(r.ConnId,1),0) as IndConnId
								   from ' + @strDBName + '.dbo.Rel_Relationship r
									   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt on r.RelationshipTypeId = rt.RelationshipTypeId
									   inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipSubType rst on rt.RelationshipSubTypeId = rst.RelationshipSubTypeId
								   WHERE r.Connectionid = ' + isnull(@PgmConnectionId,'0') 
								  
     
	 
	  SET @SqlQry = @SqlQry + '
								 Order by rst.RelationshipSubTypeId'


	print @SqlQry 

	CREATE TABLE #result
	(
	 ConnId						INT			
	,RelationshipSubTypeId		INT
	,RelationshipSubTypeText	VARCHAR(500)			
	,ConnectionId1				INT		    
	,RelTypeid1					INT    
	,RelTypeText1				VARCHAR(500)			 
	,ConnectionId2				INT	 
	,RelTypeid2					INT	 
	,RelTypeText2				VARCHAR(500)	 
	,RelStartDate1				DATETIME	 
	,RelEndDate1				DATETIME	
	,RelStartDate2				DATETIME	
	,RelEndDate2				DATETIME	
	,IndConnId					INT	
	);

	INSERT INTO #result
	EXEC(@SqlQry);  
	END

	ALTER TABLE #result
	ADD Connid_FastFacts int

	Update #result
	SET Connid_FastFacts=CASE 
						 WHEN RelationshipSubTypeText='Family'
						 THEN connid
						 ELSE indconnid
						 END

	SELECT * FROM #result
	DROP TABLE #result

END







