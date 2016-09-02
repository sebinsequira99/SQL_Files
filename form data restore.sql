

--select * into formmaker_28_pptr1_191115 from formmaker_28_pptr1
--select * into formmaker_28_pptr1_1_191115 from formmaker_28_pptr1_1

--drop table formmaker_28_pptr1_1_test
--select * into formmaker_28_pptr1_1_test from formmaker_28_pptr1_1

declare @data varchar(max)
	   ,@start_id int=1
	   ,@end_id int

select @end_id=max(data_id) from formmaker_28_pptr1

while(@start_id<=@end_id)

begin

select @data=input_internationaladoptionawarenesseducation_4 from formmaker_28_pptr1 where data_id=@start_id

SELECT value into #temptbl from udf_Split_into_rows(@data);

update formmaker_28_pptr1
set input_internationaladoptionawarenesseducation_4=
case when ('International Adoption Awareness Education' in (select value from #temptbl))
then 'International Adoption Awareness Education'
else null
end
where data_id=@start_id

update formmaker_28_pptr1
set input_other_7=
case when ('Other' in (select value from #temptbl)
or ' Other' in (select value from #temptbl))
then 'Other'
else null
end
where data_id=@start_id

--update formmaker_28_pptr1
--set input_transracialtransculturaltraining=
--case when ('Trans-racial/Trans-cultural Training' in (select value from #temptbl)
--or ' Trans-racial/Trans-cultural Training' in (select value from #temptbl))
--then 'Trans-racial/Trans-cultural Training'
--else null
--end
--where data_id=@start_id

--update formmaker_28_pptr1
--set input_alpconspicuousfamilies=
--case when ('ALP: Conspicuous Families' in (select value from #temptbl)
--or ' ALP: Conspicuous Families' in (select value from #temptbl))
--then 'ALP: Conspicuous Families'
--else null
--end
--where data_id=@start_id

--update formmaker_28_pptr1
--set input_other_8=
--case when ('Other' in (select value from #temptbl)
--or ' Other' in (select value from #temptbl))
--then 'Other'
--else null
--end
--where data_id=@start_id

--update formmaker_28_pptr1
--set input_internationaladoptionawarenesseducation_2=
--case when ('International Adoption Awareness Education' in (select value from #temptbl)
--or ' International Adoption Awareness Education' in (select value from #temptbl))
--then 'International Adoption Awareness Education'
--else null
--end
--where data_id=@start_id

--update formmaker_28_pptr1
--set input_other_5=
--case when ('Other' in (select value from #temptbl)
--or ' Other' in (select value from #temptbl))
--then 'Other'
--else null
--end
--where data_id=@start_id

select @start_id=min(data_id) from formmaker_28_pptr1 Where data_id > @start_id

drop table #temptbl

end
