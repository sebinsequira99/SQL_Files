

--select * into ContactActivity_180516 from ContactActivity

--update c
--set c.SecureNoteSubTypeId=cc.SecureNoteSubTypeId
--from ContactActivity c
--inner join ContactActivity_180516 cc
--on c.contactactivityid=cc.contactactivityid

--update ContactActivity
--set SecureNoteSubTypeId=case when acttypeid=69 then 17
--								 when acttypeid=67 then 18
--								 when acttypeid=36 then 19			
--								 when acttypeid=60 then 20
--								 when acttypeid=71 then 22
--								 when acttypeid=44 then 23
--								 when acttypeid=43 then 24
--								 else SecureNoteSubTypeId
--						 end

--update ContactActivity
--set acttypeid=case when acttypeid=69 and ActDuration<5 then 91
--								 when acttypeid=69 and ActDuration>=5 then 78
--								 when acttypeid=67 then 78
--								 when acttypeid=36 then 78
--								 when acttypeid=60 and ActDuration<5 then 91
--								 when acttypeid=60 and ActDuration>=5 then 78
--								 when acttypeid=71 then 91
--								 when acttypeid=44 and ActDuration<5 then 91
--								 when acttypeid=44 and ActDuration>=5 then 78
--								 when acttypeid=43 and ActDuration<5 then 91
--								 when acttypeid=43 and ActDuration>=5 then 78
--								 else acttypeid
--						 end
