USE MAPFACQB_STAGE
go

/******************Add column OLDUSER_ID ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_applicationchecklistforinternationaladoptions'))    
BEGIN
	ALTER TABLE FORMMAKER_77_applicationchecklistforinternationaladoptions
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_topicsfordiscussion'))    
BEGIN
	ALTER TABLE FORMMAKER_77_topicsfordiscussion
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_instructionsforreleaseofinformationforms'))    
BEGIN
	ALTER TABLE FORMMAKER_77_instructionsforreleaseofinformationforms
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_instructionsforreleaseofinformationforms'))    
BEGIN
	ALTER TABLE FORMMAKER_77_instructionsforreleaseofinformationforms
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_topicsfordiscussion_1'))    
BEGIN
	ALTER TABLE FORMMAKER_77_topicsfordiscussion_1
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_informationreceivedacknowledgemnt'))    
BEGIN
	ALTER TABLE FORMMAKER_77_informationreceivedacknowledgemnt
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_formalapplication_1'))    
BEGIN
	ALTER TABLE FORMMAKER_77_formalapplication_1
	ADD OLDUSER_ID INT
END
GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'OLDUSER_ID' AND Object_ID = Object_ID(N'FORMMAKER_77_adoptiveapplicantfinancialstatement'))    
BEGIN
	ALTER TABLE FORMMAKER_77_adoptiveapplicantfinancialstatement
	ADD OLDUSER_ID INT
END
GO
/************************************************************************************************************/
/*******Insert to FORMMAKER_77_applicationchecklistforinternationaladoptions*******/
SELECT	f.user_id,
		fp.user_id AS FPUSER_ID,
		f.connid,
		fp.connid AS FPCONNID,
		f.data_id,
		fp.data_id AS FPDATA_ID 
INTO #temp
FROM FORMMAKER_77_applicationchecklistforinternationaladoptions f
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_applicationchecklistforinternationaladoptions FP
ON F.USER_ID = FP.USER_ID AND F.CONNID = FP.CONNID AND F.DATA_ID = FP.DATA_ID
WHERE FP.USER_ID <13433
GO

INSERT INTO FORMMAKER_77_applicationchecklistforinternationaladoptions
(
user_id
,key_id
,input_checklist1
,input_selfstudy
,input_ccpp
,input_erl
,input_checklistfortopic
,input_photocopy
,input_licensedriver
,input_creditreport
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)

SELECT F.user_id
,F.key_id
,F.input_checklist1
,F.input_selfstudy
,F.input_ccpp
,F.input_erl
,F.input_checklistfortopic
,F.input_photocopy
,F.input_licensedriver
,F.input_creditreport
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.user_id
 FROM MAPFAC.DBO.FORMMAKER_77_applicationchecklistforinternationaladoptions F
JOIN #temp T
ON T.FPUSER_ID = f.USER_ID
AND T.FPCONNID = F.CONNID
WHERE T.FPUSER_ID IS NOT NULL AND T.USER_ID IS NULL

--2

/*******Insert to FORMMAKER_77_topicsfordiscussion*******/

SELECT	FD.USER_ID AS FDUSER_ID, 
		F.USER_ID,
		FD.CONNID AS FDCONNID, 
		F.CONNID 
INTO #TEMP1
FROM FORMMAKER_77_topicsfordiscussion F
RIGHT JOIN MAPFAC.DBO.FORMMAKER_77_topicsfordiscussion FD
ON FD.USER_ID = F.USER_ID
AND FD.CONNID = F.CONNID
WHERE FD.USER_ID <13433
go

INSERT INTO FORMMAKER_77_topicsfordiscussion
(
user_id
,key_id
,input_ap1fname
,input_ap1lname
,input_check
,input_list
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)
SELECT F.user_id
,F.key_id
,F.input_ap1fname
,F.input_ap1lname
,F.input_check
,F.input_list
,F.ConnId
,F.ConnectionId
,F.isXML
,F.formFullData
,F.USER_ID
FROM MAPFAC.DBO.FORMMAKER_77_topicsfordiscussion F
JOIN #TEMP1 T
ON T.FDUSER_ID = F.USER_ID
AND T.FDCONNID = F.CONNID
WHERE T.FDUSER_ID IS NOT NULL AND T.USER_ID IS NULL

--1

/*******Insert to FORMMAKER_77_instructionsforreleaseofinformationforms*******/

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

