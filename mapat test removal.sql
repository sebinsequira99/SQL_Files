
mapat

usp_clientsearch 136,0,1000,'','','','','','','test','','','',0,''

select * from user_accounts where first_name='lexi'
select * from contact where fname='lexi'
select * from rel_relationship where user_id=9215

delete from user_accounts where user_id in(22607
,9285)

delete from rel_relationship where user_id in(22607
,9285)

delete from contact where contactid in(77091
,80098)

delete from cilist where contactid in(77091
,80098)



delete from user_accounts where user_id in(24542
,16980
,24541
,16477
,24737
,23309)


select * into CW_HistoryDtls_29_09_15 from CW_HistoryDtls


delete from CW_HistoryDtls where cw_userid in(24542
,16980
,24541
,16477
,24737
,23309)


select * into user_passwords_29_09_15 from user_passwords

delete from user_passwords where user_id in(24542
,16980
,24541
,16477
,24737
,23309)

delete from rel_relationship where user_id in(24542
,16980
,24541
,16477
,24737
,23309)

delete from contact where contactid in(
88470
,89676
,69705
,92344
,92345
,93011)

delete from cilist where contactid in(
88470
,89676
,69705
,92344
,92345
,93011)



usp_clientsearch

delete from user_accounts where (first_name='test' or last_name='test') and user_id not in (9215
,13010
,16413
,16980
,24541
,24914)

delete from contact where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549)

delete from CIList where contactid in (select contactid from contact 
where (fname='test' or lname='test' or mname='test')
and contactid not in (76560
,85809
,88341
,89676
,92344
,93549))


user_accounts_28_09_15

delete from rel_relationship where user_id in (select user_id from user_accounts_28_09_15 where (first_name='test' or last_name='test') and user_id not in (9215
,13010
,16413
,16980
,24541
,24914)) and relationshipid not in (88949
,269789
,310362
,88837
,89254
,88553)



delete from user_accounts where (first_name like '%test%' or last_name like '%test%') and user_id not in (9215
,13010
,16413
,16980
,24541
,24914
,2103
,2104	
,5993	
,9371	
,9391	
,9392	
,9412	
,12941	
,16718	
,22640	
,22646	
,22647	
,22703	
,23075	
,23077	
,24376
,16477
,24542
,24471
,24738
,24549)
	

delete from contact where contactid not in(67619
,67620
,71162
,76560
,79964
,80388
,80390
,80583
,85713
,85809
,88341
,88470
,89049
,89676
,80593
,80689
,80690
,81310
,86271
,86346
,91740
,92081
,92344
,92345
,92358
,93013
,93549
,5190	
,5315
,21973
,41075
,41400
,41401
,41402
,41403
,46470
,46915
,46916
,63832
,67617
,67621
,70240
,70810
,71163
,71165
,79353
,80391
,80691
,81105
,82639
,84012
,85949
,86425
,89363
,69411
,69430
,69482
,69525
,69545
,69553
,69554
,69563
,69570
,69580
,69587
,69594
,69642
,69732
,69919
,70229
,80611
,81466
,81467
,81471
,81473
,81475
,82131
,83516
,84725
,85107
,85108
,86528
,88367
,90044
,91866
,91982
,91987
,92337
,92343
,92361
,92363
,92364
,92380
)
and (fname like '%test%' or lname like '%test%' or mname like '%test%')

delete from rel_relationship where user_id in (select user_id from user_accounts_28_09_15 where (first_name like '%test%' or last_name like '%test%') and user_id not in (9215
,13010
,16413
,16980
,24541
,24914
,2103
,2104	
,5993	
,9371	
,9391	
,9392	
,9412	
,12941	
,16718	
,22640	
,22646	
,22647	
,22703	
,23075	
,23077	
,24376
,16477
,24542
,24471
,24738
,24549))
and relationshipid not in 
(269789
,310362
,88837
,89254
,88553
,88949)



delete from user_accounts where user_id in(16413
,21921
,24376
,13010
,13010
,24549
,24471
,24738
,24914)

delete from rel_relationship where user_id in(16413
,21921
,24376
,13010
,13010
,24471
,24738
,24914)

delete from training where user_id=24549

