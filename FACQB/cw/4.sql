select u.user_id, ua.user_id,u.username,ua.username,u.first_name,ua.first_name,u.last_name,ua.last_name,u.connid,ua.connid
 from user_accounts ua
right join mapfac.dbo.user_accounts u
on u.user_id = ua.user_id
and (u.first_name = ua.first_name and u.last_name = ua.last_name)
where u.ConnID < -19389

select u.user_id as userid, ua.user_id as uauserid,u.username as username,ua.username as uausername,
u.first_name as first_name,ua.first_name as uafirst_name,u.last_name as last_name,ua.last_name as ualast_name
,u.connid,ua.connid as uaconnid
into #temp
 from user_accounts ua
right join mapfac.dbo.user_accounts u
on u.user_id = ua.user_id
and (u.first_name = ua.first_name and u.last_name = ua.last_name)
where u.ConnID > -19389

select * from #temp where connid > -19389 and 
uausername is null 
and (first_name not like '%test%' or last_name  not like '%test%')

select * from caseworker_client where clientconnid >-19389 

select * from mapsystemdata where user_id>=13433 and agency=17

select * from formmaker_phase_status

select * from formmaker_stages

select * from formmaker_status_track WHERE USER_ID >=13433

SELECT* FROM formmaker_taskstatus WHERE CONNID >=-19389 order by status_id

SELECT * FROM formmaker_usergroups

SELECT * FROM formmaker_agencies WHERE AGENCY_ID = 212 AND PHASE_ID IN (1633
,1634
,1665
,1749)

SELECT * FROM formmaker_client_disable WHERE CONNID >=-19389

SELECT 
FC.PHASE_ID AS  FCPHASE_ID, F.PHASE_ID
 ,FC.TASK_ID AS FCTASK_ID, F.TASK_ID
 ,FC.USER_ID AS FCUSER_ID, F.USER_ID
 ,FC.CONNID  AS FCCONNID, F.CONNID
INTO #temp3
FROM formmaker_client_disable F
LEFT JOIN MAPFACQB.DBO.formmaker_client_disable FC
ON  FC.PHASE_ID = F.PHASE_ID
AND FC.TASK_ID = F.TASK_ID
AND FC.USER_ID = F.USER_ID
AND FC.CONNID = F.CONNID
WHERE F.CONNID >=-19389

SELECT * FROM formmaker_fields

select * from CIList where contactid <19389


select * from CIListTemplateItem


select * from ContactMedGen where contactid <

select * from ContactMedGen where contactid >19365

SELECT * FROM MAPFACQB_STAGE.DBO.CONTACT WHERE CONTACTID IN (119406
,119407
,119421
,119430
,119431
,119436
,119437
,119450
,119451
,119454
,119469
,119470
,119478
,119479
,119491
,119492
,119501
,119502
,119505
,119506
,119508
,119509
,119517
,119518)

SELECT * FROM FORMMAKER_PROPERTIES

SELECT * FROM formmaker_77_topicsfordiscussion

SELECT * FROM FORMMAKER_77_preapplicationpayment  WHERE USER_ID >=13433



SELECT	FI.USER_ID AS FIUSER_ID, 
		F.USER_ID, 
		FI.CONNID AS FICONNID, 
		F.CONNID
INTO #TEMP2
FROM FORMMAKER_77_instructionsforreleaseofinformationforms F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_instructionsforreleaseofinformationforms FI
ON FI.USER_ID = F.USER_ID
AND FI.CONNID = F.CONNID
WHERE FI.USER_ID <13433

SELECT F.user_id
,F.key_id
,F.input_ap1fname
,F.input_ap1mname
,F.input_ap1lname
,F.input_add1
,F.input_add2
,F.input_city
,F.input_state
,F.input_zip
,F.input_rfno
,F.input_ap1signature
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
OLDUSER_ID 
FROM MAPFAC.DBO.FORMMAKER_77_instructionsforreleaseofinformationforms F
JOIN #TEMP2 T
ON T.FIUSER_ID = F.USER_ID
AND T.FICONNID = F.CONNID
WHERE T.FIUSER_ID IS NOT NULL AND T.USER_ID IS NULL

