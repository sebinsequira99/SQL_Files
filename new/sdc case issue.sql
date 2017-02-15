


--select * from [sdc_bk_010117]..rel_relationship where connectionid=580119 and RelationshipTypeId=-101
--select * from [sdc_bk_010117]..rel_relationship where connectionid=411984 and RelationshipTypeId=-101
--select * from [sdc_bk_010117]..rel_relationship where connectionid=586085 and RelationshipTypeId=-101

--select * from rel_relationship where connectionid=580119 and RelationshipTypeId=-101
--select * from rel_relationship where connectionid=411984 and RelationshipTypeId=-101
--select * from rel_relationship where connectionid=586085 and RelationshipTypeId=-101

--update rel_relationship
--set connid=402789
--where relationshipid in(
--558203
--,411984
--,586085)

--update rel_relationship
--set BMID=580119
--where RelationshipID=558203

--update rel_relationship
--set APID=558203
--where RelationshipID=507257

--update rel_relationship 
--set ConnectionId=411984
--where RelationshipID in(
--411984
--,499420
--,499421)

--update rel_relationship 
--set ContactId=153320
--,connid=-153320
--,DisplayName='Swiger, Janine'
--,User_Id=86306
--where RelationshipID=558202

--update rel_relationship
--set ContactId=153320
--,DisplayName='Swiger, Janine'
--,User_Id=86306
--where RelationshipID=558203

--update user_effectivedate
--set eff_status='Y'
--,end_date=NULL
--,ConnectionId=580119
--,ConnId=-153320
--where EffectiveDateId=151724

--update rel_relationship
--set connectionid=411984
--where relationshipid in(507257
--,580119
--,499420
--,499421)

--update rel_relationship
--set apid=411984
--where relationshipid in(507257
--,499420)

--update contactactivity 
--set connectionid=411984
--,ConnId=-153320
--where ContactActivityId in(
--8218
--,10981
--,10982
--,10983
--,10986
--,10991
--,10992
--)

--update connectionstatuslog 
--set connectionid=411984
--where ConnectionStatusLogId in(
--130798
--,130799
--,4245
--,123207)

--update CW_HistoryDtls
--set connectionid=411984
--where HistoryID in(
--3036
--,3037)

--set identity_insert rel_relationship on

--insert into rel_relationship(RelationshipID
--,ContactId
--,RelationshipTypeId
--,RecRelationshipId
--,RelationshipDateLastUpdated
--,ContactAIRSId
--,CaseId
--,ConnId
--,ConnectionId
--,RelSeq
--,RelEndDate
--,RelLabel
--,ConnectionStatusId
--,ContactId2
--,CaseRelationShipId
--,DisplayName
--,User_Id
--,CreatedBy
--,CreatedDate
--,UpdatedBy
--,UpdatedDate
--,APID
--,BMID
--,BFID
--,APflag
--,BPflag
--,PlacementDate)
--select RelationshipID
--,ContactId
--,RelationshipTypeId
--,RecRelationshipId
--,RelationshipDateLastUpdated
--,ContactAIRSId
--,CaseId
--,ConnId
--,ConnectionId
--,RelSeq
--,RelEndDate
--,RelLabel
--,ConnectionStatusId
--,ContactId2
--,CaseRelationShipId
--,DisplayName
--,User_Id
--,CreatedBy
--,CreatedDate
--,UpdatedBy
--,UpdatedDate
--,APID
--,BMID
--,BFID
--,APflag
--,BPflag
--,PlacementDate from [sdc_bk_100117]..rel_relationship where connectionid=580119 and RelationshipTypeId=-101

--set identity_insert rel_relationship off