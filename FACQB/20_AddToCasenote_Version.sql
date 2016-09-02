USE MAPFACQB_STAGE
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'casenote_version'))    
BEGIN
ALTER TABLE casenote_version
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

INSERT INTO casenote_version
(
case_note_id
,agency_id
,case_note_content
,updated_by
,updated_dttm
,created_dttm
,filename
,dup_filename
,fileid
,casenote_subject
,ImportFlag
)
SELECT case_note_id
,agency_id
,case_note_content
,updated_by
,updated_dttm
,created_dttm
,filename
,dup_filename
,fileid
,casenote_subject
,'Y'
FROM MAPFAC.DBO.casenote_version
WHERE case_unique in (968
,969
,970
,971
,972
,973
,974
,975
,976
,977
,978
,979
,980
,981
,982
,983
,984
,985
,986
,987
,988
,989
,990
,991
,992
,993
,994
,995
,996
,997
,998
,999
,1000
,1001
,1002
,1003
,1004
,1005
,1006
,1007
,1008
,1009
,1010
,1011
,1012
,1013
,1014
,1015
,1016
,1017
,1018
,1019
,1020
,1021
,1022
,1023
,1024
,1025
,1026
,1027
,1028
,1029)

--62 rows
