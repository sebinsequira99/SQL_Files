-- phpMyAdmin SQL Dump
-- version 4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2016 at 08:32 AM
-- Server version: 5.6.22
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pfcomm_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE IF NOT EXISTS `Account` (
`account_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` int(10) NOT NULL,
  `role_id` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` int(100) NOT NULL,
  `salt` int(45) NOT NULL,
  `Avatar` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `Profile_no` int(11) NOT NULL,
  `Profile_year` varchar(225) NOT NULL,
  `ZOHO_ID` varchar(225) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`account_id`, `name`, `emailid`, `username`, `status`, `role_id`, `created_at`, `modified_at`, `password`, `salt`, `Avatar`, `agency_id`, `Profile_no`, `Profile_year`, `ZOHO_ID`) VALUES
(1, 'Anish', 'anish@breezegoindia.com', 'anish', 1, 1, '2016-03-29 09:36:14', '0000-00-00 00:00:00', 1234, 1234, 3875, 0, 0, '', ''),
(13, 'dhanya', 'dhanya.p@breezegoindia.com', 'dhanya', 1, 1, '2016-03-29 09:45:27', '0000-00-00 00:00:00', 1234, 1234, 3662, 0, 0, '', ''),
(14, 'rahul', 'p.rahul@breezegoindia.com', 'rahul', 1, 1, '2016-03-29 09:36:35', '0000-00-00 00:00:00', 1234, 1234, 4046, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `adoption_type`
--

CREATE TABLE IF NOT EXISTS `adoption_type` (
  `adoption_type_id` int(5) NOT NULL,
  `adoption_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adoption_type_preference`
--

CREATE TABLE IF NOT EXISTS `adoption_type_preference` (
`adoption_type_preference_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  `adoption_type_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agencyemailsettings`
--

CREATE TABLE IF NOT EXISTS `agencyemailsettings` (
  `AgencyID` int(100) NOT NULL,
  `BlogAdd` int(5) NOT NULL DEFAULT '0',
  `BlogEdit` int(5) NOT NULL DEFAULT '0',
  `BlogDelete` int(5) NOT NULL DEFAULT '0',
  `PhotoUpload` int(5) NOT NULL DEFAULT '0',
  `VideoUpload` int(5) NOT NULL DEFAULT '0',
  `EditProfile` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agency_join_request`
--

CREATE TABLE IF NOT EXISTS `agency_join_request` (
`id` int(11) NOT NULL,
  `agencyName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `agencyEmail` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `agencyState` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fromName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fromEmail` varchar(100) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Age_group`
--

CREATE TABLE IF NOT EXISTS `Age_group` (
`Age_group_id` int(5) NOT NULL,
  `Age_group` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Age_group`
--

INSERT INTO `Age_group` (`Age_group_id`, `Age_group`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `age_group_preference`
--

CREATE TABLE IF NOT EXISTS `age_group_preference` (
`age_group_preference_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL,
  `age_group_id` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `age_group_preference`
--

INSERT INTO `age_group_preference` (`age_group_preference_id`, `account_id`, `age_group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
  `website` varchar(50) NOT NULL,
  `user_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`website`, `user_key`) VALUES
('ctpf01.parentfinder.com', '5a2b25e043ab8147c9027a1b1aba3aad');

-- --------------------------------------------------------

--
-- Table structure for table `aqb_automailer_mails`
--

CREATE TABLE IF NOT EXISTS `aqb_automailer_mails` (
`ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Subject` text COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Filter` text COLLATE utf8_unicode_ci NOT NULL,
  `FilterQuery` text COLLATE utf8_unicode_ci NOT NULL,
  `Schedule` text COLLATE utf8_unicode_ci NOT NULL,
  `Options` text COLLATE utf8_unicode_ci NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_membership_vouchers_codes`
--

CREATE TABLE IF NOT EXISTS `aqb_membership_vouchers_codes` (
`ID` int(11) NOT NULL,
  `PriceID` int(11) NOT NULL,
  `Code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Discount` int(11) NOT NULL,
  `Start` date DEFAULT '0000-00-00',
  `End` date DEFAULT '0000-00-00',
  `SingleUse` tinyint(4) DEFAULT '0',
  `Used` int(11) DEFAULT '0',
  `Threshold` int(11) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_membership_vouchers_transactions`
--

CREATE TABLE IF NOT EXISTS `aqb_membership_vouchers_transactions` (
`ID` int(11) NOT NULL,
  `ProfileID` int(11) NOT NULL,
  `PriceID` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Processed') COLLATE utf8_unicode_ci DEFAULT 'Pending'
) ENGINE=MyISAM AUTO_INCREMENT=637 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_mls_acl_levels`
--

CREATE TABLE IF NOT EXISTS `aqb_mls_acl_levels` (
  `AclID` int(11) NOT NULL,
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pc_members_blocks`
--

CREATE TABLE IF NOT EXISTS `aqb_pc_members_blocks` (
`id` int(11) unsigned NOT NULL,
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
  `val` int(10) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2311 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aqb_pc_members_blocks`
--

INSERT INTO `aqb_pc_members_blocks` (`id`, `content`, `share`, `approved`, `unmovable`, `irremovable`, `uncollapsable`, `collapsed_def`, `title`, `account_id`, `visible_group`, `visible`, `column`, `order`, `type`, `date`, `val`) VALUES
(1, 'Please click <a href=http://www.parentfinder.com/profileflipbook/1068-GregandBecky/1068-GregandBecky.html target= _blank>here</a> to view Greg and Becky''s profile flip book', '1', '1', '0', '0', '0', '0', 'E-book Profile', 1, 3, 'non,memb', 1, 0, 'text', 45454, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pc_profiles_info`
--

CREATE TABLE IF NOT EXISTS `aqb_pc_profiles_info` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `page` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pc_standard_blocks`
--

CREATE TABLE IF NOT EXISTS `aqb_pc_standard_blocks` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `unmovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `irremovable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `uncollapsable` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `visible_group` int(5) unsigned NOT NULL DEFAULT '1',
  `collapsed_def` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_member_menu_visibility`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_member_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_page_blocks_visibility`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_page_blocks_visibility` (
  `PageBlockID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823',
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_profile_fields`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_profile_fields` (
  `FieldID` int(11) NOT NULL,
  `ProfileTypes` int(11) NOT NULL DEFAULT '1073741823'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_profile_types`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_profile_types` (
  `ID` int(4) NOT NULL,
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Obsolete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_search_result_layout`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_search_result_layout` (
`ID` mediumint(9) NOT NULL,
  `ProfileType` int(11) NOT NULL,
  `FieldID` mediumint(9) NOT NULL,
  `row` tinyint(4) NOT NULL DEFAULT '0',
  `col` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_pts_top_menu_visibility`
--

CREATE TABLE IF NOT EXISTS `aqb_pts_top_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `ProfileTypesVisibility` int(11) NOT NULL DEFAULT '1073741823'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_smdf_custom_dependencies`
--

CREATE TABLE IF NOT EXISTS `aqb_smdf_custom_dependencies` (
`ID` int(11) NOT NULL,
  `Field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DependsOn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ValuesList` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UseAjax` tinyint(4) NOT NULL DEFAULT '0',
  `SelfManageable` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aqb_smdf_dependencies`
--

CREATE TABLE IF NOT EXISTS `aqb_smdf_dependencies` (
  `Field` int(11) NOT NULL,
  `DependsOn` int(11) NOT NULL,
  `UseAjax` tinyint(4) NOT NULL DEFAULT '0',
  `SelfManageable` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Birthfather_pref`
--

CREATE TABLE IF NOT EXISTS `Birthfather_pref` (
  `birthfather_pref_id` int(5) NOT NULL,
  `birthfather_status_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Birthfather_status`
--

CREATE TABLE IF NOT EXISTS `Birthfather_status` (
  `Birthfather_status_id` int(5) NOT NULL,
  `Birthfather_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Birthfather_status`
--

INSERT INTO `Birthfather_status` (`Birthfather_status_id`, `Birthfather_status`) VALUES
(1, 'Birth Father Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_comments`
--

CREATE TABLE IF NOT EXISTS `bx_arl_comments` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_comments_track`
--

CREATE TABLE IF NOT EXISTS `bx_arl_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_entries`
--

CREATE TABLE IF NOT EXISTS `bx_arl_entries` (
`id` int(11) unsigned NOT NULL,
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
  `cmts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_arl_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_voting`
--

CREATE TABLE IF NOT EXISTS `bx_arl_voting` (
  `arl_id` bigint(8) NOT NULL DEFAULT '0',
  `arl_rating_count` int(11) NOT NULL DEFAULT '0',
  `arl_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_arl_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_arl_voting_track` (
  `arl_id` bigint(8) NOT NULL DEFAULT '0',
  `arl_ip` varchar(20) DEFAULT NULL,
  `arl_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_avatar_images`
--

CREATE TABLE IF NOT EXISTS `bx_avatar_images` (
`id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4051 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_cmts` (
`cmt_id` int(11) unsigned NOT NULL,
  `cmt_parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_main`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_main` (
`ID` int(11) unsigned NOT NULL,
  `OwnerID` int(11) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_posts`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_posts` (
`PostID` int(11) unsigned NOT NULL,
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
  `allowComment` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2144 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bx_blogs_posts`
--

INSERT INTO `bx_blogs_posts` (`PostID`, `PostCaption`, `PostUri`, `PostText`, `PostDate`, `PostStatus`, `PostPhoto`, `Tags`, `Featured`, `Views`, `Rate`, `RateCount`, `CommentsCount`, `account_id`, `Categories`, `allowView`, `allowRate`, `allowComment`) VALUES
(1, 'test', 'test', 'test', 4521, 'approval', NULL, '', 0, 1, 0, 0, 0, 1, '', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_rating`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_rating` (
  `blogp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_rating_sum` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_views_track` (
  `id` int(11) unsigned NOT NULL,
  `viewer` int(11) unsigned NOT NULL,
  `ip` int(11) unsigned NOT NULL,
  `ts` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_blogs_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_blogs_voting_track` (
  `blogp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `blogp_ip` varchar(20) DEFAULT NULL,
  `blogp_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_crss_main`
--

CREATE TABLE IF NOT EXISTS `bx_crss_main` (
`ID` int(11) unsigned NOT NULL,
  `ProfileID` int(11) unsigned NOT NULL,
  `RSSUrl` varchar(255) NOT NULL,
  `Quantity` int(11) unsigned NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` enum('active','passive') NOT NULL DEFAULT 'passive'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_activity`
--

CREATE TABLE IF NOT EXISTS `bx_events_activity` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `lang_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('add','delete','change','commentPost','rate','join','unjoin','featured','unfeatured','makeAdmin','removeAdmin') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_admins`
--

CREATE TABLE IF NOT EXISTS `bx_events_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_events_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_cmts_track`
--

CREATE TABLE IF NOT EXISTS `bx_events_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_files`
--

CREATE TABLE IF NOT EXISTS `bx_events_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum` (
`forum_id` int(10) unsigned NOT NULL,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_actions_log`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_attachments`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_cat`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_cat` (
`cat_id` int(10) unsigned NOT NULL,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_flag`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_post`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_post` (
`post_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_signatures`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_topic`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_topic` (
`topic_id` int(10) unsigned NOT NULL,
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
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_user`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_user_activity`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_user_stat`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_forum_vote`
--

CREATE TABLE IF NOT EXISTS `bx_events_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_images`
--

CREATE TABLE IF NOT EXISTS `bx_events_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_invite`
--

CREATE TABLE IF NOT EXISTS `bx_events_invite` (
`id` int(10) unsigned NOT NULL,
  `id_entry` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_main`
--

CREATE TABLE IF NOT EXISTS `bx_events_main` (
`ID` int(10) unsigned NOT NULL,
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
  `allow_join_after_start` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_participants`
--

CREATE TABLE IF NOT EXISTS `bx_events_participants` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_rating`
--

CREATE TABLE IF NOT EXISTS `bx_events_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_rating_track`
--

CREATE TABLE IF NOT EXISTS `bx_events_rating_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_sounds`
--

CREATE TABLE IF NOT EXISTS `bx_events_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_videos`
--

CREATE TABLE IF NOT EXISTS `bx_events_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_events_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_events_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_facebook_accounts`
--

CREATE TABLE IF NOT EXISTS `bx_facebook_accounts` (
  `id_profile` int(10) unsigned NOT NULL,
  `fb_profile` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_files_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_cmts_albums`
--

CREATE TABLE IF NOT EXISTS `bx_files_cmts_albums` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_favorites`
--

CREATE TABLE IF NOT EXISTS `bx_files_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_main`
--

CREATE TABLE IF NOT EXISTS `bx_files_main` (
`ID` int(10) unsigned NOT NULL,
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
  `Type` varchar(30) NOT NULL DEFAULT 'text/plain'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_rating`
--

CREATE TABLE IF NOT EXISTS `bx_files_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_types`
--

CREATE TABLE IF NOT EXISTS `bx_files_types` (
`ID` int(10) unsigned NOT NULL,
  `Type` varchar(64) NOT NULL,
  `Icon` varchar(20) NOT NULL DEFAULT 'default.png'
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_files_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_files_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_files_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum`
--

CREATE TABLE IF NOT EXISTS `bx_forum` (
`forum_id` int(10) unsigned NOT NULL,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_actions_log`
--

CREATE TABLE IF NOT EXISTS `bx_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_attachments`
--

CREATE TABLE IF NOT EXISTS `bx_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_cat`
--

CREATE TABLE IF NOT EXISTS `bx_forum_cat` (
`cat_id` int(10) unsigned NOT NULL,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_flag`
--

CREATE TABLE IF NOT EXISTS `bx_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_post`
--

CREATE TABLE IF NOT EXISTS `bx_forum_post` (
`post_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=521 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_signatures`
--

CREATE TABLE IF NOT EXISTS `bx_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_topic`
--

CREATE TABLE IF NOT EXISTS `bx_forum_topic` (
`topic_id` int(10) unsigned NOT NULL,
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
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_user`
--

CREATE TABLE IF NOT EXISTS `bx_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_user_activity`
--

CREATE TABLE IF NOT EXISTS `bx_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_user_stat`
--

CREATE TABLE IF NOT EXISTS `bx_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_forum_vote`
--

CREATE TABLE IF NOT EXISTS `bx_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_admins`
--

CREATE TABLE IF NOT EXISTS `bx_groups_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_groups_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_cmts_track`
--

CREATE TABLE IF NOT EXISTS `bx_groups_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_codes`
--

CREATE TABLE IF NOT EXISTS `bx_groups_codes` (
  `id_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_fans`
--

CREATE TABLE IF NOT EXISTS `bx_groups_fans` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_fans_backup`
--

CREATE TABLE IF NOT EXISTS `bx_groups_fans_backup` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_files`
--

CREATE TABLE IF NOT EXISTS `bx_groups_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum` (
`forum_id` int(10) unsigned NOT NULL,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_actions_log`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_attachments`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_cat`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_cat` (
`cat_id` int(10) unsigned NOT NULL,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_flag`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_post`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_post` (
`post_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_signatures`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_topic`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_topic` (
`topic_id` int(10) unsigned NOT NULL,
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
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_user`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_user_activity`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_user_stat`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_forum_vote`
--

CREATE TABLE IF NOT EXISTS `bx_groups_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_images`
--

CREATE TABLE IF NOT EXISTS `bx_groups_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_main`
--

CREATE TABLE IF NOT EXISTS `bx_groups_main` (
`id` int(10) unsigned NOT NULL,
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
  `Unpublish_Password` varchar(40) NOT NULL DEFAULT 'abc123'
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_main_backup`
--

CREATE TABLE IF NOT EXISTS `bx_groups_main_backup` (
`id` int(10) unsigned NOT NULL,
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
  `allow_upload_files_to` varchar(16) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_moderation`
--

CREATE TABLE IF NOT EXISTS `bx_groups_moderation` (
  `GroupId` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `ApproveStatus` enum('on','off') NOT NULL DEFAULT 'on'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_rating`
--

CREATE TABLE IF NOT EXISTS `bx_groups_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_rating_track`
--

CREATE TABLE IF NOT EXISTS `bx_groups_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_sounds`
--

CREATE TABLE IF NOT EXISTS `bx_groups_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_videos`
--

CREATE TABLE IF NOT EXISTS `bx_groups_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_groups_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_groups_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_comments`
--

CREATE TABLE IF NOT EXISTS `bx_news_comments` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_comments_track`
--

CREATE TABLE IF NOT EXISTS `bx_news_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_entries`
--

CREATE TABLE IF NOT EXISTS `bx_news_entries` (
`id` int(11) unsigned NOT NULL,
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
  `cmts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_news_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_voting`
--

CREATE TABLE IF NOT EXISTS `bx_news_voting` (
  `news_id` bigint(8) NOT NULL DEFAULT '0',
  `news_rating_count` int(11) NOT NULL DEFAULT '0',
  `news_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_news_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_news_voting_track` (
  `news_id` bigint(8) NOT NULL DEFAULT '0',
  `news_ip` varchar(20) DEFAULT NULL,
  `news_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pageac_member_menu_visibility`
--

CREATE TABLE IF NOT EXISTS `bx_pageac_member_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `MemLevels` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pageac_page_blocks_visibility`
--

CREATE TABLE IF NOT EXISTS `bx_pageac_page_blocks_visibility` (
  `PageBlockID` int(11) NOT NULL,
  `MemLevels` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pageac_rules`
--

CREATE TABLE IF NOT EXISTS `bx_pageac_rules` (
`ID` int(11) NOT NULL,
  `Rule` text NOT NULL,
  `MemLevels` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pageac_top_menu_visibility`
--

CREATE TABLE IF NOT EXISTS `bx_pageac_top_menu_visibility` (
  `MenuItemID` int(11) NOT NULL,
  `MemLevels` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_photos_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=990 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_cmts_albums`
--

CREATE TABLE IF NOT EXISTS `bx_photos_cmts_albums` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_favorites`
--

CREATE TABLE IF NOT EXISTS `bx_photos_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_main`
--

CREATE TABLE IF NOT EXISTS `bx_photos_main` (
`ID` int(10) unsigned NOT NULL,
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
  `Hash` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=56283 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bx_photos_main`
--

INSERT INTO `bx_photos_main` (`ID`, `Categories`, `account_id`, `Ext`, `Size`, `Title`, `Uri`, `Desc`, `Tags`, `Date`, `Views`, `Rate`, `RateCount`, `CommentsCount`, `Featured`, `Status`, `Hash`) VALUES
(1, 'Home Pictures', 1, 'jpg', '300*300', 'Hands Across the Water', 'Hands-Across-the-Water', 'Hands Across the Water', 'groups', 1290005946, 10, 0, 0, 0, 0, 'approved', '1880770f8815b500f9e5930a7e156423');

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_main_newdb`
--

CREATE TABLE IF NOT EXISTS `bx_photos_main_newdb` (
`ID` int(10) unsigned NOT NULL,
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
  `Hash` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=47168 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_main_olddb_backup`
--

CREATE TABLE IF NOT EXISTS `bx_photos_main_olddb_backup` (
`ID` int(10) unsigned NOT NULL,
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
  `Hash` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=46897 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_rating`
--

CREATE TABLE IF NOT EXISTS `bx_photos_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_photos_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_photos_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_photos_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_cart`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_cart` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `items` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_modules`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_modules` (
`id` int(11) NOT NULL,
  `uri` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_providers`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_providers` (
`id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `caption` varchar(128) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `option_prefix` varchar(32) NOT NULL DEFAULT '',
  `class_name` varchar(128) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_providers_options`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_providers_options` (
`id` int(11) NOT NULL,
  `provider_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT 'text',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `extra` varchar(255) NOT NULL DEFAULT '',
  `check_type` varchar(64) NOT NULL DEFAULT '',
  `check_params` varchar(128) NOT NULL DEFAULT '',
  `check_error` varchar(128) NOT NULL DEFAULT '',
  `order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_transactions`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_transactions` (
`id` int(11) NOT NULL,
  `pending_id` int(11) NOT NULL DEFAULT '0',
  `order_id` varchar(16) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_count` int(11) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `reported` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2257 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_transactions_pending`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_transactions_pending` (
`id` int(10) unsigned NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `items` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `order` varchar(32) NOT NULL DEFAULT '',
  `error_code` varchar(16) NOT NULL DEFAULT '',
  `error_msg` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(16) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `reported` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2675 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_pmt_user_values`
--

CREATE TABLE IF NOT EXISTS `bx_pmt_user_values` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_profile_custom_images`
--

CREATE TABLE IF NOT EXISTS `bx_profile_custom_images` (
`id` int(10) unsigned NOT NULL,
  `ext` varchar(4) NOT NULL,
  `count` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=984 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_profile_custom_main`
--

CREATE TABLE IF NOT EXISTS `bx_profile_custom_main` (
`user_id` int(10) unsigned NOT NULL,
  `css` text NOT NULL,
  `tmp` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6880 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_profile_custom_themes`
--

CREATE TABLE IF NOT EXISTS `bx_profile_custom_themes` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `ownerid` int(10) NOT NULL,
  `css` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_profile_custom_units`
--

CREATE TABLE IF NOT EXISTS `bx_profile_custom_units` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `css_name` varchar(500) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_simple_messenger_messages`
--

CREATE TABLE IF NOT EXISTS `bx_simple_messenger_messages` (
`ID` int(10) unsigned NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `SenderID` int(11) NOT NULL,
  `RecipientID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SenderStatus` enum('active','close') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `RecipientStatus` enum('active','close') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_simple_messenger_privacy`
--

CREATE TABLE IF NOT EXISTS `bx_simple_messenger_privacy` (
  `author_id` int(11) NOT NULL,
  `allow_contact_to` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_sites_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_cmts_track`
--

CREATE TABLE IF NOT EXISTS `bx_sites_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_main`
--

CREATE TABLE IF NOT EXISTS `bx_sites_main` (
`id` int(10) unsigned NOT NULL,
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
  `featured` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_rating`
--

CREATE TABLE IF NOT EXISTS `bx_sites_rating` (
  `sites_id` smallint(6) NOT NULL DEFAULT '0',
  `sites_rating_count` int(11) NOT NULL DEFAULT '0',
  `sites_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_rating_track`
--

CREATE TABLE IF NOT EXISTS `bx_sites_rating_track` (
  `sites_id` smallint(6) NOT NULL DEFAULT '0',
  `sites_ip` varchar(20) DEFAULT NULL,
  `sites_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_stwacc_info`
--

CREATE TABLE IF NOT EXISTS `bx_sites_stwacc_info` (
`id` int(10) NOT NULL,
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
  `timestamp` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_stw_requests`
--

CREATE TABLE IF NOT EXISTS `bx_sites_stw_requests` (
`siteid` int(10) NOT NULL,
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
  `referrer` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sites_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_sites_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_cmts_albums`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_cmts_albums` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_favorites`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_rating`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_sounds_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_sounds_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_spy_data`
--

CREATE TABLE IF NOT EXISTS `bx_spy_data` (
`id` int(10) unsigned NOT NULL,
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
  `viewed` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=909 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_spy_friends_data`
--

CREATE TABLE IF NOT EXISTS `bx_spy_friends_data` (
`id` int(10) unsigned NOT NULL,
  `sender_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_spy_handlers`
--

CREATE TABLE IF NOT EXISTS `bx_spy_handlers` (
`id` int(11) NOT NULL,
  `alert_unit` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_uri` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_class` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_method` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_store_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_cmts_track`
--

CREATE TABLE IF NOT EXISTS `bx_store_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_customers`
--

CREATE TABLE IF NOT EXISTS `bx_store_customers` (
  `file_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `order_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum` (
`forum_id` int(10) unsigned NOT NULL,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_actions_log`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_attachments`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_cat`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_cat` (
`cat_id` int(10) unsigned NOT NULL,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_flag`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_post`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_post` (
`post_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_signatures`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_topic`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_topic` (
`topic_id` int(10) unsigned NOT NULL,
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
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_user`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_user_activity`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_user_stat`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_forum_vote`
--

CREATE TABLE IF NOT EXISTS `bx_store_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_products`
--

CREATE TABLE IF NOT EXISTS `bx_store_products` (
`id` int(10) unsigned NOT NULL,
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
  `allow_post_in_forum_to` varchar(16) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_product_files`
--

CREATE TABLE IF NOT EXISTS `bx_store_product_files` (
`id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  `allow_purchase_to` varchar(16) NOT NULL,
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_product_images`
--

CREATE TABLE IF NOT EXISTS `bx_store_product_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_product_videos`
--

CREATE TABLE IF NOT EXISTS `bx_store_product_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_rating`
--

CREATE TABLE IF NOT EXISTS `bx_store_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_rating_track`
--

CREATE TABLE IF NOT EXISTS `bx_store_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_store_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_store_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_cmts`
--

CREATE TABLE IF NOT EXISTS `bx_videos_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_cmts_albums`
--

CREATE TABLE IF NOT EXISTS `bx_videos_cmts_albums` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_favorites`
--

CREATE TABLE IF NOT EXISTS `bx_videos_favorites` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_rating`
--

CREATE TABLE IF NOT EXISTS `bx_videos_rating` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_views_track`
--

CREATE TABLE IF NOT EXISTS `bx_videos_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_videos_voting_track`
--

CREATE TABLE IF NOT EXISTS `bx_videos_voting_track` (
  `gal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bx_wall_comments`
--

CREATE TABLE IF NOT EXISTS `bx_wall_comments` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text COLLATE utf8_unicode_ci NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_wall_comments_track`
--

CREATE TABLE IF NOT EXISTS `bx_wall_comments_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_wall_events`
--

CREATE TABLE IF NOT EXISTS `bx_wall_events` (
`id` bigint(8) NOT NULL,
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=897 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bx_wall_handlers`
--

CREATE TABLE IF NOT EXISTS `bx_wall_handlers` (
`id` int(11) NOT NULL,
  `alert_unit` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_action` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_uri` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_class` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_method` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `groupable` tinyint(1) NOT NULL DEFAULT '0',
  `group_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeline` tinyint(1) NOT NULL DEFAULT '1',
  `outline` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE IF NOT EXISTS `cart_list` (
`cart_id` int(111) NOT NULL,
  `description` longtext NOT NULL,
  `itemname` varchar(245) NOT NULL,
  `cart_url` longtext NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_list_items`
--

CREATE TABLE IF NOT EXISTS `cart_list_items` (
`item_id` int(111) NOT NULL,
  `item_cartid` int(111) NOT NULL,
  `item_quantity` int(111) NOT NULL,
  `item_userid` int(111) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_list_recipte`
--

CREATE TABLE IF NOT EXISTS `cart_list_recipte` (
`receipt_id` int(111) NOT NULL,
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
  `currency` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE IF NOT EXISTS `child` (
  `child_id` int(10) NOT NULL,
  `Number_of_childern` int(6) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Accounts_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`child_id`, `Number_of_childern`, `Type`, `Accounts_id`) VALUES
(1, 1, 'child', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ContactDetails`
--

CREATE TABLE IF NOT EXISTS `ContactDetails` (
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

--
-- Dumping data for table `ContactDetails`
--

INSERT INTO `ContactDetails` (`StreetAddress`, `City`, `State`, `Country`, `Region`, `Zip`, `mobile_num`, `home_num`, `office_num`, `fax_num`, `DefaultContact`, `AllowDefaultContact`, `Account_id`, `website`) VALUES
('7101 Redbud Dr,,Manhattan-66503', 'Seminole', 1, 5, 1, 972021, 123456789, 123456789, 123456789, 123456789, 12345, 1, 1, 'www.adoptionassociates.net');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`country_id` int(5) NOT NULL,
  `country` varchar(45) NOT NULL,
  `country_code` varchar(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coverphotos`
--

CREATE TABLE IF NOT EXISTS `coverphotos` (
`id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ctz_our_letters`
--

CREATE TABLE IF NOT EXISTS `ctz_our_letters` (
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `when` int(10) NOT NULL DEFAULT '0',
  `caption` varchar(128) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbcsHeadInjections`
--

CREATE TABLE IF NOT EXISTS `dbcsHeadInjections` (
`id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `injection_text` text NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbcs_ip_address`
--

CREATE TABLE IF NOT EXISTS `dbcs_ip_address` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `nick_name` varchar(255) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `ip_long` bigint(20) NOT NULL,
  `time_stamp` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dol_subs_payments`
--

CREATE TABLE IF NOT EXISTS `dol_subs_payments` (
`id` int(11) NOT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `auth_code` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dol_subs_settings`
--

CREATE TABLE IF NOT EXISTS `dol_subs_settings` (
`ID` int(11) NOT NULL,
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
  `default_memID` int(5) NOT NULL DEFAULT '2'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Ethnicity`
--

CREATE TABLE IF NOT EXISTS `Ethnicity` (
  `ethnicity_id` int(11) NOT NULL,
  `ethnicity` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ethnicity`
--

INSERT INTO `Ethnicity` (`ethnicity_id`, `ethnicity`) VALUES
(1, 'Caucasian');

-- --------------------------------------------------------

--
-- Table structure for table `Ethnicity_pref`
--

CREATE TABLE IF NOT EXISTS `Ethnicity_pref` (
`ethnicity_pref_id` int(5) NOT NULL,
  `ethnicity_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ethnicity_pref`
--

INSERT INTO `Ethnicity_pref` (`ethnicity_pref_id`, `ethnicity_id`, `account_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faith`
--

CREATE TABLE IF NOT EXISTS `faith` (
  `faith_id` int(5) NOT NULL,
  `faith` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faith`
--

INSERT INTO `faith` (`faith_id`, `faith`) VALUES
(4, 'Christian');

-- --------------------------------------------------------

--
-- Table structure for table `family_favourite`
--

CREATE TABLE IF NOT EXISTS `family_favourite` (
`ID` int(11) NOT NULL,
  `favouredby` int(11) NOT NULL,
  `favouredfamily` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Family_structure`
--

CREATE TABLE IF NOT EXISTS `Family_structure` (
  `family_structure_id` int(5) NOT NULL,
  `family_structure` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Gender_preference_id`
--

CREATE TABLE IF NOT EXISTS `Gender_preference_id` (
  `Gender_preference_id` int(5) NOT NULL,
  `Gender_id` int(5) NOT NULL,
  `Gender_preference_idcol` varchar(45) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Habits`
--

CREATE TABLE IF NOT EXISTS `Habits` (
  `Smoking` int(4) NOT NULL,
  `Alcohol` int(4) NOT NULL,
  `Drug` int(4) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_affiliates`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_affiliates` (
`id` int(11) NOT NULL,
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
  `campaigns` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_banners`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_banners` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `hidden` varchar(100) NOT NULL,
  `campaign_id` varchar(100) NOT NULL,
  `target_url` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `text_title` varchar(100) NOT NULL,
  `text_details` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_campaigns`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_campaigns` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(55) NOT NULL,
  `click_commission` varchar(55) NOT NULL,
  `click_amount` varchar(55) NOT NULL,
  `join_commission` varchar(55) NOT NULL,
  `join_amount` varchar(55) NOT NULL,
  `membership_commission` varchar(55) NOT NULL,
  `membership_amount` varchar(55) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_clicks`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_clicks` (
`id` int(11) NOT NULL,
  `campaign_id` varchar(255) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `raw` varchar(255) NOT NULL,
  `unique` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_commissions`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_commissions` (
`id` int(11) NOT NULL,
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
  `ip` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_impressions`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_impressions` (
`id` int(11) NOT NULL,
  `campaign_id` varchar(255) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `raw` varchar(255) NOT NULL,
  `unique` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_invoices`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_invoices` (
`id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency_sign` varchar(255) NOT NULL,
  `invoicetext` varchar(255) NOT NULL,
  `datepaid` varchar(255) NOT NULL,
  `method` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_payouts`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_payouts` (
`id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency_sign` varchar(255) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `datepaid` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hm_aff_pro_settings`
--

CREATE TABLE IF NOT EXISTS `hm_aff_pro_settings` (
`id` int(11) NOT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `auth_code` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Home`
--

CREATE TABLE IF NOT EXISTS `Home` (
  `home_id` int(5) NOT NULL,
  `style` varchar(45) NOT NULL,
  `Neighborhood` varchar(45) NOT NULL,
  `pets` varchar(45) NOT NULL,
  `Accounts_id` int(5) NOT NULL,
  `relationship_status_id` int(5) NOT NULL,
  `family_structure_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `letter`
--

CREATE TABLE IF NOT EXISTS `letter` (
`id` int(11) NOT NULL,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `isDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1-default letter,0-custom letter'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `letter`
--

INSERT INTO `letter` (`id`, `label`, `description`, `account_id`, `img`, `isDefault`) VALUES
(1, 'test', 'test', 1, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `letters_default`
--

CREATE TABLE IF NOT EXISTS `letters_default` (
  `default_id` int(11) NOT NULL,
  `default_letter` varchar(200) NOT NULL,
  `default_letter_label` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `letters_default`
--

INSERT INTO `letters_default` (`default_id`, `default_letter`, `default_letter_label`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `letters_sort`
--

CREATE TABLE IF NOT EXISTS `letters_sort` (
`id` int(11) NOT NULL,
  `letter_id` int(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `letters_sort`
--

INSERT INTO `letters_sort` (`id`, `letter_id`, `order_by`, `account_id`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `letters_sort_newdb`
--

CREATE TABLE IF NOT EXISTS `letters_sort_newdb` (
`id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `letter_caption`
--

CREATE TABLE IF NOT EXISTS `letter_caption` (
`Caption_ID` int(5) NOT NULL,
  `Caption_Name` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `letter_newdb`
--

CREATE TABLE IF NOT EXISTS `letter_newdb` (
`id` int(11) NOT NULL,
  `label` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `profile_id` int(11) NOT NULL,
  `img` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like_list`
--

CREATE TABLE IF NOT EXISTS `like_list` (
`id` int(10) NOT NULL,
  `LikedBy` int(10) NOT NULL,
  `AgencyLike` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like_list_family`
--

CREATE TABLE IF NOT EXISTS `like_list_family` (
`ID` int(10) NOT NULL,
  `LikedBy` int(10) NOT NULL,
  `FamilyLiked` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matchdependency`
--

CREATE TABLE IF NOT EXISTS `matchdependency` (
`id` int(11) NOT NULL,
  `matchfieldid` int(11) DEFAULT NULL,
  `usercolumn` varchar(255) DEFAULT NULL,
  `preferencecolumn` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matchfileds`
--

CREATE TABLE IF NOT EXISTS `matchfileds` (
`id` int(10) unsigned NOT NULL,
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
  `dependency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_admins`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_cmts`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_cmts_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_files`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_images`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_main`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_main` (
`id` int(10) unsigned NOT NULL,
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
  `votes` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_ratehelp`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_ratehelp` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_rating`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_rating_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_sounds`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_videos`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_faq_views_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_faq_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_admins`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_admins` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_categ`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_categ` (
`id` int(10) unsigned NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2156 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_cities`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_cities` (
  `country` varchar(2) NOT NULL,
  `city` varchar(255) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `failed` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_claim`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_claim` (
`ID` int(10) unsigned NOT NULL,
  `listing_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `claim_date` int(11) NOT NULL DEFAULT '0',
  `assign_date` int(11) NOT NULL DEFAULT '0',
  `processed` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_cmts`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(12) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_cmts_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_countries`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_countries` (
  `country` varchar(2) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `failed` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_fans`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_fans` (
  `id_entry` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `confirmed` tinyint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_featured_orders`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_featured_orders` (
`id` int(11) unsigned NOT NULL,
  `price` float unsigned NOT NULL,
  `days` int(11) unsigned NOT NULL,
  `item_id` int(11) unsigned NOT NULL,
  `buyer_id` int(11) unsigned NOT NULL,
  `trans_id` varchar(100) NOT NULL,
  `trans_type` varchar(100) NOT NULL,
  `created` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_files`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_files` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum` (
`forum_id` int(10) unsigned NOT NULL,
  `forum_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) DEFAULT NULL,
  `forum_desc` varchar(255) NOT NULL DEFAULT '',
  `forum_posts` int(11) NOT NULL DEFAULT '0',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last` int(11) NOT NULL DEFAULT '0',
  `forum_type` enum('public','private') NOT NULL DEFAULT 'public',
  `forum_order` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_actions_log`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_actions_log` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `action_name` varchar(32) NOT NULL DEFAULT '',
  `action_when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_attachments`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_attachments` (
  `att_hash` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `att_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `att_when` int(11) NOT NULL,
  `att_size` int(11) NOT NULL,
  `att_downloads` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_cat`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_cat` (
`cat_id` int(10) unsigned NOT NULL,
  `cat_uri` varchar(255) NOT NULL DEFAULT '',
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_icon` varchar(32) NOT NULL DEFAULT '',
  `cat_order` float NOT NULL DEFAULT '0',
  `cat_expanded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_flag`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_flag` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_post`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_post` (
`post_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(32) NOT NULL DEFAULT '0',
  `post_text` mediumtext NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `reports` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_signatures`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_signatures` (
  `user` varchar(32) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `when` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_topic`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_topic` (
`topic_id` int(10) unsigned NOT NULL,
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
  `topic_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_user`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_user` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_join_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_user_activity`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_user_activity` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `act_current` int(11) NOT NULL DEFAULT '0',
  `act_last` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_user_stat`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_user_stat` (
  `user` varchar(32) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `user_last_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_forum_vote`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_forum_vote` (
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `vote_when` int(11) NOT NULL DEFAULT '0',
  `vote_point` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_images`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_images` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_invoices`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_invoices` (
`id` int(11) unsigned NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `days` int(11) unsigned NOT NULL,
  `listing_id` int(11) unsigned NOT NULL,
  `package_id` int(11) unsigned NOT NULL,
  `invoice_status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `invoice_due_date` int(11) NOT NULL,
  `invoice_expiry_date` int(11) NOT NULL,
  `invoice_date` int(11) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_main`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_main` (
`id` int(10) unsigned NOT NULL,
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
  `video_embed` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_orders`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_orders` (
`id` int(11) unsigned NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `buyer_id` int(11) unsigned NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_status` enum('approved','pending') NOT NULL DEFAULT 'approved',
  `order_date` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_packages`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_packages` (
`id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `days` int(11) NOT NULL,
  `description` text NOT NULL,
  `videos` int(11) NOT NULL DEFAULT '0',
  `photos` int(11) NOT NULL DEFAULT '0',
  `sounds` int(11) NOT NULL DEFAULT '0',
  `files` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','pending') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_profiles`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_profiles` (
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
  `failed` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_rating`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_rating` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_rating_count` int(11) NOT NULL DEFAULT '0',
  `gal_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_rating_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_rating_track` (
  `gal_id` smallint(6) NOT NULL DEFAULT '0',
  `gal_ip` varchar(20) DEFAULT NULL,
  `gal_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_sounds`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_sounds` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_videos`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_videos` (
  `entry_id` int(10) unsigned NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modzzz_listing_views_track`
--

CREATE TABLE IF NOT EXISTS `modzzz_listing_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pdfdetails`
--

CREATE TABLE IF NOT EXISTS `pdfdetails` (
`id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdfname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2444 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdf_template_agency`
--

CREATE TABLE IF NOT EXISTS `pdf_template_agency` (
`template_agency_id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pdf_template_data`
--

CREATE TABLE IF NOT EXISTS `pdf_template_data` (
`template_data_id` int(11) NOT NULL,
  `template_user_id` varchar(255) DEFAULT NULL,
  `cover_title` text,
  `cover_picture` varchar(255) DEFAULT NULL,
  `block_ids` text,
  `photo_title` text,
  `photo_ids` text,
  `photo_description` text
) ENGINE=MyISAM AUTO_INCREMENT=1096 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pdf_template_master`
--

CREATE TABLE IF NOT EXISTS `pdf_template_master` (
`template_id` int(11) NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `template_description` varchar(255) DEFAULT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `isDeleted` char(1) DEFAULT NULL,
  `template_disbale_status` char(1) DEFAULT NULL,
  `printMode` varchar(55) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pdf_template_user`
--

CREATE TABLE IF NOT EXISTS `pdf_template_user` (
`template_user_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `template_file_path` varchar(255) DEFAULT NULL,
  `template_description` varchar(255) DEFAULT NULL,
  `isDeleted` char(1) DEFAULT NULL,
  `isDefault` char(1) DEFAULT NULL,
  `lastupdateddate` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2326 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `places_cmts`
--

CREATE TABLE IF NOT EXISTS `places_cmts` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `places_cmts_track`
--

CREATE TABLE IF NOT EXISTS `places_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `places_config`
--

CREATE TABLE IF NOT EXISTS `places_config` (
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cat` int(11) NOT NULL DEFAULT '0',
  `type` enum('text','select','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_drawings`
--

CREATE TABLE IF NOT EXISTS `places_drawings` (
  `pl_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_kml_files`
--

CREATE TABLE IF NOT EXISTS `places_kml_files` (
`pl_kml_id` int(11) NOT NULL,
  `pl_id` int(11) NOT NULL,
  `pl_kml_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pl_kml_file_ext` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `pl_kml_added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_locations`
--

CREATE TABLE IF NOT EXISTS `places_locations` (
  `gmk_id` int(11) NOT NULL DEFAULT '0',
  `gmk_lat` float NOT NULL DEFAULT '0',
  `gmk_lng` float NOT NULL DEFAULT '0',
  `gmk_zoom` float NOT NULL DEFAULT '0',
  `gmk_type` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_photos`
--

CREATE TABLE IF NOT EXISTS `places_photos` (
`pl_img_id` int(11) NOT NULL,
  `pl_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_places`
--

CREATE TABLE IF NOT EXISTS `places_places` (
`pl_id` int(11) NOT NULL,
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
  `rate_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_places_cat`
--

CREATE TABLE IF NOT EXISTS `places_places_cat` (
`pl_cat_id` int(11) NOT NULL,
  `pl_cat_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pl_cat_icon` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_rating`
--

CREATE TABLE IF NOT EXISTS `places_rating` (
  `places_id` int(12) NOT NULL DEFAULT '0',
  `places_rating_count` int(11) NOT NULL DEFAULT '0',
  `places_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `places_videos`
--

CREATE TABLE IF NOT EXISTS `places_videos` (
`pl_video_id` int(11) NOT NULL,
  `pl_id` int(11) NOT NULL DEFAULT '0',
  `pl_video_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pl_video_embed` text COLLATE utf8_unicode_ci NOT NULL,
  `pl_video_added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places_voting_track`
--

CREATE TABLE IF NOT EXISTS `places_voting_track` (
  `places_id` int(12) NOT NULL DEFAULT '0',
  `places_ip` varchar(20) DEFAULT NULL,
  `places_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Profiles`
--

CREATE TABLE IF NOT EXISTS `Profiles` (
`profile_id` int(10) NOT NULL,
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
  `publish_status` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Profiles`
--

INSERT INTO `Profiles` (`profile_id`, `first_name`, `last_name`, `dob`, `gender`, `ethnicity_id`, `education_id`, `religion_id`, `faith_id`, `waiting_id`, `status`, `accounts_id`, `created_at`, `modified_at`, `last_login`, `publish_status`) VALUES
(1, 'anish', 'k', '2015-08-11', 'male', 1, 1, 1, 1, 1, 1, 1, '2016-03-24 11:37:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(7, 'dhanya', 'p', '2016-03-08', 'female', 1, 2, 3, 4, 5, 1, 13, '2016-03-22 11:23:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(8, 'suraj', 's', '2016-03-08', 'female', 1, 2, 3, 4, 5, 1, 13, '2016-03-22 11:23:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(9, 'rahul', 'rp', '2016-03-08', 'male', 1, 2, 3, 4, 5, 1, 14, '2016-03-22 11:37:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Profiles_draft`
--

CREATE TABLE IF NOT EXISTS `Profiles_draft` (
`profile_id` int(10) NOT NULL,
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
  `publish_status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Profiles_draft_prev`
--

CREATE TABLE IF NOT EXISTS `Profiles_draft_prev` (
`ID` int(10) unsigned NOT NULL,
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
  `allow_contact` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=8463 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Profiles_prev`
--

CREATE TABLE IF NOT EXISTS `Profiles_prev` (
`ID` int(10) unsigned NOT NULL,
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
  `ZOHO_ID` varchar(225) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8463 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_faith`
--

CREATE TABLE IF NOT EXISTS `profile_faith` (
  `profile_faith_id` int(5) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `Faith_faith_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile_status`
--

CREATE TABLE IF NOT EXISTS `profile_status` (
`ID` int(11) NOT NULL,
  `UserId` int(100) NOT NULL,
  `Status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IPaddr` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `AgencyId` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1774 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qwe_profile_theme_base`
--

CREATE TABLE IF NOT EXISTS `qwe_profile_theme_base` (
`id` int(11) NOT NULL,
  `type` enum('myspace','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'myspace',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qwe_profile_theme_pages`
--

CREATE TABLE IF NOT EXISTS `qwe_profile_theme_pages` (
`id` int(11) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qwe_profile_theme_themes`
--

CREATE TABLE IF NOT EXISTS `qwe_profile_theme_themes` (
  `profile_id` int(11) NOT NULL,
  `css` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('myspace','other') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'myspace'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayBoardBoards`
--

CREATE TABLE IF NOT EXISTS `RayBoardBoards` (
`ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) NOT NULL DEFAULT '',
  `OwnerID` varchar(20) NOT NULL DEFAULT '0',
  `When` int(11) DEFAULT NULL,
  `Status` enum('new','normal','delete') NOT NULL DEFAULT 'new'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayBoardCurrentUsers`
--

CREATE TABLE IF NOT EXISTS `RayBoardCurrentUsers` (
  `ID` varchar(20) NOT NULL DEFAULT '',
  `Nick` varchar(255) NOT NULL,
  `Sex` enum('M','F') NOT NULL DEFAULT 'M',
  `Age` int(11) NOT NULL DEFAULT '0',
  `Photo` varchar(255) NOT NULL DEFAULT '',
  `Profile` varchar(255) NOT NULL DEFAULT '',
  `Desc` varchar(255) NOT NULL,
  `When` int(11) NOT NULL DEFAULT '0',
  `Status` enum('new','old','idle') NOT NULL DEFAULT 'new'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayBoardUsers`
--

CREATE TABLE IF NOT EXISTS `RayBoardUsers` (
`ID` int(11) NOT NULL,
  `Board` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatCurrentUsers`
--

CREATE TABLE IF NOT EXISTS `RayChatCurrentUsers` (
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
  `Status` enum('new','old','idle','kick','type','online') NOT NULL DEFAULT 'new'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatMemberships`
--

CREATE TABLE IF NOT EXISTS `RayChatMemberships` (
`ID` int(11) NOT NULL,
  `Setting` int(11) NOT NULL DEFAULT '0',
  `Value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Membership` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatMembershipsSettings`
--

CREATE TABLE IF NOT EXISTS `RayChatMembershipsSettings` (
`ID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Type` enum('boolean','number','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'boolean',
  `Default` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Range` int(3) NOT NULL DEFAULT '3',
  `Error` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatMessages`
--

CREATE TABLE IF NOT EXISTS `RayChatMessages` (
`ID` int(11) NOT NULL,
  `Room` int(11) NOT NULL DEFAULT '0',
  `Sender` varchar(20) NOT NULL DEFAULT '',
  `Recipient` varchar(20) NOT NULL DEFAULT '',
  `Whisper` enum('true','false') NOT NULL DEFAULT 'false',
  `Message` text NOT NULL,
  `Style` text NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT 'text',
  `When` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatProfiles`
--

CREATE TABLE IF NOT EXISTS `RayChatProfiles` (
  `ID` varchar(20) NOT NULL DEFAULT '0',
  `Banned` enum('true','false') NOT NULL DEFAULT 'false',
  `Type` varchar(10) NOT NULL DEFAULT 'full',
  `Smileset` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatRooms`
--

CREATE TABLE IF NOT EXISTS `RayChatRooms` (
`ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) NOT NULL DEFAULT '',
  `Desc` text NOT NULL,
  `OwnerID` varchar(20) NOT NULL DEFAULT '0',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayChatRoomsUsers`
--

CREATE TABLE IF NOT EXISTS `RayChatRoomsUsers` (
`ID` int(11) NOT NULL,
  `Room` int(11) NOT NULL DEFAULT '0',
  `User` varchar(20) NOT NULL DEFAULT '',
  `When` int(11) DEFAULT NULL,
  `Status` enum('normal','delete') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayImContacts`
--

CREATE TABLE IF NOT EXISTS `RayImContacts` (
`ID` int(11) NOT NULL,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Online` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'online',
  `When` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayImMessages`
--

CREATE TABLE IF NOT EXISTS `RayImMessages` (
`ID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL DEFAULT '0',
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `Style` text COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `When` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayImPendings`
--

CREATE TABLE IF NOT EXISTS `RayImPendings` (
`ID` int(11) NOT NULL,
  `SenderID` int(11) NOT NULL DEFAULT '0',
  `RecipientID` int(11) NOT NULL DEFAULT '0',
  `Message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `When` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayImProfiles`
--

CREATE TABLE IF NOT EXISTS `RayImProfiles` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Smileset` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RayMp3Files`
--

CREATE TABLE IF NOT EXISTS `RayMp3Files` (
`ID` int(11) NOT NULL,
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
  `Status` enum('approved','disapproved','pending','processing','failed') NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayMp3Tokens`
--

CREATE TABLE IF NOT EXISTS `RayMp3Tokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayShoutboxMessages`
--

CREATE TABLE IF NOT EXISTS `RayShoutboxMessages` (
`ID` int(11) NOT NULL,
  `UserID` varchar(20) NOT NULL DEFAULT '0',
  `Msg` text NOT NULL,
  `When` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayVideoFiles`
--

CREATE TABLE IF NOT EXISTS `RayVideoFiles` (
`ID` int(11) NOT NULL,
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
  `ytChannelId` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1751 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RayVideoFiles`
--

INSERT INTO `RayVideoFiles` (`ID`, `Categories`, `Title`, `Uri`, `Tags`, `Description`, `Time`, `Date`, `account_id`, `Views`, `Rate`, `RateCount`, `CommentsCount`, `Featured`, `Status`, `Source`, `Video`, `YoutubeLink`, `home`, `ytStatusCheck`, `ytChannelId`) VALUES
(2, '', 'to_FAX', 'to_FAX', '', 'to_FAX', 0, 1291385105, '1', 20, 0, 0, 0, 0, 'approved', '', '', 0, 0, 'processed', ''),
(3, '', 'to_FAX', 'to_FAX', '', 'to_FAX', 0, 1291385105, '1', 20, 0, 0, 0, 0, 'approved', '', '', 0, 0, 'processed', '');

-- --------------------------------------------------------

--
-- Table structure for table `RayVideoTokens`
--

CREATE TABLE IF NOT EXISTS `RayVideoTokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayVideo_commentsFiles`
--

CREATE TABLE IF NOT EXISTS `RayVideo_commentsFiles` (
`ID` int(11) NOT NULL,
  `Categories` text NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Uri` varchar(255) NOT NULL DEFAULT '',
  `Tags` text NOT NULL,
  `Description` text NOT NULL,
  `Time` int(11) NOT NULL DEFAULT '0',
  `Date` int(20) NOT NULL DEFAULT '0',
  `Owner` varchar(64) NOT NULL DEFAULT '',
  `Views` int(12) DEFAULT '0',
  `Status` enum('approved','disapproved','pending','processing','failed') NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RayVideo_commentsTokens`
--

CREATE TABLE IF NOT EXISTS `RayVideo_commentsTokens` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Token` varchar(32) NOT NULL DEFAULT '',
  `Date` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Regions`
--

CREATE TABLE IF NOT EXISTS `Regions` (
  `RegionId` int(4) NOT NULL,
  `Region` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Regions`
--

INSERT INTO `Regions` (`RegionId`, `Region`) VALUES
(1, 'Southeast');

-- --------------------------------------------------------

--
-- Table structure for table `Relationship_status`
--

CREATE TABLE IF NOT EXISTS `Relationship_status` (
  `relationship_status_id` int(11) NOT NULL,
  `relationship_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Religions`
--

CREATE TABLE IF NOT EXISTS `Religions` (
  `ReligionId` int(4) NOT NULL,
  `Religion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Religions`
--

INSERT INTO `Religions` (`ReligionId`, `Religion`) VALUES
(3, 'Christian'),
(1, 'Hindu');

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
`id` int(5) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Social_websites`
--

CREATE TABLE IF NOT EXISTS `Social_websites` (
`website_id` int(10) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `special_need`
--

CREATE TABLE IF NOT EXISTS `special_need` (
  `special_need_id` int(5) NOT NULL,
  `special_need` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `special_need_pref`
--

CREATE TABLE IF NOT EXISTS `special_need_pref` (
  `special_need_pref_id` int(5) NOT NULL,
  `special_need_id` int(5) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
`state_id` int(11) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `StateCode` varchar(5) NOT NULL,
  `accounts_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `country_id`, `State`, `StateCode`, `accounts_id`) VALUES
(1, '1', 'Kerala', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_account_custom_stat_elements`
--

CREATE TABLE IF NOT EXISTS `sys_account_custom_stat_elements` (
`ID` int(2) NOT NULL,
  `Label` varchar(128) NOT NULL,
  `Value` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_actions`
--

CREATE TABLE IF NOT EXISTS `sys_acl_actions` (
`ID` smallint(5) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `AdditionalParamName` varchar(80) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_actions_track`
--

CREATE TABLE IF NOT EXISTS `sys_acl_actions_track` (
  `IDAction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `ActionsLeft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ValidSince` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels` (
`ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Icon` varchar(255) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `Active` enum('yes','no') NOT NULL DEFAULT 'no',
  `Purchasable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `Removable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `Order` int(11) NOT NULL DEFAULT '0',
  `Free` int(11) NOT NULL,
  `Trial` tinyint(1) NOT NULL,
  `Trial_Length` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_acl_levels`
--

INSERT INTO `sys_acl_levels` (`ID`, `Name`, `Icon`, `Description`, `Active`, `Purchasable`, `Removable`, `Order`, `Free`, `Trial`, `Trial_Length`) VALUES
(1, 'Non-member', 'non-member.png', 'Cannot be removed.', 'yes', 'no', 'no', 0, 0, 0, 0),
(2, 'Standard', 'member.png', 'Cannot be removed.', 'yes', 'no', 'no', 0, 0, 0, 0),
(3, 'Promotion', 'promotion.png', 'Cannot be removed.', 'yes', 'no', 'no', 0, 0, 0, 0),
(4, 'Adoptive Family - GOLD', '1288016928.png', 'Adoptive Family GOLD Level', 'yes', '', 'yes', 0, 0, 0, 0),
(5, 'Adoptive Family - SILVER', '1288017004.png', 'Adoptive Family - SILVER', 'yes', '', 'yes', 0, 0, 0, 0),
(6, 'Expecting Parent', '1288017117.png', 'Please select this membership if you are expecting or want to create an adoption plan.', 'yes', 'yes', 'yes', 0, 1, 0, 0),
(7, 'Adoption Service Provider', '1288017155.png', 'Choose this membership if you provide services for the adoption community.  This includes adoption agencies, attorneys, adoption consultants, and caseworkers.', 'yes', 'yes', 'yes', 0, 1, 0, 0),
(9, 'Adoptive Family - Standard', '1288547017.png', 'This is the standard Membership Level for Adoptive Families', 'yes', '', 'yes', 0, 1, 0, 0),
(10, 'Trial Membership', '1319232019.jpg', 'This membership has 30 day free trial. Account expires after 30 days', 'no', '', 'yes', 0, 0, 0, 0),
(14, 'Featured Membership - Quarterly ', '1334073995.png', 'The membership with give you the most features available to connect with that future birth parent.   ', 'yes', 'yes', 'yes', 2, 0, 0, 0),
(15, 'Featured Membership - **Unlimited**', '1334073995.png', 'Choose this membership. \r\n\r\nOur best value available today for families.  This membership gives you unlimited features, a selection of services, for a one time fee until you adopt.  If you have not found a match we will renew your account for no cost for another term.\r\nIf you have a discount code enter that then press the get a discount button.', 'yes', 'yes', 'yes', 1, 0, 0, 0),
(18, 'Network Membership', '1334073995.png', 'If you already have your own website and just want to increase your visibility or if you are on a budget this is the service for you.   This is good for 24 months.  If you have not found a match we will renew your account for no cost for another term.', 'yes', 'yes', 'yes', 3, 0, 0, 0),
(20, 'Network Membership - Monthly', '1334073995.png', '', 'yes', 'yes', 'yes', 0, 0, 0, 0),
(24, 'Featured - new', '1361859505.png', '', 'yes', 'yes', 'yes', 1, 0, 0, 0),
(23, 'Network - new', '1361859436.png', '', 'yes', 'yes', 'yes', 2, 0, 0, 0),
(25, 'Basic', 'membership.png', 'Basic Membership', 'yes', 'yes', 'yes', 0, 1, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels_features`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels_features` (
`ID` int(11) NOT NULL,
  `IDLevel` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `benefit_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels_members`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels_members` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels_members_backup_5_oct_2015`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels_members_backup_5_oct_2015` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels_members_backup_28_09_2015`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels_members_backup_28_09_2015` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_levels_members_history`
--

CREATE TABLE IF NOT EXISTS `sys_acl_levels_members_history` (
  `IDMember` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `TransactionID` varchar(16) NOT NULL DEFAULT '',
  `Upgrade` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_level_prices`
--

CREATE TABLE IF NOT EXISTS `sys_acl_level_prices` (
`id` int(11) NOT NULL,
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Days` int(10) unsigned NOT NULL DEFAULT '1',
  `Price` float unsigned NOT NULL DEFAULT '1',
  `Unit` varchar(11) NOT NULL,
  `Length` varchar(11) NOT NULL,
  `Auto` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_acl_matrix`
--

CREATE TABLE IF NOT EXISTS `sys_acl_matrix` (
  `IDLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IDAction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AllowedCount` smallint(5) unsigned DEFAULT NULL,
  `AllowedPeriodLen` smallint(5) unsigned DEFAULT NULL,
  `AllowedPeriodStart` datetime DEFAULT NULL,
  `AllowedPeriodEnd` datetime DEFAULT NULL,
  `AdditionalParamValue` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_admin_ban_list`
--

CREATE TABLE IF NOT EXISTS `sys_admin_ban_list` (
  `ProfID` int(10) unsigned NOT NULL DEFAULT '0',
  `Time` int(10) unsigned NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums`
--

CREATE TABLE IF NOT EXISTS `sys_albums` (
`ID` int(10) NOT NULL,
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
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3'
) ENGINE=MyISAM AUTO_INCREMENT=18517 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_albums`
--

INSERT INTO `sys_albums` (`ID`, `Caption`, `Uri`, `Location`, `Description`, `Type`, `account_id`, `Status`, `Date`, `ObjCount`, `LastObjId`, `AllowAlbumView`) VALUES
(1, 'Home Pictures', 'Home Pictures', '', 'Home Pictures', 'bx_photos', 1, 'active', 0, 0, 0, 3),
(2, 'Home Videos', 'Home Videos', '', '', 'bx_videos', 1, 'active', 0, 0, 0, 3),
(3, 'Home Videos2', 'Home Videos2', '', 'Home Videos2', 'bx_videos', 1, 'active', 54564, 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_backup`
--

CREATE TABLE IF NOT EXISTS `sys_albums_backup` (
`ID` int(10) NOT NULL,
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
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3'
) ENGINE=MyISAM AUTO_INCREMENT=16638 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_newdb`
--

CREATE TABLE IF NOT EXISTS `sys_albums_newdb` (
`ID` int(10) NOT NULL,
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
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3'
) ENGINE=MyISAM AUTO_INCREMENT=17753 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_objects`
--

CREATE TABLE IF NOT EXISTS `sys_albums_objects` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_albums_objects`
--

INSERT INTO `sys_albums_objects` (`id_album`, `id_object`, `obj_order`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_objects_newdb`
--

CREATE TABLE IF NOT EXISTS `sys_albums_objects_newdb` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_objects_newdb_modified`
--

CREATE TABLE IF NOT EXISTS `sys_albums_objects_newdb_modified` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_objects_olddb_backup`
--

CREATE TABLE IF NOT EXISTS `sys_albums_objects_olddb_backup` (
  `id_album` int(10) NOT NULL,
  `id_object` int(10) NOT NULL,
  `obj_order` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_albums_olddb_backup`
--

CREATE TABLE IF NOT EXISTS `sys_albums_olddb_backup` (
`ID` int(10) NOT NULL,
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
  `AllowAlbumView` int(10) NOT NULL DEFAULT '3'
) ENGINE=MyISAM AUTO_INCREMENT=17754 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_alerts`
--

CREATE TABLE IF NOT EXISTS `sys_alerts` (
`id` int(11) unsigned NOT NULL,
  `unit` varchar(64) NOT NULL,
  `action` varchar(64) DEFAULT 'none',
  `handler_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_alerts_handlers`
--

CREATE TABLE IF NOT EXISTS `sys_alerts_handlers` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `eval` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_antispam_block_log`
--

CREATE TABLE IF NOT EXISTS `sys_antispam_block_log` (
  `ip` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `extra` text NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_banners`
--

CREATE TABLE IF NOT EXISTS `sys_banners` (
`ID` int(11) unsigned NOT NULL,
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
  `rvshift` int(5) NOT NULL DEFAULT '-750'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `sys_banners_clicks`
--

CREATE TABLE IF NOT EXISTS `sys_banners_clicks` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(10) NOT NULL DEFAULT '0',
  `IP` varchar(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_banners_shows`
--

CREATE TABLE IF NOT EXISTS `sys_banners_shows` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` int(10) NOT NULL DEFAULT '0',
  `IP` varchar(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_block_list`
--

CREATE TABLE IF NOT EXISTS `sys_block_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_box_download`
--

CREATE TABLE IF NOT EXISTS `sys_box_download` (
`id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `onclick` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `disabled` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_categories`
--

CREATE TABLE IF NOT EXISTS `sys_categories` (
  `Category` varchar(32) NOT NULL DEFAULT '',
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(20) NOT NULL DEFAULT 'photo',
  `Owner` int(10) unsigned NOT NULL,
  `Status` enum('active','passive') NOT NULL DEFAULT 'active',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Parent` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_cmts_profile`
--

CREATE TABLE IF NOT EXISTS `sys_cmts_profile` (
`cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT '0',
  `cmt_object_id` int(11) NOT NULL DEFAULT '0',
  `cmt_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate` int(11) NOT NULL DEFAULT '0',
  `cmt_rate_count` int(11) NOT NULL DEFAULT '0',
  `cmt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cmt_replies` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_cmts_track`
--

CREATE TABLE IF NOT EXISTS `sys_cmts_track` (
  `cmt_system_id` int(11) NOT NULL DEFAULT '0',
  `cmt_id` int(11) NOT NULL DEFAULT '0',
  `cmt_rate` tinyint(4) NOT NULL DEFAULT '0',
  `cmt_rate_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_author_nip` int(11) unsigned NOT NULL DEFAULT '0',
  `cmt_rate_ts` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_color_base`
--

CREATE TABLE IF NOT EXISTS `sys_color_base` (
  `ColorName` varchar(20) NOT NULL DEFAULT '',
  `ColorCode` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_configuration`
--

CREATE TABLE IF NOT EXISTS `sys_configuration` (
`config_ID` int(11) NOT NULL,
  `config_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_value` int(11) DEFAULT NULL,
  `config_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_display` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sys_countries`
--

CREATE TABLE IF NOT EXISTS `sys_countries` (
  `ISO2` varchar(2) NOT NULL DEFAULT '',
  `ISO3` varchar(3) NOT NULL DEFAULT '',
  `ISONo` smallint(3) NOT NULL DEFAULT '0',
  `Country` varchar(100) NOT NULL DEFAULT '',
  `Region` varchar(100) DEFAULT NULL,
  `Currency` varchar(100) DEFAULT NULL,
  `CurrencyCode` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_cron_jobs`
--

CREATE TABLE IF NOT EXISTS `sys_cron_jobs` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `time` varchar(128) NOT NULL DEFAULT '*',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `eval` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_dnsbluri_zones`
--

CREATE TABLE IF NOT EXISTS `sys_dnsbluri_zones` (
  `level` tinyint(4) NOT NULL,
  `zone` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_dnsbl_rules`
--

CREATE TABLE IF NOT EXISTS `sys_dnsbl_rules` (
`id` int(11) NOT NULL,
  `chain` enum('spammers','whitelist','uridns') NOT NULL,
  `zonedomain` varchar(255) NOT NULL,
  `postvresp` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `recheck` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `added` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_email_templates`
--

CREATE TABLE IF NOT EXISTS `sys_email_templates` (
`ID` int(11) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Desc` varchar(255) NOT NULL,
  `LangID` tinyint(4) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_fave_list`
--

CREATE TABLE IF NOT EXISTS `sys_fave_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_friend_list`
--

CREATE TABLE IF NOT EXISTS `sys_friend_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Check` tinyint(2) NOT NULL DEFAULT '0',
  `When` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_greetings`
--

CREATE TABLE IF NOT EXISTS `sys_greetings` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Profile` int(10) unsigned NOT NULL DEFAULT '0',
  `Number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `When` date NOT NULL DEFAULT '0000-00-00',
  `New` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_injections`
--

CREATE TABLE IF NOT EXISTS `sys_injections` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT '0',
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','php') NOT NULL DEFAULT 'text',
  `data` text NOT NULL,
  `replace` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_injections_admin`
--

CREATE TABLE IF NOT EXISTS `sys_injections_admin` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT '0',
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','php') NOT NULL DEFAULT 'text',
  `data` text NOT NULL,
  `replace` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_ip_list`
--

CREATE TABLE IF NOT EXISTS `sys_ip_list` (
`ID` int(11) NOT NULL,
  `From` int(10) unsigned NOT NULL,
  `To` int(10) unsigned NOT NULL,
  `Type` enum('allow','deny') NOT NULL DEFAULT 'deny',
  `LastDT` int(11) unsigned NOT NULL,
  `Desc` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_ip_members_visits`
--

CREATE TABLE IF NOT EXISTS `sys_ip_members_visits` (
`ID` int(11) NOT NULL,
  `MemberID` int(10) unsigned NOT NULL,
  `From` int(10) unsigned NOT NULL,
  `DateTime` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=70772 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_localization_categories`
--

CREATE TABLE IF NOT EXISTS `sys_localization_categories` (
`ID` int(6) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_localization_keys`
--

CREATE TABLE IF NOT EXISTS `sys_localization_keys` (
`ID` int(10) unsigned NOT NULL,
  `IDCategory` int(6) unsigned NOT NULL DEFAULT '0',
  `Key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=16425 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_localization_languages`
--

CREATE TABLE IF NOT EXISTS `sys_localization_languages` (
`ID` tinyint(3) unsigned NOT NULL,
  `Name` varchar(5) NOT NULL DEFAULT '',
  `Flag` varchar(2) NOT NULL DEFAULT '',
  `Title` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_localization_strings`
--

CREATE TABLE IF NOT EXISTS `sys_localization_strings` (
  `IDKey` int(10) unsigned NOT NULL DEFAULT '0',
  `IDLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `String` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_localization_string_params`
--

CREATE TABLE IF NOT EXISTS `sys_localization_string_params` (
  `IDKey` int(10) unsigned NOT NULL DEFAULT '0',
  `IDParam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_admin`
--

CREATE TABLE IF NOT EXISTS `sys_menu_admin` (
`id` int(11) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `icon` varchar(128) NOT NULL DEFAULT '',
  `icon_large` varchar(128) NOT NULL DEFAULT '',
  `check` varchar(255) NOT NULL DEFAULT '',
  `order` tinyint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_admin_top`
--

CREATE TABLE IF NOT EXISTS `sys_menu_admin_top` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `caption` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `order` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_bottom`
--

CREATE TABLE IF NOT EXISTS `sys_menu_bottom` (
`ID` int(10) unsigned NOT NULL,
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
  `Deletable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_member`
--

CREATE TABLE IF NOT EXISTS `sys_menu_member` (
`ID` int(10) unsigned NOT NULL,
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
  `Description` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_mobile`
--

CREATE TABLE IF NOT EXISTS `sys_menu_mobile` (
`id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `page` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `action` int(11) NOT NULL,
  `action_data` varchar(255) NOT NULL,
  `eval_bubble` text NOT NULL,
  `eval_hidden` text NOT NULL,
  `order` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_mobile_pages`
--

CREATE TABLE IF NOT EXISTS `sys_menu_mobile_pages` (
`id` int(11) NOT NULL,
  `page` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_service`
--

CREATE TABLE IF NOT EXISTS `sys_menu_service` (
`ID` int(10) unsigned NOT NULL,
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
  `Deletable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_top`
--

CREATE TABLE IF NOT EXISTS `sys_menu_top` (
`ID` smallint(6) unsigned NOT NULL,
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
  `Statistics` varchar(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_messages`
--

CREATE TABLE IF NOT EXISTS `sys_messages` (
`ID` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Sender` int(10) unsigned NOT NULL DEFAULT '0',
  `Recipient` int(10) unsigned NOT NULL DEFAULT '0',
  `Text` mediumtext NOT NULL,
  `Subject` varchar(255) NOT NULL DEFAULT '',
  `New` enum('0','1') NOT NULL DEFAULT '1',
  `Type` enum('letter','greeting') NOT NULL DEFAULT 'letter',
  `Trash` set('sender','recipient') NOT NULL,
  `TrashNotView` set('sender','recipient') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5206 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_modules`
--

CREATE TABLE IF NOT EXISTS `sys_modules` (
`id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `update_url` varchar(128) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(32) NOT NULL DEFAULT '',
  `class_prefix` varchar(32) NOT NULL DEFAULT '',
  `db_prefix` varchar(32) NOT NULL DEFAULT '',
  `dependencies` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_modules_file_tracks`
--

CREATE TABLE IF NOT EXISTS `sys_modules_file_tracks` (
`id` int(11) unsigned NOT NULL,
  `module_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4484 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_actions`
--

CREATE TABLE IF NOT EXISTS `sys_objects_actions` (
`ID` int(10) unsigned NOT NULL,
  `Caption` varchar(100) NOT NULL,
  `Icon` varchar(100) NOT NULL,
  `Url` varchar(250) NOT NULL,
  `Script` varchar(250) NOT NULL,
  `Eval` text NOT NULL,
  `Order` int(5) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `bDisplayInSubMenuHeader` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_auths`
--

CREATE TABLE IF NOT EXISTS `sys_objects_auths` (
`ID` int(10) unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Link` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_captcha`
--

CREATE TABLE IF NOT EXISTS `sys_objects_captcha` (
`id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_categories`
--

CREATE TABLE IF NOT EXISTS `sys_objects_categories` (
`ID` int(10) unsigned NOT NULL,
  `ObjectName` varchar(50) NOT NULL,
  `Query` text NOT NULL,
  `PermalinkParam` varchar(50) NOT NULL DEFAULT '',
  `EnabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `DisabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `LangKey` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_charts`
--

CREATE TABLE IF NOT EXISTS `sys_objects_charts` (
`id` int(11) NOT NULL,
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
  `order` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_cmts`
--

CREATE TABLE IF NOT EXISTS `sys_objects_cmts` (
`ID` int(10) unsigned NOT NULL,
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
  `ClassFile` varchar(256) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_editor`
--

CREATE TABLE IF NOT EXISTS `sys_objects_editor` (
`id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_member_info`
--

CREATE TABLE IF NOT EXISTS `sys_objects_member_info` (
`id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_search`
--

CREATE TABLE IF NOT EXISTS `sys_objects_search` (
`ID` int(10) unsigned NOT NULL,
  `ObjectName` varchar(50) NOT NULL DEFAULT '',
  `Title` varchar(50) NOT NULL DEFAULT '',
  `ClassName` varchar(50) NOT NULL DEFAULT '',
  `ClassPath` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_site_maps`
--

CREATE TABLE IF NOT EXISTS `sys_objects_site_maps` (
`id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` varchar(5) NOT NULL DEFAULT '0.6',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never','auto') NOT NULL DEFAULT 'auto',
  `class_name` varchar(255) NOT NULL,
  `class_file` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_social_sharing`
--

CREATE TABLE IF NOT EXISTS `sys_objects_social_sharing` (
`id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_tag`
--

CREATE TABLE IF NOT EXISTS `sys_objects_tag` (
`ID` int(10) unsigned NOT NULL,
  `ObjectName` varchar(50) NOT NULL,
  `Query` text NOT NULL,
  `PermalinkParam` varchar(50) NOT NULL DEFAULT '',
  `EnabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `DisabledPermalink` varchar(100) NOT NULL DEFAULT '',
  `LangKey` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_views`
--

CREATE TABLE IF NOT EXISTS `sys_objects_views` (
`id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `table_track` varchar(32) NOT NULL,
  `period` int(11) NOT NULL DEFAULT '86400',
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_views` varchar(32) NOT NULL,
  `is_on` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_objects_vote`
--

CREATE TABLE IF NOT EXISTS `sys_objects_vote` (
`ID` int(10) unsigned NOT NULL,
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
  `OverrideClassFile` varchar(256) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_options`
--

CREATE TABLE IF NOT EXISTS `sys_options` (
  `Name` varchar(64) NOT NULL DEFAULT '',
  `VALUE` mediumtext NOT NULL,
  `kateg` int(6) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `Type` enum('digit','text','checkbox','select','select_multiple','file','list') NOT NULL DEFAULT 'digit',
  `check` text NOT NULL,
  `err_text` varchar(255) NOT NULL DEFAULT '',
  `order_in_kateg` float DEFAULT NULL,
  `AvailableValues` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_options_cats`
--

CREATE TABLE IF NOT EXISTS `sys_options_cats` (
`ID` int(6) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `menu_order` float DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_page_compose`
--

CREATE TABLE IF NOT EXISTS `sys_page_compose` (
`ID` int(11) unsigned NOT NULL,
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
  `Cache` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_page_compose_pages`
--

CREATE TABLE IF NOT EXISTS `sys_page_compose_pages` (
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Order` int(10) unsigned NOT NULL DEFAULT '0',
  `System` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_page_compose_privacy`
--

CREATE TABLE IF NOT EXISTS `sys_page_compose_privacy` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `block_id` int(11) unsigned NOT NULL DEFAULT '0',
  `allow_view_block_to` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_permalinks`
--

CREATE TABLE IF NOT EXISTS `sys_permalinks` (
`id` int(11) unsigned NOT NULL,
  `standard` varchar(128) NOT NULL DEFAULT '',
  `permalink` varchar(128) NOT NULL DEFAULT '',
  `check` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_pre_values`
--

CREATE TABLE IF NOT EXISTS `sys_pre_values` (
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

-- --------------------------------------------------------

--
-- Table structure for table `sys_privacy_actions`
--

CREATE TABLE IF NOT EXISTS `sys_privacy_actions` (
`id` int(11) NOT NULL,
  `module_uri` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `default_group` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_privacy_defaults`
--

CREATE TABLE IF NOT EXISTS `sys_privacy_defaults` (
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `action_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_privacy_groups`
--

CREATE TABLE IF NOT EXISTS `sys_privacy_groups` (
`id` int(11) unsigned NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `home_url` varchar(255) NOT NULL DEFAULT '',
  `get_parent` text NOT NULL,
  `get_content` text NOT NULL,
  `members_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_privacy_members`
--

CREATE TABLE IF NOT EXISTS `sys_privacy_members` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profiles_match`
--

CREATE TABLE IF NOT EXISTS `sys_profiles_match` (
  `profile_id` int(10) NOT NULL,
  `sort` enum('none','activity','date_reg') NOT NULL DEFAULT 'none',
  `profiles_match` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profiles_match_mails`
--

CREATE TABLE IF NOT EXISTS `sys_profiles_match_mails` (
  `profile_id` int(10) NOT NULL,
  `profiles_match` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profile_fields`
--

CREATE TABLE IF NOT EXISTS `sys_profile_fields` (
`ID` smallint(10) unsigned NOT NULL,
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
  `MatchPercent` tinyint(7) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profile_rating`
--

CREATE TABLE IF NOT EXISTS `sys_profile_rating` (
  `pr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pr_rating_count` int(11) NOT NULL DEFAULT '0',
  `pr_rating_sum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profile_views_track`
--

CREATE TABLE IF NOT EXISTS `sys_profile_views_track` (
  `id` int(10) unsigned NOT NULL,
  `viewer` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_profile_voting_track`
--

CREATE TABLE IF NOT EXISTS `sys_profile_voting_track` (
  `pr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pr_ip` varchar(20) DEFAULT NULL,
  `pr_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sbs_entries`
--

CREATE TABLE IF NOT EXISTS `sys_sbs_entries` (
`id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_type` tinyint(4) NOT NULL DEFAULT '0',
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=793 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sbs_messages`
--

CREATE TABLE IF NOT EXISTS `sys_sbs_messages` (
`id` int(10) unsigned NOT NULL,
  `subject` varchar(128) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sbs_queue`
--

CREATE TABLE IF NOT EXISTS `sys_sbs_queue` (
`id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14411 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sbs_types`
--

CREATE TABLE IF NOT EXISTS `sys_sbs_types` (
`id` int(11) NOT NULL,
  `unit` varchar(32) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `template` varchar(64) NOT NULL DEFAULT '',
  `params` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sbs_users`
--

CREATE TABLE IF NOT EXISTS `sys_sbs_users` (
`id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sessions`
--

CREATE TABLE IF NOT EXISTS `sys_sessions` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_shared_sites`
--

CREATE TABLE IF NOT EXISTS `sys_shared_sites` (
`ID` tinyint(4) unsigned NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL DEFAULT '',
  `Icon` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_stat_member`
--

CREATE TABLE IF NOT EXISTS `sys_stat_member` (
  `Type` varchar(20) NOT NULL,
  `SQL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_stat_site`
--

CREATE TABLE IF NOT EXISTS `sys_stat_site` (
`ID` tinyint(4) unsigned NOT NULL,
  `Name` varchar(20) NOT NULL DEFAULT '',
  `Title` varchar(50) NOT NULL DEFAULT '',
  `UserLink` varchar(255) NOT NULL DEFAULT '',
  `UserQuery` varchar(255) NOT NULL DEFAULT '',
  `AdminLink` varchar(255) NOT NULL DEFAULT '',
  `AdminQuery` varchar(255) NOT NULL DEFAULT '',
  `IconName` varchar(50) NOT NULL DEFAULT '',
  `StatOrder` int(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_tags`
--

CREATE TABLE IF NOT EXISTS `sys_tags` (
  `Tag` varchar(32) NOT NULL DEFAULT '',
  `ObjID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(20) NOT NULL DEFAULT 'profile',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testingaqb`
--

CREATE TABLE IF NOT EXISTS `testingaqb` (
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testingprofile`
--

CREATE TABLE IF NOT EXISTS `testingprofile` (
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watermarkimages`
--

CREATE TABLE IF NOT EXISTS `watermarkimages` (
`id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `watermarkimage_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2046 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yn_tour_stations`
--

CREATE TABLE IF NOT EXISTS `yn_tour_stations` (
`id` int(10) unsigned NOT NULL,
  `tour_id` int(10) NOT NULL DEFAULT '0',
  `num` int(10) NOT NULL DEFAULT '0',
  `sel` text,
  `msg` text,
  `delay` int(10) NOT NULL DEFAULT '0',
  `position` char(2) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yn_tour_tours`
--

CREATE TABLE IF NOT EXISTS `yn_tour_tours` (
`id` int(10) unsigned NOT NULL,
  `tour_name` varchar(100) DEFAULT NULL,
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `is_guest` tinyint(1) NOT NULL DEFAULT '1',
  `auto_play` tinyint(1) NOT NULL DEFAULT '0',
  `overlay_opacity` int(3) NOT NULL DEFAULT '20',
  `overlay_cancel` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yn_tour_viewed`
--

CREATE TABLE IF NOT EXISTS `yn_tour_viewed` (
  `mem_id` int(10) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `YoutubeToken`
--

CREATE TABLE IF NOT EXISTS `YoutubeToken` (
  `ID` int(10) NOT NULL,
  `access_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(10) NOT NULL,
  `refresh_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `channelId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
 ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `adoption_type_preference`
--
ALTER TABLE `adoption_type_preference`
 ADD PRIMARY KEY (`adoption_type_preference_id`);

--
-- Indexes for table `agencyemailsettings`
--
ALTER TABLE `agencyemailsettings`
 ADD PRIMARY KEY (`AgencyID`);

--
-- Indexes for table `agency_join_request`
--
ALTER TABLE `agency_join_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Age_group`
--
ALTER TABLE `Age_group`
 ADD PRIMARY KEY (`Age_group_id`);

--
-- Indexes for table `age_group_preference`
--
ALTER TABLE `age_group_preference`
 ADD PRIMARY KEY (`age_group_preference_id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
 ADD PRIMARY KEY (`website`), ADD UNIQUE KEY `user_key` (`user_key`);

--
-- Indexes for table `aqb_automailer_mails`
--
ALTER TABLE `aqb_automailer_mails`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aqb_membership_vouchers_codes`
--
ALTER TABLE `aqb_membership_vouchers_codes`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `aqb_membership_vouchers_transactions`
--
ALTER TABLE `aqb_membership_vouchers_transactions`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aqb_mls_acl_levels`
--
ALTER TABLE `aqb_mls_acl_levels`
 ADD PRIMARY KEY (`AclID`);

--
-- Indexes for table `aqb_pc_members_blocks`
--
ALTER TABLE `aqb_pc_members_blocks`
 ADD PRIMARY KEY (`id`), ADD FULLTEXT KEY `content` (`content`,`title`);

--
-- Indexes for table `aqb_pc_profiles_info`
--
ALTER TABLE `aqb_pc_profiles_info`
 ADD PRIMARY KEY (`member_id`), ADD UNIQUE KEY `member_id` (`member_id`);

--
-- Indexes for table `aqb_pc_standard_blocks`
--
ALTER TABLE `aqb_pc_standard_blocks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `aqb_pts_member_menu_visibility`
--
ALTER TABLE `aqb_pts_member_menu_visibility`
 ADD PRIMARY KEY (`MenuItemID`);

--
-- Indexes for table `aqb_pts_page_blocks_visibility`
--
ALTER TABLE `aqb_pts_page_blocks_visibility`
 ADD PRIMARY KEY (`PageBlockID`);

--
-- Indexes for table `aqb_pts_profile_fields`
--
ALTER TABLE `aqb_pts_profile_fields`
 ADD PRIMARY KEY (`FieldID`);

--
-- Indexes for table `aqb_pts_profile_types`
--
ALTER TABLE `aqb_pts_profile_types`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aqb_pts_search_result_layout`
--
ALTER TABLE `aqb_pts_search_result_layout`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aqb_pts_top_menu_visibility`
--
ALTER TABLE `aqb_pts_top_menu_visibility`
 ADD PRIMARY KEY (`MenuItemID`);

--
-- Indexes for table `aqb_smdf_custom_dependencies`
--
ALTER TABLE `aqb_smdf_custom_dependencies`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aqb_smdf_dependencies`
--
ALTER TABLE `aqb_smdf_dependencies`
 ADD PRIMARY KEY (`Field`);

--
-- Indexes for table `bx_arl_comments`
--
ALTER TABLE `bx_arl_comments`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_arl_comments_track`
--
ALTER TABLE `bx_arl_comments_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_arl_entries`
--
ALTER TABLE `bx_arl_entries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD FULLTEXT KEY `search_group` (`caption`,`content`,`tags`,`categories`), ADD FULLTEXT KEY `search_caption` (`caption`), ADD FULLTEXT KEY `search_content` (`content`), ADD FULLTEXT KEY `search_tags` (`tags`), ADD FULLTEXT KEY `search_categories` (`categories`);

--
-- Indexes for table `bx_arl_views_track`
--
ALTER TABLE `bx_arl_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_arl_voting`
--
ALTER TABLE `bx_arl_voting`
 ADD UNIQUE KEY `arl_id` (`arl_id`);

--
-- Indexes for table `bx_arl_voting_track`
--
ALTER TABLE `bx_arl_voting_track`
 ADD KEY `arl_ip` (`arl_ip`,`arl_id`);

--
-- Indexes for table `bx_avatar_images`
--
ALTER TABLE `bx_avatar_images`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_blogs_cmts`
--
ALTER TABLE `bx_blogs_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_blogs_main`
--
ALTER TABLE `bx_blogs_main`
 ADD PRIMARY KEY (`ID`), ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `bx_blogs_posts`
--
ALTER TABLE `bx_blogs_posts`
 ADD PRIMARY KEY (`PostID`), ADD UNIQUE KEY `PostUri` (`PostUri`), ADD KEY `OwnerID` (`account_id`), ADD FULLTEXT KEY `PostCaption` (`PostCaption`,`PostText`,`Tags`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `bx_blogs_rating`
--
ALTER TABLE `bx_blogs_rating`
 ADD UNIQUE KEY `med_id` (`blogp_id`);

--
-- Indexes for table `bx_blogs_views_track`
--
ALTER TABLE `bx_blogs_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_blogs_voting_track`
--
ALTER TABLE `bx_blogs_voting_track`
 ADD KEY `med_ip` (`blogp_ip`,`blogp_id`);

--
-- Indexes for table `bx_crss_main`
--
ALTER TABLE `bx_crss_main`
 ADD PRIMARY KEY (`ID`), ADD KEY `ProfileID` (`ProfileID`);

--
-- Indexes for table `bx_events_activity`
--
ALTER TABLE `bx_events_activity`
 ADD PRIMARY KEY (`id`), ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `bx_events_admins`
--
ALTER TABLE `bx_events_admins`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `bx_events_cmts`
--
ALTER TABLE `bx_events_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_events_cmts_track`
--
ALTER TABLE `bx_events_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_events_files`
--
ALTER TABLE `bx_events_files`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_events_forum`
--
ALTER TABLE `bx_events_forum`
 ADD PRIMARY KEY (`forum_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `forum_uri` (`forum_uri`), ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `bx_events_forum_actions_log`
--
ALTER TABLE `bx_events_forum_actions_log`
 ADD KEY `action_when` (`action_when`);

--
-- Indexes for table `bx_events_forum_attachments`
--
ALTER TABLE `bx_events_forum_attachments`
 ADD PRIMARY KEY (`att_hash`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `bx_events_forum_cat`
--
ALTER TABLE `bx_events_forum_cat`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `cat_order` (`cat_order`), ADD KEY `cat_uri` (`cat_uri`);

--
-- Indexes for table `bx_events_forum_flag`
--
ALTER TABLE `bx_events_forum_flag`
 ADD PRIMARY KEY (`user`,`topic_id`);

--
-- Indexes for table `bx_events_forum_post`
--
ALTER TABLE `bx_events_forum_post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user` (`user`), ADD KEY `when` (`when`);

--
-- Indexes for table `bx_events_forum_signatures`
--
ALTER TABLE `bx_events_forum_signatures`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_events_forum_topic`
--
ALTER TABLE `bx_events_forum_topic`
 ADD PRIMARY KEY (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `forum_id_2` (`forum_id`,`when`), ADD KEY `topic_uri` (`topic_uri`);

--
-- Indexes for table `bx_events_forum_user`
--
ALTER TABLE `bx_events_forum_user`
 ADD PRIMARY KEY (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `bx_events_forum_user_activity`
--
ALTER TABLE `bx_events_forum_user_activity`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_events_forum_user_stat`
--
ALTER TABLE `bx_events_forum_user_stat`
 ADD KEY `user` (`user`);

--
-- Indexes for table `bx_events_forum_vote`
--
ALTER TABLE `bx_events_forum_vote`
 ADD PRIMARY KEY (`user_name`,`post_id`);

--
-- Indexes for table `bx_events_images`
--
ALTER TABLE `bx_events_images`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_events_invite`
--
ALTER TABLE `bx_events_invite`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_events_main`
--
ALTER TABLE `bx_events_main`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `EntryUri` (`EntryUri`), ADD KEY `ResponsibleID` (`ResponsibleID`), ADD KEY `EventStart` (`EventStart`), ADD KEY `Date` (`Date`), ADD FULLTEXT KEY `Title` (`Title`,`Description`,`City`,`Place`,`Tags`,`Categories`), ADD FULLTEXT KEY `Tags` (`Tags`), ADD FULLTEXT KEY `Categories` (`Categories`);

--
-- Indexes for table `bx_events_participants`
--
ALTER TABLE `bx_events_participants`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `bx_events_rating`
--
ALTER TABLE `bx_events_rating`
 ADD UNIQUE KEY `gal_id` (`gal_id`);

--
-- Indexes for table `bx_events_rating_track`
--
ALTER TABLE `bx_events_rating_track`
 ADD KEY `gal_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_events_sounds`
--
ALTER TABLE `bx_events_sounds`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_events_videos`
--
ALTER TABLE `bx_events_videos`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_events_views_track`
--
ALTER TABLE `bx_events_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_facebook_accounts`
--
ALTER TABLE `bx_facebook_accounts`
 ADD PRIMARY KEY (`id_profile`), ADD KEY `fb_profile` (`fb_profile`);

--
-- Indexes for table `bx_files_cmts`
--
ALTER TABLE `bx_files_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_files_cmts_albums`
--
ALTER TABLE `bx_files_cmts_albums`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_files_favorites`
--
ALTER TABLE `bx_files_favorites`
 ADD PRIMARY KEY (`ID`,`Profile`);

--
-- Indexes for table `bx_files_main`
--
ALTER TABLE `bx_files_main`
 ADD PRIMARY KEY (`ID`), ADD KEY `Owner` (`Owner`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `bx_files_rating`
--
ALTER TABLE `bx_files_rating`
 ADD UNIQUE KEY `med_id` (`gal_id`);

--
-- Indexes for table `bx_files_types`
--
ALTER TABLE `bx_files_types`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Type` (`Type`);

--
-- Indexes for table `bx_files_views_track`
--
ALTER TABLE `bx_files_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_files_voting_track`
--
ALTER TABLE `bx_files_voting_track`
 ADD KEY `med_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_forum`
--
ALTER TABLE `bx_forum`
 ADD PRIMARY KEY (`forum_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `forum_uri` (`forum_uri`);

--
-- Indexes for table `bx_forum_actions_log`
--
ALTER TABLE `bx_forum_actions_log`
 ADD KEY `action_when` (`action_when`);

--
-- Indexes for table `bx_forum_attachments`
--
ALTER TABLE `bx_forum_attachments`
 ADD PRIMARY KEY (`att_hash`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `bx_forum_cat`
--
ALTER TABLE `bx_forum_cat`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `cat_order` (`cat_order`), ADD KEY `cat_uri` (`cat_uri`);

--
-- Indexes for table `bx_forum_flag`
--
ALTER TABLE `bx_forum_flag`
 ADD PRIMARY KEY (`user`,`topic_id`);

--
-- Indexes for table `bx_forum_post`
--
ALTER TABLE `bx_forum_post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user` (`user`), ADD KEY `when` (`when`), ADD FULLTEXT KEY `post_text` (`post_text`);

--
-- Indexes for table `bx_forum_signatures`
--
ALTER TABLE `bx_forum_signatures`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_forum_topic`
--
ALTER TABLE `bx_forum_topic`
 ADD PRIMARY KEY (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `forum_id_2` (`forum_id`,`when`), ADD KEY `topic_uri` (`topic_uri`), ADD FULLTEXT KEY `topic_title` (`topic_title`);

--
-- Indexes for table `bx_forum_user`
--
ALTER TABLE `bx_forum_user`
 ADD PRIMARY KEY (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `bx_forum_user_activity`
--
ALTER TABLE `bx_forum_user_activity`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_forum_user_stat`
--
ALTER TABLE `bx_forum_user_stat`
 ADD KEY `user` (`user`);

--
-- Indexes for table `bx_forum_vote`
--
ALTER TABLE `bx_forum_vote`
 ADD PRIMARY KEY (`user_name`,`post_id`);

--
-- Indexes for table `bx_groups_admins`
--
ALTER TABLE `bx_groups_admins`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `bx_groups_cmts`
--
ALTER TABLE `bx_groups_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_groups_cmts_track`
--
ALTER TABLE `bx_groups_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_groups_codes`
--
ALTER TABLE `bx_groups_codes`
 ADD PRIMARY KEY (`id_entry`,`code`);

--
-- Indexes for table `bx_groups_fans`
--
ALTER TABLE `bx_groups_fans`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `bx_groups_fans_backup`
--
ALTER TABLE `bx_groups_fans_backup`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `bx_groups_files`
--
ALTER TABLE `bx_groups_files`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_groups_forum`
--
ALTER TABLE `bx_groups_forum`
 ADD PRIMARY KEY (`forum_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `forum_uri` (`forum_uri`), ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `bx_groups_forum_actions_log`
--
ALTER TABLE `bx_groups_forum_actions_log`
 ADD KEY `action_when` (`action_when`);

--
-- Indexes for table `bx_groups_forum_attachments`
--
ALTER TABLE `bx_groups_forum_attachments`
 ADD PRIMARY KEY (`att_hash`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `bx_groups_forum_cat`
--
ALTER TABLE `bx_groups_forum_cat`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `cat_order` (`cat_order`), ADD KEY `cat_uri` (`cat_uri`);

--
-- Indexes for table `bx_groups_forum_flag`
--
ALTER TABLE `bx_groups_forum_flag`
 ADD PRIMARY KEY (`user`,`topic_id`);

--
-- Indexes for table `bx_groups_forum_post`
--
ALTER TABLE `bx_groups_forum_post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user` (`user`), ADD KEY `when` (`when`);

--
-- Indexes for table `bx_groups_forum_signatures`
--
ALTER TABLE `bx_groups_forum_signatures`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_groups_forum_topic`
--
ALTER TABLE `bx_groups_forum_topic`
 ADD PRIMARY KEY (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `forum_id_2` (`forum_id`,`when`), ADD KEY `topic_uri` (`topic_uri`);

--
-- Indexes for table `bx_groups_forum_user`
--
ALTER TABLE `bx_groups_forum_user`
 ADD PRIMARY KEY (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `bx_groups_forum_user_activity`
--
ALTER TABLE `bx_groups_forum_user_activity`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_groups_forum_user_stat`
--
ALTER TABLE `bx_groups_forum_user_stat`
 ADD KEY `user` (`user`);

--
-- Indexes for table `bx_groups_forum_vote`
--
ALTER TABLE `bx_groups_forum_vote`
 ADD PRIMARY KEY (`user_name`,`post_id`);

--
-- Indexes for table `bx_groups_images`
--
ALTER TABLE `bx_groups_images`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_groups_main`
--
ALTER TABLE `bx_groups_main`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `author_id` (`author_id`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `bx_groups_main_backup`
--
ALTER TABLE `bx_groups_main_backup`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `author_id` (`author_id`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `bx_groups_rating`
--
ALTER TABLE `bx_groups_rating`
 ADD UNIQUE KEY `gal_id` (`gal_id`);

--
-- Indexes for table `bx_groups_rating_track`
--
ALTER TABLE `bx_groups_rating_track`
 ADD KEY `gal_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_groups_sounds`
--
ALTER TABLE `bx_groups_sounds`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_groups_videos`
--
ALTER TABLE `bx_groups_videos`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_groups_views_track`
--
ALTER TABLE `bx_groups_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_news_comments`
--
ALTER TABLE `bx_news_comments`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_news_comments_track`
--
ALTER TABLE `bx_news_comments_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_news_entries`
--
ALTER TABLE `bx_news_entries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD FULLTEXT KEY `search_group` (`caption`,`content`,`tags`,`categories`), ADD FULLTEXT KEY `search_caption` (`caption`), ADD FULLTEXT KEY `search_content` (`content`), ADD FULLTEXT KEY `search_tags` (`tags`), ADD FULLTEXT KEY `search_categories` (`categories`);

--
-- Indexes for table `bx_news_views_track`
--
ALTER TABLE `bx_news_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_news_voting`
--
ALTER TABLE `bx_news_voting`
 ADD UNIQUE KEY `news_id` (`news_id`);

--
-- Indexes for table `bx_news_voting_track`
--
ALTER TABLE `bx_news_voting_track`
 ADD KEY `news_ip` (`news_ip`,`news_id`);

--
-- Indexes for table `bx_pageac_member_menu_visibility`
--
ALTER TABLE `bx_pageac_member_menu_visibility`
 ADD PRIMARY KEY (`MenuItemID`);

--
-- Indexes for table `bx_pageac_page_blocks_visibility`
--
ALTER TABLE `bx_pageac_page_blocks_visibility`
 ADD PRIMARY KEY (`PageBlockID`);

--
-- Indexes for table `bx_pageac_rules`
--
ALTER TABLE `bx_pageac_rules`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bx_pageac_top_menu_visibility`
--
ALTER TABLE `bx_pageac_top_menu_visibility`
 ADD PRIMARY KEY (`MenuItemID`);

--
-- Indexes for table `bx_photos_cmts`
--
ALTER TABLE `bx_photos_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_photos_cmts_albums`
--
ALTER TABLE `bx_photos_cmts_albums`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_photos_favorites`
--
ALTER TABLE `bx_photos_favorites`
 ADD PRIMARY KEY (`ID`,`Profile`);

--
-- Indexes for table `bx_photos_main`
--
ALTER TABLE `bx_photos_main`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Hash` (`Hash`), ADD KEY `Owner` (`account_id`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `bx_photos_main_newdb`
--
ALTER TABLE `bx_photos_main_newdb`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Hash` (`Hash`), ADD KEY `Owner` (`Owner`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `bx_photos_main_olddb_backup`
--
ALTER TABLE `bx_photos_main_olddb_backup`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Hash` (`Hash`), ADD KEY `Owner` (`Owner`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Desc`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `bx_photos_rating`
--
ALTER TABLE `bx_photos_rating`
 ADD UNIQUE KEY `med_id` (`gal_id`);

--
-- Indexes for table `bx_photos_views_track`
--
ALTER TABLE `bx_photos_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_photos_voting_track`
--
ALTER TABLE `bx_photos_voting_track`
 ADD KEY `med_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_pmt_cart`
--
ALTER TABLE `bx_pmt_cart`
 ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `bx_pmt_modules`
--
ALTER TABLE `bx_pmt_modules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`);

--
-- Indexes for table `bx_pmt_providers`
--
ALTER TABLE `bx_pmt_providers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_pmt_providers_options`
--
ALTER TABLE `bx_pmt_providers_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `bx_pmt_transactions`
--
ALTER TABLE `bx_pmt_transactions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_pmt_transactions_pending`
--
ALTER TABLE `bx_pmt_transactions_pending`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_pmt_user_values`
--
ALTER TABLE `bx_pmt_user_values`
 ADD UNIQUE KEY `value` (`user_id`,`option_id`);

--
-- Indexes for table `bx_profile_custom_images`
--
ALTER TABLE `bx_profile_custom_images`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_profile_custom_main`
--
ALTER TABLE `bx_profile_custom_main`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bx_profile_custom_themes`
--
ALTER TABLE `bx_profile_custom_themes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `bx_profile_custom_units`
--
ALTER TABLE `bx_profile_custom_units`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_simple_messenger_messages`
--
ALTER TABLE `bx_simple_messenger_messages`
 ADD PRIMARY KEY (`ID`), ADD KEY `SenderID` (`SenderID`), ADD KEY `RecipientID` (`RecipientID`);

--
-- Indexes for table `bx_simple_messenger_privacy`
--
ALTER TABLE `bx_simple_messenger_privacy`
 ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bx_sites_cmts`
--
ALTER TABLE `bx_sites_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_sites_cmts_track`
--
ALTER TABLE `bx_sites_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_sites_main`
--
ALTER TABLE `bx_sites_main`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `entryUri` (`entryUri`), ADD KEY `date` (`date`), ADD FULLTEXT KEY `title` (`title`,`description`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `bx_sites_rating`
--
ALTER TABLE `bx_sites_rating`
 ADD UNIQUE KEY `sites_id` (`sites_id`);

--
-- Indexes for table `bx_sites_rating_track`
--
ALTER TABLE `bx_sites_rating_track`
 ADD KEY `sites_ip` (`sites_ip`,`sites_id`);

--
-- Indexes for table `bx_sites_stwacc_info`
--
ALTER TABLE `bx_sites_stwacc_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bx_sites_stw_requests`
--
ALTER TABLE `bx_sites_stw_requests`
 ADD PRIMARY KEY (`siteid`), ADD UNIQUE KEY `hash_idx` (`hash`);

--
-- Indexes for table `bx_sites_views_track`
--
ALTER TABLE `bx_sites_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_sounds_cmts`
--
ALTER TABLE `bx_sounds_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_sounds_cmts_albums`
--
ALTER TABLE `bx_sounds_cmts_albums`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_sounds_favorites`
--
ALTER TABLE `bx_sounds_favorites`
 ADD PRIMARY KEY (`ID`,`Profile`);

--
-- Indexes for table `bx_sounds_rating`
--
ALTER TABLE `bx_sounds_rating`
 ADD UNIQUE KEY `med_id` (`gal_id`);

--
-- Indexes for table `bx_sounds_views_track`
--
ALTER TABLE `bx_sounds_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_sounds_voting_track`
--
ALTER TABLE `bx_sounds_voting_track`
 ADD KEY `med_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_spy_data`
--
ALTER TABLE `bx_spy_data`
 ADD PRIMARY KEY (`id`), ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `bx_spy_friends_data`
--
ALTER TABLE `bx_spy_friends_data`
 ADD PRIMARY KEY (`id`), ADD KEY `event_id` (`event_id`), ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `bx_spy_handlers`
--
ALTER TABLE `bx_spy_handlers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `handler` (`alert_unit`,`alert_action`,`module_uri`,`module_class`,`module_method`);

--
-- Indexes for table `bx_store_cmts`
--
ALTER TABLE `bx_store_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_store_cmts_track`
--
ALTER TABLE `bx_store_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_store_customers`
--
ALTER TABLE `bx_store_customers`
 ADD KEY `file_id` (`file_id`,`client_id`);

--
-- Indexes for table `bx_store_forum`
--
ALTER TABLE `bx_store_forum`
 ADD PRIMARY KEY (`forum_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `forum_uri` (`forum_uri`), ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `bx_store_forum_actions_log`
--
ALTER TABLE `bx_store_forum_actions_log`
 ADD KEY `action_when` (`action_when`);

--
-- Indexes for table `bx_store_forum_attachments`
--
ALTER TABLE `bx_store_forum_attachments`
 ADD PRIMARY KEY (`att_hash`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `bx_store_forum_cat`
--
ALTER TABLE `bx_store_forum_cat`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `cat_order` (`cat_order`), ADD KEY `cat_uri` (`cat_uri`);

--
-- Indexes for table `bx_store_forum_flag`
--
ALTER TABLE `bx_store_forum_flag`
 ADD PRIMARY KEY (`user`,`topic_id`);

--
-- Indexes for table `bx_store_forum_post`
--
ALTER TABLE `bx_store_forum_post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user` (`user`), ADD KEY `when` (`when`);

--
-- Indexes for table `bx_store_forum_signatures`
--
ALTER TABLE `bx_store_forum_signatures`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_store_forum_topic`
--
ALTER TABLE `bx_store_forum_topic`
 ADD PRIMARY KEY (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `forum_id_2` (`forum_id`,`when`), ADD KEY `topic_uri` (`topic_uri`);

--
-- Indexes for table `bx_store_forum_user`
--
ALTER TABLE `bx_store_forum_user`
 ADD PRIMARY KEY (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `bx_store_forum_user_activity`
--
ALTER TABLE `bx_store_forum_user_activity`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `bx_store_forum_user_stat`
--
ALTER TABLE `bx_store_forum_user_stat`
 ADD KEY `user` (`user`);

--
-- Indexes for table `bx_store_forum_vote`
--
ALTER TABLE `bx_store_forum_vote`
 ADD PRIMARY KEY (`user_name`,`post_id`);

--
-- Indexes for table `bx_store_products`
--
ALTER TABLE `bx_store_products`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `author_id` (`author_id`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `bx_store_product_files`
--
ALTER TABLE `bx_store_product_files`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_store_product_images`
--
ALTER TABLE `bx_store_product_images`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_store_product_videos`
--
ALTER TABLE `bx_store_product_videos`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `bx_store_rating`
--
ALTER TABLE `bx_store_rating`
 ADD UNIQUE KEY `gal_id` (`gal_id`);

--
-- Indexes for table `bx_store_rating_track`
--
ALTER TABLE `bx_store_rating_track`
 ADD KEY `gal_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_store_views_track`
--
ALTER TABLE `bx_store_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_videos_cmts`
--
ALTER TABLE `bx_videos_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_videos_cmts_albums`
--
ALTER TABLE `bx_videos_cmts_albums`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_videos_favorites`
--
ALTER TABLE `bx_videos_favorites`
 ADD PRIMARY KEY (`ID`,`Profile`);

--
-- Indexes for table `bx_videos_rating`
--
ALTER TABLE `bx_videos_rating`
 ADD UNIQUE KEY `med_id` (`gal_id`);

--
-- Indexes for table `bx_videos_views_track`
--
ALTER TABLE `bx_videos_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `bx_videos_voting_track`
--
ALTER TABLE `bx_videos_voting_track`
 ADD KEY `med_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `bx_wall_comments`
--
ALTER TABLE `bx_wall_comments`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `bx_wall_comments_track`
--
ALTER TABLE `bx_wall_comments_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `bx_wall_events`
--
ALTER TABLE `bx_wall_events`
 ADD PRIMARY KEY (`id`), ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `bx_wall_handlers`
--
ALTER TABLE `bx_wall_handlers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `handler` (`alert_unit`,`alert_action`,`module_uri`,`module_class`,`module_method`);

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
 ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_list_items`
--
ALTER TABLE `cart_list_items`
 ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `cart_list_recipte`
--
ALTER TABLE `cart_list_recipte`
 ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `coverphotos`
--
ALTER TABLE `coverphotos`
 ADD PRIMARY KEY (`id`), ADD KEY `ownerId` (`ownerId`);

--
-- Indexes for table `ctz_our_letters`
--
ALTER TABLE `ctz_our_letters`
 ADD UNIQUE KEY `author_id` (`author_id`);

--
-- Indexes for table `dbcsHeadInjections`
--
ALTER TABLE `dbcsHeadInjections`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbcs_ip_address`
--
ALTER TABLE `dbcs_ip_address`
 ADD UNIQUE KEY `dbcs_unique` (`member_id`,`time_stamp`);

--
-- Indexes for table `dol_subs_payments`
--
ALTER TABLE `dol_subs_payments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dol_subs_settings`
--
ALTER TABLE `dol_subs_settings`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Ethnicity`
--
ALTER TABLE `Ethnicity`
 ADD PRIMARY KEY (`ethnicity_id`);

--
-- Indexes for table `Ethnicity_pref`
--
ALTER TABLE `Ethnicity_pref`
 ADD PRIMARY KEY (`ethnicity_pref_id`);

--
-- Indexes for table `family_favourite`
--
ALTER TABLE `family_favourite`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hm_aff_pro_affiliates`
--
ALTER TABLE `hm_aff_pro_affiliates`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_banners`
--
ALTER TABLE `hm_aff_pro_banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_campaigns`
--
ALTER TABLE `hm_aff_pro_campaigns`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_clicks`
--
ALTER TABLE `hm_aff_pro_clicks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_commissions`
--
ALTER TABLE `hm_aff_pro_commissions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_impressions`
--
ALTER TABLE `hm_aff_pro_impressions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_invoices`
--
ALTER TABLE `hm_aff_pro_invoices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_payouts`
--
ALTER TABLE `hm_aff_pro_payouts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hm_aff_pro_settings`
--
ALTER TABLE `hm_aff_pro_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter`
--
ALTER TABLE `letter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letters_default`
--
ALTER TABLE `letters_default`
 ADD PRIMARY KEY (`default_id`);

--
-- Indexes for table `letters_sort`
--
ALTER TABLE `letters_sort`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letters_sort_newdb`
--
ALTER TABLE `letters_sort_newdb`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_caption`
--
ALTER TABLE `letter_caption`
 ADD PRIMARY KEY (`Caption_ID`);

--
-- Indexes for table `letter_newdb`
--
ALTER TABLE `letter_newdb`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_list`
--
ALTER TABLE `like_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_list_family`
--
ALTER TABLE `like_list_family`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `matchdependency`
--
ALTER TABLE `matchdependency`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchfileds`
--
ALTER TABLE `matchfileds`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modzzz_faq_admins`
--
ALTER TABLE `modzzz_faq_admins`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `modzzz_faq_cmts`
--
ALTER TABLE `modzzz_faq_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `modzzz_faq_cmts_track`
--
ALTER TABLE `modzzz_faq_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `modzzz_faq_files`
--
ALTER TABLE `modzzz_faq_files`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_faq_images`
--
ALTER TABLE `modzzz_faq_images`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_faq_main`
--
ALTER TABLE `modzzz_faq_main`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `author_id` (`author_id`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `modzzz_faq_ratehelp`
--
ALTER TABLE `modzzz_faq_ratehelp`
 ADD PRIMARY KEY (`id`,`author_id`);

--
-- Indexes for table `modzzz_faq_rating`
--
ALTER TABLE `modzzz_faq_rating`
 ADD UNIQUE KEY `gal_id` (`gal_id`);

--
-- Indexes for table `modzzz_faq_rating_track`
--
ALTER TABLE `modzzz_faq_rating_track`
 ADD KEY `gal_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `modzzz_faq_sounds`
--
ALTER TABLE `modzzz_faq_sounds`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_faq_videos`
--
ALTER TABLE `modzzz_faq_videos`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_faq_views_track`
--
ALTER TABLE `modzzz_faq_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `modzzz_listing_admins`
--
ALTER TABLE `modzzz_listing_admins`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `modzzz_listing_categ`
--
ALTER TABLE `modzzz_listing_categ`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modzzz_listing_cities`
--
ALTER TABLE `modzzz_listing_cities`
 ADD PRIMARY KEY (`country`,`city`), ADD KEY `lat` (`lat`), ADD KEY `lng` (`lng`);

--
-- Indexes for table `modzzz_listing_claim`
--
ALTER TABLE `modzzz_listing_claim`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `modzzz_listing_cmts`
--
ALTER TABLE `modzzz_listing_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `modzzz_listing_cmts_track`
--
ALTER TABLE `modzzz_listing_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `modzzz_listing_countries`
--
ALTER TABLE `modzzz_listing_countries`
 ADD PRIMARY KEY (`country`), ADD KEY `lat` (`lat`), ADD KEY `lng` (`lng`);

--
-- Indexes for table `modzzz_listing_fans`
--
ALTER TABLE `modzzz_listing_fans`
 ADD PRIMARY KEY (`id_entry`,`id_profile`);

--
-- Indexes for table `modzzz_listing_featured_orders`
--
ALTER TABLE `modzzz_listing_featured_orders`
 ADD PRIMARY KEY (`id`), ADD KEY `featured_order_id` (`buyer_id`,`trans_id`);

--
-- Indexes for table `modzzz_listing_files`
--
ALTER TABLE `modzzz_listing_files`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_listing_forum`
--
ALTER TABLE `modzzz_listing_forum`
 ADD PRIMARY KEY (`forum_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `forum_uri` (`forum_uri`), ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `modzzz_listing_forum_actions_log`
--
ALTER TABLE `modzzz_listing_forum_actions_log`
 ADD KEY `action_when` (`action_when`);

--
-- Indexes for table `modzzz_listing_forum_attachments`
--
ALTER TABLE `modzzz_listing_forum_attachments`
 ADD PRIMARY KEY (`att_hash`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `modzzz_listing_forum_cat`
--
ALTER TABLE `modzzz_listing_forum_cat`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `cat_order` (`cat_order`), ADD KEY `cat_uri` (`cat_uri`);

--
-- Indexes for table `modzzz_listing_forum_flag`
--
ALTER TABLE `modzzz_listing_forum_flag`
 ADD PRIMARY KEY (`user`,`topic_id`);

--
-- Indexes for table `modzzz_listing_forum_post`
--
ALTER TABLE `modzzz_listing_forum_post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user` (`user`), ADD KEY `when` (`when`);

--
-- Indexes for table `modzzz_listing_forum_signatures`
--
ALTER TABLE `modzzz_listing_forum_signatures`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `modzzz_listing_forum_topic`
--
ALTER TABLE `modzzz_listing_forum_topic`
 ADD PRIMARY KEY (`topic_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `forum_id_2` (`forum_id`,`when`), ADD KEY `topic_uri` (`topic_uri`);

--
-- Indexes for table `modzzz_listing_forum_user`
--
ALTER TABLE `modzzz_listing_forum_user`
 ADD PRIMARY KEY (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `modzzz_listing_forum_user_activity`
--
ALTER TABLE `modzzz_listing_forum_user_activity`
 ADD PRIMARY KEY (`user`);

--
-- Indexes for table `modzzz_listing_forum_user_stat`
--
ALTER TABLE `modzzz_listing_forum_user_stat`
 ADD KEY `user` (`user`);

--
-- Indexes for table `modzzz_listing_forum_vote`
--
ALTER TABLE `modzzz_listing_forum_vote`
 ADD PRIMARY KEY (`user_name`,`post_id`);

--
-- Indexes for table `modzzz_listing_images`
--
ALTER TABLE `modzzz_listing_images`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_listing_invoices`
--
ALTER TABLE `modzzz_listing_invoices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modzzz_listing_main`
--
ALTER TABLE `modzzz_listing_main`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `author_id` (`author_id`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `search` (`title`,`desc`,`tags`,`categories`), ADD FULLTEXT KEY `tags` (`tags`), ADD FULLTEXT KEY `categories` (`categories`);

--
-- Indexes for table `modzzz_listing_orders`
--
ALTER TABLE `modzzz_listing_orders`
 ADD PRIMARY KEY (`id`), ADD KEY `profile_id` (`buyer_id`,`order_no`);

--
-- Indexes for table `modzzz_listing_packages`
--
ALTER TABLE `modzzz_listing_packages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modzzz_listing_profiles`
--
ALTER TABLE `modzzz_listing_profiles`
 ADD PRIMARY KEY (`id`), ADD KEY `lat` (`lat`), ADD KEY `lng` (`lng`);

--
-- Indexes for table `modzzz_listing_rating`
--
ALTER TABLE `modzzz_listing_rating`
 ADD UNIQUE KEY `gal_id` (`gal_id`);

--
-- Indexes for table `modzzz_listing_rating_track`
--
ALTER TABLE `modzzz_listing_rating_track`
 ADD KEY `gal_ip` (`gal_ip`,`gal_id`);

--
-- Indexes for table `modzzz_listing_sounds`
--
ALTER TABLE `modzzz_listing_sounds`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_listing_videos`
--
ALTER TABLE `modzzz_listing_videos`
 ADD UNIQUE KEY `entry_id` (`entry_id`,`media_id`);

--
-- Indexes for table `modzzz_listing_views_track`
--
ALTER TABLE `modzzz_listing_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `pdfdetails`
--
ALTER TABLE `pdfdetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pdf_template_agency`
--
ALTER TABLE `pdf_template_agency`
 ADD PRIMARY KEY (`template_agency_id`);

--
-- Indexes for table `pdf_template_data`
--
ALTER TABLE `pdf_template_data`
 ADD PRIMARY KEY (`template_data_id`);

--
-- Indexes for table `pdf_template_master`
--
ALTER TABLE `pdf_template_master`
 ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `pdf_template_user`
--
ALTER TABLE `pdf_template_user`
 ADD PRIMARY KEY (`template_user_id`);

--
-- Indexes for table `places_cmts`
--
ALTER TABLE `places_cmts`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `places_cmts_track`
--
ALTER TABLE `places_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `places_config`
--
ALTER TABLE `places_config`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `places_drawings`
--
ALTER TABLE `places_drawings`
 ADD PRIMARY KEY (`pl_id`);

--
-- Indexes for table `places_kml_files`
--
ALTER TABLE `places_kml_files`
 ADD PRIMARY KEY (`pl_kml_id`), ADD KEY `pl_id` (`pl_id`);

--
-- Indexes for table `places_locations`
--
ALTER TABLE `places_locations`
 ADD PRIMARY KEY (`gmk_id`);

--
-- Indexes for table `places_photos`
--
ALTER TABLE `places_photos`
 ADD PRIMARY KEY (`pl_img_id`);

--
-- Indexes for table `places_places`
--
ALTER TABLE `places_places`
 ADD PRIMARY KEY (`pl_id`), ADD KEY `pl_author_id` (`pl_author_id`), ADD FULLTEXT KEY `pl_name` (`pl_name`,`pl_desc`,`pl_city`,`pl_address`);

--
-- Indexes for table `places_places_cat`
--
ALTER TABLE `places_places_cat`
 ADD PRIMARY KEY (`pl_cat_id`);

--
-- Indexes for table `places_rating`
--
ALTER TABLE `places_rating`
 ADD UNIQUE KEY `med_id` (`places_id`);

--
-- Indexes for table `places_videos`
--
ALTER TABLE `places_videos`
 ADD PRIMARY KEY (`pl_video_id`);

--
-- Indexes for table `places_voting_track`
--
ALTER TABLE `places_voting_track`
 ADD KEY `med_ip` (`places_ip`,`places_id`);

--
-- Indexes for table `Profiles`
--
ALTER TABLE `Profiles`
 ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `Profiles_draft`
--
ALTER TABLE `Profiles_draft`
 ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `Profiles_draft_prev`
--
ALTER TABLE `Profiles_draft_prev`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `NickName` (`NickName`), ADD KEY `Country` (`Country`), ADD KEY `DateOfBirth` (`DateOfBirth`), ADD KEY `DateReg` (`DateReg`), ADD KEY `DateLastNav` (`DateLastNav`), ADD KEY `RpxProfile` (`RpxProfile`), ADD KEY `esase_profileinfo_notify` (`esase_profileinfo_notify`), ADD FULLTEXT KEY `NickName_2` (`NickName`,`City`,`Headline`,`DescriptionMe`,`Tags`);

--
-- Indexes for table `Profiles_prev`
--
ALTER TABLE `Profiles_prev`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `NickName` (`NickName`), ADD KEY `Country` (`Country`), ADD KEY `DateOfBirth` (`DateOfBirth`), ADD KEY `DateReg` (`DateReg`), ADD KEY `DateLastNav` (`DateLastNav`), ADD KEY `RpxProfile` (`RpxProfile`), ADD KEY `Couple` (`Couple`), ADD KEY `FacebookProfile` (`FacebookProfile`), ADD FULLTEXT KEY `NickName_2` (`NickName`,`City`,`Headline`,`DescriptionMe`,`Tags`);

--
-- Indexes for table `profile_status`
--
ALTER TABLE `profile_status`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `qwe_profile_theme_base`
--
ALTER TABLE `qwe_profile_theme_base`
 ADD PRIMARY KEY (`id`), ADD KEY `type` (`type`), ADD KEY `title` (`title`), ADD KEY `file` (`file`);

--
-- Indexes for table `qwe_profile_theme_pages`
--
ALTER TABLE `qwe_profile_theme_pages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qwe_profile_theme_themes`
--
ALTER TABLE `qwe_profile_theme_themes`
 ADD PRIMARY KEY (`profile_id`), ADD KEY `type` (`type`);

--
-- Indexes for table `RayBoardBoards`
--
ALTER TABLE `RayBoardBoards`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayBoardCurrentUsers`
--
ALTER TABLE `RayBoardCurrentUsers`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayBoardUsers`
--
ALTER TABLE `RayBoardUsers`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayChatCurrentUsers`
--
ALTER TABLE `RayChatCurrentUsers`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayChatMemberships`
--
ALTER TABLE `RayChatMemberships`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayChatMembershipsSettings`
--
ALTER TABLE `RayChatMembershipsSettings`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `RayChatMessages`
--
ALTER TABLE `RayChatMessages`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayChatProfiles`
--
ALTER TABLE `RayChatProfiles`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayChatRooms`
--
ALTER TABLE `RayChatRooms`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `RayChatRoomsUsers`
--
ALTER TABLE `RayChatRoomsUsers`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayImContacts`
--
ALTER TABLE `RayImContacts`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayImMessages`
--
ALTER TABLE `RayImMessages`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayImPendings`
--
ALTER TABLE `RayImPendings`
 ADD PRIMARY KEY (`ID`), ADD KEY `RecipientID` (`RecipientID`);

--
-- Indexes for table `RayImProfiles`
--
ALTER TABLE `RayImProfiles`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayMp3Files`
--
ALTER TABLE `RayMp3Files`
 ADD PRIMARY KEY (`ID`), ADD KEY `Owner` (`Owner`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Description`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `RayMp3Tokens`
--
ALTER TABLE `RayMp3Tokens`
 ADD PRIMARY KEY (`ID`,`Token`);

--
-- Indexes for table `RayShoutboxMessages`
--
ALTER TABLE `RayShoutboxMessages`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RayVideoFiles`
--
ALTER TABLE `RayVideoFiles`
 ADD PRIMARY KEY (`ID`), ADD KEY `Owner` (`account_id`), ADD FULLTEXT KEY `ftMain` (`Title`,`Tags`,`Description`,`Categories`), ADD FULLTEXT KEY `ftTags` (`Tags`), ADD FULLTEXT KEY `ftCategories` (`Categories`);

--
-- Indexes for table `RayVideoTokens`
--
ALTER TABLE `RayVideoTokens`
 ADD PRIMARY KEY (`ID`,`Token`);

--
-- Indexes for table `RayVideo_commentsFiles`
--
ALTER TABLE `RayVideo_commentsFiles`
 ADD PRIMARY KEY (`ID`), ADD KEY `Owner` (`Owner`);

--
-- Indexes for table `RayVideo_commentsTokens`
--
ALTER TABLE `RayVideo_commentsTokens`
 ADD PRIMARY KEY (`ID`,`Token`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Social_websites`
--
ALTER TABLE `Social_websites`
 ADD PRIMARY KEY (`website_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
 ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `sys_account_custom_stat_elements`
--
ALTER TABLE `sys_account_custom_stat_elements`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_acl_actions`
--
ALTER TABLE `sys_acl_actions`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_acl_actions_track`
--
ALTER TABLE `sys_acl_actions_track`
 ADD PRIMARY KEY (`IDAction`,`IDMember`);

--
-- Indexes for table `sys_acl_levels`
--
ALTER TABLE `sys_acl_levels`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `sys_acl_levels_features`
--
ALTER TABLE `sys_acl_levels_features`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_acl_levels_members`
--
ALTER TABLE `sys_acl_levels_members`
 ADD PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`);

--
-- Indexes for table `sys_acl_levels_members_backup_5_oct_2015`
--
ALTER TABLE `sys_acl_levels_members_backup_5_oct_2015`
 ADD PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`);

--
-- Indexes for table `sys_acl_levels_members_backup_28_09_2015`
--
ALTER TABLE `sys_acl_levels_members_backup_28_09_2015`
 ADD PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`);

--
-- Indexes for table `sys_acl_level_prices`
--
ALTER TABLE `sys_acl_level_prices`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `type` (`IDLevel`,`Days`);

--
-- Indexes for table `sys_acl_matrix`
--
ALTER TABLE `sys_acl_matrix`
 ADD PRIMARY KEY (`IDLevel`,`IDAction`);

--
-- Indexes for table `sys_admin_ban_list`
--
ALTER TABLE `sys_admin_ban_list`
 ADD PRIMARY KEY (`ProfID`);

--
-- Indexes for table `sys_albums`
--
ALTER TABLE `sys_albums`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Uri` (`Uri`,`Type`,`account_id`), ADD KEY `Owner` (`account_id`);

--
-- Indexes for table `sys_albums_backup`
--
ALTER TABLE `sys_albums_backup`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`), ADD KEY `Owner` (`Owner`);

--
-- Indexes for table `sys_albums_newdb`
--
ALTER TABLE `sys_albums_newdb`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`), ADD KEY `Owner` (`Owner`);

--
-- Indexes for table `sys_albums_objects`
--
ALTER TABLE `sys_albums_objects`
 ADD UNIQUE KEY `id_album` (`id_album`,`id_object`);

--
-- Indexes for table `sys_albums_objects_newdb`
--
ALTER TABLE `sys_albums_objects_newdb`
 ADD UNIQUE KEY `id_album` (`id_album`,`id_object`);

--
-- Indexes for table `sys_albums_objects_newdb_modified`
--
ALTER TABLE `sys_albums_objects_newdb_modified`
 ADD UNIQUE KEY `id_album` (`id_album`,`id_object`);

--
-- Indexes for table `sys_albums_objects_olddb_backup`
--
ALTER TABLE `sys_albums_objects_olddb_backup`
 ADD UNIQUE KEY `id_album` (`id_album`,`id_object`);

--
-- Indexes for table `sys_albums_olddb_backup`
--
ALTER TABLE `sys_albums_olddb_backup`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Uri` (`Uri`,`Type`,`Owner`), ADD KEY `Owner` (`Owner`);

--
-- Indexes for table `sys_alerts`
--
ALTER TABLE `sys_alerts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `alert_handler` (`unit`,`action`,`handler_id`);

--
-- Indexes for table `sys_alerts_handlers`
--
ALTER TABLE `sys_alerts_handlers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sys_antispam_block_log`
--
ALTER TABLE `sys_antispam_block_log`
 ADD KEY `ip` (`ip`), ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `sys_banners`
--
ALTER TABLE `sys_banners`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_banners_clicks`
--
ALTER TABLE `sys_banners_clicks`
 ADD UNIQUE KEY `ID_2` (`ID`,`Date`,`IP`), ADD KEY `ID` (`ID`);

--
-- Indexes for table `sys_banners_shows`
--
ALTER TABLE `sys_banners_shows`
 ADD KEY `ID` (`ID`);

--
-- Indexes for table `sys_block_list`
--
ALTER TABLE `sys_block_list`
 ADD UNIQUE KEY `BlockPair` (`ID`,`Profile`), ADD KEY `ID` (`ID`), ADD KEY `Profile` (`Profile`);

--
-- Indexes for table `sys_box_download`
--
ALTER TABLE `sys_box_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_categories`
--
ALTER TABLE `sys_categories`
 ADD PRIMARY KEY (`Category`,`ID`,`Type`);

--
-- Indexes for table `sys_cmts_profile`
--
ALTER TABLE `sys_cmts_profile`
 ADD PRIMARY KEY (`cmt_id`), ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);

--
-- Indexes for table `sys_cmts_track`
--
ALTER TABLE `sys_cmts_track`
 ADD PRIMARY KEY (`cmt_system_id`,`cmt_id`,`cmt_rate_author_nip`);

--
-- Indexes for table `sys_color_base`
--
ALTER TABLE `sys_color_base`
 ADD UNIQUE KEY `ColorName` (`ColorName`);

--
-- Indexes for table `sys_configuration`
--
ALTER TABLE `sys_configuration`
 ADD PRIMARY KEY (`config_ID`);

--
-- Indexes for table `sys_countries`
--
ALTER TABLE `sys_countries`
 ADD PRIMARY KEY (`ISO2`), ADD KEY `CurrencyCode` (`CurrencyCode`);

--
-- Indexes for table `sys_cron_jobs`
--
ALTER TABLE `sys_cron_jobs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_dnsbl_rules`
--
ALTER TABLE `sys_dnsbl_rules`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_email_templates`
--
ALTER TABLE `sys_email_templates`
 ADD PRIMARY KEY (`ID`), ADD KEY `Name` (`Name`,`LangID`);

--
-- Indexes for table `sys_fave_list`
--
ALTER TABLE `sys_fave_list`
 ADD UNIQUE KEY `HotPair` (`ID`,`Profile`), ADD KEY `ID` (`ID`), ADD KEY `Profile` (`Profile`);

--
-- Indexes for table `sys_friend_list`
--
ALTER TABLE `sys_friend_list`
 ADD UNIQUE KEY `FriendPair` (`ID`,`Profile`), ADD KEY `Profile` (`Profile`);

--
-- Indexes for table `sys_greetings`
--
ALTER TABLE `sys_greetings`
 ADD PRIMARY KEY (`ID`,`Profile`);

--
-- Indexes for table `sys_injections`
--
ALTER TABLE `sys_injections`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_injections_admin`
--
ALTER TABLE `sys_injections_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_ip_list`
--
ALTER TABLE `sys_ip_list`
 ADD PRIMARY KEY (`ID`), ADD KEY `From` (`From`), ADD KEY `To` (`To`);

--
-- Indexes for table `sys_ip_members_visits`
--
ALTER TABLE `sys_ip_members_visits`
 ADD PRIMARY KEY (`ID`), ADD KEY `From` (`From`);

--
-- Indexes for table `sys_localization_categories`
--
ALTER TABLE `sys_localization_categories`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `sys_localization_keys`
--
ALTER TABLE `sys_localization_keys`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Key` (`Key`);

--
-- Indexes for table `sys_localization_languages`
--
ALTER TABLE `sys_localization_languages`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `sys_localization_strings`
--
ALTER TABLE `sys_localization_strings`
 ADD PRIMARY KEY (`IDKey`,`IDLanguage`);

--
-- Indexes for table `sys_localization_string_params`
--
ALTER TABLE `sys_localization_string_params`
 ADD PRIMARY KEY (`IDKey`,`IDParam`);

--
-- Indexes for table `sys_menu_admin`
--
ALTER TABLE `sys_menu_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_admin_top`
--
ALTER TABLE `sys_menu_admin_top`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_bottom`
--
ALTER TABLE `sys_menu_bottom`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_menu_member`
--
ALTER TABLE `sys_menu_member`
 ADD PRIMARY KEY (`ID`), ADD KEY `Parent` (`Parent`);

--
-- Indexes for table `sys_menu_mobile`
--
ALTER TABLE `sys_menu_mobile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_mobile_pages`
--
ALTER TABLE `sys_menu_mobile_pages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `page` (`page`);

--
-- Indexes for table `sys_menu_service`
--
ALTER TABLE `sys_menu_service`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_menu_top`
--
ALTER TABLE `sys_menu_top`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_messages`
--
ALTER TABLE `sys_messages`
 ADD PRIMARY KEY (`ID`), ADD KEY `Pair` (`Sender`,`Recipient`), ADD KEY `TrashNotView` (`TrashNotView`), ADD KEY `Trash` (`Trash`);

--
-- Indexes for table `sys_modules`
--
ALTER TABLE `sys_modules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `path` (`path`), ADD UNIQUE KEY `uri` (`uri`), ADD UNIQUE KEY `class_prefix` (`class_prefix`), ADD UNIQUE KEY `db_prefix` (`db_prefix`);

--
-- Indexes for table `sys_modules_file_tracks`
--
ALTER TABLE `sys_modules_file_tracks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_objects_actions`
--
ALTER TABLE `sys_objects_actions`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_auths`
--
ALTER TABLE `sys_objects_auths`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_captcha`
--
ALTER TABLE `sys_objects_captcha`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_objects_categories`
--
ALTER TABLE `sys_objects_categories`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_charts`
--
ALTER TABLE `sys_objects_charts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `object` (`object`);

--
-- Indexes for table `sys_objects_cmts`
--
ALTER TABLE `sys_objects_cmts`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_editor`
--
ALTER TABLE `sys_objects_editor`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `object` (`object`);

--
-- Indexes for table `sys_objects_member_info`
--
ALTER TABLE `sys_objects_member_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_objects_search`
--
ALTER TABLE `sys_objects_search`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_site_maps`
--
ALTER TABLE `sys_objects_site_maps`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `object` (`object`);

--
-- Indexes for table `sys_objects_social_sharing`
--
ALTER TABLE `sys_objects_social_sharing`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_objects_tag`
--
ALTER TABLE `sys_objects_tag`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_objects_views`
--
ALTER TABLE `sys_objects_views`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_objects_vote`
--
ALTER TABLE `sys_objects_vote`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_options`
--
ALTER TABLE `sys_options`
 ADD PRIMARY KEY (`Name`), ADD KEY `kateg` (`kateg`);

--
-- Indexes for table `sys_options_cats`
--
ALTER TABLE `sys_options_cats`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_page_compose`
--
ALTER TABLE `sys_page_compose`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_page_compose_pages`
--
ALTER TABLE `sys_page_compose_pages`
 ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `sys_page_compose_privacy`
--
ALTER TABLE `sys_page_compose_privacy`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `block` (`user_id`,`block_id`);

--
-- Indexes for table `sys_permalinks`
--
ALTER TABLE `sys_permalinks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `check` (`standard`,`permalink`,`check`);

--
-- Indexes for table `sys_privacy_actions`
--
ALTER TABLE `sys_privacy_actions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `action` (`module_uri`,`name`);

--
-- Indexes for table `sys_privacy_defaults`
--
ALTER TABLE `sys_privacy_defaults`
 ADD PRIMARY KEY (`owner_id`,`action_id`);

--
-- Indexes for table `sys_privacy_groups`
--
ALTER TABLE `sys_privacy_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_privacy_members`
--
ALTER TABLE `sys_privacy_members`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_member` (`group_id`,`member_id`);

--
-- Indexes for table `sys_profiles_match`
--
ALTER TABLE `sys_profiles_match`
 ADD UNIQUE KEY `profile_id` (`profile_id`,`sort`);

--
-- Indexes for table `sys_profiles_match_mails`
--
ALTER TABLE `sys_profiles_match_mails`
 ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `sys_profile_fields`
--
ALTER TABLE `sys_profile_fields`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `sys_profile_rating`
--
ALTER TABLE `sys_profile_rating`
 ADD UNIQUE KEY `med_id` (`pr_id`);

--
-- Indexes for table `sys_profile_views_track`
--
ALTER TABLE `sys_profile_views_track`
 ADD KEY `id` (`id`,`viewer`,`ip`);

--
-- Indexes for table `sys_profile_voting_track`
--
ALTER TABLE `sys_profile_voting_track`
 ADD KEY `pr_ip` (`pr_ip`,`pr_id`);

--
-- Indexes for table `sys_sbs_entries`
--
ALTER TABLE `sys_sbs_entries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `entry` (`subscriber_id`,`subscriber_type`,`subscription_id`,`object_id`);

--
-- Indexes for table `sys_sbs_messages`
--
ALTER TABLE `sys_sbs_messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_sbs_queue`
--
ALTER TABLE `sys_sbs_queue`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_sbs_types`
--
ALTER TABLE `sys_sbs_types`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `subscription` (`unit`,`action`,`template`);

--
-- Indexes for table `sys_sbs_users`
--
ALTER TABLE `sys_sbs_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `subscriber` (`name`,`email`);

--
-- Indexes for table `sys_sessions`
--
ALTER TABLE `sys_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `date` (`date`);

--
-- Indexes for table `sys_shared_sites`
--
ALTER TABLE `sys_shared_sites`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_stat_site`
--
ALTER TABLE `sys_stat_site`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sys_tags`
--
ALTER TABLE `sys_tags`
 ADD PRIMARY KEY (`Tag`,`ObjID`,`Type`);

--
-- Indexes for table `watermarkimages`
--
ALTER TABLE `watermarkimages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yn_tour_stations`
--
ALTER TABLE `yn_tour_stations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yn_tour_tours`
--
ALTER TABLE `yn_tour_tours`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yn_tour_viewed`
--
ALTER TABLE `yn_tour_viewed`
 ADD PRIMARY KEY (`mem_id`,`tour_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
MODIFY `account_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `adoption_type_preference`
--
ALTER TABLE `adoption_type_preference`
MODIFY `adoption_type_preference_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agency_join_request`
--
ALTER TABLE `agency_join_request`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Age_group`
--
ALTER TABLE `Age_group`
MODIFY `Age_group_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `age_group_preference`
--
ALTER TABLE `age_group_preference`
MODIFY `age_group_preference_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `aqb_automailer_mails`
--
ALTER TABLE `aqb_automailer_mails`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `aqb_membership_vouchers_codes`
--
ALTER TABLE `aqb_membership_vouchers_codes`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `aqb_membership_vouchers_transactions`
--
ALTER TABLE `aqb_membership_vouchers_transactions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=637;
--
-- AUTO_INCREMENT for table `aqb_pc_members_blocks`
--
ALTER TABLE `aqb_pc_members_blocks`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2311;
--
-- AUTO_INCREMENT for table `aqb_pts_search_result_layout`
--
ALTER TABLE `aqb_pts_search_result_layout`
MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aqb_smdf_custom_dependencies`
--
ALTER TABLE `aqb_smdf_custom_dependencies`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_arl_comments`
--
ALTER TABLE `bx_arl_comments`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bx_arl_entries`
--
ALTER TABLE `bx_arl_entries`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `bx_avatar_images`
--
ALTER TABLE `bx_avatar_images`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4051;
--
-- AUTO_INCREMENT for table `bx_blogs_cmts`
--
ALTER TABLE `bx_blogs_cmts`
MODIFY `cmt_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `bx_blogs_main`
--
ALTER TABLE `bx_blogs_main`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=303;
--
-- AUTO_INCREMENT for table `bx_blogs_posts`
--
ALTER TABLE `bx_blogs_posts`
MODIFY `PostID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2144;
--
-- AUTO_INCREMENT for table `bx_crss_main`
--
ALTER TABLE `bx_crss_main`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_events_activity`
--
ALTER TABLE `bx_events_activity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=411;
--
-- AUTO_INCREMENT for table `bx_events_cmts`
--
ALTER TABLE `bx_events_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `bx_events_forum`
--
ALTER TABLE `bx_events_forum`
MODIFY `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `bx_events_forum_cat`
--
ALTER TABLE `bx_events_forum_cat`
MODIFY `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_events_forum_post`
--
ALTER TABLE `bx_events_forum_post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_events_forum_topic`
--
ALTER TABLE `bx_events_forum_topic`
MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_events_invite`
--
ALTER TABLE `bx_events_invite`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_events_main`
--
ALTER TABLE `bx_events_main`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `bx_files_cmts`
--
ALTER TABLE `bx_files_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_files_cmts_albums`
--
ALTER TABLE `bx_files_cmts_albums`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_files_main`
--
ALTER TABLE `bx_files_main`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `bx_files_types`
--
ALTER TABLE `bx_files_types`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `bx_forum`
--
ALTER TABLE `bx_forum`
MODIFY `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `bx_forum_cat`
--
ALTER TABLE `bx_forum_cat`
MODIFY `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bx_forum_post`
--
ALTER TABLE `bx_forum_post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=521;
--
-- AUTO_INCREMENT for table `bx_forum_topic`
--
ALTER TABLE `bx_forum_topic`
MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `bx_groups_cmts`
--
ALTER TABLE `bx_groups_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `bx_groups_forum`
--
ALTER TABLE `bx_groups_forum`
MODIFY `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT for table `bx_groups_forum_cat`
--
ALTER TABLE `bx_groups_forum_cat`
MODIFY `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_groups_forum_post`
--
ALTER TABLE `bx_groups_forum_post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `bx_groups_forum_topic`
--
ALTER TABLE `bx_groups_forum_topic`
MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `bx_groups_main`
--
ALTER TABLE `bx_groups_main`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=226;
--
-- AUTO_INCREMENT for table `bx_groups_main_backup`
--
ALTER TABLE `bx_groups_main_backup`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `bx_news_comments`
--
ALTER TABLE `bx_news_comments`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bx_news_entries`
--
ALTER TABLE `bx_news_entries`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `bx_pageac_rules`
--
ALTER TABLE `bx_pageac_rules`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_photos_cmts`
--
ALTER TABLE `bx_photos_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=990;
--
-- AUTO_INCREMENT for table `bx_photos_cmts_albums`
--
ALTER TABLE `bx_photos_cmts_albums`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_photos_main`
--
ALTER TABLE `bx_photos_main`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56283;
--
-- AUTO_INCREMENT for table `bx_photos_main_newdb`
--
ALTER TABLE `bx_photos_main_newdb`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47168;
--
-- AUTO_INCREMENT for table `bx_photos_main_olddb_backup`
--
ALTER TABLE `bx_photos_main_olddb_backup`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46897;
--
-- AUTO_INCREMENT for table `bx_pmt_modules`
--
ALTER TABLE `bx_pmt_modules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `bx_pmt_providers`
--
ALTER TABLE `bx_pmt_providers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bx_pmt_providers_options`
--
ALTER TABLE `bx_pmt_providers_options`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `bx_pmt_transactions`
--
ALTER TABLE `bx_pmt_transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2257;
--
-- AUTO_INCREMENT for table `bx_pmt_transactions_pending`
--
ALTER TABLE `bx_pmt_transactions_pending`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2675;
--
-- AUTO_INCREMENT for table `bx_profile_custom_images`
--
ALTER TABLE `bx_profile_custom_images`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=984;
--
-- AUTO_INCREMENT for table `bx_profile_custom_main`
--
ALTER TABLE `bx_profile_custom_main`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6880;
--
-- AUTO_INCREMENT for table `bx_profile_custom_themes`
--
ALTER TABLE `bx_profile_custom_themes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `bx_profile_custom_units`
--
ALTER TABLE `bx_profile_custom_units`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bx_simple_messenger_messages`
--
ALTER TABLE `bx_simple_messenger_messages`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `bx_sites_cmts`
--
ALTER TABLE `bx_sites_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bx_sites_main`
--
ALTER TABLE `bx_sites_main`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `bx_sites_stwacc_info`
--
ALTER TABLE `bx_sites_stwacc_info`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_sites_stw_requests`
--
ALTER TABLE `bx_sites_stw_requests`
MODIFY `siteid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_sounds_cmts`
--
ALTER TABLE `bx_sounds_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_sounds_cmts_albums`
--
ALTER TABLE `bx_sounds_cmts_albums`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_spy_data`
--
ALTER TABLE `bx_spy_data`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=909;
--
-- AUTO_INCREMENT for table `bx_spy_friends_data`
--
ALTER TABLE `bx_spy_friends_data`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `bx_spy_handlers`
--
ALTER TABLE `bx_spy_handlers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `bx_store_cmts`
--
ALTER TABLE `bx_store_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_store_forum`
--
ALTER TABLE `bx_store_forum`
MODIFY `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_store_forum_cat`
--
ALTER TABLE `bx_store_forum_cat`
MODIFY `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_store_forum_post`
--
ALTER TABLE `bx_store_forum_post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_store_forum_topic`
--
ALTER TABLE `bx_store_forum_topic`
MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_store_products`
--
ALTER TABLE `bx_store_products`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bx_store_product_files`
--
ALTER TABLE `bx_store_product_files`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_videos_cmts`
--
ALTER TABLE `bx_videos_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `bx_videos_cmts_albums`
--
ALTER TABLE `bx_videos_cmts_albums`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_wall_comments`
--
ALTER TABLE `bx_wall_comments`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bx_wall_events`
--
ALTER TABLE `bx_wall_events`
MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=897;
--
-- AUTO_INCREMENT for table `bx_wall_handlers`
--
ALTER TABLE `bx_wall_handlers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
MODIFY `cart_id` int(111) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cart_list_items`
--
ALTER TABLE `cart_list_items`
MODIFY `item_id` int(111) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `cart_list_recipte`
--
ALTER TABLE `cart_list_recipte`
MODIFY `receipt_id` int(111) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `country_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=229;
--
-- AUTO_INCREMENT for table `coverphotos`
--
ALTER TABLE `coverphotos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dbcsHeadInjections`
--
ALTER TABLE `dbcsHeadInjections`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dol_subs_payments`
--
ALTER TABLE `dol_subs_payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dol_subs_settings`
--
ALTER TABLE `dol_subs_settings`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Ethnicity_pref`
--
ALTER TABLE `Ethnicity_pref`
MODIFY `ethnicity_pref_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `family_favourite`
--
ALTER TABLE `family_favourite`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `hm_aff_pro_affiliates`
--
ALTER TABLE `hm_aff_pro_affiliates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_aff_pro_banners`
--
ALTER TABLE `hm_aff_pro_banners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_campaigns`
--
ALTER TABLE `hm_aff_pro_campaigns`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_aff_pro_clicks`
--
ALTER TABLE `hm_aff_pro_clicks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_commissions`
--
ALTER TABLE `hm_aff_pro_commissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_impressions`
--
ALTER TABLE `hm_aff_pro_impressions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_invoices`
--
ALTER TABLE `hm_aff_pro_invoices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_payouts`
--
ALTER TABLE `hm_aff_pro_payouts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_aff_pro_settings`
--
ALTER TABLE `hm_aff_pro_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `letter`
--
ALTER TABLE `letter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `letters_sort`
--
ALTER TABLE `letters_sort`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `letters_sort_newdb`
--
ALTER TABLE `letters_sort_newdb`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `letter_caption`
--
ALTER TABLE `letter_caption`
MODIFY `Caption_ID` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `letter_newdb`
--
ALTER TABLE `letter_newdb`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `like_list`
--
ALTER TABLE `like_list`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `like_list_family`
--
ALTER TABLE `like_list_family`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `matchdependency`
--
ALTER TABLE `matchdependency`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matchfileds`
--
ALTER TABLE `matchfileds`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modzzz_faq_cmts`
--
ALTER TABLE `modzzz_faq_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `modzzz_faq_main`
--
ALTER TABLE `modzzz_faq_main`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `modzzz_listing_categ`
--
ALTER TABLE `modzzz_listing_categ`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2156;
--
-- AUTO_INCREMENT for table `modzzz_listing_claim`
--
ALTER TABLE `modzzz_listing_claim`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modzzz_listing_cmts`
--
ALTER TABLE `modzzz_listing_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modzzz_listing_featured_orders`
--
ALTER TABLE `modzzz_listing_featured_orders`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modzzz_listing_forum`
--
ALTER TABLE `modzzz_listing_forum`
MODIFY `forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `modzzz_listing_forum_cat`
--
ALTER TABLE `modzzz_listing_forum_cat`
MODIFY `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modzzz_listing_forum_post`
--
ALTER TABLE `modzzz_listing_forum_post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modzzz_listing_forum_topic`
--
ALTER TABLE `modzzz_listing_forum_topic`
MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modzzz_listing_invoices`
--
ALTER TABLE `modzzz_listing_invoices`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modzzz_listing_main`
--
ALTER TABLE `modzzz_listing_main`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `modzzz_listing_orders`
--
ALTER TABLE `modzzz_listing_orders`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modzzz_listing_packages`
--
ALTER TABLE `modzzz_listing_packages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pdfdetails`
--
ALTER TABLE `pdfdetails`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2444;
--
-- AUTO_INCREMENT for table `pdf_template_agency`
--
ALTER TABLE `pdf_template_agency`
MODIFY `template_agency_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pdf_template_data`
--
ALTER TABLE `pdf_template_data`
MODIFY `template_data_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1096;
--
-- AUTO_INCREMENT for table `pdf_template_master`
--
ALTER TABLE `pdf_template_master`
MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pdf_template_user`
--
ALTER TABLE `pdf_template_user`
MODIFY `template_user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2326;
--
-- AUTO_INCREMENT for table `places_cmts`
--
ALTER TABLE `places_cmts`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `places_kml_files`
--
ALTER TABLE `places_kml_files`
MODIFY `pl_kml_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `places_photos`
--
ALTER TABLE `places_photos`
MODIFY `pl_img_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `places_places`
--
ALTER TABLE `places_places`
MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `places_places_cat`
--
ALTER TABLE `places_places_cat`
MODIFY `pl_cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `places_videos`
--
ALTER TABLE `places_videos`
MODIFY `pl_video_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Profiles`
--
ALTER TABLE `Profiles`
MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Profiles_draft`
--
ALTER TABLE `Profiles_draft`
MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Profiles_draft_prev`
--
ALTER TABLE `Profiles_draft_prev`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8463;
--
-- AUTO_INCREMENT for table `Profiles_prev`
--
ALTER TABLE `Profiles_prev`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8463;
--
-- AUTO_INCREMENT for table `profile_status`
--
ALTER TABLE `profile_status`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1774;
--
-- AUTO_INCREMENT for table `qwe_profile_theme_base`
--
ALTER TABLE `qwe_profile_theme_base`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `qwe_profile_theme_pages`
--
ALTER TABLE `qwe_profile_theme_pages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `RayBoardBoards`
--
ALTER TABLE `RayBoardBoards`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayBoardUsers`
--
ALTER TABLE `RayBoardUsers`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayChatMemberships`
--
ALTER TABLE `RayChatMemberships`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayChatMembershipsSettings`
--
ALTER TABLE `RayChatMembershipsSettings`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `RayChatMessages`
--
ALTER TABLE `RayChatMessages`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayChatRooms`
--
ALTER TABLE `RayChatRooms`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `RayChatRoomsUsers`
--
ALTER TABLE `RayChatRoomsUsers`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayImContacts`
--
ALTER TABLE `RayImContacts`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayImMessages`
--
ALTER TABLE `RayImMessages`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayImPendings`
--
ALTER TABLE `RayImPendings`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `RayMp3Files`
--
ALTER TABLE `RayMp3Files`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayShoutboxMessages`
--
ALTER TABLE `RayShoutboxMessages`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RayVideoFiles`
--
ALTER TABLE `RayVideoFiles`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1751;
--
-- AUTO_INCREMENT for table `RayVideo_commentsFiles`
--
ALTER TABLE `RayVideo_commentsFiles`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Social_websites`
--
ALTER TABLE `Social_websites`
MODIFY `website_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_account_custom_stat_elements`
--
ALTER TABLE `sys_account_custom_stat_elements`
MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sys_acl_actions`
--
ALTER TABLE `sys_acl_actions`
MODIFY `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `sys_acl_levels`
--
ALTER TABLE `sys_acl_levels`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sys_acl_levels_features`
--
ALTER TABLE `sys_acl_levels_features`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_acl_level_prices`
--
ALTER TABLE `sys_acl_level_prices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `sys_albums`
--
ALTER TABLE `sys_albums`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18517;
--
-- AUTO_INCREMENT for table `sys_albums_backup`
--
ALTER TABLE `sys_albums_backup`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16638;
--
-- AUTO_INCREMENT for table `sys_albums_newdb`
--
ALTER TABLE `sys_albums_newdb`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17753;
--
-- AUTO_INCREMENT for table `sys_albums_olddb_backup`
--
ALTER TABLE `sys_albums_olddb_backup`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17754;
--
-- AUTO_INCREMENT for table `sys_alerts`
--
ALTER TABLE `sys_alerts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT for table `sys_alerts_handlers`
--
ALTER TABLE `sys_alerts_handlers`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `sys_banners`
--
ALTER TABLE `sys_banners`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_box_download`
--
ALTER TABLE `sys_box_download`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_cmts_profile`
--
ALTER TABLE `sys_cmts_profile`
MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sys_configuration`
--
ALTER TABLE `sys_configuration`
MODIFY `config_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_cron_jobs`
--
ALTER TABLE `sys_cron_jobs`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sys_dnsbl_rules`
--
ALTER TABLE `sys_dnsbl_rules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sys_email_templates`
--
ALTER TABLE `sys_email_templates`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `sys_injections`
--
ALTER TABLE `sys_injections`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sys_injections_admin`
--
ALTER TABLE `sys_injections_admin`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_ip_list`
--
ALTER TABLE `sys_ip_list`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sys_ip_members_visits`
--
ALTER TABLE `sys_ip_members_visits`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70772;
--
-- AUTO_INCREMENT for table `sys_localization_categories`
--
ALTER TABLE `sys_localization_categories`
MODIFY `ID` int(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `sys_localization_keys`
--
ALTER TABLE `sys_localization_keys`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16425;
--
-- AUTO_INCREMENT for table `sys_localization_languages`
--
ALTER TABLE `sys_localization_languages`
MODIFY `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_menu_admin`
--
ALTER TABLE `sys_menu_admin`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `sys_menu_admin_top`
--
ALTER TABLE `sys_menu_admin_top`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sys_menu_bottom`
--
ALTER TABLE `sys_menu_bottom`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sys_menu_member`
--
ALTER TABLE `sys_menu_member`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `sys_menu_mobile`
--
ALTER TABLE `sys_menu_mobile`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sys_menu_mobile_pages`
--
ALTER TABLE `sys_menu_mobile_pages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_menu_service`
--
ALTER TABLE `sys_menu_service`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_menu_top`
--
ALTER TABLE `sys_menu_top`
MODIFY `ID` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=547;
--
-- AUTO_INCREMENT for table `sys_messages`
--
ALTER TABLE `sys_messages`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5206;
--
-- AUTO_INCREMENT for table `sys_modules`
--
ALTER TABLE `sys_modules`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `sys_modules_file_tracks`
--
ALTER TABLE `sys_modules_file_tracks`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4484;
--
-- AUTO_INCREMENT for table `sys_objects_actions`
--
ALTER TABLE `sys_objects_actions`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=378;
--
-- AUTO_INCREMENT for table `sys_objects_auths`
--
ALTER TABLE `sys_objects_auths`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_objects_captcha`
--
ALTER TABLE `sys_objects_captcha`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_objects_categories`
--
ALTER TABLE `sys_objects_categories`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sys_objects_charts`
--
ALTER TABLE `sys_objects_charts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sys_objects_cmts`
--
ALTER TABLE `sys_objects_cmts`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sys_objects_editor`
--
ALTER TABLE `sys_objects_editor`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_objects_member_info`
--
ALTER TABLE `sys_objects_member_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sys_objects_search`
--
ALTER TABLE `sys_objects_search`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sys_objects_site_maps`
--
ALTER TABLE `sys_objects_site_maps`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sys_objects_social_sharing`
--
ALTER TABLE `sys_objects_social_sharing`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sys_objects_tag`
--
ALTER TABLE `sys_objects_tag`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sys_objects_views`
--
ALTER TABLE `sys_objects_views`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sys_objects_vote`
--
ALTER TABLE `sys_objects_vote`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sys_options_cats`
--
ALTER TABLE `sys_options_cats`
MODIFY `ID` int(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `sys_page_compose`
--
ALTER TABLE `sys_page_compose`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1127;
--
-- AUTO_INCREMENT for table `sys_page_compose_privacy`
--
ALTER TABLE `sys_page_compose_privacy`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=319;
--
-- AUTO_INCREMENT for table `sys_permalinks`
--
ALTER TABLE `sys_permalinks`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `sys_privacy_actions`
--
ALTER TABLE `sys_privacy_actions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `sys_privacy_groups`
--
ALTER TABLE `sys_privacy_groups`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sys_privacy_members`
--
ALTER TABLE `sys_privacy_members`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_profile_fields`
--
ALTER TABLE `sys_profile_fields`
MODIFY `ID` smallint(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `sys_sbs_entries`
--
ALTER TABLE `sys_sbs_entries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=793;
--
-- AUTO_INCREMENT for table `sys_sbs_messages`
--
ALTER TABLE `sys_sbs_messages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_sbs_queue`
--
ALTER TABLE `sys_sbs_queue`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14411;
--
-- AUTO_INCREMENT for table `sys_sbs_types`
--
ALTER TABLE `sys_sbs_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `sys_sbs_users`
--
ALTER TABLE `sys_sbs_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sys_shared_sites`
--
ALTER TABLE `sys_shared_sites`
MODIFY `ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_stat_site`
--
ALTER TABLE `sys_stat_site`
MODIFY `ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `watermarkimages`
--
ALTER TABLE `watermarkimages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2046;
--
-- AUTO_INCREMENT for table `yn_tour_stations`
--
ALTER TABLE `yn_tour_stations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yn_tour_tours`
--
ALTER TABLE `yn_tour_tours`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
