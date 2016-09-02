USE MAPFACQB_STAGE
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'Casenote_file_versions'))    
BEGIN
ALTER TABLE Casenote_file_versions
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

INSERT INTO Casenote_file_versions
(
Caseversion_id
,ContactActivityId
,Miscfile_id
,created_dttm
,updated_dttm
,ImportFlag
)

SELECT Caseversion_id
,ContactActivityId
,Miscfile_id
,created_dttm
,updated_dttm
,'Y'
FROM MAPFAC.DBO.Casenote_file_versions 
where File_version_id in (298
,335
,327
,312
,331
,271
,304
,318
,305
,301
,283
,316
,292
,323
,321
,290
,329
,313
,281
,274
,272
,295
,326
,289
,275
,277
,317
,334
,307
,285
,297
,333
,328
,324
,287
,291
,322
,273
,315
,300
,311
,320
,325
,279
,299
,314
,280
,278
,330
,294
,302
,282
,310
,319
,284
,288
,303
,296
,276
,306
,286
,332
,308
,309
,293)
GO
--65
INSERT INTO Casenote_file_versions
(
Caseversion_id
,ContactActivityId
,Miscfile_id
,created_dttm
,updated_dttm
,ImportFlag
)

SELECT CV.Caseversion_id
,CA.ContactActivityId
,MF.Miscfileid
,CV.created_dttm
,CV.updated_dttm
,'Y'
 FROM MAPFAC.DBO.Casenote_file_versions CV
JOIN ContactActivity CA
ON CA.OLDContactActivityId = CV.ContactActivityId
JOIN MISCFILE MF
ON MF.OLDMISCFILEID = CV.MISCFILE_ID
GO


--26 ROWS 

