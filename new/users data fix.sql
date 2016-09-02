

mapdlnt

select * from rel_relationship where displayname like '%seojoon%'

contact where contactid in(271026,271060)


user_accounts where user_id=328101

rel_relationship where ConnectionId=312651

rel_relationship where contactid=271026 or contactid2=271026

--update user_accounts 
--set connid=-271060
--where user_id=328101

contactairs where contactid=271026
contactairs where contactid=271060
contactairs where ContactAIRSId=-271060

update contactairs
--set ContactAIRSId=-271060
where ContactAIRSId=-271060


user_accounts where user_id in(
327995
,328109)


--select * from MAPSDC		..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPLMI		..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPFAC		..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPECKERD	    ..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPAOI		..user_accounts where connid is null and datejoined>'2016-03-15'

select * from AAIMerge	    ..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPCOW		..user_accounts where connid is null and datejoined>'2016-03-15'
select * from MAPFBA		..user_accounts where connid is null and datejoined>'2016-03-15'

select * from aaimerge..rel_RELATIONSHIP where contactid=25861 or contactid2=25861
select * from aaimerge..rel_RELATIONSHIP where displayname like '%Farrer%'
select * from aaimerge..rel_RELATIONSHIP where user_id=17018
select * from aaimerge..rel_RELATIONSHIP where connectionid=206148
select * from aaimerge..rel_RELATIONSHIP where connid=-25854
select * from aaimerge..user_accounts where user_id=17013
select * from maplmi..user_accounts where username='dianne@drumclog.com'
select * from aaimerge..user_accounts where connid=-25854
select * from aaimerge..user_effectivedate where user_id=17013

select * from aaimerge..rel_RELATIONSHIP where RelationshipDateLastUpdated='2016-03-22'

select * from aaimerge..inquiry_master 
order by updated_date desc

select * from aaimerge..contact
order by contactid desc

select * from aaimerge..contact
where lname='Worrell'
and fname='Raquel'

update aaimerge..contact
set fname='Raquel'
where ContactId=25861

update aaimerge..user_accounts
set connid=-25861
where user_id=17018

update aaimerge..user_effectivedate
set connid=-25861
where user_id=17018

update aaimerge..rel_RELATIONSHIP 
set contactid=25861
,connid=-25861
where RelationshipID=206148

update aaimerge..rel_RELATIONSHIP 
set contactid=25861
where RelationshipID=206150

update aaimerge..rel_RELATIONSHIP 
set relenddate='1900-01-01 00:00:00.000'
where RelationshipID in(206148
,206149)



