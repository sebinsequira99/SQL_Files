USE MAPFACQB_STAGE
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
WHERE UPLOADEDBY >=13433
GO



--46 ROWS

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
WHERE version_id IN( 7143
,7144
,7145
,7146
,7147
,7148
,7149
,7150
,7152
,7153
,7158
,7159
,7160
,7161
,7162
,7163
,7164
,7165
,7166
,7168
,7169
,7170
,7171
,7172
,7173)
AND UPLOADEDBY <13433

--25