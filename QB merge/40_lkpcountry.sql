

select * from mapfcs..lkpcountry --52

select * from MAPfac_OLD_Test..lkpcountry --23
select * from MAPFC_OLD_Test..lkpcountry --51

select countrytext from MAPfac_OLD_Test..lkpcountry
where countrytext not in(select countrytext from MAPFC_OLD_Test..lkpcountry)

--insert into mapfcs..lkpcountry(
--CountryText
--,isHagueCountry
--,isStateFinalizationRequired)
--select CountryText
--,isHagueCountry
--,isStateFinalizationRequired
--from MAPfac_OLD_Test..lkpcountry
--where countrytext in(
--'Sierra Leone'
--,'Guam'
--,'Nepal'
--,'Philippines'
--,'Pakaistan')

select c.CountryID as new_ID
,c.CountryText as new_text
,cc.CountryID as old_ID
,cc.CountryText as old_text
from mapfcs..lkpcountry c
inner join MAPfac_OLD_Test..lkpcountry cc
on c.CountryText=cc.CountryText
where c.CountryID<>cc.CountryID

--update mapfcs..contactaddress
--set countryid=case 
--when countryid=2 then 1
--when countryid=6 then 2
--when countryid=13 then 4
--when countryid=20 then 28
--when countryid=28 then 33
--when countryid=12 then 36
--when countryid=25 then 40
--when countryid=31 then 86
--when countryid=4 then 88
--when countryid=5 then 89
--when countryid=27 then 90
--when countryid=32 then 102
--when countryid=9 then 103
--when countryid=16 then 104
--when countryid=24 then 105
--when countryid=26 then 106
--when countryid=29 then 107
--end 
--where contactid>100000