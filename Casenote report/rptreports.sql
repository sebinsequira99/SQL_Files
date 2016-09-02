

INSERT INTO rptreports
(
 ReportID,
 ReportName,
 DisplayText,
 Description,
 CategoryID,
 ReportPath,
 DeletedYN,
 CreatedBY,
 CreatedDate,
 LastModifiedBy,
 LastModifiedDate,
 ReportType
)

VALUES
(
-50,	
'Casenote Report',	
'Casenote Report',
'Casenote Report',	
-1,	
'/MAPSSRS/CasenoteReport',	
1,	
1,	
getdate(),	
NULL,	
NULL,	
1
)

