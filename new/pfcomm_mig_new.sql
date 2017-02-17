-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 192.168.1.50    Database: pfcomm_mig_new
-- ------------------------------------------------------
-- Server version	5.6.32

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
-- Table structure for table `Birthfather_status`
--

DROP TABLE IF EXISTS `Birthfather_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Birthfather_status` (
  `birthfather_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `Birthfather_status` varchar(45) NOT NULL,
  PRIMARY KEY (`birthfather_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SyncLog`
--

DROP TABLE IF EXISTS `SyncLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SyncLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileID` int(11) NOT NULL,
  `Area` varchar(50) NOT NULL,
  `UpdateYN` int(1) NOT NULL,
  `DeleteYN` int(1) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63806 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_social_site`
--

DROP TABLE IF EXISTS `acc_social_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_social_site` (
  `acc_social_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(150) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`acc_social_site_id`,`account_id`,`website_id`),
  KEY `fk_Acc_social_site_Account1_idx` (`account_id`),
  KEY `fk_Acc_social_site_Social_websites1_idx` (`website_id`),
  CONSTRAINT `fk_Acc_social_site_Social_websites1` FOREIGN KEY (`website_id`) REFERENCES `social_websites` (`website_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emailid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` int(11) DEFAULT NULL,
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `salt` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL,
  `agency_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `profile_no` int(11) NOT NULL,
  `profile_year` varchar(225) CHARACTER SET utf8 NOT NULL,
  `zoho_id` varchar(225) CHARACTER SET utf8 NOT NULL,
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_03_02_2017`
--

DROP TABLE IF EXISTS `account_03_02_2017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_03_02_2017` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emailid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` int(11) DEFAULT NULL,
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `salt` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL,
  `agency_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `profile_no` int(11) NOT NULL,
  `profile_year` varchar(225) CHARACTER SET utf8 NOT NULL,
  `zoho_id` varchar(225) CHARACTER SET utf8 NOT NULL,
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT '1',
  `is_protected` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5352 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_25_5_2016`
--

DROP TABLE IF EXISTS `account_25_5_2016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_25_5_2016` (
  `name` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `profile_no` int(11) NOT NULL,
  `profile_year` varchar(225) NOT NULL,
  `zoho_id` varchar(225) NOT NULL,
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4710 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_june_30`
--

DROP TABLE IF EXISTS `account_june_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_june_30` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emailid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` int(11) DEFAULT NULL,
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `salt` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL,
  `agency_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `profile_no` int(11) NOT NULL,
  `profile_year` varchar(225) CHARACTER SET utf8 NOT NULL,
  `zoho_id` varchar(225) CHARACTER SET utf8 NOT NULL,
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `is_protected` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4798 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption_type`
--

DROP TABLE IF EXISTS `adoption_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_type` (
  `adoption_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `adoption_type` varchar(45) NOT NULL,
  PRIMARY KEY (`adoption_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8942 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption_type_preference_dh_bckup`
--

DROP TABLE IF EXISTS `adoption_type_preference_dh_bckup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_type_preference_dh_bckup` (
  `adoption_type_preference_id` int(5) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `adoption_type_id` int(5) NOT NULL,
  PRIMARY KEY (`adoption_type_preference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8700 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoptiontype_new`
--

DROP TABLE IF EXISTS `adoptiontype_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoptiontype_new` (
  `username` varchar(255) DEFAULT NULL,
  `adoptiontypetext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_group`
--

DROP TABLE IF EXISTS `age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_group` (
  `Age_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `Age_group` varchar(45) NOT NULL,
  PRIMARY KEY (`Age_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8943 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_group_preference_dh_back`
--

DROP TABLE IF EXISTS `age_group_preference_dh_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_group_preference_dh_back` (
  `age_group_preference_id` int(5) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `age_group_id` int(5) NOT NULL,
  PRIMARY KEY (`age_group_preference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8695 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agency_from_badge`
--

DROP TABLE IF EXISTS `agency_from_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_from_badge` (
  `agency` int(11) NOT NULL,
  `agency_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `agency_to_badge`
--

DROP TABLE IF EXISTS `agency_to_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_to_badge` (
  `agency` int(11) NOT NULL,
  `agency_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=2966 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `badge_agency_listing`
--

DROP TABLE IF EXISTS `badge_agency_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_agency_listing` (
  `agency_id` int(11) NOT NULL,
  `listing_type` varchar(20) NOT NULL,
  `listing_order` varchar(10) NOT NULL,
  `last_changed_date` datetime NOT NULL,
  `family_limit` int(11) NOT NULL,
  `infoblock_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `badge_children`
--

DROP TABLE IF EXISTS `badge_children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_children` (
  `badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `Child_child_id` int(11) NOT NULL,
  `agency_id` varchar(45) NOT NULL,
  PRIMARY KEY (`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `badge_profile_views`
--

DROP TABLE IF EXISTS `badge_profile_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_profile_views` (
  `account_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(45) NOT NULL COMMENT 'views-1,inquire-2',
  `contact_name` varchar(45) NOT NULL,
  `contact_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `badge_users`
--

DROP TABLE IF EXISTS `badge_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_users` (
  `badge_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `password_expiry` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `log_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`badge_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bfstatus_new`
--

DROP TABLE IF EXISTS `bfstatus_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bfstatus_new` (
  `username` varchar(255) DEFAULT NULL,
  `BFStatustext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `birthfather_pref`
--

DROP TABLE IF EXISTS `birthfather_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birthfather_pref` (
  `birthfather_pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `birthfather_status_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  PRIMARY KEY (`birthfather_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `bx_avatar_images`
--

DROP TABLE IF EXISTS `bx_avatar_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bx_avatar_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=3059 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `marketing_type` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `author_id` (`author_id`),
  KEY `created` (`created`),
  FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `categories` (`categories`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=85722 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `cf_preference_settings`
--

DROP TABLE IF EXISTS `cf_preference_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_preference_settings` (
  `id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `heading_color` varchar(45) NOT NULL,
  `menu_bg_color` varchar(45) NOT NULL,
  `submenu_bg_color` varchar(10) NOT NULL,
  `menu_hover_color` varchar(45) NOT NULL,
  `menu_text_color` varchar(45) NOT NULL,
  `menu_text_hover_color` varchar(45) NOT NULL,
  `button_color` varchar(45) NOT NULL,
  `button_text_color` varchar(45) NOT NULL,
  `content_text_color` varchar(45) NOT NULL,
  `about_bg_color` varchar(45) NOT NULL,
  `banner_bg_color` varchar(20) NOT NULL,
  `status_banner_bg_color` varchar(10) NOT NULL,
  `details_bg_color` varchar(45) NOT NULL,
  `navbar_color` varchar(45) NOT NULL,
  `mob_heading_color` varchar(45) NOT NULL,
  `mob_menu_color` varchar(45) NOT NULL,
  `mob_menu_hover_color` varchar(45) NOT NULL,
  `mob_menu_text_color` varchar(45) NOT NULL,
  `mob_menu_text_hover_color` varchar(45) NOT NULL,
  `heading_font` varchar(45) NOT NULL,
  `menu_font` varchar(45) NOT NULL,
  `content_font` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `Number_of_childern` int(6) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Accounts_id` int(10) NOT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_agency_special_needs`
--

DROP TABLE IF EXISTS `child_agency_special_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_agency_special_needs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `special_need_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_badge`
--

DROP TABLE IF EXISTS `child_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_badge` (
  `child_badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `show_info_blocks` tinyint(1) DEFAULT NULL,
  `agency_id` int(11) NOT NULL,
  `display_other_children` tinyint(1) DEFAULT NULL,
  `agency_inquiry_form_link` varchar(750) NOT NULL,
  `agency_default_id` varchar(100) NOT NULL,
  PRIMARY KEY (`child_badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_enquiry_log`
--

DROP TABLE IF EXISTS `child_enquiry_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_enquiry_log` (
  `child_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_location`
--

DROP TABLE IF EXISTS `child_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `county_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_photos`
--

DROP TABLE IF EXISTS `child_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `child_id` int(11) NOT NULL,
  PRIMARY KEY (`photo_id`,`child_id`),
  KEY `fk_Child_photos_Child_idx` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_profile`
--

DROP TABLE IF EXISTS `child_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_profile` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `about` longblob,
  `tagline` blob NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `child_type` varchar(25) NOT NULL,
  `is_sibling_group` tinyint(1) DEFAULT NULL,
  `is_shared_list` int(1) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `county` varchar(155) NOT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `inquire_form_link` varchar(750) NOT NULL,
  `documentation_link` varchar(100) NOT NULL,
  `agency_child_id` int(11) NOT NULL,
  `child_agency_id` varchar(20) NOT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_profile_views`
--

DROP TABLE IF EXISTS `child_profile_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_profile_views` (
  `child_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_special_need_category`
--

DROP TABLE IF EXISTS `child_special_need_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_special_need_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `description` tinytext NOT NULL,
  `description_link` varchar(200) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `agency_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_special_needs`
--

DROP TABLE IF EXISTS `child_special_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_special_needs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `special_need_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_status`
--

DROP TABLE IF EXISTS `child_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `child_videos`
--

DROP TABLE IF EXISTS `child_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_videos` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `child_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `childage_new`
--

DROP TABLE IF EXISTS `childage_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childage_new` (
  `username` varchar(255) DEFAULT NULL,
  `childagetext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `childcount`
--

DROP TABLE IF EXISTS `childcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childcount` (
  `ChildCount_id` int(11) NOT NULL AUTO_INCREMENT,
  `ChildCount_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ChildCount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `childdesired`
--

DROP TABLE IF EXISTS `childdesired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childdesired` (
  `ChildDesired_id` int(11) NOT NULL AUTO_INCREMENT,
  `ChildDesired_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ChildDesired_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `childethnicity_new`
--

DROP TABLE IF EXISTS `childethnicity_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childethnicity_new` (
  `username` varchar(255) DEFAULT NULL,
  `childethnicitytext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `childtype`
--

DROP TABLE IF EXISTS `childtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childtype` (
  `ChildType_id` int(11) NOT NULL AUTO_INCREMENT,
  `ChildType_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ChildType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactdetails`
--

DROP TABLE IF EXISTS `contactdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactdetails` (
  `StreetAddress` varchar(200) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` int(10) NOT NULL,
  `Country` int(10) NOT NULL,
  `Region` int(5) NOT NULL,
  `Zip` varchar(20) NOT NULL,
  `mobile_num` varchar(255) NOT NULL DEFAULT '0',
  `home_num` int(15) NOT NULL,
  `office_num` int(15) NOT NULL,
  `fax_num` varchar(50) NOT NULL,
  `DefaultContact` int(5) NOT NULL,
  `AllowDefaultContact` int(5) NOT NULL,
  `Account_id` int(10) NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `dbcsheadinjections`
--

DROP TABLE IF EXISTS `dbcsheadinjections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbcsheadinjections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `injection_text` text NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `education_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education_new`
--

DROP TABLE IF EXISTS `education_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `educationtext` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicity`
--

DROP TABLE IF EXISTS `ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity` (
  `ethnicity_id` int(11) NOT NULL AUTO_INCREMENT,
  `ethnicity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicity_dh_bckup`
--

DROP TABLE IF EXISTS `ethnicity_dh_bckup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity_dh_bckup` (
  `ethnicity_id` int(11) NOT NULL AUTO_INCREMENT,
  `ethnicity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicity_new`
--

DROP TABLE IF EXISTS `ethnicity_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `ethnicitytext` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicity_pref`
--

DROP TABLE IF EXISTS `ethnicity_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity_pref` (
  `ethnicity_pref_id` int(5) NOT NULL AUTO_INCREMENT,
  `ethnicity_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  PRIMARY KEY (`ethnicity_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicity_pref_dh_backup`
--

DROP TABLE IF EXISTS `ethnicity_pref_dh_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity_pref_dh_backup` (
  `ethnicity_pref_id` int(5) NOT NULL AUTO_INCREMENT,
  `ethnicity_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  PRIMARY KEY (`ethnicity_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17097 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faith`
--

DROP TABLE IF EXISTS `faith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faith` (
  `faith_id` int(11) NOT NULL AUTO_INCREMENT,
  `faith` varchar(45) NOT NULL,
  PRIMARY KEY (`faith_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faith_new`
--

DROP TABLE IF EXISTS `faith_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faith_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faithtext` varchar(500) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faith_pref`
--

DROP TABLE IF EXISTS `faith_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faith_pref` (
  `faith_pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `faith_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`faith_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faith_type`
--

DROP TABLE IF EXISTS `faith_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faith_type` (
  `faith_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `faith_id` int(5) NOT NULL,
  PRIMARY KEY (`faith_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2069 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_structure`
--

DROP TABLE IF EXISTS `family_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_structure` (
  `family_structure_id` int(11) NOT NULL AUTO_INCREMENT,
  `family_structure` varchar(100) NOT NULL,
  PRIMARY KEY (`family_structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filestack_photos`
--

DROP TABLE IF EXISTS `filestack_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestack_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloud_filename` varchar(425) NOT NULL,
  `child_photo_id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `cloud_path` varchar(225) NOT NULL,
  `view_type` enum('thumb','webview','original') NOT NULL DEFAULT 'thumb',
  PRIMARY KEY (`id`),
  KEY `child_photos_filestack_photos` (`child_photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foo`
--

DROP TABLE IF EXISTS `foo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo` (
  `abcd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender_preference`
--

DROP TABLE IF EXISTS `gender_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender_preference` (
  `gender_pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(7) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`gender_pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender_preference_id`
--

DROP TABLE IF EXISTS `gender_preference_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender_preference_id` (
  `Gender_preference_id` int(5) NOT NULL,
  `Gender_id` int(5) NOT NULL,
  `Gender_preference_idcol` varchar(45) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habits`
--

DROP TABLE IF EXISTS `habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habits` (
  `Smoking` int(4) NOT NULL,
  `Alcohol` int(4) NOT NULL,
  `Drug` int(4) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home` (
  `home_id` int(5) NOT NULL AUTO_INCREMENT,
  `style` varchar(45) NOT NULL,
  `Neighborhood` varchar(45) NOT NULL,
  `pets` varchar(45) NOT NULL,
  `Accounts_id` int(5) NOT NULL,
  `relationship_status_id` int(5) NOT NULL,
  `family_structure_id` int(5) NOT NULL,
  PRIMARY KEY (`home_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info_block`
--

DROP TABLE IF EXISTS `info_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_block` (
  `info_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) NOT NULL,
  `info` varchar(500) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'active',
  `color_code` varchar(45) NOT NULL,
  `font_size` varchar(45) NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `info_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '1-> Text, 2-> Image',
  PRIMARY KEY (`info_block_id`,`badge_id`),
  KEY `fk_Info_blocks_badge1_idx` (`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info_block_color`
--

DROP TABLE IF EXISTS `info_block_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_block_color` (
  `child_badge_id` int(11) NOT NULL,
  `color_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`child_badge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info_pfblock`
--

DROP TABLE IF EXISTS `info_pfblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_pfblock` (
  `info_id` int(11) NOT NULL,
  `info` varchar(500) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `color_code` varchar(45) NOT NULL,
  `font_size` varchar(45) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kids_in_family`
--

DROP TABLE IF EXISTS `kids_in_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kids_in_family` (
  `kids_id` int(5) NOT NULL,
  `no_of_kids` int(11) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `PID` int(10) DEFAULT NULL,
  `PLabel` varchar(20) NOT NULL,
  `isIntroduction` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter(only_sorted)`
--

DROP TABLE IF EXISTS `letter(only_sorted)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter(only_sorted)` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `isDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter',
  `slug` varchar(250) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter_25_5_2016`
--

DROP TABLE IF EXISTS `letter_25_5_2016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter_25_5_2016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `isDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter',
  `slug` varchar(250) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter_bk_020217`
--

DROP TABLE IF EXISTS `letter_bk_020217`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter_bk_020217` (
  `id` int(11) NOT NULL DEFAULT '0',
  `label` varchar(300) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `account_id` int(11) NOT NULL,
  `img` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `isDefault` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter',
  `slug` varchar(250) CHARACTER SET utf8 NOT NULL,
  `sort_order` int(11) NOT NULL,
  `PID` int(10) DEFAULT NULL,
  `PLabel` varchar(20) CHARACTER SET utf8 NOT NULL,
  `isIntroduction` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `neighborhood`
--

DROP TABLE IF EXISTS `neighborhood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighborhood` (
  `Neighborhood_id` int(11) NOT NULL AUTO_INCREMENT,
  `Neighborhood_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Neighborhood_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=3185 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet` (
  `Pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pet_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `places_photos`
--

DROP TABLE IF EXISTS `places_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_photos` (
  `pl_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pl_img_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `publish_status` int(10) NOT NULL DEFAULT '1',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dob` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `waiting_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `faith_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8282 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_bk_030217`
--

DROP TABLE IF EXISTS `profiles_bk_030217`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_bk_030217` (
  `publish_status` int(10) NOT NULL DEFAULT '1',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dob` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `account_id` int(11) DEFAULT NULL,
  `waiting_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `faith_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_draft`
--

DROP TABLE IF EXISTS `profiles_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_draft` (
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
-- Table structure for table `profiles_draft_prev`
--

DROP TABLE IF EXISTS `profiles_draft_prev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_draft_prev` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_prev`
--

DROP TABLE IF EXISTS `profiles_prev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_prev` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `rayboardboards`
--

DROP TABLE IF EXISTS `rayboardboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayboardboards` (
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
-- Table structure for table `rayboardcurrentusers`
--

DROP TABLE IF EXISTS `rayboardcurrentusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayboardcurrentusers` (
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
-- Table structure for table `rayboardusers`
--

DROP TABLE IF EXISTS `rayboardusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayboardusers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Board` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raychatcurrentusers`
--

DROP TABLE IF EXISTS `raychatcurrentusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatcurrentusers` (
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
-- Table structure for table `raychatmemberships`
--

DROP TABLE IF EXISTS `raychatmemberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatmemberships` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Setting` int(11) NOT NULL DEFAULT '0',
  `Value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Membership` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raychatmembershipssettings`
--

DROP TABLE IF EXISTS `raychatmembershipssettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatmembershipssettings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Type` enum('boolean','number','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'boolean',
  `Default` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Range` int(3) NOT NULL DEFAULT '3',
  `Error` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raychatmessages`
--

DROP TABLE IF EXISTS `raychatmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatmessages` (
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
-- Table structure for table `raychatprofiles`
--

DROP TABLE IF EXISTS `raychatprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatprofiles` (
  `ID` varchar(20) NOT NULL DEFAULT '0',
  `Banned` enum('true','false') NOT NULL DEFAULT 'false',
  `Type` varchar(10) NOT NULL DEFAULT 'full',
  `Smileset` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raychatrooms`
--

DROP TABLE IF EXISTS `raychatrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatrooms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `OwnerID` varchar(20) NOT NULL DEFAULT '0',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raychatroomsusers`
--

DROP TABLE IF EXISTS `raychatroomsusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raychatroomsusers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Room` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayimcontacts`
--

DROP TABLE IF EXISTS `rayimcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayimcontacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Online` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'online',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayimmessages`
--

DROP TABLE IF EXISTS `rayimmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayimmessages` (
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
-- Table structure for table `rayimpendings`
--

DROP TABLE IF EXISTS `rayimpendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayimpendings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecipientID` (`RecipientID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayimprofiles`
--

DROP TABLE IF EXISTS `rayimprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayimprofiles` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Smileset` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raymp3files`
--

DROP TABLE IF EXISTS `raymp3files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raymp3files` (
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
-- Table structure for table `raymp3tokens`
--

DROP TABLE IF EXISTS `raymp3tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raymp3tokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayshoutboxmessages`
--

DROP TABLE IF EXISTS `rayshoutboxmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayshoutboxmessages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(20) NOT NULL DEFAULT '0',
  `Msg` text NOT NULL,
  `When` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayvideo_commentsfiles`
--

DROP TABLE IF EXISTS `rayvideo_commentsfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayvideo_commentsfiles` (
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
-- Table structure for table `rayvideo_commentstokens`
--

DROP TABLE IF EXISTS `rayvideo_commentstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayvideo_commentstokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayvideofiles`
--

DROP TABLE IF EXISTS `rayvideofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayvideofiles` (
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
) ENGINE=MyISAM AUTO_INCREMENT=1848 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rayvideotokens`
--

DROP TABLE IF EXISTS `rayvideotokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rayvideotokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `RegionId` int(11) NOT NULL AUTO_INCREMENT,
  `Region` varchar(45) NOT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relationship_status`
--

DROP TABLE IF EXISTS `relationship_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_status` (
  `relationship_status_id` int(11) NOT NULL,
  `relationship_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `religion_new`
--

DROP TABLE IF EXISTS `religion_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religion_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `religiontext` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religions` (
  `ReligionId` int(11) NOT NULL AUTO_INCREMENT,
  `Religion` varchar(45) NOT NULL,
  PRIMARY KEY (`ReligionId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `residency`
--

DROP TABLE IF EXISTS `residency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residency` (
  `Residency_id` int(11) NOT NULL AUTO_INCREMENT,
  `Residency_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Residency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_websites`
--

DROP TABLE IF EXISTS `social_websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_websites` (
  `website_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `special_need`
--

DROP TABLE IF EXISTS `special_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_need` (
  `special_need_id` int(11) NOT NULL AUTO_INCREMENT,
  `special_need` varchar(45) NOT NULL,
  PRIMARY KEY (`special_need_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1935 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `sys_acl_levels_members`
--

DROP TABLE IF EXISTS `sys_acl_levels_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members` (
  `account_id` int(11) DEFAULT NULL,
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_acl_levels_members_05_Feb_2017`
--

DROP TABLE IF EXISTS `sys_acl_levels_members_05_Feb_2017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_acl_levels_members_05_Feb_2017` (
  `account_id` int(11) DEFAULT NULL,
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=23232 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_albums_objects`
--

DROP TABLE IF EXISTS `sys_albums_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_albums_objects` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `waiting`
--

DROP TABLE IF EXISTS `waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiting` (
  `waiting_id` int(11) NOT NULL AUTO_INCREMENT,
  `waiting_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`waiting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waiting_new`
--

DROP TABLE IF EXISTS `waiting_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiting_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `waitingtext` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `youtubetoken`
--

DROP TABLE IF EXISTS `youtubetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `youtubetoken` (
  `ID` int(10) NOT NULL,
  `access_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(10) NOT NULL,
  `refresh_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `channelId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-07 13:37:07