INSERT INTO FORMMAKER_77_instructionsforreleaseofinformationforms
(
user_id
,key_id
,input_ap1fname
,input_ap1mname
,input_ap1lname
,input_add1
,input_add2
,input_city
,input_state
,input_zip
,input_rfno
,input_ap1signature
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)

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
,F.USER_ID 
FROM MAPFAC.DBO.FORMMAKER_77_instructionsforreleaseofinformationforms F
JOIN #TEMP2 T
ON T.FIUSER_ID = F.USER_ID
AND T.FICONNID = F.CONNID
WHERE T.FIUSER_ID IS NOT NULL AND T.USER_ID IS NULL

--1

/*******Insert to FORMMAKER_77_topicsfordiscussion_1*******/

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

INSERT INTO FORMMAKER_77_topicsfordiscussion_1
(
user_id
,key_id
,input_ap2fname
,input_ap2lname
,input_check
,input_list
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)
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

--2

/*******Insert to FORMMAKER_77_informationreceivedacknowledgemnt*******/

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

INSERT INTO FORMMAKER_77_informationreceivedacknowledgemnt
(
user_id
,key_id
,input_ap1fname
,input_ap1lname
,input_ap1signature
,input_dateap1
,input_ap2fname
,input_ap2lname
,input_ap2signature
,input_dateap2
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)
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

--1

/*******Insert to FORMMAKER_77_formalapplication_1*******/
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

