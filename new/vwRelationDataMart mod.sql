

CREATE PROC usp_LoadRelationDataMart
AS
BEGIN

IF EXISTS (select 1 from sys.objects where name='RelationDataMart' and type='u')
DROP TABLE RelationDataMart

	SELECT TEMP.ContactId 
				,R.ContactId as ContactID2
				,R.RelationshipID
				,R.ConnID
				,R.ConnectionID	
				,TEMP.ClientDetails as FirstPerson
				,(ISNULL(C.fNAME,'')+' '+ISNULL(C.LNAME,'')) AS SecondPerson 
				,Rl.RelationshipTypeText
				,FORMAT(R.RelationshipDateLastUpdated ,'dd/MM/yyyy') as StartDate
				,FORMAT(CASE R.RelEndDate 
								   WHEN '1900-01-01 00:00:00.000' 
								   THEN NULL 
								   ELSE R.RelEndDate 
								   END ,'dd/MM/yyyy') AS EndDate
	INTO RelationDataMart
	FROM rel_relationship R  	 
	INNER JOIN	REL_LKP_RELATIONSHIPTYPE RL 
	ON (R.RelationshipTypeId = RL.RelationshipTypeId)
	INNER JOIN CONTACT C 
	ON ABS(R.Connid)=C.ContactID
	INNER JOIN (
							SELECT R.ConnectionID
							             ,R.ContactId	
							             ,(ISNULL(C.fNAME,'')+' '+ISNULL(C.LNAME,'')) AS ClientDetails 
						    FROM rel_relationship R 	 
							INNER JOIN	REL_LKP_RELATIONSHIPTYPE RL 
							ON (R.RelationshipTypeId = RL.RelationshipTypeId)
							INNER JOIN CONTACT C 
							ON ABS(R.Connid)=C.ContactID	 
							WHERE R.connid<0  
							AND R.RelationshiptypeId!=0 
							AND R.RelationshipId>0  
							AND R.RelationshipId!=R.ConnectionID 
							) 
							as TEMP 
	ON R.ConnectionID = TEMP.CONNECTIONID
	WHERE R.connid<0  
	AND R.RelationshiptypeId!=0 
	AND R.RelationshipId>0  
	AND R.RelationshipId=R.ConnectionID 	

ALTER TABLE RelationDataMart
ADD UserID int
,Program varchar(max)
,[Role] varchar(max)
,GroupName varchar(max)

UPDATE r
set r.UserID=ua.user_id
from RelationDataMart r
inner join user_accounts ua
on r.contactid=abs(ua.connid)

UPDATE a
SET a.[Role]=STUFF((SELECT distinct ',' + rt.RelationshipTypeText
							  FROM rel_relationship rr
							  inner join rel_lkp_relationshiptype rt
							  on rr.relationshiptypeid=rt.relationshiptypeid
							  inner join rel_lkp_relationshipsubtype rs
							  on rt.relationshipsubtypeid=rs.relationshipsubtypeid and Rel_SubType_isProgram=1
							  WHERE a.contactid=rr.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
,a.Program=STUFF((SELECT distinct ',' + rs.RelationshipSubTypeText
							  FROM rel_relationship rr
							  inner join rel_lkp_relationshiptype rt
							  on rr.relationshiptypeid=rt.relationshiptypeid
							  inner join rel_lkp_relationshipsubtype rs
							  on rt.relationshipsubtypeid=rs.relationshipsubtypeid and Rel_SubType_isProgram=1
							  WHERE a.contactid=rr.contactid
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
,a.GroupName=STUFF((SELECT distinct ',' + g.group_name
							  FROM user_effectivedate r
							  inner join user_groups g on 
							  r.group_id=g.group_id
							  WHERE a.UserID = r.[user_id] and eff_status='Y'
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM RelationDataMart a

END
