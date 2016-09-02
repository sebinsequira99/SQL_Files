

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_GetRptSubformData' AND type='p')
DROP PROCEDURE usp_GetRptSubformData;

GO

/*

exec usp_GetRptSubformData '<xml>
						<form_1404>
						<subformname>subform_1449636506407</subformname>
						<subformname>subform_1449641856202</subformname>
						<subformname>subform_2123123123123</subformname>
						</form_1404>
						<form_1439>
						<subformname>subform_1449636506456</subformname>
						</form_1439>
						</xml>'

*/

CREATE PROC usp_GetRptSubformData
(
 @xmldata_input xml
)

AS

BEGIN

	SET NOCOUNT ON
	
	Declare @runsql nvarchar(max)
		   ,@data_xml_output xml=''
		   ,@startid int
		   ,@endid int
		   ,@SubF int
		   ,@formid int
		   ,@FormName nvarchar(20)
		   ,@TblName nvarchar(20)
		   ,@BFL int = 0
		   ,@EFL int = 0
		   ,@BSL INT = 0
		   ,@ESL INT = 0
		   ,@XmlSubF XML = ''
		   ,@xml1 XML = ''
		   ,@XmlMainF XML = ''
		   ,@subform_field_name nvarchar(50)
	
	 ;WITH xmldata_input
	 AS 
	 (
	 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
	 ,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
	 FROM @xmldata_input.nodes('//.') as [table]([column])
	 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
	 )
	
	 SELECT * into #xmldata_input FROM xmldata_input 
	 WHERE InputFieldname not in('xml')
	
	 ALTER TABLE #xmldata_input
	 ADD id int identity(1,1)
		,SubF int
		,TblName varchar(100)
	
	 --select * from #xmldata_input
	
	Update #xmldata_input Set SubF=ID Where InputFieldname Like 'form%'

	SELECT @startid= 1 ,@endid=count(*) from #xmldata_input

	WHILE(@startid<=@endid)
	BEGIN

		IF EXISTS (Select 1 From #xmldata_input Where ID = @startid And SubF Is Not Null)

			SELECT @SubF = SubF 
				  ,@formid=(SELECT substring(inputfieldname,charindex('_',inputfieldname)+1,len(inputfieldname)))
			FROM #xmldata_input 
			WHERE ID = @startid

		UPDATE #xmldata_input 
		SET SubF = @SubF 
		   ,TblName='RptTbl_'+cast(@formid as varchar(10))
		WHERE ID = @startid And SubF Is Null

		SET @startid = @startid+1

	END

	

	create table #result
	(id int identity(0,1)
	,xml_output xml)

	delete from #xmldata_input
	where tblname is null

	--Select * From #xmldata_input
	 
	SELECT @BFL=min(subf) FROM #xmldata_input
	SELECT @EFL=max(subf) FROM #xmldata_input

	WHILE(@BFL<=@EFL)
	BEGIN
		
		select top 1 @TblName= tblname from #xmldata_input where SUBF=@BFL
		Select @FormName = REPLACE(@TblName,'RptTbl','Form')
		Set @XmlSubF = ''			
		select @BSL=min(id) from #xmldata_input Where SUBF = @BFL
		select @ESL=max(id) from #xmldata_input Where SUBF = @BFL

		while(@BSL<=@ESL)	

		BEGIN
			TRUNCATE TABLE #result
			select @subform_field_name=inputfieldvalue from #xmldata_input where id=@BSL
			set @runsql='select * into ##recs from '+ @TblName +
			' where subform_field_name = ''' + @subform_field_name + ''''
			print @runsql
			exec(@runsql)

			SELECT @startid=min(id) FROM ##recs
			SELECT @endid=max(id) FROM ##recs
				
			WHILE(@startid<=@endid)
				
			BEGIN
				
				set @data_xml_output=(
				select * from ##recs
				where id=@startid
				for xml path(''),type
				)
						
				insert into #result
				select @data_xml_output 
									
				update #result
				set xml_output.modify('delete /User_id[.]')
				update #result
				set xml_output.modify('delete /Connid[.]')
				update #result
				set xml_output.modify('delete /Contactid[.]')
				update #result
				set xml_output.modify('delete /Connectionid[.]')
				update #result
				set xml_output.modify('delete /CreatedBy[.]')
				update #result
				set xml_output.modify('delete /CreatedAt[.]')
				update #result
				set xml_output.modify('delete /Id[.]')
				update #result
				set xml_output.modify('delete /subform_field_name[.]')
				update #result
				set xml_output.modify('delete /UpdatedBy[.]')
				update #result
				set xml_output.modify('delete /UpdatedAt[.]')
					
				select @startid=min(id) from ##recs where id>@startid
				
			end
				
			update #result
			set xml_output=cast('<rec_'+cast(id as varchar(10))
			+'>'+cast(xml_output as nvarchar(max))+'</rec_'+cast(id as varchar(10))+'>' as xml)
			
			select @startid=min(id) from #result
			select @endid=max(id) from #result
			set @data_xml_output=''
			while(@startid<=@endid)
				
			begin
				select @xml1 =xml_output from #result where id=@startid
				set @data_xml_output = (SELECT @data_xml_output, @XML1 FOR XML PATH(''))
				
				set @startid=@startid+1
				
			end
				
			--select @data_xml_output for xml path(''), type,root('xml')						
				
			SELECT @data_xml_output = cast('<'+@subform_field_name+'>'
			+cast(@data_xml_output as nvarchar(max))
			+'</'+@subform_field_name+'>' as xml)
			--for xml path(''), type,root('xml')
			
			set @XmlSubF = (SELECT @XmlSubF,@data_xml_output FOR XML PATH(''))

			Drop Table ##recs

			Select @BSL = Min(ID) From #xmldata_input Where ID > @BSL And SUBF = @BFL
		END
		SELECT @XmlSubF = cast('<'+@FormName+'>'+cast(@XmlSubF as nvarchar(max))+'</'+@FormName+'>' as xml)
		SET @XmlMainF = (SELECT @XmlMainF,@XmlSubF FOR XML PATH(''))
		Select @BFL = Min(SubF) From #xmldata_input Where SubF > @BFL

	end

	Set @XmlMainF = (SELECT @XmlMainF  for xml path(''), type,root('xml') )
	Select @XmlMainF As XmLOut
	Drop TABLE #result
	Drop Table #xmldata_input
	SET NOCOUNT OFF

END










