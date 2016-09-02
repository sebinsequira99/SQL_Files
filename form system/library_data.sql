

create table #Contact
( 
 id						int	identity(1,1)
,contactid				int
,FName					nvarchar(150)
,MName					nvarchar(100)
,LName					nvarchar(150)
,BirthDate				datetime
,Gender					nvarchar(2)
,Nickname				nvarchar(150)
,SSN					nvarchar(100)
,BirthName				varchar(255)
,PlaceOfBirthCity		varchar(50)
,PlaceOfBirthStateId	int
,PlaceOfBirthCountryId	int
)

insert into #Contact
(contactid
,FName					
,MName					
,LName								
,BirthDate				
,Gender		
,Nickname			
,SSN	
,BirthName						
,PlaceOfBirthCity		
,PlaceOfBirthStateId	
,PlaceOfBirthCountryId		
)	
select 	
 contactid		
,FName					
,MName					
,LName								
,BirthDate				
,Gender		
,Nickname			
,SSN	
,BirthName					
,PlaceOfBirthCity		
,PlaceOfBirthStateId	
,PlaceOfBirthCountryId			
from contact

--select * into library_data_temp from library_data
--drop table library_data_temp

DECLARE @start_row int=1
DECLARE @end_row int
DECLARE @contactid int
DECLARE @contactid2 int

SELECT @end_row=count(1) from #contact
		
WHILE (@start_row <= @end_row) 
BEGIN  
		
		SELECT @contactid = contactid 
		FROM #contact 
		WHERE id=@start_row

		SELECT @contactid2 = contactid2 
		FROM rolesqa.dbo.rel_relationship 
		WHERE contactid=@contactid and relationshiptypeid=-101

		IF(isnull(@contactid2,0)=0)
		SELECT @contactid2 = contactid 
		FROM rolesqa.dbo.rel_relationship 
		WHERE contactid2=@contactid and relationshiptypeid=-101
			
		INSERT INTO library_data_temp
		(
		 reference_id
		,scope
		,data_XML
		,created_date
		,created_by
		)
		
		select c.contactid
			  ,1
			  ,(select c.FName					as AP1Fname
					  ,c.MName					as AP1MName
					  ,c.LName					as AP1Lname
					  ,c.BirthDate				as AP1DOB
					  ,c.Gender					as AP1Gender
					  ,c.Nickname				as AP1Nickname
					  ,c.SSN					as AP1SSN
					  ,c.BirthName				as AP1BirthName
					  ,c.PlaceOfBirthCity		as AP1BirthCity
					  ,c.PlaceOfBirthStateId	as AP1BirthState
					  ,c.PlaceOfBirthCountryId	as AP1BirthCountry
					  ,ce.ContactEmail			as AP1Email
					  ,cp.PhoneNumber			as AP1CellPhone
					  ,cc.FName					as AP2Fname
					  ,cc.MName					as AP2MName
					  ,cc.LName					as AP2Lname
					  ,cc.BirthDate				as AP2DOB
					  ,cc.Gender				as AP2Gender
					  ,cc.Nickname				as AP2Nickname
					  ,cc.SSN					as AP2SSN
					  ,cc.BirthName				as AP2BirthName
					  ,cc.PlaceOfBirthCity		as AP2BirthCity
					  ,cc.PlaceOfBirthStateId	as AP2BirthState
					  ,cc.PlaceOfBirthCountryId	as AP2BirthCountry
					  ,ee.ContactEmail			as AP2Email
					  ,pp.PhoneNumber			as AP2CellPhone
					  ,ca.Address1				as Add1
					  ,ca.Address2				as Add2
					  ,ca.City					as City
					  ,ca.Zip					as Zip
					  ,lc.Countytext			as County
					  ,cn.Countrytext			as Country
					  
		        from #contact c
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
				left join contact cc
				on cc.contactid=@contactid2
				left join contactemail ee
				on ee.contactid=@contactid2 and ee.PrimaryEmail=1
				left join contactphone pp
				on pp.contactid=@contactid2 and pp.PrimaryPhone=1
				where c.contactid=@contactid
		        for xml path('Library'))
			  ,getdate()
			  ,1
		from #contact c
		where c.contactid=@contactid

		SET @start_row=@start_row+1

END

update l
set l.userid=r.user_id
from library_data_temp l
join rolesqa.dbo.rel_relationship r 
on (l.reference_id=r.contactid or l.reference_id=r.contactid2) 
and (r.relationshiptypeid=-101
or r.relationshiptypeid=-5001)
and r.connid>0


Select * From Library_data_Temp Order By Reference_ID