INSERT INTO FORMMAKER_77_formalapplication_1
(
user_id
,key_id
,input_ap1fname
,input_ap2fname
,input_ap1mname
,input_ap2mname
,input_ap1lname
,input_ap2lname
,input_ap1aliasename_76
,input_ap2aliasename_77
,input_add1
,input_add2
,input_city
,input_ap2city_78
,input_county
,input_ap2county
,input_state
,input_ap2state_79
,input_zip
,input_zipap2_44
,input_homephone
,input_ap2homephone_80
,input_ap1cellphone
,input_ap2cellphone
,input_ap1workphone
,input_ap2workphone
,input_ap1email
,input_ap2email
,input_ap1dob
,input_ap2dob
,input_ap1birthcity
,input_ap2birthcity
,input_ap1ethnicity
,input_ap2ethnicity
,input_ap1race
,input_ap2race
,input_citizenshipap2_46
,input_citizenshipap1_81
,input_ap1alienno
,input_ap2alienno_82
,input_ap1ssn
,input_ap2ssn
,input_ap1religion
,input_ap2religion
,input_ap1marraigedate2
,input_ap2marraigedate2
,input_ap1marplace_83
,input_ap2marplace_84
,input_ap1premarsponame_85
,input_ap1marraigedate
,input_premarplaceap1
,input_ap1terminwhere_86
,input_ap1terminhow_87
,input_ap2prespousename_88
,input_ap2terminationdate
,input_placepremarterap2_89
,input_ap2reasonter_90
,input_termwhereap2_91
,input_ap1fathername_92
,input_ap2fathername_93
,input_fatheroccap1_94
,input_ap2fatherocc_95
,input_ap1fatherliving_96
,input_ap2fatherliving_97
,input_ap1mothername_98
,input_ap2mothersname_99
,input_ap1motherocc_100
,input_ap2mothersocc_101
,input_ap1motherliving_102
,input_ap2motherliving_103
,input_ap1sib1name_104
,input_ap2sib1name_105
,input_ap1sib1dob_106
,input_ap2sib1dob_107
,input_ap1sib2name_108
,input_ap2sib2name_109
,input_ap1sib2dob_110
,input_ap2sib2dob_111
,input_ap1sib3name_112
,input_ap2sib3name_113
,input_ap2dobsib3
,input_ap2sib3dob_115
,input_rel1fname
,input_rel1lname
,input_child1placeofbirth_116
,input_rel1gender
,input_rel1dob
,input_child1ssn_117
,input_rel1relationship
,input_child1living_57
,input_rel2fname
,input_rel2lname
,input_child2birthplace_118
,input_rel2gender
,input_rel2dob
,input_child2ssn_119
,input_rel2relationship
,input_child2living_58
,input_rel3fname
,input_rel3lname
,input_child3birthplace_120
,input_rel3gender
,input_child3ssn_121
,input_rel3dob
,input_rel3relationship
,input_child3living_59
,input_rel4fname
,input_rel4lname
,input_child4placeofbirth_122
,input_rel4gender
,input_rel4dob
,input_child4ssn_123
,input_rel4relationship
,input_rel5fname
,input_rel5lname
,input_rel5gender
,input_rel5dob
,input_otheradult1ssn_124
,input_adult1relap1_125
,input_adult1relap2_126
,input_rel6fname
,input_rel6lname
,input_rel6gender
,input_rel6dob
,input_adult2ssn_127
,input_adult2relap1_128
,input_adult2relap2_129
,input_reason
,input_qualities
,input_childlessreason
,input_seriouscon
,input_treatmentdetails
,input_releaseofcontact
,input_hometype
,input_noofrooms_130
,input_noofbedrooms_131
,input_mortgage
,input_rent
,input_squarefootage
,input_lotsize
,input_ap1collegename
,input_ap2collegename
,input_ap1collegecity
,input_ap2collegecity
,input_ap1collegestate
,input_ap2collegestate
,input_c1datesap1
,input_c1datesap2
,input_degreeap1
,input_degreeap2
,input_college2ap1
,input_college2ap2
,input_cityap1college2
,input_cityap2college2
,input_ap1state2
,input_ap2state2
,input_ap1datescoll2
,input_ap1datescol22
,input_ap1degree2
,input_ap2degree2
,input_vocationap1
,input_vocationap2
,input_ap1dates1
,input_ap2dates1
,input_ap1degreevoc
,input_ap2degreevoc
,input_ap1hsname1
,input_ap2hsname1
,input_ap1cityhs1
,input_ap2cityhs1
,input_ap1state2hs
,input_ap2state2hs
,input_ap1sateshs1
,input_ap2dateshs1
,input_ap1degreehs1
,input_ap2degreehs1
,input_ap1hsname2
,input_ap2hsname2
,input_ap1cityhs2
,input_ap2cityhs2
,input_ap1statehs2
,input_ap2statehs2
,input_ap1dasteshs2
,input_ap2dasteshs2
,input_ap1degreehs2
,input_ap2degreehs2
,input_emp1fname
,input_emp2fname
,input_ap1occ_49
,input_ap2occ_50
,input_ap1years
,input_yearsap2
,input_emp1salary
,input_emp2salary
,input_type
,input_typeap2
,input_brachap1
,input_branchap2
,input_ap1preocc_132
,input_ap2preocc
,input_yearspreap1
,input_yearspreap2
,input_ap1preemplo
,input_ap2preemplo
,input_ap1preocc2
,input_ocupat
,input_ap1years2
,input_ap2years2
,input_annualap1
,input_ap2annual
,input_typeap12
,input_trypeap1
,input_grandparentnameap1
,input_grandparentnameap2
,input_ap1gpadd
,input_gpaddap2
,input_ap1citygp
,input_ap2citygp
,input_ap1stategp
,input_ap2stategp
,input_zipap1gp
,input_zipstateap2
,input_ref1fname
,input_ref1lname
,input_ref1add1
,input_ref1add2
,input_neighborphone
,input_ref1city
,input_ref1state
,input_ref1zip
,input_ref2fname
,input_ref2lname
,input_ref2add1
,input_ref2add2
,input_ref2phone
,input_ref2city
,input_ref2state
,input_ref2zip
,input_ref3fname
,input_ref3lname
,input_ref3add1
,input_ref3add2
,input_ref3phone
,input_ref3city
,input_ref3state
,input_ref3zip
,input_ref4fname
,input_ref4lname
,input_ref4add1
,input_ref4add2
,input_ref4phone
,input_ref4city
,input_ref4state
,input_ref4zip
,input_ap1employer
,input_emp1add1
,input_employerphone
,input_emp1city
,input_emp1state
,input_emp1zip
,input_ap1empname
,input_emp2add1
,input_ap2emphone
,input_emp2city
,input_emp2state
,input_emp2zip
,input_ref5fname
,input_ref5lname
,input_ref5add1
,input_ref5phone
,input_ref5city
,input_ref5state
,input_ref5zip
,input_ref6fname
,input_ref6lname
,input_ref6add1
,input_ref6phone
,input_ref6city
,input_ref6state
,input_ref6zip
,input_ap1street1_146
,input_ap2street1_147
,input_ap1city1
,input_ap2city2_148
,input_ap1county1_149
,input_ap2county1_150
,input_ap1state1_151
,input_ap2state1
,input_ap1zip1
,input_ap2zip1
,input_ap1datesoffres1
,input_ap2datesofres1
,input_ap1forcountry1_152
,input_ap2forcountry1
,input_ap1street2
,input_ap2street2
,input_ap1city2
,input_ap2city
,input_ap1county2
,input_ap2county2
,input_ap1state
,input_ap2state
,input_ap1zip2
,input_ap2zip2
,input_ap1street3
,input_ap2street3
,input_ap1county3
,input_ap2county3
,input_ap1state3
,input_ap2state3
,input_ap1city3
,input_ap2city3
,input_ap1zip3
,input_ap2zip3
,input_ap1datesofres2
,input_ap2datesofres2
,input_ap2forcountry2
,input_ap2forcountry
,input_ap1street4
,input_ap2street4
,input_ap1city4
,input_ap2city4
,input_ap1county4
,input_ap2county4
,input_ap1state4
,input_ap2state4
,input_ap1zip4
,input_ap2zip4
,input_ap1datesofres3
,input_ap2datesofres4
,input_ap1forcountry3
,input_ap2forcountry3
,input_ap1datesofres4
,input_ap2datesofres
,input_ap1forcountry4
,input_ap2forcountry4
,input_ap1street5
,input_ap2street5
,input_ap1city5
,input_ap2city5
,input_ap1county5
,input_ap2county5
,input_ap2state5
,input_ap2states
,input_ap1zip5
,input_ap2zip5
,input_ap1datesofres5
,input_ap2datesofres5
,input_ap1forcountry5
,input_ap2forcountry5
,input_histofarrest
,input_ifyes1
,input_childabuseinvesti
,input_ifyes2
,input_subabusehist
,input_ifyes3
,input_domviolencehist
,input_hscompleted
,input_ifyes4
,input_ap1signature
,input_signdate1
,input_ap2signature
,input_signdate2
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)

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

