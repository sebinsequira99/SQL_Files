

USE IRRISCENTRAL

INSERT INTO rptReportMaster(
							ReportName,
							DisplayText,
							Description,
							ReportPath,
							CategoryID,
							DeletedYN,
							CreatedBY,
							CreatedDate)

SELECT 'Active Clients','Active Clients','Active Clients','/MAPSSRS/ActiveClients',-1,0,1,GETDATE()
union
SELECT 'Placement Report','Placement Report','Placement Report','/MAPSSRS/PlacementReport',-1,0,1,GETDATE()
union
SELECT 'Adoption Duration','Adoption Duration','Adoption Duration','/MAPSSRS/AdoptionDuration',-1,0,1,GETDATE()


USE MAPLMI

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
-54,	
'Adoption Duration',	
'Adoption Duration',
'Adoption Duration',	
-1,	
'/MAPSSRS/AdoptionDuration',	
0,	
1,	
getdate(),	
NULL,	
NULL,	
1
)

