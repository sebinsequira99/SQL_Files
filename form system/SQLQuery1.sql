
TRUNCATE TABLE library_customdata

Go
DECLARE @start_row int
DECLARE @end_row int
DECLARE @contactid int
DECLARE @contactid2 int
DECLARE @UserID int
DECLARE @ConnID int
DECLARE @ConnectionID int

SELECT @start_row =MIN(contactid) FROM Contact
SELECT @end_row= Max(contactid) from Contact
--Declare @I As Int =1
--Declare @J As Int = 2		
WHILE (@start_row <= @end_row) --(@I <= @J)--
BEGIN  
		
		SET @contactid = @start_row 
		
		SELECT @contactid2 = contactid2 
		FROM rolesqa.dbo.rel_relationship 
		WHERE contactid=@contactid and relationshiptypeid=-101

		IF(isnull(@contactid2,0)=0)
			SELECT @contactid2 = contactid 
			FROM rolesqa.dbo.rel_relationship 
			WHERE contactid2=@contactid and relationshiptypeid=-101

		SELECT Top 1 @UserID =  user_id,@ConnID = connid,@ConnectionId=ConnectionId  FROM rolesqa.dbo.rel_relationship 
		WHERE (contactid=@contactid or contactid2=@contactid) And [relationshiptypeid] in (-101,-5001)

		DELETE FROM #tblXML
		
		INSERT INTO #tblXML([ContactID],
							[AP1Fname] ,
							[AP1MName] ,
							[AP1Lname],
							[AP1DOB],
							[AP1Gender] ,
							[AP1Nickname] ,
							[AP1SSN] ,
							[AP1BirthName] ,
							[AP1BirthCity] ,
							[AP1BirthState] ,
							[AP1BirthCountry] ,
							[AP1Email] ,
							[AP1CellPhone] ,
							[Add1],
							[Add2] ,
							[City],
							[Zip],
							[County],
							[Country])
		SELECT		 TOP 1 @contactid ContactID,
					 IsNull(c.FName,'') as AP1Fname
					,IsNull(c.MName,'') as AP1MName
					,IsNull(c.LName,'') as AP1Lname
					,IsNull(c.BirthDate,'1900-01-01') as AP1DOB
					,IsNull(c.Gender,'') as AP1Gender
					,IsNull(c.Nickname,'') as AP1Nickname
					,IsNull(c.SSN,'') as AP1SSN
					,IsNull(c.BirthName,'') as AP1BirthName
					,IsNull(c.PlaceOfBirthCity,'') as AP1BirthCity
					,IsNull(c.PlaceOfBirthStateId,0) as AP1BirthState
					,IsNull(c.PlaceOfBirthCountryId,0) as AP1BirthCountry
					,IsNull(ce.ContactEmail,'') as AP1Email
					,IsNull(cp.PhoneNumber,'') as AP1CellPhone
					,IsNull(ca.Address1,'') as Add1
					,IsNull(ca.Address2,'') as Add2
					,IsNull(ca.City,'') As City
					,IsNull(ca.Zip,'') As Zip
					,IsNull(lc.Countytext,'') as County
					,IsNull(cn.Countrytext,'') as Country 
		FROM contact c
		left join rolesqa.dbo.contactaddress ca
		on c.contactid=ca.contactid and ca.MailingAddress=1	
		left join rolesqa.dbo.lkpcounty lc
		on ca.countyid=lc.countyid
		left join rolesqa.dbo.lkpcountry cn
		on ca.countryid=cn.countryid
		left join rolesqa.dbo.contactemail ce
		on c.contactid=ce.contactid and ce.PrimaryEmail=1
		left join rolesqa.dbo.contactphone cp
		on c.contactid=cp.contactid and cp.PrimaryPhone=1
		where c.contactid=@contactid

		INSERT INTO library_customdata
		(
		user_id
		,Contactid
		,connectionid
		,connid
		,data_XML
		,created_at
		,created_by
		)
		SELECT @UserID As UserID
			  ,@contactid As contactid
			  ,@ConnectionId
			  ,@connid
			  ,(		  
			   select 
			   top 10 values(
			   (case ci.CIListItemTypeText
			   when 'Yes/No'
			   then cl.CIListNumber
			   when 'Date'
			   then cl.CIListItemDate
			   when 'Text'
			   then cl.CIListText
			   end,ct.CIListTemplateItemName))
			   from CIList c
			   left join CIListItem cl
			   on c.cilistid=cl.cilistid
			   left join cilisttemplateitem ct
			   on cl.CIListTemplateItemId=ct.CIListTemplateItemId
			   left join cilisttemplate ctl
			   on c.CIListTemplateId=ctl.CIListTemplateId
			   left join cilistitemtype ci
			   on ct.CIListItemTypeId=ci.CIListItemTypeId
		       FOR XML PATH('Library'))
			  ,GETDATE()
			  ,@UserID
		from CIList c
		left join CIListItem cl
		on c.cilistid=cl.cilistid
		left join cilisttemplateitem ct
		on cl.CIListTemplateItemId=ct.CIListTemplateItemId
		left join cilisttemplate ctl
		on c.CIListTemplateId=ctl.CIListTemplateId
		left join cilistitemtype ci
		on ct.CIListItemTypeId=ci.CIListItemTypeId

		SELECT @start_row = MIN(contactid) FROM Contact Where contactid > @contactid
		--Set @I = @I + 1
END



Select * From library_customdata Order By contactid


select cast('<' + ct.CIListTemplateItemName + '>' + (case ci.CIListItemTypeText
			   when 'Yes/No'
			   then cast(cl.CIListNumber as nvarchar(200))
			   when 'Date'
			   then cast(cl.CIListText as nvarchar(200))
			   when 'Text'
			   then cast(cl.CIListItemDate as nvarchar(200))
			   end) + '</' + ct.CIListTemplateItemName + '>' as xml) 
select top 10 *
from 
CIList c
left join CIListItem cl
on c.cilistid=cl.cilistid
left join cilisttemplateitem ct
on cl.CIListTemplateItemId=ct.CIListTemplateItemId
left join cilisttemplate ctl
on c.CIListTemplateId=ctl.CIListTemplateId
left join cilistitemtype ci
on ct.CIListItemTypeId=ci.CIListItemTypeId
--where c.cilistid=16826
for xml path(''), type, root('Library')