--1
/*******Insert to FORMMAKER_77_adoptiveapplicantfinancialstatement*******/
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

INSERT INTO FORMMAKER_77_adoptiveapplicantfinancialstatement
(
user_id
,key_id
,input_ap1fname
,input_ap1lname
,input_ap2fname
,input_ap2lname
,input_depadults
,input_depchildren
,input_famember1
,input_memb1grosspay
,input_memb2netpay
,input_famember2
,input_memb2grosspay
,input_memb1netpay
,input_otherinc
,input_totalincome
,input_rent
,input_boats
,input_homeequity
,input_tuition
,input_propertytaxes
,input_food
,input_inshome
,input_clothing
,input_telephone
,input_cellphone
,input_heat
,input_electric
,input_cableservice
,input_watersewer
,input_trash
,input_mediexp
,input_medins
,input_disabilityions
,input_entertainment
,input_gifts
,input_lifeins
,input_carins
,input_homemaintenance
,input_autolicense
,input_personalcare
,input_charity
,input_childcare
,input_religiouscontri
,input_schoolsupplies
,input_gasoline
,input_creditcardpayments
,input_vacations
,input_schooloan
,input_lunch
,input_unreimbursedexp
,input_cloth
,input_empgifts
,input_childsupportali
,input_regsavings
,input_investmentsretire
,input_car1loan
,input_car2loan
,input_selfemptaxes
,input_otherselfempexp
,input_otherloanpay
,input_subtotal1
,input_subtotal2
,input_totalexp
,input_resimktvalue
,input_otherrealestatemktval
,input_car1value
,input_car1
,input_car2value
,input_car2
,input_boatrv
,input_boatvalue_153
,input_savings
,input_retirement
,input_stocksandbonds
,input_investmentsassets
,input_otherassetsvalue
,input_otherassets
,input_totalassets
,input_residencemortagage
,input_othermortagage
,input_car1liabilty
,input_car1name
,input_carloan
,input_car2loans
,input_boatsli
,input_otherloans
,input_otherloansliab
,input_creditcardss
,input_1
,input_2
,input_3
,input_otherloansvalue
,input_otherspecify1
,input_otherloansvalue2
,input_other
,input_totalaibilities
,input_excludedinc
,input_exincome1
,input_excludedinc2
,input_exincome2
,input_totalexincome
,input_liap1
,input_ap1limonthlycost
,input_liap1company
,input_liap2
,input_ap2li
,input_licompap1
,input_child1lifeins
,input_monthlycostchild1
,input_lifeinscompchild1
,input_child2li
,input_child2limonthlycost
,input_comchild2
,input_ch3lifeins
,input_child3monthlycost
,input_lifeinscompch3
,input_ap1medins
,input_ap1medinscost
,input_com
,input_medinsap2
,input_ap2moncost
,input_comp
,input_lifeinschil1
,input_childmedinscost
,input_compa
,input_child
,input_ap2monthcost
,input_co
,input_ap1medicaid1
,input_monap
,input_apcom
,input_apmedica
,input_monap2
,input_ap2com
,input_child1medicaid
,input_c
,input_child1mon
,input_chmed2
,input_ch2mon
,input_ch2com
,input_ch1
,input_ch3mon
,input_compch3
,input_dis
,input_dismonth
,input_comch3
,input_otherins
,input_totalcov
,input_company1
,input_info_155
,input_ap1signature
,input_dateap1
,input_date2
,input_ap2signature
,ConnId
,ConnectionId
,isXML
,formFullData
,OLDUSER_ID
)

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

--1