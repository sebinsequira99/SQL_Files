

--exec usp_UpdateLibraryData '<root>
--    <ap1fname>
--		<name>ap1fname</name>
--		<value>test update</value>
--		<scope>0</scope>
--        <program_id>0</program_id>
--        <connection_id>-1</connection_id>
--        <is_system>1</is_system>
--    </ap1fname>
--	<Username>
--		<name>Username</name>
--		<value>test update</value>
--        <scope>3</scope>
--        <program_id>0</program_id>
--        <connection_id>-1</connection_id>
--		<is_system>0</is_system>
--    </Username>
--	<test_insert_field>
--		<name>test_insert_field</name>
--		<value>test insert value</value>
--        <scope>3</scope>
--        <program_id>1</program_id>
--        <connection_id>-1</connection_id>
--		<is_system>0</is_system>
--    </test_insert_field>
--	<testing_insert_field>
--		<name>testing_insert_field</name>
--		<value>testing insert value</value>
--        <scope>3</scope>
--        <program_id>1</program_id>
--        <connection_id>2</connection_id>
--		<is_system>0</is_system>
--    </testing_insert_field>
--</root>',17089,1,-1

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_UpdateLibraryData' AND type='p')
DROP PROCEDURE usp_UpdateLibraryData;

GO

CREATE PROC usp_UpdateLibraryData
(
 @xmldata_input xml
,@user_id int
,@contactid int
,@connid int
)

AS

BEGIN

 SET NOCOUNT ON

 ;
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
 SET InputFieldvalue=replace(InputFieldvalue,'undefined','')   
 
 UPDATE #xmldata_input
 SET InputFieldvalue=replace(replace(InputFieldvalue,'true','1'),'false','0')
 WHERE InputFieldname='is_system'
 
 ALTER TABLE #xmldata_input
 ADD id int identity(1,1)

 --select * from #xmldata_input

 DECLARE @xmldata_system xml
 SELECT @xmldata_system=data_xml from library_systemdata 
						where contactid=@contactid
						--and connectionid in (select inputfieldvalue from #xmldata_input 
						--					   where inputfieldname='connection_id')
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

 --select * from #xmlData_system

 DECLARE @xmldata_custom xml
        ,@startid int
        ,@endid int
		,@scope int
		,@connectionid int
		,@insert_xml xml

 create table #xmlData_custom
 (
  CustomFieldname nvarchar(max)
 ,CustomFieldvalue nvarchar(max)
 )

