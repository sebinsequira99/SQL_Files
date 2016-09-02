
mapssrs

USP_RptFastFactData_temp 211,8125,-25

ALTER PROC USP_RptFastFactData_temp
   @CAccountKey		INT=0 
  ,@UserId			INT=0
  ,@ReportId		INT=0
  ,@FilterCondition VARCHAR(MAX)=NULL

  AS      
BEGIN

	DECLARE @strDBName varchar(20),
		@RunSql Nvarchar(MAX)
			
							
   SELECT  DISTINCT @strDBName= '['+[DBName]+']'         
   FROM [IrrisCentral].[dbo].[lutPrimaryAgency]         
   WHERE SiteID=Cast(@CAccountKey AS varchar(20))

   /*********************Logtable entry for checking parameters*************************/
	INSERT INTO Reportlog (	 AgencyID 
						,Reportid 
						,Userid 
						,FilterCondition 
						,Createddate)
						SELECT @CAccountKey,@ReportId,@UserId,@FilterCondition,GETDATE()



SET @RunSql ='SELECT   
				-- LTRIM(RTRIM(REPLACE(REPLACE(' +@strDBName +' .dbo.udf_CoupleName((fd.Connid),1,0,''Unknown'',0,0),''&amp;'',''&''),''amp;'',''&''))) as Name
				 fd.Name
			   , ca.Address1
			   , ca.Address2
			   , ca.City
			   , s.StateAbbreviation
			   , ca.Zip
			   , ce.ContactEmail
			   , rst.RelationshipSubTypeText AS Program
			   , rt.RelationshipTypeText AS Role
			   , coalesce(fc.FieldName,ct.CIListTemplateName, rc.Rel_CustomTemplateLabel) TemplateName
			   , coalesce(fc.caption,cti.CIListTemplateItemName,''date'') TemplateFieldName
			   , fd.fielddata
			   , fd.id
			   , fd.Applicant
			   , fd.Seq
				-- fd.Name
				--,fd.Program
				--,fd.Role
				--,fd.TemplateName
				--,fd.TemplateFieldName
				--,fd.fielddata
				--,fd.id
       FROM
         ' +@strDBName +' . dbo.Stgfastfactdata fd
	   INNER JOIN ' +@strDBName +' . dbo.Rel_relationship r WITH(NOLOCK) 
			ON r.Connectionid = fd.Connectionid 
			AND fd.user_id =r.user_id
		INNER JOIN ' +@strDBName +' . dbo.Rel_lkp_RelationshipType rt   WITH (NOLOCK)
			ON r.RelationshipTypeId = rt.RelationshipTypeId 
		INNER JOIN ' +@strDBName +' . dbo.Rel_lkp_RelationshipSubType rst WITH (NOLOCK)
			ON rt.RelationshipSubTypeId = rst.RelationshipSubTypeId  
			AND ISNULL(rst.Rel_SubType_isProgram,0) = 1
        LEFT JOIN ' +@strDBName +' . dbo.CIListTemplate ct 
			ON ct.CIListTemplateId = fd.Rel_CustomTemplateId and ct.CIListTemplateId<0 and  (not exists (select 1 from ' +@strDBName +' . dbo.fastfactsconfiguration where Fieldid = fd.Rel_CustomTemplateId))
        left JOIN ' +@strDBName +' . dbo.fastfactsconfiguration fc 
			ON fd.fieldname = fc.DataField and  fd.Rel_CustomTemplateId = fc.fieldid and fd.Rel_CustomTemplateId <0
        left JOIN ' +@strDBName +' . dbo.CIListTemplateItem cti 
			ON cti.CIListTemplateItemId =  fc.ItemId 
		Left Join ' +@strDBName +' . dbo.[Rel_CustomTemplates] rc
		  ON  rc.Rel_CustomTemplateId = fd.Rel_CustomTemplateId 
		left JOIN ' + @strDBName + '.dbo.ContactEMail ce 
		  ON r.ContactId = ce.ContactId and PrimaryEmail = ''1''
		left JOIN ' + @strDBName + '.dbo.ContactAddress ca 
		  ON r.ContactId = ca.ContactId and MailingAddress = ''1''
		left JOIN ' + @strDBName + '.dbo.lkpState s on ca.StateId = s.StateId

   WHERE   fd.fielddata !='' '' AND '  +ISNULL(@FilterCondition,' 1=1') 

   PRINT (@RunSql)
	
	/*****insert filtered records into temp table**************/ 
	CREATE TABLE #StgFactfactdata
				(	 Name			    VARCHAR(MAX)
					,Address1			VARCHAR(200)
					,Address2			VARCHAR(200)
					,City				VARCHAR(200)
					,StateName			VARCHAR(200)
					,Zip				VARCHAR(200)
					,Email				VARCHAR(MAX)
					,Program		    VARCHAR(MAX)
					,Role			    VARCHAR(MAX)
					,TemplateName	    VARCHAR(MAX)
					,TemplateFieldName	VARCHAR(MAX)
					,DieldData			VARCHAR(MAX)
					,id					int
					,Applicant			VARCHAR(MAX)
					,Seq				int 
				)


	INSERT INTO #StgFactfactdata
	EXEC (@RunSql)


	SELECT  
			  Name	
			 ,Address1	
			 ,Address2	
			 ,City		
			 ,StateName	
			 ,Zip		
			 ,Email		
			 ,Applicant			    
			 ,Program		    
			 ,Role			    
			 ,TemplateName	    
			 ,TemplateFieldName	
			 ,DieldData	
			 ,Id
			 ,Seq	
	FROM #StgFactfactdata WITH(nolock)
	ORDER BY Name

END 

