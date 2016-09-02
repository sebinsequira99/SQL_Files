


--exec USP_ViewMAPDataGroup 14669,'AP1Fname,AP1Lname,AP1Nickname,AP1DOB,AP2Fname,AP2Lname,add1'

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='USP_ViewMAPDataGroup' AND type='p')
DROP PROC USP_ViewMAPDataGroup;
GO

CREATE PROC [dbo].[USP_ViewMAPDataGroup]
(
	@UserId int,
	@FieldNames varchar(MAX)
)
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @xmldata xml
		   ,@contactid int

	SELECT @contactid=abs(connid) from user_accounts where user_id=@UserId

	SELECT value into #InputFieldNames from udf_Split_into_rows(@FieldNames);

	--select * from #InputFieldNames

	SELECT @xmldata=data_xml FROM library_systemdata WHERE contactid=@contactid
	;
	WITH XmlData
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(100)')	as 'Fieldname'
	,[column].value('.', 'NVARCHAR(100)')	as 'Fieldvalue'
	FROM @xmlData.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','varchar(50)')<>''
	)
	
	SELECT * INTO #XmlData FROM XmlData
	--DELETE FROM #XmlData WHERE fieldname in ('xml','syslibrary')
	
	ALTER TABLE #XmlData
	ADD id INT IDENTITY(1,1)

	SELECT x.fieldname,x.fieldvalue FROM #XmlData x
	INNER JOIN #InputFieldNames i
	ON x.fieldname=i.value

	DROP TABLE #XmlData

	SET NOCOUNT OFF

END