SELECT FT.USER_ID AS FTUSER_ID,
F.USER_ID,
FT.CONNID AS FTCONNID,
F.CONNID
INTO #TEMP3
FROM FORMMAKER_77_topicsfordiscussion_1 F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_topicsfordiscussion_1 FT
ON FT.USER_ID = F.USER_ID
AND FT.CONNID = F.CONNID
WHERE FT.USER_ID <13433

SELECT F.user_id
,F.key_id
,F.input_ap2fname
,F.input_ap2lname
,F.input_check
,F.input_list
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.USER_ID
FROM MAPFAC.DBO.FORMMAKER_77_topicsfordiscussion_1 F
JOIN #TEMP3 T
ON T.FTUSER_ID = F.USER_ID
AND T.FTCONNID = F.CONNID
WHERE T.FTUSER_ID IS NOT NULL AND T.USER_ID IS NULL

SELECT FI.USER_ID AS FIUSER_ID,
F.USER_ID,
FI.CONNID AS FICONNID,
F.CONNID
INTO #TEMP4
FROM FORMMAKER_77_informationreceivedacknowledgemnt F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_informationreceivedacknowledgemnt FI
ON FI.USER_ID = F.USER_ID
AND FI.CONNID = F.CONNID
WHERE FI.USER_ID <13433

SELECT F.user_id
,F.key_id
,F.input_ap1fname
,F.input_ap1lname
,F.input_ap1signature
,F.input_dateap1
,F.input_ap2fname
,F.input_ap2lname
,F.input_ap2signature
,F.input_dateap2
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.USER_ID
FROM MAPFAC.DBO.FORMMAKER_77_informationreceivedacknowledgemnt F
JOIN #TEMP4 T
ON T.FIUSER_ID = F.USER_ID
AND T.FICONNID = F.CONNID
WHERE T.FIUSER_ID IS NOT NULL AND  T.USER_ID IS NULL

SELECT	FF.USER_ID AS FFUSER_ID, 
		F.USER_ID,
		FF.CONNID AS FFCONNID,
		F.CONNID
INTO #TEMP5
FROM FORMMAKER_77_formalapplication_1 F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_formalapplication_1 FF
ON FF.USER_ID = F.USER_ID
AND FF.CONNID = F.CONNID
WHERE FF.USER_ID<13433

