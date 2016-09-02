

declare
		@user_id int = 4661,
		@FormID INT = 912,
		@ConnId INT = -69350,
		@ConnectionID INT  = 120329

BEGIN
	CREATE TABLE #FormTbl
	(
		id				 INT IDENTITY(1,1),
		FormName		 VARCHAR(MAX),
		FormID			 INT,
		PageId			 INT,
		FieldName		 VARCHAR(MAX),
		Libraryfieldname VARCHAR(MAX),
		DATA_TYPE		 VARCHAR(MAX)
	)

	CREATE TABLE #FormfieldInfo	
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
			@UserContactId	INT,
			@ContactPrefix  VARCHAR(50),
			@NewContactId   INT,
			@MinCount		INT,
			@MaxCount		INT,
			@RunSql nvarchar(2000),
			@Suffix varchar(50),
			@Ethnicity varchar(50),
			@AddressId varchar(50),
			@ContactIdField varchar(100),
			@EthnicityId int,
			@ParamDef  nvarchar(1000),
			@ChkNewEthnicity int,
			@AP1ContactId int,
			@sqlContactParamDef NVARCHAR(MAX),
			@SqlContactId		NVARCHAR(MAX),
			@SqlCId2			NVARCHAR(MAX),
			@sqlCId2ParamDef	NVARCHAR(MAX),
			@ErrorMsg			VARCHAR(MAX),
			@AgencyId	int,
			@AgencyDB varchar(50),
			@FormmakerID INT


	CREATE TABLE #TempMerge
	(
		id				 INT IDENTITY(1,1),
		LibraryFieldName VARCHAR(MAX),
		FieldData		 VARCHAR(MAX),
		ContactPrefix	 VARCHAR(50)
	)

	CREATE TABLE #contactprefix
	(
		id INT IDENTITY(1,1),
		ContactPrefix VARCHAR(50)
	)

	CREATE TABLE #temp
	(
		ID INT IDENTITY(1,1)
	)

	CREATE TABLE #temp_otherinfo
	(	 
		 TableName		VARCHAR(MAX)
		,FieldName		VARCHAR(MAX)
		,FieldType		VARCHAR(50)
		,LkpTable		VARCHAR(MAX)
		,DefltVal		VARCHAR(MAX)
		,FieldData		VARCHAR(MAX)
		,SaveText		VARCHAR(max)
		,SaveDate		VARCHAR(50)
		,SaveNumber		VARCHAR(50)
	)

	CREATE TABLE #TEMPCIListNew
	(
		ID INT IDENTITY(1,1),
		CIListId int,
		CIListTemplateId int
	)

	BEGIN TRY
	/*---SaveMap data Log----*/
	INSERT INTO FormmakerSaveStatusLog( UserId ,FormID ,ConnId ,ConnectionId ,Status,StartDate )
	SELECT	@User_Id,@FormID,@ConnId,@ConnectionID,'STARTED',GETDATE()
			
	SET @FormmakerID = SCOPE_IDENTITY()
			
	UPDATE  dbo.user_accounts
	SET		SBFlag = 'started'
			,SBSaveMapDate = getdate()
	WHERE user_id = @User_Id

	SET  @AgencyDB = (SELECT TOP 1 DBName
	From IrrisCentral.dbo.lutPrimaryAgency
	where MapDbName = db_name())
			
	--Get @AgencyId
	SET  @AgencyId = (SELECT TOP 1 siteid
	From IrrisCentral.dbo.lutPrimaryAgency
	where MapDbName = db_name())

	INSERT INTO #FormTbl (FormName,FormID,PageId,FieldName,Libraryfieldname)
	SELECT     DISTINCT 'Formmaker_'+FP.formname  AS FormName ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name--,FS.Data_id
	FROM		formmaker_submissions FS
	INNER JOIN	formmaker_properties   FP  ON (FS.FORM_ID = FP.FORM_ID)
	INNER JOIN	formmaker_pages        FPG ON (FP.FORM_ID = FPG.FORM_ID)
	INNER JOIN	formmaker_fields       FF  ON ( (FPG.PAGE_ID = FF.PAGE_ID) AND (use_library = 1) )
	WHERE  FS.FORM_ID = @FormID 
	GROUP BY 'Formmaker_'+FP.formname   ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name

	UPDATE F
	SET F.DATA_TYPE = I.DATA_TYPE
	FROM #FormTbl F
	JOIN Information_Schema.Columns I
	ON I.COLUMN_NAME = F.FieldName
	AND I.TABLE_NAME = F.FormName


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



	SET @SQL = 'ALTER TABLE #temp ADD '+ @TableField +''

	EXEC(@SQL)

	SELECT DISTINCT @FormName = FormName FROM #FormTbl

	SET @sql = 'SELECT'+@Field+' FROM '+@FormName +'
	WHERE user_id = '+ CAST(@User_Id as varchar(20))+'
		AND ConnId			 = '+ CAST(@ConnId as varchar(20)) +'
		AND ConnectionID	 = ' +CAST(@ConnectionID as varchar(20))

	INSERT INTO #temp
	EXEC(@sql)
	select * from #temp
	-- SET @Str = 'SELECT '
  
	-- SELECT    @Str = @Str + i.Column_Name + ',' FROM Information_Schema.Columns i
	-- join #FormTbl f
	-- on i.Column_Name = f.FieldName
	--and    i.TABLE_Name =  @FormName
  
	-- SELECT @Str = SUBSTRING(@Str,0,len(@Str)) + ' into ##temptable FROM '+@FormName +'
	-- WHERE USER_ID = '+ CAST(@User_Id as varchar(20))+' AND CONNID = '+ CAST(-85619 as varchar(20)) +' AND CONNECTIONID = ' +CAST(288537 as varchar(20)) 
 
	-- PRINT @Str

	-- EXEC (@Str)
	-- SELECT * FROM ##temptable
	-- select * into #temp from ##temptable

	SET @query = 'SELECT fielddata, fieldname INTO ##temppivot FROM 
				 (
					SELECT '+@Field+'
					FROM #temp
				) x
				UNPIVOT
				(
					fielddata
					FOR FieldName IN (' + @Field + ')
				) p '
	EXEC (@query)

	SELECT	t.FieldData,
			f.DATA_TYPE,
			t.FieldName,
			f.LibraryFieldName 
	INTO #MapFieldData
	FROM ##temppivot t
	INNER JOIN #FormTbl f
	ON f.FieldName = t.fieldname

	select * from #MapFieldData

	IF EXISTS(SELECT 1 FROM #MapFieldData WHERE ISNULL(FieldName,'') <> '')
	BEGIN
		INSERT INTO #FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,ContactPrefix,LkpTable,LkpField) 
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
		ON (replace(substring(LibraryFieldName,charindex('_1',LibraryFieldName)+2,len(LibraryFieldName)),' ','') = replace(MGST.MedGenSubTypeText,' ','')
		 or replace(substring(LibraryFieldName,charindex('_2',LibraryFieldName)+2,len(LibraryFieldName)),' ','') = replace(MGST.MedGenSubTypeText,' ',''))
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
		INSERT INTO #FormfieldInfo(TableName,FieldName,DisplayName,FieldType,FieldSize,DefltVal,Req,LkpTable,LkpField)
		EXEC SP_AgencyFormFieldLibrary @AgencyId, NULL
	END
	select * from #FormfieldInfo
	IF EXISTS(SELECT 1 FROM #FormfieldInfo WHERE TableName = 'MAPSystemData')
	BEGIN
		UPDATE U 
		SET U.EDD = M.FieldData
		FROM user_accounts U
		JOIN #FormfieldInfo F
		ON U.[user_id] = @user_id
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
		INNER JOIN #FormfieldInfo F
		ON F.FieldName = M.LibraryFieldName
		WHERE F.TableName = 'MAPSystemData'

		MERGE INTO  MapFormData AS MF	
		USING(SELECT * FROM #TempMerge) AS M
		ON M.LibraryFieldName = MF.FieldName
		AND MF.user_id = @user_id

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
				@user_id,
				M.ContactPrefix,
				M.LibraryFieldName,
				M.FieldData
				);


	IF EXISTS(SELECT 1 FROM MapFormData WHERE [user_id] = @user_id AND ContactPrefix = 'AP1' AND FieldName = 'AP1ContactId' AND FieldData!=0)
	BEGIN
	SELECT DISTINCT @ContactId = CAST(COALESCE(FieldData,'0') AS INT)
		FROM MapFormData
		WHERE [user_id] = @user_id
			AND ContactPrefix = 'AP1'
			AND FieldName = 'AP1ContactId'
	END
	ELSE
	BEGIN
		SELECT DISTINCT @ContactId = AP1ContactId
		FROM MAPSystemData 
		WHERE [user_id] = @user_id

		INSERT INTO MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
		VALUES (@user_id,'AP1','AP1ContactId',CAST(@ContactId AS VARCHAR(50)))

	END

	SET @ContactId = 0

	SELECT CAST(COALESCE(M.FieldData,'0') AS INT) AS ContactID ,T.ContactPrefix
	INTO #ContactTemp
	FROM MapFormData M
	INNER JOIN #TempMerge T
	ON M.ContactPrefix = T.ContactPrefix
	AND M.FieldName = T.ContactPrefix + 'ContactId'
	WHERE [user_id] = @user_id
	GROUP BY M.FieldData,T.ContactPrefix

	IF EXISTS(SELECT 1 FROM #ContactTemp WHERE ContactId = 0 OR ContactId IS NULL)
	BEGIN

		IF EXISTS(SELECT 1 FROM #ContactTemp WHERE ContactPrefix = 'AP2')
		BEGIN
			SET @ContactPrefix = 'AP2'								
	
			SELECT DISTINCT @AP1ContactId = CAST(COALESCE(FieldData,'0') AS INT)
			FROM	MapFormData
			WHERE [user_id] = @user_id
				AND ContactPrefix = 'AP1'
				AND FieldName = 'AP1ContactId'
								
			SET @sqlContactParamDef	= '@ContactId int output'
			SET @SqlContactId		= 'SELECT @ContactId = DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),2)'
			EXEC SP_EXECUTESQL @SqlContactId,@sqlContactParamDef,@ContactId = @ContactId output
															
			IF ( @ContactId = @AP1ContactId )
			BEGIN
				SET @sqlCId2ParamDef	= '@ContactId2 int output'
				SET @SqlCId2			= 'SELECT @ContactId2 = DBO.udf_CouplecontactId(('+CAST( @AP1ContactId AS VARCHAR(10))+'*-1),1)'
				EXEC SP_EXECUTESQL @SqlCId2,@sqlCId2ParamDef,@ContactId2 = @ContactId OUTPUT
			END
								
			IF( @ContactId <> @AP1ContactId  AND @ContactId IS NOT NULL AND @ContactId > 0 )
			BEGIN
				INSERT INTO MapFormData ([user_id],ContactPrefix,FieldName,FieldData)
				VALUES (@user_id,@ContactPrefix,'AP2ContactId',CAST(@ContactId AS VARCHAR(50)))
			END
			ELSE 
			BEGIN

				EXEC SP_MAPNewContact @AgencyDB, @user_id, @ContactPrefix

				SELECT @NewContactId = CAST(COALESCE(FieldData,'0') AS INT)
				FROM MapFormData
				WHERE [user_id] = @User_Id
				AND FieldName = 'AP2ContactId'

				IF @NewContactId > 0
					UPDATE MAPSystemData
					SET AP2ContactId = @NewContactId
					WHERE [user_id] = @user_id
			END -- END OF ELSE CONDITION
	end
	END
			select * from #TempMerge
			select * from #contactprefix

			INSERT INTO #contactprefix (ContactPrefix)
			SELECT DISTINCT contactprefix  FROM #TempMerge

			SET @MinCount = 1
			SELECT  MAX(ID) FROM #contactprefix
			WHILE(@MinCount <=@MaxCount)
			BEGIN
				SELECT @ContactPrefix = ContactPrefix 
				FROM #contactprefix
				WHERE ID = @MinCount

				select @ContactPrefix ContactPrefix


				IF EXISTS(SELECT 1 FROM #ContactTemp WHERE ContactId = 0 OR ContactId IS NULL)
				BEGIN
					IF(@ContactPrefix <> 'AP2')		
						EXEC SP_MAPNewContact @AgencyDB, @user_id, @ContactPrefix
					SET @MinCount = @MinCount+1
				END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE (LibraryFieldName LIKE '%Relationship%' OR LibraryFieldName LIKE '%FName%' OR LibraryFieldName LIKE '%LName%' OR LibraryFieldName LIKE '%MName%' OR LibraryFieldName LIKE '%Gender%' OR LibraryFieldName LIKE '%DOB%' OR LibraryFieldName LIKE '%SSN%' OR LibraryFieldName LIKE '%BirthCity%' OR LibraryFieldName LIKE '%BirthState%' OR LibraryFieldName LIKE '%BirthCountry%' OR LibraryFieldName LIKE '%Salutation%' OR LibraryFieldName LIKE '%Nickname%') AND ContactPrefix = @ContactPrefix)
				BEGIN
					EXEC [SPMAPContact] @AgencyDB, @user_id, @ContactPrefix
				END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Add%' OR (LibraryFieldName LIKE '%City' AND LibraryFieldName NOT LIKE '%Ethnicity%') OR LibraryFieldName LIKE '%State%' OR LibraryFieldName LIKE '%Zip%' OR LibraryFieldName LIKE '%Country%' OR LibraryFieldName LIKE '%County%')AND ContactPrefix = @ContactPrefix)
					BEGIN
						EXEC [SPMAPAddress] @AgencyDB, @user_id, @ContactPrefix
					END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Email%')AND ContactPrefix = @ContactPrefix)
					BEGIN
						EXEC SP_MAPEmail @AgencyDB, @user_id, @ContactPrefix
					END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Ethnicity%')AND ContactPrefix = @ContactPrefix)
					BEGIN
						--SET @Suffix = COALESCE(SUBSTRING(@FieldName, CHARINDEX('Ethnicity',@FieldName) + 9, LEN(@FieldName)),0)
						EXEC [SPMAPEthnicity] @AgencyDB, @user_id, @ContactPrefix
					END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Race%')AND ContactPrefix = @ContactPrefix)
					BEGIN 
						--Set @Suffix = coalesce(substring(@FieldName, charindex('Race',@FieldName) + 4, len(@FieldName)),0)
						EXEC [SPMAPRace] @AgencyDB, @user_id, @ContactPrefix
					END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Religion%')AND ContactPrefix = @ContactPrefix)
					BEGIN
						--SET @Suffix = coalesce(substring(@FieldName, charindex('Religion',@FieldName) + 8, len(@FieldName)),0)
						EXEC [SPMAPReligion] @AgencyDB, @user_id, @ContactPrefix
					END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Education%' OR LibraryFieldName LIKE '%Degree%' OR LibraryFieldName LIKE '%Institution%')AND ContactPrefix = @ContactPrefix)
					BEGIN
						EXEC SP_MAPEducation @AgencyDB, @user_id, @ContactPrefix
					END
				--IF EXISTS(SELECT 1 FROM #MapFieldData WHERE ( LibraryFieldName LIKE '%MarraigeDate%' OR LibraryFieldName LIKE '%MarriageStatus%' OR LibraryFieldName LIKE '%TerminationDate%' OR LibraryFieldName LIKE '%TermReason%' OR LibraryFieldName LIKE '%Spouse%'))
				--	BEGIN				
				--		SET @Suffix = COALESCE(RIGHT(@FieldName,1),'0')
				--		EXEC SP_MAPMarriage @Agency, @user_id, @ContactPrefix, @Suffix
				--	END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%HomePhone%' OR LibraryFieldName LIKE '%WorkPhone%' OR LibraryFieldName LIKE '%CellPhone%')AND ContactPrefix = @ContactPrefix)
				BEGIN
					IF EXISTS (SELECT 1 FROM #TempMerge WHERE (LibraryFieldName LIKE '%HomePhone%')AND ContactPrefix = @ContactPrefix)
					BEGIN Set @Suffix = 1  END
					IF EXISTS (SELECT 1 FROM #TempMerge WHERE (LibraryFieldName LIKE '%WorkPhone%')AND ContactPrefix = @ContactPrefix)
					BEGIN Set @Suffix = 2  END
					IF EXISTS (SELECT 1 FROM #TempMerge WHERE (LibraryFieldName LIKE '%CellPhone%')AND ContactPrefix = @ContactPrefix)
					BEGIN Set @Suffix = 3  END
				
					EXEC SP_MAPPhone @AgencyDB, @user_id, @ContactPrefix, @Suffix
			
				END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%Language%')AND ContactPrefix = @ContactPrefix)	
				BEGIN
					--SET @Suffix = COALESCE(SUBSTRING(@FieldName, CHARINDEX('Language',@FieldName) + 8, LEN(@FieldName)),0)
					EXEC [SPMAPContactLanguage] @AgencyDB, @user_id, @ContactPrefix
				END
				IF EXISTS(SELECT 1 FROM #TempMerge WHERE ( LibraryFieldName LIKE '%ReferralSource%')AND ContactPrefix = @ContactPrefix)	
				BEGIN
					EXEC SP_MAPReferralSave @AgencyDB, @user_id			
				END 

				SET @MinCount = @MinCount+1
				SELECT @MinCount MinCount
			END
		--DROP TABLE #ContactTemp
		--DROP TABLE #contactprefix
END

	IF EXISTS(SELECT 1 FROM #FormfieldInfo WHERE TableName = 'Medical Info')
	BEGIN
	select 'Medical Info'
		SELECT  f.tablename
			,	f.fieldname
			,	f.fieldtype
			,	f.lkptable
			,	f.DefltVal
			,	m.fielddata 
	 INTO #temp_medinfo
		FROM #FormfieldInfo f
		JOIN #MapFieldData m
		ON (m.libraryfieldname=f.fieldname)
		WHERE tablename='medical info'



		ALTER TABLE #temp_medinfo
		ADD  contactid			INT
			,contactmedgenid	INT
			,MedGenSubTypeId	INT
			,MedGenDate			DATETIME
			,fielddata_temp		VARCHAR(200)
			,MedGenPullDownId	INT
			,MedGenNote			VARCHAR(2000)

		UPDATE #temp_medinfo 
		SET contactid=(SELECT DISTINCT Cast(Coalesce(FieldData,'0') AS INT) FROM MapFormData WHERE (user_id = @user_id) 
		AND (ContactPrefix = 'AP1') and (FieldName = 'AP1ContactId'))
		WHERE fieldname like 'med_1%'

		UPDATE #temp_medinfo 
		SET contactid=(SELECT DISTINCT Cast(Coalesce(FieldData,'0') as int) FROM MapFormData WHERE (user_id = @user_id) 
		AND (ContactPrefix = 'AP2') and (FieldName = 'AP2ContactId'))
		WHERE fieldname like 'med_2%'

		UPDATE #temp_medinfo 
		SET fielddata_temp=replace(fielddata,'"','')
			,MedGenNote='Pulldown'
		WHERE lkptable >''

		UPDATE #temp_medinfo 
		SET MedGenDate=fielddata
		WHERE fieldtype='date' or fieldtype='datetime'

		UPDATE #temp_medinfo 
		SET MedGenNote=fielddata
		WHERE MedGenNote is null and fieldtype ='text'

		UPDATE #temp_medinfo 
		SET MedGendate=Cast(GetDate() as varchar(26))
		WHERE MedGendate is null or MedGendate =''

		UPDATE #temp_medinfo
		SET #temp_medinfo.contactmedgenid=cm.contactmedgenid 
		FROM contactmedgen cm
		WHERE #temp_medinfo.defltval=cm.MedGensubtypeid 
		AND #temp_medinfo.contactid=cm.contactid

		UPDATE #temp_medinfo
		SET #temp_medinfo.MedGensubtypeid=mp.medgensubtypeid 
		FROM medgenpulldown mp
		WHERE #temp_medinfo.fielddata_temp=replace(mp.medgenpulldowntext, '"', '')

		UPDATE #temp_medinfo
		SET #temp_medinfo.MedGenpulldownid=mp.medgenpulldownid
		FROM medgenpulldown mp
		WHERE #temp_medinfo.medgennote='pulldown' 
		AND #temp_medinfo.fielddata_temp=replace(mp.medgenpulldowntext, '"', '')

		UPDATE #temp_medinfo
		SET medgensubtypeid=defltval
		WHERE medgensubtypeid is null

		MERGE INTO ContactMedGen AS mg	
			USING(SELECT * FROM #temp_medinfo) AS mi
			ON mg.contactid = mi.contactid
			AND mg.medgensubtypeid=mi.medgensubtypeid
			AND mg.contactmedgenid=mi.contactmedgenid

		WHEN MATCHED THEN 

		UPDATE SET mg.MedGenSubTypeId = mi.MedGenSubTypeId,
				mg.ContactId = mi.ContactId,
				mg.MedGenDate = mi.MedGenDate,
				mg.MedGenPullDownId = mi.MedGenPullDownId,
				mg.MedGenNote = mi.MedGenNote

		WHEN NOT MATCHED THEN

				INSERT (MedGenSubTypeId
						,ContactId
						,MedGenDate
						,MedGenPullDownId
						,MedGenNote)

				VALUES (mi.MedGenSubTypeId
						,mi.ContactId
						,mi.MedGenDate
						,mi.MedGenPullDownId
						,mi.MedGenNote);


	END
	IF EXISTS(SELECT 1 FROM #FormfieldInfo WHERE (TableName <> 'Medical Info' AND TableName <> 'MAPSystemData'))
	BEGIN
	select 'other'
		INSERT #temp_otherinfo
		(	 TableName		
			,FieldName	
			,FieldType	
			,LkpTable		
			,DefltVal		
			,FieldData		
		)
		(
		SELECT  f.tablename
			,	f.fieldname
			,	f.fieldtype
			,	f.lkptable
			,	f.DefltVal
			,	m.fielddata 
		FROM #FormfieldInfo f
		JOIN #MapFieldData m
		ON (m.libraryfieldname=f.fieldname)
		WHERE (f.TableName != 'Medical Info' AND f.TableName != 'MAPSystemData')
		)

		SELECT @UserContactId = airs_contact_id
		from user_accounts
		where [User_Id] = @user_id

		UPDATE #temp_otherinfo 
		SET SaveText=fielddata
		WHERE FieldType in ('text','TextArea','RadioButton','Checkbox','MultiSelect')

		UPDATE #temp_otherinfo 
		SET SaveDate= CAST(fielddata AS datetime)
		WHERE FieldType = 'date' or FieldType = 'Datetime' or FieldType = 'datetime'

		UPDATE #temp_otherinfo 
		SET SaveNumber=fielddata
		WHERE FieldType = 'int' or FieldType = 'Real'

		UPDATE #temp_otherinfo 
		SET SaveNumber= CASE 
						WHEN ( lkptable = 'YesNoPullDown' AND fielddata = 'No') THEN 0
						WHEN ( lkptable = 'YesNoPullDown' AND fielddata = 'Yes') THEN 1
						WHEN ( lkptable = 'YesNoPullDown' AND fielddata = 'Maybe') THEN 2
						end
		WHERE lkptable = 'YesNoPullDown'

		SELECT coalesce(C.CIListTemplateId,0) as CIListTemplateId,C.CIListTemplateItemId,T.SaveText,T.SaveDate,T.SaveNumber
		INTO #TEMPCIListTemplateItem
		FROM  dbo.CIListTemplateItem C
		JOIN #temp_otherinfo T
		ON T.DefltVal = C.CIListTemplateItemId 

		SELECT coalesce(C.CIListId,0) AS CIListId,C.CIListTemplateId,CIListTemplateItemId,T.SaveText,T.SaveDate,T.SaveNumber
		INTO #TEMPCIList
		FROM  dbo.CIList C
		JOIN #TEMPCIListTemplateItem T
		ON T.CIListTemplateId = C.CIListTemplateId 
		WHERE ContactId = @UserContactId


		INSERT #TEMPCIListNew (CIListId,CIListTemplateId)
		SELECT CIListId,CIListTemplateId 
		FROM #TEMPCIList
		WHERE coalesce(CIListId,0) = 0

		DELETE FROM #TEMPCIList WHERE coalesce(CIListId,0) = 0

		IF EXISTS(SELECT 1 FROM #TEMPCIListNew)
		BEGIN
			DECLARE	@CIListId INT
			SET @MinCount = 1
			SELECT @MaxCount = MAX(ID) FROM #TEMPCIListNew
			WHILE(@MinCount<=@MaxCount)
			BEGIN
				INSERT INTO CIList (ContactId, ContactAIRSId, CIListTemplateId, StrtDate)
				SELECT @UserContactId,
						0,
						CIListTemplateId,
						Cast(GetDate() as varchar(26))
				FROM #TEMPCIListNew
				WHERE ID = @MinCount

				SELECT @CIListId = @@Identity
			
				INSERT INTO CIListItem(CIListId, CIListTemplateItemId, CIListItemDate, CIListNumber, CIListText)
				SELECT	@CIListId
					,	TI.CIListTemplateItemId
					,	ISNULL(CAST(CAST(TI.SaveDate AS DATETIME)AS VARCHAR(26)),'')
					,	ISNULL(CAST(TI.SaveNumber AS VARCHAR(100)),'NULL')
					,	ISNULL(TI.SaveText,'')
				FROM #TEMPCIListTemplateItem TI
				JOIN #TEMPCIListNew T
				ON TI.CIListTemplateId = T.CIListTemplateId
			 
			END
		END

		SELECT coalesce(C.CIListId,0) AS CIListId,coalesce(C.CIListItemId,0) AS CIListItemId,C.CIListTemplateItemId ,T.SaveText,T.SaveDate,T.SaveNumber
		INTO #TEMPCIListItem
		FROM  dbo.CIListItem C
		JOIN #TEMPCIList T
		ON T.CIListId = C.CIListId 
		AND T.CIListTemplateItemId = C.CIListTemplateItemId

		INSERT CIListItem (CIListId, CIListTemplateItemId, CIListItemDate, CIListNumber, CIListText)
		SELECT	CIListId
			,	CIListTemplateItemId
			,	ISNULL(CAST(CAST(SaveDate AS DATETIME)AS VARCHAR(26)),'')
			,	ISNULL(CAST(SaveNumber AS VARCHAR(100)),'NULL')
			,	ISNULL(SaveText,'')
		FROM #TEMPCIListItem
		WHERE CIListItemId = 0

		UPDATE C
		SET C.CIListItemDate = ISNULL(CONVERT(DATETIME,T.SaveDate),'')
		,	C.CIListNumber = ISNULL(CAST(T.SaveNumber AS INT),'')
		,	C.CIListText = ISNULL(T.SaveText,'')
		FROM CIListItem C
		JOIN #TEMPCIListItem T
		ON T.CIListId = C.CIListId
		AND T.CIListTemplateItemId = C.CIListTemplateItemId
		WHERE T.CIListItemId <> 0

	--DROP TABLE #temp_otherinfo
	--DROP TABLE #TEMPCIListNew
	--DROP TABLE #TEMPCIListTemplateItem
	--DROP TABLE #TEMPCIList
	--DROP TABLE #TEMPCIListItem

	END

	/**************Update SB Flag**************************/
	UPDATE  dbo.user_accounts
	SET		SBFlag = 'COMPLETED'
			,SBSaveMapDate = getdate()
	WHERE user_id = @user_id

	/************ Update Formmaker status log *************/
	UPDATE	FormmakerSaveStatusLog
	SET		STATUS	 = 'COMPLETED'	,
			EndDate  = GETDATE()
	WHERE	id = @FormmakerID 
			
	END TRY
	BEGIN CATCH
		
	UPDATE  dbo.user_accounts
	SET		SBFlag			= NULL
			,SBSaveMapDate  = NULL
	WHERE user_id = @user_id
			
	UPDATE	FormmakerSaveStatusLog
	SET		ErrorMsg = ERROR_MESSAGE(),
			STATUS	 = 'ERROR'	,
			EndDate  = GETDATE()
	WHERE	id = @FormmakerID 

	select ERROR_MESSAGE()

	END CATCH


	--DROP TABLE #FormTbl
	--DROP TABLE #FormfieldInfo
	--DROP TABLE #TempMerge
	--DROP TABLE #temp
	--DROP TABLE ##temppivot
	--DROP TABLE #MapFieldData
	--DROP TABLE #temp_medinfo
	--drop table #contactprefix
	--drop table #contacttemp

END



