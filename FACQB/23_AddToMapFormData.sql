USE MAPFACQB_STAGE
go

/******************Add column OldMapFormDataId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldMapFormDataId' AND Object_ID = Object_ID(N'MapFormData'))    
BEGIN
	ALTER TABLE MapFormData
	ADD OldMapFormDataId INT
END

/******************************************************************/
INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 
AND FIELDNAME LIKE '%CONTACTID%' 
AND FIELDDATA >19389
GO

--143

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%ADDRESSID%' AND FIELDDATA >=23392
GO
--64

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId
FROM MAPFAC.DBO.mapformdata
 WHERE USER_ID >=13433 AND FIELDNAME LIKE '%Phone2Id1%' AND FIELDDATA >=14975
 GO
 --25

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%PhoneId%' AND FIELDDATA >=14975
GO
--55

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%PhoneId2%' AND FIELDDATA >=14975
GO
--12

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%PhoneId3%' AND FIELDDATA >=14975
GO
--15

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%EMAILID%' AND FIELDDATA >=6469
GO
--27

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%EthnicityId%' AND FIELDDATA >=423
GO
--4

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%MarriageId%' AND FIELDDATA>=2722
GO
--30

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%RaceId%' AND FIELDDATA>=1675
GO
--4

INSERT INTO MapFormData
(
user_id
,AIRSContactId
,ContactPrefix
,FieldName
,FieldData
,SaveChk
,ConnId
,OldMapFormDataId
)
SELECT (user_id+100000)
,AIRSContactId
,ContactPrefix
,FieldName
,(FieldData+100000)
,SaveChk
,ConnId
,MapFormDataId 
FROM MAPFAC.DBO.mapformdata
WHERE USER_ID >=13433 AND FIELDNAME LIKE '%ReligionId%' AND FIELDDATA>=1063
GO
--4