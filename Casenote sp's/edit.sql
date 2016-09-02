



DECLARE @cAccountkey INT = 164
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
	,@CreatedByConnid INT = 0
	,@fileuploadMenuId INT = 0
	,@ConnectionId INT = NULL
	,@ActContent varchar(max)= NULL
	,@SecureNote_TypeId INT=58
	,@SecureCaseNote_Code INT=1
	,@Secure_Case_Note VARCHAR(MAX)='test'
	,@Secure_Case_Note_Subtype VARCHAR(MAX)='test'
	,@SecureNoteSubtype_ShowToAll INT=1

	,@strDBName VARCHAR(100)
	,@ActDateCompleted VARCHAR(30)
    ,@RowCount INT 
	,@strQuery VARCHAR(MAX)
	,@ParamDef NVARCHAR(1000)


	SELECT  DISTINCT
            @strDBName = '[' + [DBName] + ']'
	FROM
        [IrrisCentral].[dbo].[lutPrimaryAgency] LPA        
	WHERE
        LPA.SiteID = @cAccountkey
		
	
	SET @strQuery = 'UPDATE ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes
					set Code=' + cast(@SecureCaseNote_Code as varchar(50)) + '
					   ,noteType='''+@Secure_Case_Note+'''
					   ,ModifiedBy=(Select user_id from user_accounts where connid='+ cast(@CreatedByConnid as varchar(50))+')
					   ,ModifiedDate=getdate()
					where typeid='+ cast(@SecureNote_TypeId as varchar(50))+'

					UPDATE ' + @strDBName + '.dbo.lkpSecureCaseNoteSubTypes
					set Description='''+@Secure_Case_Note_Subtype+'''
					   ,ShowToAll='+ cast(@SecureNoteSubtype_ShowToAll as varchar(50))+'
					   ,ModifiedBy=(Select user_id from user_accounts where connid='+ cast(@CreatedByConnid as varchar(50))+')
					   ,ModifiedDate=getdate()
					where SecureNoteTypeID='+ cast(@SecureNote_TypeId as varchar(50))+''

	--Print @strQuery 
	EXEC( @strQuery)

