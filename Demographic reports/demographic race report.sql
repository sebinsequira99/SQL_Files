

mapccdiobr

drop table #race

select lr.raceid,lr.racetext
into #race 
from contactrace cr
join lkprace lr 
on cr.raceid=lr.raceid

update #race
set racetext='unknown'
where racetext='-'


drop table Demographic_Race

create table Demographic_Race
(
 id int identity(1,1)
,race_groups varchar(100)
,race_group_cnt int
)

insert into Demographic_Race(race_groups,race_group_cnt)

select 'American Indian or Alaski Native',count(*) from #race where racetext='American Indian or Alaski Native'
union
select 'Asian',count(*) from #race where racetext='Asian'
union
select 'Black or African-American',count(*) from #race where racetext='Black / African American'
union
select 'Hispanic or Latino',count(*) from #race where racetext='Hispanic or Latino'
union
select 'Native Hawaiian or Other Pacific Islander',count(*) from #race where racetext='Native Hawaiian or Other Pacific Islander'
union
select 'White',count(*) from #race where racetext='White  Caucasian'
union
select 'Another Race/Ethnicity',count(*) from #race where racetext='Other'
union
select 'Multi-racial or Ethnic',count(*) from #race where racetext='Bi-Racial'
union
select 'Preferred no Racial/Ethnic Identification',count(*) from #race where racetext='Preferred no Racial/Ethnic Identification'
union
select 'Unknown',count(*) from #race where racetext='Unknown'






