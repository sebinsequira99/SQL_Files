ALTER TABLE `Profiles` 
  modify `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  modify `NickName` varchar(255) NOT NULL DEFAULT '',
  modify `Email` varchar(255) NOT NULL DEFAULT '',
  modify `Password` varchar(40) NOT NULL DEFAULT '',
  modify `Salt` varchar(10) NOT NULL DEFAULT '',
  modify `Status` enum('Unconfirmed','Approval','Active','Rejected','Suspended','Inactive') NOT NULL DEFAULT 'Unconfirmed',
  modify `Role` tinyint(4) unsigned NOT NULL DEFAULT '1',
  modify `Couple` int(10) unsigned NOT NULL DEFAULT '0',
  modify `Sex` varchar(255) NOT NULL DEFAULT '',
  modify `LookingFor` set('male','female') NOT NULL DEFAULT '',
  modify `Headline` varchar(255) NOT NULL,
  modify `DescriptionMe` text NOT NULL,
  modify `Country` varchar(255) NOT NULL DEFAULT '',
  modify `City` varchar(255) NOT NULL,
  modify `DateOfBirth` date NOT NULL,
  modify `Featured` tinyint(1) NOT NULL DEFAULT '0',
  modify `DateReg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  modify `DateLastEdit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  modify `DateLastLogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  modify `DateLastNav` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  modify `aff_num` int(10) unsigned NOT NULL DEFAULT '0',
  modify `Tags` varchar(255) NOT NULL DEFAULT '',
  modify `zip` varchar(255) NOT NULL,
  modify `EmailNotify` tinyint(1) NOT NULL DEFAULT '1',
  modify `LangID` int(11) NOT NULL,
  modify `UpdateMatch` tinyint(1) NOT NULL DEFAULT '1',
  modify `Views` int(11) NOT NULL,
  modify `Rate` float NOT NULL,
  modify `RateCount` int(11) NOT NULL,
  modify `CommentsCount` int(11) NOT NULL,
  modify `PrivacyDefaultGroup` int(11) NOT NULL DEFAULT '3',
  modify `allow_view_to` int(11) NOT NULL DEFAULT '3',
  modify `UserStatus` varchar(64) NOT NULL DEFAULT 'online',
  modify `UserStatusMessage` varchar(255) NOT NULL DEFAULT '',
  modify `UserStatusMessageWhen` int(10) NOT NULL,
  modify `Avatar` int(10) unsigned NOT NULL,
  modify `Height` varchar(255) NOT NULL,
  modify `Weight` varchar(255) NOT NULL,
  modify `Income` varchar(255) NOT NULL,
  modify `Occupation` varchar(255) NOT NULL,
  modify `Religion` enum('Not Specified','Anglican','Bahai','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian') DEFAULT NULL,
  modify `Education` enum('Not Specified','High School','Some College','College Degree','Advanced Degree') DEFAULT NULL,
  modify `RelationshipStatus` varchar(255) NOT NULL DEFAULT '',
  modify `Hobbies` text NOT NULL,
  modify `Interests` text NOT NULL,
  modify `Ethnicity` enum('Any','Bi-Racial','Not Specified','Middle Eastern','Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  modify `FavoriteSites` text NOT NULL,
  modify `FavoriteMusic` text NOT NULL,
  modify `FavoriteFilms` text NOT NULL,
  modify `FavoriteBooks` text NOT NULL,
  modify `FirstName` varchar(255) NOT NULL,
  modify `LastName` varchar(255) NOT NULL,
  modify `gkcBadgeWidgetConfCode` varchar(32) NOT NULL,
  modify `ProfileType` varchar(255) DEFAULT '1',
  modify `AdoptionAgency` varchar(255) NOT NULL DEFAULT '',
  modify `PromoCode` varchar(255) NOT NULL,
  modify `Region` enum('Southwest','Southeast','Northwest','Northeast','South-central','North-central','Non US') DEFAULT NULL,
  modify `ChildAge` set('Newborn - 3 months','Newborn - 6 months','Newborn - 9 months','Newborn - 1 year','Newborn - 2 years','Newborn - 3 years','Newborn - 4 years','Newborn - 5+ years','Newborn','1-2 months','3-4 months','5-6 months','7-8 months','9-11 months','1 year old','2 years old','3 years old','4 years old','5 years old','6 years old','7 years old','8 years old','Over 8 years old') NOT NULL DEFAULT '',
  modify `FamilyStructure` enum('Not Specified','Married with biological and adopted children','Married with only adopted children','Married with only biological children','Married with no children','Single with biological and adopted children','Single with only adopted children','Single with only biological children','Single with no children','Life partner','Living with life partner','Living with life partner with no children','Living with life partner with biological and adoptive children') DEFAULT NULL,
  modify `FavoriteMarkStuff` varchar(255) NOT NULL,
  modify `ChildSpecialNeeds` enum('No','Yes','Open to discussion') NOT NULL DEFAULT 'No',
  modify `ChildGender` set('Female','Male','Either') NOT NULL DEFAULT '',
  modify `ChildEthnicity` set('Any','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Middle Eastern','Multi-Racial','Native American (American Indian)','Pacific Islander','Asian','Other') NOT NULL DEFAULT '',
  modify `Pet` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  modify `Neighborhood` enum('Urban','Suburban','Rural') DEFAULT NULL,
  modify `Residency` enum('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') DEFAULT NULL,
  modify `State` enum('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)','Dubai (UAE)') DEFAULT NULL,
  modify `Facebook` varchar(255) NOT NULL,
  modify `Twitter` varchar(255) NOT NULL,
  modify `MySpace` varchar(255) NOT NULL,
  modify `Smoking` enum('Yes','No') DEFAULT NULL,
  modify `DueDate` date NOT NULL,
  modify `BMPhone` varchar(255) NOT NULL,
  modify `BMTimetoReach` set('Morning','Afternoon','Evening','Anytime') NOT NULL DEFAULT '',
  modify `BMChildEthnicity` enum('Asian','African American','African American/Asian','Any','Asian/Hispanic','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Middle Eastern','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
  modify `BMChildDOB` date NOT NULL,
  modify `BMAddress` varchar(255) NOT NULL,
  modify `YearsMarried` varchar(255) NOT NULL,
  modify `BMChildSex` enum('Male','Female','Unknown') DEFAULT NULL,
  modify `RpxProfile` varchar(32) NOT NULL,
  modify `DearBirthParent` text NOT NULL,
  modify `WEB_URL` varchar(255) NOT NULL,
  modify `CLICK_TO_CALL` varchar(255) NOT NULL DEFAULT '0',
  modify `CONTACT_NUMBER` varchar(255) NOT NULL DEFAULT '0',
  modify `Fax_Number` varchar(255) NOT NULL,
  modify `Street_Address` varchar(255) NOT NULL,
  modify `About_our_home` text NOT NULL,
  modify `Save_Option` varchar(255) NOT NULL DEFAULT '',
  modify `SpecialNeedsOptions` set('ADD/ADHD','Alcohol exposed(occasional)','Autism/ Autism Spectrum Disorder','Blindness','Club Foot','Cleft Pallet or lip','Conceived through rape','Conceived through incest','Deafness','Diabeties in Child','Diabeties in Family','Down Syndrome','Drug Exposed (occasional)','Emotional/mental disorders  in family','Epilepsy in Family','Fetal Alcohol Effects','Family mental retardation','HIV/AIDS','limited life expectancy','Mental Retardation','Mild or medically correctable','Multiple Birth','Nothing known about father','Nothing known about mother','Smoking Exposed','Premature Birth','Requires specialized care','Requires life long medical treatment','Sibling group','Sickle Cell Anemia or Trait','Terminally ill','Seizures') NOT NULL DEFAULT '',
  modify `ChildDesired` set('One child','Twins','Triplets','Siblings') NOT NULL DEFAULT '',
  modify `BirthFatherStatus` set('None','Birth Father Known','Birth Father Unknown','Multiple Birth fathers','Conceived Through Rape','Conceived Through Incest') NOT NULL DEFAULT '',
  modify `DrugsAlcohol` set('None','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  modify `SmokingDuringPregnancy` set('None','Up to a pack a day','More than a pack a day') NOT NULL DEFAULT '',
  modify `BPFamilyHistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  modify `Openness` set('Open','Semi-Open','Closed') NOT NULL DEFAULT '',
  modify `ap_data` varchar(55) NOT NULL,
  modify `Adoptiontype` varchar(255) NOT NULL DEFAULT '',
  modify `Specialneeds` varchar(255) NOT NULL DEFAULT '',
  modify `SpecialneedsOptionss` varchar(255) NOT NULL DEFAULT '',
  modify `Drinking` varchar(255) NOT NULL DEFAULT '',
  modify `Druguse` set('None','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  modify `noofchildren` varchar(255) NOT NULL DEFAULT '',
  modify `Conception` varchar(255) NOT NULL DEFAULT '',
  modify `Familyhistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  modify `BPDrinking` set('None','Alcohol-Frequent','Alcohol-Minimal') NOT NULL DEFAULT '',
  modify `bprelationtype` set('Open','Single','Married','Living Partners') NOT NULL DEFAULT '',
  modify `bphousetype` set('Open','Apartment','Condominium','Townhouse','Single Family Home') NOT NULL DEFAULT '',
  modify `bpreason` varchar(255) NOT NULL DEFAULT '',
  modify `bpstayathome` enum('Yes','No') DEFAULT NULL,
  modify `bpethnicity` set('Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Arab','Asian','Other') NOT NULL DEFAULT '',
  modify `bplocation` set('Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming','Non US (Canada)','Non US (Germany)','Non US (Italy)','US (not specified)') NOT NULL DEFAULT '',
  modify `bpreligion` set('Open','Anglican','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','LDS / Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian','Not Specified') NOT NULL DEFAULT '',
  modify `bppets` set('None','Open','Cat','Dog','Other') NOT NULL DEFAULT '',
  modify `bpdegree` set('Open','High School','Some College','College Degree','Advanced Degree') NOT NULL DEFAULT '',
  modify `bpage` set('Open','21-25','26-30','31-35','36-40','41-45','46-50','Above 50') NOT NULL DEFAULT '',
  modify `bpadoption` set('Open Adoption','Closed','Semi-Open') NOT NULL DEFAULT '',
  modify `bpstructure` set('Open','Married with biological and adopted children','Married with only adopted children','Married with only biological children','Married with no children','Single with biological and adopted children','Single with only adopted children','Single with only biological children','Single with no children','Life partner','Living with life partner','Living with life partner with no children','Living with life partner with biological and adoptive children') NOT NULL DEFAULT '',
  modify `Stayathome` enum('Yes','No') DEFAULT NULL,
  modify `Reason` varchar(255) NOT NULL DEFAULT '',
  modify `globalval` varchar(255) NOT NULL DEFAULT 'No',
  modify `matchrecords` int(255) DEFAULT NULL,
  modify `maxmatch` int(255) DEFAULT NULL,
  modify `Google` varchar(255) NOT NULL,
  modify `Blogger` varchar(255) NOT NULL,
  modify `Pinerest` varchar(255) NOT NULL,
  modify `Age` varchar(255) NOT NULL,
  modify `waiting` varchar(255) NOT NULL,
  modify `faith` varchar(255) NOT NULL,
  modify `housestyle` varchar(255) NOT NULL,
  modify `noofbedrooms` varchar(11) NOT NULL,
  modify `noofbathrooms` varchar(11) NOT NULL,
  modify `yardsize` varchar(11) NOT NULL,
  modify `neighbourhoodlike` varchar(255) NOT NULL,
  modify `phonenumber` bigint(11) NOT NULL,
  modify `agency_letter` text NOT NULL,
  modify `letter_aboutThem` text NOT NULL,
  modify `others` text NOT NULL,
  modify `FacebookProfile` varchar(32) NOT NULL,
  modify `address1` varchar(500) NOT NULL,
  modify `address2` varchar(500) NOT NULL,
  modify `childrenType` varchar(300) NOT NULL,
  modify `show_contact` int(11) NOT NULL DEFAULT '0',
  modify `img_mother` varchar(300) DEFAULT NULL,
  modify `img_agency` varchar(300) DEFAULT NULL,
  modify `img_him` varchar(300) DEFAULT NULL,
  modify `img_her` varchar(300) DEFAULT NULL,
  modify `img_them` varchar(300) DEFAULT NULL,
  modify `publishStatus` int(12) NOT NULL DEFAULT '1',
  modify `allow_contact` int(5) NOT NULL DEFAULT '0';