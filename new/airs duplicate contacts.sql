

lh


21945

select * from ContactAddress where contactid=22013
select * from ContactAddress where contactid=21945

update ContactAddress
set ContactId=21945
where AddressId=15534

select * from ContactAIRS where contactid=22013
select * from ContactAIRS where contactid=21945

update ContactAIRS
set ContactId=21945
where ContactId=22013

delete from ContactAIRS where ContactAIRSId=-22013

select * from ContactEmail where contactid=22013
select * from ContactEmail where contactid=21945

select * from ContactPhone where contactid=22013
select * from ContactPhone where contactid=21945

select * from Contact where contactid=22013
select * from Contact where contactid=21945

delete from Contact where contactid=22013

21992

select * from ContactAddress where contactid=21992
select * from ContactAddress where contactid=22038

update ContactAddress
set ContactId=21992
where AddressId=15569

select * from ContactAIRS where contactid=21992
select * from ContactAIRS where contactid=22038

update ContactAIRS
set ContactId=21992
where ContactId=22038

delete from ContactAIRS where ContactAIRSId=-22038

select * from ContactEmail where contactid=21992
select * from ContactEmail where contactid=22038

select * from Contact where contactid=21992
select * from Contact where contactid=22038

delete from Contact where contactid=22038

540

select * from ContactAIRS where contactid=540
select * from ContactAIRS where contactid=21926

delete from ContactAIRS where contactid=21926

select * from ContactEducation where contactid=540
select * from ContactEducation where contactid=21926

update ContactEducation
set ContactId=540
where ContactEducationID=1735

select * from ContactEmail where contactid=540
select * from ContactEmail where contactid=21926

select * from ContactMedGen where contactid=540
select * from ContactMedGen where contactid=21926

update ContactMedGen
set ContactId=540
where ContactMedGenId in(
5049
,5050
,5051
,5053)

select * from ContactMarraigeHistory where contactid=540
select * from ContactMarraigeHistory where contactid=21926
 
update ContactMarraigeHistory
set ContactId=540
where ContactMarraigeId in(
1823
,1824)

select * from ContactPhone where contactid=540
select * from ContactPhone where contactid=21926

update ContactPhone
set ContactId=540
where ContactPhoneID=10738

select * from RptCIListDataAP where contactid=540
select * from RptCIListDataAP where contactid=21924

delete from RptCIListDataAP where contactid=21924

select * from RptCIListDataBP where contactid=540
select * from RptCIListDataBP where contactid=21924

delete from RptCIListDataBP where contactid=21924

select * from RptCIListDataChild where contactid=540
select * from RptCIListDataChild where contactid=21924

delete from RptCIListDataChild where contactid=21924

select * from CIList where contactid=540
select * from CIList where contactid=21924

update CIList
set contactid=540
where CIListId=2899

update CIList
set ContactAirsID=291
where CIListId=2899

select * from RptCIListDataInq where contactid=540
select * from RptCIListDataInq where contactid=21924

delete from RptCIListDataInq where contactid=21924

select * from RptCIListDataOther where contactid=540
select * from RptCIListDataOther where contactid=21924

delete from RptCIListDataOther where contactid=21924

select * from ContactAIRS where contactid=540
select * from ContactAIRS where contactid=21924

delete from ContactAIRS where contactid=21924

select * from ContactEmail where contactid=540
select * from ContactEmail where contactid=21924

delete from ContactEmail where contactid=21924

select * from Contact where contactid=540
select * from Contact where contactid=21926

delete from Contact where contactid=21926

select * from Contact where contactid=540
select * from Contact where contactid=21924

delete from Contact where contactid=21924

22374

select * from ContactRace where contactid=3310
select * from ContactRace where contactid=22374

update ContactRace
set ContactId=22374
where ContactRaceId=660

select * from ContactReligion where contactid=3310
select * from ContactReligion where contactid=22374

update ContactReligion
set ContactId=22374
where ContactReligionID=284

select * from ContactAddress where contactid=3310
select * from ContactAddress where contactid=22374

update ContactAddress
set ContactId=22374
where AddressId in(
2579
,3529)

select * from ContactAIRS where contactid=3310
select * from ContactAIRS where contactid=22374

update ContactAIRS
set ContactId=22374
where ContactId=3310

delete from ContactAIRS where ContactAIRSId=-3310

select * from ContactEducation where contactid=3310
select * from ContactEducation where contactid=22374

update ContactEducation
set ContactId=22374
where ContactEducationID=681

select * from ContactEmail where contactid=3310
select * from ContactEmail where contactid=22374

update ContactEmail
set ContactId=22374
where ContactEmailID=3950

select * from ContactEthnicity where contactid=3310
select * from ContactEthnicity where contactid=22374

update ContactEthnicity
set ContactId=22374
where ContactEthnicityId=513

select * from ContactLanguage where contactid=3310
select * from ContactLanguage where contactid=22374

update ContactLanguage
set ContactId=22374
where ContactLanguageId=569

select * from ContactMarraigeHistory where contactid=3310
select * from ContactMarraigeHistory where contactid=22374

update ContactMarraigeHistory
set ContactId=22374
where ContactMarraigeId=715

select * from ContactNationality where contactid=3310
select * from ContactNationality where contactid=22374

update ContactNationality
set ContactId=22374
where ContactNationalityId=623

select * from ContactPhone where contactid=3310
select * from ContactPhone where contactid=22374

update ContactPhone
set ContactId=22374
where ContactPhoneID=3356

select * from Contact where contactid=3310
select * from Contact where contactid=22374

