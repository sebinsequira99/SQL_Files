

mapat

rel_relationship where displayname like '%gervais, anne%' --26707
rel_relationship where displayname like '%russell, amita%' --24793
rel_relationship where displayname like '%lillis, joseph%' --27055
rel_relationship where displayname like '%fontaine, scott%' --24958
rel_relationship where displayname like '%mahone, melissa%' --24586
rel_relationship where displayname like '%mir, syeda%' --24508,24509
rel_relationship where displayname like '%quesinberry%' --17156
rel_relationship where displayname like '%white, amanda%' --26367
rel_relationship where displayname like '%zia, noor%' --24840
rel_relationship where displayname like '%licensing%' --13732

caseworker_client where parentid in(26707,24793,27055
,24958,24586,24508,24509,17156,26367,24840) and caseworkerid=13732

CW_HistoryDtls where connectionid in(423750,387358,441149,389836,373512,369600
,369609,344607,348860,405914,386113) and cw_userid=13732