SELECT F.user_id
,F.key_id
,F.input_ap1fname
,F.input_ap2fname
,F.input_ap1mname
,F.input_ap2mname
,F.input_ap1lname
,F.input_ap2lname
,F.input_ap1aliasename_76
,F.input_ap2aliasename_77
,F.input_add1
,F.input_add2
,F.input_city
,F.input_ap2city_78
,F.input_county
,F.input_ap2county
,F.input_state
,F.input_ap2state_79
,F.input_zip
,F.input_zipap2_44
,F.input_homephone
,F.input_ap2homephone_80
,F.input_ap1cellphone
,F.input_ap2cellphone
,F.input_ap1workphone
,F.input_ap2workphone
,F.input_ap1email
,F.input_ap2email
,F.input_ap1dob
,F.input_ap2dob
,F.input_ap1birthcity
,F.input_ap2birthcity
,F.input_ap1ethnicity
,F.input_ap2ethnicity
,F.input_ap1race
,F.input_ap2race
,F.input_citizenshipap2_46
,F.input_citizenshipap1_81
,F.input_ap1alienno
,F.input_ap2alienno_82
,F.input_ap1ssn
,F.input_ap2ssn
,F.input_ap1religion
,F.input_ap2religion
,F.input_ap1marraigedate2
,F.input_ap2marraigedate2
,F.input_ap1marplace_83
,F.input_ap2marplace_84
,F.input_ap1premarsponame_85
,F.input_ap1marraigedate
,F.input_premarplaceap1
,F.input_ap1terminwhere_86
,F.input_ap1terminhow_87
,F.input_ap2prespousename_88
,F.input_ap2terminationdate
,F.input_placepremarterap2_89
,F.input_ap2reasonter_90
,F.input_termwhereap2_91
,F.input_ap1fathername_92
,F.input_ap2fathername_93
,F.input_fatheroccap1_94
,F.input_ap2fatherocc_95
,F.input_ap1fatherliving_96
,F.input_ap2fatherliving_97
,F.input_ap1mothername_98
,F.input_ap2mothersname_99
,F.input_ap1motherocc_100
,F.input_ap2mothersocc_101
,F.input_ap1motherliving_102
,F.input_ap2motherliving_103
,F.input_ap1sib1name_104
,F.input_ap2sib1name_105
,F.input_ap1sib1dob_106
,F.input_ap2sib1dob_107
,F.input_ap1sib2name_108
,F.input_ap2sib2name_109
,F.input_ap1sib2dob_110
,F.input_ap2sib2dob_111
,F.input_ap1sib3name_112
,F.input_ap2sib3name_113
,F.input_ap2dobsib3
,F.input_ap2sib3dob_115
,F.input_rel1fname
,F.input_rel1lname
,F.input_child1placeofbirth_116
,F.input_rel1gender
,F.input_rel1dob
,F.input_child1ssn_117
,F.input_rel1relationship
,F.input_child1living_57
,F.input_rel2fname
,F.input_rel2lname
,F.input_child2birthplace_118
,F.input_rel2gender
,F.input_rel2dob
,F.input_child2ssn_119
,F.input_rel2relationship
,F.input_child2living_58
,F.input_rel3fname
,F.input_rel3lname
,F.input_child3birthplace_120
,F.input_rel3gender
,F.input_child3ssn_121
,F.input_rel3dob
,F.input_rel3relationship
,F.input_child3living_59
,F.input_rel4fname
,F.input_rel4lname
,F.input_child4placeofbirth_122
,F.input_rel4gender
,F.input_rel4dob
,F.input_child4ssn_123
,F.input_rel4relationship
,F.input_rel5fname
,F.input_rel5lname
,F.input_rel5gender
,F.input_rel5dob
,F.input_otheradult1ssn_124
,F.input_adult1relap1_125
,F.input_adult1relap2_126
,F.input_rel6fname
,F.input_rel6lname
,F.input_rel6gender
,F.input_rel6dob
,F.input_adult2ssn_127
,F.input_adult2relap1_128
,F.input_adult2relap2_129
,F.input_reason
,F.input_qualities
,F.input_childlessreason
,F.input_seriouscon
,F.input_treatmentdetails
,F.input_releaseofcontact
,F.input_hometype
,F.input_noofrooms_130
,F.input_noofbedrooms_131
,F.input_mortgage
,F.input_rent
,F.input_squarefootage
,F.input_lotsize
,F.input_ap1collegename
,F.input_ap2collegename
,F.input_ap1collegecity
,F.input_ap2collegecity
,F.input_ap1collegestate
,F.input_ap2collegestate
,F.input_c1datesap1
,F.input_c1datesap2
,F.input_degreeap1
,F.input_degreeap2
,F.input_college2ap1
,F.input_college2ap2
,F.input_cityap1college2
,F.input_cityap2college2
,F.input_ap1state2
,F.input_ap2state2
,F.input_ap1datescoll2
,F.input_ap1datescol22
,F.input_ap1degree2
,F.input_ap2degree2
,F.input_vocationap1
,F.input_vocationap2
,F.input_ap1dates1
,F.input_ap2dates1
,F.input_ap1degreevoc
,F.input_ap2degreevoc
,F.input_ap1hsname1
,F.input_ap2hsname1
,F.input_ap1cityhs1
,F.input_ap2cityhs1
,F.input_ap1state2hs
,F.input_ap2state2hs
,F.input_ap1sateshs1
,F.input_ap2dateshs1
,F.input_ap1degreehs1
,F.input_ap2degreehs1
,F.input_ap1hsname2
,F.input_ap2hsname2
,F.input_ap1cityhs2
,F.input_ap2cityhs2
,F.input_ap1statehs2
,F.input_ap2statehs2
,F.input_ap1dasteshs2
,F.input_ap2dasteshs2
,F.input_ap1degreehs2
,F.input_ap2degreehs2
,F.input_emp1fname
,F.input_emp2fname
,F.input_ap1occ_49
,F.input_ap2occ_50
,F.input_ap1years
,F.input_yearsap2
,F.input_emp1salary
,F.input_emp2salary
,F.input_type
,F.input_typeap2
,F.input_brachap1
,F.input_branchap2
,F.input_ap1preocc_132
,F.input_ap2preocc
,F.input_yearspreap1
,F.input_yearspreap2
,F.input_ap1preemplo
,F.input_ap2preemplo
,F.input_ap1preocc2
,F.input_ocupat
,F.input_ap1years2
,F.input_ap2years2
,F.input_annualap1
,F.input_ap2annual
,F.input_typeap12
,F.input_trypeap1
,F.input_grandparentnameap1
,F.input_grandparentnameap2
,F.input_ap1gpadd
,F.input_gpaddap2
,F.input_ap1citygp
,F.input_ap2citygp
,F.input_ap1stategp
,F.input_ap2stategp
,F.input_zipap1gp
,F.input_zipstateap2
,F.input_ref1fname
,F.input_ref1lname
,F.input_ref1add1
,F.input_ref1add2
,F.input_neighborphone
,F.input_ref1city
,F.input_ref1state
,F.input_ref1zip
,F.input_ref2fname
,F.input_ref2lname
,F.input_ref2add1
,F.input_ref2add2
,F.input_ref2phone
,F.input_ref2city
,F.input_ref2state
,F.input_ref2zip
,F.input_ref3fname
,F.input_ref3lname
,F.input_ref3add1
,F.input_ref3add2
,F.input_ref3phone
,F.input_ref3city
,F.input_ref3state
,F.input_ref3zip
,F.input_ref4fname
,F.input_ref4lname
,F.input_ref4add1
,F.input_ref4add2
,F.input_ref4phone
,F.input_ref4city
,F.input_ref4state
,F.input_ref4zip
,F.input_ap1employer
,F.input_emp1add1
,F.input_employerphone
,F.input_emp1city
,F.input_emp1state
,F.input_emp1zip
,F.input_ap1empname
,F.input_emp2add1
,F.input_ap2emphone
,F.input_emp2city
,F.input_emp2state
,F.input_emp2zip
,F.input_ref5fname
,F.input_ref5lname
,F.input_ref5add1
,F.input_ref5phone
,F.input_ref5city
,F.input_ref5state
,F.input_ref5zip
,F.input_ref6fname
,F.input_ref6lname
,F.input_ref6add1
,F.input_ref6phone
,F.input_ref6city
,F.input_ref6state
,F.input_ref6zip
,F.input_ap1street1_146
,F.input_ap2street1_147
,F.input_ap1city1
,F.input_ap2city2_148
,F.input_ap1county1_149
,F.input_ap2county1_150
,F.input_ap1state1_151
,F.input_ap2state1
,F.input_ap1zip1
,F.input_ap2zip1
,F.input_ap1datesoffres1
,F.input_ap2datesofres1
,F.input_ap1forcountry1_152
,F.input_ap2forcountry1
,F.input_ap1street2
,F.input_ap2street2
,F.input_ap1city2
,F.input_ap2city
,F.input_ap1county2
,F.input_ap2county2
,F.input_ap1state
,F.input_ap2state
,F.input_ap1zip2
,F.input_ap2zip2
,F.input_ap1street3
,F.input_ap2street3
,F.input_ap1county3
,F.input_ap2county3
,F.input_ap1state3
,F.input_ap2state3
,F.input_ap1city3
,F.input_ap2city3
,F.input_ap1zip3
,F.input_ap2zip3
,F.input_ap1datesofres2
,F.input_ap2datesofres2
,F.input_ap2forcountry2
,F.input_ap2forcountry
,F.input_ap1street4
,F.input_ap2street4
,F.input_ap1city4
,F.input_ap2city4
,F.input_ap1county4
,F.input_ap2county4
,F.input_ap1state4
,F.input_ap2state4
,F.input_ap1zip4
,F.input_ap2zip4
,F.input_ap1datesofres3
,F.input_ap2datesofres4
,F.input_ap1forcountry3
,F.input_ap2forcountry3
,F.input_ap1datesofres4
,F.input_ap2datesofres
,F.input_ap1forcountry4
,F.input_ap2forcountry4
,F.input_ap1street5
,F.input_ap2street5
,F.input_ap1city5
,F.input_ap2city5
,F.input_ap1county5
,F.input_ap2county5
,F.input_ap2state5
,F.input_ap2states
,F.input_ap1zip5
,F.input_ap2zip5
,F.input_ap1datesofres5
,F.input_ap2datesofres5
,F.input_ap1forcountry5
,F.input_ap2forcountry5
,F.input_histofarrest
,F.input_ifyes1
,F.input_childabuseinvesti
,F.input_ifyes2
,F.input_subabusehist
,F.input_ifyes3
,F.input_domviolencehist
,F.input_hscompleted
,F.input_ifyes4
,F.input_ap1signature
,F.input_signdate1
,F.input_ap2signature
,F.input_signdate2
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.USER_ID
FROM MAPFAC.DBO.FORMMAKER_77_formalapplication_1 F
JOIN #TEMP5 T
ON T.FFUSER_ID = F.USER_ID
AND T.FFCONNID = F.CONNID
WHERE T.FFUSER_ID IS NOT NULL AND T.USER_ID IS NULL

