
mapdev

library_systemdata

contactaddress

mapsystemdata
user_accounts 


drop table #XmlData
declare @xmldata xml
select @xmldata=data_xml from library_systemdata where [user_id]=20341
;
WITH XmlData
AS 
(
select [column].value('fn:local-name(.)', 'NVARCHAR(100)')	as 'Fieldname'
,[column].value('.', 'NVARCHAR(100)')	as 'Fieldvalue'
FROM @xmlData.nodes('//.') as [table]([column])
where [column].value('fn:local-name(.)','varchar(50)')<>''
)

select * into #XmlData from XmlData
delete from #XmlData where fieldname in ('xml','syslibrary')
go
alter table #XmlData
add id int identity(1,1)
go
alter table #XmlData
add displayname varchar(max)
go

update x
set x.displayname=m.displayname
from #XmlData x
join mapfieldcatbase m
on x.fieldname=m.fieldname

declare @fieldname varchar(max)
declare @fieldvalue varchar(max)
declare @startrow int=1
declare @endrow int
declare @contactid int
select @endrow=max(id) from #XmlData
select @contactid=contactid from library_systemdata where [user_id]=20341
declare @Runsql varchar(max)

while(@startrow<=@endrow)
begin

select @fieldname=displayname
      ,@fieldvalue=fieldvalue from #XmlData
where id=@startrow

if (@fieldname='Address 1'
or  @fieldname='Address 2'
or  @fieldname='City'
or  @fieldname='State'
or  @fieldname='Zip'
or  @fieldname='Country'
or  @fieldname='County')

set @Runsql='update contactaddress
set ' +@fieldname+ '='''+@fieldvalue+''' where contactid='+cast(@contactid as varchar(20))

print @Runsql
set @startrow=@startrow+1
end







