

rolesqa
DECLARE 
            @data XML;           
                    
    SET @data='<Data>
                    <Id>0</Id>    
                    <User_ID>80029</User_ID>
                    <LoginUserId>8125</LoginUserId> 
                    <Connid>-103634</Connid>
                    <Connectionid>127517 </Connectionid>
                    <Rel_CustomTemplateId>-317</Rel_CustomTemplateId>
                    <Rel_CustomDataId>0</Rel_CustomDataId>
					<Date1>11-01-2016</Date1>
					<CIListTemplateItemId_1>-483</CIListTemplateItemId_1>
					</Data>'; 
               SET ANSI_NULLS ON SET ANSI_PADDING ON SET QUOTED_IDENTIFIER ON SET ANSI_WARNINGS ON 
			   SET CONCAT_NULL_YIELDS_NULL ON SET ARITHABORT ON SET ANSI_NULL_DFLT_ON ON 
			   EXEC USP_SaveFastFactsData @data;

SELECT TOP 1 Date1
FROM FastFactData 
WHERE Connid =-103634 and Connectionid =  355355 
ORDER BY ID DESC

fastfactdata where User_ID=80029
cilist where contactid=103634
cilistitem where CIListId=75991

CIListTemplate where CIListTemplateId=-317
CIListTemplateItem where CIListTemplateItemId=-483

CIListTemplate where CIListTemplateId in (-100
,0)