SELECT	FA.USER_ID AS FAUSER_ID,
		F.USER_ID,
		FA.CONNID AS FACONNID,
		F.CONNID
INTO #TEMP6
FROM FORMMAKER_77_adoptiveapplicantfinancialstatement F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_adoptiveapplicantfinancialstatement FA
ON FA.USER_ID = F.USER_ID
AND FA.CONNID = F.CONNID
WHERE FA.USER_ID <13433

SELECT * FROM FORMMAKER_77_ohiodomestichomestudyfee  WHERE USER_ID <13433
SELECT F.user_id
,F.key_id
,F.input_ap1fname
,F.input_ap1lname
,F.input_ap2fname
,F.input_ap2lname
,F.input_depadults
,F.input_depchildren
,F.input_famember1
,F.input_memb1grosspay
,F.input_memb2netpay
,F.input_famember2
,F.input_memb2grosspay
,F.input_memb1netpay
,F.input_otherinc
,F.input_totalincome
,F.input_rent
,F.input_boats
,F.input_homeequity
,F.input_tuition
,F.input_propertytaxes
,F.input_food
,F.input_inshome
,F.input_clothing
,F.input_telephone
,F.input_cellphone
,F.input_heat
,F.input_electric
,F.input_cableservice
,F.input_watersewer
,F.input_trash
,F.input_mediexp
,F.input_medins
,F.input_disabilityions
,F.input_entertainment
,F.input_gifts
,F.input_lifeins
,F.input_carins
,F.input_homemaintenance
,F.input_autolicense
,F.input_personalcare
,F.input_charity
,F.input_childcare
,F.input_religiouscontri
,F.input_schoolsupplies
,F.input_gasoline
,F.input_creditcardpayments
,F.input_vacations
,F.input_schooloan
,F.input_lunch
,F.input_unreimbursedexp
,F.input_cloth
,F.input_empgifts
,F.input_childsupportali
,F.input_regsavings
,F.input_investmentsretire
,F.input_car1loan
,F.input_car2loan
,F.input_selfemptaxes
,F.input_otherselfempexp
,F.input_otherloanpay
,F.input_subtotal1
,F.input_subtotal2
,F.input_totalexp
,F.input_resimktvalue
,F.input_otherrealestatemktval
,F.input_car1value
,F.input_car1
,F.input_car2value
,F.input_car2
,F.input_boatrv
,F.input_boatvalue_153
,F.input_savings
,F.input_retirement
,F.input_stocksandbonds
,F.input_investmentsassets
,F.input_otherassetsvalue
,F.input_otherassets
,F.input_totalassets
,F.input_residencemortagage
,F.input_othermortagage
,F.input_car1liabilty
,F.input_car1name
,F.input_carloan
,F.input_car2loans
,F.input_boatsli
,F.input_otherloans
,F.input_otherloansliab
,F.input_creditcardss
,F.input_1
,F.input_2
,F.input_3
,F.input_otherloansvalue
,F.input_otherspecify1
,F.input_otherloansvalue2
,F.input_other
,F.input_totalaibilities
,F.input_excludedinc
,F.input_exincome1
,F.input_excludedinc2
,F.input_exincome2
,F.input_totalexincome
,F.input_liap1
,F.input_ap1limonthlycost
,F.input_liap1company
,F.input_liap2
,F.input_ap2li
,F.input_licompap1
,F.input_child1lifeins
,F.input_monthlycostchild1
,F.input_lifeinscompchild1
,F.input_child2li
,F.input_child2limonthlycost
,F.input_comchild2
,F.input_ch3lifeins
,F.input_child3monthlycost
,F.input_lifeinscompch3
,F.input_ap1medins
,F.input_ap1medinscost
,F.input_com
,F.input_medinsap2
,F.input_ap2moncost
,F.input_comp
,F.input_lifeinschil1
,F.input_childmedinscost
,F.input_compa
,F.input_child
,F.input_ap2monthcost
,F.input_co
,F.input_ap1medicaid1
,F.input_monap
,F.input_apcom
,F.input_apmedica
,F.input_monap2
,F.input_ap2com
,F.input_child1medicaid
,F.input_c
,F.input_child1mon
,F.input_chmed2
,F.input_ch2mon
,F.input_ch2com
,F.input_ch1
,F.input_ch3mon
,F.input_compch3
,F.input_dis
,F.input_dismonth
,F.input_comch3
,F.input_otherins
,F.input_totalcov
,F.input_company1
,F.input_info_155
,F.input_ap1signature
,F.input_dateap1
,F.input_date2
,F.input_ap2signature
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.USER_ID
FROM MAPFAC.DBO.FORMMAKER_77_adoptiveapplicantfinancialstatement F
JOIN #TEMP6 T
ON T.FAUSER_ID = F.USER_ID
AND T.FACONNID = F.CONNID
WHERE T.FAUSER_ID IS NOT NULL AND T.USER_ID IS NULL

