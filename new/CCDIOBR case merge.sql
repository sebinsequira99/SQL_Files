

mapccdiobr

--update rel_relationship
--set ContactId2=1560
--,ConnId=11595
--,ContactId=3224
--,user_id=8575
--where RelationshipID in(16278,4714)

--update user_effectivedate 
--set user_id=8575
--,connid=-3224
--where user_id in(8211
--,8672)

--delete from  user_effectivedate 
--where EffectiveDateId=677

--update CaseWorkerActivityLog 
--set connid=-3224
--where ConnId in(-1561,-3463)

--update ContactActivity 
--set connid=-3224
--,contactid=3224
--where ConnId in(-1561,-3463)

--update MiscFile 
--set connid=-3224
--where ConnId in(-1561,-3463)

--update caseworker_client 
--set ClientConnId=-3224
--,parentid=8575
--where ClientConnId in(-1561,-3463)

--update ConnectionStatusLog 
--set ConnId=-3224
--where ConnId in(-1561,-3463)

--update FastFactData 
--set ConnId=-3224
--,user_id=8575
--where ConnId in(-1561,-3463)

--update CW_HistoryDtls 
--set ConnId=-3224
--where ConnId in(-1561,-3463)

--update upload 
--set ConnId=-3224
--,user_id=8575
--where ConnId in(-1561,-3463)

--update ContactActivity 
--set contactid=3224
--where contactid in(1561,3463)

--update CIList
--set contactid=3224
--where ContactId in(1561,3463)

--update MiscFile
--set contactid=3224
--where ContactId in(1561,3463)




