

DECLARE 
            @data XML;           
                    
    SET @data='<Data>
                    <Id>89</Id>    
                    <User_ID>8242</User_ID>
                    <LoginUserId>8125</LoginUserId> 
                    <Connid>-1597</Connid>
                    <Connectionid>1047 </Connectionid>
                    <Rel_CustomTemplateId>-317</Rel_CustomTemplateId>
                    <Rel_CustomDataId>0</Rel_CustomDataId>
					<Text1>1</Text1>
					<Text2>Test worker</Text2>
					<Date1>10-08-2016</Date1>
					<Date2>10-07-2016</Date2>
					<Date3>09-28-2016</Date3>
					<Date4>10-09-2016</Date4>
					<Date5>09-13-2016</Date5>
					<Date6>09-01-2016</Date6>
					</Data>'; 
               SET ANSI_NULLS ON SET ANSI_PADDING ON SET QUOTED_IDENTIFIER ON SET ANSI_WARNINGS ON 
			   SET CONCAT_NULL_YIELDS_NULL ON SET ARITHABORT ON SET ANSI_NULL_DFLT_ON ON 
			   EXEC USP_SaveFastFactsData @data;

			   EXEC [UpdateCIListItemData] 
			   194
			   , -1597
			   ,1597
			   ,-317
			   ,'Oct  8 2016 12:00AM','',''