SELECT * FROM FORMMAKER_77_currentstateofresidency  WHERE USER_ID <13433

SELECT * FROM FORMMAKER_77_notificationandauthorization  WHERE USER_ID <13433

SELECT C.CONTACTID,CT.CONTACTID AS CTCONTACTID
INTO #ContactTemp
 FROM CONTACT C
RIGHT JOIN MAPFAC.DBO.CONTACT CT
ON CT.CONTACTID = C.CONTACTID
WHERE CT.ContactID < 19389 

select * from #ContactTemp where contactid is null

select * from CONTACTADDRESS WHERE OldContactId is not null

select ca.addressid,c.addressid as caddressid,ca.contactid,c.contactid as ccontactid
into #CONTACTADDRESSTEMP
from CONTACTADDRESS c
right join mapfac.dbo.CONTACTADDRESS ca
on ca.AddressId = c.AddressId
and ca.ContactId = c.ContactId
WHERE ca.contactid <19389

SELECT C.AddressTypeId
,C.ContactId
,C.Address1
,C.Address2
,C.City
,C.StateId
,C.Zip
,C.CountryId
,C.Countyid
,C.AddStartDate
,C.AddLeaveDate
,C.MailingAddress
,C.AddressProvinceID
,C.ZipNumeric
,C.ContactId 
FROM mapfac.dbo.CONTACTADDRESS C
JOIN #CONTACTADDRESSTEMP CT
ON CT.ADDRESSID = C.ADDRESSID
WHERE caddressid is null

