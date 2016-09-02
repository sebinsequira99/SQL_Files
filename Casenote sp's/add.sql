

DECLARE @cAccountkey INT = 164
	   ,@ContactId INT = 0
	   ,@CaseId INT = 0
	   ,@Connid INT = 0
	   ,@ContactTypeId INT = 0
	   ,@StaffConnid INT = 0
	   ,@ActTypeId INT = 0
	   ,@ActPriority INT = 0
	   ,@ActDate VARCHAR(30) = ''
	   ,@ActRe VARCHAR(MAX) =''
	   ,@ActDuration INT = 0
	   ,@IsActComplet INT = 1
	   ,@Incident INT = 0
	   ,@CreatedByConnid INT = 0
	   ,@fileuploadMenuId INT = 0
	   ,@ConnectionId INT = 0
	   ,@ownerConnID INT = 0
	   ,@ActContent varchar(max)= ''
	   ,@event_reg_id int=0
	   ,@SecureCaseNote_Code INT=0
	   ,@Secure_Case_Note VARCHAR(MAX)='a'
	   ,@Secure_Case_Note_Subtype VARCHAR(MAX)='a'
	   ,@SecureNoteSubtype_ShowToAll INT=0

	   ,@strDBName VARCHAR(100)
	   ,@ActDateCompleted VARCHAR(30)
	   ,@DateCreated VARCHAR(30) 
	   ,@ContactActivityId INT 
       ,@ErrorMsg NVarchar(max)
	   ,@ErSeverity NVarchar(max)
	   ,@ErState NVarchar(max)

	DECLARE @strQuery VARCHAR(MAX)

	SET @ActDateCompleted  = @ActDate
	SET @DateCreated = CONVERT(VARCHAR(18), GETDATE(), 120)


	SELECT DISTINCT
            @strDBName = '[' + [DBName] + ']'
	FROM
        [IrrisCentral].[dbo].[lutPrimaryAgency] LPA        
	WHERE
        LPA.SiteID = @cAccountkey
    
	SET @strQuery = 'INSERT INTO ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes(Code,noteType,CreatedBy,CreatedDate)
					VALUES (' + cast(@SecureCaseNote_Code as varchar(50)) + ',''' +@Secure_Case_Note+ ''',(Select user_id from user_accounts where connid=' 
					+ cast(@CreatedByConnid as varchar(50))+ '),
					'''+ @DateCreated+''')
					INSERT INTO ' + @strDBName + '.dbo.lkpSecureCaseNoteSubTypes(Description,SecureNoteTypeID,ShowToAll,CreatedBy,CreatedDate)
					VALUES (''' +@Secure_Case_Note_Subtype+ ''',(select typeid from ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes where notetype='''
					+@Secure_Case_Note+'''),' + cast(@SecureNoteSubtype_ShowToAll as varchar(50)) 
					+ ',(Select user_id from user_accounts where connid=' 
					+ cast(@CreatedByConnid as varchar(50)) + '),''' + @DateCreated+ ''')'
	
	print @strQuery			
	--exec(@strQuery) 