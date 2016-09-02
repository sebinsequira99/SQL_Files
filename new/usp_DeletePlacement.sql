


relationshipId:353417		--working(AP's 6 panel)
parent_connid:353424
delete_connid:-99633
p_date:2016-3-29

--@RelationShipId 353425      --not working(child's 6 panel)
-- @PrimaryConnid 353416
-- @DeleteConnID -99637
-- p_date:2016-3-29
-- acckey = 164

 @OldConnectionID = 353425
 @ConnId=-99633
 SELECT  R.ConnectionID ,[dbo].udf_CoupleConnid(R.ConnId,1)  ,relationshipid , relationshiptypeid        
		 FROM [dbo].Rel_Relationship R                    
		 WHERE R.RelationShipId = 353425


CREATE PROCEDURE usp_DeletePlacement             
 @RelationShipId INT ,          
 @PrimaryConnid INT=0,
 @DeleteCaseYN bit =0,
 @DeleteConnID INT = 0,
 @DeleteDate DATETIME = ''                
 AS                
BEGIN               
	DECLARE @strQry AS nvarchar(max)                    
	DECLARE @strDBName AS varchar(100)                  
	DECLARE @C_AccountKey AS int                    
	DECLARE @PrimaryRelationShipId AS int                    
	DECLARE @OldConnectionID AS int                   
	DECLARE @ConnId AS int                     
	DECLARE @IndConnId AS int                      
	DECLARE @ParamDef  nvarchar(1000)   
	DECLARE @IsMultiConnect INT  
	DECLARE @RelationshipTypeID INT    
	DECLARE @ParentRelationshipID INT     
	DECLARE @ParentRelationshipTypeID INT  
	DECLARE @RelationType VARCHAR(50)   
	DECLARE @ParentRelationType VARCHAR(50) 
	DECLARE @DConnID INT
	DECLARE @DUserID INT
	DECLARE @DContactID INT
	DECLARE @DConnectionID INT              
	                    
	SELECT DISTINCT @strDBName= '['+[DBName]+']',@C_AccountKey=SiteID                    
	  FROM [IrrisCentral].[dbo].[lutPrimaryAgency]                     
	  WHERE MAPDBName = db_name()                   
	                  
	SET @ParamDef = '@OldConnectionID int OUTPUT,@ConnId int OUTPUT'                  
	                    
	SET @strQry ='SELECT  @OldConnectionID = R.ConnectionID ,@ConnId=' + @strDBName + '.[dbo].udf_CoupleConnid(R.ConnId,1)                 
		 FROM  ' + @strDBName + '.[dbo].Rel_Relationship R                    
		 WHERE R.RelationShipId =' + cast(@RelationShipId as VARCHAR(100))                  
	                            
	                   
	EXEC sp_executesql @strQry,@ParamDef,@OldConnectionID=@OldConnectionID OUTPUT ,@ConnId=@ConnId OUTPUT  	 
	--Modified as part of Placement tracking - Begin
	SELECT @DCONNID = ConnID,@DUserID = User_ID,@DContactID = ContactID,@DConnectionID = ConnectionID 
	FROM REL_Relationship
	WHERE RelationShipId = @RelationShipId
	--Modified as part of Placement tracking - Begin
	SELECT @IsMultiConnect=rst.ismulticonnect,@RelationshipTypeID = r.RelationshipTypeID,@RelationType = rs.RelationType
	FROM rel_relationship r
	JOIN rel_lkp_relationshiptype rt ON r.relationshiptypeid = rt.relationshiptypeid
	JOIN rel_lkp_relations rs ON rs.relationshiptypeid = rt.relationshiptypeid
	JOIN rel_lkp_relationshipsubtype rst ON rst.relationshipsubtypeid = rt.relationshipsubtypeid
	WHERE r.relationshipid = @RelationShipId

	IF(ISNULL(@IsMultiConnect,'')>0)
	BEGIN
		SELECT @ParentRelationshipID = RelationshipID, @ParentRelationshipTypeID = RelationshiptypeID FROM Rel_Relationship WHERE ConnID = @PrimaryConnid
		AND ConnectionID = @OldConnectionID

		SELECT @ParentRelationType = RelationType FROM rel_lkp_relations WHERE RelationshiptypeID = @ParentRelationshipTypeID
		IF(@RelationType = 'Parent' AND @ParentRelationType = 'BMother')
		BEGIN
			UPDATE R 
			SET R.APID = replace(R.APID, @RelationShipId, '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE R.APID =@RelationShipId
			AND RT.RelationType = 'Child'
			AND R.BMID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%'

			UPDATE R 
			SET R.BMID = replace(R.BMID, CONVERT(VARCHAR(10),@ParentRelationshipID), '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE  R.RelationShipId = @RelationShipId
			AND RT.RelationType = 'Parent'
			AND R.BMID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%'
		END  
		ELSE IF(@RelationType = 'Parent' AND @ParentRelationType = 'Child')
		BEGIN
			UPDATE R 
			SET R.APID = replace(R.APID, @RelationShipId, '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE R.APID =@RelationShipId
			AND RT.RelationType = 'Child'
			AND R.relationshipid = @ParentRelationshipID

			--UPDATE REL_Relationship
			--SET BMID = replace(BMID, (SELECT BMID FROM REL_RELATIONSHIP WHERE RELATIONSHIPID = @ParentRelationshipID AND RELATIONSHIPTYPEID = -104), '')
			--WHERE  RelationShipId = @RelationShipId
			--AND RelationshipTypeID = -101
			--AND BMID LIKE '%'+(SELECT BMID FROM REL_RELATIONSHIP WHERE RELATIONSHIPID = @ParentRelationshipID AND RELATIONSHIPTYPEID = -104)+'%'
		END
		--(M) Faisal 2016-03-07 For Child-BM Delete Placement
		ELSE IF(@RelationType = 'Child' AND @ParentRelationType = 'BMother')	-- This 
		BEGIN
			UPDATE R 
			SET R.BMID = replace(R.BMID, CONVERT(VARCHAR(10),@ParentRelationshipID), '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE  R.RelationShipId = @RelationShipId
			AND RT.RelationType = 'Child'
			AND R.BMID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%'

			--UPDATE R
			--SET R.APID = replace(R.APID, (SELECT R.RelationshipID FROM REL_RELATIONSHIP R JOIN rel_lkp_relations RT ON RT.RelationshiptypeID = R.RelationshiptypeID 
			--WHERE R.BMID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%' AND RT.RelationType = 'Parent'), '')
			--FROM REL_Relationship R
			--JOIN rel_lkp_relations RT
			--ON RT.RelationshiptypeID = R.RelationshiptypeID
			--WHERE R.APID =@RelationShipId
			--AND RT.RelationType = 'Child'
			--AND R.BMID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%'
		END
		ELSE IF(@RelationType = 'Child' AND @ParentRelationType = 'Parent')	
		BEGIN
			UPDATE R
			SET R.APID = replace(R.APID, @ParentRelationshipID, '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE  R.RelationShipId = @RelationShipId
			AND RT.RelationType = 'Child'
			AND R.APID LIKE '%'+CONVERT(VARCHAR(10),@ParentRelationshipID)+'%'

			--UPDATE REL_Relationship
			--SET BMID = replace(BMID, CONVERT(VARCHAR(10),(SELECT BMID FROM REL_RELATIONSHIP WHERE RELATIONSHIPID  = @ParentRelationshipID AND RELATIONSHIPTYPEID = -101)), '')
			--WHERE RELATIONSHIPID =@RelationShipId
			--AND RelationshipTypeID = -104
			--AND BMID LIKE '%'+CONVERT(VARCHAR(10),(SELECT BMID FROM REL_RELATIONSHIP WHERE RELATIONSHIPID  = @ParentRelationshipID AND RELATIONSHIPTYPEID = -101))+'%'
		END
		ELSE IF(@RelationType ='BMother' AND @ParentRelationType = 'Parent')
		BEGIN
			UPDATE R
			SET R.BMID = replace(R.BMID, @RelationshipID, '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE  R.RelationShipId = @ParentRelationshipID
			AND  RT.RelationType = 'Parent'

			--UPDATE REL_Relationship
			--SET BMID = replace(BMID, @RelationshipID, '')
			--WHERE  RelationshipTypeID = -104
			--AND BMID = @RelationshipID 

		END
		ELSE IF(@RelationType = 'BMother' AND @ParentRelationType = 'Child')
		BEGIN
			UPDATE R
			SET R.BMID = replace(R.BMID, @RelationshipID, '')
			FROM REL_Relationship R
			JOIN rel_lkp_relations RT
			ON RT.RelationshiptypeID = R.RelationshiptypeID
			WHERE  R.RelationShipId = @ParentRelationshipID
			AND  RT.RelationType = 'Child'

			--UPDATE REL_Relationship
			--SET BMID = replace(BMID, @RelationshipID, '')
			--WHERE  RelationshipTypeID = -101
			--AND BMID LIKE '%'+ CONVERT(VARCHAR(10),@ParentRelationshipID) +'%'

		END
	END
	 
	IF ISNULL(@PrimaryConnid,0)!=0  
			BEGIN     
				 SET @ParamDef = '@PrimaryRelationShipId int OUTPUT'                  
				                    
				 SET @strQry ='SELECT  @PrimaryRelationShipId = R.RelationShipId                 
					 FROM  ' + @strDBName + '.[dbo].Rel_Relationship R                    
					 WHERE R.ConnectionId =' + cast(@OldConnectionID as VARCHAR(100)) + '
							and R.ConnId = ' + cast(@PrimaryConnid as VARCHAR(100))                   
				                            
				EXEC sp_executesql @strQry,@ParamDef,@PrimaryRelationShipId=@PrimaryRelationShipId OUTPUT          
				         
				 IF @OldConnectionID!=@RelationShipId        
					BEGIN 
						   SET @strQry='UPDATE ' + @strDBName + '.[dbo].Rel_Relationship SET  ConnectionID=' + cast(@RelationShipId as VARCHAR(100))+'                    
							  WHERE RelationShipId=' + cast(@RelationShipId as VARCHAR(100))         
						   EXEC(@strQry)      

						   EXEC sp_UpdateConnectionId @C_AccountKey,@OldConnectionID,@RelationShipId,@ConnId           
						        
						        
					END   
					     
				 ELSE      
				   
					 BEGIN        
				        
					   CREATE TABLE #TempRelationShip        
					   (        
						ID INT NOT NULL Identity(1,1),        
						RelationShipID INT NOT NULL ,        
						ConnId INT         
					   )        
				           
					   DECLARE @MinRelationShipId INT,        
						 @StrtCnt INT,        
						 @EndCnt INT        
					        
				        
					   SET @strQry ='INSERT INTO #TempRelationShip(RelationShipID,ConnId)         
						  SELECT  R.RelationShipID,        
							R.ConnId               
						  FROM  ' + @strDBName + '.[dbo].Rel_Relationship R                     
							INNER JOIN  ' + @strDBName + '.dbo.Rel_lkp_RelationshipType RT ON R.RelationshipTypeId = RT.RelationshipTypeId           
							inner join  ' + @strDBName + '.dbo.Rel_lkp_RelationshipSubType rst           
								   on rt.RelationshipSubTypeId = rst.RelationshipSubTypeId and isnull( rst.Rel_SubType_isProgram,0) =1                     
						  WHERE R.ConnectionID=' + cast(@OldConnectionID as VARCHAR(100))+'                    
						   AND R.RelationShipId !=' + cast(@RelationShipId as VARCHAR(100))+' ORDER BY RT.CONNECTIONPRIORITY'         
				        
						-- print @strQry
						EXEC (@strQry)        
						
					   select @EndCnt = max([Id])
							from  #TempRelationShip   
							    
						SET @StrtCnt=1        
				    
					   SELECT @MinRelationShipId=ISNULL(MIN(RelationShipID),0) FROM  #TempRelationShip        
						--print @StrtCnt
						--print @EndCnt
					       
					   WHILE (@StrtCnt <= @EndCnt)        
							BEGIN  
							      
							 SELECT @ConnId=ConnId FROM #TempRelationShip WHERE ID=@StrtCnt 

								SET @ParamDef = '@IndConnId int OUTPUT'                  
								                
								SET @strQry ='SELECT @IndConnId = ' + @strDBName + '.[dbo].udf_CoupleConnid(' + cast(@ConnId as VARCHAR(100))+ ',1) '                   
								                        
								EXEC sp_executesql @strQry,@ParamDef,@IndConnId=@IndConnId OUTPUT          

								SET @strQry='UPDATE ' + @strDBName + '.[dbo].Rel_Relationship SET  ConnectionID=' + cast(@MinRelationShipId as VARCHAR(100))+'                    
								WHERE ConnectionID=' + cast(@OldConnectionID as VARCHAR(100)) +' and connid = ' + cast(@ConnId as VARCHAR(100))    
								--print @strQry

								EXEC(@strQry)      
						         
							 EXEC sp_UpdateConnectionId @C_AccountKey,@OldConnectionID,@MinRelationShipId,@IndConnId    
							       
							 SET @StrtCnt=@StrtCnt+1        
							 
							END    
					END     
			END 
  
			IF ISNULL(@DeleteCaseYN,0)	=	1
				BEGIN 
					SET @strQry='DELETE
					 FROM  ' + @strDBName + '.[dbo].Rel_Relationship                      
					 WHERE RelationShipId =' + cast(@RelationShipId as VARCHAR(100))   
					PRINT (@strQry)
					EXEC(@strQry)
				END 
	  --Modified as part of Placement tracking - Begin
	  IF (ISNULL(@DeleteDate,'')='')
		SET @DeleteDate = GETDATE()
	 --(M) Faisal On 2016-03-07 For Updating to placement track.
	  UPDATE Rel_PlacementTrack
	  SET DeleteDate = @DeleteDate
	  WHERE CONNID = Case When @RelationType in ('BMother','Parent') Then @PrimaryConnid Else @DCONNID End 
	  AND ParentConnID  = Case When @RelationType in ('BMother','Parent') Then @DCONNID Else @PrimaryConnid End
	  AND DeleteDate Is Null

	  UPDATE Rel_Relationship
	  SET PlacementDate = NULL
	  WHERE CONNID = Case When @RelationType in ('BMother','Parent') Then @PrimaryConnid Else @DCONNID End 
	  --Modified as part of Placement tracking - End
	SET @strQry	=	'Select ConnectionId
	 FROM  ' + @strDBName + '.[dbo].Rel_Relationship R                    
	 WHERE R.RelationShipId =' + cast(@PrimaryRelationShipId as VARCHAR(100))   

	EXEC(@strQry)  
	
--**********************NOTES************************        
--  reltype relationshipid  connectionid         
--AP  1  1500     1500 - delete 
--bp  2  1650     1500        
--child 3  1750  1500        
          
     
--AP  1 1500     1500 - delete        
--bp  2  1650    1650        
--child 3  1750     1650        
--BF  0  1850     1650        
--BF  0  1950     1650        
         
--1.Getting the current connectionid of the sent relationshipid - oldconnectionid        
--2. does oldconnectionid = Relationshipid        
-- if        
--  = then we need to changed all other connectionid in placement and not change old connectionid        
--   a. we need to find priorty Reltype of remaining records in connection        
--   B. Update connectionid of remaining records with priority RelationshipID as connectionid        
--   c. run sp_UpdateConnectionId for each Connid        
--  <> then we need to change oldconnectionid to RelationshipId    
		               
END 