SELECT * FROM AIRSGROUP a
join  ContactAIRS c
on a.contactairsid = c.contactairsid
 WHERE c.contactid >19389
 AND OLDCONTACTID IS NOT NULL

SELECT AG.ContactAIRSId AS  AGContactAIRSId , A.ContactAIRSId 
INTO #TEMP
FROM mapfac.dbo.AIRSGROUP a
LEFT JOIN  AIRSGROUP AG
ON AG.ContactAIRSId = A.ContactAIRSId
join  MAPFAC.DBO.ContactAIRS c
on a.contactairsid = c.contactairsid
 WHERE c.contactid <19389

 SELECT * FROM  #TEMP WHERE AGContactAIRSId  IS NULL

SELECT * FROM mapfac.dbo.AIRSGROUP a
join  MAPFAC.DBO.ContactAIRS c
on a.contactairsid = c.contactairsid
 WHERE c.contactid <19389

 SELECT C.CONTACTAIRSID,CA.CONTACTAIRSID AS CACONTACTAIRSID 
 INTO #CONTACTAIRSTEMP
 FROM ContactAIRS C
 RIGHT JOIN MAPFAC.DBO.CONTACTAIRS CA
 ON CA.contactairsid = C.contactairsid
 WHERE CA.contactid <19389

 SELECT c.contactid,ce.contactid as cecontactid,ce.ContactMarraigeId as ceContactMarraigeId ,c.ContactMarraigeId 
 into #tempMarraigeHistory
 FROM ContactMarraigeHistory C
 RIGHT JOIN MAPFAC.DBO.ContactMarraigeHistory CE
 ON CE.CONTACTID = C.CONTACTID
 and ce.ContactMarraigeId =c.ContactMarraigeId
 WHERE ce.contactid <19389

 
 
 SELECT C.* FROM MAPFAC.DBO.ContactMarraigeHistory C
 JOIN #tempMarraigeHistory T
 ON T.CECONTACTID = C.CONTACTID
 AND T.ceContactMarraigeId = C.ContactMarraigeId
 WHERE T.contactid IS NULL AND T.CECONTACTID IS NOT NULL

 select * from contactemail where contactid  =13757

  select * from mapfac.dbo.contactemail where contactid  =13757

  SELECT * FROM ContactEthnicity C
  RIGHT  WHERE contactid <19389

 SELECT u.un_user_id , UN.un_user_id as UNun_user_id into #tempun 
 FROM user_notifications U
 RIGHT JOIN MAPFAC.DBO.user_notifications UN
 on u.un_user_id = UN.un_user_id
  WHERE un.un_user_id <13433

   SELECT DISTINCT RR.CONTACTID AS RRCONTACTID ,R.CONTACTID ,RR.RELATIONSHIPID AS RRRELATIONSHIPID, R.RELATIONSHIPID,RR.RELATIONSHIPTYPEID AS RRRELATIONSHIPTYPEID , 
   R.RELATIONSHIPTYPEID
   --INTO #TEMPR
   FROM REL_RELATIONSHIP R
   RIGHT JOIN MAPFAC.DBO.REL_RELATIONSHIP RR
   ON RR.CONTACTID = R.CONTACTID
   AND RR.RELATIONSHIPID = R.RELATIONSHIPID
   AND RR.RELATIONSHIPTYPEID = R.RELATIONSHIPTYPEID
	WHERE RR.contactid < 19389
	
	 SELECT R.* FROM MAPFAC.DBO.REL_RELATIONSHIP R
	 JOIN #TEMPR T
	 ON T.RRCONTACTID = R.CONTACTID 
	  AND T.RRRELATIONSHIPID = R.RELATIONSHIPID
   AND T.RRRELATIONSHIPTYPEID = R.RELATIONSHIPTYPEID
	 WHERE T.CONTACTID IS NULL AND T.RRCONTACTID IS NOT NULL
	 AND T.RRRELATIONSHIPID IN (102305
,102306
,102315
,102316
,102361
,102372
,102381
,102382
,102428
,102437
,102448
,102493
,102494
,102503
,102514
,102559
,102560
,102570
,102579
,102580
,102625
,102626
,102635
,102646
,102691
,102692
,102701
,102711
,102712
,102757
,102768
,102778
,102844
,102889
,102890
,102956
,102965
,102966
,102975
,103022)

	 SELECT * FROM REL_RELATIONSHIP WHERE RELATIONSHIPID IN ( SELECT R.RELATIONSHIPID FROM MAPFAC.DBO.REL_RELATIONSHIP R
	 JOIN #TEMPR T
	 ON T.RRCONTACTID = R.CONTACTID 
	  AND T.RRRELATIONSHIPID = R.RELATIONSHIPID
   AND T.RRRELATIONSHIPTYPEID = R.RELATIONSHIPTYPEID
	 WHERE T.CONTACTID IS NULL AND T.RRCONTACTID IS NOT NULL)

	 SELECT * FROM MAPFAC.DBO.REL_RELATIONSHIP WHERE  CONTACTID IN (19351
,15575
,2778
,2771
,19355
,2776
,15399
,19354
,19335)

	 SELECT * FROM REL_RELATIONSHIP WHERE CONTACTID  = 19351

	 SELECT * FROM REL_LKP_RELATIONSHIPTYPE

	 SELECT * FROM ConnectionStatusLog C
