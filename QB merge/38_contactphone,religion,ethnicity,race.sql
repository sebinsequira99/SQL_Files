

mapfcs

contactphone--409
mapfac_old_test..contactphone--14613
mapfc_old_test..contactphone--365
lkpPhoneType
mapfac_old_test..lkpPhoneType
mapfc_old_test..lkpPhoneType

--insert into lkpPhoneType
--(PhoneType
--,PhoneSequence)
--select PhoneType
--,PhoneSequence from mapfac_old_test..lkpPhoneType
--where PhoneTypeID in(
--5
--,6)

--SET IDENTITY_INSERT ContactPhone ON
--GO

--INSERT INTO ContactPhone
--(
--ContactPhoneID
--,ContactID
--,PhoneTypeID
--,PrimaryPhone
--,PhoneNumber
--,Ext
--,OldContactId
--)
--SELECT (ContactPhoneID + 100000)
--,(ContactID + 100000)
--,case when PhoneTypeID=5
--then 6
--when PhoneTypeID=6
--then 7
--else PhoneTypeID
--end
--,PrimaryPhone
--,PhoneNumber
--,Ext
--,ContactId
-- FROM MAPFAC_OLD_TEST.DBO.ContactPhone
-- where ContactId + 100000 in(select contactid from MAPFCS.DBO.CONTACT)
-- go
 
--SET IDENTITY_INSERT ContactPhone OFF

contactethnicity--0
mapfac_old_test..contactethnicity--450
mapfc_old_test..contactethnicity--0
lkpethnicity
mapfac_old_test..lkpethnicity
mapfc_old_test..lkpethnicity

--SET IDENTITY_INSERT lkpethnicity ON

--insert into lkpethnicity(EthnicityId
--,EthnicityTypeText)
--select EthnicityId
--,EthnicityTypeText
--from mapfac_old_test..lkpethnicity

--SET IDENTITY_INSERT lkpethnicity OFF

--insert into lkpethnicity(
--EthnicityTypeText)
--select EthnicityTypeText
--from mapfc_old_test..lkpethnicity

--SET IDENTITY_INSERT ContactEthnicity ON
--GO

--INSERT INTO ContactEthnicity
--(
--ContactEthnicityId
--,ContactId
--,EthnicityId
--,OldContactId
--)
--SELECT ContactEthnicityId + 100000
--,(ContactId + 100000)
--,EthnicityId
--,ContactId
-- FROM MAPFAC_OLD_TEST.DBO.ContactEthnicity
-- where ContactId + 100000 in(select contactid from MAPFCS.DBO.CONTACT)
-- go

--SET IDENTITY_INSERT ContactEthnicity OFF

contactreligion--0
mapfac_old_test..contactreligion--1043
mapfc_old_test..contactreligion--0
lkpreligion
mapfac_old_test..lkpreligion
mapfc_old_test..lkpreligion

--insert into lkpreligion(
--ReligionText)
--select ReligionText
--from mapfac_old_test..lkpreligion
--where religionid=19

--insert into contactreligion(
--ContactID
--,ReligionId
--,OldContactId)
--select ContactID+100000
--,ReligionId
--,ContactID
--from mapfac_old_test..contactreligion

contactrace--0
mapfac_old_test..contactrace--1653
mapfc_old_test..contactrace--0
lkprace
mapfac_old_test..lkprace
mapfc_old_test..lkprace

--insert into lkprace(RaceText)
--select RaceText 
--from mapfac_old_test..lkprace 
--where raceid in(
--1
--,5
--,7
--,8)

--insert into contactrace(
--ContactId
--,RaceID
--,OldContactId)
--select ContactId+100000
--,case when RaceID=1 then 20
--when RaceID=5 then 21
--when RaceID=7 then 22
--when RaceID=8 then 23
--else RaceID
--end
--,ContactId
--from mapfac_old_test..contactrace

--update contactrace
--set RaceID=3
--where RaceID=2 and contactid>100000

--update contactrace
--set RaceID=4
--where RaceID=3 and contactid>100000

--update contactrace
--set RaceID=5
--where RaceID=4 and contactid>100000




