

use rolesqa

select * from user_agencies

Create table Missinglibraryfields_11_06_15
(
LFN varchar(max)
,Field_ID int
)

INSERT INTO Missinglibraryfields_11_06_15(LFN,Field_ID)

SELECT DISTINCT SUBSTRING(library_field_name,Charindex('_',library_field_name)+1,LEN(library_field_name)) AS LFN,Field_ID 
FROM formmaker_fields where use_library=1 and page_id>0
AND  ISNUMERIC(SUBSTRING(library_field_name,Charindex('_',library_field_name)+1,LEN(library_field_name)))=1  
AND SUBSTRING(library_field_name,Charindex('_',library_field_name)+1,LEN(library_field_name)) NOT IN (
SELECT CIListTemplateItemId FROM CILISTTemplateItem)

SELECT DISTINCT 'formmaker_'+F.Formname as formname,f.form_id FROM Formmaker_Properties F 
 INNER JOIN Formmaker_Pages P ON P.Form_id=F.Form_id
 INNER JOIN  formmaker_fields FF ON FF.Page_id=P.Page_id
 INNER JOIN Missinglibraryfields_11_06_15 ms ON MS.field_id = ff.field_id


select * from user_agencies
select * from irriscentral..lutprimaryagency where mapdbname=db_name()

select page_id from formmaker_fields where field_id=144103

select form_id from Formmaker_Pages where page_id=6210

select form_id,formname from Formmaker_Properties where form_id=2589

Missinglibraryfields_11_06_15

use AAIMERGE 28
use MAPABI	 39
use MAPAT	 25
use MAPCCD   81
use MAPGoL   34
use MAPifi   76
use MAPLMI   30
use MAPLSSMT 66
use MAPMAPSW 170
use MAPPAA   215
use MAPS     170

select * from user_agencies
select * from irriscentral..lutprimaryagency where mapdbname=db_name()





use MAPGoL
