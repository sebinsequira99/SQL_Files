
mapdev

declare @ContactAIRSId int 
declare @iContactId int 
Exec MAPAddNewGroup 'mapdev', 'milk', 0, @ContactAIRSId output, @iContactId output
select @ContactAIRSId
select @iContactId

select top 10* from user_accounts
order by user_id desc

select top 10* from contact
order by contactid desc


select top 10* from Rel_Relationship
order by createddate desc

library_systemdata

rel_relationship where user_id=20499
user_accounts where user_id=20491

rel_relationship where contactid=94848


insert into mapsystemdata(User_Id
,Agency
,AP1LName)
values(20490,164,'parentnew1')

user_accounts


drop table #XmlData
declare @xmldata xml
SELECT @xmldata=data_xml FROM library_systemdata WHERE [user_id]=20498
	;
	WITH XmlData
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(100)')	as 'Fieldname'
	,[column].value('.', 'NVARCHAR(100)')	as 'Fieldvalue'
	FROM @xmlData.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','varchar(50)')<>''
	)
	
	SELECT * INTO #XmlData FROM XmlData
	DELETE FROM #XmlData WHERE fieldname in ('xml','syslibrary')
	
	ALTER TABLE #XmlData
	ADD id INT IDENTITY(1,1)

	UPDATE #XmlData
	SET fieldvalue=CASE fieldname 
				   WHEN 'AP1BirthState' 
				   THEN (SELECT stateid FROM lkpstate WHERE statename=fieldvalue)
				   WHEN 'AP1BirthCountry' 
				   THEN (SELECT countryid FROM lkpcountry WHERE CountryText=fieldvalue)
				   WHEN 'AP2BirthState' 
				   THEN (SELECT stateid FROM lkpstate WHERE statename=fieldvalue)
				   WHEN 'AP2BirthCountry' 
				   THEN (SELECT countryid FROM lkpcountry WHERE CountryText=fieldvalue)
				   WHEN 'AP1State' 
				   THEN (SELECT stateid FROM lkpstate WHERE statename=fieldvalue)
				   WHEN 'AP1Country' 
				   THEN (SELECT countryid FROM lkpcountry WHERE CountryText=fieldvalue)
				   WHEN 'AP1County' 
				   THEN (SELECT countyid FROM lkpcounty WHERE CountyText=fieldvalue)
				   WHEN 'AP2State' 
				   THEN (SELECT stateid FROM lkpstate WHERE statename=fieldvalue)
				   WHEN 'AP2Country' 
				   THEN (SELECT countryid FROM lkpcountry WHERE CountryText=fieldvalue)
				   WHEN 'AP2County' 
				   THEN (SELECT countyid FROM lkpcounty WHERE CountyText=fieldvalue)
				   ELSE fieldvalue
				   END

				   alter table #XmlData
				   add lkpid int

				   update x
				   set x.lkpid=CASE x.fieldname 
				   WHEN 'AP1BirthState' 
				   THEN ls.stateid
				   WHEN 'AP1BirthCountry' 
				   THEN c.countryid
				   WHEN 'AP2BirthState' 
				   THEN ls.stateid
				   WHEN 'AP2BirthCountry' 
				   THEN c.countryid
				   WHEN 'AP1State' 
				   THEN ls.stateid
				   WHEN 'AP1Country' 
				   THEN c.countryid
				   WHEN 'AP1County' 
				   THEN lc.countyid
				   WHEN 'AP2State' 
				   THEN ls.stateid
				   WHEN 'AP2Country' 
				   THEN c.countryid
				   WHEN 'AP2County' 
				   THEN lc.countyid
				   end
				   from #XmlData x
				   left join lkpstate ls
				   on x.fieldvalue=ls.statename
				   left join lkpcountry c
				   on x.fieldvalue=c.countrytext
				   left join lkpcounty lc
				   on x.fieldvalue=lc.countytext

				   update #XmlData
				   set fieldvalue=lkpid
				   where lkpid is not null