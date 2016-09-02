
mapaddress

mapdev

20447
94802
233
-94802



EXEC MAPAddNewGroup 'MAPDEV', 'syatem', 0, @ContactAIRSId output, @ContactId output

select * from contact where contactid=94852
select * from contactaddress where contactid=94852
select * from contactemail where contactid=94852
select * from contactphone where contactid=94852

select top 10* from contact
order by contactid desc

rel_relationship where contactid=94833
user_accounts where connid=-94803
rel_relationship where user_id=20448

rel_lkp_relationshiptype


select top 10* from user_accounts
order by user_id desc

user_accounts where address1='west'

update u
set u.address1=q.address1
   ,u.address2=q.address2
   ,u.city=q.city
   ,u.state=q.state
   ,u.zipcode=q.zipcode
   ,u.country=q.country
   from user_accounts u
   join query q
   on q.user_id=u.user_id

   select * from user_accounts
   order by user_id

   select * from query
   order by user_id

user_accounts where user_id=20449
rel_relationship where user_id=20449

rel_relationship where connectionid=233

select * from contactaddress where contactid in(select contactid from contact where fname='test')


update
library_systemdata
set data_xml='<xml>
  <sysLibrary>
    <AP1Fname>East</AP1Fname>
    <AP1Lname>North</AP1Lname>
    <AP1Language>ABC_8234682</AP1Language>
    <AP1Add1>Test</AP1Add1>
    <AP1Add2>Test</AP1Add2>
    <AP1BirthCity>xxx</AP1BirthCity>
    <AP1BirthState>Mississippi</AP1BirthState>
    <AP1Zip>45756</AP1Zip>
    <AP1Country>Bahamas</AP1Country>
    <AP1Email>hgfhf@gfh.jk</AP1Email>
    <AP1CellPhone>5353525545</AP1CellPhone>
    <AP1BirthCountry>Bahamas</AP1BirthCountry>
    <AgencyUserID>257</AgencyUserID>
  </sysLibrary>
</xml>'
where id=269


select * from mapsystemdata order by user_id

select distinct user_id from mapsystemdata

mapformdata

user_accounts where connid=-75554
9018

user_accounts where connid is null
19835

rel_relationship where user_id=9018

insert into library_systemdata(
Form_ID
,User_ID
,ConnectionID
,ConnID
,data_xml
,created_by
)
values(
12
,19835
,null
,null
,'<xml>
  <sysLibrary>
    <AP1Fname>test</AP1Fname>
    <AP1Lname>ss</AP1Lname>
    <AP2Fname>ss</AP2Fname>
    <AP2Lname>test</AP2Lname>
    <AP1Email>ss@test.com</AP1Email>
	<Add1>testss</Add1>
    <State>12</State>
	<AP1CellPhone>011-222-3213</AP1CellPhone>
  </sysLibrary>
</xml>'
,1
)

update library_systemdata
set data_xml='<xml>
  <sysLibrary>
    <AP1Fname>test</AP1Fname>
    <AP1Lname>ss</AP1Lname>
    <AP2Fname>ss</AP2Fname>
    <AP2Lname>test</AP2Lname>
    <AP1Email>ss@testss.com</AP1Email>
	<Add1>testss</Add1>
    <State>12</State>
	<AP1CellPhone>333-222-3213</AP1CellPhone>
  </sysLibrary>
</xml>'
where user_id=9018