--Pivot table #xmldata_input

  ;with connectionids as
  (
  Select GRPNO
  , Max(scope) scope
  , Max(program_id)  program_id
  , Max(connection_id) connection_id
  , Max(is_system) is_system 
  , Max(name) name 
  From (
  SELECT       
   GRPNO
  ,scope
  ,program_id
  ,connection_id
  ,is_system 
  ,name 
   FROM (SELECT DENSE_RANK() Over (Partition By RNK Order By ID) GRPNO,*
   FROM (  Select  DENSE_RANK() Over (Order By inputfieldname) RNK,* From #xmldata_input Where inputfieldname IN 
   ('scope','program_id','connection_id','is_system','name') ) as rk) AS SourceTable
   PIVOT
  (
  max(inputfieldvalue)
  FOR inputfieldname IN 
  (scope
  ,program_id
  ,connection_id
  ,is_system
  ,name
  )) AS PivotTable  ) Tst Group by GRPNO
 )

 select * into #connectionids from 
 connectionids --where is_system=0

 --select * from #connectionids

 select @startid=min(grpno) from #connectionids where is_system=0
 select @endid=max(grpno) from #connectionids where is_system=0

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

	select @startid=min(grpno) from #connectionids where grpno>@startid   And  is_system=0

	--select @startid

 end

 --SELECT * FROM #xmlData_custom

 select InputFieldname,InputFieldvalue into #inputfields from #xmldata_input
 where inputfieldname in ('name','value')

 ALTER TABLE #inputfields
 ADD id int identity(1,1)

 --select * from #inputfields

 --Pivot table #inputfields

  ;with namevalue as
  (
  Select GRPNO
  , Max(name) name
  , Max(value)  value
  From (
  SELECT       
   GRPNO
  ,name
  ,value
   FROM ( SELECT DENSE_RANK() Over (Partition By RNK Order By ID) GRPNO,*
   FROM ( Select  DENSE_RANK() Over (Order By inputfieldname) RNK,* From #inputfields Where inputfieldname IN 
   ('name','value') ) as rk) AS SourceTable
   PIVOT
  (
  max(inputfieldvalue)
  FOR inputfieldname IN 
  (name
  ,value
  )) AS PivotTable  ) Tst Group by GRPNO
 )

 select * into #namevalue from namevalue

 --select * from #namevalue

 declare @start_id int=1
        ,@end_id int
        ,@SqlVar nvarchar(max)
        ,@SqlVar1 nvarchar(max)
        ,@inputfieldname nvarchar(max)
        ,@inputfieldvalue nvarchar(max)
        ,@connection_id varchar(10)
        ,@scopeid varchar(10)
		,@program_id varchar(10)

 select @end_id=count(*) from #namevalue

 while(@start_id<=@end_id)

 begin

 select @inputfieldname=name from #namevalue
 where grpno=@start_id
 select @connection_id=connection_id from #connectionids where name=@inputfieldname
 select @scopeid=scope from #connectionids where name=@inputfieldname
 select @program_id=program_id from #connectionids where name=@inputfieldname
 select @inputfieldvalue=value from #namevalue
 where name=@inputfieldname

 --select @inputfieldname
 --select @connection_id
 --select @scopeid
 --select @inputfieldvalue

 if(@inputfieldname in(select systemfieldname from #xmldata_system))
 begin

	Set @SqlVar = '''delete /Library/'+@inputfieldname+'[1]'''

	--Print @SqlVar

	Set @SqlVar1 = 'UPDATE library_systemdata
	SET data_xml.modify('+@SqlVar+')
	where contactid='+cast(@contactid as varchar(10))
	--+' and connid='+cast(@connid as varchar(10))
	--+' and connectionid='+@connection_id
	--+' and scope='+@scopeid

	--Print @SqlVar1
	Execute (@SqlVar1)

	Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/Library)[1]'''

	--Print @SqlVar

	Set @SqlVar1 = 'UPDATE library_systemdata
	SET data_xml.modify('+@SqlVar+')
	where contactid='+cast(@contactid as varchar(10))
	--+' and connid='+cast(@connid as varchar(10))
	--+' and connectionid='+@connection_id
	--+' and scope='+@scopeid

	--Print @SqlVar1
	Execute (@SqlVar1)

 end


 else if(@inputfieldname in(select customfieldname from #xmldata_custom))
 begin

	Set @SqlVar = '''delete /xml/'+@inputfieldname+'[1]'''

	--Print @SqlVar

	Set @SqlVar1 = 'UPDATE library_customdata
	SET data_xml.modify('+@SqlVar+')
	where connid='+cast(@connid as varchar(10))
	+' and contactid='+cast(@contactid as varchar(10))
	+' and connectionid='+@connection_id
	+' and scope='+@scopeid

	--Print @SqlVar1
	Execute (@SqlVar1)

	Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/xml)[1]'''

	--Print @SqlVar

	Set @SqlVar1 = 'UPDATE library_customdata
	SET data_xml.modify('+@SqlVar+')
	where connid='+cast(@connid as varchar(10))
	+' and contactid='+cast(@contactid as varchar(10))
	+' and connectionid='+@connection_id
	+' and scope='+@scopeid

	--Print @SqlVar1
	Execute (@SqlVar1)

 end

 else
 begin
	if((select is_system from #connectionids where name=@inputfieldname)=1)
	begin
		Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/Library)[1]'''
		
		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))
		--+' and connid='+cast(@connid as varchar(10))
		--+' and connectionid='+@connection_id
		--+' and scope='+@scopeid
		
		--Print @SqlVar1
		Execute (@SqlVar1)
	end
	else if((select is_system from #connectionids where name=@inputfieldname)=0)
	begin

		declare @data_xml xml
		select @data_xml=data_xml from library_customdata where contactid=@contactid 
															and connectionid=@connection_id
															and scope=@scopeid

		--select @data_xml

		if(cast(@data_xml as nvarchar(max))<>'' and @data_xml is not null)
		begin

			--print 'update'
			Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/xml)[1]'''
			
			--Print @SqlVar
			
			Set @SqlVar1 = 'UPDATE library_customdata
			SET data_xml.modify('+@SqlVar+')
			where connid='+cast(@connid as varchar(10))
			+' and contactid='+cast(@contactid as varchar(10))+' and connectionid='+@connection_id+' and scope='+@scopeid
			
			--Print @SqlVar1
			Execute (@SqlVar1)

		end

		else if(cast(@data_xml as nvarchar(max))='' or @data_xml is null)
		begin
			--print 'insert'

			SET @insert_xml=cast('<xml><'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'></xml>' as xml)

			insert into library_customdata(user_id
										  ,contactid
										  ,connectionid
										  ,connid
										  ,scope
										  ,program_id
										  ,data_json
										  ,data_xml
										  ,created_by
										  ,created_at)

			select @user_id
				  ,@contactid
				  ,@connection_id
				  ,@connid
				  ,@scopeid
				  ,@program_id
				  ,''
				  ,@insert_xml
				  ,@user_id
				  ,getdate()

		end

	end

 end

 set @start_id=@start_id+1

 end

 BEGIN TRY
	EXEC usp_UpdateContact_OnFormSave @contactid
 END TRY

 BEGIN CATCH
	THROW;
 END CATCH

 DROP TABLE #xmldata_input
 DROP TABLE #xmldata_system
 DROP TABLE #xmldata_custom
 DROP TABLE #connectionids
 DROP TABLE #inputfields
 DROP TABLE #namevalue

 SET NOCOUNT OFF

 end














