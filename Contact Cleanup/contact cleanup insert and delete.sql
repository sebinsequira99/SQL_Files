
 
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactEthnicity',(select count(1) from ContactEthnicity) from ContactEthnicity
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactEthnicity from ContactEthnicity
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactEthnicity where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactEthnicity) where table_name='ContactEthnicity'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptRandName',(select count(1) from RptRandName) from RptRandName
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptRandName from RptRandName
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptRandName where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptRandName) where table_name='RptRandName'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select contactid,(select agency_id from user_agencies),db_name(),'CaseNotErrorlog',(select count(1) from CaseNotErrorlog) from CaseNotErrorlog
		where contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CaseNotErrorlog from CaseNotErrorlog
		where contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CaseNotErrorlog where contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CaseNotErrorlog) where table_name='CaseNotErrorlog'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'eventscalendar_registrations',(select count(1) from eventscalendar_registrations) from eventscalendar_registrations
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.eventscalendar_registrations from eventscalendar_registrations
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.eventscalendar_registrations where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from eventscalendar_registrations) where table_name='eventscalendar_registrations'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactId,(select agency_id from user_agencies),db_name(),'vw_RelationView',(select count(1) from vw_RelationView) from vw_RelationView
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		--select * into ContactCleanup.dbo.vw_RelationView from vw_RelationView
		--where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vw_RelationView where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vw_RelationView) where table_name='vw_RelationView'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactId2,(select agency_id from user_agencies),db_name(),'vw_RelationView',(select count(1) from vw_RelationView) from vw_RelationView
	--	where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.vw_RelationView from vw_RelationView
	--	where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vw_RelationView where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vw_RelationView) where table_name='vw_RelationView'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactHospital',(select count(1) from ContactHospital) from ContactHospital
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactHospital from ContactHospital
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactHospital where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactHospital) where table_name='ContactHospital'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AIRSContactId,(select agency_id from user_agencies),db_name(),'eventscalendar_registrations_sec',(select count(1) from eventscalendar_registrations_sec) from eventscalendar_registrations_sec
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.eventscalendar_registrations_sec from eventscalendar_registrations_sec
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.eventscalendar_registrations_sec where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from eventscalendar_registrations_sec) where table_name='eventscalendar_registrations_sec'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'eventscalendar_registrations_sec',(select count(1) from eventscalendar_registrations_sec) from eventscalendar_registrations_sec
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.eventscalendar_registrations_sec from eventscalendar_registrations_sec
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.eventscalendar_registrations_sec where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from eventscalendar_registrations_sec) where table_name='eventscalendar_registrations_sec'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactLanguage',(select count(1) from ContactLanguage) from ContactLanguage
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactLanguage from ContactLanguage
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactLanguage where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactLanguage) where table_name='ContactLanguage'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'TempNameInfo',(select count(1) from TempNameInfo) from TempNameInfo
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.TempNameInfo from TempNameInfo
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.TempNameInfo where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from TempNameInfo) where table_name='TempNameInfo'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactLetter',(select count(1) from ContactLetter) from ContactLetter
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactLetter from ContactLetter
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactLetter where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactLetter) where table_name='ContactLetter'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MainAgencyContactId,(select agency_id from user_agencies),db_name(),'AIRSSystem',(select count(1) from AIRSSystem) from AIRSSystem
		where MainAgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.AIRSSystem from AIRSSystem
		where MainAgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.AIRSSystem where MainAgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from AIRSSystem) where table_name='AIRSSystem'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'BusAgency',(select count(1) from BusAgency) from BusAgency
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.BusAgency from BusAgency
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.BusAgency where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from BusAgency) where table_name='BusAgency'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'formmaker_ClearenceDateDetails',(select count(1) from formmaker_ClearenceDateDetails) from formmaker_ClearenceDateDetails
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.formmaker_ClearenceDateDetails from formmaker_ClearenceDateDetails
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.formmaker_ClearenceDateDetails where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from formmaker_ClearenceDateDetails) where table_name='formmaker_ClearenceDateDetails'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactMarraigeHistory',(select count(1) from ContactMarraigeHistory) from ContactMarraigeHistory
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactMarraigeHistory from ContactMarraigeHistory
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactMarraigeHistory where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactMarraigeHistory) where table_name='ContactMarraigeHistory'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactMedGen',(select count(1) from ContactMedGen) from ContactMedGen
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactMedGen from ContactMedGen
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactMedGen where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactMedGen) where table_name='ContactMedGen'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ModifiedByContactID,(select agency_id from user_agencies),db_name(),'CaseHistory',(select count(1) from CaseHistory) from CaseHistory
		where ModifiedByContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CaseHistory from CaseHistory
		where ModifiedByContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CaseHistory where ModifiedByContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CaseHistory) where table_name='CaseHistory'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactNationality',(select count(1) from ContactNationality) from ContactNationality
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactNationality from ContactNationality
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactNationality where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactNationality) where table_name='ContactNationality'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'MiscFile',(select count(1) from MiscFile) from MiscFile
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MiscFile from MiscFile
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MiscFile where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MiscFile) where table_name='MiscFile'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'rel_relationship27022014',(select count(1) from rel_relationship27022014) from rel_relationship27022014
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.rel_relationship27022014 from rel_relationship27022014
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.rel_relationship27022014 where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from rel_relationship27022014) where table_name='rel_relationship27022014'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId2,(select agency_id from user_agencies),db_name(),'rel_relationship27022014',(select count(1) from rel_relationship27022014) from rel_relationship27022014
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.rel_relationship27022014 from rel_relationship27022014
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.rel_relationship27022014 where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from rel_relationship27022014) where table_name='rel_relationship27022014'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'ContactPhone',(select count(1) from ContactPhone) from ContactPhone
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactPhone from ContactPhone
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactPhone where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactPhone) where table_name='ContactPhone'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactPhoto',(select count(1) from ContactPhoto) from ContactPhoto
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactPhoto from ContactPhoto
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactPhoto where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactPhoto) where table_name='ContactPhoto'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactRace',(select count(1) from ContactRace) from ContactRace
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactRace from ContactRace
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactRace where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactRace) where table_name='ContactRace'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'ContactReligion',(select count(1) from ContactReligion) from ContactReligion
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactReligion from ContactReligion
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactReligion where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactReligion) where table_name='ContactReligion'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactService',(select count(1) from ContactService) from ContactService
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactService from ContactService
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactService where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactService) where table_name='ContactService'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'CIList',(select count(1) from CIList) from CIList
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CIList from CIList
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CIList where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CIList) where table_name='CIList'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactServiceRequest',(select count(1) from ContactServiceRequest) from ContactServiceRequest
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactServiceRequest from ContactServiceRequest
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactServiceRequest where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactServiceRequest) where table_name='ContactServiceRequest'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'ContactUrl',(select count(1) from ContactUrl) from ContactUrl
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactUrl from ContactUrl
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactUrl where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactUrl) where table_name='ContactUrl'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId1,(select agency_id from user_agencies),db_name(),'AdoptionCaseDetail',(select count(1) from AdoptionCaseDetail) from AdoptionCaseDetail
		where ContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.AdoptionCaseDetail from AdoptionCaseDetail
		where ContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.AdoptionCaseDetail where ContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from AdoptionCaseDetail) where table_name='AdoptionCaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId2,(select agency_id from user_agencies),db_name(),'AdoptionCaseDetail',(select count(1) from AdoptionCaseDetail) from AdoptionCaseDetail
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.AdoptionCaseDetail from AdoptionCaseDetail
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.AdoptionCaseDetail where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from AdoptionCaseDetail) where table_name='AdoptionCaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListDataAP',(select count(1) from RptCIListDataAP) from RptCIListDataAP
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListDataAP from RptCIListDataAP
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListDataAP where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListDataAP) where table_name='RptCIListDataAP'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListDataBP',(select count(1) from RptCIListDataBP) from RptCIListDataBP
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListDataBP from RptCIListDataBP
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListDataBP where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListDataBP) where table_name='RptCIListDataBP'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListDataChild',(select count(1) from RptCIListDataChild) from RptCIListDataChild
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListDataChild from RptCIListDataChild
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListDataChild where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListDataChild) where table_name='RptCIListDataChild'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListDataInq',(select count(1) from RptCIListDataInq) from RptCIListDataInq
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListDataInq from RptCIListDataInq
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListDataInq where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListDataInq) where table_name='RptCIListDataInq'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListDataOther',(select count(1) from RptCIListDataOther) from RptCIListDataOther
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListDataOther from RptCIListDataOther
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListDataOther where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListDataOther) where table_name='RptCIListDataOther'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AIRSContactId,(select agency_id from user_agencies),db_name(),'MapFormData_DataFix290813',(select count(1) from MapFormData_DataFix290813) from MapFormData_DataFix290813
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MapFormData_DataFix290813 from MapFormData_DataFix290813
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MapFormData_DataFix290813 where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MapFormData_DataFix290813) where table_name='MapFormData_DataFix290813'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptContact',(select count(1) from RptContact) from RptContact
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptContact from RptContact
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptContact where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptContact) where table_name='RptContact'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AP1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AP2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select CaseWorkerContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Emp1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Emp2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref10ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref6ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref7ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref8ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref9ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel10ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel6ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel7ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel8ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel9ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemData',(select count(1) from MAPSystemData) from MAPSystemData
		where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemData from MAPSystemData
		where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemData where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemData) where table_name='MAPSystemData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select StatusContactId1,(select agency_id from user_agencies),db_name(),'CurrentStatusDetail',(select count(1) from CurrentStatusDetail) from CurrentStatusDetail
		where StatusContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CurrentStatusDetail from CurrentStatusDetail
		where StatusContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CurrentStatusDetail where StatusContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CurrentStatusDetail) where table_name='CurrentStatusDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select StatusContactId2,(select agency_id from user_agencies),db_name(),'CurrentStatusDetail',(select count(1) from CurrentStatusDetail) from CurrentStatusDetail
		where StatusContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CurrentStatusDetail from CurrentStatusDetail
		where StatusContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CurrentStatusDetail where StatusContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CurrentStatusDetail) where table_name='CurrentStatusDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AgencyContactId,(select agency_id from user_agencies),db_name(),'PrivateAgency_Contacts',(select count(1) from PrivateAgency_Contacts) from PrivateAgency_Contacts
		where AgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.PrivateAgency_Contacts from PrivateAgency_Contacts
		where AgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.PrivateAgency_Contacts where AgencyContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from PrivateAgency_Contacts) where table_name='PrivateAgency_Contacts'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select PrimaryContactId,(select agency_id from user_agencies),db_name(),'PrivateAgency_Contacts',(select count(1) from PrivateAgency_Contacts) from PrivateAgency_Contacts
		where PrimaryContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.PrivateAgency_Contacts from PrivateAgency_Contacts
		where PrimaryContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.PrivateAgency_Contacts where PrimaryContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from PrivateAgency_Contacts) where table_name='PrivateAgency_Contacts'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select InqContactId1,(select agency_id from user_agencies),db_name(),'InquiryDetail',(select count(1) from InquiryDetail) from InquiryDetail
		where InqContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.InquiryDetail from InquiryDetail
		where InqContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.InquiryDetail where InqContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from InquiryDetail) where table_name='InquiryDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select InqContactId2,(select agency_id from user_agencies),db_name(),'InquiryDetail',(select count(1) from InquiryDetail) from InquiryDetail
		where InqContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.InquiryDetail from InquiryDetail
		where InqContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.InquiryDetail where InqContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from InquiryDetail) where table_name='InquiryDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ChildContactId,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetailTemp',(select count(1) from ProgramPhaseDetailTemp) from ProgramPhaseDetailTemp
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetailTemp from ProgramPhaseDetailTemp
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetailTemp where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetailTemp) where table_name='ProgramPhaseDetailTemp'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId1,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetailTemp',(select count(1) from ProgramPhaseDetailTemp) from ProgramPhaseDetailTemp
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetailTemp from ProgramPhaseDetailTemp
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetailTemp where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetailTemp) where table_name='ProgramPhaseDetailTemp'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId2,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetailTemp',(select count(1) from ProgramPhaseDetailTemp) from ProgramPhaseDetailTemp
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetailTemp from ProgramPhaseDetailTemp
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetailTemp where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetailTemp) where table_name='ProgramPhaseDetailTemp'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ChildContactId,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetail',(select count(1) from ProgramPhaseDetail) from ProgramPhaseDetail
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetail from ProgramPhaseDetail
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetail where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetail) where table_name='ProgramPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId1,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetail',(select count(1) from ProgramPhaseDetail) from ProgramPhaseDetail
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetail from ProgramPhaseDetail
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetail where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetail) where table_name='ProgramPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId2,(select agency_id from user_agencies),db_name(),'ProgramPhaseDetail',(select count(1) from ProgramPhaseDetail) from ProgramPhaseDetail
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ProgramPhaseDetail from ProgramPhaseDetail
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ProgramPhaseDetail where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ProgramPhaseDetail) where table_name='ProgramPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPCNContactId1,(select agency_id from user_agencies),db_name(),'RptMAPCaseNoteDetail',(select count(1) from RptMAPCaseNoteDetail) from RptMAPCaseNoteDetail
		where MAPCNContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPCaseNoteDetail from RptMAPCaseNoteDetail
		where MAPCNContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPCaseNoteDetail where MAPCNContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPCaseNoteDetail) where table_name='RptMAPCaseNoteDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPCNContactId2,(select agency_id from user_agencies),db_name(),'RptMAPCaseNoteDetail',(select count(1) from RptMAPCaseNoteDetail) from RptMAPCaseNoteDetail
		where MAPCNContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPCaseNoteDetail from RptMAPCaseNoteDetail
		where MAPCNContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPCaseNoteDetail where MAPCNContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPCaseNoteDetail) where table_name='RptMAPCaseNoteDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPCNCrContactId1,(select agency_id from user_agencies),db_name(),'RptMAPCaseNoteDetail',(select count(1) from RptMAPCaseNoteDetail) from RptMAPCaseNoteDetail
		where MAPCNCrContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPCaseNoteDetail from RptMAPCaseNoteDetail
		where MAPCNCrContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPCaseNoteDetail where MAPCNCrContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPCaseNoteDetail) where table_name='RptMAPCaseNoteDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPCNCWContactId1,(select agency_id from user_agencies),db_name(),'RptMAPCaseNoteDetail',(select count(1) from RptMAPCaseNoteDetail) from RptMAPCaseNoteDetail
		where MAPCNCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPCaseNoteDetail from RptMAPCaseNoteDetail
		where MAPCNCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPCaseNoteDetail where MAPCNCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPCaseNoteDetail) where table_name='RptMAPCaseNoteDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPFinContactId1,(select agency_id from user_agencies),db_name(),'RptMAPFinancialDetail',(select count(1) from RptMAPFinancialDetail) from RptMAPFinancialDetail
		where MAPFinContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPFinancialDetail from RptMAPFinancialDetail
		where MAPFinContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPFinancialDetail where MAPFinContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPFinancialDetail) where table_name='RptMAPFinancialDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPFinContactId2,(select agency_id from user_agencies),db_name(),'RptMAPFinancialDetail',(select count(1) from RptMAPFinancialDetail) from RptMAPFinancialDetail
		where MAPFinContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPFinancialDetail from RptMAPFinancialDetail
		where MAPFinContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPFinancialDetail where MAPFinContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPFinancialDetail) where table_name='RptMAPFinancialDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPFinCWContactId1,(select agency_id from user_agencies),db_name(),'RptMAPFinancialDetail',(select count(1) from RptMAPFinancialDetail) from RptMAPFinancialDetail
		where MAPFinCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPFinancialDetail from RptMAPFinancialDetail
		where MAPFinCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPFinancialDetail where MAPFinCWContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPFinancialDetail) where table_name='RptMAPFinancialDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'FPChangeLog',(select count(1) from FPChangeLog) from FPChangeLog
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.FPChangeLog from FPChangeLog
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.FPChangeLog where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from FPChangeLog) where table_name='FPChangeLog'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ChildContactId,(select agency_id from user_agencies),db_name(),'RptMAPPhaseDetail',(select count(1) from RptMAPPhaseDetail) from RptMAPPhaseDetail
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPPhaseDetail from RptMAPPhaseDetail
		where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPPhaseDetail where ChildContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPPhaseDetail) where table_name='RptMAPPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId1,(select agency_id from user_agencies),db_name(),'RptMAPPhaseDetail',(select count(1) from RptMAPPhaseDetail) from RptMAPPhaseDetail
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPPhaseDetail from RptMAPPhaseDetail
		where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPPhaseDetail where MAPContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPPhaseDetail) where table_name='RptMAPPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select MAPContactId2,(select agency_id from user_agencies),db_name(),'RptMAPPhaseDetail',(select count(1) from RptMAPPhaseDetail) from RptMAPPhaseDetail
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptMAPPhaseDetail from RptMAPPhaseDetail
		where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptMAPPhaseDetail where MAPContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptMAPPhaseDetail) where table_name='RptMAPPhaseDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ReferContactId1,(select agency_id from user_agencies),db_name(),'RptReferralDetail',(select count(1) from RptReferralDetail) from RptReferralDetail
		where ReferContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptReferralDetail from RptReferralDetail
		where ReferContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptReferralDetail where ReferContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptReferralDetail) where table_name='RptReferralDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ReferContactId2,(select agency_id from user_agencies),db_name(),'RptReferralDetail',(select count(1) from RptReferralDetail) from RptReferralDetail
		where ReferContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptReferralDetail from RptReferralDetail
		where ReferContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptReferralDetail where ReferContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptReferralDetail) where table_name='RptReferralDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select RefrdContactId1,(select agency_id from user_agencies),db_name(),'RptReferralDetail',(select count(1) from RptReferralDetail) from RptReferralDetail
		where RefrdContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptReferralDetail from RptReferralDetail
		where RefrdContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptReferralDetail where RefrdContactId1 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptReferralDetail) where table_name='RptReferralDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ServiceContactId,(select agency_id from user_agencies),db_name(),'ServiceDetail',(select count(1) from ServiceDetail) from ServiceDetail
		where ServiceContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ServiceDetail from ServiceDetail
		where ServiceContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ServiceDetail where ServiceContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ServiceDetail) where table_name='ServiceDetail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Contactid,(select agency_id from user_agencies),db_name(),'Stgfrk_project',(select count(1) from Stgfrk_project) from Stgfrk_project
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media') and Contactid not like 'wrk:%'
		select * into ContactCleanup.dbo.Stgfrk_project from Stgfrk_project
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media') and Contactid not like 'wrk:%'
 delete from Eckerd_Test.dbo.Stgfrk_project where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		and Contactid not like 'wrk:%'
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Stgfrk_project) where table_name='Stgfrk_project'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'FPLogin',(select count(1) from FPLogin) from FPLogin
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.FPLogin from FPLogin
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.FPLogin where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from FPLogin) where table_name='FPLogin'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'StageTblClientWithoutCW',(select count(1) from StageTblClientWithoutCW) from StageTblClientWithoutCW
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.StageTblClientWithoutCW from StageTblClientWithoutCW
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.StageTblClientWithoutCW where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from StageTblClientWithoutCW) where table_name='StageTblClientWithoutCW'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'StageTblCaseWorker',(select count(1) from StageTblCaseWorker) from StageTblCaseWorker
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.StageTblCaseWorker from StageTblCaseWorker
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.StageTblCaseWorker where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from StageTblCaseWorker) where table_name='StageTblCaseWorker'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'StageGroupPhaseStagingTable',(select count(1) from StageGroupPhaseStagingTable) from StageGroupPhaseStagingTable
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.StageGroupPhaseStagingTable from StageGroupPhaseStagingTable
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.StageGroupPhaseStagingTable where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from StageGroupPhaseStagingTable) where table_name='StageGroupPhaseStagingTable'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Rel_Relationship',(select count(1) from Rel_Relationship) from Rel_Relationship
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Rel_Relationship from Rel_Relationship
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Rel_Relationship where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Rel_Relationship) where table_name='Rel_Relationship'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId2,(select agency_id from user_agencies),db_name(),'Rel_Relationship',(select count(1) from Rel_Relationship) from Rel_Relationship
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Rel_Relationship_contactid2 from Rel_Relationship
		where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Rel_Relationship where ContactId2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Rel_Relationship) where table_name='Rel_Relationship'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'AgeRaceStageingTable',(select count(1) from AgeRaceStageingTable) from AgeRaceStageingTable
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.AgeRaceStageingTable from AgeRaceStageingTable
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.AgeRaceStageingTable where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from AgeRaceStageingTable) where table_name='AgeRaceStageingTable'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Contactid,(select agency_id from user_agencies),db_name(),'ClientSearchLst',(select count(1) from ClientSearchLst) from ClientSearchLst
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ClientSearchLst from ClientSearchLst
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ClientSearchLst where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ClientSearchLst) where table_name='ClientSearchLst'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Contactid2,(select agency_id from user_agencies),db_name(),'ClientSearchLst',(select count(1) from ClientSearchLst) from ClientSearchLst
		where Contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ClientSearchLst from ClientSearchLst
		where Contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ClientSearchLst where Contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ClientSearchLst) where table_name='ClientSearchLst'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Rel_RelationShipUnknownDelete',(select count(1) from Rel_RelationShipUnknownDelete) from Rel_RelationShipUnknownDelete
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Rel_RelationShipUnknownDelete from Rel_RelationShipUnknownDelete
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Rel_RelationShipUnknownDelete where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Rel_RelationShipUnknownDelete) where table_name='Rel_RelationShipUnknownDelete'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactAgeRaceStageingTable',(select count(1) from ContactAgeRaceStageingTable) from ContactAgeRaceStageingTable
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactAgeRaceStageingTable from ContactAgeRaceStageingTable
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactAgeRaceStageingTable where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactAgeRaceStageingTable) where table_name='ContactAgeRaceStageingTable'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Contactid,(select agency_id from user_agencies),db_name(),'ClientSearchLstOut',(select count(1) from ClientSearchLstOut) from ClientSearchLstOut
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ClientSearchLstOut from ClientSearchLstOut
		where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ClientSearchLstOut where Contactid in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ClientSearchLstOut) where table_name='ClientSearchLstOut'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select contactid2,(select agency_id from user_agencies),db_name(),'ClientSearchLstOut',(select count(1) from ClientSearchLstOut) from ClientSearchLstOut
		where contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ClientSearchLstOut from ClientSearchLstOut
		where contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ClientSearchLstOut where contactid2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ClientSearchLstOut) where table_name='ClientSearchLstOut'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactTemp_New',(select count(1) from ContactTemp_New) from ContactTemp_New
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactTemp_New from ContactTemp_New
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactTemp_New where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactTemp_New) where table_name='ContactTemp_New'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'HagueInvolvedPeople',(select count(1) from HagueInvolvedPeople) from HagueInvolvedPeople
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.HagueInvolvedPeople from HagueInvolvedPeople
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.HagueInvolvedPeople where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from HagueInvolvedPeople) where table_name='HagueInvolvedPeople'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactAccount',(select count(1) from ContactAccount) from ContactAccount
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactAccount from ContactAccount
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactAccount where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactAccount) where table_name='ContactAccount'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'CaseWorkerStageTbl',(select count(1) from CaseWorkerStageTbl) from CaseWorkerStageTbl
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CaseWorkerStageTbl from CaseWorkerStageTbl
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CaseWorkerStageTbl where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CaseWorkerStageTbl) where table_name='CaseWorkerStageTbl'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Revenue',(select count(1) from Revenue) from Revenue
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Revenue from Revenue
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Revenue where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Revenue) where table_name='Revenue'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactActivity',(select count(1) from ContactActivity) from ContactActivity
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactActivity from ContactActivity
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactActivity where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactActivity) where table_name='ContactActivity'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactId,(select agency_id from user_agencies),db_name(),'vw_ContactView',(select count(1) from vw_ContactView) from vw_ContactView
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.vw_ContactView from vw_ContactView
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vw_ContactView where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vw_ContactView) where table_name='vw_ContactView'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AIRSContactId,(select agency_id from user_agencies),db_name(),'MapFormData',(select count(1) from MapFormData) from MapFormData
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MapFormData from MapFormData
		where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MapFormData where AIRSContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MapFormData) where table_name='MapFormData'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RevenueLog',(select count(1) from RevenueLog) from RevenueLog
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RevenueLog from RevenueLog
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RevenueLog where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RevenueLog) where table_name='RevenueLog'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Insur_ContactInsurance',(select count(1) from Insur_ContactInsurance) from Insur_ContactInsurance
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Insur_ContactInsurance from Insur_ContactInsurance
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Insur_ContactInsurance where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Insur_ContactInsurance) where table_name='Insur_ContactInsurance'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'RptCIListData',(select count(1) from RptCIListData) from RptCIListData
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.RptCIListData from RptCIListData
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.RptCIListData where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from RptCIListData) where table_name='RptCIListData'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactID,(select agency_id from user_agencies),db_name(),'vw_ContactRace',(select count(1) from vw_ContactRace) from vw_ContactRace
	--	where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.vw_ContactRace from vw_ContactRace
	--	where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vw_ContactRace where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vw_ContactRace) where table_name='vw_ContactRace'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactAddress',(select count(1) from ContactAddress) from ContactAddress
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactAddress from ContactAddress
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactAddress where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactAddress) where table_name='ContactAddress'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AP1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where AP1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select AP2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where AP2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select CaseWorkerContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where CaseWorkerContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Child1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Child2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Child3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Child4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Child5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Child5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Emp1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Emp1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Emp2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Emp2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref10ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref6ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref7ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref8ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Ref9ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Ref9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel10ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel10ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel1ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel1ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel2ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel2ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel3ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel3ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel4ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel4ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel5ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel5ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel6ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel6ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel7ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel7ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel8ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel8ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select Rel9ContactId,(select agency_id from user_agencies),db_name(),'MAPSystemDatarevocer',(select count(1) from MAPSystemDatarevocer) from MAPSystemDatarevocer
		where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.MAPSystemDatarevocer from MAPSystemDatarevocer
		where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.MAPSystemDatarevocer where Rel9ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from MAPSystemDatarevocer) where table_name='MAPSystemDatarevocer'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactAIRS',(select count(1) from ContactAIRS) from ContactAIRS
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactAIRS from ContactAIRS
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactAIRS where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactAIRS) where table_name='ContactAIRS'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactCulture',(select count(1) from ContactCulture) from ContactCulture
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactCulture from ContactCulture
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactCulture where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactCulture) where table_name='ContactCulture'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'OpenProgramRoles',(select count(1) from OpenProgramRoles) from OpenProgramRoles
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.OpenProgramRoles from OpenProgramRoles
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.OpenProgramRoles where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from OpenProgramRoles) where table_name='OpenProgramRoles'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'lkpHospital_Obsolete_08_2006',(select count(1) from lkpHospital_Obsolete_08_2006) from lkpHospital_Obsolete_08_2006
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.lkpHospital_Obsolete_08_2006 from lkpHospital_Obsolete_08_2006
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.lkpHospital_Obsolete_08_2006 where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from lkpHospital_Obsolete_08_2006) where table_name='lkpHospital_Obsolete_08_2006'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'OpenProgramRolesNew',(select count(1) from OpenProgramRolesNew) from OpenProgramRolesNew
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.OpenProgramRolesNew from OpenProgramRolesNew
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.OpenProgramRolesNew where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from OpenProgramRolesNew) where table_name='OpenProgramRolesNew'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'CWTaskTemplate',(select count(1) from CWTaskTemplate) from CWTaskTemplate
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.CWTaskTemplate from CWTaskTemplate
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.CWTaskTemplate where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from CWTaskTemplate) where table_name='CWTaskTemplate'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'ContactDeleteLog',(select count(1) from ContactDeleteLog) from ContactDeleteLog
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactDeleteLog from ContactDeleteLog
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactDeleteLog where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactDeleteLog) where table_name='ContactDeleteLog'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactDocument',(select count(1) from ContactDocument) from ContactDocument
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactDocument from ContactDocument
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactDocument where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactDocument) where table_name='ContactDocument'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactID,(select agency_id from user_agencies),db_name(),'ContactEducation',(select count(1) from ContactEducation) from ContactEducation
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactEducation from ContactEducation
		where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactEducation where ContactID in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactEducation) where table_name='ContactEducation'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select CWContactId,(select agency_id from user_agencies),db_name(),'Med_ContactAXIS',(select count(1) from Med_ContactAXIS) from Med_ContactAXIS
		where CWContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Med_ContactAXIS from Med_ContactAXIS
		where CWContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Med_ContactAXIS where CWContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Med_ContactAXIS) where table_name='Med_ContactAXIS'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Med_ContactAXISV',(select count(1) from Med_ContactAXISV) from Med_ContactAXISV
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Med_ContactAXISV from Med_ContactAXISV
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Med_ContactAXISV where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Med_ContactAXISV) where table_name='Med_ContactAXISV'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactId,(select agency_id from user_agencies),db_name(),'vwRelationDataMart',(select count(1) from vwRelationDataMart) from vwRelationDataMart
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.vwRelationDataMart from vwRelationDataMart
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vwRelationDataMart where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vwRelationDataMart) where table_name='vwRelationDataMart'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactID2,(select agency_id from user_agencies),db_name(),'vwRelationDataMart',(select count(1) from vwRelationDataMart) from vwRelationDataMart
	--	where ContactID2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.vwRelationDataMart from vwRelationDataMart
	--	where ContactID2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.vwRelationDataMart where ContactID2 in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from vwRelationDataMart) where table_name='vwRelationDataMart'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'ContactEmail',(select count(1) from ContactEmail) from ContactEmail
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.ContactEmail from ContactEmail
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.ContactEmail where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from ContactEmail) where table_name='ContactEmail'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Med_DiagCollection',(select count(1) from Med_DiagCollection) from Med_DiagCollection
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Med_DiagCollection from Med_DiagCollection
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Med_DiagCollection where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Med_DiagCollection) where table_name='Med_DiagCollection'
 --insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
	--	select ContactId,(select agency_id from user_agencies),db_name(),'ContactTemp',(select count(1) from ContactTemp) from ContactTemp
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	select * into ContactCleanup.dbo.ContactTemp from ContactTemp
	--	where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 --delete from Eckerd_Test.dbo.ContactTemp where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
	--	update ContactCleanup.dbo.DataCount
	--	set aftercount=(select count(1) from ContactTemp) where table_name='ContactTemp'
 insert into ContactCleanup.dbo.DataCount(contact_id,agencyid,dbname,table_name,BeforeCount) 
		select ContactId,(select agency_id from user_agencies),db_name(),'Contact',(select count(1) from Contact) from Contact
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		select * into ContactCleanup.dbo.Contact from Contact
		where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
 delete from Eckerd_Test.dbo.Contact where ContactId in(select contactid from contact where fname='test' or lname='test' or fname='media' or lname='media')
		update ContactCleanup.dbo.DataCount
		set aftercount=(select count(1) from Contact) where table_name='Contact'
