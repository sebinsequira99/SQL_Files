CREATE TABLE #FormTbl
(
	id				 INT IDENTITY(1,1),
	FormName		 VARCHAR(MAX),
	FormID			 INT,
	PageId			 INT,
	FieldName		 VARCHAR(MAX),
	Libraryfieldname VARCHAR(MAX)
)

create table #FormfieldInfo	
		(TableName		VARCHAR(MAX),
		FieldName		VARCHAR(MAX),
		DisplayName		VARCHAR(MAX),
		FieldType		VARCHAR(50),
		FieldSize		INT,
		DefltVal		VARCHAR(MAX),
		Req				BIT,
		ContactPrefix	VARCHAR(50),
		LkpTable		VARCHAR(MAX),
		LkpField		VARCHAR(MAX))

DECLARE @FormName		VARCHAR(MAX),
		@SQL			VARCHAR(MAX),
		@Str			VARCHAR(MAX),
		@Field			VARCHAR(MAX),
		@TableField		VARCHAR(MAX),
		@query			VARCHAR(MAX),
		@ContactId		INT,
		@ContactPrefix  VARCHAR(50),
		@AP1ContactId	INT,
		@NewContactId   INT,
		@MinCount		INT,
		@MaxCount		INT

CREATE TABLE #TempMerge
(
	id				 INT IDENTITY(1,1),
	LibraryFieldName VARCHAR(MAX),
	FieldData		 VARCHAR(MAX),
	ContactPrefix	 VARCHAR(50)
)


INSERT INTO #FormTbl (FormName,FormID,PageId,FieldName,Libraryfieldname)
SELECT     DISTINCT 'Formmaker_'+FP.formname  AS FormName ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name--,FS.Data_id
FROM		formmaker_submissions FS
INNER JOIN	formmaker_properties   FP  ON (FS.FORM_ID = FP.FORM_ID)
INNER JOIN	formmaker_pages        FPG ON (FP.FORM_ID = FPG.FORM_ID)
INNER JOIN	formmaker_fields       FF  ON ( (FPG.PAGE_ID = FF.PAGE_ID) AND (use_library = 1) )
WHERE  FS.FORM_ID = 2480 
GROUP BY 'Formmaker_'+FP.formname   ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name

select * from formmaker_fields

