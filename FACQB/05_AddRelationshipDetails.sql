USE MAPFACQB_STAGE
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'Rel_RELATIONSHIP'))    
BEGIN
ALTER TABLE Rel_RELATIONSHIP
ADD ImportFlag VARCHAR(5)
END
GO
/****************************************************************************************************************/
SET IDENTITY_INSERT REL_RELATIONSHIP ON
GO

INSERT INTO REL_RELATIONSHIP
(
RelationshipID
,ContactId
,RelationshipTypeId
,RecRelationshipId
,RelationshipDateLastUpdated
,ConnectionStatusId
,ConnId
,ConnectionId
,RelSeq
,RelEndDate
,RelLabel
,ContactId2
,DisplayName
,User_ID
,CreatedBy
,CreatedDate
,UpdatedBy
,UpdatedDate
,ImportFlag
)
SELECT 
CASE 
	WHEN RELATIONSHIPID<0 THEN ((RELATIONSHIPID *-1) + 100000) * -1
	ELSE RELATIONSHIPID + 100000
	END,
CONTACTID + 100000,
RELATIONSHIPTYPEID,
RECRELATIONSHIPID,
RELATIONSHIPDATELASTUPDATED,
CONNECTIONSTATUSID,
CASE 
	WHEN CONNID<0 THEN ((CONNID *-1) + 100000) * -1
	ELSE CONNID + 100000
	END,
CASE 
	WHEN CONNECTIONID<0 THEN ((CONNECTIONID *-1) + 100000) * -1
	ELSE CONNECTIONID + 100000
	END,
RELSEQ,
RELENDDATE,
RELLABEL,
CASE
	WHEN CONTACTID2>0 THEN CONTACTID2 + 100000
	ELSE CONTACTID2
	END,
DISPLAYNAME,
USER_ID + 100000,
CASE
	WHEN CREATEDBY>0 THEN CREATEDBY + 100000
	ELSE CREATEDBY
	END,
CREATEDDATE,
CASE
	WHEN UPDATEDBY>0 THEN UPDATEDBY + 100000
	ELSE UPDATEDBY
	END,
UPDATEDDATE,
'Y'
FROM MAPFAC.DBO.REL_RELATIONSHIP
WHERE contactid > 19389
order by contactid

GO

INSERT INTO REL_RELATIONSHIP
(
RelationshipID
,ContactId
,RelationshipTypeId
,RecRelationshipId
,RelationshipDateLastUpdated
,ContactAIRSId
,CaseId
,ConnectionStatusId
,ConnId
,ConnectionId
,RelSeq
,RelEndDate
,RelLabel
,CaseRelationShipId
,ContactId2
,DisplayName
,User_ID
,CreatedBy
,CreatedDate
,UpdatedBy
,UpdatedDate
,APID
,BMID
,BFID
,APflag
,BPflag
,PlacementDate
,ImportFlag
)

SELECT RelationshipID
,ContactId
,RelationshipTypeId
,RecRelationshipId
,RelationshipDateLastUpdated
,ContactAIRSId
,CaseId
,ConnectionStatusId
,ConnId
,ConnectionId
,RelSeq
,RelEndDate
,RelLabel
,CaseRelationShipId
,ContactId2
,DisplayName
,User_ID
,CreatedBy
,CreatedDate
,UpdatedBy
,UpdatedDate
,APID
,BMID
,BFID
,APflag
,BPflag
,PlacementDate
,'Y'
FROM MAPFAC.DBO.REL_RELATIONSHIP
WHERE RelationshipID = 104167

SET IDENTITY_INSERT REL_RELATIONSHIP OFF
GO

--368