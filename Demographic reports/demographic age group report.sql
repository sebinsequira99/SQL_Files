

mapccdiobr

drop table #age

select contactid,fname,mname,lname,birthdate,cast(DATEDIFF(hour,birthdate,GETDATE())/8766 as varchar(10)) AS AgeInYears 
into #age 
from contact

update #age
set ageinyears=-1
where birthdate is null

update #age
set ageinyears=-1
where birthdate='1900-01-01 00:00:00.000'


drop table Demographic_Age_Group

create table Demographic_Age_Group
(
 id int identity(1,1)
,age_groups varchar(50)
,age_group_cnt int
)

insert into Demographic_Age_Group(age_groups,age_group_cnt)

select 'Age 0 - 05',count(*) from #age where AgeInYears between 0 and 5
union
select 'Age 06 - 12',count(*) from #age where AgeInYears between 6 and 12
union
select 'Age 13-17',count(*) from #age where AgeInYears between 13 and 17
union
select 'Age 18-23',count(*) from #age where AgeInYears between 18 and 23
union
select 'Age 24-44',count(*) from #age where AgeInYears between 24 and 44
union
select 'Age 45-64',count(*) from #age where AgeInYears between 45 and 64
union
select 'Age 65 +',count(*) from #age where AgeInYears > 64
union
select 'Unknown',count(*) from #age where AgeInYears=-1





