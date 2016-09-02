

--EXEC CaseNote_Details_new -102045,211, 100 ,0,NULL,352129,8125,'','DESC',1018
--EXEC CaseNote_Details_new 343293,211, 100 ,0,NULL,348168,8125,'','DESC',1018

--drop table #tempcasenotes
--drop table #CaseNote_Details

DECLARE @Connid VARCHAR(200)=343293
       ,@UserId INT=211
       ,@NoofRows INT=100
       ,@Start_id INT=0
       ,@filet_Value VARCHAR(MAX)=NULL
       ,@ConnectionId Int = 348168
       ,@loginUserId Int = 8125
       ,@order_Value VARCHAR(MAX) = ''
       ,@order_Type VARCHAR(MAX) = 'DESC'
	   ,@groupID Int = 1018


      DECLARE @strDBName VARCHAR(100)      
      DECLARE @StrQry1 VARCHAR(MAX) 
      DECLARE @StrQry2 VARCHAR(MAX) 
      DECLARE @StrQry3 VARCHAR(MAX),
      @StrQry4 VARCHAR(MAX),
      @Parent_ID VARCHAR(200),
      @Connids VARCHAR(200),
      @CoupleConnid VARCHAR(200),
      @Connid1 VARCHAR(200),
      @Connid2 VARCHAR(200),
      @ConnectionSql nvarchar(MAX),
      @ConnectionMSgSql nvarchar(MAX),
      @RunSql nvarchar(2000),
      @ParamDef  nvarchar(1000),
      @userType VARCHAR(200),
      @loginConnID VARCHAR(200)
          
      SELECT DISTINCT
            @userType = user_type,@loginConnID = IsNull(ConnId,0)
      FROM user_accounts WHERE user_id = @loginUserId
               
      SELECT  DISTINCT
            @strDBName = '[' + [DBName] + ']'
      FROM
            [IrrisCentral].[dbo].[lutPrimaryAgency] LPA
            JOIN dbo.user_agencies UAG
                  ON UAG.c_account_key = LPA.SiteID
      WHERE
            UAG.agency_id = @UserId
	  
	  DECLARE @caseActType as varchar(max)
	  DECLARE @sec_programID as int 
	  set @caseActType = 0	  
	  set @Runsql = 'SELECT @sec_programID = rlt.RelationshipSubTypeId
			FROM ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rlt
			LEFT JOIN ' + @strDBName + '.dbo.rel_relationship rl ON(rl.RelationshipTypeId = rlt.RelationshipTypeId)
			WHERE rl.ConnId >0 AND rl.connectionId = ' + Cast(@ConnectionId as Varchar(50)) + ' Group By rlt.RelationshipSubTypeId'
	  --print @Runsql
	  set @ParamDef = '@sec_programID varchar(100) output'
	  Exec sp_executesql @Runsql,@ParamDef,@sec_programID=@sec_programID output
	  --set @sec_programID = 15
      --print @sec_programID
	  IF @userType = 'agency_user'  
	        BEGIN	
			IF @groupID <> '0'
			BEGIN
				set @Runsql = 'select @caseActType= @caseActType +'','' + Cast(ActTypeId as Varchar(50)) from
		    								' + @strDBName + '.dbo.lkpActType
					WHERE isSecure = 0 or isSecure is NULL 
					or (isSecure =1  AND ((SELECT Cast(setting as Varchar(50)) FROM system_settings WHERE useroption = '''+Cast(@loginUserId as Varchar(50))+'_cw_casenote_security'') = ''yes'')
					AND ((SELECT isRead from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isUpdate from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50)) 
					AND sec_programID = '+Cast(@sec_programID as Varchar(50))+' AND sec_cwID =  '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isDelete from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50)) 
					AND sec_programID = '+Cast(@sec_programID as Varchar(50))+' AND sec_cwID =  '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID = '+Cast(@groupID as Varchar(50))+') = 1 OR
					(SELECT isRead from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1 OR
					(SELECT isUpdate from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1 OR
					(SELECT isDelete from securitysettings where sec_casenotetypeID = Cast(ActTypeId as Varchar(50))
					AND sec_programID = '+Cast(@sec_programID as Varchar(50)) +' AND sec_cwID = '+Cast(@loginUserId as Varchar(50))+'AND sec_groupID is NULL) = 1
					))'
				--print @Runsql
				set @ParamDef = '@caseActType varchar(max) output'
				Exec sp_executesql @Runsql,@ParamDef,@caseActType=@caseActType output
				--Exec (@Runsql)
			END			
			ELSE
	      		BEGIN
					set @Runsql = 'select @caseActType= @caseActType +'','' + Cast(ActTypeId as Varchar(50)) from
				  ' + @strDBName + '.dbo.lkpActType where issecure is NULL OR issecure = 0'

					set @ParamDef = '@caseActType varchar(max) output'
					Exec sp_executesql @Runsql,@ParamDef,@caseActType=@caseActType output	
				END
			END
	   ELSE
	      	BEGIN
	      	    set @Runsql = 'select @caseActType= @caseActType +'','' + Cast(ActTypeId as Varchar(50)) from
				  ' + @strDBName + '.dbo.lkpActType'

		    set @ParamDef = '@caseActType varchar(max) output'
		    Exec sp_executesql @Runsql,@ParamDef,@caseActType=@caseActType output	
	      	END
	  --PRINT @caseActType
            
		Set @ParamDef = '@CoupleConnid varchar(100) output'
		Set @Runsql = 'Select @CoupleConnid = ' + @strDBName + '.dbo.udf_CoupleConnectionID(' + @Connid + ')'

		Exec sp_executesql @Runsql,@ParamDef,@CoupleConnid=@CoupleConnid output

		Set @ParamDef = '@Connid1 varchar(100) output'
		Set @Runsql = 'Select @Connid1 = coalesce(' + @strDBName + '.dbo.udf_CoupleConnId(' + @Connid + ',0),0)'

		Exec sp_executesql @Runsql,@ParamDef,@Connid1=@Connid1 output

		Set @ParamDef = '@Connid2 varchar(100) output'
		Set @Runsql = 'Select @Connid2 = coalesce(' + @strDBName + '.dbo.udf_CoupleConnId(' + @Connid + ',2),0)'

		Exec sp_executesql @Runsql,@ParamDef,@Connid2=@Connid2 output

		Set @Connids = @Connid1 

		If @CoupleConnid <> '0' and @CoupleConnid <> ''
			Set @Connids = @Connids + ',' + @CoupleConnid
		If @Connid2 <> '0'
			Set @Connids = @Connids + ',' + @Connid2
				
		Set @Parent_ID = '0'

		Set @ParamDef = '@Parent_ID varchar(100) output'
		Set @Runsql = 'Select @Parent_ID = coalesce([User_Id],''0'')
					From user_accounts 
					WHERE Connid in (' + @Connids + ')'

		Exec sp_executesql @Runsql,@ParamDef,@Parent_ID=@Parent_ID output


		If @ConnectionId <> 0
		BEGIN
			Set @ConnectionSql    = ' and (ConnectionId = ' + Cast(@ConnectionId as Varchar(50)) + ' or ConnectionId is Null or ConnectionId = 0)'
			Set @ConnectionMSgSql = 'AND (ad.connectionId = '+ convert(VARCHAR(10), @ConnectionId) +' or ad.connectionId is Null or ad.connectionId = 0)'
		END
		Else
		BEGIN
			Set @ConnectionSql    = ''
			Set @ConnectionMSgSql = ''
		END
           
      CREATE TABLE #CaseNote_Details
            ( 
             Row_No INT IDENTITY(1, 1)
            ,Message_Type VARCHAR(20) NULL
            ,message_id VARCHAR(100) NULL
            ,subject_S VARCHAR(MAX) NULL
            ,receiver_status CHAR(4) NULL
            ,sender INT NULL
            ,dateposted VARCHAR(30) NULL
            ,receiver INT NULL
            ,message_M TEXT NULL
            ,dateposted_mmddyy VARCHAR(30) NULL
            ,dateposted_yyyymmddThh VARCHAR(30) NULL
            ,dateposted_yyyymmdd VARCHAR(30) NULL
            ,dateposted_yyyymmddhh VARCHAR(30) NULL
            ,upload_id INT NULL
            ,filename_N VARCHAR(800) NULL
            ,descriptions VARCHAR(800) NULL
            ,userId INT NULL
            ,Name VARCHAR(50) NULL
            ,last_name VARCHAR(50) NULL
            ,Doc_dateposted VARCHAR(30) NULL
            ,upload_module VARCHAR(800) NULL
            ,upload_phase INT NULL
            ,upload_stage INT NULL
            ,upload_task INT NULL
            ,group_name VARCHAR(100) NULL
            ,user_type VARCHAR(50) NULL
            ,editable VARCHAR(1) NULL
            ,group_id INT NULL
            ,filetag NCHAR(1000) NULL
            ,Doc_dateposted_mmddyy VARCHAR(30) NULL
     ,Doc_dateposted_ampm VARCHAR(30) NULL
			,Doc_Dateposted_yyyymmdd VARCHAR(30) NULL
            ,IsDone BIT NULL
            ,ClientConnid INT NULL
            ,ActType NVARCHAR(100) NULL
           -- ,thedate SMALLDATETIME NULL
		    ,thedate  DATETIME NULL
            ,priority NVARCHAR(10) NULL
            ,subject1 NVARCHAR(500) NULL -- Changed from 200
            ,RecId INT NULL
            ,FilePathName VARCHAR(800) NULL
            ,StaffName VARCHAR(255) NULL
            ,StaffConnid INT NULL
            ,ActTypeId INT NULL
            ,Incident BIT NULL
            ,ActDuration INT NULL
            ,ActPriority NVARCHAR(10) NULL
            ,ContactID INT NULL
            ,fileupload_menu_Id INT NULL
            ,fileUploadMiscFileId BIGINT NULL 
	    ,ConnectionId BIGINT NULL
	    ,ownerConnID BIGINT NULL
	    ,Act_subject VARCHAR(MAX) NULL
	    ,received_date datetime NULL)


	SET @StrQry1 = ''
	If @Parent_ID <> '0'
		Begin	                              
			SET @StrQry1 = ' 
					
					 UNION ALL
							
			  SELECT
				  ''MsgArchInbox'' AS Type,Cast(m.Msg_Id as varchar(50)) as message_id ,m.msg_subject AS subject,ad.receiver_status,m.fromId 
				  ,m.Msg_DateTime AS messageDateTime,ad.receiver_userid,m.Msg_Body AS messagebody
				  ,convert(VARCHAR, m.Msg_DateTime, 110) dateposted_mmddyy
				  ,convert(VARCHAR, m.Msg_DateTime, 126) dateposted_yyyymmddThh
				  ,convert(VARCHAR, m.Msg_DateTime, 121) dateposted_yyyymmdd
				  ,convert(VARCHAR(20), m.Msg_DateTime, 120) dateposted_yyyymmddhh
				  ,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted
				  ,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage,NULL AS upload_task,NULL AS group_name,NULL AS user_type
				  ,NULL AS editable,NULL AS group_id,NULL AS filetag,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
				  ,NULL AS IsDone,NULL AS ClientConnid,''Archive Inbox'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
				  ,NULL AS FilePathName
				  ,' + @strDBName + '.dbo.udf_CoupleName((select connID from user_accounts where user_id = m.fromId), DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
				  ,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
				  ,3 AS ActPriority,NULL AS ContactID
				  ,NULL AS fileupload_menu_Id
				  ,NULL AS fileUploadMiscFileId
				  ,coalesce(ad.connectionId,0) as ConnectionId
				  ,NULL AS ownerConnID
				  ,m.msg_subject as Act_subject
				  ,convert(VARCHAR, m.Msg_DateTime, 121) as received_date
			  from dbo.MapMsg_addresses ad 
			  LEFT JOIN dbo.MapMsg_archive_message_addresses ma ON(ma.addressID = ad.addressID) 
			  LEFT JOIN dbo.MapMsg_archive_messages m ON(m.Msg_Id = ma.Msg_Id) 
			 WHERE 
			  ((ISNULL(ad.receiver_archive,0) =1) and ((ad.receiver_connID = '+ convert(VARCHAR(10), @Connid) +' OR ad.receiver_userId = '+ convert(VARCHAR(10), @Parent_ID)  +') 
			  ' +@ConnectionMSgSql + ')AND m.Msg_Id is not null )

				
			UNION ALL
							
			  SELECT
				  ''MsgArchSentItems'' AS Type,Cast(m.Msg_Id as varchar(50)) as message_id ,m.msg_subject AS subject,ad.receiver_status,m.fromId 
				  ,m.Msg_DateTime AS messageDateTime,ad.receiver_userid,m.Msg_Body AS messagebody
				  ,convert(VARCHAR, m.Msg_DateTime, 110) dateposted_mmddyy
				  ,convert(VARCHAR, m.Msg_DateTime, 126) dateposted_yyyymmddThh
				  ,convert(VARCHAR, m.Msg_DateTime, 121) dateposted_yyyymmdd
				  ,convert(VARCHAR(20), m.Msg_DateTime, 120) dateposted_yyyymmddhh
				  ,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted
				  ,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage,NULL AS upload_task,NULL AS group_name,NULL AS user_type
				  ,NULL AS editable,NULL AS group_id,NULL AS filetag,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
				  ,NULL AS IsDone,NULL AS ClientConnid,''Archive Sent Items'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
				  ,NULL AS FilePathName
				  ,' + @strDBName + '.dbo.udf_CoupleName((select connID from user_accounts where user_id = m.fromId), DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
				  ,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
				  ,3 AS ActPriority,NULL AS ContactID
				  ,NULL AS fileupload_menu_Id
				  ,NULL AS fileUploadMiscFileId
				  ,coalesce(ad.connectionId,0) as ConnectionId
				  ,NULL AS ownerConnID
				  ,m.msg_subject as Act_subject
				  ,convert(VARCHAR, m.Msg_DateTime, 121) as received_date
			  from dbo.MapMsg_addresses ad 
			  LEFT JOIN dbo.MapMsg_archive_message_addresses ma ON(ma.addressID = ad.addressID) 
			  LEFT JOIN dbo.MapMsg_archive_messages m ON(m.Msg_Id = ma.Msg_Id) 
			 WHERE 
			  ((( ISNULL(ad.sender_archive,0) =1)  ' +@ConnectionMSgSql + ' AND m.fromId = '+ convert(VARCHAR(10), @Parent_ID) +')AND m.Msg_Id is not null )							
              
              UNION ALL
							
			  SELECT
				  ''MsgInbox'' AS Type,Cast(m.Msg_Id as varchar(50)) as message_id ,m.msg_subject AS subject,ad.receiver_status,m.fromId 
				  ,m.Msg_DateTime AS messageDateTime,ad.receiver_userid,m.Msg_Body AS messagebody
				  ,convert(VARCHAR, m.Msg_DateTime, 110) dateposted_mmddyy
				  ,convert(VARCHAR, m.Msg_DateTime, 126) dateposted_yyyymmddThh
				  ,convert(VARCHAR, m.Msg_DateTime, 121) dateposted_yyyymmdd
				  ,convert(VARCHAR(20), m.Msg_DateTime, 120) dateposted_yyyymmddhh
				  ,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted
				  ,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage,NULL AS upload_task,NULL AS group_name,NULL AS user_type
				  ,NULL AS editable,NULL AS group_id,NULL AS filetag,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
				  ,NULL AS IsDone,NULL AS ClientConnid,''Message Inbox'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
				  ,NULL AS FilePathName
				  ,' + @strDBName + '.dbo.udf_CoupleName((select connID from user_accounts where user_id = m.fromId), DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
				  ,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
				  ,3 AS ActPriority,NULL AS ContactID
				  ,NULL AS fileupload_menu_Id
				  ,NULL AS fileUploadMiscFileId
				  ,coalesce(ad.connectionId,0) as ConnectionId
				  ,NULL AS ownerConnID
				  ,m.msg_subject as Act_subject
				  ,convert(VARCHAR, m.Msg_DateTime, 121) as received_date
			  from dbo.MapMsg_addresses ad 
			  LEFT JOIN dbo.MapMsg_message_addresses ma ON(ma.addressID = ad.addressID) 
			  LEFT JOIN dbo.MapMsg_messages m ON(m.Msg_Id = ma.Msg_Id) 
			  WHERE 
			  (( ISNULL(ad.receiver_archive,0) !=1  )and ((ad.receiver_connID = '+ convert(VARCHAR(10), @Connid) +' OR ad.receiver_userId = '+ convert(VARCHAR(10), @Parent_ID) +')
			  ' +@ConnectionMSgSql + ')  AND m.Msg_Id is not null )
			  
			  UNION ALL
			  SELECT
				  ''MsgSentItems'' AS Type,Cast(m.Msg_Id as varchar(50)) as message_id ,m.msg_subject AS subject,ad.receiver_status,m.fromId 
				  ,m.Msg_DateTime AS messageDateTime,ad.receiver_userid,m.Msg_Body AS messagebody
				  ,convert(VARCHAR, m.Msg_DateTime, 110) dateposted_mmddyy
				  ,convert(VARCHAR, m.Msg_DateTime, 126) dateposted_yyyymmddThh
				  ,convert(VARCHAR, m.Msg_DateTime, 121) dateposted_yyyymmdd
				  ,convert(VARCHAR(20), m.Msg_DateTime, 120) dateposted_yyyymmddhh
				  ,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted
				  ,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage,NULL AS upload_task,NULL AS group_name,NULL AS user_type
				  ,NULL AS editable,NULL AS group_id,NULL AS filetag,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
				  ,NULL AS IsDone,NULL AS ClientConnid,''Message Sent Items'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
				  ,NULL AS FilePathName
				  ,' + @strDBName + '.dbo.udf_CoupleName((select connID from user_accounts where user_id = m.fromId), DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
				  ,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
				  ,3 AS ActPriority,NULL AS ContactID
				  ,NULL AS fileupload_menu_Id
				  ,NULL AS fileUploadMiscFileId
				  ,coalesce(ad.connectionId,0) as ConnectionId
				  ,NULL AS ownerConnID
				  ,m.msg_subject as Act_subject
				  ,convert(VARCHAR, m.Msg_DateTime, 121) as received_date
			  from dbo.MapMsg_addresses ad 
			  LEFT JOIN dbo.MapMsg_message_addresses ma ON(ma.addressID = ad.addressID) 
			  LEFT JOIN dbo.MapMsg_messages m ON(m.Msg_Id = ma.Msg_Id) 
			  WHERE 
			  ((( ISNULL(ad.sender_archive,0)!=1 )  ' +@ConnectionMSgSql + ' AND m.fromId = '+ convert(VARCHAR(10), @Parent_ID )+')  AND m.Msg_Id is not null )
			  

						  UNION ALL
                          SELECT
                              ''Document'' AS Type,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender
                             ,NULL AS dateposted,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh
                             ,NULL AS dateposted_yyyymmdd,NULL AS dateposted_yyyymmddhh
                             ,up.upload_id,up.file_name,up.description,up.user_id,ua.first_name + '' '' + ua.last_name AS Name
							  ,ua.last_name,convert(VARCHAR(20), up.dateposted, 121) AS Doc_dateposted,up.upload_module,up.upload_phase
                             ,up.upload_stage,up.upload_task,ug.group_name,ua.user_type,up.editable,up.group_id,up.filetag
                             ,convert(VARCHAR, up.dateposted, 110) Doc_dateposted_mmddyy
                             ,convert(VARCHAR(20), up.dateposted, 120) AS Doc_dateposted_ampm
                             ,convert(VARCHAR, up.dateposted, 121) Doc_Dateposted_yyyymmdd
                             ,NULL AS IsDone,NULL AS ClientConnid,''Document *'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
                             ,NULL AS FilePathName,ua.first_name + '' '' + ua.last_name AS StaffName,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
                             ,3 AS ActPriority,NULL AS ContactID,NULL AS fileupload_menu_Id,NULL AS fileUploadMiscFileId
                             ,coalesce(ConnectionId,0) as ConnectionId
                             ,NULL AS ownerConnID
                             ,up.description as Act_subject
                             ,convert(VARCHAR, up.dateposted, 100) as received_date
                          FROM dbo.upload up
                              JOIN dbo.user_accounts ua
                                    ON up.uploaded_by = ua.user_id
                              LEFT JOIN dbo.user_groups ug
                                    ON ( ug.group_id = up.group_id )
                          WHERE (up.donotShowCasenote is Null OR up.donotShowCasenote = 0) AND ((up.uploaded_by = ' + convert(VARCHAR(10), @Parent_ID) + '
                              OR up.user_id = ' + convert(VARCHAR(10), @Parent_ID)+') ' +@ConnectionSql + ')
                          UNION ALL
                          SELECT
                              ''Reference'' AS Type,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender
                             ,NULL AS dateposted,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh
                             ,NULL AS dateposted_yyyymmdd,NULL AS dateposted_yyyymmddhh
,up.upload_id,up.file_name,up.description,up.user_id,ua.first_name + '' '' + ua.last_name AS Name
          ,ua.last_name,convert(VARCHAR(20), up.dateposted, 121) AS Doc_dateposted
                             ,up.upload_module,up.upload_phase,up.upload_stage,up.upload_task,ug.group_name
                             ,ua.user_type,up.editable,up.group_id,up.filetag
                             ,convert(VARCHAR, up.dateposted, 110) Doc_dateposted_mmddyy
                             ,convert(VARCHAR, up.dateposted, 100) Doc_dateposted_ampm
                             ,convert(VARCHAR, up.dateposted, 121) Doc_Dateposted_yyyymmdd
                             ,NULL AS IsDone,NULL AS ClientConnid,''Reference *'' AS ActType,NULL AS thedate,NULL AS priority,NULL AS subject1,NULL AS RecId
                             ,NULL AS FilePathName,ua.first_name + '' '' + ua.last_name AS StaffName,NULL AS StaffConnid,NULL AS ActTypeId,0 AS Incident,NULL AS ActDuration
                             ,3 AS ActPriority,NULL AS ContactID,NULL AS fileupload_menu_Id,NULL AS fileUploadMiscFileId
                             ,coalesce(ConnectionId,0) as ConnectionId
                             ,NULL AS ownerConnID
                             ,up.description as Act_subject
                             ,convert(VARCHAR, up.dateposted, 100) as received_date
                         FROM upload up
                              JOIN user_accounts ua
                                    ON ( up.reference_parentid = ua.user_id )
                              LEFT JOIN user_groups ug
                                    ON ( ug.group_id = up.group_id )
                         WHERE up.reference_parentid = ' + convert(VARCHAR(10), @Parent_ID) +  ' ' +@ConnectionSql + ' ) All_Details '
            
		End
		 print isnull(@StrQry1,'@@@')
      SET @StrQry2 = ' INSERT INTO #CaseNote_Details
                  SELECT All_Details.*
                  FROM
                        (
                        SELECT DISTINCT
                              ''casenote'' AS TYPE,
	Cast(NULL as varchar(50)) AS message_id,
	NULL AS subject,
	NULL AS receiver_status,
	NULL AS sender,NULL AS dateposted
                             ,NULL AS receiver,
	NULL AS message,NULL AS dateposted_mmddyy,
	NULL AS dateposted_yyyymmddThh,NULL AS dateposted_yyyymmdd
                             ,NULL AS dateposted_yyyymmddhh,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id
                             ,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage
                             ,NULL AS upload_task,NULL AS group_name,NULL AS user_type,NULL AS editable,NULL AS group_id,(SELECT title FROM dbo.fileupload_menu WHERE id = fileupload_menu_Id) AS filetag
                             ,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
                             ,IsActComplet AS IsDone,A.Connid AS ClientConnid,ActTypeText + '' * '' AS ActType,ActDate AS thedate
                             ,ActPriority AS priority,ActRe AS subject1,ContactActivityId AS RecId,FilePathName
                             ,CASE ISNULL(A.FormId,0) WHEN 0 THEN' + @strDBName + '.dbo.udf_CoupleName(A.StaffConnid, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) ELSE ''Auto Generated'' END AS StaffName
				
                             ,A.StaffConnid AS StaffConnid,AT.ActTypeId AS ActTypeId,A.Incident,A.ActDuration,A.ActPriority
                             ,A.ContactID,fileupload_menu_Id,isnull(fileUploadMiscFileId, 0) AS fileUploadMiscFileId
                              ,coalesce(ConnectionId,0) as ConnectionId
                              ,coalesce(ownerConnID,0) AS ownerConnID
                              ,ActRe as Act_subject
                              ,ActDate as received_date
           FROM ' + @strDBName + '.dbo.ContactActivity A
    LEFT OUTER JOIN ' + @strDBName + '.dbo.lkpActType AT
         ON AT.ActTypeId = A.ActTypeId
  WHERE ((A.Connid in (' + @Connids + ')) 
							AND (A.ActTypeId in (' + @caseActType + ') OR (A.ownerConnID = ' + @loginConnID + ')) ' + @ConnectionSql + '
							)AND(A.isDelete =0 OR A.isDelete is NULL)
                          UNION ALL
                          SELECT 	DISTINCT
                              ''casenote'' AS TYPE,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender,NULL AS dateposted
                             ,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh,NULL AS dateposted_yyyymmdd
                             ,NULL AS dateposted_yyyymmddhh,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id
                             ,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage
                             ,NULL AS upload_task,NULL AS group_name,NULL AS user_type,NULL AS editable,NULL AS group_id,NULL AS filetag
                             ,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
                             ,''1'' AS IsDone,I.Connid AS ClientConnid,''Inquiry Note'' AS ActType,InquiryDate AS thedate
                             ,''1'' AS priority,''Inquiry Note'' AS subject1,I.Connid AS RecId
                             ,'''' AS FilePathName,' + @strDBName + '.dbo.udf_CoupleName(I.InqStaffConnid, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
                             ,I.InqStaffConnid AS StaffConnid,I.InqTypeId AS ActTypeId,0 AS Incident,0 AS ActDuration,0 AS ActPriority
   ,0 AS ContactID,0 AS fileupload_menu_Id,0 AS fileUploadMiscFileId
               ,0 as ConnectionId
                             ,NULL AS ownerConnID
                             ,''Inquiry Note'' as Act_subject
                             ,InquiryDate as received_date
                          FROM
                              ' + @strDBName + '.dbo.Inquiry I
                              LEFT OUTER JOIN ' + @strDBName + '.dbo.lkpInquiryType IT
                                    ON I.InqTypeId = IT.InqTypeId
                          WHERE
                              (I.isDelete =0 OR I.isDelete is NULL) AND I.Connid in (' + @Connids + ')' 
  --         Print @StrQry2                 
                             
      SET @strQry3 = ' UNION ALL
                          SELECT DISTINCT
                              ''casenote'' AS TYPE,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender,NULL AS dateposted
                             ,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh,NULL AS dateposted_yyyymmdd
                             ,NULL AS dateposted_yyyymmddhh,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id
                             ,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage
                             ,NULL AS upload_task,NULL AS group_name,NULL AS user_type,NULL AS editable,NULL AS group_id,NULL AS filetag
                             ,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
                             ,''1'' AS IsDone,CL.Connid AS ClientConnid,''E-Mail'' AS ActType,LDate AS thedate,''1'' AS priority
                             ,LDesc AS subject1,ContactLetterId AS RecId,FilePathName,' + @strDBName + '.dbo.udf_CoupleName(CL.StaffConnid, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
                             ,CL.StaffConnid AS StaffConnid,CL.LetterTemplateTypeId AS ActTypeId,0 AS Incident,0 AS ActDuration,0 AS ActPriority,CL.ContactID
                      ,0 AS fileupload_menu_Id,0 AS fileUploadMiscFileId
,0 as ConnectionId
  ,NULL AS ownerConnID
             ,LDesc as Act_subject
                             ,LDate as received_date
                          FROM
                              ' + @strDBName + '.dbo.ContactLetter CL
                          WHERE
                              (CL.isDelete =0 OR CL.isDelete is NULL) AND CL.Connid in (' + @Connids + ')
                              AND CL.LetterTemplateTypeId = 2
                          UNION ALL
                          SELECT DISTINCT
                              ''casenote'' AS TYPE,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender,NULL AS dateposted
                             ,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh,NULL AS dateposted_yyyymmdd
                             ,NULL AS dateposted_yyyymmddhh,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id
                             ,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage
                             ,NULL AS upload_task,NULL AS group_name,NULL AS user_type,NULL AS editable,NULL AS group_id,NULL AS filetag
                             ,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
                             ,''1'' AS IsDone,CL.Connid AS ClientConnid
                             ,''Letter'' AS ActType
                             ,LDate AS thedate
                             ,''1'' AS priority
                             ,LDesc AS subject1
             ,ContactLetterId AS RecId
,FilePathName
                             ,' + @strDBName + '.dbo.udf_CoupleName(CL.StaffConnid, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT) AS StaffName
                             ,CL.StaffConnid AS StaffConnid
                             ,CL.LetterTemplateTypeId AS ActTypeId
                             ,0 AS Incident
                             ,0 AS ActDuration
                             ,0 AS ActPriority
                             ,CL.ContactID
                             ,0 AS fileupload_menu_Id
                             ,0 AS fileUploadMiscFileId
                             ,0 AS ConnectionId
                             ,NULL AS ownerConnID
                             ,LDesc as Act_subject
                             ,LDate as received_date
                          FROM ' + @strDBName + '.dbo.ContactLetter CL
                          WHERE (CL.isDelete =0 OR CL.isDelete is NULL) AND CL.Connid in (' + @Connids + ')
                              AND CL.LetterTemplateTypeId = 1
                        UNION ALL
                          SELECT DISTINCT
                              ''casenote'' AS TYPE,Cast(NULL as varchar(50)) AS message_id,NULL AS subject,NULL AS receiver_status,NULL AS sender,NULL AS dateposted
                             ,NULL AS receiver,NULL AS message,NULL AS dateposted_mmddyy,NULL AS dateposted_yyyymmddThh,NULL AS dateposted_yyyymmdd
                             ,NULL AS dateposted_yyyymmddhh,NULL AS upload_id,NULL AS file_name,NULL AS description,NULL AS user_id
                             ,NULL AS Name,NULL AS last_name,NULL AS Doc_dateposted,NULL AS upload_module,NULL AS upload_phase,NULL AS upload_stage
                             ,NULL AS upload_task,NULL AS group_name,NULL AS user_type,NULL AS editable,NULL AS group_id,NULL AS filetag
                             ,NULL AS Doc_dateposted_mmddyy,NULL AS Doc_dateposted_ampm,NULL AS Doc_Dateposted_yyyymmdd
                             ,''1'' AS IsDone,CL.Connid AS ClientConnid,''Archive Misc File'' AS ActType,MiscFileDate AS thedate,''1'' AS priority
                             ,MiscFileDisplayName + '' / '' + MiscFileTypeText AS subject1,MiscFileId AS RecId
                     ,coalesce(MiscfileDirectory, ''Home'') + ''/'' + coalesce(MiscFileName, '''') + ''</br> File Type = '' + coalesce(MiscFileTypeText, '''')  + coalesce(MiscFileShow, '''') AS FilePathName
                             ,''N/A'' AS StaffName
                             ,0 AS StaffConnid,0 AS ActTypeId,0 AS Incident,0 AS ActDuration,0 AS ActPriority,CL.ContactID,0 AS fileupload_menu_Id,MiscFileId AS fileUploadMiscFileId
                             ,0 AS ConnectionId
                             ,NULL AS ownerConnID
                             ,MiscFileName + '' / '' + MiscFileTypeText as Act_subject
                             ,MiscFileDate as received_date
                          FROM ' + @strDBName + '.dbo.MiscFile CL
                              INNER JOIN ' + @strDBName + '.dbo.lkpMiscFileType MT
                                    ON CL.MiscFileTypeId = MT.MiscFileTypeId
                          WHERE CL.Connid in (' + @Connids + ')
                              AND CL.MiscFileTypeId > 0'
				Set @StrQry4 = '
								Union All
									SELECT DISTINCT
										''casenote'' AS TYPE,
										Cast(NULL as varchar(50)) AS message_id,
										NULL AS subject,
										NULL AS receiver_status,
										NULL AS sender,
										NULL AS dateposted
										,NULL AS receiver,
										NULL AS message,
										NULL AS dateposted_mmddyy,
										NULL AS dateposted_yyyymmddThh,
										NULL AS dateposted_yyyymmdd
										,NULL AS dateposted_yyyymmddhh,
										NULL AS upload_id,
										NULL AS file_name,
										NULL AS description,
										NULL AS user_id
										,NULL AS Name,
										NULL AS last_name,
										NULL AS Doc_dateposted,
										NULL AS upload_module,
										NULL AS upload_phase,
										NULL AS upload_stage
										,NULL AS upload_task,
										NULL AS group_name,
										NULL AS user_type,
										NULL AS editable,
										NULL AS group_id,
										null AS filetag
										,NULL AS Doc_dateposted_mmddyy,
										NULL AS Doc_dateposted_ampm,
										NULL AS Doc_Dateposted_yyyymmdd
										,''1'' AS IsDone,
										A.Connid AS ClientConnid,
										''AIRS Case Note'' AS ActType,
										TListDate AS thedate,
										''1'' AS priority
										,Cast(cc.CaseId as Varchar(50)) + '' ('' + rtrim(cc.AgencyCaseNumber) + '') Case Note'' AS subject1,
										cc.CaseId AS RecId
										,'''' AS FilePathName
										,''N/A'' AS StaffName
										,0 AS StaffConnid,0 AS ActTypeId,0 AS Incident,0 AS ActDuration,0 AS ActPriority,
										0,0 AS fileupload_menu_Id,
										0 AS fileUploadMiscFileId
										,0 AS ConnectionId
										,NULL AS ownerConnID
										,Cast(cc.CaseId as Varchar(50)) + '' ('' + rtrim(cc.AgencyCaseNumber) + '') Case Note'' as Act_subject
										,TListDate as received_date 
									FROM ' + @strDBName + '.dbo.contactcase cc
										join ' + @strDBName + '.dbo.ContactActivity A on cc.caseid = A.caseid
								  WHERE (A.Connid in (' + @Connids + ')) 
										and (CaseNotes not like '''' 
											and CaseNotes is not null)'  
											
											
           Print @StrQry4 
          --Print @StrQry3
			 Print @StrQry2 
                
  IF @StrQry1 =''
	set @StrQry3 = @StrQry3 +' ) All_Details '
                           
IF @filet_Value IS NOT NULL
BEGIN
	SET @StrQry1  = @StrQry1 + ' WHERE ' + @filet_Value;
END
DECLARE @StrQry_main VARCHAR(MAX) 
DECLARE @order_Val VARCHAR(MAX) 
	
set @StrQry_main  = @StrQry2 + @StrQry4 + @StrQry3 + @StrQry1
	
IF @order_Value <> '' and @order_Value IS NOT NULL
	BEGIN	
		IF @order_Value = 'subject_S'
		BEGIN
			SET @order_Val  = ' Act_subject '+@order_Type
		END
		ELSE IF @order_Value = 'StaffName'
		BEGIN
			SET @order_Val  = ' StaffName '+@order_Type
		END
		ELSE IF @order_Value = 'receivedDate'
		BEGIN
			SET @order_Val  = ' received_date '+@order_Type
		END
		SET @StrQry_main  = @StrQry_main + ' order by ' + @order_Val;
	END
ELSE
	BEGIN
		BEGIN
			SET @order_Val = ' received_date desc'
		END
		SET @StrQry_main  = @StrQry_main + ' order by ' + @order_Val;
	END
      --print @StrQry2 + @StrQry3 + @StrQry1   
 
 print 'vr---' + @StrQry_main   
 

 create table #tempcasenotes(query varchar(max))

 insert into #tempcasenotes(query)
 select @StrQry_main

--EXEC (@StrQry_main)
