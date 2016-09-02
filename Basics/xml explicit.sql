

--Generate Sample Data
--FOR XML EXPLICIT requires two meta fields: Tag and Parent
--Tag is the ID of the current element.
--Parent is the ID of the parent element, or NULL for root element.

DECLARE @DataTable as table
   (Tag int NOT NULL
   ,Parent int
   ,xmlValue nvarchar(max)
   ,form_settingsValue nvarchar(max)
   ,form_jsonValue nvarchar(max)
   ,PagesValue nvarchar(max)
   ,PageValue nvarchar(max)
   ,FieldsValue nvarchar(max)
   ,ActiveValue nvarchar(max)
   ,form_rulesValue nvarchar(max))

--Fill with sample data: form_rules Element (2), under xml(1), with no xml value.
INSERT INTO @DataTable
VALUES (2, 1, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(3, 1, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(4, 3, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(5, 4, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(6, 5, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(7, 5, NULL, 1, NULL, NULL, 1, 1, 1, NULL)
	  ,(8, 1, NULL, 1, NULL, NULL, 1, 1, 1, NULL)

--First part of query: Define the XML structure
SELECT
     1 as Tag  --root element
   , NULL as Parent
   , NULL as [xml!1]				 --Assign xml Element to the first element, aka root.
   , NULL as [form_settings!2]       --Assign form_rules Element as a child to xml.
   , NULL as [form_json!3]			 --Assign form_settings Element as a child to xml.
   , NULL as [Pages!4]				 --Assign form_settings Element as a child to xml.
   , NULL as [Page!5]				 --Assign form_settings Element as a child to xml.
   , NULL as [Fields!6]				 --Assign form_settings Element as a child to xml.
   , NULL as [Active!7]				 --Assign form_settings Element as a child to xml.
   , NULL as [form_rules!8]		     --Assign form_settings Element as a child to xml.

--The actual data to fill the XML
UNION
SELECT
     Data.Tag
   , Data.Parent
   , Data.xmlValue
   , Data.form_settingsValue
   , Data.form_jsonValue
   , Data.PagesValue
   , Data.PageValue
   , Data.FieldsValue
   , Data.ActiveValue
   , Data.form_rulesValue
FROM
   @DataTable as Data
FOR XML EXPLICIT