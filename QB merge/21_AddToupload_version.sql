USE MAPFCAD_TEST
GO

/******************************************Add column OLDversion_id ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDversion_id' AND Object_ID = Object_ID(N'upload_version'))    
BEGIN
ALTER TABLE upload_version
ADD OLDversion_id INT
END
GO
/********************************************************************************************************************/
INSERT INTO upload_version
(
filename
,versionname
,dateposted
,uploadedby
,OLDversion_id
)
SELECT filename
,versionname
,dateposted
,(uploadedby +100000)
,version_id
FROM MAPFAC.DBO.upload_version


