DISABLE TRIGGER [UpdateRelContactIds] ON [dbo].[Rel_Relationship]
GO


SELECT distinct RELATIONSHIPID,RELATIONSHIPTYPEID,CONNECTIONID
INTO #APTEMP
FROM REL_RELATIONSHIP 
WHERE CONNECTIONID IN (SELECT CONNECTIONID FROM rel_relationship WHERE relationshiptypeid = -104 AND APID IS NULL)
AND RELATIONSHIPTYPEID = -101

SELECT distinct RELATIONSHIPID,RELATIONSHIPTYPEID,CONNECTIONID
INTO #BMTEMP
FROM REL_RELATIONSHIP 
WHERE CONNECTIONID IN (SELECT CONNECTIONID FROM rel_relationship WHERE relationshiptypeid = -104 AND BMID IS NULL)
AND RELATIONSHIPTYPEID = -102

SELECT  CONNECTIONID, Count(CONNECTIONID) AS COUNTCON
INTO #TEMP1
FROM #APTEMP
GROUP BY CONNECTIONID
HAVING  Count(CONNECTIONID) > 1

SELECT  CONNECTIONID, Count(CONNECTIONID) AS COUNTCON
INTO #TEMP2
FROM #BMTEMP
GROUP BY CONNECTIONID
HAVING  Count(CONNECTIONID) > 1

--for only one AP for a connectionid 
UPDATE  R
SET R.APID = A.RELATIONSHIPID 
,R.APflag = 1
FROM REL_RELATIONSHIP R
JOIN #APTEMP A
ON R.CONNECTIONID = A.CONNECTIONID
WHERE A.CONNECTIONID NOT IN (
SELECT  CONNECTIONID  FROM #TEMP1 WHERE COUNTCON <>1)
and r.relationshiptypeid = -104
and r.apid is null

--for only one BM for a connectionid 
UPDATE  R
SET R.BMID = A.RELATIONSHIPID 
,R.BPflag = 1
FROM REL_RELATIONSHIP R
JOIN #BMTEMP A
ON R.CONNECTIONID = A.CONNECTIONID
WHERE A.CONNECTIONID NOT IN (
SELECT  CONNECTIONID  FROM #TEMP2 WHERE COUNTCON <>1)
and r.relationshiptypeid = -104
and r.BMID is null


--for multiple AP for a connectionid 
UPDATE R
SET R.APID = A.RELATIONSHIPID
,R.APflag = 1
FROM REL_RELATIONSHIP R
INNER JOIN (SELECT MAX(RELATIONSHIPID) RELATIONSHIPID,CONNECTIONID
FROM REL_RELATIONSHIP 
WHERE CONNECTIONID IN (SELECT CONNECTIONID  FROM #TEMP1 WHERE COUNTCON <>1)
AND (RELENDDATE IS NULL OR RELENDDATE = '1900-01-01 00:00:00.000')
AND RELATIONSHIPTYPEID = -101
GROUP BY CONNECTIONID)A
ON R.CONNECTIONID = A.CONNECTIONID
WHERE r.relationshiptypeid = -104
and r.apid is null

--for multiple BM for a connectionid 
UPDATE R
SET R.BMID = A.RELATIONSHIPID
,R.BPflag = 1
FROM REL_RELATIONSHIP R
INNER JOIN (SELECT MAX(RELATIONSHIPID) RELATIONSHIPID,CONNECTIONID
FROM REL_RELATIONSHIP 
WHERE CONNECTIONID IN (SELECT CONNECTIONID  FROM #TEMP2 WHERE COUNTCON <>1)
AND (RELENDDATE IS NULL OR RELENDDATE = '1900-01-01 00:00:00.000')
AND RELATIONSHIPTYPEID = -102
GROUP BY CONNECTIONID)A
ON R.CONNECTIONID = A.CONNECTIONID
WHERE R.RELATIONSHIPTYPEID = -104
AND R.BMID is null

drop table #APTEMP
drop table #BMTEMP
drop table #TEMP1
drop table #TEMP2
GO

ENABLE TRIGGER [UpdateRelContactIds] ON [dbo].[Rel_Relationship]
GO