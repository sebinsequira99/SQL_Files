

ALTER TABLE `Profiles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NickName` varchar(255) NOT NULL DEFAULT '',
  `Email` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(40) NOT NULL DEFAULT '',
  `Salt` varchar(10) NOT NULL DEFAULT '',
  `Status` enum('Unconfirmed','Approval','Active','Rejected','Suspended','Inactive') NOT NULL DEFAULT 'Unconfirmed',
  `Role` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `Couple` int(10) unsigned NOT NULL DEFAULT '0',
  `Sex` varchar(255) NOT NULL DEFAULT '',
  `LookingFor` set('male','female') NOT NULL DEFAULT '',
  `Headline` varchar(255) NOT NULL,
  `DescriptionMe` text NOT NULL,
  `Country` varchar(255) NOT NULL DEFAULT '',
  `City` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Featured` tinyint(1) NOT NULL DEFAULT '0',
  `DateReg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastEdit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastLogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastNav` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aff_num` int(10) unsigned NOT NULL DEFAULT '0',
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL,
  `EmailNotify` tinyint(1) NOT NULL DEFAULT '1',
  `LangID` int(11) NOT NULL,
  `UpdateMatch` tinyint(1) NOT NULL DEFAULT '1',
  `Views` int(11) NOT NULL,
  `Rate` float NOT NULL,
  `RateCount` int(11) NOT NULL,
  `CommentsCount` int(11) NOT NULL,
  `PrivacyDefaultGroup` int(11) NOT NULL DEFAULT '3',
  `allow_view_to` int(11) NOT NULL DEFAULT '3',
  `UserStatus` varchar(64) NOT NULL DEFAULT 'online',
  `UserStatusMessage` varchar(255) NOT NULL DEFAULT '',
  `UserStatusMessageWhen` int(10) NOT NULL,
  `Avatar` int(10) unsigned NOT NULL,
  `Height` varchar(255) NOT NULL,
  `Weight` varchar(255) NOT NULL,
  `Income` varchar(255) NOT NULL,
  `Occupation` varchar(255) NOT NULL,
  `Religion` enum('Not Specified','Anglican','Bahai','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian') DEFAULT NULL,
  `Education` enum('Not Specified','High School','Some College','College Degree','Advanced Degree') DEFAULT NULL,
  `RelationshipStatus` varchar(255) NOT NULL DEFAULT '',
  `Hobbies` text NOT NULL,
  `Interests` text NOT NULL,
  `Ethnicity` enum('Any','Bi-Racial','Not Specified','Middle Eastern','Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  `FavoriteSites` text NOT NULL,
  `FavoriteMusic` text NOT NULL,
  `FavoriteFilms` text NOT NULL,
  `FavoriteBooks` text NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `gkcBadgeWidgetConfCode` varchar(32) NOT NULL,
  `ProfileType` varchar(255) DEFAULT '1',
  `AdoptionAgency` varchar(255) NOT NULL DEFAULT '',
  `PromoCode` varchar(255) NOT NULL,
  `Region` enum('Southwest','Southeast','Northwest','Northeast','South-central','North-central','Non US') DEFAULT NULL,
  `ChildAge` set('Newborn - 3 months','Newborn - 6 months','Newborn - 9 months','Newborn - 1 year','Newborn - 2 years','Newborn - 3 years','Newborn - 4 years','Newborn - 5+ years','Newborn','1-2 months','3-4 months','5-6 months','7-8 months','9-11 months','1 year old','2 years old','3 years old','4 years old','5 years old','6 years old','7 years old','8 years old','Over 8 years old') NOT NULL DEFAULT '',
  `FamilyStructure` enum('Not Specified','Married with biological and adopted children','Married with only adopted children','Married with only biological children','Married with no children','Single with biological and adopted children','Single with only adopted children','Single with only biological children','Single with no children','Life partner','Living with life partner','Living with life partner with no children','Living with life partner with biological and adoptive children') DEFAULT NULL,
  `FavoriteMarkStuff` varchar(255) NOT NULL,
  `ChildSpecialNeeds` enum('No','Yes','Open to discussion') NOT NULL DEFAULT 'No',
  `ChildGender` set('Female','Male','Either') NOT NULL DEFAULT '',
  `ChildEthnicity` set('Any','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Middle Eastern','Multi-Racial','Native American (American Indian)','Pacific Islander','Middle Eastern','Asian','Other') NOT NULL DEFAULT '',
  `Pet` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  `Neighborhood` enum('Urban','Suburban','Rural') DEFAULT NULL,
  `Residency` enum('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') DEFAULT NULL,
  `State` enum('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)','Dubai (UAE)') DEFAULT NULL,
  `Facebook` varchar(255) NOT NULL,
  `Twitter` varchar(255) NOT NULL,
  `MySpace` varchar(255) NOT NULL,
  `Smoking` enum('Yes','No') DEFAULT NULL,
  `DueDate` date NOT NULL,
  `BMPhone` varchar(255) NOT NULL,
  `BMTimetoReach` set('Morning','Afternoon','Evening','Anytime') NOT NULL DEFAULT '',
  `BMChildEthnicity` enum('Asian','African American','African American/Asian','Any','Asian/Hispanic','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Middle Eastern','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  `BMChildDOB` date NOT NULL,
  `BMAddress` varchar(255) NOT NULL,
  `YearsMarried` varchar(255) NOT NULL,
  `BMChildSex` enum('Male','Female','Unknown') DEFAULT NULL,
  `RpxProfile` varchar(32) NOT NULL,
  `DearBirthParent` text NOT NULL,
  `WEB_URL` varchar(255) NOT NULL,
  `CLICK_TO_CALL` varchar(255) NOT NULL DEFAULT '0',
  `CONTACT_NUMBER` varchar(255) NOT NULL DEFAULT '0',
  `Fax_Number` varchar(255) NOT NULL,
  `Street_Address` varchar(255) NOT NULL,
  `About_our_home` text NOT NULL,
  `Save_Option` varchar(255) NOT NULL DEFAULT '',
  `SpecialNeedsOptions` set('ADD/ADHD','Alcohol exposed(occasional)','Autism/ Autism Spectrum Disorder','Blindness','Club Foot','Cleft Pallet or lip','Conceived through rape','Conceived through incest','Deafness','Diabeties in Child','Diabeties in Family','Down Syndrome','Drug Exposed (occasional)','Emotional/mental disorders  in family','Epilepsy in Family','Fetal Alcohol Effects','Family mental retardation','HIV/AIDS','limited life expectancy','Mental Retardation','Mild or medically correctable','Multiple Birth','Nothing known about father','Nothing known about mother','Smoking Exposed','Premature Birth','Requires specialized care','Requires life long medical treatment','Sibling group','Sickle Cell Anemia or Trait','Terminally ill','Seizures') NOT NULL DEFAULT '',
  `ChildDesired` set('One child','Twins','Triplets','Siblings') NOT NULL DEFAULT '',
  `BirthFatherStatus` set('None','Birth Father Known','Birth Father Unknown','Multiple Birth fathers','Conceived Through Rape','Conceived Through Incest') NOT NULL DEFAULT '',
  `DrugsAlcohol` set('None','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  `SmokingDuringPregnancy` set('None','Up to a pack a day','More than a pack a day') NOT NULL DEFAULT '',
  `BPFamilyHistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  `Openness` set('Open','Semi-Open','Closed') NOT NULL DEFAULT '',
  `ap_data` varchar(55) NOT NULL,
  `Adoptiontype` varchar(255) NOT NULL DEFAULT '',
  `Specialneeds` varchar(255) NOT NULL DEFAULT '',
  `SpecialneedsOptionss` varchar(255) NOT NULL DEFAULT '',
  `Drinking` varchar(255) NOT NULL DEFAULT '',
  `Druguse` set('None','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  `noofchildren` varchar(255) NOT NULL DEFAULT '',
  `Conception` varchar(255) NOT NULL DEFAULT '',
  `Familyhistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  `BPDrinking` set('None','Alcohol-Frequent','Alcohol-Minimal') NOT NULL DEFAULT '',
  `bprelationtype` set('Open','Single','Married','Living Partners') NOT NULL DEFAULT '',
  `bphousetype` set('Open','Apartment','Condominium','Townhouse','Single Family Home') NOT NULL DEFAULT '',
  `bpreason` varchar(255) NOT NULL DEFAULT '',
  `bpstayathome` enum('Yes','No') DEFAULT NULL,
  `bpethnicity` set('Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Arab','Asian','Other') NOT NULL DEFAULT '',
  `bplocation` set('Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming','Non US (Canada)','Non US (Germany)','Non US (Italy)','US (not specified)') NOT NULL DEFAULT '',
  `bpreligion` set('Open','Anglican','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','LDS / Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian','Not Specified') NOT NULL DEFAULT '',
  `bppets` set('None','Open','Cat','Dog','Other') NOT NULL DEFAULT '',
  `bpdegree` set('Open','High School','Some College','College Degree','Advanced Degree') NOT NULL DEFAULT '',
  `bpage` set('Open','21-25','26-30','31-35','36-40','41-45','46-50','Above 50') NOT NULL DEFAULT '',
  `bpadoption` set('Open Adoption','Closed','Semi-Open') NOT NULL DEFAULT '',
  `bpstructure` set('Open','Married with biological and adopted children','Married with only adopted children','Married with only biological children','Married with no children','Single with biological and adopted children','Single with only adopted children','Single with only biological children','Single with no children','Life partner','Living with life partner','Living with life partner with no children','Living with life partner with biological and adoptive children') NOT NULL DEFAULT '',
  `Stayathome` enum('Yes','No') DEFAULT NULL,
  `Reason` varchar(255) NOT NULL DEFAULT '',
  `globalval` varchar(255) NOT NULL DEFAULT 'No',
  `matchrecords` int(255) DEFAULT NULL,
  `maxmatch` int(255) DEFAULT NULL,
  `Google` varchar(255) NOT NULL,
  `Blogger` varchar(255) NOT NULL,
  `Pinerest` varchar(255) NOT NULL,
  `Age` varchar(255) NOT NULL,
  `waiting` varchar(255) NOT NULL,
  `faith` varchar(255) NOT NULL,
  `housestyle` varchar(255) NOT NULL,
  `noofbedrooms` varchar(11) NOT NULL,
  `noofbathrooms` varchar(11) NOT NULL,
  `yardsize` varchar(11) NOT NULL,
  `neighbourhoodlike` varchar(255) NOT NULL,
  `phonenumber` bigint(11) NOT NULL,
  `agency_letter` text NOT NULL,
  `letter_aboutThem` text NOT NULL,
  `others` text NOT NULL,
  `FacebookProfile` varchar(32) NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) NOT NULL,
  `childrenType` varchar(300) NOT NULL,
  `show_contact` int(11) NOT NULL DEFAULT '0',
  `img_mother` varchar(300) DEFAULT NULL,
  `img_agency` varchar(300) DEFAULT NULL,
  `img_him` varchar(300) DEFAULT NULL,
  `img_her` varchar(300) DEFAULT NULL,
  `img_them` varchar(300) DEFAULT NULL,
  `publishStatus` int(12) NOT NULL DEFAULT '1',
  `publishPwd` varchar(20) NOT NULL,
  `update_letter_mother` datetime DEFAULT NULL,
  `update_letter_me` datetime DEFAULT NULL,
  `update_letter_agency` datetime DEFAULT NULL,
  `update_letter_them` datetime DEFAULT NULL,
  `allow_contact` int(5) NOT NULL DEFAULT '0',
);


ALTER TABLE `Profiles_draft` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NickName` varchar(255) NOT NULL DEFAULT '',
  `Email` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(40) NOT NULL DEFAULT '',
  `Salt` varchar(10) NOT NULL DEFAULT '',
  `Status` enum('Unconfirmed','Approval','Active','Rejected','Suspended','Inactive') NOT NULL DEFAULT 'Unconfirmed',
  `Role` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `Couple` int(10) unsigned NOT NULL DEFAULT '0',
  `Sex` varchar(255) NOT NULL DEFAULT '',
  `LookingFor` set('male','female') NOT NULL DEFAULT '',
  `Headline` varchar(255) NOT NULL,
  `DescriptionMe` text NOT NULL,
  `Country` varchar(255) NOT NULL DEFAULT '',
  `City` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Featured` tinyint(1) NOT NULL DEFAULT '0',
  `DateReg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastEdit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastLogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLastNav` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aff_num` int(10) unsigned NOT NULL DEFAULT '0',
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL,
  `EmailNotify` tinyint(1) NOT NULL DEFAULT '1',
  `LangID` int(11) NOT NULL,
  `UpdateMatch` tinyint(1) NOT NULL DEFAULT '1',
  `Views` int(11) NOT NULL,
  `Rate` float NOT NULL,
  `RateCount` int(11) NOT NULL,
  `CommentsCount` int(11) NOT NULL,
  `PrivacyDefaultGroup` int(11) NOT NULL DEFAULT '3',
  `allow_view_to` int(11) NOT NULL DEFAULT '3',
  `UserStatus` varchar(64) NOT NULL DEFAULT 'online',
  `UserStatusMessage` varchar(255) NOT NULL DEFAULT '',
  `UserStatusMessageWhen` int(10) NOT NULL,
  `Avatar` int(10) unsigned NOT NULL,
  `Height` varchar(255) NOT NULL,
  `Weight` varchar(255) NOT NULL,
  `Income` varchar(255) NOT NULL,
  `Occupation` varchar(255) NOT NULL,
  `Religion` enum('Not Specified','Anglican','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','LDS / Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian') DEFAULT NULL,
  `Education` enum('Not Specified','High School','Some College','College Degree','Advanced Degree') DEFAULT NULL,
  `RelationshipStatus` varchar(255) NOT NULL DEFAULT '',
  `Hobbies` text NOT NULL,
  `Interests` text NOT NULL,
  `Ethnicity` enum('Any','Bi-Racial','Not Specified','Middle Eastern','Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  `FavoriteSites` text NOT NULL,
  `FavoriteMusic` text NOT NULL,
  `FavoriteFilms` text NOT NULL,
  `FavoriteBooks` text NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `gkcBadgeWidgetConfCode` varchar(32) NOT NULL,
  `ProfileType` varchar(255) DEFAULT '1',
  `AdoptionAgency` varchar(255) NOT NULL DEFAULT '',
  `PromoCode` varchar(255) NOT NULL,
  `Region` enum('Southwest','Southeast','Northwest','Northeast','South-central','North-central','Non US') DEFAULT NULL,
  `ChildAge` set('Newborn - 3 months','Newborn - 6 months','Newborn - 9 months','Newborn - 1 year','Newborn - 2 years','Newborn - 3 years','Newborn - 4 years','Newborn - 5+ years','Newborn','1-2 months','3-4 months','5-6 months','7-8 months','9-11 months','1 year old','2 years old','3 years old','4 years old','5 years old','6 years old','7 years old','8 years old','Over 8 years old') NOT NULL DEFAULT '',
  `FamilyStructure` enum('Not Specified','Married with biological and adopted children','Married with only adopted children','Married with only biological children','Married with no children','Single with biological and adopted children','Single with only adopted children','Single with only biological children','Single with no children','Life partner','Living with life partner','Living with life partner with no children','Living with life partner with biological and adoptive children') DEFAULT NULL,
  `FavoriteMarkStuff` varchar(255) NOT NULL,
  `ChildSpecialNeeds` enum('No','Yes','Open to discussion') NOT NULL DEFAULT 'No',
  `ChildGender` set('Female','Male','Either') NOT NULL DEFAULT '',
  `ChildEthnicity` set('Any','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Middle Eastern','Multi-Racial','Native American (American Indian)','Pacific Islander','Middle Eastern','Asian','Other') NOT NULL DEFAULT '',
  `Pet` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  `Neighborhood` enum('Urban','Suburban','Rural') DEFAULT NULL,
  `Residency` enum('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') DEFAULT NULL,
  `State` enum('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)','Dubai (UAE)') DEFAULT NULL,
  `Facebook` varchar(255) NOT NULL,
  `Twitter` varchar(255) NOT NULL,
  `MySpace` varchar(255) NOT NULL,
  `Smoking` enum('Yes','No') DEFAULT NULL,
  `DueDate` date NOT NULL,
  `BMPhone` varchar(255) NOT NULL,
  `BMTimetoReach` enum('Morning','Afternoon','Evening','Anytime') DEFAULT NULL,
  `BMChildEthnicity` enum('Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Middle Eastern','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  `BMChildDOB` date NOT NULL,
  `BMAddress` varchar(255) NOT NULL,
  `YearsMarried` varchar(255) NOT NULL,
  `BMChildSex` enum('Male','Female','Unknown') DEFAULT NULL,
  `RpxProfile` varchar(32) NOT NULL,
  `DearBirthParent` text NOT NULL,
  `WEB_URL` varchar(255) NOT NULL,
  `CLICK_TO_CALL` varchar(255) NOT NULL DEFAULT '0',
  `CONTACT_NUMBER` varchar(255) NOT NULL DEFAULT '0',
  `Fax_Number` varchar(255) NOT NULL,
  `Street_Address` varchar(255) NOT NULL,
  `About_our_home` text NOT NULL,
  `Save_Option` varchar(255) NOT NULL DEFAULT '',
  `SpecialNeedsOptions` set('ADD/ADHD','Alcohol exposed(occasional)','Autism/ Autism Spectrum Disorder','Blindness','Club Foot','Cleft Pallet or lip','Conceived through rape','Conceived through incest','Deafness','Diabeties in Child','Diabeties in Family','Down Syndrome','Drug Exposed (occasional)','Emotional/mental disorders  in family','Epilepsy in Family','Fetal Alcohol Effects','Family mental retardation','HIV/AIDS','limited life expectancy','Mental Retardation','Mild or medically correctable','Multiple Birth','Nothing known about father','Nothing known about mother','Smoking Exposed','Premature Birth','Requires specialized care','Requires life long medical treatment','Sibling group','Sickle Cell Anemia or Trait','Terminally ill','Seizures') NOT NULL DEFAULT '',
  `ChildDesired` set('One child','Twins','Triplets','Siblings') NOT NULL DEFAULT '',
  `BirthFatherStatus` set('None','Birth Father Known','Birth Father Unknown','Multiple Birth fathers','Conceived Through Rape','Conceived Through Incest') NOT NULL DEFAULT '',
  `DrugsAlcohol` set('None','Alcohol-Frequent','Alcohol-Minimal','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  `SmokingDuringPregnancy` set('None','Up to a pack a day','More than a pack a day') NOT NULL DEFAULT '',
  `BPFamilyHistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') DEFAULT NULL,
  `Openness` set('Open','Semi-Open','Closed') NOT NULL DEFAULT '',
  `esase_profileinfo_notify` int(11) NOT NULL,
  `ap_data` varchar(55) NOT NULL,
  `Adoptiontype` varchar(255) NOT NULL DEFAULT '',
  `Specialneeds` varchar(255) NOT NULL DEFAULT '',
  `SpecialneedsOptionss` varchar(255) NOT NULL DEFAULT '',
  `Drinking` varchar(255) NOT NULL DEFAULT '',
  `Druguse` varchar(255) NOT NULL DEFAULT '',
  `noofchildren` varchar(255) NOT NULL DEFAULT '',
  `Conception` varchar(255) NOT NULL DEFAULT '',
  `Familyhistory` set('Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  `BPDrinking` set('None','Alcohol-Frequent','Alcohol-Minimal') NOT NULL DEFAULT '',
  `bprelationtype` varchar(255) NOT NULL DEFAULT '',
  `bphousetype` set('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') NOT NULL DEFAULT '',
  `bpreason` varchar(255) NOT NULL DEFAULT '',
  `bpstayathome` enum('Yes','No') DEFAULT NULL,
  `bpethnicity` set('Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Arab','Asian','Other') NOT NULL DEFAULT '',
  `bplocation` set('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)') NOT NULL DEFAULT '',
  `bpreligion` set('Not Specified','Anglican','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','LDS / Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian','Not Specified') NOT NULL DEFAULT '',
  `bppets` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  `bpdegree` set('Not Specified','High School','Some College','College Degree','Advanced Degree') NOT NULL DEFAULT '',
  `bpage` set('15-20','21-25','31-35','36-40','41-45','46-50','Above 50') NOT NULL DEFAULT '',
  `bpadoption` varchar(255) NOT NULL DEFAULT '',
  `bpstructure` enum('Not Specified','Married, with biological and adopted children','Married, with only adopted children','Married, with only biological children','Married, with no children','Single, with biological and adopted children','Single, with only adopted children','Single, with only biological children','Single, with no children','Life partner','Living with life partner') DEFAULT NULL,
  `Stayathome` enum('Yes','No') DEFAULT NULL,
  `Reason` varchar(255) NOT NULL DEFAULT '',
  `globalval` varchar(255) NOT NULL DEFAULT 'No',
  `matchrecords` int(255) DEFAULT NULL,
  `maxmatch` int(255) DEFAULT NULL,
  `Google` varchar(255) NOT NULL,
  `Blogger` varchar(255) NOT NULL,
  `Pinerest` varchar(255) NOT NULL,
  `Age` varchar(255) NOT NULL,
  `waiting` varchar(255) NOT NULL,
  `faith` varchar(255) NOT NULL,
  `housestyle` varchar(255) NOT NULL,
  `noofbedrooms` varchar(11) NOT NULL,
  `noofbathrooms` varchar(11) NOT NULL,
  `yardsize` varchar(11) NOT NULL,
  `neighbourhoodlike` varchar(255) NOT NULL,
  `phonenumber` bigint(50) NOT NULL,
  `agency_letter` text NOT NULL,
  `letter_aboutThem` text NOT NULL,
  `others` text NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) NOT NULL,
  `childrenType` varchar(300) NOT NULL,
  `show_contact` int(11) NOT NULL DEFAULT '0',
  `img_mother` varchar(300) DEFAULT NULL,
  `img_agency` varchar(300) DEFAULT NULL,
  `img_him` varchar(300) DEFAULT NULL,
  `img_her` varchar(300) DEFAULT NULL,
  `img_them` varchar(300) DEFAULT NULL,
  `publishStatus` int(12) NOT NULL DEFAULT '1',
  `publishPwd` varchar(20) NOT NULL,
  `update_letter_mother` datetime DEFAULT NULL,
  `update_letter_me` datetime DEFAULT NULL,
  `update_letter_agency` datetime DEFAULT NULL,
  `update_letter_them` datetime DEFAULT NULL,
  `allow_contact` int(5) NOT NULL DEFAULT '0',
) ;