SET @TableField = STUFF((SELECT ',' + QUOTENAME(FieldName) +'VARCHAR(255)'
                    FROM #FormTbl
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @Field = STUFF((SELECT ',' + QUOTENAME(FieldName)
                    FROM #FormTbl
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

CREATE TABLE #temp
(
	ID INT IDENTITY(1,1)
)

SET @SQL = 'ALTER TABLE #temp ADD '+ @TableField +''

PRINT @SQL
EXEC(@SQL)

SELECT DISTINCT @FormName = FormName FROM #FormTbl

SET @sql = 'SELECT'+@Field+' FROM '+@FormName +'
WHERE user_id = 12910
	AND ConnId			 = -85619
	AND ConnectionID	 = 288537'

PRINT @sql
INSERT INTO #temp
EXEC(@sql)

select * from #temp

SET @query = 'SELECT fielddata, fieldname INTO ##temppivot FROM 
             (
                SELECT '+@Field+'
                FROM #temp
            ) x
            UNPIVOT
            (
                FieldData
                FOR FieldName IN (' + @Field + ')
            ) p '

PRINT @query
EXEC (@query)

SELECT  t.FieldData,
		t.FieldName,
		f.LibraryFieldName 
INTO #MapFieldData
FROM ##temppivot t
INNER JOIN #FormTbl f
ON f.FieldName = t.fieldname

select * from #MapFieldData

IF EXISTS(SELECT 1 FROM #MapFieldData WHERE ISNULL(FieldName,'') <> '')
BEGIN
INSERT INTO @FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,ContactPrefix,LkpTable,LkpField) 
SELECT m.TableName,
m.FieldName,
m.DisplayName,
m.FieldType,
m.FieldSize,
m.DefltVal,
m.Req,
m.ContactPrefix,
m.LkpTable,
m.LkpField
FROM MapFieldCatBase m
INNER JOIN #MapFieldData t
ON t.LibraryFieldName = m.FieldName
WHERE CHARINDEX('_',t.LibraryFieldName) = 0
AND (m.IsGroup is null 
OR m.IsGroup ='0')
UNION
SELECT 'Medical Info' as TableName,
CASE 
	WHEN CHARINDEX('Med_1', T.LibraryFieldName ) > 0 THEN 'Med_1' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '')
	ELSE 'Med_2' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '')
END AS FieldName,
CASE 
	WHEN CHARINDEX('Med_1', T.LibraryFieldName ) > 0 THEN 'Parent 1 ' +  MGST.MedGenSubTypeText
	ELSE 'Parent 2 ' + MGST.MedGenSubTypeText
END AS DisplayName,
'Text'	AS FieldType,
CASE 
	WHEN MGST.IsMedGenDate = '1' THEN 26
	WHEN MGST.IsMedGenNote = '1' THEN 2000
	WHEN MGST.IsMedGenAge = '1' THEN 255
	WHEN MGST.IsMedGenPulldown = '1' THEN 26
	WHEN MGST.IsMedGenDate = '1' THEN 26
END	AS FieldSize,
MGST.MedGenSubTypeId AS DefltVal,
0 AS Req,
'NA' AS ContactPrefix,
CASE MGST.IsMedGenPulldown
	WHEN '1' THEN 'MedGenPullDown'
	Else '' 
END AS LkpTable,
CASE MGST.IsMedGenPulldown
	WHEN '1' THEN 'MedGenPullDownText'
	ELSE '' 
END AS LkpField
FROM dbo.MedGenSubType MGST
INNER JOIN #MapFieldData T
ON (substring(LibraryFieldName,charindex('_1',LibraryFieldName)+2,len(LibraryFieldName)) = MGST.MedGenSubTypeText
 or substring(LibraryFieldName,charindex('_2',LibraryFieldName)+2,len(LibraryFieldName)) = MGST.MedGenSubTypeText)
WHERE CHARINDEX('Med_',T.LibraryFieldName) > 0
	AND 'Med_1' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '') IN (T.LibraryFieldName) 
	OR 'Med_2' + dbo.udf_CleanString(MGST.MedGenSubTypeText, '') IN (T.LibraryFieldName) 
UNION
SELECT dbo.udf_CleanString(CT.CIListTemplateName, '') AS TableName,
dbo.udf_CleanString(CILTI.CIListTemplateItemName, '') + '_' + REPLACE(cast(CILTI.CIListTemplateItemId AS VARCHAR(4)), '-','_') AS FieldName,
dbo.udf_XMLClean(CILTI.CIListTemplateItemName) AS DisplayName,
	CASE CILIT.CIListItemTypeText
		WHEN 'Number'		THEN 'Real'
		WHEN 'CheckBox'		THEN 'CheckBox'
		WHEN 'Yes/No'		THEN 'Text'
		WHEN 'Text'			THEN 'Text'
		WHEN 'Pull Down'	THEN 'Text'
		WHEN 'Date'			THEN 'Datetime'
		WHEN 'Password'		THEN 'Text'
		WHEN 'Hidden Field' THEN 'RadioButton'
		WHEN 'Memo'			THEN 'TextArea'
		WHEN 'GUID Field'	THEN 'Text'
		WHEN 'Lookup Table' THEN 'Multiselect'
END	AS FieldType,
	CASE CILIT.CIListItemTypeText
		WHEN 'Text'			THEN 255
		WHEN 'Pull Down'	THEN 255
		WHEN 'CheckBox'		THEN 255
		WHEN 'Lookup Table' THEN 255
		WHEN 'Password'		THEN 255
		WHEN 'Hidden Field' THEN 255
		WHEN 'Memo'			THEN 2000
		WHEN 'GUID Field'	THEN 255
END	AS FieldSize,
CILTI.CIListTemplateItemId as DefltVal,
NULL AS Req,
'NA' AS ContactPrefix,
CASE CILIT.CIListItemTypeText
		WHEN 'Pull Down'	THEN 'CIListPullDown'
		WHEN 'Hidden Field' THEN 'CIListPullDown'
		WHEN 'CheckBox'		THEN 'CIListPullDown'
		WHEN 'Lookup Table' THEN 'CIListPullDown'
		WHEN 'Yes/No'		THEN 'YesNoPullDown'
END AS LkpTable,
CASE CILIT.CIListItemTypeText
		WHEN 'Pull Down'	THEN 'CIListPullDownText'
		WHEN 'Hidden Field' THEN 'CIListPullDownText'
		WHEN 'CheckBox'		THEN 'CIListPullDownText'
		WHEN 'Lookup Table' THEN 'CIListPullDownText'
		WHEN 'Yes/No'		THEN 'YesNoPullDownText'
END AS LkpField
FROM	dbo.CIListTemplate CT
INNER JOIN dbo.CIListTemplateItem CILTI 
ON CT.CIListTemplateId = CILTI.CIListTemplateId
INNER JOIN dbo.CIListItemType CILIT 
ON CILTI.CIListItemTypeId = CILIT.CIListItemTypeId 
INNER JOIN #MapFieldData T
ON dbo.udf_CleanString(CILTI.CIListTemplateItemName, '') + '_' + 
REPLACE(CAST(CILTI.CIListTemplateItemId AS VARCHAR(4)), '-','_') = T.LibraryFieldName
END
ELSE
BEGIN
INSERT INTO #FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,ContactPrefix,LkpTable,LkpField)
EXEC SP_AgencyFormFieldLibrary 211, NULL
END

select * from @FormfieldInfo
IF EXISTS(SELECT 1 FROM @FormfieldInfo WHERE TableName = 'MAPSystemData')
BEGIN
	UPDATE U 
	SET U.EDD = M.FieldData
	FROM user_accounts U
	JOIN @FormfieldInfo F
	ON U.[user_id] = 9020
	join #MapFieldData M
	ON M.LibraryFieldName = F.FieldName
	WHERE F.TableName = 'MAPSystemData'
	AND F.FieldName = 'EDD' 

	INSERT INTO  #TempMerge
	(
		LibraryFieldName,
		FieldData,		
		ContactPrefix	
	)
	SELECT M.LibraryFieldName,M.FieldData,F.ContactPrefix
	FROM #MapFieldData M
	INNER JOIN @FormfieldInfo F
	ON F.FieldName = M.LibraryFieldName

	MERGE INTO  MapFormData AS MF	
	USING(SELECT * FROM #TempMerge) AS M
	ON M.LibraryFieldName = MF.FieldName
	AND MF.user_id = 17086

	WHEN MATCHED THEN 

	UPDATE 
	SET MF.FieldName = M.LibraryFieldName,
		MF.FieldData = M.FieldData

	WHEN NOT MATCHED THEN

	INSERT (
			[user_id],
			ContactPrefix,
			FieldName,
			FieldData
			)
	VALUES (
			17086,
			M.ContactPrefix,
			M.LibraryFieldName,
			M.FieldData
			);
END

IF EXISTS(SELECT 1 FROM MapFormData WHERE [user_id] = 17086 AND ContactPrefix = 'AP1' AND FieldName = 'AP1ContactId' AND FieldData!=0)
BEGIN
SELECT DISTINCT @ContactId = CAST(COALESCE(FieldData,'0') AS INT)
	FROM MapFormData
	WHERE [user_id] = 17086
		AND ContactPrefix = 'AP1'
		AND FieldName = 'AP1ContactId'
END
ELSE
BEGIN
	SELECT @ContactId = AP1ContactId
	FROM MAPSystemData 
	WHERE [user_id] = 17086

	INSERT INTO MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
	VALUES (17086,'AP1','AP1ContactId',CAST(@ContactId AS VARCHAR(50)))

END

SET @ContactId = 0

SELECT CAST(COALESCE(M.FieldData,'0') AS INT) AS ContactID ,T.ContactPrefix
INTO #ContactTemp
FROM MapFormData M
INNER JOIN #TempMerge T
ON M.ContactPrefix = T.ContactPrefix
AND M.FieldName = T.ContactPrefix + 'ContactId'
WHERE [user_id] = 17086
GROUP BY M.FieldData,T.ContactPrefix

IF EXISTS(SELECT 1 FROM #ContactTemp WHERE ContactId = 0 OR ContactId IS NULL)
BEGIN
	IF EXISTS(SELECT 1 FROM #ContactTemp WHERE ContactPrefix = 'AP2')
	BEGIN
		SET @ContactPrefix = 'AP2'								
	
		SELECT  @AP1ContactId = CAST(COALESCE(FieldData,'0') AS INT)
		FROM	MapFormData
		WHERE [user_id] = 17086
			AND ContactPrefix = 'AP1'
			AND FieldName = 'AP1ContactId'
								
		SET @sqlContactParamDef	= '@ContactId int output'
		SET @SqlContactId		= 'SELECT @ContactId = '+@Agency+'.DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),2)'
		EXEC SP_EXECUTESQL @SqlContactId,@sqlContactParamDef,@ContactId = @ContactId output
															
		IF ( @ContactId = @AP1ContactId )
		BEGIN
			SET @sqlCId2ParamDef	= '@ContactId2 int output'
			SET @SqlCId2			= 'SELECT @ContactId2 = '+@Agency+'.DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),1)'
			EXEC SP_EXECUTESQL @SqlCId2,@sqlCId2ParamDef,@ContactId2 = @ContactId OUTPUT
		END
								
		IF( @ContactId <> @AP1ContactId  AND @ContactId IS NOT NULL AND @ContactId > 0 )
		BEGIN
			INSERT INTO MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
			VALUES (17086,@ContactPrefix,'AP2ContactId',CAST(@ContactId AS VARCHAR(50)))
		END
		ELSE 
		BEGIN

			EXEC SP_MAPNewContact @Agency, @user_id, @ContactPrefix

			SELECT @NewContactId = CAST(COALESCE(FieldData,'0') AS INT)
			FROM MapFormData
			WHERE [user_id] = @User_Id
			AND FieldName = 'AP2ContactId'

			IF @NewContactId > 0
				UPDATE MAPSystemData
				SET AP2ContactId = @NewContactId
				WHERE [user_id] = @user_id
		END -- END OF ELSE CONDITION
	END
	ELSE 
	BEGIN
		SET @MinCount = 1
		SELECT @MaxCount = MAX(ID) FROM #TempMerge
		WHILE(@MinCount <=@MaxCount)
		BEGIN
			SELECT @ContactPrefix = ContactPrefix 
			FROM #TempMerge
			WHERE ID = @MinCount

			IF(@ContactPrefix <> 'AP2')
				
				Exec SP_MAPNewContact @Agency, @user_id, @ContactPrefix

			SET @MinCount = @MinCount+1
		END
	END								
END -- END OF @ContactId ISNULL CONDITION

-- Update and Save New Data to AIRS contact
 
	IF EXISTS(SELECT 1 FROM #MapFieldData WHERE (LibraryFieldName LIKE '%Relationship%' OR LibraryFieldName LIKE '%FName%' OR LibraryFieldName LIKE '%LName%' or LibraryFieldName LIKE '%MName%' OR LibraryFieldName LIKE '%Gender%' OR LibraryFieldName LIKE '%DOB%' OR LibraryFieldName LIKE '%SSN%' OR LibraryFieldName LIKE '%BirthCity%' OR LibraryFieldName LIKE '%BirthState%' OR LibraryFieldName LIKE '%BirthCountry%' OR LibraryFieldName LIKE '%Salutation%' OR LibraryFieldName LIKE '%Nickname%'))
		Begin
			Exec [MAPContact] @Agency, @user_id, @ContactPrefix,@FieldName
		End
	Else If @FieldName like '%Add%' or (@FieldName like '%City' and @FieldName not like '%Ethnicity%') or @FieldName like '%State%' or @FieldName like '%Zip%' or @FieldName like '%Country%' or @FieldName like '%County%'
		Begin
			Exec [MAPAddress] @Agency, @user_id, @ContactPrefix, @FieldName
		End
	Else If @FieldName like '%Email%' 
			Exec SP_MAPEmail @Agency, @user_id, @ContactPrefix
	Else If @FieldName like '%Ethnicity%' 
		Begin
			Set @Suffix = coalesce(substring(@FieldName, charindex('Ethnicity',@FieldName) + 9, len(@FieldName)),0)
			Exec SP_MAPEthnicity @Agency, @user_id, @ContactPrefix, @Suffix
		End
	Else If @FieldName like '%Race%' 
		Begin
			Set @Suffix = coalesce(substring(@FieldName, charindex('Race',@FieldName) + 4, len(@FieldName)),0)
			Exec SP_MAPRace @Agency, @user_id, @ContactPrefix, @Suffix
		End
	Else If @FieldName like '%Religion%' 
		Begin
			Set @Suffix = coalesce(substring(@FieldName, charindex('Religion',@FieldName) + 8, len(@FieldName)),0)
			Exec SP_MAPReligion @Agency, @user_id, @ContactPrefix, @Suffix
		End
	Else If @FieldName like '%Education%' or @FieldName like '%Degree%' or @FieldName like '%Institution%'  
		Begin
			Exec SP_MAPEducation @Agency, @user_id, @ContactPrefix
		End
	Else If @FieldName like '%MarraigeDate%' or @FieldName like '%MarriageStatus%' or @FieldName like '%TerminationDate%' or @FieldName like '%TermReason%' or @FieldName like '%Spouse%'
		Begin				
			Set @Suffix = coalesce(right(@FieldName,1),'0')
			Exec SP_MAPMarriage @Agency, @user_id, @ContactPrefix, @Suffix
		End
	Else If @FieldName like '%HomePhone%'  or @FieldName like '%WorkPhone%' or @FieldName like '%CellPhone%' 
	BEGIN
		IF @FieldName like '%HomePhone%'
		BEGIN Set @Suffix = 1  END
		IF @FieldName like '%WorkPhone%'
		BEGIN Set @Suffix = 2  END
		IF @FieldName like '%CellPhone%'
		BEGIN Set @Suffix = 3  END
				
		Exec SP_MAPPhone @Agency, @user_id, @ContactPrefix, @Suffix
			
	END
				
	Else If @FieldName like '%Language%' 
		Begin
			Set @Suffix = coalesce(substring(@FieldName, charindex('Language',@FieldName) + 8, len(@FieldName)),0)
			Exec SP_MAPContactLanguage @Agency, @user_id, @ContactPrefix, @Suffix
		End
	Else If @FieldName like '%ReferralSource%' 
		Begin
		Exec SP_MAPReferralSave @Agency, @user_id
		

--DROP TABLE #FormTbl

--DROP TABLE #temp

--DROP TABLE ##temppivot

--DROP TABLE #MapFieldData

--DROP TABLE #TempMerge

select * from MedGenSubType

select * from #MapFieldData