

mapsdc

SET ANSI_NULLS ON SET ANSI_PADDING ON SET QUOTED_IDENTIFIER ON 
SET ANSI_WARNINGS ON SET CONCAT_NULL_YIELDS_NULL ON 
SET ARITHABORT ON SET ANSI_NULL_DFLT_ON ON 

create table #result(TotalCount int	
,group_name	varchar(max)
,grouprole_sub_type	varchar(max)
,grouprole_type	varchar(max)
,DisplayName varchar(max)	
,username varchar(max)	
,PHASENAME varchar(max))

insert into #result
EXEC currentcasestatuslist '196', '' , '', '', '' ,'' ,'' , '' , '', '' ,'','0','8125'

alter table #result
add currentstatus varchar(200)

update #result
set clientname=replace(substring(displayname,1,charindex('<',displayname,1)-1),'amp;','')

