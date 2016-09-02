
mapaoi

lkpcountry
14	USA
102	United States

contactaddress where CountryId=14
contactaddress where CountryId=102

user_accounts where country='United States'


information_schema.columns where column_name like '%country%'

select * into user_reference_211015		    from user_reference			
select * into user_accounts_211015			from user_accounts			
select * into MAPSystemData_211015			from MAPSystemData			
select * into MAPSystemDatarevocer_211015	from MAPSystemDatarevocer	
select * into ContactAddress_211015		    from ContactAddress			
select * into Contact_211015				from Contact				
select * into lkpCountry_211015			    from lkpCountry				

select * from user_reference		where country					 ='United States'
select * from user_accounts			where country					 ='United States'
select * from MAPSystemData			where Country					 ='United States'
select * from ContactAddress		where CountryId					 =102
select * from Contact				where PlaceOfBirthCountryId		 =102
select * from lkpCountry			where CountryID					 =102

update user_reference
set country='USA'
where country='United States'

update user_accounts
set country='USA'
where country='United States'

update MAPSystemData
set country='USA'
where country='United States'

update ContactAddress
set CountryId=14
where CountryId=102

update Contact
set PlaceOfBirthCountryId=14
where PlaceOfBirthCountryId=102

delete from lkpCountry
where CountryID=102