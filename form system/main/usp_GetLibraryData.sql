
--exec usp_GetLibraryData '<root>
--    <ap1fname>
--		<name>ap1fname</name>
--		<scope>0</scope>
--        <program_id>0</program_id>
--        <connection_id>-1</connection_id>
--        <is_system>1</is_system>
--    </ap1fname>
--    <ap1lname>
--		<name>ap1lname</name>
--		<scope>0</scope>
--        <program_id>0</program_id>
--        <connection_id>-1</connection_id>
--		<is_system>1</is_system>
--    </ap1lname>
--	<Username>
--		<name>Username</name>
--        <scope>3</scope>
--        <program_id>1</program_id>
--        <connection_id>-1</connection_id>
--		<is_system>0</is_system>
--    </Username>
--	<Active_Date>
--		<name>Active_Date</name>
--        <scope>3</scope>
--        <program_id>1</program_id>
--        <connection_id>-1</connection_id>
--		<is_system>0</is_system>
--    </Active_Date>
--	<CaseWorkerFname>
--		<name>CaseWorkerFname</name>
--        <scope>3</scope>
--        <program_id>1</program_id>
--        <connection_id>2</connection_id>
--		<is_system>0</is_system>
--    </CaseWorkerFname>
--</root>',17089,1,-1

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_GetLibraryData' AND type='p')
DROP PROCEDURE usp_GetLibraryData;

GO

CREATE PROC usp_GetLibraryData
(
 @xmldata_input xml
,@user_id int
,@contactid int
,@connid int
)

AS

BEGIN

 WITH xmldata_input
 AS 
 (
 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
 ,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
 FROM @xmldata_input.nodes('//.') as [table]([column])
 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
 )

 SELECT * into #xmldata_input FROM xmldata_input
 
 UPDATE #xmldata_input
 set InputFieldvalue=replace(replace(InputFieldvalue,'true','1'),'false','0')
 where InputFieldname='is_system'
 
 ALTER TABLE #xmldata_input
 ADD id int identity(1,1)

 DECLARE @xmldata_system xml
 SELECT @xmldata_system=data_xml from library_systemdata 
						where contactid=@contactid
						--and user_id=@user_id
						--and connid=@connid

 ;
 WITH xmlData_system
 AS 
 (
 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'SystemFieldname'
 ,[column].value('.', 'NVARCHAR(max)') as 'SystemFieldvalue'
 FROM @xmldata_system.nodes('//.') as [table]([column])
 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
 )

 SELECT * into #xmlData_system FROM xmlData_system

 DECLARE @xmldata_custom xml
        ,@startid int
        ,@endid int
		,@scope int
		,@connectionid int

 create table #xmlData_custom
 (
  CustomFieldname nvarchar(max)
 ,CustomFieldvalue nvarchar(max)
 )

 --Pivot table #xmldata_input

  ;with connectionids as
  (
  Select GRPNO, Max(scope) scope, Max(program_id)  program_id, Max(connection_id) connection_id, Max(is_system) is_system From (
  SELECT       
  GRPNO,scope
  ,program_id
  ,connection_id
  ,is_system  
   FROM (SELECT DENSE_RANK() Over (Partition By RNK Order By ID) GRPNO,*
   FROM(  Select  DENSE_RANK() Over (Order By inputfieldname) RNK,* From #xmldata_input Where inputfieldname IN 
		('scope','program_id','connection_id','is_system') )as rk) AS SourceTable
   PIVOT
  (
  max(inputfieldvalue)
  FOR inputfieldname IN 
  (scope
  ,program_id
  ,connection_id
  ,is_system
  )) AS PivotTable  ) Tst Group by GRPNO
  )

 select * into #connectionids from 
 connectionids where is_system=0

 --select * from #connectionids

 select @startid=min(grpno) from #connectionids
 select @endid=max(grpno) from #connectionids

 --select @startid
 --select @endid

 while(@startid<=@endid)

 begin

    select @connectionid=connection_id from #connectionids where grpno=@startid
    select @scope=scope from #connectionids where grpno=@startid

	--select @connectionid
	--select @scope

	SELECT @xmldata_custom=data_xml from library_customdata 
							where connectionid=@connectionid
							and scope=@scope
							--and program_id in (select inputfieldvalue from #xmldata_input 
							--					where inputfieldname='program_id')
							--and user_id=@user_id
							and contactid=@contactid
							and connid=@connid
	;
	WITH xmlData_custom
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'CustomFieldname'
	,[column].value('.', 'NVARCHAR(max)') as 'CustomFieldvalue'
	FROM @xmldata_custom.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
	)

	INSERT INTO #xmlData_custom 
	SELECT * FROM xmlData_custom

	select @startid=min(grpno) from #connectionids where grpno>@startid

	--select @startid

 end

 --select * from #xmldata_input
 --select * from #xmldata_system
 --select * from #xmlData_custom

 select * into #result
 from #xmldata_input xi 
 left join #xmldata_system xs on xi.inputfieldvalue COLLATE Latin1_General_CS_AS = xs.systemfieldname COLLATE Latin1_General_CS_AS
 left join #xmlData_custom xc on xi.inputfieldvalue COLLATE Latin1_General_CS_AS =xc.Customfieldname COLLATE Latin1_General_CS_AS

 alter table #result
 add outputfieldname nvarchar(max)
    ,outputfieldvalue nvarchar(max)

 update #result
 set outputfieldname=coalesce(systemfieldname,Customfieldname,'0')
    ,outputfieldvalue=coalesce(systemfieldvalue,Customfieldvalue,'0')

 select distinct outputfieldname,outputfieldvalue from #result
 where outputfieldname<>'0'

 DROP TABLE #xmldata_input
 DROP TABLE #xmldata_system
 DROP TABLE #xmldata_custom
 DROP TABLE #connectionids
 DROP TABLE #result

 END




