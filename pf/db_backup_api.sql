-- MySQL dump 10.13  Distrib 5.6.30, for Linux (x86_64)
--
-- Host: localhost    Database: pfcomm_api
-- ------------------------------------------------------
-- Server version	5.6.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` int(10) NOT NULL,
  `role_id` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `Avatar` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `Profile_no` int(11) NOT NULL,
  `Profile_year` varchar(225) NOT NULL,
  `ZOHO_ID` varchar(225) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'Anish','anish@breezegoindia.com','anish',1,1,'2016-03-29 09:36:14','0000-00-00 00:00:00','1234','1234',3875,0,0,'',''),(13,'dhanya','dhanya.p@breezegoindia.com','dhanya',1,1,'2016-03-29 09:45:27','0000-00-00 00:00:00','1234','1234',3662,0,0,'',''),(14,'rahul','p.rahul@breezegoindia.com','rahul',1,1,'2016-03-29 09:36:35','0000-00-00 00:00:00','1234','1234',4046,0,0,'','');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Age_group`
--

DROP TABLE IF EXISTS `Age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Age_group` (
  `Age_group_id` int(5) NOT NULL AUTO_INCREMENT,
  `Age_group` varchar(45) NOT NULL,
  PRIMARY KEY (`Age_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Age_group`
--

LOCK TABLES `Age_group` WRITE;
/*!40000 ALTER TABLE `Age_group` DISABLE KEYS */;
INSERT INTO `Age_group` VALUES (1,'1');
/*!40000 ALTER TABLE `Age_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Birthfather_pref`
--

DROP TABLE IF EXISTS `Birthfather_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Birthfather_pref` (
  `birthfather_pref_id` int(5) NOT NULL,
  `birthfather_status_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Birthfather_pref`
--

LOCK TABLES `Birthfather_pref` WRITE;
/*!40000 ALTER TABLE `Birthfather_pref` DISABLE KEYS */;
/*!40000 ALTER TABLE `Birthfather_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Birthfather_status`
--

DROP TABLE IF EXISTS `Birthfather_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Birthfather_status` (
  `Birthfather_status_id` int(5) NOT NULL,
  `Birthfather_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Birthfather_status`
--

LOCK TABLES `Birthfather_status` WRITE;
/*!40000 ALTER TABLE `Birthfather_status` DISABLE KEYS */;
INSERT INTO `Birthfather_status` VALUES (1,'Birth Father Unknown');
/*!40000 ALTER TABLE `Birthfather_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactDetails`
--

DROP TABLE IF EXISTS `ContactDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactDetails` (
  `StreetAddress` varchar(200) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` int(10) NOT NULL,
  `Country` int(10) NOT NULL,
  `Region` int(5) NOT NULL,
  `Zip` int(10) NOT NULL,
  `mobile_num` int(15) NOT NULL,
  `home_num` int(15) NOT NULL,
  `office_num` int(15) NOT NULL,
  `fax_num` int(15) NOT NULL,
  `DefaultContact` int(5) NOT NULL,
  `AllowDefaultContact` int(5) NOT NULL,
  `Account_id` int(10) NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactDetails`
--

LOCK TABLES `ContactDetails` WRITE;
/*!40000 ALTER TABLE `ContactDetails` DISABLE KEYS */;
INSERT INTO `ContactDetails` VALUES ('7101 Redbud Dr,,Manhattan-66503','Seminole',1,5,1,972021,123456789,123456789,123456789,123456789,12345,1,1,'www.adoptionassociates.net');
/*!40000 ALTER TABLE `ContactDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ethnicity`
--

DROP TABLE IF EXISTS `Ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ethnicity` (
  `ethnicity_id` int(11) NOT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ethnicity`
--

LOCK TABLES `Ethnicity` WRITE;
/*!40000 ALTER TABLE `Ethnicity` DISABLE KEYS */;
INSERT INTO `Ethnicity` VALUES (1,'Caucasian');
/*!40000 ALTER TABLE `Ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ethnicity_pref`
--

DROP TABLE IF EXISTS `Ethnicity_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ethnicity_pref` (
  `ethnicity_pref_id` int(5) NOT NULL AUTO_INCREMENT,
  `ethnicity_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  PRIMARY KEY (`ethnicity_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ethnicity_pref`
--

LOCK TABLES `Ethnicity_pref` WRITE;
/*!40000 ALTER TABLE `Ethnicity_pref` DISABLE KEYS */;
INSERT INTO `Ethnicity_pref` VALUES (1,1,1);
/*!40000 ALTER TABLE `Ethnicity_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Family_structure`
--

DROP TABLE IF EXISTS `Family_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Family_structure` (
  `family_structure_id` int(5) NOT NULL,
  `family_structure` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Family_structure`
--

LOCK TABLES `Family_structure` WRITE;
/*!40000 ALTER TABLE `Family_structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `Family_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gender_preference_id`
--

DROP TABLE IF EXISTS `Gender_preference_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gender_preference_id` (
  `Gender_preference_id` int(5) NOT NULL,
  `Gender_id` int(5) NOT NULL,
  `Gender_preference_idcol` varchar(45) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gender_preference_id`
--

LOCK TABLES `Gender_preference_id` WRITE;
/*!40000 ALTER TABLE `Gender_preference_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gender_preference_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Habits`
--

DROP TABLE IF EXISTS `Habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Habits` (
  `Smoking` int(4) NOT NULL,
  `Alcohol` int(4) NOT NULL,
  `Drug` int(4) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habits`
--

LOCK TABLES `Habits` WRITE;
/*!40000 ALTER TABLE `Habits` DISABLE KEYS */;
/*!40000 ALTER TABLE `Habits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Home`
--

DROP TABLE IF EXISTS `Home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Home` (
  `home_id` int(5) NOT NULL,
  `style` varchar(45) NOT NULL,
  `Neighborhood` varchar(45) NOT NULL,
  `pets` varchar(45) NOT NULL,
  `Accounts_id` int(5) NOT NULL,
  `relationship_status_id` int(5) NOT NULL,
  `family_structure_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Home`
--

LOCK TABLES `Home` WRITE;
/*!40000 ALTER TABLE `Home` DISABLE KEYS */;
/*!40000 ALTER TABLE `Home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles`
--

DROP TABLE IF EXISTS `Profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `ethnicity_id` int(5) NOT NULL,
  `education_id` int(5) NOT NULL,
  `religion_id` int(5) NOT NULL,
  `faith_id` int(5) NOT NULL,
  `waiting_id` int(5) NOT NULL,
  `status` int(5) NOT NULL,
  `accounts_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_status` int(2) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles`
--

LOCK TABLES `Profiles` WRITE;
/*!40000 ALTER TABLE `Profiles` DISABLE KEYS */;
INSERT INTO `Profiles` VALUES (1,'anish','k','2015-08-11','male',1,1,1,1,1,1,1,'2016-03-24 11:37:05','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(7,'dhanya','p','2016-03-08','female',1,2,3,4,5,1,13,'2016-03-22 11:23:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(8,'suraj','s','2016-03-08','female',1,2,3,4,5,1,13,'2016-03-22 11:23:52','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(9,'rahul','rp','2016-03-08','male',1,2,3,4,5,1,14,'2016-03-22 11:37:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `Profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles_draft`
--

DROP TABLE IF EXISTS `Profiles_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles_draft` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `ethnicity_id` int(5) NOT NULL,
  `education_id` int(5) NOT NULL,
  `religion_id` int(5) NOT NULL,
  `faith_id` int(5) NOT NULL,
  `waiting` int(5) NOT NULL,
  `status` int(5) NOT NULL,
  `accounts_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_status` int(2) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles_draft`
--

LOCK TABLES `Profiles_draft` WRITE;
/*!40000 ALTER TABLE `Profiles_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profiles_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles_draft_prev`
--

DROP TABLE IF EXISTS `Profiles_draft_prev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles_draft_prev` (
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
  `Ethnicity` enum('Not Specified','Middle Eastern','Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
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
  `ChildEthnicity` set('Any','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Middle Eastern','Multi-Racial','Native American (American Indian)','Pacific Islander','Asian','Other') NOT NULL DEFAULT '',
  `Pet` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  `Neighborhood` enum('Urban','Suburban','Rural') DEFAULT NULL,
  `Residency` enum('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') DEFAULT NULL,
  `State` enum('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)','Dubai (UAE)','Canada(Ontario)') DEFAULT NULL,
  `Facebook` varchar(255) NOT NULL,
  `Instagram` varchar(255) NOT NULL,
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
  `Adoptiontype` varchar(255) NOT NULL,
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
  `bpreligion` set('Not Specified','Anglican','Baptist','Buddhist','Catholic','Christian','Church of Christ','Episcopal','Hindu','Jewish','LDS / Mormon','Lutheran','Methodist','Non-denominational','None','Other','Presbyterian','Protestant','Unitarian') NOT NULL DEFAULT '',
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
  `phonenumber` bigint(11) NOT NULL,
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
  `img_other` varchar(300) DEFAULT NULL,
  `img_home` varchar(300) DEFAULT NULL,
  `publishStatus` int(10) NOT NULL DEFAULT '1',
  `allow_contact` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NickName` (`NickName`),
  KEY `Country` (`Country`),
  KEY `DateOfBirth` (`DateOfBirth`),
  KEY `DateReg` (`DateReg`),
  KEY `DateLastNav` (`DateLastNav`),
  KEY `RpxProfile` (`RpxProfile`),
  KEY `esase_profileinfo_notify` (`esase_profileinfo_notify`),
  FULLTEXT KEY `NickName_2` (`NickName`,`City`,`Headline`,`DescriptionMe`,`Tags`)
) ENGINE=MyISAM AUTO_INCREMENT=8463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles_draft_prev`
--

LOCK TABLES `Profiles_draft_prev` WRITE;
/*!40000 ALTER TABLE `Profiles_draft_prev` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profiles_draft_prev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles_prev`
--

DROP TABLE IF EXISTS `Profiles_prev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles_prev` (
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
  `Ethnicity` enum('Not Specified','Middle Eastern','Asian','African American','African American/Asian','Asian/Hispanic','Caucasian','Caucasian/Asian','Caucasian/African American','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Multi-Racial','Native American (American Indian)','Pacific Islander','Other') DEFAULT NULL,
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
  `ChildEthnicity` set('Any','Bi-Racial','Caucasian','Caucasian/Asian','Caucasian/African American','African American','African American/Asian','Asian/Hispanic','European','Caucasian/Hispanic','Caucasian/Native American','Eastern European/Slavic/Russian','Hispanic','Hispanic/African American','Hispanic or South/Central American','Jewish','Mediterranean','Middle Eastern','Multi-Racial','Native American (American Indian)','Pacific Islander','Asian','Other') NOT NULL DEFAULT '',
  `Pet` set('Cat','Dog','Other','No Pet') NOT NULL DEFAULT '',
  `Neighborhood` enum('Urban','Suburban','Rural') DEFAULT NULL,
  `Residency` enum('Not Specified','Apartment','Condominium','Townhouse','Single Family Home') DEFAULT NULL,
  `State` enum('Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Marianas Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Virgin Islands','Washington','West Virginia','Wisconsin','Wyoming','Non US (Italy)','Non US (Germany)','US (not specified)','Dubai (UAE)','Canada(Ontario)') DEFAULT NULL,
  `Facebook` varchar(255) NOT NULL,
  `Instagram` varchar(255) NOT NULL,
  `Twitter` varchar(255) NOT NULL,
  `MySpace` varchar(255) NOT NULL,
  `Smoking` enum('Yes','No') DEFAULT NULL,
  `DueDate` date NOT NULL,
  `BMPhone` varchar(255) NOT NULL,
  `BMTimetoReach` set('Morning','Afternoon','Evening','Anytime') NOT NULL DEFAULT '',
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
  `DrugsAlcohol` set('None','Marijuana-Minimal','Marijuana-Frequent','Cocaine-Minimal','Cocaine-Frequent','Methadone-Minimal','Methadone-Frequent','Opiates-Minimal','Opiates-Frequent','Crystal Methamphetamine-Minimal','Crystal Methamphetamine-Frequent') NOT NULL DEFAULT '',
  `SmokingDuringPregnancy` set('None','Up to a pack a day','More than a pack a day') NOT NULL DEFAULT '',
  `BPFamilyHistory` set('None','Learning Disabilities','Mental Retardation','Physical Handicaps','Congenital Heart Disease','Hepatitis','Cystic Fibrosis','Epilepsy','Diabetes','HIV/AIDS','Depression','Bi Polar Disorder','Schizophrenia','Dissociative Identity Disorder','Sickle Cell Anemia or Trait') NOT NULL DEFAULT '',
  `Openness` set('Open','Semi-Open','Closed') NOT NULL DEFAULT '',
  `ap_data` varchar(55) NOT NULL,
  `Adoptiontype` varchar(255) NOT NULL,
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
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) NOT NULL,
  `childrenType` varchar(300) NOT NULL,
  `FacebookProfile` varchar(32) NOT NULL,
  `show_contact` int(11) NOT NULL DEFAULT '0',
  `img_mother` varchar(300) DEFAULT NULL,
  `img_agency` varchar(300) DEFAULT NULL,
  `img_him` varchar(300) DEFAULT NULL,
  `img_her` varchar(300) DEFAULT NULL,
  `img_them` varchar(300) DEFAULT NULL,
  `img_other` varchar(300) DEFAULT NULL,
  `img_home` varchar(300) DEFAULT NULL,
  `publishStatus` int(10) NOT NULL DEFAULT '1',
  `allow_contact` int(4) NOT NULL DEFAULT '0',
  `Profile_no` int(11) NOT NULL,
  `Profile_year` varchar(225) NOT NULL,
  `ZOHO_ID` varchar(225) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NickName` (`NickName`),
  KEY `Country` (`Country`),
  KEY `DateOfBirth` (`DateOfBirth`),
  KEY `DateReg` (`DateReg`),
  KEY `DateLastNav` (`DateLastNav`),
  KEY `RpxProfile` (`RpxProfile`),
  KEY `Couple` (`Couple`),
  KEY `FacebookProfile` (`FacebookProfile`),
  FULLTEXT KEY `NickName_2` (`NickName`,`City`,`Headline`,`DescriptionMe`,`Tags`)
) ENGINE=MyISAM AUTO_INCREMENT=8463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles_prev`
--

LOCK TABLES `Profiles_prev` WRITE;
/*!40000 ALTER TABLE `Profiles_prev` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profiles_prev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayBoardBoards`
--

DROP TABLE IF EXISTS `RayBoardBoards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayBoardBoards` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) NOT NULL DEFAULT '',
  `OwnerID` varchar(20) NOT NULL DEFAULT '0',
  `When` int(11) DEFAULT NULL,
  `Status` enum('new','normal','delete') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayBoardBoards`
--

LOCK TABLES `RayBoardBoards` WRITE;
/*!40000 ALTER TABLE `RayBoardBoards` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayBoardBoards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayBoardCurrentUsers`
--

DROP TABLE IF EXISTS `RayBoardCurrentUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayBoardCurrentUsers` (
  `ID` varchar(20) NOT NULL DEFAULT '',
  `Nick` varchar(255) NOT NULL,
  `Sex` enum('M','F') NOT NULL DEFAULT 'M',
  `Age` int(11) NOT NULL DEFAULT '0',
  `Photo` varchar(255) NOT NULL DEFAULT '',
  `Profile` varchar(255) NOT NULL DEFAULT '',
  `Desc` varchar(255) NOT NULL,
  `When` int(11) NOT NULL DEFAULT '0',
  `Status` enum('new','old','idle') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayBoardCurrentUsers`
--

LOCK TABLES `RayBoardCurrentUsers` WRITE;
/*!40000 ALTER TABLE `RayBoardCurrentUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayBoardCurrentUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayBoardUsers`
--

DROP TABLE IF EXISTS `RayBoardUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayBoardUsers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Board` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayBoardUsers`
--

LOCK TABLES `RayBoardUsers` WRITE;
/*!40000 ALTER TABLE `RayBoardUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayBoardUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatCurrentUsers`
--

DROP TABLE IF EXISTS `RayChatCurrentUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatCurrentUsers` (
  `ID` varchar(20) NOT NULL DEFAULT '',
  `Nick` varchar(36) NOT NULL DEFAULT '',
  `Sex` enum('M','F') NOT NULL DEFAULT 'M',
  `Age` int(11) NOT NULL DEFAULT '0',
  `Desc` text NOT NULL,
  `Photo` varchar(255) NOT NULL DEFAULT '',
  `Profile` varchar(255) NOT NULL DEFAULT '',
  `Online` varchar(10) NOT NULL DEFAULT 'online',
  `Start` int(11) NOT NULL DEFAULT '0',
  `When` int(11) NOT NULL DEFAULT '0',
  `Status` enum('new','old','idle','kick','type','online') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatCurrentUsers`
--

LOCK TABLES `RayChatCurrentUsers` WRITE;
/*!40000 ALTER TABLE `RayChatCurrentUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatCurrentUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatMemberships`
--

DROP TABLE IF EXISTS `RayChatMemberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatMemberships` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Setting` int(11) NOT NULL DEFAULT '0',
  `Value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Membership` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatMemberships`
--

LOCK TABLES `RayChatMemberships` WRITE;
/*!40000 ALTER TABLE `RayChatMemberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatMemberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatMembershipsSettings`
--

DROP TABLE IF EXISTS `RayChatMembershipsSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatMembershipsSettings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Type` enum('boolean','number','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'boolean',
  `Default` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Range` int(3) NOT NULL DEFAULT '3',
  `Error` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatMembershipsSettings`
--

LOCK TABLES `RayChatMembershipsSettings` WRITE;
/*!40000 ALTER TABLE `RayChatMembershipsSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatMembershipsSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatMessages`
--

DROP TABLE IF EXISTS `RayChatMessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatMessages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Room` int(11) NOT NULL DEFAULT '0',
  `Sender` varchar(20) NOT NULL DEFAULT '',
  `Recipient` varchar(20) NOT NULL DEFAULT '',
  `Whisper` enum('true','false') NOT NULL DEFAULT 'false',
  `Message` text NOT NULL,
  `Style` text NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT 'text',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatMessages`
--

LOCK TABLES `RayChatMessages` WRITE;
/*!40000 ALTER TABLE `RayChatMessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatMessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatProfiles`
--

DROP TABLE IF EXISTS `RayChatProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatProfiles` (
  `ID` varchar(20) NOT NULL DEFAULT '0',
  `Banned` enum('true','false') NOT NULL DEFAULT 'false',
  `Type` varchar(10) NOT NULL DEFAULT 'full',
  `Smileset` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatProfiles`
--

LOCK TABLES `RayChatProfiles` WRITE;
/*!40000 ALTER TABLE `RayChatProfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatRooms`
--

DROP TABLE IF EXISTS `RayChatRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatRooms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `OwnerID` varchar(20) NOT NULL DEFAULT '0',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatRooms`
--

LOCK TABLES `RayChatRooms` WRITE;
/*!40000 ALTER TABLE `RayChatRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayChatRoomsUsers`
--

DROP TABLE IF EXISTS `RayChatRoomsUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayChatRoomsUsers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Room` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayChatRoomsUsers`
--

LOCK TABLES `RayChatRoomsUsers` WRITE;
/*!40000 ALTER TABLE `RayChatRoomsUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayChatRoomsUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayImContacts`
--

DROP TABLE IF EXISTS `RayImContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayImContacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Online` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'online',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayImContacts`
--

LOCK TABLES `RayImContacts` WRITE;
/*!40000 ALTER TABLE `RayImContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayImContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayImMessages`
--

DROP TABLE IF EXISTS `RayImMessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayImMessages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ContactID` int(11) NOT NULL DEFAULT '0',
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `Style` text COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayImMessages`
--

LOCK TABLES `RayImMessages` WRITE;
/*!40000 ALTER TABLE `RayImMessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayImMessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayImPendings`
--

DROP TABLE IF EXISTS `RayImPendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayImPendings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecipientID` (`RecipientID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayImPendings`
--

LOCK TABLES `RayImPendings` WRITE;
/*!40000 ALTER TABLE `RayImPendings` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayImPendings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayImProfiles`
--

DROP TABLE IF EXISTS `RayImProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayImProfiles` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Smileset` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayImProfiles`
--

LOCK TABLES `RayImProfiles` WRITE;
/*!40000 ALTER TABLE `RayImProfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayImProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayMp3Files`
--

DROP TABLE IF EXISTS `RayMp3Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayMp3Files` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Tags` text NOT NULL,
  `Description` text NOT NULL,
  `Time` int(11) NOT NULL DEFAULT '0',
  `Date` int(20) NOT NULL DEFAULT '0',
  `Reports` int(11) NOT NULL DEFAULT '0',
  `Owner` varchar(64) NOT NULL DEFAULT '',
  `Listens` int(12) DEFAULT '0',
  `Rate` float NOT NULL,
  `RateCount` int(11) NOT NULL,
  `CommentsCount` int(11) NOT NULL,
  `Featured` tinyint(4) NOT NULL,
  `Status` enum('approved','disapproved','pending','processing','failed') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Description`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayMp3Files`
--

LOCK TABLES `RayMp3Files` WRITE;
/*!40000 ALTER TABLE `RayMp3Files` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayMp3Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayMp3Tokens`
--

DROP TABLE IF EXISTS `RayMp3Tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayMp3Tokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayMp3Tokens`
--

LOCK TABLES `RayMp3Tokens` WRITE;
/*!40000 ALTER TABLE `RayMp3Tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayMp3Tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayShoutboxMessages`
--

DROP TABLE IF EXISTS `RayShoutboxMessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayShoutboxMessages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(20) NOT NULL DEFAULT '0',
  `Msg` text NOT NULL,
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayShoutboxMessages`
--

LOCK TABLES `RayShoutboxMessages` WRITE;
/*!40000 ALTER TABLE `RayShoutboxMessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayShoutboxMessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayVideoFiles`
--

DROP TABLE IF EXISTS `RayVideoFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayVideoFiles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Tags` text NOT NULL,
  `Description` text NOT NULL,
  `Time` int(11) NOT NULL DEFAULT '0',
  `Date` int(20) NOT NULL DEFAULT '0',
  `account_id` varchar(64) NOT NULL DEFAULT '',
  `Views` int(12) DEFAULT '0',
  `Rate` float NOT NULL,
  `RateCount` int(11) NOT NULL,
  `CommentsCount` int(11) NOT NULL,
  `Featured` tinyint(4) NOT NULL,
  `Status` enum('approved','disapproved','pending','processing','failed') NOT NULL DEFAULT 'pending',
  `Source` varchar(20) NOT NULL DEFAULT '',
  `Video` varchar(32) NOT NULL DEFAULT '',
  `YoutubeLink` tinyint(4) NOT NULL DEFAULT '0',
  `home` int(11) NOT NULL DEFAULT '0',
  `ytStatusCheck` varchar(40) NOT NULL DEFAULT 'processed',
  `ytChannelId` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Owner` (`account_id`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Description`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=1751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayVideoFiles`
--

LOCK TABLES `RayVideoFiles` WRITE;
/*!40000 ALTER TABLE `RayVideoFiles` DISABLE KEYS */;
INSERT INTO `RayVideoFiles` VALUES (2,'','to_FAX','to_FAX','','to_FAX',0,1291385105,'1',20,0,0,0,0,'approved','','',0,0,'processed',''),(3,'','to_FAX','to_FAX','','to_FAX',0,1291385105,'1',20,0,0,0,0,'approved','','',0,0,'processed','');
/*!40000 ALTER TABLE `RayVideoFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayVideoTokens`
--

DROP TABLE IF EXISTS `RayVideoTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayVideoTokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayVideoTokens`
--

LOCK TABLES `RayVideoTokens` WRITE;
/*!40000 ALTER TABLE `RayVideoTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayVideoTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayVideo_commentsFiles`
--

DROP TABLE IF EXISTS `RayVideo_commentsFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayVideo_commentsFiles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Tags` text NOT NULL,
  `Description` text NOT NULL,
  `Time` int(11) NOT NULL DEFAULT '0',
  `Date` int(20) NOT NULL DEFAULT '0',
  `Owner` varchar(64) NOT NULL DEFAULT '',
  `Views` int(12) DEFAULT '0',
  `Status` enum('approved','disapproved','pending','processing','failed') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayVideo_commentsFiles`
--

LOCK TABLES `RayVideo_commentsFiles` WRITE;
/*!40000 ALTER TABLE `RayVideo_commentsFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayVideo_commentsFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RayVideo_commentsTokens`
--

DROP TABLE IF EXISTS `RayVideo_commentsTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RayVideo_commentsTokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RayVideo_commentsTokens`
--

LOCK TABLES `RayVideo_commentsTokens` WRITE;
/*!40000 ALTER TABLE `RayVideo_commentsTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `RayVideo_commentsTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regions`
--

DROP TABLE IF EXISTS `Regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regions` (
  `RegionId` int(4) NOT NULL,
  `Region` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions`
--

LOCK TABLES `Regions` WRITE;
/*!40000 ALTER TABLE `Regions` DISABLE KEYS */;
INSERT INTO `Regions` VALUES (1,'Southeast');
/*!40000 ALTER TABLE `Regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relationship_status`
--

DROP TABLE IF EXISTS `Relationship_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relationship_status` (
  `relationship_status_id` int(11) NOT NULL,
  `relationship_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relationship_status`
--

LOCK TABLES `Relationship_status` WRITE;
/*!40000 ALTER TABLE `Relationship_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `Relationship_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Religions`
--

DROP TABLE IF EXISTS `Religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Religions` (
  `ReligionId` int(4) NOT NULL,
  `Religion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Religions`
--

LOCK TABLES `Religions` WRITE;
/*!40000 ALTER TABLE `Religions` DISABLE KEYS */;
INSERT INTO `Religions` VALUES (3,'Christian'),(1,'Hindu');
/*!40000 ALTER TABLE `Religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Social_websites`
--

DROP TABLE IF EXISTS `Social_websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Social_websites` (
  `website_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Social_websites`
--

LOCK TABLES `Social_websites` WRITE;
/*!40000 ALTER TABLE `Social_websites` DISABLE KEYS */;
/*!40000 ALTER TABLE `Social_websites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YoutubeToken`
--

DROP TABLE IF EXISTS `YoutubeToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YoutubeToken` (
  `ID` int(10) NOT NULL,
  `access_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(10) NOT NULL,
  `refresh_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `channelId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YoutubeToken`
--

LOCK TABLES `YoutubeToken` WRITE;
/*!40000 ALTER TABLE `YoutubeToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `YoutubeToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_type`
--

DROP TABLE IF EXISTS `adoption_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_type` (
  `adoption_type_id` int(5) NOT NULL,
  `adoption_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_type`
--

LOCK TABLES `adoption_type` WRITE;
/*!40000 ALTER TABLE `adoption_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoption_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_type_preference`
--

DROP TABLE IF EXISTS `adoption_type_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_type_preference` (
  `adoption_type_preference_id` int(5) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `adoption_type_id` int(5) NOT NULL,
  PRIMARY KEY (`adoption_type_preference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_type_preference`
--

LOCK TABLES `adoption_type_preference` WRITE;
/*!40000 ALTER TABLE `adoption_type_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoption_type_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `age_group_preference`
--

DROP TABLE IF EXISTS `age_group_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_group_preference` (
  `age_group_preference_id` int(5) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `age_group_id` int(5) NOT NULL,
  PRIMARY KEY (`age_group_preference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_group_preference`
--

LOCK TABLES `age_group_preference` WRITE;
/*!40000 ALTER TABLE `age_group_preference` DISABLE KEYS */;
INSERT INTO `age_group_preference` VALUES (1,1,1);
/*!40000 ALTER TABLE `age_group_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_join_request`
--

DROP TABLE IF EXISTS `agency_join_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_join_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agencyName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `agencyEmail` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `agencyState` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fromName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fromEmail` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_join_request`
--

LOCK TABLES `agency_join_request` WRITE;
/*!40000 ALTER TABLE `agency_join_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_join_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencyemailsettings`
--

DROP TABLE IF EXISTS `agencyemailsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyemailsettings` (
  `AgencyID` int(100) NOT NULL,
  `BlogAdd` int(5) NOT NULL DEFAULT '0',
  `BlogEdit` int(5) NOT NULL DEFAULT '0',
  `BlogDelete` int(5) NOT NULL DEFAULT '0',
  `PhotoUpload` int(5) NOT NULL DEFAULT '0',
  `VideoUpload` int(5) NOT NULL DEFAULT '0',
  `EditProfile` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AgencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencyemailsettings`
--

LOCK TABLES `agencyemailsettings` WRITE;
/*!40000 ALTER TABLE `agencyemailsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencyemailsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_users` (
  `website` varchar(50) NOT NULL,
  `user_key` varchar(100) NOT NULL,
  PRIMARY KEY (`website`),
  UNIQUE KEY `user_key` (`user_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES ('ctpf01.parentfinder.com','5a2b25e043ab8147c9027a1b1aba3aad');
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_automailer_mails`
--

DROP TABLE IF EXISTS `aqb_automailer_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_automailer_mails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Subject` text COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Filter` text COLLATE utf8_unicode_ci NOT NULL,
  `FilterQuery` text COLLATE utf8_unicode_ci NOT NULL,
  `Schedule` text COLLATE utf8_unicode_ci NOT NULL,
  `Options` text COLLATE utf8_unicode_ci NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_automailer_mails`
--

LOCK TABLES `aqb_automailer_mails` WRITE;
/*!40000 ALTER TABLE `aqb_automailer_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_automailer_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_membership_vouchers_codes`
--

DROP TABLE IF EXISTS `aqb_membership_vouchers_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_membership_vouchers_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PriceID` int(11) NOT NULL,
  `Code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Discount` int(11) NOT NULL,
  `Start` date DEFAULT '0000-00-00',
  `End` date DEFAULT '0000-00-00',
  `SingleUse` tinyint(4) DEFAULT '0',
  `Used` int(11) DEFAULT '0',
  `Threshold` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_membership_vouchers_codes`
--

LOCK TABLES `aqb_membership_vouchers_codes` WRITE;
/*!40000 ALTER TABLE `aqb_membership_vouchers_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_membership_vouchers_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_membership_vouchers_transactions`
--

DROP TABLE IF EXISTS `aqb_membership_vouchers_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_membership_vouchers_transactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileID` int(11) NOT NULL,
  `PriceID` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Processed') COLLATE utf8_unicode_ci DEFAULT 'Pending',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=637 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_membership_vouchers_transactions`
--

LOCK TABLES `aqb_membership_vouchers_transactions` WRITE;
/*!40000 ALTER TABLE `aqb_membership_vouchers_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_membership_vouchers_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_mls_acl_levels`
--

DROP TABLE IF EXISTS `aqb_mls_acl_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_mls_acl_levels` (
  `AclID` int(11) NOT NULL,
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823',
  PRIMARY KEY (`AclID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_mls_acl_levels`
--

LOCK TABLES `aqb_mls_acl_levels` WRITE;
/*!40000 ALTER TABLE `aqb_mls_acl_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_mls_acl_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pc_members_blocks`
--

DROP TABLE IF EXISTS `aqb_pc_members_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pc_members_blocks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `share` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `approved` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `unmovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `irremovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `uncollapsable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `collapsed_def` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_id` int(11) unsigned NOT NULL DEFAULT '0',
  `visible_group` int(5) unsigned NOT NULL DEFAULT '0',
  `visible` set('non','memb') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'non,memb',
  `column` tinyint(2) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `type` enum('text','html','rss') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `date` int(11) NOT NULL DEFAULT '0',
  `val` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `content` (`content`,`title`)
) ENGINE=MyISAM AUTO_INCREMENT=2311 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pc_members_blocks`
--

LOCK TABLES `aqb_pc_members_blocks` WRITE;
/*!40000 ALTER TABLE `aqb_pc_members_blocks` DISABLE KEYS */;
INSERT INTO `aqb_pc_members_blocks` VALUES (1,'Please click <a href=http://www.parentfinder.com/profileflipbook/1068-GregandBecky/1068-GregandBecky.html target= _blank>here</a> to view Greg and Becky\'s profile flip book','1','1','0','0','0','0','E-book Profile',1,3,'non,memb',1,0,'text',45454,1);
/*!40000 ALTER TABLE `aqb_pc_members_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pc_profiles_info`
--

DROP TABLE IF EXISTS `aqb_pc_profiles_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pc_profiles_info` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `page` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pc_profiles_info`
--

LOCK TABLES `aqb_pc_profiles_info` WRITE;
/*!40000 ALTER TABLE `aqb_pc_profiles_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pc_profiles_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pc_standard_blocks`
--

DROP TABLE IF EXISTS `aqb_pc_standard_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pc_standard_blocks` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `unmovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `irremovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `uncollapsable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `visible_group` int(5) unsigned NOT NULL DEFAULT '1',
  `collapsed_def` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pc_standard_blocks`
--

LOCK TABLES `aqb_pc_standard_blocks` WRITE;
/*!40000 ALTER TABLE `aqb_pc_standard_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pc_standard_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_member_menu_visibility`
--

DROP TABLE IF EXISTS `aqb_pts_member_menu_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_member_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823',
  PRIMARY KEY (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_member_menu_visibility`
--

LOCK TABLES `aqb_pts_member_menu_visibility` WRITE;
/*!40000 ALTER TABLE `aqb_pts_member_menu_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_member_menu_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_page_blocks_visibility`
--

DROP TABLE IF EXISTS `aqb_pts_page_blocks_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_page_blocks_visibility` (
  `PageBlockID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823',
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823',
  PRIMARY KEY (`PageBlockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_page_blocks_visibility`
--

LOCK TABLES `aqb_pts_page_blocks_visibility` WRITE;
/*!40000 ALTER TABLE `aqb_pts_page_blocks_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_page_blocks_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_profile_fields`
--

DROP TABLE IF EXISTS `aqb_pts_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_profile_fields` (
  `FieldID` int(11) NOT NULL,
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823',
  PRIMARY KEY (`FieldID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_profile_fields`
--

LOCK TABLES `aqb_pts_profile_fields` WRITE;
/*!40000 ALTER TABLE `aqb_pts_profile_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_profile_types`
--

DROP TABLE IF EXISTS `aqb_pts_profile_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_profile_types` (
  `ID` int(4) NOT NULL,
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Obsolete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_profile_types`
--

LOCK TABLES `aqb_pts_profile_types` WRITE;
/*!40000 ALTER TABLE `aqb_pts_profile_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_profile_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_search_result_layout`
--

DROP TABLE IF EXISTS `aqb_pts_search_result_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_search_result_layout` (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `ProfileType` int(11) NOT NULL,
  `FieldID` mediumint(9) NOT NULL,
  `row` tinyint(4) NOT NULL DEFAULT '0',
  `col` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_search_result_layout`
--

LOCK TABLES `aqb_pts_search_result_layout` WRITE;
/*!40000 ALTER TABLE `aqb_pts_search_result_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_search_result_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_pts_top_menu_visibility`
--

DROP TABLE IF EXISTS `aqb_pts_top_menu_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_pts_top_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823',
  PRIMARY KEY (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_pts_top_menu_visibility`
--

LOCK TABLES `aqb_pts_top_menu_visibility` WRITE;
/*!40000 ALTER TABLE `aqb_pts_top_menu_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_pts_top_menu_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_smdf_custom_dependencies`
--

DROP TABLE IF EXISTS `aqb_smdf_custom_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_smdf_custom_dependencies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DependsOn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ValuesList` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UseAjax` tinyint(4) NOT NULL DEFAULT '0',
  `SelfManageable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_smdf_custom_dependencies`
--

LOCK TABLES `aqb_smdf_custom_dependencies` WRITE;
/*!40000 ALTER TABLE `aqb_smdf_custom_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_smdf_custom_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqb_smdf_dependencies`
--

DROP TABLE IF EXISTS `aqb_smdf_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqb_smdf_dependencies` (
  `Field` int(11) NOT NULL,
  `DependsOn` int(11) NOT NULL,
  `UseAjax` tinyint(4) NOT NULL DEFAULT '0',
  `SelfManageable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqb_smdf_dependencies`
--

LOCK TABLES `aqb_smdf_dependencies` WRITE;
/*!40000 ALTER TABLE `aqb_smdf_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqb_smdf_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_comments`
--

DROP TABLE IF EXISTS `bx_arl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_comments` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_comments`
--

LOCK TABLES `bx_arl_comments` WRITE;
/*!40000 ALTER TABLE `bx_arl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_comments_track`
--

DROP TABLE IF EXISTS `bx_arl_comments_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_comments_track`
--

LOCK TABLES `bx_arl_comments_track` WRITE;
/*!40000 ALTER TABLE `bx_arl_comments_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_comments_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_entries`
--

DROP TABLE IF EXISTS `bx_arl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL DEFAULT '0',
  `caption` varchar(100) DEFAULT NULL,
  `snippet` text NOT NULL,
  `content` mediumtext,
  `when` int(11) NOT NULL DEFAULT '0',
  `uri` varchar(100) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` varchar(255) NOT NULL DEFAULT '',
  `comment` tinyint(4) NOT NULL DEFAULT '0',
  `vote` tinyint(4) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `rate_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `cmts_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  FULLTEXT KEY `search_group` (`caption`,`content`,`tags`,`categories`),
  FULLTEXT KEY `search_caption` (`caption`),
  FULLTEXT KEY `search_content` (`content`),
  FULLTEXT KEY `search_tags` (`tags`),
  FULLTEXT KEY `search_categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_entries`
--

LOCK TABLES `bx_arl_entries` WRITE;
/*!40000 ALTER TABLE `bx_arl_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_views_track`
--

DROP TABLE IF EXISTS `bx_arl_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_views_track`
--

LOCK TABLES `bx_arl_views_track` WRITE;
/*!40000 ALTER TABLE `bx_arl_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_voting`
--

DROP TABLE IF EXISTS `bx_arl_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_voting` (
  `arl_id` bigint(8) NOT NULL DEFAULT '0',
  `arl_rating_count` int(11) NOT NULL DEFAULT '0',
  `arl_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `arl_id` (`arl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_voting`
--

LOCK TABLES `bx_arl_voting` WRITE;
/*!40000 ALTER TABLE `bx_arl_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_arl_voting_track`
--

DROP TABLE IF EXISTS `bx_arl_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_arl_voting_track` (
  `arl_id` bigint(8) NOT NULL DEFAULT '0',
  `arl_ip` varchar(20) DEFAULT NULL,
  `arl_date` datetime DEFAULT NULL,
  KEY `arl_ip` (`arl_ip`,`arl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_arl_voting_track`
--

LOCK TABLES `bx_arl_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_arl_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_arl_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_avatar_images`
--

DROP TABLE IF EXISTS `bx_avatar_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_avatar_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4051 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_avatar_images`
--

LOCK TABLES `bx_avatar_images` WRITE;
/*!40000 ALTER TABLE `bx_avatar_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_avatar_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_cmts`
--

DROP TABLE IF EXISTS `bx_blogs_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_cmts` (
  `cmt_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_cmts`
--

LOCK TABLES `bx_blogs_cmts` WRITE;
/*!40000 ALTER TABLE `bx_blogs_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_blogs_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_main`
--

DROP TABLE IF EXISTS `bx_blogs_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_main` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `OwnerID` (`OwnerID`)
) ENGINE=MyISAM AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_main`
--

LOCK TABLES `bx_blogs_main` WRITE;
/*!40000 ALTER TABLE `bx_blogs_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_blogs_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_posts`
--

DROP TABLE IF EXISTS `bx_blogs_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_posts` (
  `PostID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PostCaption` varchar(255) NOT NULL DEFAULT '',
  `PostUri` varchar(255) NOT NULL DEFAULT '',
  `PostText` text NOT NULL,
  `PostDate` int(11) unsigned DEFAULT NULL,
  `PostStatus` enum('approval','disapproval') NOT NULL DEFAULT 'disapproval',
  `PostPhoto` varchar(64) DEFAULT NULL,
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Featured` tinyint(1) NOT NULL DEFAULT '0',
  `Views` int(11) unsigned NOT NULL,
  `Rate` float NOT NULL,
  `RateCount` int(11) unsigned NOT NULL,
  `CommentsCount` int(11) unsigned NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `Categories` varchar(255) NOT NULL DEFAULT '',
  `allowView` int(11) NOT NULL,
  `allowRate` int(11) NOT NULL,
  `allowComment` int(11) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`PostID`),
  UNIQUE KEY `PostUri` (`PostUri`),
  KEY `OwnerID` (`account_id`),
  FULLTEXT KEY `PostCaption` (`PostCaption`,`PostText`,`Tags`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=2144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_posts`
--

LOCK TABLES `bx_blogs_posts` WRITE;
/*!40000 ALTER TABLE `bx_blogs_posts` DISABLE KEYS */;
INSERT INTO `bx_blogs_posts` VALUES (1,'test','test','test',4521,'approval',NULL,'',0,1,0,0,0,1,'',3,0,0,'');
/*!40000 ALTER TABLE `bx_blogs_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_rating`
--

DROP TABLE IF EXISTS `bx_blogs_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_rating` (
  `blogp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`blogp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_rating`
--

LOCK TABLES `bx_blogs_rating` WRITE;
/*!40000 ALTER TABLE `bx_blogs_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_blogs_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_views_track`
--

DROP TABLE IF EXISTS `bx_blogs_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_views_track` (
  `id` int(11) unsigned NOT NULL,
  `viewer` int(11) unsigned NOT NULL,
  `ip` int(11) unsigned NOT NULL,
  `ts` int(11) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_views_track`
--

LOCK TABLES `bx_blogs_views_track` WRITE;
/*!40000 ALTER TABLE `bx_blogs_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_blogs_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_blogs_voting_track`
--

DROP TABLE IF EXISTS `bx_blogs_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_blogs_voting_track` (
  `blogp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_ip` varchar(20) DEFAULT NULL,
  `blogp_date` datetime DEFAULT NULL,
  KEY `med_ip` (`blogp_ip`,`blogp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_blogs_voting_track`
--

LOCK TABLES `bx_blogs_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_blogs_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_blogs_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_crss_main`
--

DROP TABLE IF EXISTS `bx_crss_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_crss_main` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProfileID` int(11) unsigned NOT NULL,
  `RSSUrl` varchar(255) NOT NULL,
  `Quantity` int(11) unsigned NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` enum('active','passive') NOT NULL DEFAULT 'passive',
  PRIMARY KEY (`ID`),
  KEY `ProfileID` (`ProfileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_crss_main`
--

LOCK TABLES `bx_crss_main` WRITE;
/*!40000 ALTER TABLE `bx_crss_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_crss_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_activity`
--

DROP TABLE IF EXISTS `bx_events_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `lang_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('add','delete','change','commentPost','rate','join','unjoin','featured','unfeatured','makeAdmin','removeAdmin') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_activity`
--

LOCK TABLES `bx_events_activity` WRITE;
/*!40000 ALTER TABLE `bx_events_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_admins`
--

DROP TABLE IF EXISTS `bx_events_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_admins`
--

LOCK TABLES `bx_events_admins` WRITE;
/*!40000 ALTER TABLE `bx_events_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_cmts`
--

DROP TABLE IF EXISTS `bx_events_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_cmts`
--

LOCK TABLES `bx_events_cmts` WRITE;
/*!40000 ALTER TABLE `bx_events_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_cmts_track`
--

DROP TABLE IF EXISTS `bx_events_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_cmts_track`
--

LOCK TABLES `bx_events_cmts_track` WRITE;
/*!40000 ALTER TABLE `bx_events_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_files`
--

DROP TABLE IF EXISTS `bx_events_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_files`
--

LOCK TABLES `bx_events_files` WRITE;
/*!40000 ALTER TABLE `bx_events_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum`
--

DROP TABLE IF EXISTS `bx_events_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum` (
  `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`forum_id`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_uri` (`forum_uri`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum`
--

LOCK TABLES `bx_events_forum` WRITE;
/*!40000 ALTER TABLE `bx_events_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_actions_log`
--

DROP TABLE IF EXISTS `bx_events_forum_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0',
  KEY `action_when` (`action_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_actions_log`
--

LOCK TABLES `bx_events_forum_actions_log` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_attachments`
--

DROP TABLE IF EXISTS `bx_events_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL,
  PRIMARY KEY (`att_hash`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_attachments`
--

LOCK TABLES `bx_events_forum_attachments` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_cat`
--

DROP TABLE IF EXISTS `bx_events_forum_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`),
  KEY `cat_uri` (`cat_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_cat`
--

LOCK TABLES `bx_events_forum_cat` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_flag`
--

DROP TABLE IF EXISTS `bx_events_forum_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_flag`
--

LOCK TABLES `bx_events_forum_flag` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_post`
--

DROP TABLE IF EXISTS `bx_events_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user` (`user`),
  KEY `when` (`when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_post`
--

LOCK TABLES `bx_events_forum_post` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_signatures`
--

DROP TABLE IF EXISTS `bx_events_forum_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_signatures`
--

LOCK TABLES `bx_events_forum_signatures` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_topic`
--

DROP TABLE IF EXISTS `bx_events_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_uri` varchar(255) NOT NULL DEFAULT '',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `when` int(11) NOT NULL DEFAULT '0',
  `topic_posts` int(11) NOT NULL DEFAULT '0',
  `first_post_user` varchar(32) NOT NULL DEFAULT '0',
  `first_post_when` int(11) NOT NULL DEFAULT '0',
  `last_post_user` varchar(32) NOT NULL DEFAULT '',
  `last_post_when` int(11) NOT NULL DEFAULT '0',
  `topic_sticky` int(11) NOT NULL DEFAULT '0',
  `topic_locked` tinyint(4) NOT NULL DEFAULT '0',
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_2` (`forum_id`,`when`),
  KEY `topic_uri` (`topic_uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_topic`
--

LOCK TABLES `bx_events_forum_topic` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_user`
--

DROP TABLE IF EXISTS `bx_events_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_user`
--

LOCK TABLES `bx_events_forum_user` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_user_activity`
--

DROP TABLE IF EXISTS `bx_events_forum_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_user_activity`
--

LOCK TABLES `bx_events_forum_user_activity` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_user_stat`
--

DROP TABLE IF EXISTS `bx_events_forum_user_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_user_stat`
--

LOCK TABLES `bx_events_forum_user_stat` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_user_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_user_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_forum_vote`
--

DROP TABLE IF EXISTS `bx_events_forum_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_forum_vote`
--

LOCK TABLES `bx_events_forum_vote` WRITE;
/*!40000 ALTER TABLE `bx_events_forum_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_forum_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_images`
--

DROP TABLE IF EXISTS `bx_events_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_images`
--

LOCK TABLES `bx_events_images` WRITE;
/*!40000 ALTER TABLE `bx_events_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_invite`
--

DROP TABLE IF EXISTS `bx_events_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_entry` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_invite`
--

LOCK TABLES `bx_events_invite` WRITE;
/*!40000 ALTER TABLE `bx_events_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_main`
--

DROP TABLE IF EXISTS `bx_events_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_main` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL DEFAULT '',
  `EntryUri` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `Country` varchar(2) NOT NULL DEFAULT 'US',
  `City` varchar(50) NOT NULL DEFAULT '',
  `Place` varchar(100) NOT NULL DEFAULT '',
  `PrimPhoto` int(11) NOT NULL,
  `Date` int(11) NOT NULL,
  `EventStart` int(11) NOT NULL DEFAULT '0',
  `EventEnd` int(11) NOT NULL DEFAULT '0',
  `ResponsibleID` int(10) unsigned NOT NULL DEFAULT '0',
  `EventMembershipFilter` varchar(100) NOT NULL DEFAULT '',
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Categories` text NOT NULL,
  `Views` int(11) NOT NULL,
  `Rate` float NOT NULL,
  `RateCount` int(11) NOT NULL,
  `CommentsCount` int(11) NOT NULL,
  `FansCount` int(11) NOT NULL,
  `Featured` tinyint(4) NOT NULL,
  `allow_view_event_to` varchar(16) NOT NULL,
  `allow_view_participants_to` varchar(16) NOT NULL,
  `allow_comment_to` varchar(16) NOT NULL,
  `allow_rate_to` varchar(16) NOT NULL,
  `allow_join_to` int(11) NOT NULL,
  `allow_post_in_forum_to` varchar(16) NOT NULL,
  `JoinConfirmation` tinyint(4) NOT NULL DEFAULT '0',
  `allow_upload_photos_to` varchar(16) NOT NULL,
  `allow_upload_videos_to` varchar(16) NOT NULL,
  `allow_upload_sounds_to` varchar(16) NOT NULL,
  `allow_upload_files_to` varchar(16) NOT NULL,
  `OrganizerName` varchar(255) NOT NULL DEFAULT '',
  `OrganizerPhone` varchar(255) NOT NULL DEFAULT '',
  `OrganizerEmail` varchar(255) NOT NULL DEFAULT '',
  `OrganizerWebsite` varchar(255) NOT NULL DEFAULT '',
  `Recurring` enum('no','yes') NOT NULL DEFAULT 'no',
  `RecurringNum` int(11) unsigned NOT NULL DEFAULT '0',
  `RecurringPeriod` varchar(255) NOT NULL DEFAULT '',
  `Recurrence` int(11) NOT NULL,
  `TicketSaleStart` int(11) NOT NULL,
  `TicketSaleEnd` int(11) NOT NULL,
  `State` varchar(10) NOT NULL DEFAULT '',
  `Reminder` int(11) NOT NULL,
  `ReminderDays` int(11) NOT NULL,
  `ReminderSent` int(11) NOT NULL,
  `EventMembershipViewFilter` varchar(100) NOT NULL DEFAULT '',
  `VideoEmbed` text NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `Rss` text NOT NULL,
  `ParticipantsInfo` text NOT NULL,
  `allow_join_after_start` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EntryUri` (`EntryUri`),
  KEY `ResponsibleID` (`ResponsibleID`),
  KEY `EventStart` (`EventStart`),
  KEY `Date` (`Date`),
  FULLTEXT KEY `Title` (`Title`,`Description`,`City`,`Place`,`Tags`,`Categories`),
  FULLTEXT KEY `Tags` (`Tags`),
  FULLTEXT KEY `Categories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_main`
--

LOCK TABLES `bx_events_main` WRITE;
/*!40000 ALTER TABLE `bx_events_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_participants`
--

DROP TABLE IF EXISTS `bx_events_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_participants` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_participants`
--

LOCK TABLES `bx_events_participants` WRITE;
/*!40000 ALTER TABLE `bx_events_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_rating`
--

DROP TABLE IF EXISTS `bx_events_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `gal_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_rating`
--

LOCK TABLES `bx_events_rating` WRITE;
/*!40000 ALTER TABLE `bx_events_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_rating_track`
--

DROP TABLE IF EXISTS `bx_events_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_rating_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `gal_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_rating_track`
--

LOCK TABLES `bx_events_rating_track` WRITE;
/*!40000 ALTER TABLE `bx_events_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_sounds`
--

DROP TABLE IF EXISTS `bx_events_sounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_sounds`
--

LOCK TABLES `bx_events_sounds` WRITE;
/*!40000 ALTER TABLE `bx_events_sounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_sounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_videos`
--

DROP TABLE IF EXISTS `bx_events_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_videos`
--

LOCK TABLES `bx_events_videos` WRITE;
/*!40000 ALTER TABLE `bx_events_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_events_views_track`
--

DROP TABLE IF EXISTS `bx_events_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_events_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_events_views_track`
--

LOCK TABLES `bx_events_views_track` WRITE;
/*!40000 ALTER TABLE `bx_events_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_events_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_facebook_accounts`
--

DROP TABLE IF EXISTS `bx_facebook_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_facebook_accounts` (
  `id_profile` int(10) unsigned NOT NULL,
  `fb_profile` bigint(20) NOT NULL,
  PRIMARY KEY (`id_profile`),
  KEY `fb_profile` (`fb_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_facebook_accounts`
--

LOCK TABLES `bx_facebook_accounts` WRITE;
/*!40000 ALTER TABLE `bx_facebook_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_facebook_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_cmts`
--

DROP TABLE IF EXISTS `bx_files_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_cmts`
--

LOCK TABLES `bx_files_cmts` WRITE;
/*!40000 ALTER TABLE `bx_files_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_cmts_albums`
--

DROP TABLE IF EXISTS `bx_files_cmts_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_cmts_albums` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_cmts_albums`
--

LOCK TABLES `bx_files_cmts_albums` WRITE;
/*!40000 ALTER TABLE `bx_files_cmts_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_cmts_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_favorites`
--

DROP TABLE IF EXISTS `bx_files_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_favorites`
--

LOCK TABLES `bx_files_favorites` WRITE;
/*!40000 ALTER TABLE `bx_files_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_main`
--

DROP TABLE IF EXISTS `bx_files_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_main` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Owner` int(10) unsigned DEFAULT NULL,
  `Ext` varchar(4) DEFAULT '',
  `Size` varchar(10) DEFAULT '',
  `Title` varchar(255) DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Date` int(11) NOT NULL DEFAULT '0',
  `Views` int(11) DEFAULT '0',
  `Rate` float NOT NULL DEFAULT '0',
  `RateCount` int(11) NOT NULL DEFAULT '0',
  `CommentsCount` int(11) NOT NULL DEFAULT '0',
  `DownloadsCount` int(11) NOT NULL DEFAULT '0',
  `AllowDownload` int(11) NOT NULL DEFAULT '3',
  `Featured` tinyint(4) NOT NULL DEFAULT '0',
  `Status` enum('approved','disapproved','pending') NOT NULL DEFAULT 'pending',
  `Type` varchar(30) NOT NULL DEFAULT 'text/plain',
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_main`
--

LOCK TABLES `bx_files_main` WRITE;
/*!40000 ALTER TABLE `bx_files_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_rating`
--

DROP TABLE IF EXISTS `bx_files_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_rating`
--

LOCK TABLES `bx_files_rating` WRITE;
/*!40000 ALTER TABLE `bx_files_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_types`
--

DROP TABLE IF EXISTS `bx_files_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_types` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(64) NOT NULL,
  `Icon` varchar(20) NOT NULL DEFAULT 'default.png',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Type` (`Type`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_types`
--

LOCK TABLES `bx_files_types` WRITE;
/*!40000 ALTER TABLE `bx_files_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_views_track`
--

DROP TABLE IF EXISTS `bx_files_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_views_track`
--

LOCK TABLES `bx_files_views_track` WRITE;
/*!40000 ALTER TABLE `bx_files_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_files_voting_track`
--

DROP TABLE IF EXISTS `bx_files_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_files_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `med_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_files_voting_track`
--

LOCK TABLES `bx_files_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_files_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_files_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum`
--

DROP TABLE IF EXISTS `bx_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum` (
  `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_uri` (`forum_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum`
--

LOCK TABLES `bx_forum` WRITE;
/*!40000 ALTER TABLE `bx_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_actions_log`
--

DROP TABLE IF EXISTS `bx_forum_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0',
  KEY `action_when` (`action_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_actions_log`
--

LOCK TABLES `bx_forum_actions_log` WRITE;
/*!40000 ALTER TABLE `bx_forum_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_attachments`
--

DROP TABLE IF EXISTS `bx_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL,
  PRIMARY KEY (`att_hash`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_attachments`
--

LOCK TABLES `bx_forum_attachments` WRITE;
/*!40000 ALTER TABLE `bx_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_cat`
--

DROP TABLE IF EXISTS `bx_forum_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`),
  KEY `cat_uri` (`cat_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_cat`
--

LOCK TABLES `bx_forum_cat` WRITE;
/*!40000 ALTER TABLE `bx_forum_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_flag`
--

DROP TABLE IF EXISTS `bx_forum_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_flag`
--

LOCK TABLES `bx_forum_flag` WRITE;
/*!40000 ALTER TABLE `bx_forum_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_post`
--

DROP TABLE IF EXISTS `bx_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user` (`user`),
  KEY `when` (`when`),
  FULLTEXT KEY `post_text` (`post_text`)
) ENGINE=MyISAM AUTO_INCREMENT=521 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_post`
--

LOCK TABLES `bx_forum_post` WRITE;
/*!40000 ALTER TABLE `bx_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_signatures`
--

DROP TABLE IF EXISTS `bx_forum_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_signatures`
--

LOCK TABLES `bx_forum_signatures` WRITE;
/*!40000 ALTER TABLE `bx_forum_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_topic`
--

DROP TABLE IF EXISTS `bx_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_uri` varchar(255) NOT NULL DEFAULT '',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `when` int(11) NOT NULL DEFAULT '0',
  `topic_posts` int(11) NOT NULL DEFAULT '0',
  `first_post_user` varchar(32) NOT NULL DEFAULT '0',
  `first_post_when` int(11) NOT NULL DEFAULT '0',
  `last_post_user` varchar(32) NOT NULL DEFAULT '',
  `last_post_when` int(11) NOT NULL DEFAULT '0',
  `topic_sticky` int(11) NOT NULL DEFAULT '0',
  `topic_locked` tinyint(4) NOT NULL DEFAULT '0',
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_2` (`forum_id`,`when`),
  KEY `topic_uri` (`topic_uri`),
  FULLTEXT KEY `topic_title` (`topic_title`)
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_topic`
--

LOCK TABLES `bx_forum_topic` WRITE;
/*!40000 ALTER TABLE `bx_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_user`
--

DROP TABLE IF EXISTS `bx_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_user`
--

LOCK TABLES `bx_forum_user` WRITE;
/*!40000 ALTER TABLE `bx_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_user_activity`
--

DROP TABLE IF EXISTS `bx_forum_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_user_activity`
--

LOCK TABLES `bx_forum_user_activity` WRITE;
/*!40000 ALTER TABLE `bx_forum_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_user_stat`
--

DROP TABLE IF EXISTS `bx_forum_user_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_user_stat`
--

LOCK TABLES `bx_forum_user_stat` WRITE;
/*!40000 ALTER TABLE `bx_forum_user_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_user_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_forum_vote`
--

DROP TABLE IF EXISTS `bx_forum_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_forum_vote`
--

LOCK TABLES `bx_forum_vote` WRITE;
/*!40000 ALTER TABLE `bx_forum_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_forum_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_admins`
--

DROP TABLE IF EXISTS `bx_groups_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_admins`
--

LOCK TABLES `bx_groups_admins` WRITE;
/*!40000 ALTER TABLE `bx_groups_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_cmts`
--

DROP TABLE IF EXISTS `bx_groups_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_cmts`
--

LOCK TABLES `bx_groups_cmts` WRITE;
/*!40000 ALTER TABLE `bx_groups_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_cmts_track`
--

DROP TABLE IF EXISTS `bx_groups_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_cmts_track`
--

LOCK TABLES `bx_groups_cmts_track` WRITE;
/*!40000 ALTER TABLE `bx_groups_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_codes`
--

DROP TABLE IF EXISTS `bx_groups_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_codes` (
  `id_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_entry`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_codes`
--

LOCK TABLES `bx_groups_codes` WRITE;
/*!40000 ALTER TABLE `bx_groups_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_fans`
--

DROP TABLE IF EXISTS `bx_groups_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_fans` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_fans`
--

LOCK TABLES `bx_groups_fans` WRITE;
/*!40000 ALTER TABLE `bx_groups_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_fans_backup`
--

DROP TABLE IF EXISTS `bx_groups_fans_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_fans_backup` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_fans_backup`
--

LOCK TABLES `bx_groups_fans_backup` WRITE;
/*!40000 ALTER TABLE `bx_groups_fans_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_fans_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_files`
--

DROP TABLE IF EXISTS `bx_groups_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_files`
--

LOCK TABLES `bx_groups_files` WRITE;
/*!40000 ALTER TABLE `bx_groups_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum`
--

DROP TABLE IF EXISTS `bx_groups_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum` (
  `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`forum_id`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_uri` (`forum_uri`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum`
--

LOCK TABLES `bx_groups_forum` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_actions_log`
--

DROP TABLE IF EXISTS `bx_groups_forum_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0',
  KEY `action_when` (`action_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_actions_log`
--

LOCK TABLES `bx_groups_forum_actions_log` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_attachments`
--

DROP TABLE IF EXISTS `bx_groups_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL,
  PRIMARY KEY (`att_hash`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_attachments`
--

LOCK TABLES `bx_groups_forum_attachments` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_cat`
--

DROP TABLE IF EXISTS `bx_groups_forum_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`),
  KEY `cat_uri` (`cat_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_cat`
--

LOCK TABLES `bx_groups_forum_cat` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_flag`
--

DROP TABLE IF EXISTS `bx_groups_forum_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_flag`
--

LOCK TABLES `bx_groups_forum_flag` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_post`
--

DROP TABLE IF EXISTS `bx_groups_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user` (`user`),
  KEY `when` (`when`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_post`
--

LOCK TABLES `bx_groups_forum_post` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_signatures`
--

DROP TABLE IF EXISTS `bx_groups_forum_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_signatures`
--

LOCK TABLES `bx_groups_forum_signatures` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_topic`
--

DROP TABLE IF EXISTS `bx_groups_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_uri` varchar(255) NOT NULL DEFAULT '',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `when` int(11) NOT NULL DEFAULT '0',
  `topic_posts` int(11) NOT NULL DEFAULT '0',
  `first_post_user` varchar(32) NOT NULL DEFAULT '0',
  `first_post_when` int(11) NOT NULL DEFAULT '0',
  `last_post_user` varchar(32) NOT NULL DEFAULT '',
  `last_post_when` int(11) NOT NULL DEFAULT '0',
  `topic_sticky` int(11) NOT NULL DEFAULT '0',
  `topic_locked` tinyint(4) NOT NULL DEFAULT '0',
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_2` (`forum_id`,`when`),
  KEY `topic_uri` (`topic_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_topic`
--

LOCK TABLES `bx_groups_forum_topic` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_user`
--

DROP TABLE IF EXISTS `bx_groups_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_user`
--

LOCK TABLES `bx_groups_forum_user` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_user_activity`
--

DROP TABLE IF EXISTS `bx_groups_forum_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_user_activity`
--

LOCK TABLES `bx_groups_forum_user_activity` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_user_stat`
--

DROP TABLE IF EXISTS `bx_groups_forum_user_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_user_stat`
--

LOCK TABLES `bx_groups_forum_user_stat` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_user_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_user_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_forum_vote`
--

DROP TABLE IF EXISTS `bx_groups_forum_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_forum_vote`
--

LOCK TABLES `bx_groups_forum_vote` WRITE;
/*!40000 ALTER TABLE `bx_groups_forum_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_forum_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_images`
--

DROP TABLE IF EXISTS `bx_groups_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_images`
--

LOCK TABLES `bx_groups_images` WRITE;
/*!40000 ALTER TABLE `bx_groups_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_main`
--

DROP TABLE IF EXISTS `bx_groups_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `country` varchar(2) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `thumb` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `views` int(11) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `fans_count` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `allow_view_group_to` int(11) NOT NULL,
  `allow_view_fans_to` varchar(16) NOT NULL,
  `allow_comment_to` varchar(16) NOT NULL,
  `allow_rate_to` varchar(16) NOT NULL,
  `allow_post_in_forum_to` varchar(16) NOT NULL,
  `allow_join_to` int(11) NOT NULL,
  `join_confirmation` tinyint(4) NOT NULL DEFAULT '0',
  `allow_upload_photos_to` varchar(16) NOT NULL,
  `allow_upload_videos_to` varchar(16) NOT NULL,
  `allow_upload_sounds_to` varchar(16) NOT NULL,
  `allow_upload_files_to` varchar(16) NOT NULL,
  `videoName` varchar(100) DEFAULT NULL,
  `videoUri` varchar(100) DEFAULT NULL,
  `Unpublish_Password` varchar(40) NOT NULL DEFAULT 'abc123',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_main`
--

LOCK TABLES `bx_groups_main` WRITE;
/*!40000 ALTER TABLE `bx_groups_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_main_backup`
--

DROP TABLE IF EXISTS `bx_groups_main_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_main_backup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `country` varchar(2) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `thumb` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `views` int(11) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `fans_count` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `allow_view_group_to` int(11) NOT NULL,
  `allow_view_fans_to` varchar(16) NOT NULL,
  `allow_comment_to` varchar(16) NOT NULL,
  `allow_rate_to` varchar(16) NOT NULL,
  `allow_post_in_forum_to` varchar(16) NOT NULL,
  `allow_join_to` int(11) NOT NULL,
  `join_confirmation` tinyint(4) NOT NULL DEFAULT '0',
  `allow_upload_photos_to` varchar(16) NOT NULL,
  `allow_upload_videos_to` varchar(16) NOT NULL,
  `allow_upload_sounds_to` varchar(16) NOT NULL,
  `allow_upload_files_to` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_main_backup`
--

LOCK TABLES `bx_groups_main_backup` WRITE;
/*!40000 ALTER TABLE `bx_groups_main_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_main_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_moderation`
--

DROP TABLE IF EXISTS `bx_groups_moderation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_moderation` (
  `GroupId` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `ApproveStatus` enum('on','off') NOT NULL DEFAULT 'on'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_moderation`
--

LOCK TABLES `bx_groups_moderation` WRITE;
/*!40000 ALTER TABLE `bx_groups_moderation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_moderation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_rating`
--

DROP TABLE IF EXISTS `bx_groups_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `gal_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_rating`
--

LOCK TABLES `bx_groups_rating` WRITE;
/*!40000 ALTER TABLE `bx_groups_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_rating_track`
--

DROP TABLE IF EXISTS `bx_groups_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `gal_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_rating_track`
--

LOCK TABLES `bx_groups_rating_track` WRITE;
/*!40000 ALTER TABLE `bx_groups_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_sounds`
--

DROP TABLE IF EXISTS `bx_groups_sounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_sounds`
--

LOCK TABLES `bx_groups_sounds` WRITE;
/*!40000 ALTER TABLE `bx_groups_sounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_sounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_videos`
--

DROP TABLE IF EXISTS `bx_groups_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_videos`
--

LOCK TABLES `bx_groups_videos` WRITE;
/*!40000 ALTER TABLE `bx_groups_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_groups_views_track`
--

DROP TABLE IF EXISTS `bx_groups_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_groups_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_groups_views_track`
--

LOCK TABLES `bx_groups_views_track` WRITE;
/*!40000 ALTER TABLE `bx_groups_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_groups_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_comments`
--

DROP TABLE IF EXISTS `bx_news_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_comments` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_comments`
--

LOCK TABLES `bx_news_comments` WRITE;
/*!40000 ALTER TABLE `bx_news_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_comments_track`
--

DROP TABLE IF EXISTS `bx_news_comments_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_comments_track`
--

LOCK TABLES `bx_news_comments_track` WRITE;
/*!40000 ALTER TABLE `bx_news_comments_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_comments_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_entries`
--

DROP TABLE IF EXISTS `bx_news_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL DEFAULT '0',
  `caption` varchar(64) NOT NULL DEFAULT '',
  `snippet` text NOT NULL,
  `content` text NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `uri` varchar(64) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` varchar(255) NOT NULL DEFAULT '',
  `comment` tinyint(4) NOT NULL DEFAULT '0',
  `vote` tinyint(4) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `rate_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `cmts_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  FULLTEXT KEY `search_group` (`caption`,`content`,`tags`,`categories`),
  FULLTEXT KEY `search_caption` (`caption`),
  FULLTEXT KEY `search_content` (`content`),
  FULLTEXT KEY `search_tags` (`tags`),
  FULLTEXT KEY `search_categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_entries`
--

LOCK TABLES `bx_news_entries` WRITE;
/*!40000 ALTER TABLE `bx_news_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_views_track`
--

DROP TABLE IF EXISTS `bx_news_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_views_track`
--

LOCK TABLES `bx_news_views_track` WRITE;
/*!40000 ALTER TABLE `bx_news_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_voting`
--

DROP TABLE IF EXISTS `bx_news_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_voting` (
  `news_id` bigint(8) NOT NULL DEFAULT '0',
  `news_rating_count` int(11) NOT NULL DEFAULT '0',
  `news_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_voting`
--

LOCK TABLES `bx_news_voting` WRITE;
/*!40000 ALTER TABLE `bx_news_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_news_voting_track`
--

DROP TABLE IF EXISTS `bx_news_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_news_voting_track` (
  `news_id` bigint(8) NOT NULL DEFAULT '0',
  `news_ip` varchar(20) DEFAULT NULL,
  `news_date` datetime DEFAULT NULL,
  KEY `news_ip` (`news_ip`,`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_news_voting_track`
--

LOCK TABLES `bx_news_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_news_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_news_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pageac_member_menu_visibility`
--

DROP TABLE IF EXISTS `bx_pageac_member_menu_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pageac_member_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `MemLevels` text,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pageac_member_menu_visibility`
--

LOCK TABLES `bx_pageac_member_menu_visibility` WRITE;
/*!40000 ALTER TABLE `bx_pageac_member_menu_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pageac_member_menu_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pageac_page_blocks_visibility`
--

DROP TABLE IF EXISTS `bx_pageac_page_blocks_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pageac_page_blocks_visibility` (
  `PageBlockID` int(11) NOT NULL,
  `MemLevels` text,
  PRIMARY KEY (`PageBlockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pageac_page_blocks_visibility`
--

LOCK TABLES `bx_pageac_page_blocks_visibility` WRITE;
/*!40000 ALTER TABLE `bx_pageac_page_blocks_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pageac_page_blocks_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pageac_rules`
--

DROP TABLE IF EXISTS `bx_pageac_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pageac_rules` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rule` text NOT NULL,
  `MemLevels` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pageac_rules`
--

LOCK TABLES `bx_pageac_rules` WRITE;
/*!40000 ALTER TABLE `bx_pageac_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pageac_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pageac_top_menu_visibility`
--

DROP TABLE IF EXISTS `bx_pageac_top_menu_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pageac_top_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `MemLevels` text,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pageac_top_menu_visibility`
--

LOCK TABLES `bx_pageac_top_menu_visibility` WRITE;
/*!40000 ALTER TABLE `bx_pageac_top_menu_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pageac_top_menu_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_cmts`
--

DROP TABLE IF EXISTS `bx_photos_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=990 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_cmts`
--

LOCK TABLES `bx_photos_cmts` WRITE;
/*!40000 ALTER TABLE `bx_photos_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_cmts_albums`
--

DROP TABLE IF EXISTS `bx_photos_cmts_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_cmts_albums` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_cmts_albums`
--

LOCK TABLES `bx_photos_cmts_albums` WRITE;
/*!40000 ALTER TABLE `bx_photos_cmts_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_cmts_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_favorites`
--

DROP TABLE IF EXISTS `bx_photos_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_favorites`
--

LOCK TABLES `bx_photos_favorites` WRITE;
/*!40000 ALTER TABLE `bx_photos_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_main`
--

DROP TABLE IF EXISTS `bx_photos_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_main` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `Ext` varchar(4) DEFAULT '',
  `Size` varchar(10) DEFAULT '',
  `Title` varchar(255) DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Date` int(11) NOT NULL DEFAULT '0',
  `Views` int(11) DEFAULT '0',
  `Rate` float NOT NULL DEFAULT '0',
  `RateCount` int(11) NOT NULL DEFAULT '0',
  `CommentsCount` int(11) NOT NULL DEFAULT '0',
  `Featured` tinyint(4) NOT NULL DEFAULT '0',
  `Status` enum('approved','disapproved','pending') NOT NULL DEFAULT 'pending',
  `Hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Hash` (`Hash`),
  KEY `Owner` (`account_id`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=56283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_main`
--

LOCK TABLES `bx_photos_main` WRITE;
/*!40000 ALTER TABLE `bx_photos_main` DISABLE KEYS */;
INSERT INTO `bx_photos_main` VALUES (1,'Home Pictures',1,'jpg','300*300','Hands Across the Water','Hands-Across-the-Water','Hands Across the Water','groups',1290005946,10,0,0,0,0,'approved','1880770f8815b500f9e5930a7e156423');
/*!40000 ALTER TABLE `bx_photos_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_main_newdb`
--

DROP TABLE IF EXISTS `bx_photos_main_newdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_main_newdb` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Owner` int(10) unsigned DEFAULT NULL,
  `Ext` varchar(4) DEFAULT '',
  `Size` varchar(10) DEFAULT '',
  `Title` varchar(255) DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Date` int(11) NOT NULL DEFAULT '0',
  `Views` int(11) DEFAULT '0',
  `Rate` float NOT NULL DEFAULT '0',
  `RateCount` int(11) NOT NULL DEFAULT '0',
  `CommentsCount` int(11) NOT NULL DEFAULT '0',
  `Featured` tinyint(4) NOT NULL DEFAULT '0',
  `Status` enum('approved','disapproved','pending') NOT NULL DEFAULT 'pending',
  `Hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Hash` (`Hash`),
  KEY `Owner` (`Owner`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=47168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_main_newdb`
--

LOCK TABLES `bx_photos_main_newdb` WRITE;
/*!40000 ALTER TABLE `bx_photos_main_newdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_main_newdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_main_olddb_backup`
--

DROP TABLE IF EXISTS `bx_photos_main_olddb_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_main_olddb_backup` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categories` text NOT NULL,
  `Owner` int(10) unsigned DEFAULT NULL,
  `Ext` varchar(4) DEFAULT '',
  `Size` varchar(10) DEFAULT '',
  `Title` varchar(255) DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `Tags` varchar(255) NOT NULL DEFAULT '',
  `Date` int(11) NOT NULL DEFAULT '0',
  `Views` int(11) DEFAULT '0',
  `Rate` float NOT NULL DEFAULT '0',
  `RateCount` int(11) NOT NULL DEFAULT '0',
  `CommentsCount` int(11) NOT NULL DEFAULT '0',
  `Featured` tinyint(4) NOT NULL DEFAULT '0',
  `Status` enum('approved','disapproved','pending') NOT NULL DEFAULT 'pending',
  `Hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Hash` (`Hash`),
  KEY `Owner` (`Owner`),
  FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`),
  FULLTEXT KEY `ftTags` (`Tags`),
  FULLTEXT KEY `ftCategories` (`Categories`)
) ENGINE=MyISAM AUTO_INCREMENT=46897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_main_olddb_backup`
--

LOCK TABLES `bx_photos_main_olddb_backup` WRITE;
/*!40000 ALTER TABLE `bx_photos_main_olddb_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_main_olddb_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_rating`
--

DROP TABLE IF EXISTS `bx_photos_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_rating`
--

LOCK TABLES `bx_photos_rating` WRITE;
/*!40000 ALTER TABLE `bx_photos_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_views_track`
--

DROP TABLE IF EXISTS `bx_photos_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_views_track`
--

LOCK TABLES `bx_photos_views_track` WRITE;
/*!40000 ALTER TABLE `bx_photos_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_photos_voting_track`
--

DROP TABLE IF EXISTS `bx_photos_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_photos_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `med_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_photos_voting_track`
--

LOCK TABLES `bx_photos_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_photos_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_photos_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_cart`
--

DROP TABLE IF EXISTS `bx_pmt_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_cart` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `items` text NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_cart`
--

LOCK TABLES `bx_pmt_cart` WRITE;
/*!40000 ALTER TABLE `bx_pmt_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_modules`
--

DROP TABLE IF EXISTS `bx_pmt_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_modules`
--

LOCK TABLES `bx_pmt_modules` WRITE;
/*!40000 ALTER TABLE `bx_pmt_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_providers`
--

DROP TABLE IF EXISTS `bx_pmt_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `caption` varchar(128) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `option_prefix` varchar(32) NOT NULL DEFAULT '',
  `class_name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_providers`
--

LOCK TABLES `bx_pmt_providers` WRITE;
/*!40000 ALTER TABLE `bx_pmt_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_providers_options`
--

DROP TABLE IF EXISTS `bx_pmt_providers_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_providers_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT 'text',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `extra` varchar(255) NOT NULL DEFAULT '',
  `check_type` varchar(64) NOT NULL DEFAULT '',
  `check_params` varchar(128) NOT NULL DEFAULT '',
  `check_error` varchar(128) NOT NULL DEFAULT '',
  `order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_providers_options`
--

LOCK TABLES `bx_pmt_providers_options` WRITE;
/*!40000 ALTER TABLE `bx_pmt_providers_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_providers_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_transactions`
--

DROP TABLE IF EXISTS `bx_pmt_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pending_id` int(11) NOT NULL DEFAULT '0',
  `order_id` varchar(16) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_count` int(11) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `reported` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_transactions`
--

LOCK TABLES `bx_pmt_transactions` WRITE;
/*!40000 ALTER TABLE `bx_pmt_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_transactions_pending`
--

DROP TABLE IF EXISTS `bx_pmt_transactions_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_transactions_pending` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `items` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `order` varchar(32) NOT NULL DEFAULT '',
  `error_code` varchar(16) NOT NULL DEFAULT '',
  `error_msg` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(16) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `reported` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2675 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_transactions_pending`
--

LOCK TABLES `bx_pmt_transactions_pending` WRITE;
/*!40000 ALTER TABLE `bx_pmt_transactions_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_transactions_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_pmt_user_values`
--

DROP TABLE IF EXISTS `bx_pmt_user_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_pmt_user_values` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `value` (`user_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_pmt_user_values`
--

LOCK TABLES `bx_pmt_user_values` WRITE;
/*!40000 ALTER TABLE `bx_pmt_user_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_pmt_user_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_profile_custom_images`
--

DROP TABLE IF EXISTS `bx_profile_custom_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_profile_custom_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ext` varchar(4) NOT NULL,
  `count` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=984 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_profile_custom_images`
--

LOCK TABLES `bx_profile_custom_images` WRITE;
/*!40000 ALTER TABLE `bx_profile_custom_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_profile_custom_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_profile_custom_main`
--

DROP TABLE IF EXISTS `bx_profile_custom_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_profile_custom_main` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `css` text NOT NULL,
  `tmp` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6880 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_profile_custom_main`
--

LOCK TABLES `bx_profile_custom_main` WRITE;
/*!40000 ALTER TABLE `bx_profile_custom_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_profile_custom_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_profile_custom_themes`
--

DROP TABLE IF EXISTS `bx_profile_custom_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_profile_custom_themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `ownerid` int(10) NOT NULL,
  `css` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ownerid` (`ownerid`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_profile_custom_themes`
--

LOCK TABLES `bx_profile_custom_themes` WRITE;
/*!40000 ALTER TABLE `bx_profile_custom_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_profile_custom_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_profile_custom_units`
--

DROP TABLE IF EXISTS `bx_profile_custom_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_profile_custom_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `css_name` varchar(500) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_profile_custom_units`
--

LOCK TABLES `bx_profile_custom_units` WRITE;
/*!40000 ALTER TABLE `bx_profile_custom_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_profile_custom_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_simple_messenger_messages`
--

DROP TABLE IF EXISTS `bx_simple_messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_simple_messenger_messages` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `SenderID` int(11) NOT NULL,
  `RecipientID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SenderStatus` enum('active','close') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `RecipientStatus` enum('active','close') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SenderID` (`SenderID`),
  KEY `RecipientID` (`RecipientID`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_simple_messenger_messages`
--

LOCK TABLES `bx_simple_messenger_messages` WRITE;
/*!40000 ALTER TABLE `bx_simple_messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_simple_messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_simple_messenger_privacy`
--

DROP TABLE IF EXISTS `bx_simple_messenger_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_simple_messenger_privacy` (
  `author_id` int(11) NOT NULL,
  `allow_contact_to` int(11) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_simple_messenger_privacy`
--

LOCK TABLES `bx_simple_messenger_privacy` WRITE;
/*!40000 ALTER TABLE `bx_simple_messenger_privacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_simple_messenger_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_cmts`
--

DROP TABLE IF EXISTS `bx_sites_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_cmts`
--

LOCK TABLES `bx_sites_cmts` WRITE;
/*!40000 ALTER TABLE `bx_sites_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_cmts_track`
--

DROP TABLE IF EXISTS `bx_sites_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_cmts_track`
--

LOCK TABLES `bx_sites_cmts_track` WRITE;
/*!40000 ALTER TABLE `bx_sites_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_main`
--

DROP TABLE IF EXISTS `bx_sites_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `entryUri` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `photo` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `ownerid` int(10) unsigned NOT NULL DEFAULT '0',
  `allowView` int(11) NOT NULL,
  `allowComments` int(11) NOT NULL DEFAULT '0',
  `allowRate` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `rate` float NOT NULL DEFAULT '0',
  `rateCount` int(11) NOT NULL DEFAULT '0',
  `commentsCount` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entryUri` (`entryUri`),
  KEY `date` (`date`),
  FULLTEXT KEY `title` (`title`,`description`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_main`
--

LOCK TABLES `bx_sites_main` WRITE;
/*!40000 ALTER TABLE `bx_sites_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_rating`
--

DROP TABLE IF EXISTS `bx_sites_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_rating` (
  `sites_id` smallint(6) NOT NULL DEFAULT '0',
  `sites_rating_count` int(11) NOT NULL DEFAULT '0',
  `sites_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `sites_id` (`sites_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_rating`
--

LOCK TABLES `bx_sites_rating` WRITE;
/*!40000 ALTER TABLE `bx_sites_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_rating_track`
--

DROP TABLE IF EXISTS `bx_sites_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_rating_track` (
  `sites_id` smallint(6) NOT NULL DEFAULT '0',
  `sites_ip` varchar(20) DEFAULT NULL,
  `sites_date` datetime DEFAULT NULL,
  KEY `sites_ip` (`sites_ip`,`sites_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_rating_track`
--

LOCK TABLES `bx_sites_rating_track` WRITE;
/*!40000 ALTER TABLE `bx_sites_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_stw_requests`
--

DROP TABLE IF EXISTS `bx_sites_stw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_stw_requests` (
  `siteid` int(10) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capturedon` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `quality` smallint(3) NOT NULL DEFAULT '90',
  `full` tinyint(1) NOT NULL DEFAULT '0',
  `xmax` smallint(4) NOT NULL DEFAULT '200',
  `ymax` smallint(4) NOT NULL DEFAULT '150',
  `nrx` smallint(4) NOT NULL DEFAULT '1024',
  `nry` smallint(4) NOT NULL DEFAULT '768',
  `invalid` tinyint(1) NOT NULL,
  `stwerrcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `errcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `referrer` tinyint(1) NOT NULL,
  PRIMARY KEY (`siteid`),
  UNIQUE KEY `hash_idx` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_stw_requests`
--

LOCK TABLES `bx_sites_stw_requests` WRITE;
/*!40000 ALTER TABLE `bx_sites_stw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_stw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_stwacc_info`
--

DROP TABLE IF EXISTS `bx_sites_stwacc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_stwacc_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_level` tinyint(1) NOT NULL DEFAULT '0',
  `inside_pages` tinyint(1) NOT NULL DEFAULT '0',
  `custom_size` tinyint(1) NOT NULL DEFAULT '0',
  `full_length` tinyint(1) NOT NULL DEFAULT '0',
  `refresh_ondemand` tinyint(1) NOT NULL DEFAULT '0',
  `custom_delay` tinyint(1) NOT NULL DEFAULT '0',
  `custom_quality` tinyint(1) NOT NULL DEFAULT '0',
  `custom_resolution` tinyint(1) NOT NULL DEFAULT '0',
  `custom_messages` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_stwacc_info`
--

LOCK TABLES `bx_sites_stwacc_info` WRITE;
/*!40000 ALTER TABLE `bx_sites_stwacc_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_stwacc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sites_views_track`
--

DROP TABLE IF EXISTS `bx_sites_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sites_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sites_views_track`
--

LOCK TABLES `bx_sites_views_track` WRITE;
/*!40000 ALTER TABLE `bx_sites_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sites_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_cmts`
--

DROP TABLE IF EXISTS `bx_sounds_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_cmts`
--

LOCK TABLES `bx_sounds_cmts` WRITE;
/*!40000 ALTER TABLE `bx_sounds_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_cmts_albums`
--

DROP TABLE IF EXISTS `bx_sounds_cmts_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_cmts_albums` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_cmts_albums`
--

LOCK TABLES `bx_sounds_cmts_albums` WRITE;
/*!40000 ALTER TABLE `bx_sounds_cmts_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_cmts_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_favorites`
--

DROP TABLE IF EXISTS `bx_sounds_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_favorites`
--

LOCK TABLES `bx_sounds_favorites` WRITE;
/*!40000 ALTER TABLE `bx_sounds_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_rating`
--

DROP TABLE IF EXISTS `bx_sounds_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_rating`
--

LOCK TABLES `bx_sounds_rating` WRITE;
/*!40000 ALTER TABLE `bx_sounds_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_views_track`
--

DROP TABLE IF EXISTS `bx_sounds_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_views_track`
--

LOCK TABLES `bx_sounds_views_track` WRITE;
/*!40000 ALTER TABLE `bx_sounds_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_sounds_voting_track`
--

DROP TABLE IF EXISTS `bx_sounds_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_sounds_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `med_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_sounds_voting_track`
--

LOCK TABLES `bx_sounds_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_sounds_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_sounds_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_spy_data`
--

DROP TABLE IF EXISTS `bx_spy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_spy_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alert_unit` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `object_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `lang_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('content_activity','profiles_activity') COLLATE utf8_unicode_ci NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient_id` (`recipient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=909 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_spy_data`
--

LOCK TABLES `bx_spy_data` WRITE;
/*!40000 ALTER TABLE `bx_spy_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_spy_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_spy_friends_data`
--

DROP TABLE IF EXISTS `bx_spy_friends_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_spy_friends_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `friend_id` (`friend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_spy_friends_data`
--

LOCK TABLES `bx_spy_friends_data` WRITE;
/*!40000 ALTER TABLE `bx_spy_friends_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_spy_friends_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_spy_handlers`
--

DROP TABLE IF EXISTS `bx_spy_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_spy_handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_unit` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_uri` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_class` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_method` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handler` (`alert_unit`,`alert_action`,`module_uri`,`module_class`,`module_method`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_spy_handlers`
--

LOCK TABLES `bx_spy_handlers` WRITE;
/*!40000 ALTER TABLE `bx_spy_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_spy_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_cmts`
--

DROP TABLE IF EXISTS `bx_store_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_cmts`
--

LOCK TABLES `bx_store_cmts` WRITE;
/*!40000 ALTER TABLE `bx_store_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_cmts_track`
--

DROP TABLE IF EXISTS `bx_store_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_cmts_track`
--

LOCK TABLES `bx_store_cmts_track` WRITE;
/*!40000 ALTER TABLE `bx_store_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_customers`
--

DROP TABLE IF EXISTS `bx_store_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_customers` (
  `file_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `order_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  KEY `file_id` (`file_id`,`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_customers`
--

LOCK TABLES `bx_store_customers` WRITE;
/*!40000 ALTER TABLE `bx_store_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum`
--

DROP TABLE IF EXISTS `bx_store_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum` (
  `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`forum_id`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_uri` (`forum_uri`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum`
--

LOCK TABLES `bx_store_forum` WRITE;
/*!40000 ALTER TABLE `bx_store_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_actions_log`
--

DROP TABLE IF EXISTS `bx_store_forum_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0',
  KEY `action_when` (`action_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_actions_log`
--

LOCK TABLES `bx_store_forum_actions_log` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_attachments`
--

DROP TABLE IF EXISTS `bx_store_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL,
  PRIMARY KEY (`att_hash`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_attachments`
--

LOCK TABLES `bx_store_forum_attachments` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_cat`
--

DROP TABLE IF EXISTS `bx_store_forum_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`),
  KEY `cat_uri` (`cat_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_cat`
--

LOCK TABLES `bx_store_forum_cat` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_flag`
--

DROP TABLE IF EXISTS `bx_store_forum_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_flag`
--

LOCK TABLES `bx_store_forum_flag` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_post`
--

DROP TABLE IF EXISTS `bx_store_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user` (`user`),
  KEY `when` (`when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_post`
--

LOCK TABLES `bx_store_forum_post` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_signatures`
--

DROP TABLE IF EXISTS `bx_store_forum_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_signatures`
--

LOCK TABLES `bx_store_forum_signatures` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_topic`
--

DROP TABLE IF EXISTS `bx_store_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_uri` varchar(255) NOT NULL DEFAULT '',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `when` int(11) NOT NULL DEFAULT '0',
  `topic_posts` int(11) NOT NULL DEFAULT '0',
  `first_post_user` varchar(32) NOT NULL DEFAULT '0',
  `first_post_when` int(11) NOT NULL DEFAULT '0',
  `last_post_user` varchar(32) NOT NULL DEFAULT '',
  `last_post_when` int(11) NOT NULL DEFAULT '0',
  `topic_sticky` int(11) NOT NULL DEFAULT '0',
  `topic_locked` tinyint(4) NOT NULL DEFAULT '0',
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_2` (`forum_id`,`when`),
  KEY `topic_uri` (`topic_uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_topic`
--

LOCK TABLES `bx_store_forum_topic` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_user`
--

DROP TABLE IF EXISTS `bx_store_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_user`
--

LOCK TABLES `bx_store_forum_user` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_user_activity`
--

DROP TABLE IF EXISTS `bx_store_forum_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_user_activity`
--

LOCK TABLES `bx_store_forum_user_activity` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_user_stat`
--

DROP TABLE IF EXISTS `bx_store_forum_user_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_user_stat`
--

LOCK TABLES `bx_store_forum_user_stat` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_user_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_user_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_forum_vote`
--

DROP TABLE IF EXISTS `bx_store_forum_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_forum_vote`
--

LOCK TABLES `bx_store_forum_vote` WRITE;
/*!40000 ALTER TABLE `bx_store_forum_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_forum_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_product_files`
--

DROP TABLE IF EXISTS `bx_store_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_product_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  `allow_purchase_to` varchar(16) NOT NULL,
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_product_files`
--

LOCK TABLES `bx_store_product_files` WRITE;
/*!40000 ALTER TABLE `bx_store_product_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_product_images`
--

DROP TABLE IF EXISTS `bx_store_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_product_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_product_images`
--

LOCK TABLES `bx_store_product_images` WRITE;
/*!40000 ALTER TABLE `bx_store_product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_product_videos`
--

DROP TABLE IF EXISTS `bx_store_product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_product_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_product_videos`
--

LOCK TABLES `bx_store_product_videos` WRITE;
/*!40000 ALTER TABLE `bx_store_product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_products`
--

DROP TABLE IF EXISTS `bx_store_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `thumb` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `views` int(11) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `price_range` varchar(16) NOT NULL,
  `allow_view_product_to` int(11) NOT NULL,
  `allow_post_in_forum_to` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_products`
--

LOCK TABLES `bx_store_products` WRITE;
/*!40000 ALTER TABLE `bx_store_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_rating`
--

DROP TABLE IF EXISTS `bx_store_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `gal_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_rating`
--

LOCK TABLES `bx_store_rating` WRITE;
/*!40000 ALTER TABLE `bx_store_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_rating_track`
--

DROP TABLE IF EXISTS `bx_store_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `gal_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_rating_track`
--

LOCK TABLES `bx_store_rating_track` WRITE;
/*!40000 ALTER TABLE `bx_store_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_store_views_track`
--

DROP TABLE IF EXISTS `bx_store_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_store_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_store_views_track`
--

LOCK TABLES `bx_store_views_track` WRITE;
/*!40000 ALTER TABLE `bx_store_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_store_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_cmts`
--

DROP TABLE IF EXISTS `bx_videos_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_cmts`
--

LOCK TABLES `bx_videos_cmts` WRITE;
/*!40000 ALTER TABLE `bx_videos_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_cmts_albums`
--

DROP TABLE IF EXISTS `bx_videos_cmts_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_cmts_albums` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_cmts_albums`
--

LOCK TABLES `bx_videos_cmts_albums` WRITE;
/*!40000 ALTER TABLE `bx_videos_cmts_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_cmts_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_favorites`
--

DROP TABLE IF EXISTS `bx_videos_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_favorites`
--

LOCK TABLES `bx_videos_favorites` WRITE;
/*!40000 ALTER TABLE `bx_videos_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_rating`
--

DROP TABLE IF EXISTS `bx_videos_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_rating`
--

LOCK TABLES `bx_videos_rating` WRITE;
/*!40000 ALTER TABLE `bx_videos_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_views_track`
--

DROP TABLE IF EXISTS `bx_videos_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_views_track`
--

LOCK TABLES `bx_videos_views_track` WRITE;
/*!40000 ALTER TABLE `bx_videos_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_videos_voting_track`
--

DROP TABLE IF EXISTS `bx_videos_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_videos_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `med_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_videos_voting_track`
--

LOCK TABLES `bx_videos_voting_track` WRITE;
/*!40000 ALTER TABLE `bx_videos_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_videos_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_wall_comments`
--

DROP TABLE IF EXISTS `bx_wall_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_wall_comments` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text COLLATE utf8_unicode_ci NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_wall_comments`
--

LOCK TABLES `bx_wall_comments` WRITE;
/*!40000 ALTER TABLE `bx_wall_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_wall_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_wall_comments_track`
--

DROP TABLE IF EXISTS `bx_wall_comments_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_wall_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_wall_comments_track`
--

LOCK TABLES `bx_wall_comments_track` WRITE;
/*!40000 ALTER TABLE `bx_wall_comments_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_wall_comments_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_wall_events`
--

DROP TABLE IF EXISTS `bx_wall_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_wall_events` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=897 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_wall_events`
--

LOCK TABLES `bx_wall_events` WRITE;
/*!40000 ALTER TABLE `bx_wall_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_wall_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bx_wall_handlers`
--

DROP TABLE IF EXISTS `bx_wall_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_wall_handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_unit` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_uri` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_class` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_method` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `groupable` tinyint(1) NOT NULL DEFAULT '0',
  `group_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeline` tinyint(1) NOT NULL DEFAULT '1',
  `outline` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handler` (`alert_unit`,`alert_action`,`module_uri`,`module_class`,`module_method`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bx_wall_handlers`
--

LOCK TABLES `bx_wall_handlers` WRITE;
/*!40000 ALTER TABLE `bx_wall_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bx_wall_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_list`
--

DROP TABLE IF EXISTS `cart_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_list` (
  `cart_id` int(111) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `itemname` varchar(245) NOT NULL,
  `cart_url` longtext NOT NULL,
  `price` varchar(50) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_list`
--

LOCK TABLES `cart_list` WRITE;
/*!40000 ALTER TABLE `cart_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_list_items`
--

DROP TABLE IF EXISTS `cart_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_list_items` (
  `item_id` int(111) NOT NULL AUTO_INCREMENT,
  `item_cartid` int(111) NOT NULL,
  `item_quantity` int(111) NOT NULL,
  `item_userid` int(111) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_list_items`
--

LOCK TABLES `cart_list_items` WRITE;
/*!40000 ALTER TABLE `cart_list_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_list_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_list_recipte`
--

DROP TABLE IF EXISTS `cart_list_recipte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_list_recipte` (
  `receipt_id` int(111) NOT NULL AUTO_INCREMENT,
  `user_id` int(111) NOT NULL,
  `transaction_id` int(111) NOT NULL,
  `item_id` int(111) NOT NULL,
  `quantity` int(111) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_status` varchar(245) NOT NULL,
  `paid_gateway` varchar(245) NOT NULL,
  `paid_transavtionid` varchar(245) NOT NULL,
  `paid_date` varchar(25) NOT NULL,
  `paid_token` varchar(245) NOT NULL,
  `currency` varchar(10) NOT NULL,
  PRIMARY KEY (`receipt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_list_recipte`
--

LOCK TABLES `cart_list_recipte` WRITE;
/*!40000 ALTER TABLE `cart_list_recipte` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_list_recipte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child` (
  `child_id` int(10) NOT NULL,
  `Number_of_childern` int(6) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Accounts_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child`
--

LOCK TABLES `child` WRITE;
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
INSERT INTO `child` VALUES (1,1,'child',1);
/*!40000 ALTER TABLE `child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(5) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coverphotos`
--

DROP TABLE IF EXISTS `coverphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coverphotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coverphotos`
--

LOCK TABLES `coverphotos` WRITE;
/*!40000 ALTER TABLE `coverphotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `coverphotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctz_our_letters`
--

DROP TABLE IF EXISTS `ctz_our_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctz_our_letters` (
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `when` int(10) NOT NULL DEFAULT '0',
  `caption` varchar(128) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  UNIQUE KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctz_our_letters`
--

LOCK TABLES `ctz_our_letters` WRITE;
/*!40000 ALTER TABLE `ctz_our_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctz_our_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbcsHeadInjections`
--

DROP TABLE IF EXISTS `dbcsHeadInjections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbcsHeadInjections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `injection_text` text NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbcsHeadInjections`
--

LOCK TABLES `dbcsHeadInjections` WRITE;
/*!40000 ALTER TABLE `dbcsHeadInjections` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbcsHeadInjections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbcs_ip_address`
--

DROP TABLE IF EXISTS `dbcs_ip_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbcs_ip_address` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `nick_name` varchar(255) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `ip_long` bigint(20) NOT NULL,
  `time_stamp` bigint(20) NOT NULL,
  UNIQUE KEY `dbcs_unique` (`member_id`,`time_stamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbcs_ip_address`
--

LOCK TABLES `dbcs_ip_address` WRITE;
/*!40000 ALTER TABLE `dbcs_ip_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbcs_ip_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dol_subs_payments`
--

DROP TABLE IF EXISTS `dol_subs_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dol_subs_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(100) DEFAULT NULL,
  `auth_code` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dol_subs_payments`
--

LOCK TABLES `dol_subs_payments` WRITE;
/*!40000 ALTER TABLE `dol_subs_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dol_subs_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dol_subs_settings`
--

DROP TABLE IF EXISTS `dol_subs_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dol_subs_settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `payment_proc` varchar(100) NOT NULL,
  `alertpay_id` varchar(100) NOT NULL,
  `ap_securitycode` varchar(100) NOT NULL,
  `an_login` varchar(100) NOT NULL,
  `an_transkey` varchar(100) NOT NULL,
  `an_test` tinyint(1) NOT NULL,
  `an_api` varchar(5) NOT NULL,
  `an_ssl` tinyint(1) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `pp_custom_field` varchar(255) NOT NULL,
  `moneybookers_id` varchar(100) NOT NULL,
  `data_forward_1` varchar(255) NOT NULL,
  `data_forward_2` varchar(255) NOT NULL,
  `require_mem` tinyint(1) NOT NULL,
  `redirect_guests` tinyint(1) NOT NULL,
  `disable_downgrade` tinyint(1) NOT NULL,
  `disable_upgrade` tinyint(1) NOT NULL,
  `default_memID` int(5) NOT NULL DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dol_subs_settings`
--

LOCK TABLES `dol_subs_settings` WRITE;
/*!40000 ALTER TABLE `dol_subs_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dol_subs_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faith`
--

DROP TABLE IF EXISTS `faith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faith` (
  `faith_id` int(5) NOT NULL,
  `faith` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faith`
--

LOCK TABLES `faith` WRITE;
/*!40000 ALTER TABLE `faith` DISABLE KEYS */;
INSERT INTO `faith` VALUES (4,'Christian');
/*!40000 ALTER TABLE `faith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_favourite`
--

DROP TABLE IF EXISTS `family_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_favourite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `favouredby` int(11) NOT NULL,
  `favouredfamily` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_favourite`
--

LOCK TABLES `family_favourite` WRITE;
/*!40000 ALTER TABLE `family_favourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_affiliates`
--

DROP TABLE IF EXISTS `hm_aff_pro_affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(155) NOT NULL,
  `last_name` varchar(155) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `payout_minimum` varchar(255) NOT NULL,
  `payout_preference` varchar(255) NOT NULL,
  `paypal_email` varchar(255) NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(55) NOT NULL,
  `campaigns` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_affiliates`
--

LOCK TABLES `hm_aff_pro_affiliates` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_banners`
--

DROP TABLE IF EXISTS `hm_aff_pro_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `hidden` varchar(100) NOT NULL,
  `campaign_id` varchar(100) NOT NULL,
  `target_url` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `text_title` varchar(100) NOT NULL,
  `text_details` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_banners`
--

LOCK TABLES `hm_aff_pro_banners` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_campaigns`
--

DROP TABLE IF EXISTS `hm_aff_pro_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(55) NOT NULL,
  `click_commission` varchar(55) NOT NULL,
  `click_amount` varchar(55) NOT NULL,
  `join_commission` varchar(55) NOT NULL,
  `join_amount` varchar(55) NOT NULL,
  `membership_commission` varchar(55) NOT NULL,
  `membership_amount` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_campaigns`
--

LOCK TABLES `hm_aff_pro_campaigns` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_clicks`
--

DROP TABLE IF EXISTS `hm_aff_pro_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_clicks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(255) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `raw` varchar(255) NOT NULL,
  `unique` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_clicks`
--

LOCK TABLES `hm_aff_pro_clicks` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_clicks` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_clicks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_commissions`
--

DROP TABLE IF EXISTS `hm_aff_pro_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier` int(11) NOT NULL,
  `campaign_id` varchar(255) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `membership_id` varchar(255) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `approved` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_commissions`
--

LOCK TABLES `hm_aff_pro_commissions` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_impressions`
--

DROP TABLE IF EXISTS `hm_aff_pro_impressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_impressions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(255) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `raw` varchar(255) NOT NULL,
  `unique` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_impressions`
--

LOCK TABLES `hm_aff_pro_impressions` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_impressions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_impressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_invoices`
--

DROP TABLE IF EXISTS `hm_aff_pro_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency_sign` varchar(255) NOT NULL,
  `invoicetext` varchar(255) NOT NULL,
  `datepaid` varchar(255) NOT NULL,
  `method` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_invoices`
--

LOCK TABLES `hm_aff_pro_invoices` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_payouts`
--

DROP TABLE IF EXISTS `hm_aff_pro_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_payouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency_sign` varchar(255) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `datepaid` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_payouts`
--

LOCK TABLES `hm_aff_pro_payouts` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_aff_pro_settings`
--

DROP TABLE IF EXISTS `hm_aff_pro_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_aff_pro_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(100) DEFAULT NULL,
  `auth_code` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_aff_pro_settings`
--

LOCK TABLES `hm_aff_pro_settings` WRITE;
/*!40000 ALTER TABLE `hm_aff_pro_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hm_aff_pro_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `isDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter',
  `slug` varchar(250) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES (1,'test','test',1,NULL,'1','',0);
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter_caption`
--

DROP TABLE IF EXISTS `letter_caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter_caption` (
  `Caption_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Caption_Name` varchar(250) NOT NULL,
  PRIMARY KEY (`Caption_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter_caption`
--

LOCK TABLES `letter_caption` WRITE;
/*!40000 ALTER TABLE `letter_caption` DISABLE KEYS */;
/*!40000 ALTER TABLE `letter_caption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter_newdb`
--

DROP TABLE IF EXISTS `letter_newdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter_newdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `profile_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter_newdb`
--

LOCK TABLES `letter_newdb` WRITE;
/*!40000 ALTER TABLE `letter_newdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `letter_newdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letters_default`
--

DROP TABLE IF EXISTS `letters_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letters_default` (
  `default_id` int(11) NOT NULL,
  `default_letter` varchar(200) NOT NULL,
  `default_letter_label` varchar(200) NOT NULL,
  PRIMARY KEY (`default_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letters_default`
--

LOCK TABLES `letters_default` WRITE;
/*!40000 ALTER TABLE `letters_default` DISABLE KEYS */;
INSERT INTO `letters_default` VALUES (1,'test','test');
/*!40000 ALTER TABLE `letters_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letters_sort`
--

DROP TABLE IF EXISTS `letters_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letters_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letters_sort`
--

LOCK TABLES `letters_sort` WRITE;
/*!40000 ALTER TABLE `letters_sort` DISABLE KEYS */;
INSERT INTO `letters_sort` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `letters_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letters_sort_newdb`
--

DROP TABLE IF EXISTS `letters_sort_newdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letters_sort_newdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letters_sort_newdb`
--

LOCK TABLES `letters_sort_newdb` WRITE;
/*!40000 ALTER TABLE `letters_sort_newdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `letters_sort_newdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_list`
--

DROP TABLE IF EXISTS `like_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `LikedBy` int(10) NOT NULL,
  `AgencyLike` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_list`
--

LOCK TABLES `like_list` WRITE;
/*!40000 ALTER TABLE `like_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_list_family`
--

DROP TABLE IF EXISTS `like_list_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_list_family` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LikedBy` int(10) NOT NULL,
  `FamilyLiked` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_list_family`
--

LOCK TABLES `like_list_family` WRITE;
/*!40000 ALTER TABLE `like_list_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_list_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchdependency`
--

DROP TABLE IF EXISTS `matchdependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchdependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchfieldid` int(11) DEFAULT NULL,
  `usercolumn` varchar(255) DEFAULT NULL,
  `preferencecolumn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchdependency`
--

LOCK TABLES `matchdependency` WRITE;
/*!40000 ALTER TABLE `matchdependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchdependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchfileds`
--

DROP TABLE IF EXISTS `matchfileds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchfileds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(255) DEFAULT NULL,
  `percentage` int(10) unsigned DEFAULT NULL,
  `columnName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `fillColumn` varchar(255) DEFAULT NULL,
  `contenttext` varchar(255) DEFAULT NULL,
  `ProfileType` varchar(45) DEFAULT NULL,
  `Order` int(10) unsigned DEFAULT NULL,
  `Mandatory` int(10) unsigned DEFAULT NULL,
  `Values` varchar(255) DEFAULT NULL,
  `prefColumn` varchar(255) DEFAULT NULL,
  `prefType` varchar(255) DEFAULT NULL,
  `dependency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchfileds`
--

LOCK TABLES `matchfileds` WRITE;
/*!40000 ALTER TABLE `matchfileds` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchfileds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_admins`
--

DROP TABLE IF EXISTS `modzzz_faq_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_admins`
--

LOCK TABLES `modzzz_faq_admins` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_cmts`
--

DROP TABLE IF EXISTS `modzzz_faq_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_cmts`
--

LOCK TABLES `modzzz_faq_cmts` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_cmts_track`
--

DROP TABLE IF EXISTS `modzzz_faq_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_cmts_track`
--

LOCK TABLES `modzzz_faq_cmts_track` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_files`
--

DROP TABLE IF EXISTS `modzzz_faq_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_files`
--

LOCK TABLES `modzzz_faq_files` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_images`
--

DROP TABLE IF EXISTS `modzzz_faq_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_images`
--

LOCK TABLES `modzzz_faq_images` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_main`
--

DROP TABLE IF EXISTS `modzzz_faq_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `snippet` text NOT NULL,
  `desc` text NOT NULL,
  `status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `thumb` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `views` int(11) NOT NULL,
  `rate_up` int(11) NOT NULL,
  `rate_down` int(11) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `allow_view_faq_to` int(11) NOT NULL,
  `allow_comment_to` int(11) NOT NULL,
  `allow_rate_to` int(11) NOT NULL,
  `allow_upload_photos_to` varchar(16) NOT NULL,
  `allow_upload_videos_to` varchar(16) NOT NULL,
  `allow_upload_sounds_to` varchar(16) NOT NULL,
  `allow_upload_files_to` varchar(16) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_main`
--

LOCK TABLES `modzzz_faq_main` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_ratehelp`
--

DROP TABLE IF EXISTS `modzzz_faq_ratehelp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_ratehelp` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_ratehelp`
--

LOCK TABLES `modzzz_faq_ratehelp` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_ratehelp` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_ratehelp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_rating`
--

DROP TABLE IF EXISTS `modzzz_faq_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `gal_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_rating`
--

LOCK TABLES `modzzz_faq_rating` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_rating_track`
--

DROP TABLE IF EXISTS `modzzz_faq_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `gal_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_rating_track`
--

LOCK TABLES `modzzz_faq_rating_track` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_sounds`
--

DROP TABLE IF EXISTS `modzzz_faq_sounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_sounds`
--

LOCK TABLES `modzzz_faq_sounds` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_sounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_sounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_videos`
--

DROP TABLE IF EXISTS `modzzz_faq_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_videos`
--

LOCK TABLES `modzzz_faq_videos` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_faq_views_track`
--

DROP TABLE IF EXISTS `modzzz_faq_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_faq_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_faq_views_track`
--

LOCK TABLES `modzzz_faq_views_track` WRITE;
/*!40000 ALTER TABLE `modzzz_faq_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_faq_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_admins`
--

DROP TABLE IF EXISTS `modzzz_listing_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_admins`
--

LOCK TABLES `modzzz_listing_admins` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_categ`
--

DROP TABLE IF EXISTS `modzzz_listing_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_categ` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_categ`
--

LOCK TABLES `modzzz_listing_categ` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_cities`
--

DROP TABLE IF EXISTS `modzzz_listing_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_cities` (
  `country` varchar(2) NOT NULL,
  `city` varchar(255) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `failed` tinyint(4) NOT NULL,
  PRIMARY KEY (`country`,`city`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_cities`
--

LOCK TABLES `modzzz_listing_cities` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_claim`
--

DROP TABLE IF EXISTS `modzzz_listing_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_claim` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `claim_date` int(11) NOT NULL DEFAULT '0',
  `assign_date` int(11) NOT NULL DEFAULT '0',
  `processed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_claim`
--

LOCK TABLES `modzzz_listing_claim` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_cmts`
--

DROP TABLE IF EXISTS `modzzz_listing_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_cmts`
--

LOCK TABLES `modzzz_listing_cmts` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_cmts_track`
--

DROP TABLE IF EXISTS `modzzz_listing_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_cmts_track`
--

LOCK TABLES `modzzz_listing_cmts_track` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_countries`
--

DROP TABLE IF EXISTS `modzzz_listing_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_countries` (
  `country` varchar(2) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `failed` tinyint(4) NOT NULL,
  PRIMARY KEY (`country`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_countries`
--

LOCK TABLES `modzzz_listing_countries` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_fans`
--

DROP TABLE IF EXISTS `modzzz_listing_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_fans` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entry`,`id_profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_fans`
--

LOCK TABLES `modzzz_listing_fans` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_featured_orders`
--

DROP TABLE IF EXISTS `modzzz_listing_featured_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_featured_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price` float unsigned NOT NULL,
  `days` int(11) unsigned NOT NULL,
  `item_id` int(11) unsigned NOT NULL,
  `buyer_id` int(11) unsigned NOT NULL,
  `trans_id` varchar(100) NOT NULL,
  `trans_type` varchar(100) NOT NULL,
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `featured_order_id` (`buyer_id`,`trans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_featured_orders`
--

LOCK TABLES `modzzz_listing_featured_orders` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_featured_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_featured_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_files`
--

DROP TABLE IF EXISTS `modzzz_listing_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_files`
--

LOCK TABLES `modzzz_listing_files` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum`
--

DROP TABLE IF EXISTS `modzzz_listing_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum` (
  `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`forum_id`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_uri` (`forum_uri`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum`
--

LOCK TABLES `modzzz_listing_forum` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_actions_log`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0',
  KEY `action_when` (`action_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_actions_log`
--

LOCK TABLES `modzzz_listing_forum_actions_log` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_attachments`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL,
  PRIMARY KEY (`att_hash`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_attachments`
--

LOCK TABLES `modzzz_listing_forum_attachments` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_cat`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`),
  KEY `cat_uri` (`cat_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_cat`
--

LOCK TABLES `modzzz_listing_forum_cat` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_flag`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_flag`
--

LOCK TABLES `modzzz_listing_forum_flag` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_post`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user` (`user`),
  KEY `when` (`when`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_post`
--

LOCK TABLES `modzzz_listing_forum_post` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_signatures`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_signatures`
--

LOCK TABLES `modzzz_listing_forum_signatures` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_topic`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_uri` varchar(255) NOT NULL DEFAULT '',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `when` int(11) NOT NULL DEFAULT '0',
  `topic_posts` int(11) NOT NULL DEFAULT '0',
  `first_post_user` varchar(32) NOT NULL DEFAULT '0',
  `first_post_when` int(11) NOT NULL DEFAULT '0',
  `last_post_user` varchar(32) NOT NULL DEFAULT '',
  `last_post_when` int(11) NOT NULL DEFAULT '0',
  `topic_sticky` int(11) NOT NULL DEFAULT '0',
  `topic_locked` tinyint(4) NOT NULL DEFAULT '0',
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_2` (`forum_id`,`when`),
  KEY `topic_uri` (`topic_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_topic`
--

LOCK TABLES `modzzz_listing_forum_topic` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_user`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_user`
--

LOCK TABLES `modzzz_listing_forum_user` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_user_activity`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_user_activity`
--

LOCK TABLES `modzzz_listing_forum_user_activity` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_user_stat`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_user_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_user_stat`
--

LOCK TABLES `modzzz_listing_forum_user_stat` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_user_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_user_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_forum_vote`
--

DROP TABLE IF EXISTS `modzzz_listing_forum_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_name`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_forum_vote`
--

LOCK TABLES `modzzz_listing_forum_vote` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_forum_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_forum_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_images`
--

DROP TABLE IF EXISTS `modzzz_listing_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_images`
--

LOCK TABLES `modzzz_listing_images` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_invoices`
--

DROP TABLE IF EXISTS `modzzz_listing_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_invoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `days` int(11) unsigned NOT NULL,
  `listing_id` int(11) unsigned NOT NULL,
  `package_id` int(11) unsigned NOT NULL,
  `invoice_status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `invoice_due_date` int(11) NOT NULL,
  `invoice_expiry_date` int(11) NOT NULL,
  `invoice_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_invoices`
--

LOCK TABLES `modzzz_listing_invoices` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_main`
--

DROP TABLE IF EXISTS `modzzz_listing_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `country` varchar(2) NOT NULL,
  `city` varchar(150) NOT NULL,
  `address1` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(150) NOT NULL DEFAULT '',
  `zip` varchar(16) NOT NULL,
  `status` enum('approved','pending','expired') NOT NULL DEFAULT 'approved',
  `thumb` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `currency` varchar(255) NOT NULL DEFAULT '',
  `categories` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL,
  `fans_count` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `featured_expiry_date` int(11) NOT NULL,
  `featured_date` int(11) NOT NULL,
  `allow_post_in_forum_to` varchar(16) NOT NULL,
  `allow_view_listing_to` int(11) NOT NULL,
  `allow_view_fans_to` varchar(16) NOT NULL,
  `allow_join_to` int(11) NOT NULL,
  `allow_comment_to` int(11) NOT NULL,
  `allow_rate_to` int(11) NOT NULL,
  `allow_upload_photos_to` varchar(16) NOT NULL,
  `allow_upload_videos_to` varchar(16) NOT NULL,
  `allow_upload_sounds_to` varchar(16) NOT NULL,
  `allow_upload_files_to` varchar(16) NOT NULL,
  `membership_view_filter` varchar(100) NOT NULL DEFAULT '',
  `votes` int(11) NOT NULL DEFAULT '0',
  `pre_expire_notify` int(11) NOT NULL,
  `post_expire_notify` int(11) NOT NULL,
  `businessname` varchar(100) NOT NULL DEFAULT '',
  `businesswebsite` varchar(100) NOT NULL DEFAULT '',
  `businessemail` varchar(100) NOT NULL DEFAULT '',
  `businesstelephone` varchar(20) NOT NULL DEFAULT '',
  `businessfax` varchar(20) NOT NULL DEFAULT '',
  `expiry_date` int(11) NOT NULL DEFAULT '0',
  `invoice_no` varchar(100) NOT NULL,
  `video_embed` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_main`
--

LOCK TABLES `modzzz_listing_main` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_orders`
--

DROP TABLE IF EXISTS `modzzz_listing_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `buyer_id` int(11) unsigned NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `order_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id` (`buyer_id`,`order_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_orders`
--

LOCK TABLES `modzzz_listing_orders` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_packages`
--

DROP TABLE IF EXISTS `modzzz_listing_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `days` int(11) NOT NULL,
  `description` text NOT NULL,
  `videos` int(11) NOT NULL DEFAULT '0',
  `photos` int(11) NOT NULL DEFAULT '0',
  `sounds` int(11) NOT NULL DEFAULT '0',
  `files` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','pending') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_packages`
--

LOCK TABLES `modzzz_listing_packages` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_profiles`
--

DROP TABLE IF EXISTS `modzzz_listing_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_profiles` (
  `id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` int(10) unsigned NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `zoom` tinyint(4) NOT NULL DEFAULT '-1',
  `type` char(16) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `allow_view_location_to` int(11) NOT NULL DEFAULT '3',
  `failed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_profiles`
--

LOCK TABLES `modzzz_listing_profiles` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_rating`
--

DROP TABLE IF EXISTS `modzzz_listing_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `gal_id` (`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_rating`
--

LOCK TABLES `modzzz_listing_rating` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_rating_track`
--

DROP TABLE IF EXISTS `modzzz_listing_rating_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL,
  KEY `gal_ip` (`gal_ip`,`gal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_rating_track`
--

LOCK TABLES `modzzz_listing_rating_track` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_rating_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_rating_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_sounds`
--

DROP TABLE IF EXISTS `modzzz_listing_sounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_sounds`
--

LOCK TABLES `modzzz_listing_sounds` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_sounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_sounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_videos`
--

DROP TABLE IF EXISTS `modzzz_listing_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL,
  UNIQUE KEY `entry_id` (`entry_id`,`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_videos`
--

LOCK TABLES `modzzz_listing_videos` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modzzz_listing_views_track`
--

DROP TABLE IF EXISTS `modzzz_listing_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modzzz_listing_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modzzz_listing_views_track`
--

LOCK TABLES `modzzz_listing_views_track` WRITE;
/*!40000 ALTER TABLE `modzzz_listing_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `modzzz_listing_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_template_agency`
--

DROP TABLE IF EXISTS `pdf_template_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdf_template_agency` (
  `template_agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`template_agency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_template_agency`
--

LOCK TABLES `pdf_template_agency` WRITE;
/*!40000 ALTER TABLE `pdf_template_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_template_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_template_data`
--

DROP TABLE IF EXISTS `pdf_template_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdf_template_data` (
  `template_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_user_id` varchar(255) DEFAULT NULL,
  `cover_title` text,
  `cover_picture` varchar(255) DEFAULT NULL,
  `block_ids` text,
  `photo_title` text,
  `photo_ids` text,
  `photo_description` text,
  PRIMARY KEY (`template_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1096 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_template_data`
--

LOCK TABLES `pdf_template_data` WRITE;
/*!40000 ALTER TABLE `pdf_template_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_template_master`
--

DROP TABLE IF EXISTS `pdf_template_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdf_template_master` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL,
  `template_description` varchar(255) DEFAULT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `isDeleted` char(1) DEFAULT NULL,
  `template_disbale_status` char(1) DEFAULT NULL,
  `printMode` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_template_master`
--

LOCK TABLES `pdf_template_master` WRITE;
/*!40000 ALTER TABLE `pdf_template_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_template_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_template_user`
--

DROP TABLE IF EXISTS `pdf_template_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdf_template_user` (
  `template_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `template_file_path` varchar(255) DEFAULT NULL,
  `template_description` varchar(255) DEFAULT NULL,
  `isDeleted` char(1) DEFAULT NULL,
  `isDefault` char(1) DEFAULT NULL,
  `lastupdateddate` datetime DEFAULT NULL,
  PRIMARY KEY (`template_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2326 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_template_user`
--

LOCK TABLES `pdf_template_user` WRITE;
/*!40000 ALTER TABLE `pdf_template_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_template_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdfdetails`
--

DROP TABLE IF EXISTS `pdfdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdfdetails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdfname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2444 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdfdetails`
--

LOCK TABLES `pdfdetails` WRITE;
/*!40000 ALTER TABLE `pdfdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdfdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_cmts`
--

DROP TABLE IF EXISTS `places_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_cmts` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_cmts`
--

LOCK TABLES `places_cmts` WRITE;
/*!40000 ALTER TABLE `places_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_cmts_track`
--

DROP TABLE IF EXISTS `places_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_cmts_track`
--

LOCK TABLES `places_cmts_track` WRITE;
/*!40000 ALTER TABLE `places_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_config`
--

DROP TABLE IF EXISTS `places_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_config` (
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cat` int(11) NOT NULL DEFAULT '0',
  `type` enum('text','select','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_config`
--

LOCK TABLES `places_config` WRITE;
/*!40000 ALTER TABLE `places_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_drawings`
--

DROP TABLE IF EXISTS `places_drawings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_drawings` (
  `pl_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_drawings`
--

LOCK TABLES `places_drawings` WRITE;
/*!40000 ALTER TABLE `places_drawings` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_drawings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_kml_files`
--

DROP TABLE IF EXISTS `places_kml_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_kml_files` (
  `pl_kml_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL,
  `pl_kml_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pl_kml_file_ext` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `pl_kml_added` int(11) NOT NULL,
  PRIMARY KEY (`pl_kml_id`),
  KEY `pl_id` (`pl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_kml_files`
--

LOCK TABLES `places_kml_files` WRITE;
/*!40000 ALTER TABLE `places_kml_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_kml_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_locations`
--

DROP TABLE IF EXISTS `places_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_locations` (
  `gmk_id` int(11) NOT NULL DEFAULT '0',
  `gmk_lat` float NOT NULL DEFAULT '0',
  `gmk_lng` float NOT NULL DEFAULT '0',
  `gmk_zoom` float NOT NULL DEFAULT '0',
  `gmk_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gmk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_locations`
--

LOCK TABLES `places_locations` WRITE;
/*!40000 ALTER TABLE `places_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_photos`
--

DROP TABLE IF EXISTS `places_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_photos` (
  `pl_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pl_img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_photos`
--

LOCK TABLES `places_photos` WRITE;
/*!40000 ALTER TABLE `places_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_places`
--

DROP TABLE IF EXISTS `places_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_places` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_thumb` int(11) NOT NULL DEFAULT '0',
  `pl_author_id` bigint(8) unsigned NOT NULL DEFAULT '0',
  `pl_featured` tinyint(4) NOT NULL DEFAULT '0',
  `pl_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_uri` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pl_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `pl_cat` int(11) NOT NULL DEFAULT '0',
  `pl_country` varchar(2) CHARACTER SET utf8 NOT NULL,
  `pl_city` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_zip` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pl_map_lat` float NOT NULL DEFAULT '0',
  `pl_map_lng` float NOT NULL DEFAULT '0',
  `pl_map_zoom` float NOT NULL DEFAULT '0',
  `pl_map_type` int(11) NOT NULL DEFAULT '0',
  `pl_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pl_rss` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pl_status` enum('active','approval') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `rate_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pl_id`),
  KEY `pl_author_id` (`pl_author_id`),
  FULLTEXT KEY `pl_name` (`pl_name`,`pl_desc`,`pl_city`,`pl_address`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_places`
--

LOCK TABLES `places_places` WRITE;
/*!40000 ALTER TABLE `places_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_places_cat`
--

DROP TABLE IF EXISTS `places_places_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_places_cat` (
  `pl_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_cat_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_cat_icon` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`pl_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_places_cat`
--

LOCK TABLES `places_places_cat` WRITE;
/*!40000 ALTER TABLE `places_places_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_places_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_rating`
--

DROP TABLE IF EXISTS `places_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_rating` (
  `places_id` int(12) NOT NULL DEFAULT '0',
  `places_rating_count` int(11) NOT NULL DEFAULT '0',
  `places_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`places_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_rating`
--

LOCK TABLES `places_rating` WRITE;
/*!40000 ALTER TABLE `places_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_videos`
--

DROP TABLE IF EXISTS `places_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_videos` (
  `pl_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL DEFAULT '0',
  `pl_video_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pl_video_embed` text COLLATE utf8_unicode_ci NOT NULL,
  `pl_video_added` int(11) NOT NULL,
  PRIMARY KEY (`pl_video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_videos`
--

LOCK TABLES `places_videos` WRITE;
/*!40000 ALTER TABLE `places_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_voting_track`
--

DROP TABLE IF EXISTS `places_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_voting_track` (
  `places_id` int(12) NOT NULL DEFAULT '0',
  `places_ip` varchar(20) DEFAULT NULL,
  `places_date` datetime DEFAULT NULL,
  KEY `med_ip` (`places_ip`,`places_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_voting_track`
--

LOCK TABLES `places_voting_track` WRITE;
/*!40000 ALTER TABLE `places_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `places_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_faith`
--

DROP TABLE IF EXISTS `profile_faith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_faith` (
  `profile_faith_id` int(5) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `Faith_faith_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_faith`
--

LOCK TABLES `profile_faith` WRITE;
/*!40000 ALTER TABLE `profile_faith` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_faith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_status`
--

DROP TABLE IF EXISTS `profile_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_status` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(100) NOT NULL,
  `Status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IPaddr` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `AgencyId` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1774 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_status`
--

LOCK TABLES `profile_status` WRITE;
/*!40000 ALTER TABLE `profile_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qwe_profile_theme_base`
--

DROP TABLE IF EXISTS `qwe_profile_theme_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qwe_profile_theme_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('myspace','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'myspace',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `title` (`title`),
  KEY `file` (`file`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qwe_profile_theme_base`
--

LOCK TABLES `qwe_profile_theme_base` WRITE;
/*!40000 ALTER TABLE `qwe_profile_theme_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `qwe_profile_theme_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qwe_profile_theme_pages`
--

DROP TABLE IF EXISTS `qwe_profile_theme_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qwe_profile_theme_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qwe_profile_theme_pages`
--

LOCK TABLES `qwe_profile_theme_pages` WRITE;
/*!40000 ALTER TABLE `qwe_profile_theme_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qwe_profile_theme_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qwe_profile_theme_themes`
--

DROP TABLE IF EXISTS `qwe_profile_theme_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qwe_profile_theme_themes` (
  `profile_id` int(11) NOT NULL,
  `css` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('myspace','other') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'myspace',
  PRIMARY KEY (`profile_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qwe_profile_theme_themes`
--

LOCK TABLES `qwe_profile_theme_themes` WRITE;
/*!40000 ALTER TABLE `qwe_profile_theme_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qwe_profile_theme_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_need`
--

DROP TABLE IF EXISTS `special_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_need` (
  `special_need_id` int(5) NOT NULL,
  `special_need` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_need`
--

LOCK TABLES `special_need` WRITE;
/*!40000 ALTER TABLE `special_need` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_need` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_need_pref`
--

DROP TABLE IF EXISTS `special_need_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_need_pref` (
  `special_need_pref_id` int(5) NOT NULL,
  `special_need_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_need_pref`
--

LOCK TABLES `special_need_pref` WRITE;
/*!40000 ALTER TABLE `special_need_pref` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_need_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `StateCode` varchar(5) NOT NULL,
  `accounts_id` int(11) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'1','Kerala','1',1);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_account_custom_stat_elements`
--

DROP TABLE IF EXISTS `sys_account_custom_stat_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_account_custom_stat_elements` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Label` varchar(128) NOT NULL,
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_account_custom_stat_elements`
--

LOCK TABLES `sys_account_custom_stat_elements` WRITE;
/*!40000 ALTER TABLE `sys_account_custom_stat_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_account_custom_stat_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_actions`
--

DROP TABLE IF EXISTS `sys_acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_actions` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `AdditionalParamName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_actions`
--

LOCK TABLES `sys_acl_actions` WRITE;
/*!40000 ALTER TABLE `sys_acl_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_actions_track`
--

DROP TABLE IF EXISTS `sys_acl_actions_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_actions_track` (
  `IDAction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `ActionsLeft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ValidSince` datetime DEFAULT NULL,
  PRIMARY KEY (`IDAction`,`IDMember`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_actions_track`
--

LOCK TABLES `sys_acl_actions_track` WRITE;
/*!40000 ALTER TABLE `sys_acl_actions_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_actions_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_level_prices`
--

DROP TABLE IF EXISTS `sys_acl_level_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_level_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Days` int(10) unsigned NOT NULL DEFAULT '1',
  `Price` float unsigned NOT NULL DEFAULT '1',
  `Unit` varchar(11) NOT NULL,
  `Length` varchar(11) NOT NULL,
  `Auto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`IDLevel`,`Days`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_level_prices`
--

LOCK TABLES `sys_acl_level_prices` WRITE;
/*!40000 ALTER TABLE `sys_acl_level_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_level_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels`
--

DROP TABLE IF EXISTS `sys_acl_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Icon` varchar(255) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `Active` enum('yes','no') NOT NULL DEFAULT 'no',
  `Purchasable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `Removable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `Order` int(11) NOT NULL DEFAULT '0',
  `Free` int(11) NOT NULL,
  `Trial` tinyint(1) NOT NULL,
  `Trial_Length` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels`
--

LOCK TABLES `sys_acl_levels` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels` DISABLE KEYS */;
INSERT INTO `sys_acl_levels` VALUES (1,'Non-member','non-member.png','Cannot be removed.','yes','no','no',0,0,0,0),(2,'Standard','member.png','Cannot be removed.','yes','no','no',0,0,0,0),(3,'Promotion','promotion.png','Cannot be removed.','yes','no','no',0,0,0,0),(4,'Adoptive Family - GOLD','1288016928.png','Adoptive Family GOLD Level','yes','','yes',0,0,0,0),(5,'Adoptive Family - SILVER','1288017004.png','Adoptive Family - SILVER','yes','','yes',0,0,0,0),(6,'Expecting Parent','1288017117.png','Please select this membership if you are expecting or want to create an adoption plan.','yes','yes','yes',0,1,0,0),(7,'Adoption Service Provider','1288017155.png','Choose this membership if you provide services for the adoption community.  This includes adoption agencies, attorneys, adoption consultants, and caseworkers.','yes','yes','yes',0,1,0,0),(9,'Adoptive Family - Standard','1288547017.png','This is the standard Membership Level for Adoptive Families','yes','','yes',0,1,0,0),(10,'Trial Membership','1319232019.jpg','This membership has 30 day free trial. Account expires after 30 days','no','','yes',0,0,0,0),(14,'Featured Membership - Quarterly ','1334073995.png','The membership with give you the most features available to connect with that future birth parent.   ','yes','yes','yes',2,0,0,0),(15,'Featured Membership - **Unlimited**','1334073995.png','Choose this membership. \r\n\r\nOur best value available today for families.  This membership gives you unlimited features, a selection of services, for a one time fee until you adopt.  If you have not found a match we will renew your account for no cost for another term.\r\nIf you have a discount code enter that then press the get a discount button.','yes','yes','yes',1,0,0,0),(18,'Network Membership','1334073995.png','If you already have your own website and just want to increase your visibility or if you are on a budget this is the service for you.   This is good for 24 months.  If you have not found a match we will renew your account for no cost for another term.','yes','yes','yes',3,0,0,0),(20,'Network Membership - Monthly','1334073995.png','','yes','yes','yes',0,0,0,0),(24,'Featured - new','1361859505.png','','yes','yes','yes',1,0,0,0),(23,'Network - new','1361859436.png','','yes','yes','yes',2,0,0,0),(25,'Basic','membership.png','Basic Membership','yes','yes','yes',0,1,0,5);
/*!40000 ALTER TABLE `sys_acl_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels_features`
--

DROP TABLE IF EXISTS `sys_acl_levels_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_features` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDLevel` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `benefit_text` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels_features`
--

LOCK TABLES `sys_acl_levels_features` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_levels_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels_members`
--

DROP TABLE IF EXISTS `sys_acl_levels_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL,
  PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels_members`
--

LOCK TABLES `sys_acl_levels_members` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_levels_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels_members_backup_28_09_2015`
--

DROP TABLE IF EXISTS `sys_acl_levels_members_backup_28_09_2015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members_backup_28_09_2015` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL,
  PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels_members_backup_28_09_2015`
--

LOCK TABLES `sys_acl_levels_members_backup_28_09_2015` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels_members_backup_28_09_2015` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_levels_members_backup_28_09_2015` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels_members_backup_5_oct_2015`
--

DROP TABLE IF EXISTS `sys_acl_levels_members_backup_5_oct_2015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members_backup_5_oct_2015` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL,
  PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels_members_backup_5_oct_2015`
--

LOCK TABLES `sys_acl_levels_members_backup_5_oct_2015` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels_members_backup_5_oct_2015` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_levels_members_backup_5_oct_2015` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_levels_members_history`
--

DROP TABLE IF EXISTS `sys_acl_levels_members_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members_history` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_levels_members_history`
--

LOCK TABLES `sys_acl_levels_members_history` WRITE;
/*!40000 ALTER TABLE `sys_acl_levels_members_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_levels_members_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_acl_matrix`
--

DROP TABLE IF EXISTS `sys_acl_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_matrix` (
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IDAction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AllowedCount` smallint(5) unsigned DEFAULT NULL,
  `AllowedPeriodLen` smallint(5) unsigned DEFAULT NULL,
  `AllowedPeriodStart` datetime DEFAULT NULL,
  `AllowedPeriodEnd` datetime DEFAULT NULL,
  `AdditionalParamValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDLevel`,`IDAction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_acl_matrix`
--

LOCK TABLES `sys_acl_matrix` WRITE;
/*!40000 ALTER TABLE `sys_acl_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_acl_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin_ban_list`
--

DROP TABLE IF EXISTS `sys_admin_ban_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin_ban_list` (
  `ProfID` int(10) unsigned NOT NULL DEFAULT '0',
  `Time` int(10) unsigned NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ProfID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin_ban_list`
--

LOCK TABLES `sys_admin_ban_list` WRITE;
/*!40000 ALTER TABLE `sys_admin_ban_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_admin_ban_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums`
--

DROP TABLE IF EXISTS `sys_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Caption` varchar(128) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(128) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(20) NOT NULL DEFAULT '',
  `account_id` int(10) NOT NULL DEFAULT '0',
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` int(10) NOT NULL DEFAULT '0',
  `ObjCount` int(10) NOT NULL DEFAULT '0',
  `LastObjId` int(10) NOT NULL DEFAULT '0',
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Uri` (`Uri`,`Type`,`account_id`),
  KEY `Owner` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18517 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums`
--

LOCK TABLES `sys_albums` WRITE;
/*!40000 ALTER TABLE `sys_albums` DISABLE KEYS */;
INSERT INTO `sys_albums` VALUES (1,'Home Pictures','Home Pictures','','Home Pictures','bx_photos',1,'active',0,0,0,3),(2,'Home Videos','Home Videos','','','bx_videos',1,'active',0,0,0,3),(3,'Home Videos2','Home Videos2','','Home Videos2','bx_videos',1,'active',54564,0,0,3);
/*!40000 ALTER TABLE `sys_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_backup`
--

DROP TABLE IF EXISTS `sys_albums_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_backup` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Caption` varchar(128) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(128) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(20) NOT NULL DEFAULT '',
  `Owner` int(10) NOT NULL DEFAULT '0',
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` int(10) NOT NULL DEFAULT '0',
  `ObjCount` int(10) NOT NULL DEFAULT '0',
  `LastObjId` int(10) NOT NULL DEFAULT '0',
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`),
  KEY `Owner` (`Owner`)
) ENGINE=MyISAM AUTO_INCREMENT=16638 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_backup`
--

LOCK TABLES `sys_albums_backup` WRITE;
/*!40000 ALTER TABLE `sys_albums_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_newdb`
--

DROP TABLE IF EXISTS `sys_albums_newdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_newdb` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Caption` varchar(128) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(128) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(20) NOT NULL DEFAULT '',
  `Owner` int(10) NOT NULL DEFAULT '0',
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` int(10) NOT NULL DEFAULT '0',
  `ObjCount` int(10) NOT NULL DEFAULT '0',
  `LastObjId` int(10) NOT NULL DEFAULT '0',
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`),
  KEY `Owner` (`Owner`)
) ENGINE=MyISAM AUTO_INCREMENT=17753 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_newdb`
--

LOCK TABLES `sys_albums_newdb` WRITE;
/*!40000 ALTER TABLE `sys_albums_newdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_newdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_objects`
--

DROP TABLE IF EXISTS `sys_albums_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_objects` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_album` (`id_album`,`id_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_objects`
--

LOCK TABLES `sys_albums_objects` WRITE;
/*!40000 ALTER TABLE `sys_albums_objects` DISABLE KEYS */;
INSERT INTO `sys_albums_objects` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `sys_albums_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_objects_newdb`
--

DROP TABLE IF EXISTS `sys_albums_objects_newdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_objects_newdb` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_album` (`id_album`,`id_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_objects_newdb`
--

LOCK TABLES `sys_albums_objects_newdb` WRITE;
/*!40000 ALTER TABLE `sys_albums_objects_newdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_objects_newdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_objects_newdb_modified`
--

DROP TABLE IF EXISTS `sys_albums_objects_newdb_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_objects_newdb_modified` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_album` (`id_album`,`id_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_objects_newdb_modified`
--

LOCK TABLES `sys_albums_objects_newdb_modified` WRITE;
/*!40000 ALTER TABLE `sys_albums_objects_newdb_modified` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_objects_newdb_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_objects_olddb_backup`
--

DROP TABLE IF EXISTS `sys_albums_objects_olddb_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_objects_olddb_backup` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_album` (`id_album`,`id_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_objects_olddb_backup`
--

LOCK TABLES `sys_albums_objects_olddb_backup` WRITE;
/*!40000 ALTER TABLE `sys_albums_objects_olddb_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_objects_olddb_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_albums_olddb_backup`
--

DROP TABLE IF EXISTS `sys_albums_olddb_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_olddb_backup` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Caption` varchar(128) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(128) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(20) NOT NULL DEFAULT '',
  `Owner` int(10) NOT NULL DEFAULT '0',
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` int(10) NOT NULL DEFAULT '0',
  `ObjCount` int(10) NOT NULL DEFAULT '0',
  `LastObjId` int(10) NOT NULL DEFAULT '0',
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`),
  KEY `Owner` (`Owner`)
) ENGINE=MyISAM AUTO_INCREMENT=17754 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_albums_olddb_backup`
--

LOCK TABLES `sys_albums_olddb_backup` WRITE;
/*!40000 ALTER TABLE `sys_albums_olddb_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_albums_olddb_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_alerts`
--

DROP TABLE IF EXISTS `sys_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_alerts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit` varchar(64) NOT NULL,
  `action` varchar(64) DEFAULT 'none',
  `handler_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alert_handler` (`unit`,`action`,`handler_id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_alerts`
--

LOCK TABLES `sys_alerts` WRITE;
/*!40000 ALTER TABLE `sys_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_alerts_handlers`
--

DROP TABLE IF EXISTS `sys_alerts_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_alerts_handlers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `eval` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_alerts_handlers`
--

LOCK TABLES `sys_alerts_handlers` WRITE;
/*!40000 ALTER TABLE `sys_alerts_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_alerts_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_antispam_block_log`
--

DROP TABLE IF EXISTS `sys_antispam_block_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_antispam_block_log` (
  `ip` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `extra` text NOT NULL,
  `added` int(11) NOT NULL,
  KEY `ip` (`ip`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_antispam_block_log`
--

LOCK TABLES `sys_antispam_block_log` WRITE;
/*!40000 ALTER TABLE `sys_antispam_block_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_antispam_block_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_banners`
--

DROP TABLE IF EXISTS `sys_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_banners` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(32) NOT NULL DEFAULT '',
  `Url` varchar(255) NOT NULL DEFAULT '',
  `Text` mediumtext NOT NULL,
  `Active` tinyint(4) NOT NULL DEFAULT '0',
  `Created` date NOT NULL DEFAULT '0000-00-00',
  `campaign_start` date NOT NULL DEFAULT '2005-01-01',
  `campaign_end` date NOT NULL DEFAULT '2007-01-01',
  `Position` varchar(10) NOT NULL DEFAULT '4',
  `lhshift` int(5) NOT NULL DEFAULT '-200',
  `lvshift` int(5) NOT NULL DEFAULT '-750',
  `rhshift` int(5) NOT NULL DEFAULT '100',
  `rvshift` int(5) NOT NULL DEFAULT '-750',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_banners`
--

LOCK TABLES `sys_banners` WRITE;
/*!40000 ALTER TABLE `sys_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_banners_clicks`
--

DROP TABLE IF EXISTS `sys_banners_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_banners_clicks` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(10) NOT NULL DEFAULT '0',
  `IP` varchar(16) NOT NULL DEFAULT '',
  UNIQUE KEY `ID_2` (`ID`,`Date`,`IP`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_banners_clicks`
--

LOCK TABLES `sys_banners_clicks` WRITE;
/*!40000 ALTER TABLE `sys_banners_clicks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_banners_clicks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_banners_shows`
--

DROP TABLE IF EXISTS `sys_banners_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_banners_shows` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(10) NOT NULL DEFAULT '0',
  `IP` varchar(16) NOT NULL DEFAULT '',
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_banners_shows`
--

LOCK TABLES `sys_banners_shows` WRITE;
/*!40000 ALTER TABLE `sys_banners_shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_banners_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_block_list`
--

DROP TABLE IF EXISTS `sys_block_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_block_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `BlockPair` (`ID`,`Profile`),
  KEY `ID` (`ID`),
  KEY `Profile` (`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_block_list`
--

LOCK TABLES `sys_block_list` WRITE;
/*!40000 ALTER TABLE `sys_block_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_block_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_box_download`
--

DROP TABLE IF EXISTS `sys_box_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_box_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `onclick` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `disabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_box_download`
--

LOCK TABLES `sys_box_download` WRITE;
/*!40000 ALTER TABLE `sys_box_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_box_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_categories`
--

DROP TABLE IF EXISTS `sys_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_categories` (
  `Category` varchar(32) NOT NULL DEFAULT '',
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(20) NOT NULL DEFAULT 'photo',
  `Owner` int(10) unsigned NOT NULL,
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Parent` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Category`,`ID`,`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_categories`
--

LOCK TABLES `sys_categories` WRITE;
/*!40000 ALTER TABLE `sys_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_cmts_profile`
--

DROP TABLE IF EXISTS `sys_cmts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_cmts_profile` (
  `cmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_id`),
  KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_cmts_profile`
--

LOCK TABLES `sys_cmts_profile` WRITE;
/*!40000 ALTER TABLE `sys_cmts_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_cmts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_cmts_track`
--

DROP TABLE IF EXISTS `sys_cmts_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_cmts_track`
--

LOCK TABLES `sys_cmts_track` WRITE;
/*!40000 ALTER TABLE `sys_cmts_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_cmts_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_color_base`
--

DROP TABLE IF EXISTS `sys_color_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_color_base` (
  `ColorName` varchar(20) NOT NULL DEFAULT '',
  `ColorCode` varchar(10) NOT NULL DEFAULT '',
  UNIQUE KEY `ColorName` (`ColorName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_color_base`
--

LOCK TABLES `sys_color_base` WRITE;
/*!40000 ALTER TABLE `sys_color_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_color_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_configuration`
--

DROP TABLE IF EXISTS `sys_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_configuration` (
  `config_ID` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_value` int(11) DEFAULT NULL,
  `config_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_display` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_configuration`
--

LOCK TABLES `sys_configuration` WRITE;
/*!40000 ALTER TABLE `sys_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_countries`
--

DROP TABLE IF EXISTS `sys_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_countries` (
  `ISO2` varchar(2) NOT NULL DEFAULT '',
  `ISO3` varchar(3) NOT NULL DEFAULT '',
  `ISONo` smallint(3) NOT NULL DEFAULT '0',
  `Country` varchar(100) NOT NULL DEFAULT '',
  `Region` varchar(100) DEFAULT NULL,
  `Currency` varchar(100) DEFAULT NULL,
  `CurrencyCode` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ISO2`),
  KEY `CurrencyCode` (`CurrencyCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_countries`
--

LOCK TABLES `sys_countries` WRITE;
/*!40000 ALTER TABLE `sys_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_cron_jobs`
--

DROP TABLE IF EXISTS `sys_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_cron_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `time` varchar(128) NOT NULL DEFAULT '*',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `eval` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_cron_jobs`
--

LOCK TABLES `sys_cron_jobs` WRITE;
/*!40000 ALTER TABLE `sys_cron_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dnsbl_rules`
--

DROP TABLE IF EXISTS `sys_dnsbl_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dnsbl_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chain` enum('spammers','whitelist','uridns') NOT NULL,
  `zonedomain` varchar(255) NOT NULL,
  `postvresp` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `recheck` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `added` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dnsbl_rules`
--

LOCK TABLES `sys_dnsbl_rules` WRITE;
/*!40000 ALTER TABLE `sys_dnsbl_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dnsbl_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dnsbluri_zones`
--

DROP TABLE IF EXISTS `sys_dnsbluri_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dnsbluri_zones` (
  `level` tinyint(4) NOT NULL,
  `zone` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dnsbluri_zones`
--

LOCK TABLES `sys_dnsbluri_zones` WRITE;
/*!40000 ALTER TABLE `sys_dnsbluri_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dnsbluri_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_templates`
--

DROP TABLE IF EXISTS `sys_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_templates` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Desc` varchar(255) NOT NULL,
  `LangID` tinyint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`,`LangID`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_templates`
--

LOCK TABLES `sys_email_templates` WRITE;
/*!40000 ALTER TABLE `sys_email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fave_list`
--

DROP TABLE IF EXISTS `sys_fave_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fave_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `HotPair` (`ID`,`Profile`),
  KEY `ID` (`ID`),
  KEY `Profile` (`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fave_list`
--

LOCK TABLES `sys_fave_list` WRITE;
/*!40000 ALTER TABLE `sys_fave_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_fave_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_friend_list`
--

DROP TABLE IF EXISTS `sys_friend_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_friend_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Check` tinyint(2) NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `FriendPair` (`ID`,`Profile`),
  KEY `Profile` (`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_friend_list`
--

LOCK TABLES `sys_friend_list` WRITE;
/*!40000 ALTER TABLE `sys_friend_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_friend_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_greetings`
--

DROP TABLE IF EXISTS `sys_greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_greetings` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `When` date NOT NULL DEFAULT '0000-00-00',
  `New` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`,`Profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_greetings`
--

LOCK TABLES `sys_greetings` WRITE;
/*!40000 ALTER TABLE `sys_greetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_greetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_injections`
--

DROP TABLE IF EXISTS `sys_injections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_injections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT '0',
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','php') NOT NULL DEFAULT 'text',
  `data` text NOT NULL,
  `replace` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_injections`
--

LOCK TABLES `sys_injections` WRITE;
/*!40000 ALTER TABLE `sys_injections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_injections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_injections_admin`
--

DROP TABLE IF EXISTS `sys_injections_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_injections_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT '0',
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','php') NOT NULL DEFAULT 'text',
  `data` text NOT NULL,
  `replace` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_injections_admin`
--

LOCK TABLES `sys_injections_admin` WRITE;
/*!40000 ALTER TABLE `sys_injections_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_injections_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ip_list`
--

DROP TABLE IF EXISTS `sys_ip_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ip_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `From` int(10) unsigned NOT NULL,
  `To` int(10) unsigned NOT NULL,
  `Type` enum('allow','deny') NOT NULL DEFAULT 'deny',
  `LastDT` int(11) unsigned NOT NULL,
  `Desc` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `From` (`From`),
  KEY `To` (`To`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ip_list`
--

LOCK TABLES `sys_ip_list` WRITE;
/*!40000 ALTER TABLE `sys_ip_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ip_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ip_members_visits`
--

DROP TABLE IF EXISTS `sys_ip_members_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ip_members_visits` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(10) unsigned NOT NULL,
  `From` int(10) unsigned NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `From` (`From`)
) ENGINE=MyISAM AUTO_INCREMENT=70772 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ip_members_visits`
--

LOCK TABLES `sys_ip_members_visits` WRITE;
/*!40000 ALTER TABLE `sys_ip_members_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ip_members_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_localization_categories`
--

DROP TABLE IF EXISTS `sys_localization_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_localization_categories` (
  `ID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_localization_categories`
--

LOCK TABLES `sys_localization_categories` WRITE;
/*!40000 ALTER TABLE `sys_localization_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_localization_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_localization_keys`
--

DROP TABLE IF EXISTS `sys_localization_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_localization_keys` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IDCategory` int(6) unsigned NOT NULL DEFAULT '0',
  `Key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Key` (`Key`)
) ENGINE=MyISAM AUTO_INCREMENT=16425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_localization_keys`
--

LOCK TABLES `sys_localization_keys` WRITE;
/*!40000 ALTER TABLE `sys_localization_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_localization_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_localization_languages`
--

DROP TABLE IF EXISTS `sys_localization_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_localization_languages` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(5) NOT NULL DEFAULT '',
  `Flag` varchar(2) NOT NULL DEFAULT '',
  `Title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_localization_languages`
--

LOCK TABLES `sys_localization_languages` WRITE;
/*!40000 ALTER TABLE `sys_localization_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_localization_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_localization_string_params`
--

DROP TABLE IF EXISTS `sys_localization_string_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_localization_string_params` (
  `IDKey` int(10) unsigned NOT NULL DEFAULT '0',
  `IDParam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`IDKey`,`IDParam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_localization_string_params`
--

LOCK TABLES `sys_localization_string_params` WRITE;
/*!40000 ALTER TABLE `sys_localization_string_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_localization_string_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_localization_strings`
--

DROP TABLE IF EXISTS `sys_localization_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_localization_strings` (
  `IDKey` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `String` mediumtext NOT NULL,
  PRIMARY KEY (`IDKey`,`IDLanguage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_localization_strings`
--

LOCK TABLES `sys_localization_strings` WRITE;
/*!40000 ALTER TABLE `sys_localization_strings` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_localization_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_admin`
--

DROP TABLE IF EXISTS `sys_menu_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `icon` varchar(128) NOT NULL DEFAULT '',
  `icon_large` varchar(128) NOT NULL DEFAULT '',
  `check` varchar(255) NOT NULL DEFAULT '',
  `order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_admin`
--

LOCK TABLES `sys_menu_admin` WRITE;
/*!40000 ALTER TABLE `sys_menu_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_admin_top`
--

DROP TABLE IF EXISTS `sys_menu_admin_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_admin_top` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `caption` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `order` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_admin_top`
--

LOCK TABLES `sys_menu_admin_top` WRITE;
/*!40000 ALTER TABLE `sys_menu_admin_top` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_admin_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_bottom`
--

DROP TABLE IF EXISTS `sys_menu_bottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_bottom` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Caption` varchar(100) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Script` varchar(250) NOT NULL,
  `Order` int(5) NOT NULL,
  `Target` varchar(200) NOT NULL,
  `Visible` set('non','memb') NOT NULL DEFAULT '',
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Movable` tinyint(1) NOT NULL DEFAULT '1',
  `Clonable` tinyint(1) NOT NULL DEFAULT '1',
  `Editable` tinyint(1) NOT NULL DEFAULT '1',
  `Deletable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_bottom`
--

LOCK TABLES `sys_menu_bottom` WRITE;
/*!40000 ALTER TABLE `sys_menu_bottom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_bottom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_member`
--

DROP TABLE IF EXISTS `sys_menu_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_member` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Caption` varchar(100) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Script` varchar(250) NOT NULL,
  `Eval` text NOT NULL,
  `PopupMenu` text NOT NULL,
  `Order` int(5) NOT NULL,
  `Active` enum('1','0') NOT NULL,
  `Movable` tinyint(4) NOT NULL DEFAULT '3',
  `Clonable` tinyint(1) NOT NULL DEFAULT '1',
  `Editable` tinyint(1) NOT NULL DEFAULT '1',
  `Deletable` tinyint(1) NOT NULL DEFAULT '1',
  `Target` varchar(200) NOT NULL,
  `Position` enum('top','bottom','top_extra') NOT NULL DEFAULT 'top',
  `Type` enum('link','system','linked_item') NOT NULL,
  `Parent` int(11) NOT NULL,
  `Bubble` text NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Parent` (`Parent`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_member`
--

LOCK TABLES `sys_menu_member` WRITE;
/*!40000 ALTER TABLE `sys_menu_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_mobile`
--

DROP TABLE IF EXISTS `sys_menu_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `page` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `action` int(11) NOT NULL,
  `action_data` varchar(255) NOT NULL,
  `eval_bubble` text NOT NULL,
  `eval_hidden` text NOT NULL,
  `order` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_mobile`
--

LOCK TABLES `sys_menu_mobile` WRITE;
/*!40000 ALTER TABLE `sys_menu_mobile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_mobile_pages`
--

DROP TABLE IF EXISTS `sys_menu_mobile_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_mobile_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_mobile_pages`
--

LOCK TABLES `sys_menu_mobile_pages` WRITE;
/*!40000 ALTER TABLE `sys_menu_mobile_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_mobile_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_service`
--

DROP TABLE IF EXISTS `sys_menu_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_service` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Caption` varchar(100) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Script` varchar(250) NOT NULL,
  `Target` varchar(200) NOT NULL,
  `Order` int(5) NOT NULL,
  `Visible` set('non','memb') NOT NULL DEFAULT '',
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Movable` tinyint(1) NOT NULL DEFAULT '1',
  `Clonable` tinyint(1) NOT NULL DEFAULT '1',
  `Editable` tinyint(1) NOT NULL DEFAULT '1',
  `Deletable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_service`
--

LOCK TABLES `sys_menu_service` WRITE;
/*!40000 ALTER TABLE `sys_menu_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_top`
--

DROP TABLE IF EXISTS `sys_menu_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_top` (
  `ID` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` smallint(6) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Caption` varchar(50) NOT NULL DEFAULT '',
  `Link` varchar(255) NOT NULL DEFAULT '',
  `Order` smallint(6) unsigned NOT NULL DEFAULT '0',
  `Visible` set('non','memb') NOT NULL DEFAULT '',
  `Target` varchar(20) NOT NULL DEFAULT '',
  `Onclick` mediumtext NOT NULL,
  `Check` varchar(255) NOT NULL DEFAULT '',
  `Movable` tinyint(4) NOT NULL DEFAULT '3',
  `Clonable` tinyint(1) NOT NULL DEFAULT '1',
  `Editable` tinyint(1) NOT NULL DEFAULT '1',
  `Deletable` tinyint(1) NOT NULL DEFAULT '1',
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Type` enum('system','top','custom') NOT NULL DEFAULT 'top',
  `Picture` varchar(128) NOT NULL,
  `Icon` varchar(128) NOT NULL,
  `BQuickLink` tinyint(1) NOT NULL DEFAULT '0',
  `Statistics` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_top`
--

LOCK TABLES `sys_menu_top` WRITE;
/*!40000 ALTER TABLE `sys_menu_top` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_messages`
--

DROP TABLE IF EXISTS `sys_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Sender` int(10) unsigned NOT NULL DEFAULT '0',
  `Recipient` int(10) unsigned NOT NULL DEFAULT '0',
  `Text` mediumtext NOT NULL,
  `Subject` varchar(255) NOT NULL DEFAULT '',
  `New` enum('0','1') NOT NULL DEFAULT '1',
  `Type` enum('letter','greeting') NOT NULL DEFAULT 'letter',
  `Trash` set('sender','recipient') NOT NULL,
  `TrashNotView` set('sender','recipient') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Pair` (`Sender`,`Recipient`),
  KEY `TrashNotView` (`TrashNotView`),
  KEY `Trash` (`Trash`)
) ENGINE=MyISAM AUTO_INCREMENT=5206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_messages`
--

LOCK TABLES `sys_messages` WRITE;
/*!40000 ALTER TABLE `sys_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_modules`
--

DROP TABLE IF EXISTS `sys_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `update_url` varchar(128) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(32) NOT NULL DEFAULT '',
  `class_prefix` varchar(32) NOT NULL DEFAULT '',
  `db_prefix` varchar(32) NOT NULL DEFAULT '',
  `dependencies` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `uri` (`uri`),
  UNIQUE KEY `class_prefix` (`class_prefix`),
  UNIQUE KEY `db_prefix` (`db_prefix`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_modules`
--

LOCK TABLES `sys_modules` WRITE;
/*!40000 ALTER TABLE `sys_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_modules_file_tracks`
--

DROP TABLE IF EXISTS `sys_modules_file_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_modules_file_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4484 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_modules_file_tracks`
--

LOCK TABLES `sys_modules_file_tracks` WRITE;
/*!40000 ALTER TABLE `sys_modules_file_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_modules_file_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_actions`
--

DROP TABLE IF EXISTS `sys_objects_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_actions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Caption` varchar(100) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Url` varchar(250) NOT NULL,
  `Script` varchar(250) NOT NULL,
  `Eval` text NOT NULL,
  `Order` int(5) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `bDisplayInSubMenuHeader` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_actions`
--

LOCK TABLES `sys_objects_actions` WRITE;
/*!40000 ALTER TABLE `sys_objects_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_auths`
--

DROP TABLE IF EXISTS `sys_objects_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_auths` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) NOT NULL,
  `Link` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_auths`
--

LOCK TABLES `sys_objects_auths` WRITE;
/*!40000 ALTER TABLE `sys_objects_auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_captcha`
--

DROP TABLE IF EXISTS `sys_objects_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_captcha`
--

LOCK TABLES `sys_objects_captcha` WRITE;
/*!40000 ALTER TABLE `sys_objects_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_categories`
--

DROP TABLE IF EXISTS `sys_objects_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_categories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(50) NOT NULL,
  `Query` text NOT NULL,
  `PermalinkParam` varchar(50) NOT NULL DEFAULT '',
  `EnabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `DisabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `LangKey` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_categories`
--

LOCK TABLES `sys_objects_categories` WRITE;
/*!40000 ALTER TABLE `sys_objects_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_charts`
--

DROP TABLE IF EXISTS `sys_objects_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `field_date_ts` varchar(255) NOT NULL,
  `field_date_dt` varchar(255) NOT NULL,
  `column_date` int(11) NOT NULL DEFAULT '0',
  `column_count` int(11) NOT NULL DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `options` text NOT NULL,
  `query` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `object` (`object`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_charts`
--

LOCK TABLES `sys_objects_charts` WRITE;
/*!40000 ALTER TABLE `sys_objects_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_cmts`
--

DROP TABLE IF EXISTS `sys_objects_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_cmts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(50) NOT NULL,
  `TableCmts` varchar(50) NOT NULL,
  `TableTrack` varchar(50) NOT NULL,
  `AllowTags` smallint(1) NOT NULL,
  `Nl2br` smallint(1) NOT NULL,
  `SecToEdit` smallint(6) NOT NULL,
  `PerView` smallint(6) NOT NULL,
  `IsRatable` smallint(1) NOT NULL,
  `ViewingThreshold` smallint(6) NOT NULL,
  `AnimationEffect` varchar(50) NOT NULL,
  `AnimationSpeed` smallint(6) NOT NULL,
  `IsOn` smallint(1) NOT NULL,
  `IsMood` smallint(1) NOT NULL,
  `RootStylePrefix` varchar(16) NOT NULL DEFAULT 'cmt',
  `TriggerTable` varchar(32) NOT NULL,
  `TriggerFieldId` varchar(32) NOT NULL,
  `TriggerFieldComments` varchar(32) NOT NULL,
  `ClassName` varchar(32) NOT NULL,
  `ClassFile` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_cmts`
--

LOCK TABLES `sys_objects_cmts` WRITE;
/*!40000 ALTER TABLE `sys_objects_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_editor`
--

DROP TABLE IF EXISTS `sys_objects_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `object` (`object`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_editor`
--

LOCK TABLES `sys_objects_editor` WRITE;
/*!40000 ALTER TABLE `sys_objects_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_member_info`
--

DROP TABLE IF EXISTS `sys_objects_member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_member_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_member_info`
--

LOCK TABLES `sys_objects_member_info` WRITE;
/*!40000 ALTER TABLE `sys_objects_member_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_search`
--

DROP TABLE IF EXISTS `sys_objects_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_search` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(50) NOT NULL DEFAULT '',
  `Title` varchar(50) NOT NULL DEFAULT '',
  `ClassName` varchar(50) NOT NULL DEFAULT '',
  `ClassPath` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_search`
--

LOCK TABLES `sys_objects_search` WRITE;
/*!40000 ALTER TABLE `sys_objects_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_site_maps`
--

DROP TABLE IF EXISTS `sys_objects_site_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_site_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` varchar(5) NOT NULL DEFAULT '0.6',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never','auto') NOT NULL DEFAULT 'auto',
  `class_name` varchar(255) NOT NULL,
  `class_file` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `object` (`object`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_site_maps`
--

LOCK TABLES `sys_objects_site_maps` WRITE;
/*!40000 ALTER TABLE `sys_objects_site_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_site_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_social_sharing`
--

DROP TABLE IF EXISTS `sys_objects_social_sharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_social_sharing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_social_sharing`
--

LOCK TABLES `sys_objects_social_sharing` WRITE;
/*!40000 ALTER TABLE `sys_objects_social_sharing` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_social_sharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_tag`
--

DROP TABLE IF EXISTS `sys_objects_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_tag` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(50) NOT NULL,
  `Query` text NOT NULL,
  `PermalinkParam` varchar(50) NOT NULL DEFAULT '',
  `EnabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `DisabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `LangKey` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_tag`
--

LOCK TABLES `sys_objects_tag` WRITE;
/*!40000 ALTER TABLE `sys_objects_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_views`
--

DROP TABLE IF EXISTS `sys_objects_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `table_track` varchar(32) NOT NULL,
  `period` int(11) NOT NULL DEFAULT '86400',
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_views` varchar(32) NOT NULL,
  `is_on` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_views`
--

LOCK TABLES `sys_objects_views` WRITE;
/*!40000 ALTER TABLE `sys_objects_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_objects_vote`
--

DROP TABLE IF EXISTS `sys_objects_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_objects_vote` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(50) NOT NULL,
  `TableRating` varchar(50) NOT NULL,
  `TableTrack` varchar(50) NOT NULL,
  `RowPrefix` varchar(20) NOT NULL,
  `MaxVotes` smallint(2) NOT NULL,
  `PostName` varchar(50) NOT NULL,
  `IsDuplicate` varchar(80) NOT NULL,
  `IsOn` smallint(1) NOT NULL,
  `className` varchar(50) NOT NULL DEFAULT '',
  `classFile` varchar(100) NOT NULL DEFAULT '',
  `TriggerTable` varchar(32) NOT NULL,
  `TriggerFieldRate` varchar(32) NOT NULL,
  `TriggerFieldRateCount` varchar(32) NOT NULL,
  `TriggerFieldId` varchar(32) NOT NULL,
  `OverrideClassName` varchar(32) NOT NULL,
  `OverrideClassFile` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_objects_vote`
--

LOCK TABLES `sys_objects_vote` WRITE;
/*!40000 ALTER TABLE `sys_objects_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_objects_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_options`
--

DROP TABLE IF EXISTS `sys_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_options` (
  `Name` varchar(64) NOT NULL DEFAULT '',
  `VALUE` mediumtext NOT NULL,
  `kateg` int(6) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `Type` enum('digit','text','checkbox','select','select_multiple','file','list') NOT NULL DEFAULT 'digit',
  `check` text NOT NULL,
  `err_text` varchar(255) NOT NULL DEFAULT '',
  `order_in_kateg` float DEFAULT NULL,
  `AvailableValues` text NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `kateg` (`kateg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_options`
--

LOCK TABLES `sys_options` WRITE;
/*!40000 ALTER TABLE `sys_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_options_cats`
--

DROP TABLE IF EXISTS `sys_options_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_options_cats` (
  `ID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `menu_order` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_options_cats`
--

LOCK TABLES `sys_options_cats` WRITE;
/*!40000 ALTER TABLE `sys_options_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_options_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_page_compose`
--

DROP TABLE IF EXISTS `sys_page_compose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_page_compose` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Page` varchar(255) NOT NULL DEFAULT '',
  `PageWidth` varchar(10) NOT NULL DEFAULT '1140px',
  `Desc` text NOT NULL,
  `Caption` varchar(255) NOT NULL DEFAULT '',
  `Column` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Order` smallint(6) unsigned NOT NULL DEFAULT '0',
  `Func` varchar(255) NOT NULL DEFAULT '',
  `Content` text NOT NULL,
  `DesignBox` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ColWidth` float unsigned NOT NULL DEFAULT '0',
  `Visible` set('non','memb') NOT NULL DEFAULT 'non,memb',
  `MinWidth` int(10) unsigned NOT NULL DEFAULT '0',
  `Cache` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_page_compose`
--

LOCK TABLES `sys_page_compose` WRITE;
/*!40000 ALTER TABLE `sys_page_compose` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_page_compose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_page_compose_pages`
--

DROP TABLE IF EXISTS `sys_page_compose_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_page_compose_pages` (
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Order` int(10) unsigned NOT NULL DEFAULT '0',
  `System` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_page_compose_pages`
--

LOCK TABLES `sys_page_compose_pages` WRITE;
/*!40000 ALTER TABLE `sys_page_compose_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_page_compose_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_page_compose_privacy`
--

DROP TABLE IF EXISTS `sys_page_compose_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_page_compose_privacy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `block_id` int(11) unsigned NOT NULL DEFAULT '0',
  `allow_view_block_to` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `block` (`user_id`,`block_id`)
) ENGINE=MyISAM AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_page_compose_privacy`
--

LOCK TABLES `sys_page_compose_privacy` WRITE;
/*!40000 ALTER TABLE `sys_page_compose_privacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_page_compose_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permalinks`
--

DROP TABLE IF EXISTS `sys_permalinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permalinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(128) NOT NULL DEFAULT '',
  `permalink` varchar(128) NOT NULL DEFAULT '',
  `check` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `check` (`standard`,`permalink`,`check`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permalinks`
--

LOCK TABLES `sys_permalinks` WRITE;
/*!40000 ALTER TABLE `sys_permalinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permalinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_pre_values`
--

DROP TABLE IF EXISTS `sys_pre_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_pre_values` (
  `Key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Key which defines link to values list',
  `Value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Simple value stored in the database',
  `Order` int(10) unsigned NOT NULL DEFAULT '0',
  `LKey` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary language key used for displaying this value',
  `LKey2` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional key used in some other places',
  `LKey3` varchar(255) NOT NULL DEFAULT '',
  `Extra` varchar(255) NOT NULL DEFAULT '' COMMENT 'Some extra values. For example image link for sex',
  `Extra2` varchar(255) NOT NULL DEFAULT '',
  `Extra3` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_pre_values`
--

LOCK TABLES `sys_pre_values` WRITE;
/*!40000 ALTER TABLE `sys_pre_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_pre_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_privacy_actions`
--

DROP TABLE IF EXISTS `sys_privacy_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_privacy_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_uri` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `default_group` varchar(255) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`module_uri`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_privacy_actions`
--

LOCK TABLES `sys_privacy_actions` WRITE;
/*!40000 ALTER TABLE `sys_privacy_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_privacy_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_privacy_defaults`
--

DROP TABLE IF EXISTS `sys_privacy_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_privacy_defaults` (
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `action_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_privacy_defaults`
--

LOCK TABLES `sys_privacy_defaults` WRITE;
/*!40000 ALTER TABLE `sys_privacy_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_privacy_defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_privacy_groups`
--

DROP TABLE IF EXISTS `sys_privacy_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_privacy_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `home_url` varchar(255) NOT NULL DEFAULT '',
  `get_parent` text NOT NULL,
  `get_content` text NOT NULL,
  `members_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_privacy_groups`
--

LOCK TABLES `sys_privacy_groups` WRITE;
/*!40000 ALTER TABLE `sys_privacy_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_privacy_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_privacy_members`
--

DROP TABLE IF EXISTS `sys_privacy_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_privacy_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_member` (`group_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_privacy_members`
--

LOCK TABLES `sys_privacy_members` WRITE;
/*!40000 ALTER TABLE `sys_privacy_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_privacy_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile_fields`
--

DROP TABLE IF EXISTS `sys_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile_fields` (
  `ID` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Type` enum('text','html_area','area','pass','date','select_one','select_set','num','range','bool','system','block') NOT NULL DEFAULT 'text',
  `Control` enum('select','checkbox','radio') DEFAULT NULL COMMENT 'input element for selectors',
  `Extra` text NOT NULL,
  `Min` float DEFAULT NULL,
  `Max` float DEFAULT NULL,
  `Values` text NOT NULL,
  `UseLKey` enum('LKey','LKey2','LKey3') NOT NULL DEFAULT 'LKey',
  `Check` text NOT NULL,
  `Unique` tinyint(1) NOT NULL DEFAULT '0',
  `Default` text NOT NULL,
  `Mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `Deletable` tinyint(1) NOT NULL DEFAULT '1',
  `JoinPage` int(10) unsigned NOT NULL DEFAULT '0',
  `JoinBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `JoinOrder` float DEFAULT NULL,
  `EditOwnBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `EditOwnOrder` float DEFAULT NULL,
  `EditAdmBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `EditAdmOrder` float DEFAULT NULL,
  `EditModBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `EditModOrder` float DEFAULT NULL,
  `ViewMembBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `ViewMembOrder` float DEFAULT NULL,
  `ViewAdmBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `ViewAdmOrder` float DEFAULT NULL,
  `ViewModBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `ViewModOrder` float DEFAULT NULL,
  `ViewVisBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `ViewVisOrder` float DEFAULT NULL,
  `SearchParams` text NOT NULL,
  `SearchSimpleBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `SearchSimpleOrder` float DEFAULT NULL,
  `SearchQuickBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `SearchQuickOrder` float DEFAULT NULL,
  `SearchAdvBlock` int(10) unsigned NOT NULL DEFAULT '0',
  `SearchAdvOrder` float DEFAULT NULL,
  `MatchField` int(10) unsigned NOT NULL DEFAULT '0',
  `MatchPercent` tinyint(7) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile_fields`
--

LOCK TABLES `sys_profile_fields` WRITE;
/*!40000 ALTER TABLE `sys_profile_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile_rating`
--

DROP TABLE IF EXISTS `sys_profile_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile_rating` (
  `pr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pr_rating_count` int(11) NOT NULL DEFAULT '0',
  `pr_rating_sum` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `med_id` (`pr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile_rating`
--

LOCK TABLES `sys_profile_rating` WRITE;
/*!40000 ALTER TABLE `sys_profile_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profile_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile_views_track`
--

DROP TABLE IF EXISTS `sys_profile_views_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `id` (`id`,`viewer`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile_views_track`
--

LOCK TABLES `sys_profile_views_track` WRITE;
/*!40000 ALTER TABLE `sys_profile_views_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profile_views_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile_voting_track`
--

DROP TABLE IF EXISTS `sys_profile_voting_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile_voting_track` (
  `pr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pr_ip` varchar(20) DEFAULT NULL,
  `pr_date` datetime DEFAULT NULL,
  KEY `pr_ip` (`pr_ip`,`pr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile_voting_track`
--

LOCK TABLES `sys_profile_voting_track` WRITE;
/*!40000 ALTER TABLE `sys_profile_voting_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profile_voting_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profiles_match`
--

DROP TABLE IF EXISTS `sys_profiles_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profiles_match` (
  `profile_id` int(10) NOT NULL,
  `sort` enum('none','activity','date_reg') NOT NULL DEFAULT 'none',
  `profiles_match` text,
  UNIQUE KEY `profile_id` (`profile_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profiles_match`
--

LOCK TABLES `sys_profiles_match` WRITE;
/*!40000 ALTER TABLE `sys_profiles_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profiles_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profiles_match_mails`
--

DROP TABLE IF EXISTS `sys_profiles_match_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profiles_match_mails` (
  `profile_id` int(10) NOT NULL,
  `profiles_match` text NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profiles_match_mails`
--

LOCK TABLES `sys_profiles_match_mails` WRITE;
/*!40000 ALTER TABLE `sys_profiles_match_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_profiles_match_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sbs_entries`
--

DROP TABLE IF EXISTS `sys_sbs_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sbs_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_type` tinyint(4) NOT NULL DEFAULT '0',
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry` (`subscriber_id`,`subscriber_type`,`subscription_id`,`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=793 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sbs_entries`
--

LOCK TABLES `sys_sbs_entries` WRITE;
/*!40000 ALTER TABLE `sys_sbs_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sbs_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sbs_messages`
--

DROP TABLE IF EXISTS `sys_sbs_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sbs_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(128) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sbs_messages`
--

LOCK TABLES `sys_sbs_messages` WRITE;
/*!40000 ALTER TABLE `sys_sbs_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sbs_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sbs_queue`
--

DROP TABLE IF EXISTS `sys_sbs_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sbs_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14411 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sbs_queue`
--

LOCK TABLES `sys_sbs_queue` WRITE;
/*!40000 ALTER TABLE `sys_sbs_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sbs_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sbs_types`
--

DROP TABLE IF EXISTS `sys_sbs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sbs_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(32) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `template` varchar(64) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription` (`unit`,`action`,`template`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sbs_types`
--

LOCK TABLES `sys_sbs_types` WRITE;
/*!40000 ALTER TABLE `sys_sbs_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sbs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sbs_users`
--

DROP TABLE IF EXISTS `sys_sbs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sbs_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber` (`name`,`email`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sbs_users`
--

LOCK TABLES `sys_sbs_users` WRITE;
/*!40000 ALTER TABLE `sys_sbs_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sbs_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sessions`
--

DROP TABLE IF EXISTS `sys_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sessions` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sessions`
--

LOCK TABLES `sys_sessions` WRITE;
/*!40000 ALTER TABLE `sys_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_shared_sites`
--

DROP TABLE IF EXISTS `sys_shared_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_shared_sites` (
  `ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL DEFAULT '',
  `Icon` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_shared_sites`
--

LOCK TABLES `sys_shared_sites` WRITE;
/*!40000 ALTER TABLE `sys_shared_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_shared_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_stat_member`
--

DROP TABLE IF EXISTS `sys_stat_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_stat_member` (
  `Type` varchar(20) NOT NULL,
  `SQL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_stat_member`
--

LOCK TABLES `sys_stat_member` WRITE;
/*!40000 ALTER TABLE `sys_stat_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_stat_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_stat_site`
--

DROP TABLE IF EXISTS `sys_stat_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_stat_site` (
  `ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT '',
  `Title` varchar(50) NOT NULL DEFAULT '',
  `UserLink` varchar(255) NOT NULL DEFAULT '',
  `UserQuery` varchar(255) NOT NULL DEFAULT '',
  `AdminLink` varchar(255) NOT NULL DEFAULT '',
  `AdminQuery` varchar(255) NOT NULL DEFAULT '',
  `IconName` varchar(50) NOT NULL DEFAULT '',
  `StatOrder` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_stat_site`
--

LOCK TABLES `sys_stat_site` WRITE;
/*!40000 ALTER TABLE `sys_stat_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_stat_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tags`
--

DROP TABLE IF EXISTS `sys_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_tags` (
  `Tag` varchar(32) NOT NULL DEFAULT '',
  `ObjID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(20) NOT NULL DEFAULT 'profile',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Tag`,`ObjID`,`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tags`
--

LOCK TABLES `sys_tags` WRITE;
/*!40000 ALTER TABLE `sys_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testingaqb`
--

DROP TABLE IF EXISTS `testingaqb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testingaqb` (
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testingaqb`
--

LOCK TABLES `testingaqb` WRITE;
/*!40000 ALTER TABLE `testingaqb` DISABLE KEYS */;
/*!40000 ALTER TABLE `testingaqb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testingprofile`
--

DROP TABLE IF EXISTS `testingprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testingprofile` (
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testingprofile`
--

LOCK TABLES `testingprofile` WRITE;
/*!40000 ALTER TABLE `testingprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `testingprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watermarkimages`
--

DROP TABLE IF EXISTS `watermarkimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watermarkimages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `watermarkimage_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2046 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watermarkimages`
--

LOCK TABLES `watermarkimages` WRITE;
/*!40000 ALTER TABLE `watermarkimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `watermarkimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yn_tour_stations`
--

DROP TABLE IF EXISTS `yn_tour_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yn_tour_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tour_id` int(10) NOT NULL DEFAULT '0',
  `num` int(10) NOT NULL DEFAULT '0',
  `sel` text,
  `msg` text,
  `delay` int(10) NOT NULL DEFAULT '0',
  `position` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yn_tour_stations`
--

LOCK TABLES `yn_tour_stations` WRITE;
/*!40000 ALTER TABLE `yn_tour_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `yn_tour_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yn_tour_tours`
--

DROP TABLE IF EXISTS `yn_tour_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yn_tour_tours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(100) DEFAULT NULL,
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `is_guest` tinyint(1) NOT NULL DEFAULT '1',
  `auto_play` tinyint(1) NOT NULL DEFAULT '0',
  `overlay_opacity` int(3) NOT NULL DEFAULT '20',
  `overlay_cancel` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yn_tour_tours`
--

LOCK TABLES `yn_tour_tours` WRITE;
/*!40000 ALTER TABLE `yn_tour_tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `yn_tour_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yn_tour_viewed`
--

DROP TABLE IF EXISTS `yn_tour_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yn_tour_viewed` (
  `mem_id` int(10) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`,`tour_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yn_tour_viewed`
--

LOCK TABLES `yn_tour_viewed` WRITE;
/*!40000 ALTER TABLE `yn_tour_viewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `yn_tour_viewed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-25  6:19:05