delete from user_passwords where user_id in (24471
,24738
,24914)




delete from contact where contactid in(
85809
,88341
,69561
,91740
,92081
,92358
,93013
,93549)

delete from cilist where contactid in(
85809
,88341
,69561
,91740
,92081
,92358
,93013
,93549)

delete from contact where contactid in(
88367
,81471
,81473
,81475
,81466
,81467
,80611
,85107
,85108)


delete from cilist where contactid in(
88367
,81471
,81473
,81475
,81466
,81467
,80611
,85107
,85108)





select relationshipid from
RelationshipInfo where relationshipid in(select relationshipid from rel_relationship where user_id in (select user_id from user_accounts_28_09_15 where (first_name like '%test%' or last_name like '%test%') and user_id not in (9215
,13010
,16413
,16980
,24541
,24914
,2103
,2104	
,5993	
,9371	
,9391	
,9392	
,9412	
,12941	
,16718	
,22640	
,22646	
,22647	
,22703	
,23075	
,23077	
,24376
,16477
,24542
,24471
,24738
,24549)))




cilist

user_accounts where user_id in (24471
,24738)


select abs(connid),* from user_accounts where first_name='test' or last_name='test' 

select * from contact where contactid in 
(select abs(connid) from user_accounts where first_name='test' or last_name='test') 

select * from rel_relationship where user_id in
(select user_id from user_accounts where first_name='test' or last_name='test') 

select * from rel_relationship where (contactid in
(select contactid from contact where fname='test' or lname='test' or mname='test') 
or contactid2 in
(select contactid from contact where fname='test' or lname='test' or mname='test')) 
and displayname not like '%test%'

contact where fname like '%test%' or lname like '%test%' or mname like '%test%'

contact where contactid in(68156
,68157)

user_accounts where user_id in (9215
,13010
,16413
,16980
,24541
,24914)

select * into contact_28_09_15 from contact
select * into rel_relationship_28_09_15 from rel_relationship
select * into user_accounts_28_09_15 from user_accounts
select * into cilist_28_09_15 from cilist
select * into ContactAddress_28_09_15 from ContactAddress
select * into ContactEmail_28_09_15 from ContactEmail
select * into ContactPhone_28_09_15 from ContactPhone

contactemail
contactphone
contactaddress


select * from information_schema.columns where column_name='contactid'


select * from eventscalendar_registrations				 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RevenueLog								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactAddress							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from rpt_Tbl_CISDemographics					 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptCIListDataAP							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptCIListDataBP							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Insur_ContactInsurance					 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptCIListDataChild						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactAIRS								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptCIListDataInq							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptCIListDataOther						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactActivityMigr						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Med_ContactAXISV							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Med_DiagCollection						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactCulture							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactDeleteLog							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactDocument							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from formmaker_ClearenceDateDetails			 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactEducation							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactEmail								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactEthnicity							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from CaseNotErrorlog							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptRandName								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from MergeItems								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactHospital							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from MiscFile									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactLanguage							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactLetter								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from BusAgency									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactMarraigeHistory					 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactMedGen								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactNationality						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactPhone								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptTest									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from vw_ContactRace							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactPhoto								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactRace								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from CIList									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactReligion							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from EDM										 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactService							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from REL_Relationship_MultiConnect				 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactServiceRequest						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactUrl								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from OpenProgramRoles							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from vwRelationDataMart						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from OpenProgramRolesNew						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from EventDataMart								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from RptContact								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from eventscalendar_registrations_sec			 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from CWTaskTemplate							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Rel_Relationship							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from FPChangeLog								 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from CaseWorkerStageTbl						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from FPLogin									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Stgfrk_project							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ClientSearchLst							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ClientSearchLstOut						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Contact									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from StageTblClientWithoutCW					 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from StageTblCaseWorker						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from AgeRaceStageingTable						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from HagueInvolvedPeople						 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactAgeRaceStageingTable				 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactAccount							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from ContactActivity							 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from StageGroupPhaseStagingTable				 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))
select * from Revenue									 where contactid in (select contactid from contact_28_09_15 where (fname='test' or lname='test' or mname='test') and contactid not in(76560,85809,88341,89676,92344,93549))