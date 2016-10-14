

mapatfs_newtest

ReportTableMaster
ReportMaster

information_schema.tables where table_name like '%master%'

--insert into ReportTableMaster(TableId	
--,TableName	
--,TableDisplayName	
--,TableType)
--select
--18
--,'RptCIListDataAP_3'	
--,'CIList AP Data 3'	
--,'Ancillary'

select * into reportfieldmasterbase_131016 from reportfieldmasterbase
select * into reportfieldmaster_131016 from reportfieldmaster

--update  b
--set b.TableId=17
--from reportfieldmaster b
--inner join information_schema.columns c
--on b.fieldname=c.column_name
--where c.table_name='RptCIListDataAP_2' and b.TableId=3

--update  b
--set b.TableId=18
--from reportfieldmaster b
--inner join information_schema.columns c
--on b.fieldname=c.column_name
--where c.table_name='RptCIListDataAP_3' and b.TableId=3

--update  b
--set b.TableId=17
--from reportfieldmasterbase b
--inner join information_schema.columns c
--on b.fieldname=c.column_name
--where c.table_name='RptCIListDataAP_2' and b.TableId=3

--update  b
--set b.TableId=18
--from reportfieldmasterbase b
--inner join information_schema.columns c
--on b.fieldname=c.column_name
--where c.table_name='RptCIListDataAP_3' and b.TableId=3

reportfieldmaster where fieldid=-1

reporttblrelation

rptcilistdataap

reporttblrelation where AncillaryTableId in(3,17,18)
reportfieldmaster
reporttablemaster

--update reporttblrelation
--set GroupName=GroupName+'_2'
--,AncillaryAlias=AncillaryAlias+'_2'
--where AncillaryTableId=17

sys.objects where name like '%udf_couple%'

--delete from reportfieldmaster where fieldid in(
--select fieldid from reportfieldmaster where fieldname in(
--select fieldname 
--from reportfieldmaster
--group by fieldname
--having count(fieldname)>1)) and fieldtype like '%]%'