JOIN REL_RELATIONSHIP R
ON R.CONNECTIONID = C.CONNECTIONID
WHERE R.contactid < 19389

SELECT U.USER_ID,UE.USER_ID AS UEUSERID
INTO #TEMPUSER
 FROM User_EffectiveDate U
RIGHT JOIN MAPFAC.DBO.User_EffectiveDate UE
ON UE.USER_ID = U.USER_ID
AND UE.CONNID = U.CONNID
WHERE UE.CONNID >= -19389

SELECT * FROM #TEMPUSER WHERE USER_ID IS NULL

SELECT * FROM User_EffectiveDate WHERE USER_ID IN (13465
,13463)

SELECT * FROM REL_RELATIONSHIP WHERE ConnectionId IN (104167
,45191)
SELECT * FROM REL_RELATIONSHIP WHERE ContactId = 15398
SELECT * FROM MAPFAC.DBO.REL_RELATIONSHIP WHERE ConnectionId IN (104167
,45191)

SELECT * FROM MAPFAC.DBO.User_EffectiveDate WHERE USER_ID IN (13463)

SELECT * FROM CONNECTIONSTATUSLOG WHERE ConnectionId = 104167

SELECT * FROM MAPFAC.DBO.CONNECTIONSTATUSLOG WHERE ConnectionId = 104167

select u.user_id,u.connid,ud.connid as udconnid,ud.user_id as uduserid ,ud.upload_id
into #tempup
from UPLOAD u
right join mapfac.dbo.UPLOAD ud
on ud.user_id = u.user_id
and ud.connid = u.connid
WHERE ud.ConnId >=-19389 

select * from #tempup where user_id is null

select * from mapfac.dbo.upload where user_id = 13465
8293

8293

select ma.receiver_connId , m.receiver_connId as mreceiver_connId
, ma.receiver_userid , m.receiver_userid  as mreceiver_userid 
into #tempm
from MapMsg_addresses m
right join mapfac.dbo.MapMsg_addresses ma
on ma.receiver_connId = m.receiver_connId
and ma.receiver_userid = m.receiver_userid
WHERE ma.receiver_connId >=-19389

select * from #tempm where mreceiver_connId is null