update Contact
set BirthDate='1963-02-16 00:00:00.000'
,SSN='117-60-0975'
,MName='Grace'
where contactid=22374

delete from Contact where contactid=3310

549

select * from Staff_5CI where contactid=549
select * from Staff_5CI where contactid=22602

update Staff_5CI
set ContactId=549
where Staff_5CIId=34

select * from ContactEmployment where contactid=549
select * from ContactEmployment where contactid=22602

update ContactEmployment	--error
set ContactId=549
where ContactEmploymentID=11189

select * from Staff where contactid=549
select * from Staff where contactid=22602

select * from RptCIListDataAP where contactid=549
select * from RptCIListDataAP where contactid=22602

delete from RptCIListDataAP where contactid=22602

select * from RptCIListDataBP where contactid=549
select * from RptCIListDataBP where contactid=22602

delete from RptCIListDataBP where contactid=22602

select * from RptCIListDataChild where contactid=549
select * from RptCIListDataChild where contactid=22602

delete from RptCIListDataChild where contactid=22602

select * from CIList where contactid=549
select * from CIList where contactid=22602

update CIList
set ContactId=549
where CIListId in(
2873
,2874)

select * from RptCIListDataInq where contactid=549
select * from RptCIListDataInq where contactid=22602

delete from RptCIListDataInq where contactid=22602

select * from RptCIListDataOther where contactid=549
select * from RptCIListDataOther where contactid=22602

delete from RptCIListDataOther where contactid=22602

select * from ContactAIRS where contactid=549
select * from ContactAIRS where contactid=22602

delete from ContactAIRS where contactid=22602

select * from Staff_5CI where contactid=549
select * from Staff_5CI where contactid=22603

update Staff_5CI
set ContactId=549
where Staff_5CIId=35

select * from ContactEmployment where contactid=549
select * from ContactEmployment where contactid=22603

update ContactEmployment --error
set ContactId=549
where ContactEmploymentID=11191

select * from Staff where contactid=549
select * from Staff where contactid=22603

select * from RptCIListDataAP where contactid=549
select * from RptCIListDataAP where contactid=22603

delete from RptCIListDataAP where contactid=22603

select * from RptCIListDataBP where contactid=549
select * from RptCIListDataBP where contactid=22603

delete from RptCIListDataBP where contactid=22603

select * from RptCIListDataChild where contactid=549
select * from RptCIListDataChild where contactid=22603

delete from RptCIListDataChild where contactid=22603

select * from CIList where contactid=549
select * from CIList where contactid=22603

update CIList
set ContactId=549
where CIListId in(
2875
,2876)

select * from RptCIListDataInq where contactid=549
select * from RptCIListDataInq where contactid=22603

delete from RptCIListDataInq where contactid=22603

select * from RptCIListDataOther where contactid=549
select * from RptCIListDataOther where contactid=22603

delete from RptCIListDataOther where contactid=22603

select * from ContactAIRS where contactid=549
select * from ContactAIRS where contactid=22603

delete from ContactAIRS where contactid=22603

select * from Contact where contactid=549
select * from Contact where contactid=22603

delete from Contact where contactid=22603

select * from Contact where contactid=549
select * from Contact where contactid=22602

delete from Contact where contactid=22602

548

select * from Staff_5CI where contactid=548
select * from Staff_5CI where contactid=19626

update Staff_5CI
set ContactId=548
where Staff_5CIId=17

select * from ContactEmployment where contactid=548
select * from ContactEmployment where contactid=19626

update ContactEmployment --error
set ContactId=548
where ContactEmploymentID=8077

select * from Staff where contactid=548
select * from Staff where contactid=19626

select * from RptCIListDataAP where contactid=548
select * from RptCIListDataAP where contactid=19626

delete from RptCIListDataAP where contactid=19626

select * from RptCIListDataBP where contactid=548
select * from RptCIListDataBP where contactid=19626

delete from RptCIListDataBP where contactid=19626

select * from RptCIListDataChild where contactid=548
select * from RptCIListDataChild where contactid=19626

delete from RptCIListDataChild where contactid=19626

select * from CIList where contactid=548
select * from CIList where contactid=19626

update CIList
set ContactId=548
where CIListId in(
2705
,2706)

select * from RptCIListDataInq where contactid=548
select * from RptCIListDataInq where contactid=19626

delete from RptCIListDataInq where contactid=19626

select * from RptCIListDataOther where contactid=548
select * from RptCIListDataOther where contactid=19626

delete from RptCIListDataOther where contactid=19626

select * from ContactAIRS where contactid=548
select * from ContactAIRS where contactid=19626

delete from ContactAIRS where contactid=19626

select * from ContactEmail where contactid=548
select * from ContactEmail where contactid=19626

update ContactEmail
set ContactId=548
where ContactEmailID=5331

select * from RptCIListData where contactid=548
select * from RptCIListData where contactid=19626

delete from RptCIListData where contactid=19626

select * from Contact where contactid=548
select * from Contact where contactid=19626

delete from Contact where contactid=19626

542

select * from ContactAddress where contactid=542
select * from ContactAddress where contactid=22015

update ContactAddress
set ContactId=542
where AddressId=15536

select * from ContactAIRS where contactid=542
select * from ContactAIRS where contactid=22015

delete from ContactAIRS where contactid=22015

select * from ContactEmail where contactid=542
select * from ContactEmail where contactid=22015

delete from ContactEmail where contactid=22015

select * from Contact where contactid=542
select * from Contact where contactid=22015

delete from Contact where contactid=22015
