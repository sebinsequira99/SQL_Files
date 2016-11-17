

rolesqa

DECLARE 
            @data XML;           
                    
    SET @data='<Data>
                    <Id>0</Id>    
                    <User_ID>80140</User_ID>
                    <LoginUserId>8125</LoginUserId> 
                    <Connid>-103750</Connid>
                    <Connectionid>355355 </Connectionid>
                    <Rel_CustomTemplateId>-317</Rel_CustomTemplateId>
                    <Rel_CustomDataId>0</Rel_CustomDataId>
					<Date1>11-17-2016</Date1>
					<CIListTemplateItemId_1>-483</CIListTemplateItemId_1>
					<Date2>11-17-2016</Date2>
					<CIListTemplateItemId_2>-484</CIListTemplateItemId_2>
					<Date3>11-17-2016</Date3>
					<CIListTemplateItemId_3>-485</CIListTemplateItemId_3>
					<Date4>11-17-2016</Date4>
					<CIListTemplateItemId_4>-488</CIListTemplateItemId_4>
					<Date5>11-17-2016</Date5>
					<CIListTemplateItemId_5>-489</CIListTemplateItemId_5>
					</Data>'; 
SET ANSI_NULLS ON SET ANSI_PADDING ON SET QUOTED_IDENTIFIER ON 
SET ANSI_WARNINGS ON SET CONCAT_NULL_YIELDS_NULL ON SET ARITHABORT ON 
SET ANSI_NULL_DFLT_ON ON EXEC USP_SaveFastFactsData @data;

SELECT TOP 1 Date1
FROM FastFactData 
WHERE Connid =-103750 and Connectionid =  355355 
ORDER BY ID DESC

fastfactdata where User_ID=80140
cilist where contactid=103750
cilistitem where CIListId=75984

CIListTemplate where CIListTemplateId=-317
CIListTemplateItem where CIListTemplateItemId=-483

CIListTemplate where CIListTemplateId in (-100
,0)


