USE MAPFCAD_TEST
go

/******************Add column OldMapFormDataId ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OldMapFormDataId' AND Object_ID = Object_ID(N'MapFormData'))    
BEGIN
	ALTER TABLE MapFormData
	ADD OldMapFormDataId INT
END

/******************************************************************/
GO
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
WHERE FIELDNAME LIKE '%CONTACTID%' 
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
WHERE FIELDNAME LIKE '%ADDRESSID%' 
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
 WHERE FIELDNAME LIKE '%Phone2Id1%' 
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
WHERE FIELDNAME LIKE '%PhoneId%' 
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
WHERE FIELDNAME LIKE '%PhoneId2%' 
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
WHERE FIELDNAME LIKE '%PhoneId3%' 
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
WHERE FIELDNAME LIKE '%EMAILID%' 
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
WHERE FIELDNAME LIKE '%EthnicityId%' 
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
WHERE FIELDNAME LIKE '%MarriageId%' 
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
WHERE FIELDNAME LIKE '%RaceId%' 
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
WHERE FIELDNAME LIKE '%ReligionId%' 
GO
--4