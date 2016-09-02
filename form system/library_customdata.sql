
--CheckBox num
--Date
--GUID Field text
--Hidden Field text
--Lookup Table num text
--Memo text
--Number num
--Password text 
--Pull Down num text
--Text
--Yes/No

use mapform

TRUNCATE TABLE library_customdata

DROP TABLE #cilistcontacts;

GO
DECLARE @start_row int
DECLARE @end_row int
DECLARE @contactid int
DECLARE @contactid2 int
DECLARE @UserID int
DECLARE @ConnID int
DECLARE @ConnectionID int

SELECT DISTINCT contactid INTO #cilistcontacts FROM cilist 

SELECT @start_row =MIN(contactid) FROM #cilistcontacts 

SELECT @end_row= MAX(contactid) FROM #cilistcontacts 

--Declare @I As Int =1
--Declare @J As Int = 2		
WHILE (@start_row <= @end_row) --(@I <= @J)--
BEGIN  
		Select @contactid =null, @contactid2 =null, @UserID =null

		SET @contactid = @start_row 
		print @contactid

		SELECT @contactid2 = contactid2 
		FROM rel_relationship 
		WHERE contactid=@contactid and relationshiptypeid=-101

		IF(isnull(@contactid2,0)=0)
		SELECT @contactid2 = contactid 
		FROM rel_relationship 
		WHERE contactid2=@contactid and relationshiptypeid=-101

		SELECT Top 1 @UserID =  user_id,@ConnID = connid,@ConnectionId=ConnectionId  
		FROM rel_relationship 
		WHERE (contactid=@contactid or contactid2=@contactid) And [relationshiptypeid] in (-101,-5001)

		IF(isnull(@UserID,0)=0)
		SELECT Top 1 @UserID =  user_id,@ConnID = connid,@ConnectionId=ConnectionId  
		FROM rel_relationship 
		WHERE (contactid=@contactid or contactid2=@contactid)

		INSERT INTO library_customdata
		(
		 user_id
		,contactid
		,connectionid
		,connid
		,scope
		,data_xml
		,created_by
		,created_at
		)
		SELECT @UserID As UserID
			  ,@contactid As contactid
			  ,@ConnectionId
			  ,@connid
			  ,1
			  ,(													
			   SELECT cast('<' +
			    replace(
			    replace(
			    replace(
			    replace(
				replace(
			    replace(
			    replace(
				replace(
			    replace(
			    replace( 
			   (replace(
			   (replace
			   (replace(ct.CIListTemplateItemName,' ','_')
			   ,'?','.')
			   ),'/','_')
			   ) ,':','.')
			   ,'1st','First')
			   ,'(','.')
			   ,')','.')
			   ,',','.')
			   ,'''','.')
			   ,'"','.')
			   ,'&','.')
			   ,'2nd','Second')
			   ,'+','.')
			   + '>' 
			   +IsNull((CASE ci.CIListItemTypeText			
			   WHEN 'Yes/No'
			   THEN cast(cl.CIListNumber as nvarchar(100))
			   WHEN 'Number'
			   THEN cast(cl.CIListNumber as nvarchar(100))
			   WHEN 'Date'
			   THEN cast(cl.CIListItemDate as nvarchar(100))
			   WHEN 'Text'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   --WHEN 'Password'
			   --THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'GUID Field'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'Hidden Field'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'Memo'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'Pull Down'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'Lookup Table'
			   THEN replace(cast(cl.CIListText as nvarchar(100)),'&','_')
			   WHEN 'CheckBox'
			   THEN coalesce((replace(cast(cl.CIListText as nvarchar(100)),'&','_'))
							 ,cast(cl.CIListNumber as nvarchar(100))
							 ,'')
			   END),'')
			   + '</' +
			    replace(
			    replace(
			    replace(
			    replace(
				replace(
			    replace(
				replace(
				replace(
				replace(
			    replace( 
			   (replace(
			   (replace
			   (replace(ct.CIListTemplateItemName,' ','_')
			   ,'?','.')
			   ),'/','_')
			   ),':','.')
			   ,'1st','First')
			   ,'(','.')
			   ,')','.')
			   ,',','.')
			   ,'''','.')
			   ,'"','.')
			   ,'&','.')
			   ,'2nd','Second')
			   ,'+','.')
			   + '>' as xml)
			   FROM CIList c
			   LEFT JOIN CIListItem cl
			   ON c.cilistid=cl.cilistid
			   LEFT JOIN cilisttemplateitem ct
			   ON cl.CIListTemplateItemId=ct.CIListTemplateItemId
			   LEFT JOIN cilisttemplate ctl
			   ON c.CIListTemplateId=ctl.CIListTemplateId
			   LEFT JOIN cilistitemtype ci
			   on ct.CIListItemTypeId=ci.CIListItemTypeId
			   where c.contactid=@contactid and (ct.CIListTemplateItemName not like '%1%'
			   and ct.CIListTemplateItemName not like '%2%'
			   and ct.CIListTemplateItemName not like '%3%'
			   and ct.CIListTemplateItemName not like '%4%'
			   and ct.CIListTemplateItemName not like '%5%'
			   and ct.CIListTemplateItemName not like '%6%'
			   and ct.CIListTemplateItemName not like '%7%'
			   and ct.CIListTemplateItemName not like '%8%'
			   and ct.CIListTemplateItemName not like '%9%'
			   and ct.CIListTemplateItemName not like '%10%'
			   and ct.CIListTemplateItemName not like '%-%'
			   --and ct.CIListTemplateItemName not like '%/%'
			   --and ct.CIListTemplateItemName not like '%,%'
			   )
			   for xml path(''), type, root('Library')
			   )
			  ,@UserID
			  ,GETDATE()

		SELECT @start_row = MIN(contactid) FROM #cilistcontacts Where contactid > @contactid 
		--Set @I = @I + 1
END
