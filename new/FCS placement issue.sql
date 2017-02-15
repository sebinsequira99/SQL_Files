

mapfcs

rel_relationship where displayname like '%nicholas%jennie%'

rel_relationship where displayname like '%Parks%Christopher%'

rel_relationship where connectionid in(
1889
,2025)

rel_placementtrack where connectionid in(
1889
,2025)

--update rel_placementtrack
--set ParentConnID=1885
--,ConnectionID=1889
--where PlacementTrackID=1330

--update rel_relationship 
--set ConnectionID=1889
--,APID=1889
--where RelationshipID=2025

--update rel_relationship 
--set ConnectionID=223928
--where RelationshipID=223928