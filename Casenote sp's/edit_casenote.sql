

--exec Edit_CaseNote_test 164,86395,0,0,0,0,0,0,'','test1',0,0,0,0,0,'test1',1,'test2','test2',1

ALTER PROCEDURE [dbo].[Edit_CaseNote_test]
	 @cAccountkey INT = NULL
	,@casenoteID INT = NULL
	,@ContactId INT = NULL
	,@CaseId INT = NULL
	,@Connid INT = NULL
	,@StaffConnid INT = NULL
	,@ActTypeId INT = NULL
	,@ActPriority INT = NULL
	,@ActDate VARCHAR(30) = NULL
	,@ActRe VARCHAR(MAX) = NULL
	,@ActDuration INT = NULL
	,@Incident INT = NULL
	,@CreatedByConnid INT = NULL
	,@fileuploadMenuId INT = 0
	,@ConnectionId INT = NULL
	,@ActContent varchar(max)= NULL
	,@SecureCaseNote_Code INT=0
	,@Secure_Case_Note VARCHAR(MAX)=''
	,@Secure_Case_Note_Subtype VARCHAR(MAX)=''
	,@SecureNoteSubtype_ShowToAll INT=0


AS
BEGIN
	DECLARE @strDBName VARCHAR(100)
	DECLARE	@ActDateCompleted VARCHAR(30)
    DECLARE @RowCount Int 
	DECLARE @strQuery NVARCHAR(MAX)
	DECLARE @ParamDef NVARCHAR(1000)
	DECLARE @ErrorMsg VARCHAR(MAX)

	SET @ActDateCompleted  = @ActDate
    SET @RowCount = NULL

	SELECT  DISTINCT
            @strDBName = '[' + [DBName] + ']'
	FROM
        [IrrisCentral].[dbo].[lutPrimaryAgency] LPA        
	WHERE
        LPA.SiteID = @cAccountkey
	
	SET @strQuery = 'UPDATE ' + @strDBName + '.dbo.ContactActivity 
					SET ContactId = ' + cast(@ContactId as varchar(50)) + ',CaseId =' + cast(@CaseId as varchar(50)) + ',Connid=' 
									+ cast(@Connid as varchar(50))+ ',StaffConnid=' 
									+ cast(@StaffConnid as varchar(50)) + ',ActTypeId=' + cast(@ActTypeId as varchar(50))+ ',ActPriority=' 
									+ cast(@ActPriority as varchar(50))	+ ',ActDate=''' + @ActDate+ ''',ActRe=''' 
									+ @ActRe + ''',ActDuration=' + cast(@ActDuration as varchar(50))+ ',ActDateCompleted=''' + @ActDateCompleted
									+ ''',Incident=' + cast(@Incident as varchar(50))+ ',CreatedByConnid=' + cast(@CreatedByConnid as varchar(50)) 
									+ ',fileupload_menu_Id='+ cast(@fileuploadMenuId as varchar(50)) + ',ConnectionId='+ cast(@ConnectionId as varchar(50)) 
									+ ',ContentFlag = ''1'''
									+ ' WHERE ContactActivityId = '+cast(@casenoteID as varchar(50))+''

	--Print @strQuery 
	EXEC( @strQuery)
	
    SET @ParamDef = '@RowCount INT output'
	SET @strQuery ='SELECT  top 1 @RowCount = ContactActivityContent_id FROM '+ @strDBName + '.dbo.ContactActivityContent WHERE ContactActivityId = '+ cast(@casenoteID as varchar(50))
	
	Exec sp_executesql @strQuery,@ParamDef,@RowCount = @RowCount output
	
	IF (@RowCount IS NOT NULL)
	BEGIN
	SET @strQuery = 'UPDATE ' + @strDBName + '.dbo.ContactActivityContent
	                 SET ActContent = '''+ @ActContent +'''
	                 WHERE ContactActivityId = '+ cast(@casenoteID as varchar(50))
	
	 
	EXEC( @strQuery)
	END 
	ELSE 
	BEGIN
	SET @strQuery = 'INSERT INTO ' + @strDBName + '.dbo.ContactActivityContent (ContactActivityId ,ActContent)
	                                                               Values (' + cast(@casenoteID as varchar(50)) + ','''+ @ActContent + ''')' 
	
	EXEC( @strQuery)
	END 


	SET @strQuery = 'UPDATE ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes
					set Code=' + cast(@SecureCaseNote_Code as varchar(50)) + '
					   ,noteType='''+@Secure_Case_Note+'''
					   ,ModifiedBy=(Select user_id from user_accounts where connid='+ cast(@CreatedByConnid as varchar(50))+')
					   ,ModifiedDate=getdate()
					where ContactActivityId = '+cast(@casenoteID as varchar(50))+'

					UPDATE ' + @strDBName + '.dbo.lkpSecureCaseNoteSubTypes
					set Description='''+@Secure_Case_Note_Subtype+'''
					   ,ShowToAll='+ cast(@SecureNoteSubtype_ShowToAll as varchar(50))+'
					   ,ModifiedBy=(Select user_id from user_accounts where connid='+ cast(@CreatedByConnid as varchar(50))+')
					   ,ModifiedDate=getdate()
					where ContactActivityId = '+cast(@casenoteID as varchar(50))+''

	BEGIN TRY
	EXEC( @strQuery) 
	END TRY 
	BEGIN CATCH     
		SET @ErrorMsg =Error_Message()
		print @ErrorMsg
	END CATCH 

END




