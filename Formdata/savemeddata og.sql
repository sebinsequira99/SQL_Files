



use rolesqa

CREATE TABLE #FormTbl
(
	id				 INT IDENTITY(1,1),
	FormName		 VARCHAR(MAX),
	FormID			 INT,
	PageId			 INT,
	FieldName		 VARCHAR(MAX),
	Libraryfieldname VARCHAR(MAX)
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

DECLARE @FormName	VARCHAR(MAX),
		@SQL		VARCHAR(MAX),
		@Str		VARCHAR(MAX),
		@Field		VARCHAR(MAX),
		@TableField VARCHAR(MAX),
		@query		VARCHAR(MAX)

INSERT INTO #FormTbl (FormName,FormID,PageId,FieldName,Libraryfieldname)
SELECT DISTINCT 'Formmaker_'+FP.formname  AS FormName ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name--,FS.Data_id
FROM formmaker_submissions FS
INNER JOIN	formmaker_properties   FP  ON (FS.FORM_ID = FP.FORM_ID)
INNER JOIN	formmaker_pages        FPG ON (FP.FORM_ID = FPG.FORM_ID)
INNER JOIN	formmaker_fields       FF  ON ( (FPG.PAGE_ID = FF.PAGE_ID) AND (use_library = 1) )
WHERE  FS.FORM_ID = 2480 
GROUP BY 'Formmaker_'+FP.formname   ,FP.FORM_ID,FF.PAGE_ID,FF.NAME,FF.library_field_name

--select * from #FormTbl

SET @TableField = STUFF((SELECT ',' + QUOTENAME(FieldName) +'VARCHAR(255)'
                    FROM #FormTbl
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

		--print @TableField

SET @Field = STUFF((SELECT ',' + QUOTENAME(FieldName)
                    FROM #FormTbl
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

		--print @Field

CREATE TABLE #temp
(
	ID INT IDENTITY(1,1)
)

SET @SQL = 'ALTER TABLE #temp ADD '+ @TableField +''

EXEC(@SQL)
--PRINT @SQL

SELECT DISTINCT @FormName = FormName FROM #FormTbl
print @FormName

SET @sql = 'SELECT'+@Field+' FROM '+@FormName +'
WHERE user_id = 12910
	AND ConnId			 = -85619
	AND ConnectionID	 = 288537'

--PRINT @sql
INSERT INTO #temp
EXEC(@sql)

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

--SELECT * FROM #MapFieldData

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
'Text' AS FieldType,
CASE 
 WHEN MGST.IsMedGenDate = '1' THEN 26
 WHEN MGST.IsMedGenNote = '1' THEN 2000
 WHEN MGST.IsMedGenAge = '1' THEN 255
 WHEN MGST.IsMedGenPulldown = '1' THEN 26
 WHEN MGST.IsMedGenDate = '1' THEN 26
END AS FieldSize,
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


--UPDATE CONTACTMEDGEN TABLE


SELECT   f.tablename
		,f.fieldname
		,f.fieldtype
		,f.lkptable
		,f.DefltVal
		,m.fielddata 
INTO #temp_medinfo
FROM #FormfieldInfo f
JOIN #MapFieldData m
ON (m.libraryfieldname=f.fieldname)
WHERE tablename='medical info'

ALTER TABLE #temp_medinfo
ADD contactid			INT
	,contactmedgenid	INT
	,MedGenSubTypeId	INT
	,MedGenDate			DATETIME
	,MedGenPullDownId	VARCHAR(200)
	,MedGenNote			VARCHAR(2000)

UPDATE #temp_medinfo 
SET contactid=(SELECT DISTINCT Cast(Coalesce(FieldData,'0') AS INT) FROM MapFormData WHERE (user_id = 12910) 
AND (ContactPrefix = 'AP1') and (FieldName = 'AP1ContactId'))
WHERE fieldname like 'med_1%'

UPDATE #temp_medinfo 
SET contactid=(SELECT DISTINCT Cast(Coalesce(FieldData,'0') as int) FROM MapFormData WHERE (user_id = 12910) 
AND (ContactPrefix = 'AP2') and (FieldName = 'AP2ContactId'))
WHERE fieldname like 'med_2%'

UPDATE #temp_medinfo 
SET MedGenPullDownId=replace(fielddata,'"','')
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
WHERE #temp_medinfo.MedGenpulldownid=replace(mp.medgenpulldowntext, '"', '')

UPDATE #temp_medinfo
SET #temp_medinfo.MedGenpulldownid=mp.medgenpulldownid
FROM medgenpulldown mp
WHERE #temp_medinfo.medgennote='pulldown' 
AND #temp_medinfo.MedGenpulldownid=replace(mp.medgenpulldowntext, '"', '')

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

--drop table #FormTbl
--drop table #temp
--drop table ##temppivot
--drop table #MapFieldData
--drop table #FormfieldInfo
--drop table #temp_medinfo
