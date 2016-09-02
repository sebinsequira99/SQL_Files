

UPDATE a
SET a.CaseNumber=STUFF((SELECT distinct ',' + r.rellabel
							  FROM rel_relationship r
							  WHERE a.userid = r.user_id and r.connid>0
							  FOR XML PATH('')
							  ,TYPE).value('.', 'NVARCHAR(MAX)')
							  ,1,1,'')
FROM #answers a