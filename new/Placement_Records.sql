

IF EXISTS (select 1 from sys.objects where name='Placement_Records' and type='u')
DROP TABLE Placement_Records

CREATE TABLE Placement_Records(
PlacementID int identity(1,1) primary key
,APConnID int
,APConnectionID int
,BPConnID int
,BPConnectionID int
,CConnID int
,CConnectionID int
,AP_C_Date datetime
,BP_C_Date datetime
,AP_BP_Date datetime
,LastUpdatedDate datetime
)
