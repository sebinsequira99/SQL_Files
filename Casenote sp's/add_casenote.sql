

--exec Add_CaseNote_test 164,0,0,0,0,0,0,0,'','test',0,1,0,0,0,0,0,'test',0,0,'test1','test1',0


ALTER PROCEDURE [dbo].[Add_CaseNote_test]
 @cAccountkey INT = 0
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
,@Secure_Case_Note VARCHAR(MAX)=''
,@Secure_Case_Note_Subtype VARCHAR(MAX)=''
,@SecureNoteSubtype_ShowToAll INT=0

AS
BEGIN
	DECLARE @strDBName VARCHAR(100)
	DECLARE	@ActDateCompleted VARCHAR(30)
	DECLARE	@DateCreated VARCHAR(30) 
	DECLARE @ContactActivityId INT 
    DECLARE @ErrorMsg NVarchar(max)
	DECLARE @ErSeverity NVarchar(max)
	DECLARE @ErState NVarchar(max)

	DECLARE @strQuery VARCHAR(MAX)

	SET @ActDateCompleted  = @ActDate
	SET @DateCreated = CONVERT(VARCHAR(18), GETDATE(), 120)


	SELECT DISTINCT
            @strDBName = '[' + [DBName] + ']'
	FROM
        [IrrisCentral].[dbo].[lutPrimaryAgency] LPA        
	WHERE
        LPA.SiteID = @cAccountkey
	BEGIN TRY
	SET @strQuery = 'INSERT INTO ' + @strDBName + '.dbo.ContactActivity (DoNotPrint,ContactId,CaseId,Connid,ContactTypeId
					,StaffConnid, ActTypeId, ActPriority, ActDate, ActRe
					, ActDuration, IsActComplet, ActDateCompleted, Incident, CreatedByConnid
					, DateCreated, fileupload_menu_Id, FileFlag,ConnectionId,ownerConnID, ContentFlag,event_reg_id)
					Values (0,' + cast(@ContactId as varchar(50)) + ',' + cast(@CaseId as varchar(50)) + ',' 
						+ cast(@Connid as varchar(50))+ ',' + cast(@ContactTypeId as varchar(50)) + ',' 
						+ cast(@StaffConnid as varchar(50)) + ',' + cast(@ActTypeId as varchar(50))+ ',' 
						+ cast(@ActPriority as varchar(50))	+ ',''' + @ActDate+ ''',''' 
						+ @ActRe + ''',' + cast(@ActDuration as varchar(50))+ ',' 
						+ cast(@IsActComplet as varchar(50))+ ',''' + @ActDateCompleted
						+ ''',' + cast(@Incident as varchar(50))+ ',' + cast(@CreatedByConnid as varchar(50)) 
						+ ',''' + @DateCreated +''','+ cast(@fileuploadMenuId as varchar(50)) +',''C'','+ cast(@ConnectionId as varchar(50))+','+ cast(@ownerConnID as varchar(50)) +',''1'' ,'+ cast(@event_reg_id as varchar(50)) +')'

	--Print @strQuery 
	
	EXEC( @strQuery)
	SET @ContactActivityId = @@identity	
	END TRY 
	BEGIN CATCH     
		SELECT @ErrorMsg =Error_Message(),@ErSeverity = ERROR_SEVERITY(),@ErState = ERROR_STATE()
		INSERT INTO CaseNotErrorlog(TableName,contactid,CaseId,Connid,ConnectionId,Error,InsertDate,Query )
		      VALUES('ContactActivity',@ContactId,@CaseId,@Connid,@ConnectionId,@ErrorMsg,GETDATE(),@strQuery)
		RAISERROR(@ErrorMsg,@ErSeverity,@ErState)
		RETURN
    END CATCH
	--SET @ContactActivityId = @@identity
	
	
	SET @strQuery = 'INSERT INTO ' + @strDBName + '.dbo.ContactActivityContent (ContactActivityId ,ActContent)
	                                                                    Values (' + cast(@ContactActivityId as varchar(10)) + ','''+ @ActContent + ''')' 
	                                                                       
	--Print @strQuery 
	BEGIN TRY
	EXEC( @strQuery) 
	END TRY 
	BEGIN CATCH     
		SET @ErrorMsg =Error_Message()
		INSERT INTO CaseNotErrorlog(TableName,contactid,CaseId,Connid,ConnectionId,ContactActivityId,Error,InsertDate,Query  )
		VALUES('ContactActivityContent',@ContactId,@CaseId,@Connid,@ConnectionId,@ContactActivityId,@ErrorMsg,GETDATE(),@strQuery)
	 END CATCH  
	SELECT @ContactActivityId

	SET @strQuery = 'INSERT INTO ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes(Code,noteType,CreatedBy,CreatedDate,ContactActivityId)
					VALUES (' + cast(@SecureCaseNote_Code as varchar(50)) + ',''' +@Secure_Case_Note+ ''',(Select user_id from user_accounts where connid=' 
					+ cast(@CreatedByConnid as varchar(50))+ '),
					'''+ @DateCreated+''','+ cast(@ContactActivityId as varchar(50))+')
					
					INSERT INTO ' + @strDBName + '.dbo.lkpSecureCaseNoteSubTypes(Description,SecureNoteTypeID,ShowToAll,CreatedBy,CreatedDate,ContactActivityId)
					VALUES (''' +@Secure_Case_Note_Subtype+ ''',(select typeid from ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes where notetype='''
					+@Secure_Case_Note+'''),' + cast(@SecureNoteSubtype_ShowToAll as varchar(50)) 
					+ ',(Select user_id from user_accounts where connid=' 
					+ cast(@CreatedByConnid as varchar(50)) + '),''' + @DateCreated+ ''','+ cast(@ContactActivityId as varchar(50))+')'

	Print @strQuery  
	                                        
    BEGIN TRY
	EXEC( @strQuery) 
	END TRY 
	BEGIN CATCH     
		SET @ErrorMsg =Error_Message()
		print @ErrorMsg
	END CATCH 

END







