   
   
   UNION ALL

   SELECT distinct r.ConnId					
				  ,t.RelationshipSubTypeId	
				  ,s.RelationshipSubTypeText COLLATE DATABASE_DEFAULT as RelationshipSubTypeText		
				  ,r.ConnectionId as ConnectionId1 			
				  ,t.RelationshipTypeId as RelTypeid1				
				  ,t.RelationshipTypeText COLLATE DATABASE_DEFAULT as RelTypeText1  
				  ,t.Rec_RelationshipTypeId as RelTypeid2				
				  ,(select RelationshipTypeText COLLATE DATABASE_DEFAULT
					from Rel_lkp_RelationshipType 
					where RelationshipTypeId=t.Rec_RelationshipTypeId) as RelTypeText2			    
				  ,(select convert(varchar(10),r.createddate,110)) as RelStartDate1			
				  ,(select convert(varchar(10),r.RelEndDate,110)) as RelEndDate1 			    
  				  ,(select convert(varchar(10),r.createddate,110)) as RelStartDate2 			
  				  ,(select convert(varchar(10),r.RelEndDate,110)) as RelEndDate2			
  				  ,r.ConnId as IndConnId	
				  ,CASE 
  				   WHEN r.connid<=0
  				   THEN r.connid
  				   ELSE -(r.connid)
  				   END as rel_connid
				  ,'Pending' as [Status]			

   FROM Relations_FormSystem r
   INNER JOIN Relations_FormSystem f
   on r.connectionid=f.connectionid and r.connectionid<>0 and isnull(r.connectionid,'')<>''
   INNER JOIN Rel_lkp_RelationshipType t
   on r.RelationshipTypeId=t.RelationshipTypeId
   INNER JOIN Rel_lkp_RelationshipSubType s
   on t.RelationshipSubTypeId=s.RelationshipSubTypeId
   where f.contactid=abs(@ConnId1)