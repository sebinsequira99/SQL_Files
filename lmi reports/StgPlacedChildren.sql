/*****************************Stage table for placed not placed children*********************************************************************/
IF EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME ='StgPlacedChildren' )
DROP TABLE StgPlacedChildren
GO
SELECT DISTINCT
   ISNULL(C.FName,'')+' '+ISNULL(C.LName,'') As ChildName
  , C.InqChild As ChildId
  , UA.datejoined As RegistrationDate
  , R1.RelLabel As CaseNo
  , CONVERT(int,ROUND(DATEDIFF(hour, case C.BirthDate when '1900-01-01 00:00:00.000' THEN Null Else C.BirthDate end,GETDATE())/8766.0,0)) AS Age
  , C.Gender
  , QA1.Answer AS Ethinicity
  , CASE WHEN R2.Connectionid is null then 'Not Placed' Else 'Placed' END PlacedYN
  , Isnull(C1.FName,'')+' '+Isnull(C1.LName,'')+' '+Isnull(C2.FName,'')+' '+Isnull(C2.LName,'')as ParentsName 
  , CT.CountyText AS ParentCounty
  , R2.RelLabel AS ParentCaseNo
  --, R2.RelationshipDateLastUpdated AS PlacedDate
  , Case WHEN R2.RelationshipDateLastUpdated >R1.RelationshipDateLastUpdated Then R2.RelationshipDateLastUpdated ELSE R1.RelationshipDateLastUpdated END AS PlacedDate
  , UE.user_id
  , Ue.Connectionid
  , Ue.Connid
INTO StgPlacedChildren
FROM 
Contact c
INNER JOIN USER_accounts UA WITH(NOLOCK)  ON ABS(UA.Connid) = C.ContactId
INNER JOIN Rel_relationship R1 WITH(NOLOCK) ON (R1.ContactID = C.ContactID OR R1.ContactID2=C.ContactID) AND R1.RelationshipTypeId = -104
LEFT JOIN rel_relationship R2 WITH(NOLOCK) ON R1.Connectionid = R2.Connectionid AND R2.RelationshipTypeId = -101
LEFT JOIN Contact C1 WITH(NOLOCK) ON C1.Contactid = R2.ContactId 
LEFT JOIN Contact C2 WITH(NOLOCK) ON C2.Contactid = R2.ContactId2 
LEFT JOIN Contactaddress CA WITH(NOLOCK) ON CA.ContactId = C1.ContactId
LEFT JOIN lkpCounty CT WITH(NOLOCK) ON CT.CountyID = CA.Countyid
LEFT JOIN User_effectivedate UE WITH(NOLOCK) ON UE.user_id = UA.user_id AND R1.Connectionid = UE.connectionid 
LEFT JOIN QuestionnaireAnswers QA1 WITH(NOLOCK) ON  QA1.ConnectionID = UE.ConnectionID and QA1.connid = Ue.connid  AND QA1.QuestionID = 146-- Race
LEFT join Questionnaire Q1 WITH(NOLOCK) ON Q1.ID =146  AND Q1.ShowToChild = 1 
WHERE  R1.RelationshipTypeId = -104 and  LTRIM(RTRIM(ISNULL(C.FName,'')+' '+ISNULL(C.LName,''))) !=''--R1.connectionid = 351704

IF EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME ='rptEthinicityPlaced' )
DROP TABLE rptEthinicityplaced
GO
CREATE TABLE rptEthinicityplaced (id int identity(1,1),connid int ,connectionid int,ETHINICITY VArchar(100))

INSERT INTO rptEthinicityplaced (connid,connectionid,ETHINICITY)
SELECT  connid,connectionid,ETHINICITY from StgPlacedChildren WHERE ETHINICITY is not null

DECLARE @min INT
DECLARE @max INT
DECLARE @connid INT
DECLARE @connectionID INT
DECLARE @ethinicity varchar(max)
SET @min=1
SET @max=scope_identity()
WHILE(@min<=@max)
BEGIN
SELECT @ethinicity=ETHINICITY,@connid=Connid,@ConnectionID=ConnectionID from rptEthinicityplaced where id=@min
DELETE FROM rptEthinicityplaced where id=@min
INSERT INTO rptEthinicityplaced (connid,connectionid,ETHINICITY)
SELECT @ConnID,@ConnectionID, Arrayval FROM dbo.ArrayListToTable(@ethinicity)
SET @min=@min+1
END
