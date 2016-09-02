

--EXEC usp_Get_CasenoteData 164, 'Case Note *', 86400


ALTER PROCEDURE dbo.usp_Get_CasenoteData	 
      @cAccountkey INT
     ,@NoteType VARCHAR(200)
     ,@NoteId INT
AS
BEGIN
	DECLARE @strDBName VARCHAR(100)	
	DECLARE @strQuery VARCHAR(MAX)

	SELECT  DISTINCT
            @strDBName = '[' + [DBName] + ']'
	FROM
        [IrrisCentral].[dbo].[lutPrimaryAgency] LPA        
	WHERE
        LPA.SiteID = @cAccountkey

	IF @NoteType = 'E-Mail'
		BEGIN
		SET @strQuery  = 'SELECT DISTINCT 
								 1 as isdone, 
								 CL.Connid as ClientConnid,
								 '''' as FileTag, 
								 ''E-Mail'' as ActType, 
								 convert(varchar, LDate, 120) as THEDATE, 
								 1 as ACTPRIORITY, 
								 LDesc as SUBJECT, 
								 ContactLetterId as RECID,
								 FilePathName,
								 ' + @strDBName + '.dbo.udf_CoupleName(CL.StaffConnid, default, default, default, default, default) as STAFFNAME,
								 CL.StaffConnid as STAFFConnid,
								 CL.LetterTemplateTypeId as ACTTYPEID,
								 0 as INCIDENT,
								 0 as SAVDUR,
								 0 as ACTPRIORITY,
								 CL.ContactID,
								 0 as FILEUPLOADMISCFILEID,
								 ''U'' as FileFlag,
								 0 AS ConnectionID,
								 0 AS ownerConnID,
								 0 AS isSecure,
								 '''' AS casenoteContent
								 FROM ' + @strDBName + '.dbo.ContactLetter CL
								 WHERE CL.ContactLetterId  = '+ cast(@NoteId as varchar(50))+''		
		END
	ELSE IF @NoteType = 'Inquiry Note'
		BEGIN
			SET @strQuery = 'SELECT  DISTINCT 
									1 as isdone, 
									I.Connid as ClientConnid,
									'''' as FileTag, 
									''Inquiry Note'' as ActType, 
									 convert(varchar, InquiryDate, 120) as THEDATE, 
									1 as ACTPRIORITY, 
									''Inquiry Note'' as SUBJECT, 
									' + @strDBName + '.dbo.udf_ContactIDs(I.Connid,1) as RECID,
									'''' as FilePathName,
									' + @strDBName + '.dbo.udf_CoupleName(I.InqStaffConnid, default, default, default, default, default) as STAFFNAME,
									I.InqStaffConnid as STAFFConnid,
									I.InqTypeId as ACTTYPEID,
									0 as INCIDENT,
									0 as SAVDUR,
									0 as ACTPRIORITY,
									0 as ContactID,
									0 as FILEUPLOADMISCFILEID,
									''U'' as FileFlag,
									0 AS ConnectionID,
									0 AS ownerConnID,
									0 AS isSecure,
									'''' AS  casenoteContent
									from ' + @strDBName + '.dbo.Inquiry I
									left outer join ' + @strDBName + '.dbo.lkpInquiryType IT on I.InqTypeId = IT.InqTypeId
									WHERE (I.Connid  = '+ cast(@NoteId as varchar(50))+')'
		END
	ELSE IF @NoteType = 'Letter'
		BEGIN
			SET @strQuery ='SELECT  DISTINCT 
									 1 as isdone, 
									 CL.Connid as ClientConnid,
									 '''' as FileTag, 
									 ''Letter'' as ActType, 
									 convert(varchar, LDate, 120) as THEDATE, 
									 1 as ACTPRIORITY, 
									 LDesc as SUBJECT, 
									 ContactLetterId as RECID,
									 FilePathName,
									 ' + @strDBName + '.dbo.udf_CoupleName(CL.StaffConnid, default, default, default, default, default) as STAFFNAME,
									 CL.StaffConnid as STAFFConnid,
									 CL.LetterTemplateTypeId as ACTTYPEID,
									 0 as INCIDENT,
									 0 as SAVDUR,
									 0 as ACTPRIORITY,
									 CL.ContactID,
									 0 as FILEUPLOADMISCFILEID,
									 ''U'' as FileFlag,
									 0 AS ConnectionID,
									 0 AS ownerConnID,
									 0 AS isSecure,
									 ''''  as casenoteContent
									 FROM ' + @strDBName + '.dbo.ContactLetter CL
									 WHERE CL.ContactLetterId  = '+ cast(@NoteId as varchar(50))+''
	END
	ELSE
		BEGIN
			SET @strQuery = 'SELECT  DISTINCT 
									IsActComplet as isdone, 
									A.Connid as ClientConnid,
									fileupload_menu_Id as FileTag, 
									ActTypeText + '' *'' as ActType, 
									convert(varchar, ActDate, 120) as THEDATE, 
									ActPriority as ACTPRIORITY, 
									ActRe as SUBJECT, 
									A.ContactActivityId as RECID,
									FilePathName,
									' + @strDBName + '.dbo.udf_CoupleName(A.StaffConnid, default, default, default, default, default) as STAFFNAME,
									A.StaffConnid as STAFFConnid,
									AT.ActTypeId as ACTTYPEID,
									A.Incident AS INCIDENT,
									A.ActDuration AS SAVDUR,
									A.ActPriority AS ACTPRIORITY,
									A.ContactID,
									isNull(fileUploadMiscFileId,0) AS FILEUPLOADMISCFILEID,
									FileFlag AS FileFlag,
									A.ConnectionId AS ConnectionID,
									A.ownerConnID AS ownerConnID,
									AT.isSecure AS isSecure,
									CAC.ActContent as casenoteContent,
									CN.typeid as SecureNoteTypeId,
									CN.notetype as SecureNoteType,
									CNS.subtypeid as SecureNoteSubTypeId,
									CNS.description as SecureNoteSubType

									FROM ' + @strDBName + '.dbo.ContactActivity A
									LEFT OUTER JOIN ' + @strDBName + '.dbo.lkpActType AT on AT.ActTypeId = A.ActTypeId
								    LEFT OUTER JOIN ' + @strDBName + '.dbo.ContactActivityContent CAC ON A.ContactActivityId = CAC.ContactActivityId
									LEFT JOIN ' + @strDBName + '.dbo.lkpSecureCaseNoteTypes CN ON CN.typeid = A.SecureNoteTypeId
									LEFT JOIN ' + @strDBName + '.dbo.lkpSecureCaseNoteSubTypes CNS ON CNS.subtypeid = A.SecureNoteSubTypeId
									WHERE A.ContactActivityId = '+ cast(@NoteId as varchar(50))+''

		END
--PRINT @strQuery
EXEC (@strQuery)

END


