-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: exam2_final
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `b_admin_notify`
--

DROP TABLE IF EXISTS `b_admin_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify`
--

LOCK TABLES `b_admin_notify` WRITE;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_admin_notify_lang`
--

DROP TABLE IF EXISTS `b_admin_notify_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify_lang`
--

LOCK TABLES `b_admin_notify_lang` WRITE;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_agent`
--

DROP TABLE IF EXISTS `b_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_agent`
--

LOCK TABLES `b_agent` WRITE;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` VALUES (1,'main',100,'CEvent::CleanUpAgent();','Y','2018-01-23 10:25:59','2018-01-24 10:25:59',NULL,86400,'N',NULL,'N'),(2,'main',100,'CUser::CleanUpHitAuthAgent();','Y','2018-01-23 10:26:00','2018-01-24 10:26:00',NULL,86400,'N',NULL,'N'),(3,'main',100,'CCaptchaAgent::DeleteOldCaptcha(3600);','Y','2018-01-23 13:24:52','2018-01-23 14:24:52',NULL,3600,'N',NULL,'N'),(4,'main',100,'CUndo::CleanUpOld();','Y','2018-01-23 10:26:11','2018-01-24 10:26:11',NULL,86400,'N',NULL,'N'),(5,'main',100,'CUser::AuthActionsCleanUpAgent();','Y','2018-01-23 10:26:14','2018-01-24 10:26:14',NULL,86400,'N',NULL,'N'),(6,'forum',100,'CForumStat::CleanUp();','Y','2018-01-23 10:26:14','2018-01-24 10:26:14',NULL,86400,'N',NULL,'N'),(7,'forum',100,'CForumFiles::CleanUp();','Y','2018-01-23 10:26:15','2018-01-24 10:26:15',NULL,86400,'N',NULL,'N'),(8,'search',10,'CSearchSuggest::CleanUpAgent();','Y','2018-01-23 10:26:15','2018-01-24 10:26:15',NULL,86400,'N',NULL,'N'),(9,'search',10,'CSearchStatistic::CleanUpAgent();','Y','2018-01-23 10:26:15','2018-01-24 10:26:15',NULL,86400,'N',NULL,'N'),(10,'security',100,'CSecuritySession::CleanUpAgent();','Y','2018-01-23 13:24:52','2018-01-23 13:54:52',NULL,1800,'N',NULL,'N'),(11,'security',100,'CSecurityIPRule::CleanUpAgent();','Y','2018-01-23 13:24:52','2018-01-23 14:24:52',NULL,3600,'N',NULL,'N'),(12,'seo',100,'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();','Y','2018-01-23 13:24:53','2018-01-23 14:24:53',NULL,3600,'N',NULL,'N'),(13,'seo',100,'Bitrix\\Seo\\Adv\\LogTable::clean();','Y','2018-01-23 10:26:15','2018-01-24 10:26:15',NULL,86400,'N',NULL,'N'),(14,'seo',100,'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();','Y','2018-01-23 13:24:53','2018-01-23 14:24:53',NULL,3600,'N',NULL,'N'),(15,'subscribe',100,'CSubscription::CleanUp();','Y','2018-01-23 10:26:15','2018-01-24 03:00:00',NULL,86400,'Y',NULL,'N');
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_app_password`
--

DROP TABLE IF EXISTS `b_app_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_app_password`
--

LOCK TABLES `b_app_password` WRITE;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_b24connector_buttons`
--

DROP TABLE IF EXISTS `b_b24connector_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_b24connector_buttons`
--

LOCK TABLES `b_b24connector_buttons` WRITE;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_bitrixcloud_option`
--

DROP TABLE IF EXISTS `b_bitrixcloud_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_bitrixcloud_option`
--

LOCK TABLES `b_bitrixcloud_option` WRITE;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` VALUES (1,'backup_quota',0,'0','0'),(2,'backup_total_size',0,'0','0'),(3,'backup_last_backup_time',0,'0','1515676156'),(4,'monitoring_expire_time',0,'0','1516016413');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog`
--

DROP TABLE IF EXISTS `b_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog`
--

LOCK TABLES `b_blog` WRITE;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_category`
--

DROP TABLE IF EXISTS `b_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_category`
--

LOCK TABLES `b_blog_category` WRITE;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_comment`
--

DROP TABLE IF EXISTS `b_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_comment`
--

LOCK TABLES `b_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_group`
--

DROP TABLE IF EXISTS `b_blog_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_group`
--

LOCK TABLES `b_blog_group` WRITE;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_image`
--

DROP TABLE IF EXISTS `b_blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_image`
--

LOCK TABLES `b_blog_image` WRITE;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post`
--

DROP TABLE IF EXISTS `b_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post`
--

LOCK TABLES `b_blog_post` WRITE;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_category`
--

DROP TABLE IF EXISTS `b_blog_post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_category`
--

LOCK TABLES `b_blog_post_category` WRITE;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_param`
--

DROP TABLE IF EXISTS `b_blog_post_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_param`
--

LOCK TABLES `b_blog_post_param` WRITE;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_site_path`
--

DROP TABLE IF EXISTS `b_blog_site_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_site_path`
--

LOCK TABLES `b_blog_site_path` WRITE;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet`
--

DROP TABLE IF EXISTS `b_blog_socnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet`
--

LOCK TABLES `b_blog_socnet` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet_rights`
--

DROP TABLE IF EXISTS `b_blog_socnet_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet_rights`
--

LOCK TABLES `b_blog_socnet_rights` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_trackback`
--

DROP TABLE IF EXISTS `b_blog_trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_trackback`
--

LOCK TABLES `b_blog_trackback` WRITE;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user`
--

DROP TABLE IF EXISTS `b_blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user`
--

LOCK TABLES `b_blog_user` WRITE;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
INSERT INTO `b_blog_user` VALUES (1,2,'','',NULL,'',NULL,'2018-01-15 14:08:47','Y'),(2,3,'','',NULL,'',NULL,'2018-01-15 16:19:03','Y'),(3,4,'','',NULL,'',NULL,'2018-01-15 16:19:31','Y'),(4,5,'','',NULL,'',NULL,'2018-01-15 16:19:53','Y'),(5,1,'','',NULL,'',NULL,'2018-01-15 16:22:09','Y');
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2blog`
--

DROP TABLE IF EXISTS `b_blog_user2blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2blog`
--

LOCK TABLES `b_blog_user2blog` WRITE;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2user_group`
--

DROP TABLE IF EXISTS `b_blog_user2user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2user_group`
--

LOCK TABLES `b_blog_user2user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group`
--

DROP TABLE IF EXISTS `b_blog_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group`
--

LOCK TABLES `b_blog_user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` VALUES (1,NULL,'all'),(2,NULL,'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group_perms`
--

DROP TABLE IF EXISTS `b_blog_user_group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group_perms`
--

LOCK TABLES `b_blog_user_group_perms` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_cache_tag`
--

DROP TABLE IF EXISTS `b_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_cache_tag`
--

LOCK TABLES `b_cache_tag` WRITE;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
INSERT INTO `b_cache_tag` VALUES (NULL,NULL,'0:1516703093','**'),('s1','/098','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/098','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/098','/s1/intaro/simplecomp2/098','iblock_id_7'),('s1','/098','/s1/intaro/simplecomp2/098','iblock_id_2'),('s1','/f06','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/f06','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/098','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/9b1','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/9b1','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/9b1','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/6f8','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/6f8','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/e25','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/e25','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/e25','/s1/bitrix/furniture.catalog.index/e25','iblock_id_2'),('s1','/e25','/s1/bitrix/furniture.catalog.index/e25','iblock_id_3'),('s1','/f62','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/f62','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/9b1','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/9b1','/s1/intaro/simplecomp3/9b1','iblock_id_1'),('s1','/e25','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/f06','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/f06','/s1/intaro/simplecomp1/f06','iblock_id_1'),('s1','/f06','/s1/intaro/simplecomp1/f06','iblock_id_2'),('s1','/f06','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/098','/s1/bitrix/news.list/06f','iblock_id_1');
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_captcha`
--

DROP TABLE IF EXISTS `b_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_captcha`
--

LOCK TABLES `b_captcha` WRITE;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_checklist`
--

DROP TABLE IF EXISTS `b_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_checklist`
--

LOCK TABLES `b_checklist` WRITE;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_bucket`
--

DROP TABLE IF EXISTS `b_clouds_file_bucket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_bucket`
--

LOCK TABLES `b_clouds_file_bucket` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_resize`
--

DROP TABLE IF EXISTS `b_clouds_file_resize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_resize`
--

LOCK TABLES `b_clouds_file_resize` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_upload`
--

DROP TABLE IF EXISTS `b_clouds_file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_upload`
--

LOCK TABLES `b_clouds_file_upload` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_component_params`
--

DROP TABLE IF EXISTS `b_component_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_component_params`
--

LOCK TABLES `b_component_params` WRITE;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
INSERT INTO `b_component_params` VALUES (3,'s1','bitrix:news','specialdate_template','/news/index.php','Y','/news/',99,2641,'a:75:{s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:10:\"NEWS_COUNT\";s:1:\"5\";s:10:\"USE_SEARCH\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"Y\";s:8:\"NUM_NEWS\";s:2:\"20\";s:8:\"NUM_DAYS\";s:2:\"30\";s:6:\"YANDEX\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:8:\"SEF_MODE\";s:1:\"Y\";s:10:\"SEF_FOLDER\";s:6:\"/news/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"Y\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"Y\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:6:\"arrows\";s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:8:\"36000000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:20:\"specialdate_template\";s:10:\"USE_REVIEW\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:16:\"USE_SPECIAL_DATE\";s:1:\"Y\";s:9:\"USE_SHARE\";s:1:\"N\";s:12:\"CANONICAL_ID\";s:1:\"5\";s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:17:\"SEF_URL_TEMPLATES\";a:5:{s:4:\"news\";s:0:\"\";s:7:\"section\";s:0:\"\";s:6:\"detail\";s:13:\"#ELEMENT_ID#/\";s:3:\"rss\";s:4:\"rss/\";s:11:\"rss_section\";s:17:\"#SECTION_ID#/rss/\";}}'),(13,'s1','intaro:simplecomp2','.default','/ex2/simplecomp2/index.php','N',NULL,111,400,'a:7:{s:13:\"ALT_IBLOCK_ID\";s:1:\"7\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:17:\"CATALOG_IBLOCK_ID\";s:1:\"2\";s:10:\"DETAIL_URL\";s:0:\"\";s:13:\"PROPERTY_CODE\";s:5:\"BRAND\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";}'),(17,'s1','intaro:simplecomp3','.default','/ex2/simplecomp3/index.php','N',NULL,111,559,'a:10:{s:13:\"ALT_IBLOCK_ID\";s:1:\"7\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:17:\"CATALOG_IBLOCK_ID\";s:1:\"2\";s:20:\"DETAIL_PAGE_TEMPLATE\";s:40:\"catalog_exam/#SECTION_ID#/#ELEMENT_CODE#\";s:13:\"PROPERTY_CODE\";s:5:\"BRAND\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:14:\"NEWS_IBLOCK_ID\";s:1:\"1\";s:20:\"AUTHOR_PROPERTY_CODE\";s:6:\"AUTHOR\";s:18:\"USER_PROPERTY_CODE\";s:14:\"UF_AUTHOR_TYPE\";}');
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_composite_log`
--

DROP TABLE IF EXISTS `b_composite_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_composite_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT '0',
  `PAGE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_composite_log`
--

LOCK TABLES `b_composite_log` WRITE;
/*!40000 ALTER TABLE `b_composite_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_composite_page`
--

DROP TABLE IF EXISTS `b_composite_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_composite_page` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `REWRITES` int(18) NOT NULL DEFAULT '0',
  `SIZE` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_composite_page`
--

LOCK TABLES `b_composite_page` WRITE;
/*!40000 ALTER TABLE `b_composite_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_agreement`
--

DROP TABLE IF EXISTS `b_consent_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_agreement`
--

LOCK TABLES `b_consent_agreement` WRITE;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_field`
--

DROP TABLE IF EXISTS `b_consent_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_field`
--

LOCK TABLES `b_consent_field` WRITE;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_user_consent`
--

DROP TABLE IF EXISTS `b_consent_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_user_consent`
--

LOCK TABLES `b_consent_user_consent` WRITE;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_counter_data`
--

DROP TABLE IF EXISTS `b_counter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_counter_data`
--

LOCK TABLES `b_counter_data` WRITE;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_culture`
--

DROP TABLE IF EXISTS `b_culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_culture`
--

LOCK TABLES `b_culture` WRITE;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` VALUES (1,'ru','ru','DD.MM.YYYY','DD.MM.YYYY HH:MI:SS','#NAME# #LAST_NAME#',1,'UTF-8','Y'),(2,'en','en','MM/DD/YYYY','MM/DD/YYYY H:MI:SS T','#NAME# #LAST_NAME#',0,'UTF-8','Y');
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event`
--

DROP TABLE IF EXISTS `b_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event`
--

LOCK TABLES `b_event` WRITE;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
INSERT INTO `b_event` VALUES (1,'FEEDBACK_FORM',NULL,'s1','a:4:{s:6:\"AUTHOR\";s:96:\"«Пользователь авторизован: 1(admin), данные из формы: admin\";s:12:\"AUTHOR_EMAIL\";s:15:\"admin@gmail.com\";s:8:\"EMAIL_TO\";s:15:\"admin@gmail.com\";s:4:\"TEXT\";s:4:\"test\";}','2018-01-15 14:02:29','2018-01-15 14:02:29','F','Y','ru'),(2,'FEEDBACK_FORM',NULL,'s1','a:4:{s:6:\"AUTHOR\";s:88:\"Пользователь не авторизован, данные из формы: test\";s:12:\"AUTHOR_EMAIL\";s:12:\"test@test.ru\";s:8:\"EMAIL_TO\";s:15:\"admin@gmail.com\";s:4:\"TEXT\";s:4:\"test\";}','2018-01-15 14:02:53','2018-01-15 14:02:53','F','Y','ru'),(3,'FEEDBACK_FORM',NULL,'s1','a:4:{s:6:\"AUTHOR\";s:88:\"Пользователь не авторизован, данные из формы: test\";s:12:\"AUTHOR_EMAIL\";s:12:\"test@test.ru\";s:8:\"EMAIL_TO\";s:15:\"admin@gmail.com\";s:4:\"TEXT\";s:4:\"test\";}','2018-01-15 14:05:21','2018-01-15 14:05:21','F','Y','ru'),(4,'FEEDBACK_FORM',NULL,'s1','a:4:{s:6:\"AUTHOR\";s:96:\"«Пользователь авторизован: 1(admin), данные из формы: admin\";s:12:\"AUTHOR_EMAIL\";s:15:\"admin@gmail.com\";s:8:\"EMAIL_TO\";s:15:\"admin@gmail.com\";s:4:\"TEXT\";s:4:\"test\";}','2018-01-15 14:06:02','2018-01-15 14:06:02','F','Y','ru');
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_attachment`
--

DROP TABLE IF EXISTS `b_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_attachment`
--

LOCK TABLES `b_event_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_log`
--

DROP TABLE IF EXISTS `b_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type` (`AUDIT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_log`
--

LOCK TABLES `b_event_log` WRITE;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
INSERT INTO `b_event_log` VALUES (1,'2018-01-15 10:58:30','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2Fproducts%2F&back_url=%2Fproducts%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:1:{s:4:\"path\";s:21:\"productsex2/index.php\";}'),(2,'2018-01-15 10:58:30','UNKNOWN','SECTION_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2Fproducts%2F&back_url=%2Fproducts%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:1:{s:4:\"path\";s:12:\"products/ex2\";}'),(3,'2018-01-15 10:58:30','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2Fproducts%2F&back_url=%2Fproducts%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:4:\"path\";s:8:\"products\";s:9:\"menu_name\";s:23:\"Верхнее меню\";}'),(4,'2018-01-15 10:58:37','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:22:\"products/ex2/index.php\";}'),(5,'2018-01-15 11:00:06','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:1:{s:4:\"path\";s:13:\"ex2/index.php\";}'),(6,'2018-01-15 11:00:06','UNKNOWN','SECTION_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:1:{s:4:\"path\";s:3:\"ex2\";}'),(7,'2018-01-15 11:00:06','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";s:23:\"Верхнее меню\";}'),(8,'2018-01-15 11:00:08','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:13:\"ex2/index.php\";}'),(9,'2018-01-15 11:00:56','UNKNOWN','MENU_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2Fex2%2F&path=%2Fex2&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),(10,'2018-01-15 11:02:29','SECURITY','FEEDBACK','main','s1','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/ex2/feedback/','s1',1,NULL,'Форма обратной связи'),(11,'2018-01-15 11:02:53','SECURITY','FEEDBACK','main','s1','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36 OPR/50.0.2762.45','/ex2/feedback/','s1',NULL,NULL,'Форма обратной связи'),(12,'2018-01-15 11:05:21','SECURITY','FEEDBACK','main','s1','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36 OPR/50.0.2762.45','/ex2/feedback/?success=fb3042f041954b847bf4b7edf4159d1e','s1',NULL,NULL,'Замена данных в отсылаемом письме – Пользователь не авторизован, данные из формы: test'),(13,'2018-01-15 11:06:02','SECURITY','FEEDBACK','main','s1','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/ex2/feedback/?success=fb3042f041954b847bf4b7edf4159d1e','s1',1,NULL,'Замена данных в отсылаемом письме – «Пользователь авторизован: 1(admin), данные из формы: admin'),(14,'2018-01-15 11:25:12','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fex2%2F&path=%2Fex2%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),(15,'2018-01-15 11:41:47','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fex2%2Fsimplecomp1%2F&path=%2Fex2%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),(16,'2018-01-15 12:51:59','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fex2%2Fsimplecomp2%2F%3Fclear_cache%3DY&path=%2Fex2%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),(17,'2018-01-15 12:52:16','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fex2%2Fsimplecomp2%2F%3Fclear_cache%3DY&path=%2Fex2%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),(18,'2018-01-15 12:52:31','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fex2%2Fsimplecomp2%2F%3Fclear_cache%3DY&path=%2Fex2%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}');
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message`
--

DROP TABLE IF EXISTS `b_event_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message`
--

LOCK TABLES `b_event_message` WRITE;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` VALUES (1,'2018-01-11 13:00:52','NEW_USER','s1','Y','#DEFAULT_EMAIL_FROM#','#DEFAULT_EMAIL_FROM#','#SITE_NAME#: Зарегистрировался новый пользователь','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(2,'2018-01-11 13:00:52','USER_INFO','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Регистрационная информация','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(3,'2018-01-11 13:00:52','USER_PASS_REQUEST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Запрос на смену пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(4,'2018-01-11 13:00:52','USER_PASS_CHANGED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение смены пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(5,'2018-01-11 13:00:52','NEW_USER_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение регистрации нового пользователя','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(6,'2018-01-11 13:00:52','USER_INVITE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Приглашение на сайт','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(7,'2018-01-11 13:00:52','FEEDBACK_FORM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: Сообщение из формы обратной связи','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(8,'2018-01-11 13:01:24','NEW_BLOG_MESSAGE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2018-01-11 13:01:24','NEW_BLOG_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'2018-01-11 13:01:24','NEW_BLOG_COMMENT2COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'2018-01-11 13:01:24','NEW_BLOG_COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2018-01-11 13:01:24','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2018-01-11 13:01:24','BLOG_YOUR_BLOG_TO_USER','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2018-01-11 13:01:24','BLOG_YOU_TO_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2018-01-11 13:01:24','BLOG_BLOG_TO_YOU','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2018-01-11 13:01:24','BLOG_USER_TO_YOUR_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2018-01-11 13:01:24','BLOG_SONET_NEW_POST','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(18,'2018-01-11 13:01:24','BLOG_SONET_NEW_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','Re: #POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{#COMMENT_ID#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{$arParams[\'COMMENT_ID\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(19,'2018-01-11 13:01:24','BLOG_SONET_POST_SHARE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(20,'2018-01-11 13:01:24','BLOG_POST_BROADCAST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2018-01-11 13:02:14','NEW_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2018-01-11 13:02:14','NEW_FORUM_PRIV','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'2018-01-11 13:02:14','NEW_FORUM_PRIVATE_MESSAGE','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2018-01-11 13:02:14','EDIT_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2018-01-11 13:02:14','FORUM_NEW_MESSAGE_MAIL','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#TOPIC_TITLE#','#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n','<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2018-01-11 13:03:08','VIRUS_DETECTED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Обнаружен вирус','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'2018-01-11 13:03:20','SUBSCRIBE_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение подписки','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2018-01-11 13:03:25','VOTE_FOR','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [V] #VOTE_TITLE#','#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.','<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_attachment`
--

DROP TABLE IF EXISTS `b_event_message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_attachment`
--

LOCK TABLES `b_event_message_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_site`
--

DROP TABLE IF EXISTS `b_event_message_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_site`
--

LOCK TABLES `b_event_message_site` WRITE;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1'),(6,'s1'),(7,'s1'),(8,'s1'),(9,'s1'),(10,'s1'),(11,'s1'),(12,'s1'),(13,'s1'),(14,'s1'),(15,'s1'),(16,'s1'),(17,'s1'),(18,'s1'),(19,'s1'),(20,'s1'),(21,'s1'),(22,'s1'),(23,'s1'),(24,'s1'),(25,'s1'),(26,'s1'),(27,'s1'),(28,'s1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_type`
--

DROP TABLE IF EXISTS `b_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_type`
--

LOCK TABLES `b_event_type` WRITE;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` VALUES (1,'ru','NEW_USER','Зарегистрировался новый пользователь','\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n',1),(2,'ru','USER_INFO','Информация о пользователе','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',2),(3,'ru','NEW_USER_CONFIRM','Подтверждение регистрации нового пользователя','\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n',3),(4,'ru','USER_PASS_REQUEST','Запрос на смену пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',4),(5,'ru','USER_PASS_CHANGED','Подтверждение смены пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',5),(6,'ru','USER_INVITE','Приглашение на сайт нового пользователя','#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n',6),(7,'ru','FEEDBACK_FORM','Отправка сообщения через форму обратной связи','#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',7),(8,'en','NEW_USER','New user was registered','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',1),(9,'en','USER_INFO','Account Information','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',2),(10,'en','NEW_USER_CONFIRM','New user registration confirmation','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',3),(11,'en','USER_PASS_REQUEST','Password Change Request','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',4),(12,'en','USER_PASS_CHANGED','Password Change Confirmation','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',5),(13,'en','USER_INVITE','Invitation of a new site user','#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',6),(14,'en','FEEDBACK_FORM','Sending a message using a feedback form','#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',7),(15,'ru','NEW_BLOG_MESSAGE','Новое сообщение в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(16,'ru','NEW_BLOG_COMMENT','Новый комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(17,'ru','NEW_BLOG_COMMENT2COMMENT','Новый комментарий на ваш комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(18,'ru','NEW_BLOG_COMMENT_WITHOUT_TITLE','Новый комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(19,'ru','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','Новый комментарий на ваш комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(20,'ru','BLOG_YOUR_BLOG_TO_USER','Ваш блог был добавлен в друзья','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(21,'ru','BLOG_YOU_TO_BLOG','Вы были добавлены в друзья блога','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(22,'ru','BLOG_BLOG_TO_YOU','К вам в друзья был добавлен блог','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(23,'ru','BLOG_USER_TO_YOUR_BLOG','В ваш блог был добавлен друг','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(24,'ru','BLOG_SONET_NEW_POST','Добавлено новое сообщение','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(25,'ru','BLOG_SONET_NEW_COMMENT','Добавлен новый комментарий','#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(26,'ru','BLOG_SONET_POST_SHARE','Добавлен новый получатель сообщения','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(27,'ru','BLOG_POST_BROADCAST','Добавлено новое сообщение','\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма',100),(28,'en','NEW_BLOG_MESSAGE','New blog message','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(29,'en','NEW_BLOG_COMMENT','New comment in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(30,'en','NEW_BLOG_COMMENT2COMMENT','New comment for your in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(31,'en','NEW_BLOG_COMMENT_WITHOUT_TITLE','New comment in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(32,'en','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','New comment for your in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(33,'en','BLOG_YOUR_BLOG_TO_USER','Your blog has been added to friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(34,'en','BLOG_YOU_TO_BLOG','You have been added to blog friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(35,'en','BLOG_BLOG_TO_YOU','A blog has been added to your friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(36,'en','BLOG_USER_TO_YOUR_BLOG','A friend has been added to your blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(37,'en','BLOG_SONET_NEW_POST','New post added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(38,'en','BLOG_SONET_NEW_COMMENT','Comment added','#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(39,'en','BLOG_SONET_POST_SHARE','New recipient added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(40,'en','BLOG_POST_BROADCAST','New post added','\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient',100),(41,'ru','NEW_FORUM_MESSAGE','Новое сообщение на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100),(42,'ru','NEW_FORUM_PRIV','Приватное письмо посетителю форума','\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения',100),(43,'ru','NEW_FORUM_PRIVATE_MESSAGE','Приватное сообщение','\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение',100),(44,'ru','EDIT_FORUM_MESSAGE','Изменение сообщения на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100),(45,'en','NEW_FORUM_MESSAGE','New forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100),(46,'en','NEW_FORUM_PRIV','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date',100),(47,'en','NEW_FORUM_PRIVATE_MESSAGE','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message',100),(48,'en','EDIT_FORUM_MESSAGE','Changing forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100),(49,'ru','FORUM_NEW_MESSAGE_MAIL','Новое сообщение на форуме в режиме общения по E-Mail','#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n',100),(50,'en','FORUM_NEW_MESSAGE_MAIL','New message at the forum (e-mail messaging mode)','#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n',100),(51,'ru','VIRUS_DETECTED','Обнаружен вирус','#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)',100),(52,'en','VIRUS_DETECTED','Virus detected','#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)',100),(53,'ru','SUBSCRIBE_CONFIRM','Подтверждение подписки','#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n',100),(54,'en','SUBSCRIBE_CONFIRM','Confirmation of subscription','#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n',100),(55,'ru','VOTE_FOR','Новый голос','#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n',100),(56,'en','VOTE_FOR','New vote','#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL',100);
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_favorite`
--

DROP TABLE IF EXISTS `b_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_favorite`
--

LOCK TABLES `b_favorite` WRITE;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file`
--

DROP TABLE IF EXISTS `b_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file`
--

LOCK TABLES `b_file` WRITE;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` VALUES (1,'2018-01-15 11:31:16','iblock',97,117,7208,'image/gif','iblock/82c','82c39f4a42ff58a4f00aed9d16a002c4.gif','9f643eecc497982747178145cc4736a4.gif','',NULL,'7d53fd6e5f9bdc2254bfd1b1fceb5cc4'),(2,'2018-01-15 11:31:29','iblock',97,118,6154,'image/gif','iblock/fec','fecaa6665c9e2a17a56b0030dfa24da5.gif','9baa9f7a5c946e28647383d6d4a7fed2.gif','',NULL,'b6bc62034164da446f42407ddaf4b5fd'),(3,'2018-01-15 11:31:46','iblock',97,115,7024,'image/gif','iblock/8f6','8f696d325d05c3d3d8441aca459255e9.gif','3583b1ad0ff085c4fc5cc3ef35c117f5.gif','',NULL,'5e4d3c6be2f76c8e57707cc3b98287bd'),(4,'2018-01-15 11:30:38','iblock',97,117,8177,'image/gif','iblock/cd8','cd8ff31f67096715d5f6a3f184483c79.gif','e41c3f9d5834738bb4b1a8bda651989d.gif','',NULL,'d2052402cea29429468c1da2434056a8'),(5,'2018-01-11 13:07:28','iblock',75,82,6081,'image/jpeg','iblock/6fb','6fbed0f8c8f18f28b9c1350de5887b45.jpg','2e602c1c22ccb832df21ad28ad5edaad.jpg','',NULL,'3d6953d644741f5422d2587a593c2263'),(6,'2018-01-11 13:07:28','iblock',365,400,93204,'image/jpeg','iblock/f49','f49600eae176d4f9bf56f2fb86f3c2b8.jpg','09812c445d3ee5f5311bbe7e44ee7d6f.jpg','',NULL,'5283ee24cd05daf110e03ab43f4bac3f'),(7,'2018-01-11 13:07:30','iblock',62,75,4431,'image/jpeg','iblock/832','83226e36d0b7715ab4f296b63969609c.jpg','bb30381459dbbbe12e882e632f6b1c53.jpg','',NULL,'18bda3d93fb4e324c88431f8fe55d0d1'),(8,'2018-01-11 13:07:30','iblock',331,400,82283,'image/jpeg','iblock/ab5','ab5c5e9b2d3a4e09f101411dceba6030.jpg','626ca8c573225d46d0b4d809cebb3dae.jpg','',NULL,'af7e00e83208f0d27fcfd0a586889b56'),(9,'2018-01-11 13:07:32','iblock',75,47,3075,'image/jpeg','iblock/3c4','3c4b939a24e5ad10e70e42ea08b680fa.jpg','1f5d4439c837ba415e78b9645ae0d73b.jpg','',NULL,'0c1b03f1f8124195da9ef3ac403ece35'),(10,'2018-01-11 13:07:32','iblock',400,250,29739,'image/jpeg','iblock/dad','dad8da311768c8cf75754703ce677f35.jpg','885f25305f6c920393bf447112730a32.jpg','',NULL,'e79d2e9452ccbd82571df4bf01852040'),(11,'2018-01-11 13:07:35','iblock',75,49,3038,'image/jpeg','iblock/8b2','8b21cd0f8fd3ae604d0d71d03fb0c45a.jpg','ab929afb73ab299a22e03cc039569505.jpg','',NULL,'96374bba59bf9d261b8a02f6b2d6e71d'),(12,'2018-01-11 13:07:36','iblock',400,260,36309,'image/jpeg','iblock/0a0','0a0593bc2fddb47fbac66cd273821f6c.jpg','f2bca316eede55098cab3bfda5b46697.jpg','',NULL,'0e1348b0e7b7e09d7f895c00090eeb96'),(13,'2018-01-11 13:07:39','iblock',75,46,2766,'image/jpeg','iblock/afc','afc9de02ce2a9d28cfee84a1b77135dc.jpg','74a072234e4b35fc24ee618bfc7dc98b.jpg','',NULL,'7c2658a279bd637b08512f9defd16f98'),(14,'2018-01-11 13:07:39','iblock',400,247,26265,'image/jpeg','iblock/ace','ace673f70670d7bcdbeb0f5f96013b66.jpg','6237fa3331d46f6efe0409d7d24cdb25.jpg','',NULL,'273a4a3252059c2b9c58950688feb714'),(15,'2018-01-15 11:50:53','iblock',59,75,4604,'image/jpeg','iblock/5e0','5e0352f5e8ba491a88f58bfdd39692df.jpg','3392f27c38911965c60026ff9c0d3ef6.jpg','',NULL,'759ddcb28cfa28f4f738a771c5dea860'),(16,'2018-01-15 11:50:53','iblock',313,400,57378,'image/jpeg','iblock/ec4','ec48354e64b8127720096d3e53f5de42.jpg','baee3922cc3b782c479845cd9a51aa2b.jpg','',NULL,'69062352802a2fb70aaf922a1d0bb827'),(17,'2018-01-11 13:07:43','iblock',49,75,3877,'image/jpeg','iblock/e1f','e1f1cd56aca6988e498f0332e92e3600.jpg','2bdc35b67545840a286ee2ade1e53cf1.jpg','',NULL,'83e82da486d3aee8154ebe32013ee596'),(18,'2018-01-11 13:07:43','iblock',264,400,96792,'image/jpeg','iblock/d5e','d5e544287b3f2feb40cc8cea5a510605.jpg','9444ca19815887874cfa5ccd2cf9b08e.jpg','',NULL,'7171e0094700d62bc27291c7b410b0d8'),(19,'2018-01-11 13:07:46','iblock',41,75,4223,'image/jpeg','iblock/407','407a50bcf0aeecc5bb5f3699dec0a3d2.jpg','9b1cf849b8732e25002db920755486e9.jpg','',NULL,'776636a0fe1dbc845ea9e0d40603e045'),(20,'2018-01-11 13:07:46','iblock',220,400,65934,'image/jpeg','iblock/6a6','6a6b462751cec9ce0148a04ffec07e1c.jpg','38f3bb38d0be153aa8233f8959141b8d.jpg','',NULL,'d5df0dc45acdde4cf226a92fac94045b'),(21,'2018-01-11 13:07:47','iblock',62,75,4454,'image/jpeg','iblock/486','4862addd2ee0b87d9dc6972dc0058bf7.jpg','d64f02c32d7aec7d187dfb4d6e89c56b.jpg','',NULL,'64d814c44c6d9745a83bfe53ca06bc87'),(22,'2018-01-11 13:07:47','iblock',329,400,78028,'image/jpeg','iblock/489','48994df459034df01a343a1e1efe2687.jpg','445fcbf65c020dbaebf811a58b7ef941.jpg','',NULL,'8fd2f4574d12f852da313d5c3a909546'),(23,'2018-01-11 13:07:49','iblock',50,75,4281,'image/jpeg','iblock/34d','34d6d6382af0d5334f8228637488aa4f.jpg','4d4fcbcf706e07d5920751b96b2390a2.jpg','',NULL,'ca9a25c506a5bb072bfa2fb8f8f4f7b8'),(24,'2018-01-11 13:07:49','iblock',269,400,62994,'image/jpeg','iblock/ced','ced0b30da547ada75d0fcc30b29b9b70.jpg','7412d2f4d2b8e91187d39405c1c331c0.jpg','',NULL,'1c2f06b8a9d08dc2e2bb913296db7781'),(25,'2018-01-11 13:07:51','iblock',32,75,2529,'image/jpeg','iblock/389','38904bac320b657c0dd8a7977a195ff8.jpg','a20a430640daab0d2e80587a991043dc.jpg','',NULL,'2827ed6555e2ad7d1ab9fa05178fd86a'),(26,'2018-01-11 13:07:51','iblock',171,400,43694,'image/jpeg','iblock/7da','7da8dac39cbd7f797f4f813b258eb131.jpg','2b671b45113c251546674131e9681c89.jpg','',NULL,'297208428a1f9ac7e704dc2d038fffc5'),(27,'2018-01-11 13:07:53','iblock',52,75,3543,'image/jpeg','iblock/6db','6dbc01071344cdea880049aca7b73649.jpg','35962bde726c3ffaf7ccdfd9bb607379.jpg','',NULL,'d26bf387d81e2aee9bd568a2fbf9e9cf'),(28,'2018-01-11 13:07:53','iblock',276,400,45830,'image/jpeg','iblock/9e0','9e0d33d2232573ffbbdae3add2330256.jpg','1421f08c8613b257c93f95ca3fd2826d.jpg','',NULL,'da0fbd7b44de760571741022ef770e56'),(29,'2018-01-11 13:07:56','iblock',69,75,4545,'image/jpeg','iblock/336','336a2aad602009a50b555cb566d35e24.jpg','331184f76e4aafea8728856ad06f4487.jpg','',NULL,'7b930d7182ff8df315ab518e35639b70'),(30,'2018-01-11 13:07:56','iblock',366,400,50389,'image/jpeg','iblock/4c5','4c51c7a05024e4fdd1db0bcd0afaf70f.jpg','e26a955a944250ca5980f143faaadfbb.jpg','',NULL,'eeb73a53c1dcf5b3e792efa2d615301b'),(31,'2018-01-11 13:07:59','iblock',52,75,4430,'image/jpeg','iblock/34c','34c96e5ae64c4b64eb83a8386a51a1dc.jpg','3e84c9ae297f66002462ef2782524e1c.jpg','',NULL,'501bbf46014cb1d281b53ea7b83cd0c5'),(32,'2018-01-11 13:08:00','iblock',279,400,60160,'image/jpeg','iblock/884','88476cce7eb81294fe60d617483af935.jpg','16798358158a0c4e8e280370dad92e34.jpg','',NULL,'95830a915d346e71c4c149849c10afe1'),(33,'2018-01-15 11:51:23','iblock',75,74,5105,'image/jpeg','iblock/590','590c0ee674d3cc48f42c39477307f44c.jpg','809194f5dcf2a15a37cdcaa8e3abbe3d.jpg','',NULL,'c650d99532bef755d0ffa9335f470802'),(34,'2018-01-15 11:51:23','iblock',400,394,67705,'image/jpeg','iblock/a73','a73cd2c3aef82a73b159c45d1575e91f.jpg','2883876e37fde7403e471cc9a24ea3e7.jpg','',NULL,'a98e999a2533a72f0e0cb3849a67138e'),(35,'2018-01-11 13:08:03','iblock',75,54,3651,'image/jpeg','iblock/c42','c429f75fe8690f9b6cdb7312a77f8588.jpg','434f471a7920ed00e08fb3916569e1f7.jpg','',NULL,'35315885e9c2132a90402689d9d98228'),(36,'2018-01-11 13:08:03','iblock',400,286,40331,'image/jpeg','iblock/b2e','b2e29ba81bdab540c8246d376fbfd234.jpg','7fe0d47b409d9aa6097128b113e753b9.jpg','',NULL,'db91cd9c30e5b3cc674f7eddee9c5a1b'),(37,'2018-01-11 13:08:08','iblock',75,45,3564,'image/jpeg','iblock/7ea','7eac36be43888387eb27ada7a3919cb6.jpg','a7b9328dab5d8599953605e2d14da0b3.jpg','',NULL,'1f5ad9c2de69e183b83bad77cc962acf'),(38,'2018-01-11 13:08:08','iblock',400,238,42306,'image/jpeg','iblock/6e7','6e794bedb80e729a5f4f66814f827ea8.jpg','e4427787c59b56b70a9c0381453f88dc.jpg','',NULL,'6066afff6bef5b67dc850b1e250443c5'),(39,'2018-01-11 13:08:09','iblock',75,47,2666,'image/jpeg','iblock/3e2','3e2ac8bcabb261ea96287384d902583f.jpg','3413e989dd3239527ed2144bdb285a2b.jpg','',NULL,'4b03f33675077b161fcd9838a1e46871'),(40,'2018-01-11 13:08:09','iblock',400,249,26842,'image/jpeg','iblock/1d0','1d0a0bd47b9afbcdb31b64e9c7757467.jpg','4f2b682c4cc7361e22e669e8faa4f344.jpg','',NULL,'22bc15f7d776a5791911747dc5f30f8d'),(41,'2018-01-15 11:51:37','iblock',75,45,3069,'image/jpeg','iblock/3ea','3eaf69f445eba74969ff6d6e8daf5a44.jpg','26051473b5a68363a0882915e3e020e5.jpg','',NULL,'77546ef250c95307818c6ad777af92a9'),(42,'2018-01-15 11:51:37','iblock',400,239,36150,'image/jpeg','iblock/048','048763e735a60a536ec7a37821aca655.jpg','8c00778d633d1db6aaf29242c1602897.jpg','',NULL,'9a0e6191b30dfb9512873f84150f1b5b'),(43,'2018-01-11 13:08:10','iblock',75,47,3403,'image/jpeg','iblock/929','9298ea87e87e0fcac687ac977d5940c8.jpg','d1a244031379e20a9d7f9cf85227bb2e.jpg','',NULL,'d536cb262a775e7a33c59e741a65fb68'),(44,'2018-01-11 13:08:10','iblock',400,250,34322,'image/jpeg','iblock/27f','27f2285b72c6d331fc138e38a08044b1.jpg','8b88ada642f37df4236b4cd129b85292.jpg','',NULL,'07d3de993206ddb91a7c294628ee6f31'),(45,'2018-01-11 13:08:11','iblock',75,49,3941,'image/jpeg','iblock/b58','b58aed98e3b0a0a391911a19c507ce09.jpg','af64b255f19f75b080d5b934f156c590.jpg','',NULL,'61e525d263d7f8cb5ce1a186de828dd6'),(46,'2018-01-11 13:08:11','iblock',400,261,37746,'image/jpeg','iblock/121','121bbca8374276d3308e4f151cceb415.jpg','b6dabd5a96bb11b68a8d7d2dd9c9a4e0.jpg','',NULL,'f35118d226de5343ce4c15837d724593'),(47,'2018-01-15 11:50:38','iblock',75,59,3571,'image/jpeg','iblock/460','46018acb83b2547566372c7514a3137f.jpg','058550b5373b90e56aacb376028089f4.jpg','',NULL,'32c8acb82b20ed1f321579592ae36679'),(48,'2018-01-15 11:50:38','iblock',400,312,34110,'image/jpeg','iblock/8fc','8fcd8811460421144cb9a7cae49e2ff6.jpg','e2612b793f41a81309fcc54bcbf65783.jpg','',NULL,'63651af8b8f14ef256781e1c2eee6cd0'),(49,'2018-01-15 10:56:23','iblock',75,48,3030,'image/jpeg','iblock/1d3','1d32a5a05a3ef334001e8ddf6a58de87.jpg','8065fe760829c4055200ea4831d72c17.jpg','',NULL,'26181ea78fc81ca40dbea1fe6f5d2119'),(50,'2018-01-15 10:56:23','iblock',400,258,29503,'image/jpeg','iblock/4a7','4a7ba6d813367e1c3e39e8257faa7bc7.jpg','8b6d3cc80b138843463e65ae7a97ffe1.jpg','',NULL,'dbc94ffb6443ec079d467d2fe450af3d'),(51,'2018-01-11 13:08:14','iblock',75,52,2250,'image/jpeg','iblock/410','410e0200a954d68c820b31abfa42afe1.jpg','a89665621b4b083248a5a8016be4e380.jpg','',NULL,'f1f02ba5369942a2b5c58cf449602cbc'),(52,'2018-01-11 13:08:14','iblock',400,279,22919,'image/jpeg','iblock/319','3197424abe861adb1559cdb58df1f788.jpg','93de20bec81a906df174ababa31d856e.jpg','',NULL,'d38a65fd7e48941ed427c044e1028ced'),(53,'2018-01-11 13:08:30','iblock',97,115,5781,'image/gif','iblock/3d3','3d382588e921914314af8028bb86d055.gif','8b0b3bc52fec8070e3561af5d05cd3a8.gif','',NULL,'4a3d72dcce6a28ea9aa42a81e7c61665'),(54,'2018-01-11 13:08:37','iblock',97,116,7345,'image/gif','iblock/5d3','5d321f44a67b78daf75daaf635c162e6.gif','38bf3b317397e56d07fe06731ca3a441.gif','',NULL,'383d86d3cfb7a3513c84f410f09b59a6');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_search`
--

DROP TABLE IF EXISTS `b_file_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_search`
--

LOCK TABLES `b_file_search` WRITE;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_filters`
--

DROP TABLE IF EXISTS `b_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_filters`
--

LOCK TABLES `b_filters` WRITE;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_finder_dest`
--

DROP TABLE IF EXISTS `b_finder_dest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_finder_dest`
--

LOCK TABLES `b_finder_dest` WRITE;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form`
--

DROP TABLE IF EXISTS `b_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form`
--

LOCK TABLES `b_form` WRITE;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_group`
--

DROP TABLE IF EXISTS `b_form_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_group`
--

LOCK TABLES `b_form_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_mail_template`
--

LOCK TABLES `b_form_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_site`
--

DROP TABLE IF EXISTS `b_form_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_site`
--

LOCK TABLES `b_form_2_site` WRITE;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_answer`
--

DROP TABLE IF EXISTS `b_form_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_answer`
--

LOCK TABLES `b_form_answer` WRITE;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm`
--

DROP TABLE IF EXISTS `b_form_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm`
--

LOCK TABLES `b_form_crm` WRITE;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_field`
--

DROP TABLE IF EXISTS `b_form_crm_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_field`
--

LOCK TABLES `b_form_crm_field` WRITE;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_link`
--

DROP TABLE IF EXISTS `b_form_crm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_link`
--

LOCK TABLES `b_form_crm_link` WRITE;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field`
--

DROP TABLE IF EXISTS `b_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field`
--

LOCK TABLES `b_form_field` WRITE;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_filter`
--

DROP TABLE IF EXISTS `b_form_field_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_filter`
--

LOCK TABLES `b_form_field_filter` WRITE;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_validator`
--

DROP TABLE IF EXISTS `b_form_field_validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_validator`
--

LOCK TABLES `b_form_field_validator` WRITE;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_menu`
--

DROP TABLE IF EXISTS `b_form_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_menu`
--

LOCK TABLES `b_form_menu` WRITE;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result`
--

DROP TABLE IF EXISTS `b_form_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result`
--

LOCK TABLES `b_form_result` WRITE;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result_answer`
--

DROP TABLE IF EXISTS `b_form_result_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result_answer`
--

LOCK TABLES `b_form_result_answer` WRITE;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status`
--

DROP TABLE IF EXISTS `b_form_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status`
--

LOCK TABLES `b_form_status` WRITE;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_group`
--

DROP TABLE IF EXISTS `b_form_status_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_group`
--

LOCK TABLES `b_form_status_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_mail_template`
--

LOCK TABLES `b_form_status_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum`
--

DROP TABLE IF EXISTS `b_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum`
--

LOCK TABLES `b_forum` WRITE;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum2site`
--

DROP TABLE IF EXISTS `b_forum2site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum2site`
--

LOCK TABLES `b_forum2site` WRITE;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_dictionary`
--

DROP TABLE IF EXISTS `b_forum_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_dictionary`
--

LOCK TABLES `b_forum_dictionary` WRITE;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` VALUES (1,'[ru] Словарь слов','W'),(2,'[ru] Словарь транслита','T'),(3,'[en] Bad words','W'),(4,'[en] Transliteration','T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_email`
--

DROP TABLE IF EXISTS `b_forum_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_email`
--

LOCK TABLES `b_forum_email` WRITE;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_file`
--

DROP TABLE IF EXISTS `b_forum_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_file`
--

LOCK TABLES `b_forum_file` WRITE;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_filter`
--

DROP TABLE IF EXISTS `b_forum_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_filter`
--

LOCK TABLES `b_forum_filter` WRITE;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` VALUES (1,1,'*пизд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(2,1,'*пизж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(3,1,'*сра%','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(4,1,'анобляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(5,1,'взъеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(6,1,'бля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(7,1,'долбоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(8,1,'дуроеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(9,1,'еби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(10,1,'ебисти*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(11,1,'ебическ*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(12,1,'еблив*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(13,1,'ебло*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(14,1,'еблыс*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(15,1,'ебля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(16,1,'ебс','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(17,1,'ебукент*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(18,1,'ебурген*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(19,1,'коноебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(20,1,'мозгоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(21,1,'мудоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(22,1,'однохуйствен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(23,1,'охуе*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(24,1,'охуи*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(25,1,'охуя*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(26,1,'разъеба*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(27,1,'распиздон*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(28,1,'расхуюж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(29,1,'худоебин*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(30,1,'хуе','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(31,1,'хуебрат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(32,1,'хуеглот*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(33,1,'хуеплёт*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(34,1,'хует*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(35,1,'хуила','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(36,1,'хул?','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(37,1,'хуя','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(38,1,'^бляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(39,1,'^пидор*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(40,1,'^хуев*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(41,1,'^хуем*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(42,1,'^хуй*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(43,1,'^хуяк*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(44,1,'^хуям*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(45,1,'^хуяр*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(46,1,'^хуяч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(47,1,'^ъебал*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(48,1,'^ъебан*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(49,1,'^ъебар*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(50,1,'^ъебат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(51,1,'^ъебен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(52,1,'^ъеби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(53,1,'^ъебис*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(54,1,'^ъебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(55,1,'^ъёбля*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(56,1,'^ъёбну*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(57,1,'^ъебу','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(58,1,'^ъебуч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(59,1,'^ъебыв*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(60,1,'/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is','','','','Y','PTTRN'),(61,3,'angry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(62,3,'ass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(63,3,'asshole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(64,3,'banger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(65,3,'bastard','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(66,3,'batter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(67,3,'bicho','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(68,3,'bisexual','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(69,3,'bitch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(70,3,'blumpkin','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(71,3,'booger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(72,3,'bugger*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(73,3,'bukakke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(74,3,'bull','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(75,3,'bulldyke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(76,3,'bullshit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(77,3,'bunny','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(78,3,'bunnyfuck','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(79,3,'chocha','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(80,3,'chode','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(81,3,'clap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(82,3,'coconuts','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(83,3,'cohones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(84,3,'cojones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(85,3,'coon','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(86,3,'cootch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(87,3,'cooter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(88,3,'cornhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(89,3,'cracka','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(90,3,'crap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(91,3,'cum','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(92,3,'cunnilingus','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(93,3,'cunt*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(94,3,'damn*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(95,3,'dark*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(96,3,'dick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(97,3,'dickhead','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(98,3,'diddle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(99,3,'dildo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(100,3,'dilhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(101,3,'dingleberry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(102,3,'doodle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(103,3,'dork','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(104,3,'dumpster','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(105,3,'faggot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(106,3,'fart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(107,3,'frig','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(108,3,'fuck*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(109,3,'fucker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(110,3,'giz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(111,3,'goatse','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(112,3,'gook','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(113,3,'gringo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(114,3,'hobo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(115,3,'honky','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(116,3,'jackass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(117,3,'jackoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(118,3,'jerkoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(119,3,'jiggaboo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(120,3,'jizz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(121,3,'kike','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(122,3,'mayo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(123,3,'moose','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(124,3,'nigg*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(125,3,'paki','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(126,3,'pecker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(127,3,'piss','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(128,3,'poonanni','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(129,3,'poontang','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(130,3,'prick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(131,3,'punch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(132,3,'queef','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(133,3,'rogue','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(134,3,'sanchez','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(135,3,'schlong','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(136,3,'shit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(137,3,'skank','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(138,3,'spaz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(139,3,'spic','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(140,3,'teabag*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(141,3,'tits','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(142,3,'twat','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(143,3,'twot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(144,3,'vart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(145,3,'wanker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(146,3,'waste','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(147,3,'wetback','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(148,3,'whore','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(149,3,'wigger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(150,3,'wog','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(151,3,'wop','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group`
--

DROP TABLE IF EXISTS `b_forum_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group`
--

LOCK TABLES `b_forum_group` WRITE;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group_lang`
--

DROP TABLE IF EXISTS `b_forum_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group_lang`
--

LOCK TABLES `b_forum_group_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_letter`
--

DROP TABLE IF EXISTS `b_forum_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_letter`
--

LOCK TABLES `b_forum_letter` WRITE;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` VALUES (1,2,'а','АаAa'),(2,2,'б','БбBb'),(3,2,'в','ВвVv'),(4,2,'г','Гг'),(5,2,'д','ДдDd'),(6,2,'е','ЁёЕеEe'),(7,2,'ё','ЁёЕеEe, [Йй]+[Оо]+'),(8,2,'ж','ЖжGg'),(9,2,'з','ЗзZz3'),(10,2,'и','ИиIi'),(11,2,'й','ЙйИиYy'),(12,2,'к','КкKk'),(13,2,'л','ЛлLl'),(14,2,'м','МмMm'),(15,2,'н','НнNn'),(16,2,'о','ОоOo'),(17,2,'п','ПпPp'),(18,2,'р','РрPpRr'),(19,2,'с','СсCc'),(20,2,'т','ТтTt'),(21,2,'у','УуUu'),(22,2,'ф','ФфFf'),(23,2,'х','ХхXx'),(24,2,'ц','ЦцCc'),(25,2,'ч','Чч'),(26,2,'ш','Шш'),(27,2,'щ','Щщ'),(28,2,'ь','ЪъЬь\"\','),(29,2,'ы','Ыы'),(30,2,'ъ','ЪъЬь\"\','),(31,2,'э','Ээ'),(32,2,'ю','Юю, [Йй]+[Оо]+'),(33,2,'я','Яя'),(34,2,'%','[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),(35,2,'^',',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),(36,2,'тся','%'),(37,2,'ться','%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_message`
--

DROP TABLE IF EXISTS `b_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_message`
--

LOCK TABLES `b_forum_message` WRITE;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_perms`
--

DROP TABLE IF EXISTS `b_forum_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_perms`
--

LOCK TABLES `b_forum_perms` WRITE;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_pm_folder`
--

DROP TABLE IF EXISTS `b_forum_pm_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_pm_folder`
--

LOCK TABLES `b_forum_pm_folder` WRITE;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` VALUES (1,'SYSTEM_FOLDER_1',0,0),(2,'SYSTEM_FOLDER_2',0,0),(3,'SYSTEM_FOLDER_3',0,0),(4,'SYSTEM_FOLDER_4',0,0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points`
--

DROP TABLE IF EXISTS `b_forum_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points`
--

LOCK TABLES `b_forum_points` WRITE;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points2post`
--

DROP TABLE IF EXISTS `b_forum_points2post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points2post`
--

LOCK TABLES `b_forum_points2post` WRITE;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points_lang`
--

DROP TABLE IF EXISTS `b_forum_points_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points_lang`
--

LOCK TABLES `b_forum_points_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_private_message`
--

DROP TABLE IF EXISTS `b_forum_private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_private_message`
--

LOCK TABLES `b_forum_private_message` WRITE;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank`
--

DROP TABLE IF EXISTS `b_forum_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank`
--

LOCK TABLES `b_forum_rank` WRITE;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank_lang`
--

DROP TABLE IF EXISTS `b_forum_rank_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank_lang`
--

LOCK TABLES `b_forum_rank_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_stat`
--

DROP TABLE IF EXISTS `b_forum_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_stat`
--

LOCK TABLES `b_forum_stat` WRITE;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_subscribe`
--

DROP TABLE IF EXISTS `b_forum_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_subscribe`
--

LOCK TABLES `b_forum_subscribe` WRITE;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_topic`
--

DROP TABLE IF EXISTS `b_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_topic`
--

LOCK TABLES `b_forum_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user`
--

DROP TABLE IF EXISTS `b_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user`
--

LOCK TABLES `b_forum_user` WRITE;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
INSERT INTO `b_forum_user` VALUES (1,2,NULL,'',NULL,NULL,0,'',NULL,'Y','2018-01-15 14:08:47','2018-01-15',NULL,'','Y',NULL,0,'N','N','N'),(2,3,NULL,'',NULL,NULL,0,'',NULL,'Y','2018-01-15 16:19:03','2018-01-15',NULL,'','Y',NULL,0,'N','N','N'),(3,4,NULL,'',NULL,NULL,0,'',NULL,'Y','2018-01-15 16:19:32','2018-01-15',NULL,'','Y',NULL,0,'N','N','N'),(4,5,NULL,'',NULL,NULL,0,'',NULL,'Y','2018-01-15 16:19:54','2018-01-15',NULL,'','Y',NULL,0,'N','N','N'),(5,1,NULL,'',NULL,NULL,0,'',NULL,'Y','2018-01-15 16:22:10','2018-01-15',NULL,'','Y',NULL,0,'N','N','N');
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_forum`
--

DROP TABLE IF EXISTS `b_forum_user_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_forum`
--

LOCK TABLES `b_forum_user_forum` WRITE;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_points`
--

DROP TABLE IF EXISTS `b_forum_user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_points`
--

LOCK TABLES `b_forum_user_points` WRITE;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_topic`
--

DROP TABLE IF EXISTS `b_forum_user_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_topic`
--

LOCK TABLES `b_forum_user_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_geoip_handlers`
--

DROP TABLE IF EXISTS `b_geoip_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_geoip_handlers`
--

LOCK TABLES `b_geoip_handlers` WRITE;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group`
--

DROP TABLE IF EXISTS `b_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group`
--

LOCK TABLES `b_group` WRITE;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` VALUES (1,'2018-01-11 12:18:58','Y',1,'N','Администраторы','Полный доступ к управлению сайтом.',NULL,NULL),(2,'2018-01-11 12:18:58','Y',2,'Y','Все пользователи (в том числе неавторизованные)','Все пользователи, включая неавторизованных.',NULL,NULL),(3,'2018-01-11 12:18:58','Y',3,'N','Пользователи, имеющие право голосовать за рейтинг','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE'),(4,'2018-01-11 12:18:59','Y',4,'N','Пользователи имеющие право голосовать за авторитет','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE_AUTHORITY'),(5,'2018-01-11 13:04:16','Y',300,'N','Контент-редакторы',NULL,NULL,'content_editor');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_collection_task`
--

DROP TABLE IF EXISTS `b_group_collection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_collection_task`
--

LOCK TABLES `b_group_collection_task` WRITE;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_subordinate`
--

DROP TABLE IF EXISTS `b_group_subordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_subordinate`
--

LOCK TABLES `b_group_subordinate` WRITE;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_task`
--

DROP TABLE IF EXISTS `b_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_task`
--

LOCK TABLES `b_group_task` WRITE;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
INSERT INTO `b_group_task` VALUES (5,22,''),(5,49,'');
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity`
--

DROP TABLE IF EXISTS `b_hlblock_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity`
--

LOCK TABLES `b_hlblock_entity` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_lang`
--

DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_lang`
--

LOCK TABLES `b_hlblock_entity_lang` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_rights`
--

DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_rights`
--

LOCK TABLES `b_hlblock_entity_rights` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys`
--

DROP TABLE IF EXISTS `b_hot_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys`
--

LOCK TABLES `b_hot_keys` WRITE;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` VALUES (1,'Ctrl+Alt+85',139,0),(2,'Ctrl+Alt+80',17,0),(3,'Ctrl+Alt+70',120,0),(4,'Ctrl+Alt+68',117,0),(5,'Ctrl+Alt+81',3,0),(6,'Ctrl+Alt+75',106,0),(7,'Ctrl+Alt+79',133,0),(8,'Ctrl+Alt+70',121,0),(9,'Ctrl+Alt+69',118,0),(10,'Ctrl+Shift+83',87,0),(11,'Ctrl+Shift+88',88,0),(12,'Ctrl+Shift+76',89,0),(13,'Ctrl+Alt+85',139,1),(14,'Ctrl+Alt+80',17,1),(15,'Ctrl+Alt+70',120,1),(16,'Ctrl+Alt+68',117,1),(17,'Ctrl+Alt+81',3,1),(18,'Ctrl+Alt+75',106,1),(19,'Ctrl+Alt+79',133,1),(20,'Ctrl+Alt+70',121,1),(21,'Ctrl+Alt+69',118,1),(22,'Ctrl+Shift+83',87,1),(23,'Ctrl+Shift+88',88,1),(24,'Ctrl+Shift+76',89,1),(25,'Ctrl+Alt+85',139,2),(26,'Ctrl+Alt+80',17,2),(27,'Ctrl+Alt+70',120,2),(28,'Ctrl+Alt+68',117,2),(29,'Ctrl+Alt+81',3,2),(30,'Ctrl+Alt+75',106,2),(31,'Ctrl+Alt+79',133,2),(32,'Ctrl+Alt+70',121,2),(33,'Ctrl+Alt+69',118,2),(34,'Ctrl+Shift+83',87,2),(35,'Ctrl+Shift+88',88,2),(36,'Ctrl+Shift+76',89,2),(37,'Ctrl+Alt+85',139,3),(38,'Ctrl+Alt+80',17,3),(39,'Ctrl+Alt+70',120,3),(40,'Ctrl+Alt+68',117,3),(41,'Ctrl+Alt+81',3,3),(42,'Ctrl+Alt+75',106,3),(43,'Ctrl+Alt+79',133,3),(44,'Ctrl+Alt+70',121,3),(45,'Ctrl+Alt+69',118,3),(46,'Ctrl+Shift+83',87,3),(47,'Ctrl+Shift+88',88,3),(48,'Ctrl+Shift+76',89,3),(49,'Ctrl+Alt+85',139,4),(50,'Ctrl+Alt+80',17,4),(51,'Ctrl+Alt+70',120,4),(52,'Ctrl+Alt+68',117,4),(53,'Ctrl+Alt+81',3,4),(54,'Ctrl+Alt+75',106,4),(55,'Ctrl+Alt+79',133,4),(56,'Ctrl+Alt+70',121,4),(57,'Ctrl+Alt+69',118,4),(58,'Ctrl+Shift+83',87,4),(59,'Ctrl+Shift+88',88,4),(60,'Ctrl+Shift+76',89,4);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys_code`
--

DROP TABLE IF EXISTS `b_hot_keys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys_code`
--

LOCK TABLES `b_hot_keys_code` WRITE;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` VALUES (3,'CAdminTabControl','NextTab();','HK_DB_CADMINTC','HK_DB_CADMINTC_C','tab-container','',0),(5,'btn_new','var d=BX (\'btn_new\'); if (d) location.href = d.href;','HK_DB_BUT_ADD','HK_DB_BUT_ADD_C','btn_new','',0),(6,'btn_excel','var d=BX(\'btn_excel\'); if (d) location.href = d.href;','HK_DB_BUT_EXL','HK_DB_BUT_EXL_C','btn_excel','',0),(7,'btn_settings','var d=BX(\'btn_settings\'); if (d) location.href = d.href;','HK_DB_BUT_OPT','HK_DB_BUT_OPT_C','btn_settings','',0),(8,'btn_list','var d=BX(\'btn_list\'); if (d) location.href = d.href;','HK_DB_BUT_LST','HK_DB_BUT_LST_C','btn_list','',0),(9,'Edit_Save_Button','var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();','HK_DB_BUT_SAVE','HK_DB_BUT_SAVE_C','Edit_Save_Button','',0),(10,'btn_delete','var d=BX(\'btn_delete\'); if (d) location.href = d.href;','HK_DB_BUT_DEL','HK_DB_BUT_DEL_C','btn_delete','',0),(12,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();','HK_DB_FLT_FND','HK_DB_FLT_FND_C','find','',0),(13,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_F','HK_DB_FLT_BUT_F_C','set_filter','',0),(14,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_CNL','HK_DB_FLT_BUT_CNL_C','del_filter','',0),(15,'bx-panel-admin-button-help-icon-id','var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;','HK_DB_BUT_HLP','HK_DB_BUT_HLP_C','bx-panel-admin-button-help-icon-id','',0),(17,'Global','BXHotKeys.ShowSettings();','HK_DB_SHW_L','HK_DB_SHW_L_C','bx-panel-hotkeys','',0),(19,'Edit_Apply_Button','var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();','HK_DB_BUT_APPL','HK_DB_BUT_APPL_C','Edit_Apply_Button','',0),(20,'Edit_Cancel_Button','var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();','HK_DB_BUT_CANCEL','HK_DB_BUT_CANCEL_C','Edit_Cancel_Button','',0),(54,'top_panel_org_fav','','-=AUTONAME=-',NULL,'top_panel_org_fav',NULL,0),(55,'top_panel_module_settings','','-=AUTONAME=-',NULL,'top_panel_module_settings','',0),(56,'top_panel_interface_settings','','-=AUTONAME=-',NULL,'top_panel_interface_settings','',0),(57,'top_panel_help','','-=AUTONAME=-',NULL,'top_panel_help','',0),(58,'top_panel_bizproc_tasks','','-=AUTONAME=-',NULL,'top_panel_bizproc_tasks','',0),(59,'top_panel_add_fav','','-=AUTONAME=-',NULL,'top_panel_add_fav',NULL,0),(60,'top_panel_create_page','','-=AUTONAME=-',NULL,'top_panel_create_page','',0),(62,'top_panel_create_folder','','-=AUTONAME=-',NULL,'top_panel_create_folder','',0),(63,'top_panel_edit_page','','-=AUTONAME=-',NULL,'top_panel_edit_page','',0),(64,'top_panel_page_prop','','-=AUTONAME=-',NULL,'top_panel_page_prop','',0),(65,'top_panel_edit_page_html','','-=AUTONAME=-',NULL,'top_panel_edit_page_html','',0),(67,'top_panel_edit_page_php','','-=AUTONAME=-',NULL,'top_panel_edit_page_php','',0),(68,'top_panel_del_page','','-=AUTONAME=-',NULL,'top_panel_del_page','',0),(69,'top_panel_folder_prop','','-=AUTONAME=-',NULL,'top_panel_folder_prop','',0),(70,'top_panel_access_folder_new','','-=AUTONAME=-',NULL,'top_panel_access_folder_new','',0),(71,'main_top_panel_struct_panel','','-=AUTONAME=-',NULL,'main_top_panel_struct_panel','',0),(72,'top_panel_cache_page','','-=AUTONAME=-',NULL,'top_panel_cache_page','',0),(73,'top_panel_cache_comp','','-=AUTONAME=-',NULL,'top_panel_cache_comp','',0),(74,'top_panel_cache_not','','-=AUTONAME=-',NULL,'top_panel_cache_not','',0),(75,'top_panel_edit_mode','','-=AUTONAME=-',NULL,'top_panel_edit_mode','',0),(76,'top_panel_templ_site_css','','-=AUTONAME=-',NULL,'top_panel_templ_site_css','',0),(77,'top_panel_templ_templ_css','','-=AUTONAME=-',NULL,'top_panel_templ_templ_css','',0),(78,'top_panel_templ_site','','-=AUTONAME=-',NULL,'top_panel_templ_site','',0),(81,'top_panel_debug_time','','-=AUTONAME=-',NULL,'top_panel_debug_time','',0),(82,'top_panel_debug_incl','','-=AUTONAME=-',NULL,'top_panel_debug_incl','',0),(83,'top_panel_debug_sql','','-=AUTONAME=-',NULL,'top_panel_debug_sql',NULL,0),(84,'top_panel_debug_compr','','-=AUTONAME=-',NULL,'top_panel_debug_compr','',0),(85,'MTP_SHORT_URI1','','-=AUTONAME=-',NULL,'MTP_SHORT_URI1','',0),(86,'MTP_SHORT_URI_LIST','','-=AUTONAME=-',NULL,'MTP_SHORT_URI_LIST','',0),(87,'FMST_PANEL_STICKER_ADD','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKER_ADD','',0),(88,'FMST_PANEL_STICKERS_SHOW','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS_SHOW','',0),(89,'FMST_PANEL_CUR_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_CUR_STICKER_LIST','',0),(90,'FMST_PANEL_ALL_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_ALL_STICKER_LIST','',0),(91,'top_panel_menu','var d=BX(\"bx-panel-menu\"); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-menu','',0),(92,'top_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(93,'admin_panel_site','var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-view-tab','',0),(94,'admin_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(96,'top_panel_folder_prop_new','','-=AUTONAME=-',NULL,'top_panel_folder_prop_new','',0),(97,'main_top_panel_structure','','-=AUTONAME=-',NULL,'main_top_panel_structure','',0),(98,'top_panel_clear_cache','','-=AUTONAME=-',NULL,'top_panel_clear_cache','',0),(99,'top_panel_templ','','-=AUTONAME=-',NULL,'top_panel_templ','',0),(100,'top_panel_debug','','-=AUTONAME=-',NULL,'top_panel_debug','',0),(101,'MTP_SHORT_URI','','-=AUTONAME=-',NULL,'MTP_SHORT_URI','',0),(102,'FMST_PANEL_STICKERS','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS','',0),(103,'top_panel_settings','','-=AUTONAME=-',NULL,'top_panel_settings','',0),(104,'top_panel_fav','','-=AUTONAME=-',NULL,'top_panel_fav','',0),(106,'Global','location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';','HK_DB_SHW_HK','','','',0),(107,'top_panel_edit_new','','-=AUTONAME=-',NULL,'top_panel_edit_new','',0),(108,'FLOW_PANEL_CREATE_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_CREATE_WITH_WF','',0),(109,'FLOW_PANEL_EDIT_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_EDIT_WITH_WF','',0),(110,'FLOW_PANEL_HISTORY','','-=AUTONAME=-',NULL,'FLOW_PANEL_HISTORY','',0),(111,'top_panel_create_new','','-=AUTONAME=-',NULL,'top_panel_create_new','',0),(112,'top_panel_create_folder_new','','-=AUTONAME=-',NULL,'top_panel_create_folder_new','',0),(116,'bx-panel-toggle','','-=AUTONAME=-',NULL,'bx-panel-toggle','',0),(117,'bx-panel-small-toggle','','-=AUTONAME=-',NULL,'bx-panel-small-toggle','',0),(118,'bx-panel-expander','var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');','-=AUTONAME=-',NULL,'bx-panel-expander','',0),(119,'bx-panel-hider','var d=BX(\'bx-panel-hider\'); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-hider','',0),(120,'search-textbox-input','var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}','-=AUTONAME=-','','search','',0),(121,'bx-search-input','var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }','-=AUTONAME=-','','bx-search-input','',0),(133,'bx-panel-logout','var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;','-=AUTONAME=-','','bx-panel-logout','',0),(135,'CDialog','var d=BX(\'cancel\'); if (d) d.click();','HK_DB_D_CANCEL','','cancel','',0),(136,'CDialog','var d=BX(\'close\'); if (d) d.click();','HK_DB_D_CLOSE','','close','',0),(137,'CDialog','var d=BX(\'savebtn\'); if (d) d.click();','HK_DB_D_SAVE','','savebtn','',0),(138,'CDialog','var d=BX(\'btn_popup_save\'); if (d) d.click();','HK_DB_D_EDIT_SAVE','','btn_popup_save','',0),(139,'Global','location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;','HK_DB_SHW_U','','','',0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock`
--

DROP TABLE IF EXISTS `b_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock`
--

LOCK TABLES `b_iblock` WRITE;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` VALUES (1,'2018-01-16 10:03:43','news','s1','furniture_news_s1','Новости','Y',500,'#SITE_DIR#/news/','#SITE_DIR#/news/#ID#/',NULL,'',NULL,'','text',24,'Y','N',0,0,'N','furniture_news_s1','289834e428f3e5269d70952ab19f4e9f','Y','N','N','N','L','','S','N','N',2,0,NULL,'','','Разделы','Раздел','Новости','Новость'),(2,'2018-01-15 11:58:15','products','s1','furniture_products_s1','[s1] Продукция','Y',500,'#SITE_DIR#/products/','#SITE_DIR#/products/#SECTION_ID#/#ID#/','#SITE_DIR#/products/#ID#/','',NULL,'','text',24,'Y','N',NULL,NULL,'N','furniture_products_s1','b296c314ce789a67151894f0e8d5acfa','Y','Y','N','N','L','','S',NULL,NULL,2,0,NULL,'','','Разделы','Раздел','Товары','Элемент'),(3,'2018-01-11 13:08:40','products','s1','furniture_services_s1','[s1] Услуги','Y',500,'#SITE_DIR#/services/','#SITE_DIR#/services/#ID#/',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_services_s1','abec2792bf01c63bf631468c7054f98d','Y','Y','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Услуги','Услуга'),(4,'2018-01-11 13:09:08','vacancies','s1','furniture_vacancies_s1','Вакансии','Y',500,'#SITE_DIR#/company/vacancies.php','#SITE_DIR#/company/vacancies.php##ID#',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_vacancies_s1','cec61e29acc249d8cdca27e1311b755a','Y','N','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Вакансии','Вакансия'),(5,'2018-01-15 10:26:35','news','s1','','Canonical','Y',500,'#SITE_DIR#/news/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/news/detail.php?ID=#ELEMENT_ID#',NULL,'',NULL,'','text',24,'N','N',10,7,'N',NULL,NULL,'Y','N','N','N','L','','S',NULL,NULL,1,0,NULL,'','',NULL,NULL,'Элементы','Элемент'),(6,'2018-01-15 11:22:00','products','s1','','Метатеги','Y',500,'#SITE_DIR#/products/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/products/detail.php?ID=#ELEMENT_ID#','#SITE_DIR#/products/list.php?SECTION_ID=#SECTION_ID#','',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','','S',NULL,NULL,1,0,NULL,'','','Разделы','Раздел','Элементы','Элемент'),(7,'2018-01-15 11:46:13','products','s1','','Фирма – производитель','Y',500,'#SITE_DIR#/products/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/products/detail.php?ID=#ELEMENT_ID#','#SITE_DIR#/products/list.php?SECTION_ID=#SECTION_ID#','',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','','S','N','N',1,0,NULL,'','','Разделы','Раздел','Элементы','Элемент');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_cache`
--

DROP TABLE IF EXISTS `b_iblock_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_cache`
--

LOCK TABLES `b_iblock_cache` WRITE;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element`
--

DROP TABLE IF EXISTS `b_iblock_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element`
--

LOCK TABLES `b_iblock_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` VALUES (1,'2018-01-15 17:05:30',1,'2018-01-11 16:04:28',1,1,NULL,'Y','2010-05-25 00:00:00',NULL,500,'Мебельный форум Беларуси',NULL,'С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году.','html',NULL,'<p>С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из <em>Беларуси, Австрии, Латвии, Литвы, России, Польши </em>и<em> Украины</em>. В составе форума состоится пять выставок:&quot;Минский мебельный салон&quot;, &quot;Мебельные технологии&quot;, &quot;ОфисКомфорт&quot;, &quot;Кухня&quot; и &quot;Домотех&quot;. Экспозиция будет строиться по принципу двух тематических секторов:<em> готовой мебели</em> и <em>материалов для ее производства</em>.\r\n \r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе готовой мебели будут представлены:</p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<ul>\r\n \r\n \r\n \r\n  <li>корпусная и мягкая мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для детей и молодежи;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>предметы интерьера;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>кухонная мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для офиса и административных зданий.</li>\r\n\r\n \r\n \r\n </ul>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n<p>Помимо расширенной экспозиции пяти тематических выставок &quot;Экспофорум&quot; подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума &quot;<strong>Народное признание</strong>&quot;. В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n <strong>Мебельный Форум</strong> предоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок <strong>Мебельного Форума</strong>.\r\n \r\n \r\n  <br />\r\n\r\n \r\n </p>\r\n\r\n<p><em>Прием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.</em></p>\r\n\r\n \r\n \r\n \r\n \r\n<ul>\r\n </ul>\r\n\r\n \r\n \r\n \r\n ','html','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ \r\nУЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ БЕЛАРУСИ, АВСТРИИ, \r\nЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ И УКРАИНЫ. \r\nВ СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ \r\nМЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \r\n\"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ \r\nБУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ \r\nСЕКТОРОВ: ГОТОВОЙ МЕБЕЛИ И МАТЕРИАЛОВ ДЛЯ \r\nЕЕ ПРОИЗВОДСТВА. \r\n \r\n\r\nВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ: \r\n\r\n- КОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ; \r\n- ПРЕДМЕТЫ ИНТЕРЬЕРА; \r\n- КУХОННАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ. \r\n\r\nВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА \r\nМЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ \r\nРЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, \r\nОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ \r\nДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ. \r\n \r\n\r\nПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ \r\nВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ \r\nДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В \r\nРАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. \r\nИ ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ \r\nСТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"НАРОДНОЕ \r\nПРИЗНАНИЕ\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ \r\nВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ \r\nСМОТРОМ ОБРАЗЦОВ МЕБЕЛИ. \r\nМЕБЕЛЬНЫЙ ФОРУМ ПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ \r\nВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ \r\nМЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ \r\nПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ \r\nПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ \r\nПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА \r\nБУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ \r\nПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \r\nМЕБЕЛЬНОГО ФОРУМА. \r\n \r\n\r\nПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ \r\nДО 12 АПРЕЛЯ 2010 ГОДА.',1,NULL,NULL,NULL,NULL,NULL,'N','1','','','0',NULL,NULL,NULL),(2,'2018-01-15 17:05:14',1,'2018-01-11 16:04:35',1,1,NULL,'Y','2010-05-26 00:00:00',NULL,500,'Международная мебельная выставка SALON DEL MOBILE',NULL,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. ','html',NULL,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','text','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ \r\nЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ.\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.',1,NULL,NULL,NULL,NULL,NULL,'N','8','','','0',NULL,1,'2018-01-15 13:12:22'),(3,'2018-01-15 17:05:44',1,'2018-01-11 16:04:37',1,1,NULL,'Y','2010-05-27 00:00:00',NULL,500,'Получено прочное водостойкое соединение',NULL,'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. ','html',NULL,'<b>Авторы изобретения</b>: Разиньков Егор Михайлович  и Мещерякова Анна Анатольевна </br>\r\n              Патент Российской Федерации RU2277566</br>\r\n              <h3>Описание изобретения</h3>\r\n              <p>Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\r\n              Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. </p>\r\n\r\n              <p>Изобретение решает задачу по получению прочного и водостойкого клеевого соединения.\r\n              Это достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\r\n              </p>\r\n              <table cellspacing=\"10\">\r\n              <tr>\r\n              <td>Карбамидомеламиноформальдегидная смола</td><td>64,5-79,2</td>\r\n              </tr>	\r\n              <tr>\r\n              <td>10%-ный Раствор щавелевой кислоты</td><td>4,4-20,5</td>\r\n\r\n              </tr>\r\n              <tr>\r\n              <td> Отвердитель для карбамидомеламиноформальдегидной </td><td>0,6-2,0</td>\r\n              </tr>\r\n              <tr>\r\n              <td> смолы 2542</td><td>13,0-15,8</td>\r\n\r\n              </tr>	\r\n              </table>\r\n','html','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ \r\nСОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ \r\nПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, \r\nИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ \r\nИ СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ \r\nКОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО \r\nПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ.\r\nАВТОРЫ ИЗОБРЕТЕНИЯ: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ \r\nИ МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА ПАТЕНТ РОССИЙСКОЙ \r\nФЕДЕРАЦИИ RU2277566 ОПИСАНИЕ ИЗОБРЕТЕНИЯ \r\n\r\nИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ \r\nИ ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ \r\nВ ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ \r\nПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ \r\nПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ \r\nИ ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ \r\nЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ \r\nСМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ \r\nИ ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ \r\nХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \r\n\r\nИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ \r\nПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ. \r\nЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, \r\nВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, \r\nСОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ \r\nМОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ \r\nСМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ \r\nСМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА \r\n- КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ \r\nОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ \r\nПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, \r\nМАС.Ч.: \r\n КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА \r\n   64,5-79,2     \r\n 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ    4,4-20,5 \r\n    \r\n ОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r\n    0,6-2,0     \r\n СМОЛЫ 2542    13,0-15,8',1,NULL,NULL,NULL,NULL,NULL,'N','9','','','0',NULL,1,'2018-01-15 13:08:02'),(4,'2018-01-11 16:07:30',1,'2018-01-11 16:07:28',1,2,1,'Y',NULL,NULL,500,'Герцог',5,'<p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html',6,'        <p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.',1,NULL,NULL,NULL,NULL,NULL,'Y','10','','','-782370160',NULL,NULL,NULL),(5,'2018-01-11 16:07:32',1,'2018-01-11 16:07:30',1,2,1,'Y',NULL,NULL,500,'Монализа',7,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html',8,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.',1,NULL,NULL,NULL,NULL,NULL,'Y','11','','','-48879568',NULL,NULL,NULL),(6,'2018-01-11 16:07:35',1,'2018-01-11 16:07:32',1,2,2,'Y',NULL,NULL,500,'Министр',9,'        <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n      ','html',10,'          <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n        ','html','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','12','','','-2121649046',NULL,NULL,NULL),(7,'2018-01-11 16:07:39',1,'2018-01-11 16:07:36',1,2,2,'Y',NULL,NULL,500,'Хром',11,'        \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n      ','html',12,'          \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n        ','html','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.',1,NULL,NULL,NULL,NULL,NULL,'Y','13','','','-256131656',NULL,NULL,NULL),(8,'2018-01-11 16:07:42',1,'2018-01-11 16:07:39',1,2,3,'Y',NULL,NULL,500,'Ливерпуль',13,'        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n      ','html',14,'        \r\n        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n        \r\n      ','html','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','14','','','1081715374',NULL,NULL,NULL),(9,'2018-01-15 14:50:53',1,'2018-01-11 16:07:42',1,2,1,'Y',NULL,NULL,500,'Изабелла',15,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html',16,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','15','','','0',NULL,NULL,NULL),(10,'2018-01-11 16:07:45',1,'2018-01-11 16:07:43',1,2,1,'Y',NULL,NULL,500,'Аладдин',17,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html',18,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»',1,NULL,NULL,NULL,NULL,NULL,'Y','16','','','1053250178',NULL,NULL,NULL),(11,'2018-01-11 16:07:47',1,'2018-01-11 16:07:46',1,2,1,'Y',NULL,NULL,500,'Джоконда',19,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html',20,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','17','','','-106709740',NULL,NULL,NULL),(12,'2018-01-11 16:07:49',1,'2018-01-11 16:07:47',1,2,1,'Y',NULL,NULL,500,'Флора',21,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html',22,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.',1,NULL,NULL,NULL,NULL,NULL,'Y','18','','','-1053944437',NULL,NULL,NULL),(13,'2018-01-11 16:07:51',1,'2018-01-11 16:07:49',1,2,1,'Y',NULL,NULL,500,'Престиж',23,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html',24,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','19','','','273423738',NULL,NULL,NULL),(14,'2018-01-11 16:07:53',1,'2018-01-11 16:07:51',1,2,1,'Y',NULL,NULL,500,'Лаура',25,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html',26,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','20','','','-281088768',NULL,NULL,NULL),(15,'2018-01-11 16:07:56',1,'2018-01-11 16:07:53',1,2,2,'Y',NULL,NULL,500,'Модерн',27,'         <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html',28,'          <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','21','','','-1185689438',NULL,NULL,NULL),(16,'2018-01-11 16:07:59',1,'2018-01-11 16:07:56',1,2,2,'Y',NULL,NULL,500,'Оптима',29,'         <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \r\n          Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</p><p>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \r\n          обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать \r\n          пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</p><p>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.</p>\r\n        </p>\r\n      ','html',30,'            \r\n        <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</br>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</br>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\n        </p>\r\n      ','html','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\r\n\r\nСЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ \r\nДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ.\r\n\r\nМЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ \r\nРЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА \r\nВ ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ. СЕРИЯ \r\n«ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ \r\nОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ. МЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ \r\nНАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА \r\nПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','22','','','1945328005',NULL,NULL,NULL),(17,'2018-01-11 16:08:01',1,'2018-01-11 16:08:00',1,2,2,'Y',NULL,NULL,500,'Собрание',31,'        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html',32,'        \r\n        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','23','','','1523163777',NULL,NULL,NULL),(18,'2018-01-15 14:51:23',1,'2018-01-11 16:08:01',1,2,2,'Y',NULL,NULL,500,'Лидер',33,'        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n      ','html',34,'        \r\n        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n        \r\n      ','html','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','24','','','0',NULL,NULL,NULL),(19,'2018-01-11 16:08:08',1,'2018-01-11 16:08:03',1,2,2,'Y',NULL,NULL,500,'Президент',35,'        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.</p> \r\n      ','html',36,'        \r\n        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \r\n        Дизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \r\n        Производится ограниченными партиями - не более 10 кресел в год.</p>\r\n        \r\n      ','html','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \r\nДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ \r\nСТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА \r\nВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. ПРОИЗВОДИТСЯ \r\nОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ \r\nВ ГОД.',1,NULL,NULL,NULL,NULL,NULL,'Y','25','','','-1836002422',NULL,NULL,NULL),(20,'2018-01-11 16:08:09',1,'2018-01-11 16:08:08',1,2,2,'Y',NULL,NULL,500,'Плутон',37,'        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n      ','html',38,'        \r\n        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n        \r\n      ','html','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','26','','','1990779533',NULL,1,'2018-01-15 14:23:40'),(21,'2018-01-11 16:08:09',1,'2018-01-11 16:08:09',1,2,3,'Y',NULL,NULL,500,'Парма',39,'        <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r\n        Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r\n        Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>\r\n      ','html',40,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.&lt;/p&gt;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','html','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ \r\nЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\nСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА \r\nБУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\nТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ \r\nВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&LT;P&GT;СТУЛЬЯ ПАРМА \r\nВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ \r\nЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;СТУЛ ПРАКТИЧЕСКИ \r\nЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ \r\nСТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;ТОНИРОВКА ДЕРЕВЯННЫХ \r\nДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ \r\nПАЛИТРЕ.&LT;/P&GT;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;',1,NULL,NULL,NULL,NULL,NULL,'Y','27','','','964589627',NULL,NULL,NULL),(22,'2018-01-15 14:51:37',1,'2018-01-11 16:08:10',1,2,3,'Y',NULL,NULL,500,'Палермо',41,'        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n      ','html',42,'        \r\n        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n        \r\n      ','html','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','28','','','0',NULL,NULL,NULL),(23,'2018-01-11 16:08:11',1,'2018-01-11 16:08:10',1,2,3,'Y',NULL,NULL,500,'Валенсия',43,'        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n      ','html',44,'        \r\n        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n        \r\n      ','html','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.',1,NULL,NULL,NULL,NULL,NULL,'Y','29','','','589017098',NULL,NULL,NULL),(24,'2018-01-11 16:08:12',1,'2018-01-11 16:08:11',1,2,4,'Y',NULL,NULL,500,'Фазенда',45,'        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n      ','html',46,'        \r\n        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n        \r\n      ','html','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','30','','','-1288812514',NULL,NULL,NULL),(25,'2018-01-15 14:50:38',1,'2018-01-11 16:08:12',1,2,4,'Y',NULL,NULL,500,'Эра',47,'        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n      ','html',48,'        \r\n        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n        \r\n      ','html','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.',1,NULL,NULL,NULL,NULL,NULL,'Y','31','','','0',NULL,NULL,NULL),(26,'2018-01-15 13:56:23',1,'2018-01-11 16:08:13',1,2,4,'Y',NULL,NULL,500,'Сити',49,'        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n      ','html',50,'        \r\n        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n        \r\n      ','html','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.',1,NULL,NULL,NULL,NULL,NULL,'Y','32','','','0',NULL,2,'2018-01-15 13:52:06'),(27,'2018-01-11 16:08:14',1,'2018-01-11 16:08:14',1,2,4,'Y',NULL,NULL,500,'Изопласт Хром',51,'        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n      ','html',52,'        \r\n        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n        \r\n      ','html','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','33','','','2001037389',NULL,NULL,NULL),(28,'2018-01-11 16:08:37',1,'2018-01-11 16:08:30',1,3,NULL,'Y',NULL,NULL,500,'Мебель на заказ',53,'Наша компания занимается разработкой мебели на заказ.','html',NULL,'        <p>Наша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\r\n        гардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.</p>\r\n        <p>Мы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\r\n        По Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\r\n        произведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.</p>\r\n        <p>После заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\r\n        где опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\r\n        непосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\r\n        сотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\r\n        вносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.</p>\r\n        \r\n      ','html','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ.\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ \r\nИ КОРПУСНЫЕ ШКАФЫ КУПЕ, ГАРДЕРОБНЫЕ КОМНАТЫ, \r\nПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ \r\nИ ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ. \r\n\r\nМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ \r\nИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, \r\nМАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ. \r\nПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ \r\nСО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ \r\nМЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ \r\nИ ПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ \r\nВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, \r\nСОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ. \r\n\r\nПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ \r\nСРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ \r\nПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО, ГДЕ \r\nОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ \r\nВ ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. \r\nПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ \r\nНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ \r\nРАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ \r\nНЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ \r\nСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ \r\nС ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ \r\nДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ \r\nВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ \r\nЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА \r\nОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.',1,NULL,NULL,NULL,NULL,NULL,'N','5','','','841280321',NULL,NULL,NULL),(29,'2018-01-11 16:08:39',1,'2018-01-11 16:08:38',1,3,NULL,'Y',NULL,NULL,500,'Услуги дизайнера',54,'Мы предлагаем широкий спектр услуг по дизайну мебели.','html',NULL,'        \r\n        <ul>\r\n          <li>Диагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.</li>\r\n          <li>Разработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.</li>\r\n          <li>Разработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие,  рассмотреть его в деталях.</li>\r\n          <li>Подбор и расстановка мебели.</li>\r\n          <li>Декорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.</li>\r\n        </ul>\r\n        \r\n      ','html','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ \r\nМЕБЕЛИ.\r\n- ДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ \r\nПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, \r\nОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, \r\nОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, \r\nРАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ \r\nЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ \r\nЖИЗНИ. \r\n- РАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ \r\nРАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ \r\nПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ \r\nЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ \r\nВАРИАНТ. \r\n- РАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ \r\nМОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, \r\nИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ \r\nПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ \r\nИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ. \r\n- ПОДБОР И РАССТАНОВКА МЕБЕЛИ. \r\n- ДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ \r\nИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ \r\nПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ \r\nЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.',1,NULL,NULL,NULL,NULL,NULL,'N','6','','','-1080381355',NULL,NULL,NULL),(30,'2018-01-11 16:09:01',1,'2018-01-11 16:08:59',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,200,'Продавец-дизайнер (кухни)',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ','html','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\n\r\nТРЕБОВАНИЯ \r\n\r\nУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ \r\nОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ \r\nВ МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ \r\nОБЯЗАННОСТИ \r\n\r\nКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ \r\nМЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ \r\nПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ. УСЛОВИЯ \r\n\r\nЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + \r\nПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ \r\nСОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ',1,NULL,NULL,NULL,NULL,NULL,'N','2','','','1704140047',NULL,NULL,NULL),(31,'2018-01-11 16:09:04',1,'2018-01-11 16:09:02',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,300,'Директор магазина',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ','html','ДИРЕКТОР МАГАЗИНА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ \r\nРАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ \r\nПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ \r\nУПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ \r\nЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ \r\nОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ \r\nЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ \r\nФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И \r\nОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ \r\nОТЧЕТНОСТЬ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ \r\nГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: \r\nОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ \r\nДОХОД ОТ 35000 РУБ',1,NULL,NULL,NULL,NULL,NULL,'N','3','','','192768702',NULL,NULL,NULL),(32,'2018-01-11 16:09:07',1,'2018-01-11 16:09:05',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,400,'Бухгалтер отдела учета готовой продукции',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ','html','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ \r\nРАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ \r\nБУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), \r\nСАМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, \r\nБЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ \r\nМПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ \r\nСЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ \r\nПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ \r\nФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ УСЛОВИЯ \r\n\r\nГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ \r\nГ. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД \r\n10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.',1,NULL,NULL,NULL,NULL,NULL,'N','4','','','790068583',NULL,NULL,NULL),(33,'2018-01-15 13:28:33',1,'2018-01-15 13:28:33',1,5,NULL,'Y',NULL,NULL,500,'http://test.ru/test/',NULL,'','text',NULL,'','text','HTTP://TEST.RU/TEST/\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','33','','','0',NULL,NULL,NULL),(34,'2018-01-15 14:22:24',1,'2018-01-15 14:22:24',1,6,NULL,'Y',NULL,NULL,500,'/products/2/20/',NULL,'','text',NULL,'','text','/PRODUCTS/2/20/\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','34','','','0',NULL,NULL,NULL),(35,'2018-01-15 14:22:50',1,'2018-01-15 14:22:50',1,6,NULL,'Y',NULL,NULL,500,'/products/',NULL,'','text',NULL,'','text','/PRODUCTS/\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','35','','','0',NULL,NULL,NULL),(36,'2018-01-15 14:47:02',1,'2018-01-15 14:47:02',1,7,NULL,'Y',NULL,NULL,500,'Лего',NULL,'','text',NULL,'','text','ЛЕГО\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','36','','','0',NULL,NULL,NULL),(37,'2018-01-15 14:47:20',1,'2018-01-15 14:47:20',1,7,NULL,'Y',NULL,NULL,500,'Супер-стар',NULL,'','text',NULL,'','text','СУПЕР-СТАР\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','37','','','0',NULL,NULL,NULL),(38,'2018-01-15 14:47:27',1,'2018-01-15 14:47:27',1,7,NULL,'Y',NULL,NULL,500,'Пушинка',NULL,'','text',NULL,'','text','ПУШИНКА\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','38','','','0',NULL,NULL,NULL),(39,'2018-01-15 14:47:33',1,'2018-01-15 14:47:33',1,7,NULL,'Y',NULL,NULL,500,'Мечта',NULL,'','text',NULL,'','text','МЕЧТА\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','39','','','0',NULL,NULL,NULL),(40,'2018-01-15 17:06:31',1,'2018-01-15 17:03:37',1,1,NULL,'Y','2018-01-15 00:00:00',NULL,500,'Тестовая новость №1',NULL,'','text',NULL,'','text','ТЕСТОВАЯ НОВОСТЬ №1\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','40','','','0',NULL,NULL,NULL),(41,'2018-01-15 17:06:14',1,'2018-01-15 17:03:46',1,1,NULL,'Y','2018-01-15 00:00:00',NULL,500,'Тестовая новость №2',NULL,'','text',NULL,'','text','ТЕСТОВАЯ НОВОСТЬ №2\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','41','','','0',NULL,NULL,NULL),(42,'2018-01-19 10:15:09',1,'2018-01-15 17:03:56',1,1,NULL,'Y','2018-01-15 00:00:00',NULL,500,'Тестовая новость №3',NULL,'','text',NULL,'','text','ТЕСТОВАЯ НОВОСТЬ №3\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','42','','','0',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_iprop`
--

DROP TABLE IF EXISTS `b_iblock_element_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_iprop`
--

LOCK TABLES `b_iblock_element_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_lock`
--

DROP TABLE IF EXISTS `b_iblock_element_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_lock`
--

LOCK TABLES `b_iblock_element_lock` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_prop_m1`
--

DROP TABLE IF EXISTS `b_iblock_element_prop_m1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_prop_m1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_elem_prop_m1_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m1_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m1_3` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_prop_m1`
--

LOCK TABLES `b_iblock_element_prop_m1` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_prop_m1` DISABLE KEYS */;
INSERT INTO `b_iblock_element_prop_m1` VALUES (1,1,13,'3',NULL,3.0000,''),(2,2,13,'3',NULL,3.0000,''),(3,2,13,'4',NULL,4.0000,''),(5,3,13,'1',NULL,1.0000,''),(6,40,13,'5',NULL,5.0000,''),(7,41,13,'4',NULL,4.0000,''),(8,41,13,'5',NULL,5.0000,''),(10,42,13,'1',NULL,1.0000,''),(11,42,13,'5',NULL,5.0000,''),(12,42,13,'4',NULL,4.0000,'');
/*!40000 ALTER TABLE `b_iblock_element_prop_m1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_prop_m2`
--

DROP TABLE IF EXISTS `b_iblock_element_prop_m2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_prop_m2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_elem_prop_m2_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m2_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m2_3` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_prop_m2`
--

LOCK TABLES `b_iblock_element_prop_m2` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_prop_m2` DISABLE KEYS */;
INSERT INTO `b_iblock_element_prop_m2` VALUES (1,9,12,'39',NULL,39.0000,''),(2,9,12,'38',NULL,38.0000,''),(3,9,12,'37',NULL,37.0000,''),(4,18,12,'37',NULL,37.0000,''),(5,18,12,'36',NULL,36.0000,''),(6,18,12,'39',NULL,39.0000,''),(7,22,12,'38',NULL,38.0000,''),(8,22,12,'36',NULL,36.0000,''),(10,25,12,'36',NULL,36.0000,''),(11,25,12,'37',NULL,37.0000,'');
/*!40000 ALTER TABLE `b_iblock_element_prop_m2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_prop_s1`
--

DROP TABLE IF EXISTS `b_iblock_element_prop_s1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_prop_s1` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `PROPERTY_13` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_prop_s1`
--

LOCK TABLES `b_iblock_element_prop_s1` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_prop_s1` DISABLE KEYS */;
INSERT INTO `b_iblock_element_prop_s1` VALUES (1,'a:3:{s:5:\"VALUE\";a:1:{i:0;s:1:\"3\";}s:11:\"DESCRIPTION\";a:1:{i:0;s:0:\"\";}s:2:\"ID\";a:1:{i:0;s:1:\"1\";}}'),(2,'a:3:{s:5:\"VALUE\";a:2:{i:0;s:1:\"3\";i:1;s:1:\"4\";}s:11:\"DESCRIPTION\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:2:\"ID\";a:2:{i:0;s:1:\"2\";i:1;s:1:\"3\";}}'),(3,NULL),(40,NULL),(41,'a:3:{s:5:\"VALUE\";a:2:{i:0;s:1:\"4\";i:1;s:1:\"5\";}s:11:\"DESCRIPTION\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:2:\"ID\";a:2:{i:0;s:1:\"7\";i:1;s:1:\"8\";}}'),(42,'a:3:{s:5:\"VALUE\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"5\";i:2;s:1:\"4\";}s:11:\"DESCRIPTION\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:2:\"ID\";a:3:{i:0;s:2:\"10\";i:1;s:2:\"11\";i:2;s:2:\"12\";}}');
/*!40000 ALTER TABLE `b_iblock_element_prop_s1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_prop_s2`
--

DROP TABLE IF EXISTS `b_iblock_element_prop_s2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_prop_s2` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `PROPERTY_1` int(11) DEFAULT NULL,
  `PROPERTY_2` decimal(18,4) DEFAULT NULL,
  `PROPERTY_3` int(11) DEFAULT NULL,
  `PROPERTY_4` text COLLATE utf8_unicode_ci,
  `PROPERTY_5` text COLLATE utf8_unicode_ci,
  `PROPERTY_6` text COLLATE utf8_unicode_ci,
  `PROPERTY_7` text COLLATE utf8_unicode_ci,
  `PROPERTY_8` text COLLATE utf8_unicode_ci,
  `PROPERTY_12` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_prop_s2`
--

LOCK TABLES `b_iblock_element_prop_s2` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_prop_s2` DISABLE KEYS */;
INSERT INTO `b_iblock_element_prop_s2` VALUES (4,NULL,10000.0000,2,'195x95x125',NULL,'40324А','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(5,NULL,12000.0000,2,'175x95x115',NULL,'56830Е','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(6,1,7899.0000,2,'54x49x120',NULL,'435245','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(7,NULL,8999.0000,2,'66x60x36',NULL,'234523','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(8,NULL,1500.0000,2,'51x43x85',NULL,'234011','Дерево, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(9,1,11899.0000,2,'155x90x95',NULL,'47539Р','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:3:{i:0;s:2:\"39\";i:1;s:2:\"38\";i:2;s:2:\"37\";}s:11:\"DESCRIPTION\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:2:\"ID\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}}'),(10,NULL,12500.0000,2,'165x90x115',NULL,'00549Е','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(11,NULL,8000.0000,2,'155x95x105',NULL,'98922К','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(12,1,10999.0000,2,'165x90x115',NULL,'64512Т','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(13,NULL,9999.0000,2,'210x105x135',NULL,'96395Т','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(14,NULL,1499.0000,2,'175x110x115','200x100','38263Е','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(15,NULL,9999.0000,2,NULL,NULL,'634645','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(16,NULL,7799.0000,2,NULL,NULL,'634045','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(17,NULL,6779.0000,2,'220x140x120',NULL,'634043','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(18,NULL,4579.0000,2,'200x150x120',NULL,'634023','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:3:{i:0;s:2:\"37\";i:1;s:2:\"36\";i:2;s:2:\"39\";}s:11:\"DESCRIPTION\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:2:\"ID\";a:3:{i:0;s:1:\"4\";i:1;s:1:\"5\";i:2;s:1:\"6\";}}'),(19,1,14999.0000,2,'50x69x130',NULL,'634023','Кожа, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(20,NULL,12999.0000,2,'58x48x86',NULL,'634011','Кожа, металл, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(21,NULL,1700.0000,2,'52x42x88',NULL,'234012','Дерево, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(22,NULL,1000.0000,2,'52x42x88',NULL,'234014','Дерево, ткань','Россия','a:3:{s:5:\"VALUE\";a:2:{i:0;s:2:\"38\";i:1;s:2:\"36\";}s:11:\"DESCRIPTION\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:2:\"ID\";a:2:{i:0;s:1:\"7\";i:1;s:1:\"8\";}}'),(23,NULL,1399.0000,2,'55x39x90',NULL,'234017','Дерево, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(24,NULL,1000.0000,2,'56x48x80',NULL,'234013','Дерево, ткань','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(25,NULL,1300.0000,2,'52x42x88',NULL,'234015','Металл, пластик','Россия','a:3:{s:5:\"VALUE\";a:2:{i:0;s:2:\"36\";i:1;s:2:\"37\";}s:11:\"DESCRIPTION\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:2:\"ID\";a:2:{i:0;s:2:\"10\";i:1;s:2:\"11\";}}'),(26,NULL,1699.0000,2,'52x45x65',NULL,'234016','Металл, пластик, кожа','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}'),(27,NULL,1679.0000,2,'54x43x82',NULL,'234017','Металл, пластик','Россия','a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}');
/*!40000 ALTER TABLE `b_iblock_element_prop_s2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_property`
--

DROP TABLE IF EXISTS `b_iblock_element_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_property`
--

LOCK TABLES `b_iblock_element_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
INSERT INTO `b_iblock_element_property` VALUES (148,9,33,'2','text',NULL,2.0000,''),(157,10,34,'Покупайте стулья!','text',NULL,0.0000,''),(158,11,34,'Самый лучший стул на свете','text',NULL,0.0000,''),(159,10,35,'Каталог всего! ','text',NULL,0.0000,''),(160,11,35,'Тут есть все и даже больше','text',NULL,0.0000,'');
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_right`
--

DROP TABLE IF EXISTS `b_iblock_element_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_right`
--

LOCK TABLES `b_iblock_element_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_fields`
--

DROP TABLE IF EXISTS `b_iblock_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_fields`
--

LOCK TABLES `b_iblock_fields` WRITE;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` VALUES (1,'ACTIVE','Y','Y'),(1,'ACTIVE_FROM','N','=today'),(1,'ACTIVE_TO','N',''),(1,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:0:\"\";s:11:\"TRANS_SPACE\";b:0;s:11:\"TRANS_OTHER\";b:0;s:9:\"TRANS_EAT\";s:1:\"N\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(1,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'DETAIL_TEXT','N',''),(1,'DETAIL_TEXT_TYPE','Y','text'),(1,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(1,'LOG_ELEMENT_ADD','N',NULL),(1,'LOG_ELEMENT_DELETE','N',NULL),(1,'LOG_ELEMENT_EDIT','N',NULL),(1,'LOG_SECTION_ADD','N',NULL),(1,'LOG_SECTION_DELETE','N',NULL),(1,'LOG_SECTION_EDIT','N',NULL),(1,'NAME','Y',''),(1,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'PREVIEW_TEXT','N',''),(1,'PREVIEW_TEXT_TYPE','Y','text'),(1,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(1,'SECTION_DESCRIPTION','N',''),(1,'SECTION_DESCRIPTION_TYPE','Y','text'),(1,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'SECTION_NAME','Y',''),(1,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'SECTION_XML_ID','N',''),(1,'SORT','N','0'),(1,'TAGS','N',''),(1,'XML_ID','Y',''),(1,'XML_IMPORT_START_TIME','N','2018-01-11 16:04:26'),(2,'ACTIVE','Y','Y'),(2,'ACTIVE_FROM','N',''),(2,'ACTIVE_TO','N',''),(2,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:0:\"\";s:11:\"TRANS_SPACE\";b:0;s:11:\"TRANS_OTHER\";b:0;s:9:\"TRANS_EAT\";s:1:\"N\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(2,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'DETAIL_TEXT','N',''),(2,'DETAIL_TEXT_TYPE','Y','text'),(2,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(2,'LOG_ELEMENT_ADD','N',NULL),(2,'LOG_ELEMENT_DELETE','N',NULL),(2,'LOG_ELEMENT_EDIT','N',NULL),(2,'LOG_SECTION_ADD','N',NULL),(2,'LOG_SECTION_DELETE','N',NULL),(2,'LOG_SECTION_EDIT','N',NULL),(2,'NAME','Y',''),(2,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'PREVIEW_TEXT','N',''),(2,'PREVIEW_TEXT_TYPE','Y','text'),(2,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(2,'SECTION_DESCRIPTION','N',''),(2,'SECTION_DESCRIPTION_TYPE','Y','text'),(2,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'SECTION_NAME','Y',''),(2,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'SECTION_XML_ID','N',''),(2,'SORT','N','0'),(2,'TAGS','N',''),(2,'XML_ID','Y',''),(2,'XML_IMPORT_START_TIME','N','2018-01-11 16:07:19'),(3,'ACTIVE','Y','Y'),(3,'ACTIVE_FROM','N',''),(3,'ACTIVE_TO','N',''),(3,'CODE','N',''),(3,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'DETAIL_TEXT','N',''),(3,'DETAIL_TEXT_TYPE','Y','text'),(3,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'IBLOCK_SECTION','N',''),(3,'LOG_ELEMENT_ADD','N',NULL),(3,'LOG_ELEMENT_DELETE','N',NULL),(3,'LOG_ELEMENT_EDIT','N',NULL),(3,'LOG_SECTION_ADD','N',NULL),(3,'LOG_SECTION_DELETE','N',NULL),(3,'LOG_SECTION_EDIT','N',NULL),(3,'NAME','Y',''),(3,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'PREVIEW_TEXT','N',''),(3,'PREVIEW_TEXT_TYPE','Y','text'),(3,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(3,'SECTION_DESCRIPTION','N',NULL),(3,'SECTION_DESCRIPTION_TYPE','Y',NULL),(3,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'SECTION_NAME','Y',NULL),(3,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'SECTION_XML_ID','N',NULL),(3,'SORT','N','0'),(3,'TAGS','N',''),(3,'XML_ID','Y',''),(3,'XML_IMPORT_START_TIME','N','2018-01-11 16:08:26'),(4,'ACTIVE','Y','Y'),(4,'ACTIVE_FROM','N',''),(4,'ACTIVE_TO','N',''),(4,'CODE','N',''),(4,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'DETAIL_TEXT','N',''),(4,'DETAIL_TEXT_TYPE','Y','text'),(4,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'IBLOCK_SECTION','N',''),(4,'LOG_ELEMENT_ADD','N',NULL),(4,'LOG_ELEMENT_DELETE','N',NULL),(4,'LOG_ELEMENT_EDIT','N',NULL),(4,'LOG_SECTION_ADD','N',NULL),(4,'LOG_SECTION_DELETE','N',NULL),(4,'LOG_SECTION_EDIT','N',NULL),(4,'NAME','Y',''),(4,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'PREVIEW_TEXT','N',''),(4,'PREVIEW_TEXT_TYPE','Y','text'),(4,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(4,'SECTION_DESCRIPTION','N',NULL),(4,'SECTION_DESCRIPTION_TYPE','Y',NULL),(4,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'SECTION_NAME','Y',NULL),(4,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'SECTION_XML_ID','N',NULL),(4,'SORT','N','0'),(4,'TAGS','N',''),(4,'XML_ID','Y',''),(4,'XML_IMPORT_START_TIME','N','2018-01-11 16:08:56'),(5,'ACTIVE','Y','Y'),(5,'ACTIVE_FROM','N',''),(5,'ACTIVE_TO','N',''),(5,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'DETAIL_TEXT','N',''),(5,'DETAIL_TEXT_TYPE','Y','text'),(5,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(5,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(5,'LOG_ELEMENT_ADD','N',NULL),(5,'LOG_ELEMENT_DELETE','N',NULL),(5,'LOG_ELEMENT_EDIT','N',NULL),(5,'LOG_SECTION_ADD','N',NULL),(5,'LOG_SECTION_DELETE','N',NULL),(5,'LOG_SECTION_EDIT','N',NULL),(5,'NAME','Y',''),(5,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'PREVIEW_TEXT','N',''),(5,'PREVIEW_TEXT_TYPE','Y','text'),(5,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(5,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'SECTION_DESCRIPTION','N',''),(5,'SECTION_DESCRIPTION_TYPE','Y','text'),(5,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(5,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'SECTION_NAME','Y',''),(5,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'SECTION_XML_ID','N',''),(5,'SORT','N','0'),(5,'TAGS','N',''),(5,'XML_ID','Y',''),(5,'XML_IMPORT_START_TIME','N',NULL),(6,'ACTIVE','Y','Y'),(6,'ACTIVE_FROM','N',''),(6,'ACTIVE_TO','N',''),(6,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(6,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(6,'DETAIL_TEXT','N',''),(6,'DETAIL_TEXT_TYPE','Y','text'),(6,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(6,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(6,'LOG_ELEMENT_ADD','N',NULL),(6,'LOG_ELEMENT_DELETE','N',NULL),(6,'LOG_ELEMENT_EDIT','N',NULL),(6,'LOG_SECTION_ADD','N',NULL),(6,'LOG_SECTION_DELETE','N',NULL),(6,'LOG_SECTION_EDIT','N',NULL),(6,'NAME','Y',''),(6,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(6,'PREVIEW_TEXT','N',''),(6,'PREVIEW_TEXT_TYPE','Y','text'),(6,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(6,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(6,'SECTION_DESCRIPTION','N',''),(6,'SECTION_DESCRIPTION_TYPE','Y','text'),(6,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(6,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(6,'SECTION_NAME','Y',''),(6,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(6,'SECTION_XML_ID','N',''),(6,'SORT','N','0'),(6,'TAGS','N',''),(6,'XML_ID','Y',''),(6,'XML_IMPORT_START_TIME','N',NULL),(7,'ACTIVE','Y','Y'),(7,'ACTIVE_FROM','N',''),(7,'ACTIVE_TO','N',''),(7,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(7,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(7,'DETAIL_TEXT','N',''),(7,'DETAIL_TEXT_TYPE','Y','text'),(7,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(7,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(7,'LOG_ELEMENT_ADD','N',NULL),(7,'LOG_ELEMENT_DELETE','N',NULL),(7,'LOG_ELEMENT_EDIT','N',NULL),(7,'LOG_SECTION_ADD','N',NULL),(7,'LOG_SECTION_DELETE','N',NULL),(7,'LOG_SECTION_EDIT','N',NULL),(7,'NAME','Y',''),(7,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(7,'PREVIEW_TEXT','N',''),(7,'PREVIEW_TEXT_TYPE','Y','text'),(7,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(7,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(7,'SECTION_DESCRIPTION','N',''),(7,'SECTION_DESCRIPTION_TYPE','Y','text'),(7,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(7,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(7,'SECTION_NAME','Y',''),(7,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(7,'SECTION_XML_ID','N',''),(7,'SORT','N','0'),(7,'TAGS','N',''),(7,'XML_ID','Y',''),(7,'XML_IMPORT_START_TIME','N',NULL);
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_group`
--

DROP TABLE IF EXISTS `b_iblock_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_group`
--

LOCK TABLES `b_iblock_group` WRITE;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` VALUES (1,1,'X'),(1,2,'R'),(1,5,'W'),(2,1,'X'),(2,2,'R'),(2,5,'W'),(3,1,'X'),(3,2,'R'),(3,5,'W'),(4,1,'X'),(4,2,'R'),(4,5,'W'),(5,1,'X'),(6,1,'X'),(7,1,'X');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iblock_iprop`
--

DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iblock_iprop`
--

LOCK TABLES `b_iblock_iblock_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iproperty`
--

DROP TABLE IF EXISTS `b_iblock_iproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iproperty`
--

LOCK TABLES `b_iblock_iproperty` WRITE;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_messages`
--

DROP TABLE IF EXISTS `b_iblock_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_messages`
--

LOCK TABLES `b_iblock_messages` WRITE;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` VALUES (1,'ELEMENT_ADD','Добавить новость'),(1,'ELEMENT_DELETE','Удалить новость'),(1,'ELEMENT_EDIT','Изменить новость'),(1,'ELEMENT_NAME','Новость'),(1,'ELEMENTS_NAME','Новости'),(1,'SECTION_ADD','Добавить раздел'),(1,'SECTION_DELETE','Удалить раздел'),(1,'SECTION_EDIT','Изменить раздел'),(1,'SECTION_NAME','Раздел'),(1,'SECTIONS_NAME','Разделы'),(2,'ELEMENT_ADD','Добавить товар'),(2,'ELEMENT_DELETE','Удалить товар'),(2,'ELEMENT_EDIT','Изменить товар'),(2,'ELEMENT_NAME','Элемент'),(2,'ELEMENTS_NAME','Товары'),(2,'SECTION_ADD','Добавить раздел'),(2,'SECTION_DELETE','Удалить раздел'),(2,'SECTION_EDIT','Изменить раздел'),(2,'SECTION_NAME','Раздел'),(2,'SECTIONS_NAME','Разделы'),(3,'ELEMENT_ADD','Добавить услугу'),(3,'ELEMENT_DELETE','Удалить услугу'),(3,'ELEMENT_EDIT','Изменить услугу'),(3,'ELEMENT_NAME','Услуга'),(3,'ELEMENTS_NAME','Услуги'),(3,'SECTION_ADD','Добавить раздел'),(3,'SECTION_DELETE','Удалить раздел'),(3,'SECTION_EDIT','Изменить раздел'),(3,'SECTION_NAME','Раздел'),(3,'SECTIONS_NAME','Разделы'),(4,'ELEMENT_ADD','Добавить вакансию'),(4,'ELEMENT_DELETE','Удалить вакансию'),(4,'ELEMENT_EDIT','Изменить вакансию'),(4,'ELEMENT_NAME','Вакансия'),(4,'ELEMENTS_NAME','Вакансии'),(4,'SECTION_ADD','Добавить раздел'),(4,'SECTION_DELETE','Удалить раздел'),(4,'SECTION_EDIT','Изменить раздел'),(4,'SECTION_NAME','Раздел'),(4,'SECTIONS_NAME','Разделы'),(5,'ELEMENT_ADD','Добавить элемент'),(5,'ELEMENT_DELETE','Удалить элемент'),(5,'ELEMENT_EDIT','Изменить элемент'),(5,'ELEMENT_NAME','Элемент'),(5,'ELEMENTS_NAME','Элементы'),(6,'ELEMENT_ADD','Добавить элемент'),(6,'ELEMENT_DELETE','Удалить элемент'),(6,'ELEMENT_EDIT','Изменить элемент'),(6,'ELEMENT_NAME','Элемент'),(6,'ELEMENTS_NAME','Элементы'),(6,'SECTION_ADD','Добавить раздел'),(6,'SECTION_DELETE','Удалить раздел'),(6,'SECTION_EDIT','Изменить раздел'),(6,'SECTION_NAME','Раздел'),(6,'SECTIONS_NAME','Разделы'),(7,'ELEMENT_ADD','Добавить элемент'),(7,'ELEMENT_DELETE','Удалить элемент'),(7,'ELEMENT_EDIT','Изменить элемент'),(7,'ELEMENT_NAME','Элемент'),(7,'ELEMENTS_NAME','Элементы'),(7,'SECTION_ADD','Добавить раздел'),(7,'SECTION_DELETE','Удалить раздел'),(7,'SECTION_EDIT','Изменить раздел'),(7,'SECTION_NAME','Раздел'),(7,'SECTIONS_NAME','Разделы');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_offers_tmp`
--

DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_offers_tmp`
--

LOCK TABLES `b_iblock_offers_tmp` WRITE;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property`
--

DROP TABLE IF EXISTS `b_iblock_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property`
--

LOCK TABLES `b_iblock_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
INSERT INTO `b_iblock_property` VALUES (1,'2018-01-15 11:58:15',2,'Специальное предложение','Y',100,'SPECIALOFFER','','L',1,30,'C','N','5','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(2,'2018-01-15 11:58:15',2,'Цена','Y',200,'PRICE','','N',1,30,'L','N','6','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(3,'2018-01-15 11:58:15',2,'Валюта цены (подпись)','Y',300,'PRICECURRENCY','','L',1,30,'C','N','7','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(4,'2018-01-15 11:58:15',2,'Габариты (Д х Ш х В)','Y',400,'SIZE','','S',1,30,'L','N','8','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(5,'2018-01-15 11:58:15',2,'Размеры спального места','Y',500,'S_SIZE','','S',1,30,'L','N','9','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(6,'2018-01-15 11:58:15',2,'Артикул','Y',600,'ARTNUMBER','','S',1,30,'L','N','10','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(7,'2018-01-15 11:58:15',2,'Материал','Y',700,'MATERIAL','','S',1,30,'L','N','11','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(8,'2018-01-15 11:58:15',2,'Производитель','Y',800,'MANUFACTURER','','S',1,30,'L','N','12','',5,NULL,0,'N','N','N','N',2,NULL,NULL,''),(9,'2018-01-15 10:28:18',5,'Новость','Y',500,'NEWS','','E',1,30,'L','N',NULL,'',5,NULL,1,'N','N','N','N',1,NULL,NULL,''),(10,'2018-01-15 11:22:00',6,'Заголовок','Y',500,'TITLE','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,NULL,''),(11,'2018-01-15 11:22:00',6,'Описание','Y',500,'DESCRIPTION','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,NULL,''),(12,'2018-01-15 11:58:15',2,'Фирма','Y',500,'BRAND','','E',1,30,'L','Y',NULL,'',5,NULL,7,'N','N','N','N',2,NULL,NULL,''),(13,'2018-01-16 10:03:43',1,'Автор','Y',500,'AUTHOR',NULL,'S',1,30,'L','Y',NULL,'',5,NULL,0,'N','N','N','N',2,'UserID',NULL,'');
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property_enum`
--

DROP TABLE IF EXISTS `b_iblock_property_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property_enum`
--

LOCK TABLES `b_iblock_property_enum` WRITE;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
INSERT INTO `b_iblock_property_enum` VALUES (1,1,'да','N',500,'Y',NULL),(2,3,'руб.','Y',10,'corp_cf_cur_1',NULL),(3,3,'$','N',20,'corp_cf_cur_3',NULL),(4,3,'€','N',30,'corp_cf_cur_2',NULL);
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_right`
--

DROP TABLE IF EXISTS `b_iblock_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_right`
--

LOCK TABLES `b_iblock_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_rss`
--

DROP TABLE IF EXISTS `b_iblock_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_rss`
--

LOCK TABLES `b_iblock_rss` WRITE;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section`
--

DROP TABLE IF EXISTS `b_iblock_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section`
--

LOCK TABLES `b_iblock_section` WRITE;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
INSERT INTO `b_iblock_section` VALUES (1,'2018-01-15 11:31:16',1,'2018-01-11 16:07:24',1,2,NULL,'Y','Y',100,'Мягкая мебель',1,1,2,1,'Диваны, кресла и прочая мягкая мебель','html','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ','','2',NULL,NULL,NULL),(2,'2018-01-15 11:31:29',1,'2018-01-11 16:07:25',1,2,NULL,'Y','Y',200,'Офисная мебель',2,3,4,1,'Диваны, столы, стулья','html','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ','','3',NULL,NULL,NULL),(3,'2018-01-15 11:31:47',1,'2018-01-11 16:07:25',1,2,NULL,'Y','Y',300,'Мебель для кухни',3,5,6,1,'Полки, ящики, столы и стулья','html','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ','','4',NULL,NULL,NULL),(4,'2018-01-15 11:30:38',1,'2018-01-11 16:07:26',1,2,NULL,'Y','Y',400,'Детская мебель',4,7,8,1,'Кровати, стулья, мягкая детская мебель','html','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ','','5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_element`
--

DROP TABLE IF EXISTS `b_iblock_section_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_element`
--

LOCK TABLES `b_iblock_section_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
INSERT INTO `b_iblock_section_element` VALUES (1,4,NULL),(1,5,NULL),(1,9,NULL),(1,10,NULL),(1,11,NULL),(1,12,NULL),(1,13,NULL),(1,14,NULL),(2,6,NULL),(2,7,NULL),(2,15,NULL),(2,16,NULL),(2,17,NULL),(2,18,NULL),(2,19,NULL),(2,20,NULL),(3,8,NULL),(3,21,NULL),(3,22,NULL),(3,23,NULL),(4,24,NULL),(4,25,NULL),(4,26,NULL),(4,27,NULL);
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_iprop`
--

DROP TABLE IF EXISTS `b_iblock_section_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_iprop`
--

LOCK TABLES `b_iblock_section_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_property`
--

DROP TABLE IF EXISTS `b_iblock_section_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_property`
--

LOCK TABLES `b_iblock_section_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_right`
--

DROP TABLE IF EXISTS `b_iblock_section_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_right`
--

LOCK TABLES `b_iblock_section_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_sequence`
--

DROP TABLE IF EXISTS `b_iblock_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_sequence`
--

LOCK TABLES `b_iblock_sequence` WRITE;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_site`
--

DROP TABLE IF EXISTS `b_iblock_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_site`
--

LOCK TABLES `b_iblock_site` WRITE;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1'),(6,'s1'),(7,'s1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type`
--

DROP TABLE IF EXISTS `b_iblock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type`
--

LOCK TABLES `b_iblock_type` WRITE;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` VALUES ('news','N',NULL,NULL,'Y',50),('products','Y',NULL,NULL,'N',100),('vacancies','Y',NULL,NULL,'N',150);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type_lang`
--

DROP TABLE IF EXISTS `b_iblock_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type_lang`
--

LOCK TABLES `b_iblock_type_lang` WRITE;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` VALUES ('news','en','News','','News'),('news','ru','Новости','','Новости'),('products','en','Products and services','Sections','Products and services'),('products','ru','Товары и услуги','Разделы','Товары и услуги'),('vacancies','en','Job','Categories','Vacancies'),('vacancies','ru','Вакансии','Разделы','Вакансии');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang`
--

DROP TABLE IF EXISTS `b_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang`
--

LOCK TABLES `b_lang` WRITE;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` VALUES ('s1',1,'Y','Y','Cайт производства (Сайт по умолчанию)','/',NULL,NULL,NULL,NULL,NULL,'ru',NULL,'N',NULL,'Cайт производства',NULL,1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang_domain`
--

DROP TABLE IF EXISTS `b_lang_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang_domain`
--

LOCK TABLES `b_lang_domain` WRITE;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_language`
--

DROP TABLE IF EXISTS `b_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_language`
--

LOCK TABLES `b_language` WRITE;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` VALUES ('en',2,'N','Y','English',NULL,NULL,NULL,NULL,NULL,NULL,2),('ru',1,'Y','Y','Russian',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_list_rubric`
--

DROP TABLE IF EXISTS `b_list_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_list_rubric`
--

LOCK TABLES `b_list_rubric` WRITE;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection`
--

DROP TABLE IF EXISTS `b_medialib_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection`
--

LOCK TABLES `b_medialib_collection` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection_item`
--

DROP TABLE IF EXISTS `b_medialib_collection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection_item`
--

LOCK TABLES `b_medialib_collection_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_item`
--

DROP TABLE IF EXISTS `b_medialib_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_item`
--

LOCK TABLES `b_medialib_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_type`
--

DROP TABLE IF EXISTS `b_medialib_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_type`
--

LOCK TABLES `b_medialib_type` WRITE;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` VALUES (1,'image_name','image','jpg,jpeg,gif,png','Y','image_desc'),(2,'video_name','video','flv,mp4,wmv','Y','video_desc'),(3,'sound_name','sound','mp3,wma,aac','Y','sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_app`
--

DROP TABLE IF EXISTS `b_mobileapp_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_app`
--

LOCK TABLES `b_mobileapp_app` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_config`
--

DROP TABLE IF EXISTS `b_mobileapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_config`
--

LOCK TABLES `b_mobileapp_config` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module`
--

DROP TABLE IF EXISTS `b_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module`
--

LOCK TABLES `b_module` WRITE;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` VALUES ('bitrix.sitecorporate','2018-01-11 13:01:04'),('bitrix.siteinfoportal','2018-01-11 13:01:07'),('bitrix.sitepersonal','2018-01-11 13:01:11'),('bitrixcloud','2018-01-11 13:01:12'),('blog','2018-01-11 13:01:23'),('clouds','2018-01-11 13:01:35'),('compression','2018-01-11 13:01:37'),('fileman','2018-01-11 13:01:39'),('form','2018-01-11 13:01:52'),('forum','2018-01-11 13:02:01'),('highloadblock','2018-01-11 13:02:23'),('iblock','2018-01-11 13:02:32'),('main','2018-01-11 12:19:00'),('mobileapp','2018-01-11 13:02:39'),('perfmon','2018-01-11 13:02:44'),('photogallery','2018-01-11 13:02:47'),('scale','2018-01-11 13:02:57'),('search','2018-01-11 13:03:01'),('security','2018-01-11 13:03:07'),('seo','2018-01-11 13:03:14'),('socialservices','2018-01-11 13:03:17'),('subscribe','2018-01-11 13:03:20'),('translate','2018-01-11 13:03:21'),('vote','2018-01-11 13:03:25');
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_group`
--

DROP TABLE IF EXISTS `b_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_group`
--

LOCK TABLES `b_module_group` WRITE;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
INSERT INTO `b_module_group` VALUES (1,'main',5,'Q',NULL),(2,'fileman',5,'F',NULL);
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_to_module`
--

DROP TABLE IF EXISTS `b_module_to_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_to_module`
--

LOCK TABLES `b_module_to_module` WRITE;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` VALUES (1,'2018-01-11 12:19:00',100,'iblock','OnIBlockPropertyBuildList','main','/modules/main/tools/prop_userid.php','CIBlockPropertyUserID','GetUserTypeDescription','',1),(2,'2018-01-11 12:19:00',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnUserDelete','',1),(3,'2018-01-11 12:19:00',100,'main','OnLanguageDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnLanguageDelete','',1),(4,'2018-01-11 12:19:00',100,'main','OnUserDelete','main','','CUserOptions','OnUserDelete','',1),(5,'2018-01-11 12:19:00',100,'main','OnChangeFile','main','','CMain','OnChangeFileComponent','',1),(6,'2018-01-11 12:19:00',100,'main','OnUserTypeRightsCheck','main','','CUser','UserTypeRightsCheck','',1),(7,'2018-01-11 12:19:00',100,'main','OnUserLogin','main','','UpdateTools','CheckUpdates','',1),(8,'2018-01-11 12:19:00',100,'main','OnModuleUpdate','main','','UpdateTools','SetUpdateResult','',1),(9,'2018-01-11 12:19:00',100,'main','OnUpdateCheck','main','','UpdateTools','SetUpdateError','',1),(10,'2018-01-11 12:19:00',100,'main','OnPanelCreate','main','','CUndo','CheckNotifyMessage','',1),(11,'2018-01-11 12:19:00',100,'main','OnAfterAddRating','main','','CRatingsComponentsMain','OnAfterAddRating','',1),(12,'2018-01-11 12:19:00',100,'main','OnAfterUpdateRating','main','','CRatingsComponentsMain','OnAfterUpdateRating','',1),(13,'2018-01-11 12:19:00',100,'main','OnSetRatingsConfigs','main','','CRatingsComponentsMain','OnSetRatingConfigs','',1),(14,'2018-01-11 12:19:00',100,'main','OnGetRatingsConfigs','main','','CRatingsComponentsMain','OnGetRatingConfigs','',1),(15,'2018-01-11 12:19:00',100,'main','OnGetRatingsObjects','main','','CRatingsComponentsMain','OnGetRatingObject','',1),(16,'2018-01-11 12:19:00',100,'main','OnGetRatingContentOwner','main','','CRatingsComponentsMain','OnGetRatingContentOwner','',1),(17,'2018-01-11 12:19:00',100,'main','OnAfterAddRatingRule','main','','CRatingRulesMain','OnAfterAddRatingRule','',1),(18,'2018-01-11 12:19:00',100,'main','OnAfterUpdateRatingRule','main','','CRatingRulesMain','OnAfterUpdateRatingRule','',1),(19,'2018-01-11 12:19:00',100,'main','OnGetRatingRuleObjects','main','','CRatingRulesMain','OnGetRatingRuleObjects','',1),(20,'2018-01-11 12:19:01',100,'main','OnGetRatingRuleConfigs','main','','CRatingRulesMain','OnGetRatingRuleConfigs','',1),(21,'2018-01-11 12:19:01',100,'main','OnAfterUserAdd','main','','CRatings','OnAfterUserRegister','',1),(22,'2018-01-11 12:19:01',100,'main','OnUserDelete','main','','CRatings','OnUserDelete','',1),(23,'2018-01-11 12:19:01',100,'main','OnUserDelete','main','','CAccess','OnUserDelete','',1),(24,'2018-01-11 12:19:01',100,'main','OnAfterGroupAdd','main','','CGroupAuthProvider','OnAfterGroupAdd','',1),(25,'2018-01-11 12:19:01',100,'main','OnBeforeGroupUpdate','main','','CGroupAuthProvider','OnBeforeGroupUpdate','',1),(26,'2018-01-11 12:19:01',100,'main','OnBeforeGroupDelete','main','','CGroupAuthProvider','OnBeforeGroupDelete','',1),(27,'2018-01-11 12:19:01',100,'main','OnAfterSetUserGroup','main','','CGroupAuthProvider','OnAfterSetUserGroup','',1),(28,'2018-01-11 12:19:01',100,'main','OnUserLogin','main','','CGroupAuthProvider','OnUserLogin','',1),(29,'2018-01-11 12:19:01',100,'main','OnEventLogGetAuditTypes','main','','CEventMain','GetAuditTypes','',1),(30,'2018-01-11 12:19:01',100,'main','OnEventLogGetAuditHandlers','main','','CEventMain','MakeMainObject','',1),(31,'2018-01-11 12:19:01',100,'perfmon','OnGetTableSchema','main','','CTableSchema','OnGetTableSchema','',1),(32,'2018-01-11 12:19:01',100,'sender','OnConnectorList','main','','\\Bitrix\\Main\\SenderEventHandler','onConnectorListUser','',1),(33,'2018-01-11 12:19:01',110,'main','OnUserTypeBuildList','main','','CUserTypeString','GetUserTypeDescription','',1),(34,'2018-01-11 12:19:01',120,'main','OnUserTypeBuildList','main','','CUserTypeInteger','GetUserTypeDescription','',1),(35,'2018-01-11 12:19:01',130,'main','OnUserTypeBuildList','main','','CUserTypeDouble','GetUserTypeDescription','',1),(36,'2018-01-11 12:19:01',140,'main','OnUserTypeBuildList','main','','CUserTypeDateTime','GetUserTypeDescription','',1),(37,'2018-01-11 12:19:01',145,'main','OnUserTypeBuildList','main','','CUserTypeDate','GetUserTypeDescription','',1),(38,'2018-01-11 12:19:01',150,'main','OnUserTypeBuildList','main','','CUserTypeBoolean','GetUserTypeDescription','',1),(39,'2018-01-11 12:19:01',155,'main','OnUserTypeBuildList','main','','CUserTypeUrl','GetUserTypeDescription','',1),(40,'2018-01-11 12:19:01',160,'main','OnUserTypeBuildList','main','','CUserTypeFile','GetUserTypeDescription','',1),(41,'2018-01-11 12:19:01',170,'main','OnUserTypeBuildList','main','','CUserTypeEnum','GetUserTypeDescription','',1),(42,'2018-01-11 12:19:01',180,'main','OnUserTypeBuildList','main','','CUserTypeIBlockSection','GetUserTypeDescription','',1),(43,'2018-01-11 12:19:01',190,'main','OnUserTypeBuildList','main','','CUserTypeIBlockElement','GetUserTypeDescription','',1),(44,'2018-01-11 12:19:01',200,'main','OnUserTypeBuildList','main','','CUserTypeStringFormatted','GetUserTypeDescription','',1),(45,'2018-01-11 12:19:01',210,'main','OnUserTypeBuildList','main','','\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType','getUserTypeDescription','',1),(46,'2018-01-11 12:19:01',100,'main','OnBeforeEndBufferContent','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeEndBufferContent','',1),(47,'2018-01-11 12:19:01',100,'main','OnBeforeRestartBuffer','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeRestartBuffer','',1),(48,'2018-01-11 12:19:01',100,'disk','onAfterAjaxActionCreateFolderWithSharing','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(49,'2018-01-11 12:19:01',100,'disk','onAfterAjaxActionAppendSharing','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(50,'2018-01-11 12:19:01',100,'disk','onAfterAjaxActionChangeSharingAndRights','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(51,'2018-01-11 12:19:01',100,'socialnetwork','OnSocNetLogDelete','main','','CUserCounter','OnSocNetLogDelete','',1),(52,'2018-01-11 12:19:01',100,'socialnetwork','OnSocNetLogCommentDelete','main','','CUserCounter','OnSocNetLogCommentDelete','',1),(53,'2018-01-11 13:01:02',100,'main','OnBuildGlobalMenu','b24connector','','\\Bitrix\\B24Connector\\Helper','onBuildGlobalMenu','',1),(54,'2018-01-11 13:01:02',100,'main','OnBeforeProlog','b24connector','','\\Bitrix\\B24Connector\\Helper','onBeforeProlog','',1),(55,'2018-01-11 13:01:04',100,'main','OnBeforeProlog','bitrix.sitecorporate','','CSiteCorporate','ShowPanel','',1),(56,'2018-01-11 13:01:07',100,'main','OnBeforeProlog','bitrix.siteinfoportal','','CSiteInfoportal','ShowPanel','',1),(57,'2018-01-11 13:01:11',100,'main','OnBeforeProlog','bitrix.sitepersonal','','CSitePersonal','ShowPanel','',1),(58,'2018-01-11 13:01:12',100,'main','OnAdminInformerInsertItems','bitrixcloud','','CBitrixCloudCDN','OnAdminInformerInsertItems','',1),(59,'2018-01-11 13:01:12',100,'main','OnAdminInformerInsertItems','bitrixcloud','','CBitrixCloudBackup','OnAdminInformerInsertItems','',1),(60,'2018-01-11 13:01:12',100,'mobileapp','OnBeforeAdminMobileMenuBuild','bitrixcloud','','CBitrixCloudMobile','OnBeforeAdminMobileMenuBuild','',1),(61,'2018-01-11 13:01:23',100,'search','OnReindex','blog','','CBlogSearch','OnSearchReindex','',1),(62,'2018-01-11 13:01:23',100,'main','OnUserDelete','blog','','CBlogUser','Delete','',1),(63,'2018-01-11 13:01:23',100,'main','OnSiteDelete','blog','','CBlogSitePath','DeleteBySiteID','',1),(64,'2018-01-11 13:01:23',100,'socialnetwork','OnSocNetGroupDelete','blog','','CBlogSoNetPost','OnGroupDelete','',1),(65,'2018-01-11 13:01:23',100,'socialnetwork','OnSocNetFeaturesAdd','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1),(66,'2018-01-11 13:01:23',100,'socialnetwork','OnSocNetFeaturesUpdate','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1),(67,'2018-01-11 13:01:23',100,'socialnetwork','OnSocNetFeaturesPermsAdd','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1),(68,'2018-01-11 13:01:23',100,'socialnetwork','OnSocNetFeaturesPermsUpdate','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1),(69,'2018-01-11 13:01:23',200,'main','OnAfterAddRating','blog','','CRatingsComponentsBlog','OnAfterAddRating','',1),(70,'2018-01-11 13:01:23',200,'main','OnAfterUpdateRating','blog','','CRatingsComponentsBlog','OnAfterUpdateRating','',1),(71,'2018-01-11 13:01:23',200,'main','OnSetRatingsConfigs','blog','','CRatingsComponentsBlog','OnSetRatingConfigs','',1),(72,'2018-01-11 13:01:23',200,'main','OnGetRatingsConfigs','blog','','CRatingsComponentsBlog','OnGetRatingConfigs','',1),(73,'2018-01-11 13:01:23',200,'main','OnGetRatingsObjects','blog','','CRatingsComponentsBlog','OnGetRatingObject','',1),(74,'2018-01-11 13:01:23',200,'main','OnGetRatingContentOwner','blog','','CRatingsComponentsBlog','OnGetRatingContentOwner','',1),(75,'2018-01-11 13:01:23',100,'im','OnGetNotifySchema','blog','','CBlogNotifySchema','OnGetNotifySchema','',1),(76,'2018-01-11 13:01:23',100,'im','OnAnswerNotify','blog','','CBlogNotifySchema','CBlogEventsIMCallback','',1),(77,'2018-01-11 13:01:23',100,'main','OnAfterRegisterModule','main','/modules/blog/install/index.php','blog','installUserFields','',1),(78,'2018-01-11 13:01:23',100,'conversion','OnGetCounterTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetCounterTypes','',1),(79,'2018-01-11 13:01:23',100,'conversion','OnGetRateTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetRateTypes','',1),(80,'2018-01-11 13:01:23',100,'blog','OnPostAdd','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onPostAdd','',1),(81,'2018-01-11 13:01:23',100,'mail','onReplyReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleReplyReceivedBlogPost','',2),(82,'2018-01-11 13:01:23',100,'mail','onForwardReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleForwardReceivedBlogPost','',2),(83,'2018-01-11 13:01:23',100,'socialnetwork','onLogIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2),(84,'2018-01-11 13:01:23',100,'socialnetwork','onLogCommentIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2),(85,'2018-01-11 13:01:23',100,'socialnetwork','onContentViewed','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler','onContentViewed','',2),(86,'2018-01-11 13:01:36',100,'main','OnEventLogGetAuditTypes','clouds','','CCloudStorage','GetAuditTypes','',1),(87,'2018-01-11 13:01:36',100,'main','OnBeforeProlog','clouds','','CCloudStorage','OnBeforeProlog','',1),(88,'2018-01-11 13:01:36',100,'main','OnAdminListDisplay','clouds','','CCloudStorage','OnAdminListDisplay','',1),(89,'2018-01-11 13:01:36',100,'main','OnBuildGlobalMenu','clouds','','CCloudStorage','OnBuildGlobalMenu','',1),(90,'2018-01-11 13:01:36',100,'main','OnFileSave','clouds','','CCloudStorage','OnFileSave','',1),(91,'2018-01-11 13:01:36',100,'main','OnGetFileSRC','clouds','','CCloudStorage','OnGetFileSRC','',1),(92,'2018-01-11 13:01:36',100,'main','OnFileCopy','clouds','','CCloudStorage','OnFileCopy','',1),(93,'2018-01-11 13:01:36',100,'main','OnFileDelete','clouds','','CCloudStorage','OnFileDelete','',1),(94,'2018-01-11 13:01:36',100,'main','OnMakeFileArray','clouds','','CCloudStorage','OnMakeFileArray','',1),(95,'2018-01-11 13:01:36',100,'main','OnBeforeResizeImage','clouds','','CCloudStorage','OnBeforeResizeImage','',1),(96,'2018-01-11 13:01:36',100,'main','OnAfterResizeImage','clouds','','CCloudStorage','OnAfterResizeImage','',1),(97,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_AmazonS3','GetObjectInstance','',1),(98,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_GoogleStorage','GetObjectInstance','',1),(99,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_OpenStackStorage','GetObjectInstance','',1),(100,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_RackSpaceCloudFiles','GetObjectInstance','',1),(101,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_ClodoRU','GetObjectInstance','',1),(102,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_Selectel','GetObjectInstance','',1),(103,'2018-01-11 13:01:36',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_HotBox','GetObjectInstance','',1),(104,'2018-01-11 13:01:37',1,'main','OnPageStart','compression','','CCompress','OnPageStart','',1),(105,'2018-01-11 13:01:37',10000,'main','OnAfterEpilog','compression','','CCompress','OnAfterEpilog','',1),(106,'2018-01-11 13:01:39',100,'main','OnGroupDelete','fileman','','CFileman','OnGroupDelete','',1),(107,'2018-01-11 13:01:39',100,'main','OnPanelCreate','fileman','','CFileman','OnPanelCreate','',1),(108,'2018-01-11 13:01:39',100,'main','OnModuleUpdate','fileman','','CFileman','OnModuleUpdate','',1),(109,'2018-01-11 13:01:39',100,'main','OnModuleInstalled','fileman','','CFileman','ClearComponentsListCache','',1),(110,'2018-01-11 13:01:39',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapGoogle','GetUserTypeDescription','',1),(111,'2018-01-11 13:01:39',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapYandex','GetUserTypeDescription','',1),(112,'2018-01-11 13:01:39',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyVideo','GetUserTypeDescription','',1),(113,'2018-01-11 13:01:39',100,'main','OnUserTypeBuildList','fileman','','CUserTypeVideo','GetUserTypeDescription','',1),(114,'2018-01-11 13:01:39',100,'main','OnEventLogGetAuditTypes','fileman','','CEventFileman','GetAuditTypes','',1),(115,'2018-01-11 13:01:39',100,'main','OnEventLogGetAuditHandlers','fileman','','CEventFileman','MakeFilemanObject','',1),(116,'2018-01-11 13:01:39',154,'main','OnUserTypeBuildList','fileman','','\\Bitrix\\Fileman\\UserField\\Address','getUserTypeDescription','',1),(117,'2018-01-11 13:01:52',100,'sender','OnConnectorList','form','','\\Bitrix\\Form\\SenderEventHandler','onConnectorListForm','',1),(118,'2018-01-11 13:02:01',100,'main','OnAfterUserUpdate','forum','','CForumUser','OnAfterUserUpdate','',1),(119,'2018-01-11 13:02:01',100,'main','OnGroupDelete','forum','','CForumNew','OnGroupDelete','',1),(120,'2018-01-11 13:02:01',100,'main','OnBeforeLangDelete','forum','','CForumNew','OnBeforeLangDelete','',1),(121,'2018-01-11 13:02:01',100,'main','OnFileDelete','forum','','CForumFiles','OnFileDelete','',1),(122,'2018-01-11 13:02:01',100,'search','OnReindex','forum','','CForumNew','OnReindex','',1),(123,'2018-01-11 13:02:01',100,'main','OnUserDelete','forum','','CForumUser','OnUserDelete','',1),(124,'2018-01-11 13:02:01',100,'iblock','OnIBlockPropertyBuildList','main','/modules/forum/tools/prop_topicid.php','CIBlockPropertyTopicID','GetUserTypeDescription','',1),(125,'2018-01-11 13:02:01',100,'iblock','OnBeforeIBlockElementDelete','forum','','CForumTopic','OnBeforeIBlockElementDelete','',1),(126,'2018-01-11 13:02:01',100,'main','OnEventLogGetAuditTypes','forum','','CForumEventLog','GetAuditTypes','',1),(127,'2018-01-11 13:02:01',100,'main','OnEventLogGetAuditHandlers','forum','','CEventForum','MakeForumObject','',1),(128,'2018-01-11 13:02:01',100,'socialnetwork','OnSocNetGroupDelete','forum','','CForumUser','OnSocNetGroupDelete','',1),(129,'2018-01-11 13:02:01',100,'socialnetwork','OnSocNetLogFormatEvent','forum','','CForumMessage','OnSocNetLogFormatEvent','',1),(130,'2018-01-11 13:02:01',100,'mail','OnGetFilterList','forum','','CForumEMail','OnGetSocNetFilterList','',1),(131,'2018-01-11 13:02:01',100,'main','OnAfterAddRating','forum','','CRatingsComponentsForum','OnAfterAddRating','',1),(132,'2018-01-11 13:02:01',100,'main','OnAfterUpdateRating','forum','','CRatingsComponentsForum','OnAfterUpdateRating','',1),(133,'2018-01-11 13:02:01',100,'main','OnSetRatingsConfigs','forum','','CRatingsComponentsForum','OnSetRatingConfigs','',1),(134,'2018-01-11 13:02:01',100,'main','OnGetRatingsConfigs','forum','','CRatingsComponentsForum','OnGetRatingConfigs','',1),(135,'2018-01-11 13:02:01',100,'main','OnGetRatingsObjects','forum','','CRatingsComponentsForum','OnGetRatingObject','',1),(136,'2018-01-11 13:02:01',100,'main','OnGetRatingContentOwner','forum','','CRatingsComponentsForum','OnGetRatingContentOwner','',1),(137,'2018-01-11 13:02:01',100,'im','OnGetNotifySchema','forum','','CForumNotifySchema','OnGetNotifySchema','',1),(138,'2018-01-11 13:02:01',100,'main','OnAfterRegisterModule','main','/modules/forum/install/index.php','forum','InstallUserFields','',1),(139,'2018-01-11 13:02:01',100,'conversion','OnGetCounterTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetCounterTypes','',1),(140,'2018-01-11 13:02:01',100,'conversion','OnGetRateTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetRateTypes','',1),(141,'2018-01-11 13:02:01',100,'forum','onAfterTopicAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onTopicAdd','',1),(142,'2018-01-11 13:02:01',100,'forum','onAfterMessageAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onMessageAdd','',1),(143,'2018-01-11 13:02:01',100,'socialnetwork','onLogIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2),(144,'2018-01-11 13:02:01',100,'socialnetwork','onLogCommentIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2),(145,'2018-01-11 13:02:23',100,'main','OnBeforeUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeAdd','',1),(146,'2018-01-11 13:02:23',100,'main','OnAfterUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','onAfterUserTypeAdd','',1),(147,'2018-01-11 13:02:23',100,'main','OnBeforeUserTypeDelete','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeDelete','',1),(148,'2018-01-11 13:02:23',100,'main','OnUserTypeBuildList','highloadblock','','CUserTypeHlblock','GetUserTypeDescription','',1),(149,'2018-01-11 13:02:23',100,'iblock','OnIBlockPropertyBuildList','highloadblock','','CIBlockPropertyDirectory','GetUserTypeDescription','',1),(150,'2018-01-11 13:02:32',100,'main','OnGroupDelete','iblock','','CIBlock','OnGroupDelete','',1),(151,'2018-01-11 13:02:32',100,'main','OnBeforeLangDelete','iblock','','CIBlock','OnBeforeLangDelete','',1),(152,'2018-01-11 13:02:32',100,'main','OnLangDelete','iblock','','CIBlock','OnLangDelete','',1),(153,'2018-01-11 13:02:32',100,'main','OnUserTypeRightsCheck','iblock','','CIBlockSection','UserTypeRightsCheck','',1),(154,'2018-01-11 13:02:32',100,'search','OnReindex','iblock','','CIBlock','OnSearchReindex','',1),(155,'2018-01-11 13:02:32',100,'search','OnSearchGetURL','iblock','','CIBlock','OnSearchGetURL','',1),(156,'2018-01-11 13:02:32',100,'main','OnEventLogGetAuditTypes','iblock','','CIBlock','GetAuditTypes','',1),(157,'2018-01-11 13:02:32',100,'main','OnEventLogGetAuditHandlers','iblock','','CEventIBlock','MakeIBlockObject','',1),(158,'2018-01-11 13:02:32',200,'main','OnGetRatingContentOwner','iblock','','CRatingsComponentsIBlock','OnGetRatingContentOwner','',1),(159,'2018-01-11 13:02:32',100,'main','OnTaskOperationsChanged','iblock','','CIBlockRightsStorage','OnTaskOperationsChanged','',1),(160,'2018-01-11 13:02:32',100,'main','OnGroupDelete','iblock','','CIBlockRightsStorage','OnGroupDelete','',1),(161,'2018-01-11 13:02:32',100,'main','OnUserDelete','iblock','','CIBlockRightsStorage','OnUserDelete','',1),(162,'2018-01-11 13:02:32',100,'perfmon','OnGetTableSchema','iblock','','iblock','OnGetTableSchema','',1),(163,'2018-01-11 13:02:32',100,'sender','OnConnectorList','iblock','','\\Bitrix\\Iblock\\SenderEventHandler','onConnectorListIblock','',1),(164,'2018-01-11 13:02:32',10,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDate','GetUserTypeDescription','',1),(165,'2018-01-11 13:02:32',20,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDateTime','GetUserTypeDescription','',1),(166,'2018-01-11 13:02:32',30,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyXmlID','GetUserTypeDescription','',1),(167,'2018-01-11 13:02:32',40,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyFileMan','GetUserTypeDescription','',1),(168,'2018-01-11 13:02:32',50,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyHTML','GetUserTypeDescription','',1),(169,'2018-01-11 13:02:32',60,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementList','GetUserTypeDescription','',1),(170,'2018-01-11 13:02:33',70,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySequence','GetUserTypeDescription','',1),(171,'2018-01-11 13:02:33',80,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementAutoComplete','GetUserTypeDescription','',1),(172,'2018-01-11 13:02:33',90,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySKU','GetUserTypeDescription','',1),(173,'2018-01-11 13:02:33',100,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySectionAutoComplete','GetUserTypeDescription','',1),(174,'2018-01-11 13:02:39',100,'pull','OnGetDependentModule','mobileapp','','CMobileAppPullSchema','OnGetDependentModule','',1),(175,'2018-01-11 13:02:44',100,'perfmon','OnGetTableSchema','perfmon','','perfmon','OnGetTableSchema','',1),(176,'2018-01-11 13:02:47',100,'iblock','OnBeforeIBlockElementDelete','photogallery','','CPhotogalleryElement','OnBeforeIBlockElementDelete','',1),(177,'2018-01-11 13:02:47',100,'iblock','OnAfterIBlockElementAdd','photogallery','','CPhotogalleryElement','OnAfterIBlockElementAdd','',1),(178,'2018-01-11 13:02:47',100,'search','BeforeIndex','photogallery','','CRatingsComponentsPhotogallery','BeforeIndex','',1),(179,'2018-01-11 13:02:48',100,'im','OnGetNotifySchema','photogallery','','CPhotogalleryNotifySchema','OnGetNotifySchema','',1),(180,'2018-01-11 13:02:57',100,'main','OnEventLogGetAuditTypes','scale','','\\Bitrix\\Scale\\Logger','onEventLogGetAuditTypes','',1),(181,'2018-01-11 13:03:01',100,'main','OnChangePermissions','search','','CSearch','OnChangeFilePermissions','',1),(182,'2018-01-11 13:03:01',100,'main','OnChangeFile','search','','CSearch','OnChangeFile','',1),(183,'2018-01-11 13:03:01',100,'main','OnGroupDelete','search','','CSearch','OnGroupDelete','',1),(184,'2018-01-11 13:03:01',100,'main','OnLangDelete','search','','CSearch','OnLangDelete','',1),(185,'2018-01-11 13:03:01',100,'main','OnAfterUserUpdate','search','','CSearchUser','OnAfterUserUpdate','',1),(186,'2018-01-11 13:03:01',100,'main','OnUserDelete','search','','CSearchUser','DeleteByUserID','',1),(187,'2018-01-11 13:03:01',100,'cluster','OnGetTableList','search','','search','OnGetTableList','',1),(188,'2018-01-11 13:03:01',100,'perfmon','OnGetTableSchema','search','','search','OnGetTableSchema','',1),(189,'2018-01-11 13:03:02',90,'main','OnEpilog','search','','CSearchStatistic','OnEpilog','',1),(190,'2018-01-11 13:03:07',100,'main','OnUserDelete','security','','CSecurityUser','OnUserDelete','',1),(191,'2018-01-11 13:03:07',100,'main','OnEventLogGetAuditTypes','security','','CSecurityFilter','GetAuditTypes','',1),(192,'2018-01-11 13:03:07',100,'main','OnEventLogGetAuditTypes','security','','CSecurityAntiVirus','GetAuditTypes','',1),(193,'2018-01-11 13:03:07',100,'main','OnAdminInformerInsertItems','security','','CSecurityFilter','OnAdminInformerInsertItems','',1),(194,'2018-01-11 13:03:07',100,'main','OnAdminInformerInsertItems','security','','CSecuritySiteChecker','OnAdminInformerInsertItems','',1),(195,'2018-01-11 13:03:07',5,'main','OnBeforeProlog','security','','CSecurityFilter','OnBeforeProlog','',1),(196,'2018-01-11 13:03:07',9999,'main','OnEndBufferContent','security','','CSecurityXSSDetect','OnEndBufferContent','',1),(197,'2018-01-11 13:03:07',1,'main','OnBeforeLocalRedirect','security','','CSecurityRedirect','BeforeLocalRedirect','',1),(198,'2018-01-11 13:03:07',1,'main','OnEndBufferContent','security','','CSecurityRedirect','EndBufferContent','',1),(199,'2018-01-11 13:03:14',100,'main','OnPanelCreate','seo','','CSeoEventHandlers','SeoOnPanelCreate','',2),(200,'2018-01-11 13:03:14',100,'fileman','OnIncludeHTMLEditorScript','seo','','CSeoEventHandlers','OnIncludeHTMLEditorScript','',2),(201,'2018-01-11 13:03:14',100,'fileman','OnBeforeHTMLEditorScriptRuns','seo','','CSeoEventHandlers','OnBeforeHTMLEditorScriptRuns','',2),(202,'2018-01-11 13:03:14',100,'iblock','OnAfterIBlockSectionAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addSection','',2),(203,'2018-01-11 13:03:14',100,'iblock','OnAfterIBlockElementAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addElement','',2),(204,'2018-01-11 13:03:14',100,'iblock','OnBeforeIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteSection','',2),(205,'2018-01-11 13:03:14',100,'iblock','OnBeforeIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteElement','',2),(206,'2018-01-11 13:03:14',100,'iblock','OnAfterIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteSection','',2),(207,'2018-01-11 13:03:14',100,'iblock','OnAfterIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteElement','',2),(208,'2018-01-11 13:03:14',100,'iblock','OnBeforeIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateSection','',2),(209,'2018-01-11 13:03:14',100,'iblock','OnBeforeIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateElement','',2),(210,'2018-01-11 13:03:15',100,'iblock','OnAfterIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateSection','',2),(211,'2018-01-11 13:03:15',100,'iblock','OnAfterIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateElement','',2),(212,'2018-01-11 13:03:15',100,'forum','onAfterTopicAdd','seo','','\\Bitrix\\Seo\\SitemapForum','addTopic','',2),(213,'2018-01-11 13:03:15',100,'forum','onAfterTopicUpdate','seo','','\\Bitrix\\Seo\\SitemapForum','updateTopic','',2),(214,'2018-01-11 13:03:15',100,'forum','onAfterTopicDelete','seo','','\\Bitrix\\Seo\\SitemapForum','deleteTopic','',2),(215,'2018-01-11 13:03:15',100,'main','OnAdminIBlockElementEdit','seo','','\\Bitrix\\Seo\\AdvTabEngine','eventHandler','',2),(216,'2018-01-11 13:03:15',100,'main','OnBeforeProlog','seo','','\\Bitrix\\Seo\\AdvSession','checkSession','',2),(217,'2018-01-11 13:03:15',100,'sale','OnOrderSave','seo','','\\Bitrix\\Seo\\AdvSession','onOrderSave','',2),(218,'2018-01-11 13:03:15',100,'sale','OnBasketOrder','seo','','\\Bitrix\\Seo\\AdvSession','onBasketOrder','',2),(219,'2018-01-11 13:03:15',100,'sale','onSalePayOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSalePayOrder','',2),(220,'2018-01-11 13:03:15',100,'sale','onSaleDeductOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeductOrder','',2),(221,'2018-01-11 13:03:15',100,'sale','onSaleDeliveryOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeliveryOrder','',2),(222,'2018-01-11 13:03:15',100,'sale','onSaleStatusOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleStatusOrder','',2),(223,'2018-01-11 13:03:15',100,'conversion','OnSetDayContextAttributes','seo','','\\Bitrix\\Seo\\ConversionHandler','onSetDayContextAttributes','',2),(224,'2018-01-11 13:03:15',100,'conversion','OnGetAttributeTypes','seo','','\\Bitrix\\Seo\\ConversionHandler','onGetAttributeTypes','',2),(225,'2018-01-11 13:03:15',100,'catalog','OnProductUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2),(226,'2018-01-11 13:03:15',100,'catalog','OnProductSetAvailableUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2),(227,'2018-01-11 13:03:17',100,'main','OnUserDelete','socialservices','','CSocServAuthDB','OnUserDelete','',1),(228,'2018-01-11 13:03:17',100,'timeman','OnAfterTMReportDailyAdd','socialservices','','CSocServAuthDB','OnAfterTMReportDailyAdd','',1),(229,'2018-01-11 13:03:17',100,'timeman','OnAfterTMDayStart','socialservices','','CSocServAuthDB','OnAfterTMDayStart','',1),(230,'2018-01-11 13:03:18',100,'timeman','OnTimeManShow','socialservices','','CSocServEventHandlers','OnTimeManShow','',1),(231,'2018-01-11 13:03:18',100,'main','OnFindExternalUser','socialservices','','CSocServAuthDB','OnFindExternalUser','',1),(232,'2018-01-11 13:03:18',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkOldUser','',1),(233,'2018-01-11 13:03:18',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkAbandonedUser','',1),(234,'2018-01-11 13:03:20',100,'main','OnBeforeLangDelete','subscribe','','CRubric','OnBeforeLangDelete','',1),(235,'2018-01-11 13:03:20',100,'main','OnUserDelete','subscribe','','CSubscription','OnUserDelete','',1),(236,'2018-01-11 13:03:20',100,'main','OnUserLogout','subscribe','','CSubscription','OnUserLogout','',1),(237,'2018-01-11 13:03:20',100,'main','OnGroupDelete','subscribe','','CPosting','OnGroupDelete','',1),(238,'2018-01-11 13:03:20',100,'sender','OnConnectorList','subscribe','','Bitrix\\Subscribe\\SenderEventHandler','onConnectorListSubscriber','',1),(239,'2018-01-11 13:03:21',100,'main','OnPanelCreate','translate','','CTranslateEventHandlers','TranslatOnPanelCreate','',1),(240,'2018-01-11 13:03:25',100,'main','OnBeforeProlog','main','/modules/vote/keepvoting.php','','','',1),(241,'2018-01-11 13:03:25',200,'main','OnUserTypeBuildList','vote','','Bitrix\\Vote\\Uf\\VoteUserType','getUserTypeDescription','',1),(242,'2018-01-11 13:03:25',200,'main','OnUserLogin','vote','','CVoteUser','OnUserLogin','',1),(243,'2018-01-11 13:03:25',100,'im','OnGetNotifySchema','vote','','CVoteNotifySchema','OnGetNotifySchema','',1),(244,'2018-01-11 13:03:49',100,'main','OnBeforeProlog','main','/modules/main/install/wizard_sol/panel_button.php','CWizardSolPanel','ShowPanel','',1);
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_operation`
--

DROP TABLE IF EXISTS `b_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_operation`
--

LOCK TABLES `b_operation` WRITE;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` VALUES (1,'edit_php','main',NULL,'module'),(2,'view_own_profile','main',NULL,'module'),(3,'edit_own_profile','main',NULL,'module'),(4,'view_all_users','main',NULL,'module'),(5,'view_groups','main',NULL,'module'),(6,'view_tasks','main',NULL,'module'),(7,'view_other_settings','main',NULL,'module'),(8,'view_subordinate_users','main',NULL,'module'),(9,'edit_subordinate_users','main',NULL,'module'),(10,'edit_all_users','main',NULL,'module'),(11,'edit_groups','main',NULL,'module'),(12,'edit_tasks','main',NULL,'module'),(13,'edit_other_settings','main',NULL,'module'),(14,'cache_control','main',NULL,'module'),(15,'lpa_template_edit','main',NULL,'module'),(16,'view_event_log','main',NULL,'module'),(17,'edit_ratings','main',NULL,'module'),(18,'manage_short_uri','main',NULL,'module'),(19,'fm_view_permission','main',NULL,'file'),(20,'fm_view_file','main',NULL,'file'),(21,'fm_view_listing','main',NULL,'file'),(22,'fm_edit_existent_folder','main',NULL,'file'),(23,'fm_create_new_file','main',NULL,'file'),(24,'fm_edit_existent_file','main',NULL,'file'),(25,'fm_create_new_folder','main',NULL,'file'),(26,'fm_delete_file','main',NULL,'file'),(27,'fm_delete_folder','main',NULL,'file'),(28,'fm_edit_in_workflow','main',NULL,'file'),(29,'fm_rename_file','main',NULL,'file'),(30,'fm_rename_folder','main',NULL,'file'),(31,'fm_upload_file','main',NULL,'file'),(32,'fm_add_to_menu','main',NULL,'file'),(33,'fm_download_file','main',NULL,'file'),(34,'fm_lpa','main',NULL,'file'),(35,'fm_edit_permission','main',NULL,'file'),(36,'bitrixcloud_monitoring','bitrixcloud',NULL,'module'),(37,'bitrixcloud_backup','bitrixcloud',NULL,'module'),(38,'bitrixcloud_cdn','bitrixcloud',NULL,'module'),(39,'clouds_browse','clouds',NULL,'module'),(40,'clouds_upload','clouds',NULL,'module'),(41,'clouds_config','clouds',NULL,'module'),(42,'fileman_view_all_settings','fileman','','module'),(43,'fileman_edit_menu_types','fileman','','module'),(44,'fileman_add_element_to_menu','fileman','','module'),(45,'fileman_edit_menu_elements','fileman','','module'),(46,'fileman_edit_existent_files','fileman','','module'),(47,'fileman_edit_existent_folders','fileman','','module'),(48,'fileman_admin_files','fileman','','module'),(49,'fileman_admin_folders','fileman','','module'),(50,'fileman_view_permissions','fileman','','module'),(51,'fileman_edit_all_settings','fileman','','module'),(52,'fileman_upload_files','fileman','','module'),(53,'fileman_view_file_structure','fileman','','module'),(54,'fileman_install_control','fileman','','module'),(55,'medialib_view_collection','fileman','','medialib'),(56,'medialib_new_collection','fileman','','medialib'),(57,'medialib_edit_collection','fileman','','medialib'),(58,'medialib_del_collection','fileman','','medialib'),(59,'medialib_access','fileman','','medialib'),(60,'medialib_new_item','fileman','','medialib'),(61,'medialib_edit_item','fileman','','medialib'),(62,'medialib_del_item','fileman','','medialib'),(63,'sticker_view','fileman','','stickers'),(64,'sticker_edit','fileman','','stickers'),(65,'sticker_new','fileman','','stickers'),(66,'sticker_del','fileman','','stickers'),(67,'hl_element_read','highloadblock',NULL,'module'),(68,'hl_element_write','highloadblock',NULL,'module'),(69,'hl_element_delete','highloadblock',NULL,'module'),(70,'section_read','iblock',NULL,'iblock'),(71,'element_read','iblock',NULL,'iblock'),(72,'section_element_bind','iblock',NULL,'iblock'),(73,'iblock_admin_display','iblock',NULL,'iblock'),(74,'element_edit','iblock',NULL,'iblock'),(75,'element_edit_price','iblock',NULL,'iblock'),(76,'element_delete','iblock',NULL,'iblock'),(77,'element_bizproc_start','iblock',NULL,'iblock'),(78,'section_edit','iblock',NULL,'iblock'),(79,'section_delete','iblock',NULL,'iblock'),(80,'section_section_bind','iblock',NULL,'iblock'),(81,'element_edit_any_wf_status','iblock',NULL,'iblock'),(82,'iblock_edit','iblock',NULL,'iblock'),(83,'iblock_delete','iblock',NULL,'iblock'),(84,'iblock_rights_edit','iblock',NULL,'iblock'),(85,'iblock_export','iblock',NULL,'iblock'),(86,'section_rights_edit','iblock',NULL,'iblock'),(87,'element_rights_edit','iblock',NULL,'iblock'),(88,'security_filter_bypass','security',NULL,'module'),(89,'security_edit_user_otp','security',NULL,'module'),(90,'security_module_settings_read','security',NULL,'module'),(91,'security_panel_view','security',NULL,'module'),(92,'security_filter_settings_read','security',NULL,'module'),(93,'security_otp_settings_read','security',NULL,'module'),(94,'security_iprule_admin_settings_read','security',NULL,'module'),(95,'security_session_settings_read','security',NULL,'module'),(96,'security_redirect_settings_read','security',NULL,'module'),(97,'security_stat_activity_settings_read','security',NULL,'module'),(98,'security_iprule_settings_read','security',NULL,'module'),(99,'security_antivirus_settings_read','security',NULL,'module'),(100,'security_frame_settings_read','security',NULL,'module'),(101,'security_module_settings_write','security',NULL,'module'),(102,'security_filter_settings_write','security',NULL,'module'),(103,'security_otp_settings_write','security',NULL,'module'),(104,'security_iprule_admin_settings_write','security',NULL,'module'),(105,'security_session_settings_write','security',NULL,'module'),(106,'security_redirect_settings_write','security',NULL,'module'),(107,'security_stat_activity_settings_write','security',NULL,'module'),(108,'security_iprule_settings_write','security',NULL,'module'),(109,'security_file_verifier_sign','security',NULL,'module'),(110,'security_file_verifier_collect','security',NULL,'module'),(111,'security_file_verifier_verify','security',NULL,'module'),(112,'security_antivirus_settings_write','security',NULL,'module'),(113,'security_frame_settings_write','security',NULL,'module'),(114,'seo_settings','seo','','module'),(115,'seo_tools','seo','','module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option`
--

DROP TABLE IF EXISTS `b_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option`
--

LOCK TABLES `b_option` WRITE;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` VALUES ('main','~ft_b_user','a:3:{s:19:\"SEARCH_USER_CONTENT\";b:1;s:25:\"SEARCH_DEPARTMENT_CONTENT\";b:1;s:20:\"SEARCH_ADMIN_CONTENT\";b:1;}',NULL,NULL),('main','rating_authority_rating','2',NULL,NULL),('main','rating_assign_rating_group_add','1',NULL,NULL),('main','rating_assign_rating_group_delete','1',NULL,NULL),('main','rating_assign_rating_group','3',NULL,NULL),('main','rating_assign_authority_group_add','2',NULL,NULL),('main','rating_assign_authority_group_delete','2',NULL,NULL),('main','rating_assign_authority_group','4',NULL,NULL),('main','rating_community_size','1',NULL,NULL),('main','rating_community_authority','30',NULL,NULL),('main','rating_vote_weight','10',NULL,NULL),('main','rating_normalization_type','auto',NULL,NULL),('main','rating_normalization','10',NULL,NULL),('main','rating_count_vote','10',NULL,NULL),('main','rating_authority_weight_formula','Y',NULL,NULL),('main','rating_community_last_visit','90',NULL,NULL),('main','rating_text_like_y','Нравится',NULL,NULL),('main','rating_text_like_n','Не нравится',NULL,NULL),('main','rating_text_like_d','Это нравится',NULL,NULL),('main','rating_assign_type','auto',NULL,NULL),('main','rating_vote_type','like',NULL,NULL),('main','rating_self_vote','Y',NULL,NULL),('main','rating_vote_show','Y',NULL,NULL),('main','rating_vote_template','like',NULL,NULL),('main','rating_start_authority','3',NULL,NULL),('main','PARAM_MAX_SITES','2',NULL,NULL),('main','PARAM_MAX_USERS','0',NULL,NULL),('main','distributive6','Y',NULL,NULL),('main','~new_license11_sign','Y',NULL,NULL),('main','GROUP_DEFAULT_TASK','1',NULL,NULL),('main','vendor','1c_bitrix',NULL,NULL),('main','admin_lid','ru',NULL,NULL),('main','update_site','www.bitrixsoft.com',NULL,NULL),('main','update_site_ns','Y',NULL,NULL),('main','optimize_css_files','Y',NULL,NULL),('main','optimize_js_files','Y',NULL,NULL),('main','admin_passwordh','FVkQemYUBgYtCUVcDxcHCgsTAQ==',NULL,NULL),('main','server_uniq_id','ed21e098b7fdbb597fa7746cf2ee8909',NULL,NULL),('blog','socNetNewPerms','Y',NULL,NULL),('fileman','use_editor_3','Y',NULL,NULL),('forum','FILTER_DICT_W','1',NULL,'ru'),('forum','FILTER_DICT_T','2',NULL,'ru'),('forum','FILTER_DICT_W','3',NULL,'en'),('forum','FILTER_DICT_T','4',NULL,'en'),('forum','FILTER','N',NULL,NULL),('search','version','v2.0',NULL,NULL),('search','dbnode_id','N',NULL,NULL),('search','dbnode_status','ok',NULL,NULL),('security','ipcheck_disable_file','/bitrix/modules/ipcheck_disable_22c3c9f8c8636a2f043da4a512c83920',NULL,NULL),('security','redirect_sid','069bk74ivgur9izfgb4mrltmnp0azvyo',NULL,NULL),('vote','VOTE_DIR','',NULL,NULL),('vote','VOTE_COMPATIBLE_OLD_TEMPLATE','N',NULL,NULL),('main','email_from','admin@gmail.com',NULL,NULL),('fileman','different_set','Y',NULL,NULL),('fileman','menutypes','a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}',NULL,'s1'),('main','wizard_template_id','furniture',NULL,'s1'),('main','wizard_site_logo','0',NULL,'s1'),('main','wizard_furniture_theme_id','pale-blue',NULL,'s1'),('socialnetwork','allow_tooltip','N',NULL,NULL),('fileman','propstypes','a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}',NULL,'s1'),('search','suggest_save_days','250',NULL,NULL),('search','use_tf_cache','Y',NULL,NULL),('search','use_word_distance','Y',NULL,NULL),('search','use_social_rating','Y',NULL,NULL),('iblock','use_htmledit','Y',NULL,NULL),('socialservices','auth_services','a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}',NULL,NULL),('main','wizard_firstcorp_furniture_s1','Y',NULL,NULL),('main','wizard_solution','corp_furniture',NULL,'s1'),('fileman','stickers_use_hotkeys','N',NULL,NULL),('main','signer_default_key','213ea376d973c06bc8146a9c79d0e4b57783d63635b206ec21168676dfeb7489947ec64bdf7c964e8c6f470439fad1ea9bec9af838297477a803d3e929536ebe',NULL,NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cache`
--

DROP TABLE IF EXISTS `b_perf_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cache`
--

LOCK TABLES `b_perf_cache` WRITE;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cluster`
--

DROP TABLE IF EXISTS `b_perf_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cluster`
--

LOCK TABLES `b_perf_cluster` WRITE;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_component`
--

DROP TABLE IF EXISTS `b_perf_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_component`
--

LOCK TABLES `b_perf_component` WRITE;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_error`
--

DROP TABLE IF EXISTS `b_perf_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_error`
--

LOCK TABLES `b_perf_error` WRITE;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_history`
--

DROP TABLE IF EXISTS `b_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_history`
--

LOCK TABLES `b_perf_history` WRITE;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_hit`
--

DROP TABLE IF EXISTS `b_perf_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_hit`
--

LOCK TABLES `b_perf_hit` WRITE;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_ban`
--

DROP TABLE IF EXISTS `b_perf_index_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_ban`
--

LOCK TABLES `b_perf_index_ban` WRITE;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_complete`
--

DROP TABLE IF EXISTS `b_perf_index_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_complete`
--

LOCK TABLES `b_perf_index_complete` WRITE;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest`
--

DROP TABLE IF EXISTS `b_perf_index_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest`
--

LOCK TABLES `b_perf_index_suggest` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest_sql`
--

DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest_sql`
--

LOCK TABLES `b_perf_index_suggest_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql`
--

DROP TABLE IF EXISTS `b_perf_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql`
--

LOCK TABLES `b_perf_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql_backtrace`
--

DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql_backtrace`
--

LOCK TABLES `b_perf_sql_backtrace` WRITE;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_column_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_column_stat`
--

LOCK TABLES `b_perf_tab_column_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_stat`
--

LOCK TABLES `b_perf_tab_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_test`
--

DROP TABLE IF EXISTS `b_perf_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_test`
--

LOCK TABLES `b_perf_test` WRITE;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting`
--

DROP TABLE IF EXISTS `b_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting`
--

LOCK TABLES `b_posting` WRITE;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_email`
--

DROP TABLE IF EXISTS `b_posting_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_email`
--

LOCK TABLES `b_posting_email` WRITE;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_file`
--

DROP TABLE IF EXISTS `b_posting_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_file`
--

LOCK TABLES `b_posting_file` WRITE;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_group`
--

DROP TABLE IF EXISTS `b_posting_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_group`
--

LOCK TABLES `b_posting_group` WRITE;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_rubric`
--

DROP TABLE IF EXISTS `b_posting_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_rubric`
--

LOCK TABLES `b_posting_rubric` WRITE;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating`
--

DROP TABLE IF EXISTS `b_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating`
--

LOCK TABLES `b_rating` WRITE;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` VALUES (1,'N','Рейтинг','USER','SUM','2018-01-11 15:18:59',NULL,NULL,'Y','N','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),(2,'N','Авторитет','USER','SUM','2018-01-11 15:18:59',NULL,NULL,'Y','Y','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component`
--

DROP TABLE IF EXISTS `b_rating_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component`
--

LOCK TABLES `b_rating_component` WRITE;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component_results`
--

DROP TABLE IF EXISTS `b_rating_component_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component_results`
--

LOCK TABLES `b_rating_component_results` WRITE;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_prepare`
--

DROP TABLE IF EXISTS `b_rating_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_prepare`
--

LOCK TABLES `b_rating_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_results`
--

DROP TABLE IF EXISTS `b_rating_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_results`
--

LOCK TABLES `b_rating_results` WRITE;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule`
--

DROP TABLE IF EXISTS `b_rating_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule`
--

LOCK TABLES `b_rating_rule` WRITE;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` VALUES (1,'N','Добавление в группу пользователей, имеющих право голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2018-01-11 15:18:59','2018-01-11 15:18:59',NULL),(2,'N','Удаление из группы пользователей, не имеющих права голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2018-01-11 15:18:59','2018-01-11 15:18:59',NULL),(3,'N','Добавление в группу пользователей, имеющих право голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2018-01-11 15:18:59','2018-01-11 15:18:59',NULL),(4,'N','Удаление из группы пользователей, не имеющих права голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2018-01-11 15:18:59','2018-01-11 15:18:59',NULL),(5,'Y','Автоматическое голосование за авторитет пользователя','USER','VOTE',NULL,'CRatingRulesMain','voteCheck','a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.10000000000000001;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.10000000000000001;}}','empty','a:0:{}','N','empty','empty','N','empty ','empty','2018-01-11 15:18:59','2018-01-11 15:18:59',NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule_vetting`
--

DROP TABLE IF EXISTS `b_rating_rule_vetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule_vetting`
--

LOCK TABLES `b_rating_rule_vetting` WRITE;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_user`
--

DROP TABLE IF EXISTS `b_rating_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_user`
--

LOCK TABLES `b_rating_user` WRITE;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` VALUES (1,2,1,3.0000,30.0000,13),(2,2,2,3.0000,30.0000,13),(3,2,3,3.0000,30.0000,13),(4,2,4,3.0000,30.0000,13),(5,2,5,3.0000,30.0000,13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote`
--

DROP TABLE IF EXISTS `b_rating_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote`
--

LOCK TABLES `b_rating_vote` WRITE;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote_group`
--

DROP TABLE IF EXISTS `b_rating_vote_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote_group`
--

LOCK TABLES `b_rating_vote_group` WRITE;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` VALUES (5,1,'A'),(1,1,'R'),(3,1,'R'),(2,3,'R'),(4,3,'R'),(6,4,'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting`
--

DROP TABLE IF EXISTS `b_rating_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting`
--

LOCK TABLES `b_rating_voting` WRITE;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting_prepare`
--

DROP TABLE IF EXISTS `b_rating_voting_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting_prepare`
--

LOCK TABLES `b_rating_voting_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_weight`
--

DROP TABLE IF EXISTS `b_rating_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_weight`
--

LOCK TABLES `b_rating_weight` WRITE;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` VALUES (1,-1000000.0000,1000000.0000,1.0000,10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content`
--

DROP TABLE IF EXISTS `b_search_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content`
--

LOCK TABLES `b_search_content` WRITE;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` VALUES (1,'2018-01-11 16:04:14','main','s1|/services/index.php',0,NULL,NULL,NULL,'/services/index.php','Услуги','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(2,'2018-01-11 16:04:14','main','s1|/products/index.php',0,NULL,NULL,NULL,'/products/index.php','Продукция','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(3,'2018-01-15 13:30:35','main','s1|/news/index.php',0,NULL,NULL,NULL,'/news/index.php','Новости','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(4,'2018-01-11 16:04:14','main','s1|/search/map.php',0,NULL,NULL,NULL,'/search/map.php','Карта сайта','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(5,'2018-01-11 16:04:14','main','s1|/search/index.php',0,NULL,NULL,NULL,'/search/index.php','Поиск','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(6,'2018-01-11 16:04:14','main','s1|/_index.php',0,NULL,NULL,NULL,'/_index.php','Мебельная компания','Наша компания существует на Российском рынке с 1992 года. За это время «Мебельная компания» прошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России.\n«Мебельная компания» осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход – с другой.\nНаша продукция\rНаши услуги','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(7,'2018-01-11 16:04:14','main','s1|/company/mission.php',0,NULL,NULL,NULL,'/company/mission.php','Миссия и стратегия','&laquo;Мебельная компания&raquo;\r- динамично развивающееся производственное 							предприятие, которое имеет перед собой \nясно выраженные цели и инструменты для 							их достижени.Мы предоставляем каждому лучшую возможность обустроить свое жизненное \nи рабочее пространство.Мы работаем на долгосрочную перспективу и предлагаем оптимальные 							решения. Компания \r&laquo;Мебельная компания&raquo;\r- \nнадежный, технологичный, гибкий поставщик 							с большими мощностями. 						\rЦели и задачи\rОправдывать ожидания заказчика: &ldquo;Клиент всегда прав&rdquo;. Только Потребитель формирует 									единую систему взглядов на качество \nвыпускаемой продукции и работ.\rДобиться от работников компании понимания их личной ответственности за качество 									работ.\rПутем повышения качества продукции и работ постоянно увеличивать объемы производства 									с целью последующего реинвестирования \nприбыли в развитие компании.\rОбеспечивать строгое соответствие производимой продукции требованиям потребителей, 									нормам и правилам \nбезопасности, требованиям защиты окружающей среды.\rПолитика компании\rПостоянное совершенствование системы качества. Своевременное и эффективное принятие 									корректирующих мер .\rЗабота о работниках компании. Создание условий труда и оснащение рабочих мест, соответствующих 									всем санитарным \nи гигиеническим нормам.\rПовышение благосостояния сотрудников. Обеспечение морального и материального удовлетворения 									работников компании.\rСистематическое обучение работников всех уровней с целью постоянного повышения их 									профессионального мастерства.\rВнедрение высокопроизводительного оборудования и новейших технологий для повышения 									производительности труда, \nоптимизации затрат и, как результат, снижения цен 									на выпускаемую продукцию.\rСоздание новых рабочих мест. Привлечение на работу специалистов высокой квалификации.\rВыход на международный рынок.\rМы развиваем доверительные взаимовыгодные отношения со своими партнерами в долгосрочных 							интересах нашего бизнеса. \n&laquo;Мебельная компания&raquo;\rответственно относится 							к выполнению взятых на себя обязательств и ждет такого же \nподхода к делу от 							своих партнеров по бизнесу. Эта требовательность &ndash; залог нашей долгосрочной прибыльности. 						\rСо дня своего основания \r&laquo;Мебельная компания&raquo;\rсодействует росту благосостояния 							регионов России. Мы понимаем важность \nсоциальной ответственности нашей Компании 							и останемся примером в вопросах социальной защищенности наших сотрудников.','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(8,'2018-01-11 16:04:14','main','s1|/company/history.php',0,NULL,NULL,NULL,'/company/history.php','История','1992г. 								\r&laquo;Мебельная компания&raquo;\rначиналась с изготовления мебели для школ и офисов. Первое 									производство мебели располагалось в арендуемой мастерской, площадью 400 м2 с одним 									деревообрабатывающим станком. В компании работало двадцать человек. Все заработанные 									средства вкладывались в развитие, что позволило молодой Компании расти быстрыми 									темпами. 								\r1993г. 								\rВведен в эксплуатацию новый цех площадью 700 м2, ставший первой собственностью 									\r&laquo;Мебельной компании&raquo;\r. Модернизация производственной базы предприятия стала хорошей 									традицией. Компания постепенно перешла к более совершенному оборудованию, что позволило 									повысить уровень качества выпускаемой продукции и значительно увеличить объемы производства. 								\r1998г. 								\rВ Воронеже открыт первый фирменный магазин-салон \r&laquo;Мебельная компания&raquo;\r. Шаг за шагом 									продукция предприятия завоевывала регионы Сибири и Урала, Москвы и Подмосковья, 									Юга и Северо-Запада России. Производственные площади компании увеличены до 5000 									м2. 								\r1999г. 								\r&laquo;Мебельная компания&raquo;\rстала дипломантом одной из самых престижных международных 									выставок \r&laquo;ЕвроЭкспоМебель-99&raquo;\r- первое официальное признание мебельной продукции 									&laquo;Мебельной компании&raquo;. В этом же году компания выходит на мировой рынок. Был заключен 									ряд контрактов на поставку мебели в страны СНГ и Ближнего Зарубежья. 								\r2000г. 								\rКоллектив компании насчитывает более 500 сотрудников. Заключаются новые контракт 									на поставку мебели в европейские страны. 								\r2002г. 								\r&laquo;Мебельная компания&raquo;\rвошла в десятку лучших производителей мебели по данным ведущих 									мебельных салонов России, а также в число лидеров организационного развития. 								\r2003г. 								\rПриступили к строительству склада материалов. В Москве открыт филиал компании. \nПроведена первая конференция партнеров, результатом которой стало укрепление взаимовыгодных 									отношений и заключение дилерских договоров. 								\r2004г. 								\rЗавершено строительство и оснащение нового производственного корпуса и склада материалов. \nРасширено представительство компании на российском рынке и за рубежом. \nОткрыто 									региональное представительство \r&laquo;Мебельной компании&raquo;\rв Екатеринбурге. 								\r2005г. 								\rКомпания приобретает новое производственное оборудование концерна - угловую линию 									раскроя материалов и линию загрузки выгрузки. \nНачинается выпуск продукции в 									натуральном шпоне. Формируется отдельный склад материалов и комплектующих. \nВ этом же году открывается Фабрика мягкой мебели \r&laquo;МебельПлюс&raquo;\r2006г. 								\rОткрыты региональные представительства \r&laquo;Мебельной компании&raquo;\rв Санкт-Петербурге 									и Нижнем Новгороде. \nРазвивается собственная розничная сеть фирменных магазинов-салонов 									на территории России. 								\r2007г. 								\rЗавершено строительство второй фабрики. Общая площадь производсвенно-складских корпусов 									Компании составляет уже более 30000 м2. \nПроведена вторая конференция партнеров 									компании \r\"Технология успешного бизнеса\"\r. 								\r2008г. 								\rОткрыто новое предприятие для производства мебели по индивидуальным проектам \r&laquo;Комфорт&raquo;\r. \n&laquo;Мебельная компания&raquo;\rпродолжает обновление оборудования. 								\r2008г. 								\rНовейшим оборудованием укомплектована вторая фабрика. Запущена вторая производственная 									линия. \nПроведена третья конференция \r&laquo;Партнерство - бизнес сегодня&raquo;\rПринято решение о строительстве третьей фабрики. Площадь производственно &mdash; складских 									корпусов составит более 70000м2. \nПо всей стране и зарубежом открыто 37 мебельных 									салонов. \nВ Компании работает более полутора тысяч сотрудников.','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(9,'2018-01-11 16:04:14','main','s1|/company/vacancies.php',0,NULL,NULL,NULL,'/company/vacancies.php','Вакансии','','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(10,'2018-01-11 16:04:14','main','s1|/company/index.php',0,NULL,NULL,NULL,'/company/index.php','О компании','Наша компания существует на Российском рынке с 1992 года. За это время \r&laquo;Мебельная компания&raquo;\rпрошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России. 						 \rГлавное правило - индивидуальный подход к каждому клиенту\rНа сегодняшний день нами разработано более пятисот моделей для офиса и дома. Вместе с тем мы стремимся обеспечить неповторимость своей продукции. Мы изготовим мебель для кухни, детской, гостиной, спальной или ванной комнаты, мебель для офиса особого дизайна и нестандартного размера. \rНаши дизайнеры произведут замеры помещения и вместе с вами разработают дизайн-проект мебели для вашего интерьера, подобрав с высокой точностью размеры, модели, цвета, помогут оптимально расположить мебель. \rВаш проект будет создан с учетом всех нюансов и прорисовкой мельчайших деталей. Результаты совместного творчества вы сможете посмотреть в объемном представлении. Вам наглядно продемонстрируют, как будут выглядеть в жизни выбранные элементы интерьера при разном освещении, в конкретном помещении, сделанные из определенных материалов. В ваше распоряжение будет предоставлено много различных вариантов, из которых Вы сможете выбрать наиболее подходящий именно Вам. 						 					\rЗаказ будет выполнен и доставлен точно в срок. Все работы по сборке и установке мебели осуществляют сотрудники нашей компании. Строгий контроль качества осуществляется на всех этапах работ: от момента оформления заказа до момента приема выполненных работ. \rПередовые технологии и бесценный опыт\rИспользование передовых компьютерных технологий, многолетний опыт наших специалистов позволяют произвести грамотные расчеты и снизить расход материалов и себестоимость продукции, избежать ошибок при проектировании и оптимизировать дизайн комплексных интерьеров. Гарантия на нашу продукцию составляет 18 месяцев, а на отдельную продукцию 36 месяцев. \rМы гордимся нашими сотрудниками прошедшими профессиональное обучение в лучших учебных заведениях России и зарубежья. У нас трудятся высококлассные специалисты разных возрастов. Мы ценим энтузиазм молодежи и бесценный опыт старшего поколения. Все мы разные, но нас объединяет преданность своему делу и вера в идеи нашей компании. \rВысочайшие стандарты качества - залог нашего успеха\r&laquo;Мебельная компания&raquo;\rосуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход &ndash; с другой. \rЕжегодно наша продукция проходит сертификационные испытания в специализированных лабораториях России и имеет сертификаты соответствия продукции нормам безопасности и качества. Кроме того, \r&laquo;Мебельная компания&raquo;\rодной из первых среди мебельных производителей России в 2003 году прошла аудит на соответствие требованиям системы менеджмента качества &laquo;ИСО 9000&raquo; и получила сертификат соответствия системы качества на предприятии нормам международного стандарта.','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(11,'2018-01-11 16:04:14','main','s1|/company/management.php',0,NULL,NULL,NULL,'/company/management.php','Руководство','Успешное развитие бизнеса &ndash; во многом результат квалифицированной работы руководства. 							\r&laquo;Мебельная компания&raquo;\rна мебельном рынке уже 18 лет. За это время Компания 							не только сохранила, но и упрочила лидирующие позиции среди ведущих игроков мебельного 							рынка. 						\r&laquo;Мебельная компания&raquo;\rиз года в год расширяет ассортимент выпускаемой продукции, 							наращивает темпы и объемы производства, увеличивает производственные и складские 							площади, развивает отношения с партнерами со всех регионов страны и налаживает связи 							с зарубежными партнерами. В большой степени это заслуга хорошо подготовленного руководящего 							состава и его грамотной политики. 						\rСобственник Компании &laquo;Мебельная компания&raquo;\rКолесников Виктор Федорович 								\rРодился 3 сентября 1964 года.\nОбразование: закончил авиационный факультет Воронежского 									государственного политехнического института. В 1994 году прошел обучение по программе 									&laquo;Подготовка малого и среднего бизнеса&raquo; в США.\nВ настоящее время Виктор Федорович 									возглавляет Управляющую компанию, которая координирует деятельность предприятий, 									входящих в Группу Компаний \r&laquo;Мебельная компания&raquo;\r. 								\rГенеральный директор &laquo;Мебельной компании&raquo;\rРатченко Александр Петрович 								\rРодился 5 июня 1962 года.\nОбразование: Воронежский политехнический институт 									по специальности инженер-технолог; программа &laquo;Эффективное развитие производства&raquo; 									(США).\nВ \r&laquo;Мебельной компании&raquo;\rСергей Фомич с 1994 года. За это время прошел 									путь от начальника цеха до генерального директора предприятия. 								\rЗаместитель генерального директора Управляющей компании\rРоговой Андрей Владимирович 								\rОбразование: факультет радиотехники Воронежского государственного технического университета.\nВ Компании с 1 июня 2000 года.','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(12,'2018-01-11 16:04:14','main','s1|/login/index.php',0,NULL,NULL,NULL,'/login/index.php','Вход на сайт','Вы зарегистрированы и успешно авторизовались.\rВернуться на главную страницу','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(13,'2018-01-11 16:04:14','main','s1|/contacts/index.php',0,NULL,NULL,NULL,'/contacts/index.php','Контакты','Обратитесь к нашим специалистам и получите профессиональную консультацию по вопросам создания и покупки мебели (от дизайна, разработки технического задания до доставки мебели к Вам домой).\rВы можете обратиться к нам по телефону, по электронной почте или договориться о встрече в нашем офисе. Будем рады помочь вам и ответить на все ваши вопросы. \rТелефоны\rТелефон/факс:\n(495) 212-85-06\rТелефоны:\n(495) 212-85-07\r(495) 212-85-08\rEmail\rinfo@example.ru\r&mdash; общие вопросы\rsales@example.ru\r&mdash; приобретение продукции\rmarketing@example.ru\r&mdash; маркетинг/мероприятия/PR\rОфис в Москве','','','','77c87a265abf6bbf1d4938dfd86b5652',NULL,NULL),(14,'2010-05-25 00:00:00','iblock','1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Мебельный форум Беларуси','С 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году.\r\n\rС 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из \rБеларуси, Австрии, Латвии, Литвы, России, Польши \rи\rУкраины\r. В составе форума состоится пять выставок:\"Минский мебельный салон\", \"Мебельные технологии\", \"ОфисКомфорт\", \"Кухня\" и \"Домотех\". Экспозиция будет строиться по принципу двух тематических секторов:\rготовой мебели\rи \rматериалов для ее производства\r.\rВ секторе готовой мебели будут представлены:\rкорпусная и мягкая мебель;\rмебель для детей и молодежи;\rпредметы интерьера;\rкухонная мебель;\rмебель для офиса и административных зданий.\rВ секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\rПомимо расширенной экспозиции пяти тематических выставок \"Экспофорум\" подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума \"\rНародное признание\r\". В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\rМебельный Форум\rпредоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок \rМебельного Форума\r.\rПрием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.','','news','1',NULL,'2010-05-25 00:00:00',NULL),(15,'2010-05-26 00:00:00','iblock','2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Международная мебельная выставка SALON DEL MOBILE','В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. \r\nВ 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','','news','1',NULL,'2010-05-26 00:00:00',NULL),(16,'2010-05-27 00:00:00','iblock','3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Получено прочное водостойкое соединение','Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. \r\n\rАвторы изобретения\r: Разиньков Егор Михайлович и Мещерякова Анна Анатольевна \rПатент Российской Федерации RU2277566\rОписание изобретения\rИзобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\rДанная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. \rИзобретение решает задачу по получению прочного и водостойкого клеевого соединения.\rЭто достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\rКарбамидомеламиноформальдегидная смола\r64,5-79,2\r10%-ный Раствор щавелевой кислоты\r4,4-20,5\rОтвердитель для карбамидомеламиноформальдегидной \r0,6-2,0\rсмолы 2542\r13,0-15,8','','news','1',NULL,'2010-05-27 00:00:00',NULL),(17,'2018-01-15 14:31:16','iblock','S1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Мягкая мебель','Диваны, кресла и прочая мягкая мебель',NULL,'products','2',NULL,NULL,NULL),(18,'2018-01-15 14:31:29','iblock','S2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Офисная мебель','Диваны, столы, стулья',NULL,'products','2',NULL,NULL,NULL),(19,'2018-01-15 14:31:47','iblock','S3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Мебель для кухни','Полки, ящики, столы и стулья',NULL,'products','2',NULL,NULL,NULL),(20,'2018-01-15 14:30:38','iblock','S4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=5&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Детская мебель','Кровати, стулья, мягкая детская мебель',NULL,'products','2',NULL,NULL,NULL),(21,'2018-01-11 16:07:28','iblock','4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=10&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Герцог','Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.\r\r\n \rИзящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.','','products','2',NULL,NULL,NULL),(22,'2018-01-11 16:07:30','iblock','5',0,NULL,NULL,NULL,'=ID=5&EXTERNAL_ID=11&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Монализа','Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.\r\r\n \rБогатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.','','products','2',NULL,NULL,NULL),(23,'2018-01-11 16:07:32','iblock','6',0,NULL,NULL,NULL,'=ID=6&EXTERNAL_ID=12&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Министр','Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.\r\r\n \rКресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.','','products','2',NULL,NULL,NULL),(24,'2018-01-11 16:07:36','iblock','7',0,NULL,NULL,NULL,'=ID=7&EXTERNAL_ID=13&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Хром','Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.\r\r\n \rДинамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.','','products','2',NULL,NULL,NULL),(25,'2018-01-11 16:07:39','iblock','8',0,NULL,NULL,NULL,'=ID=8&EXTERNAL_ID=14&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Ливерпуль','Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.\r\r\n \rДеревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.','','products','2',NULL,NULL,NULL),(26,'2018-01-15 14:50:53','iblock','9',0,NULL,NULL,NULL,'=ID=9&EXTERNAL_ID=15&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Изабелла','Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.\r\r\n \rИзящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.','','products','2',NULL,NULL,NULL),(27,'2018-01-11 16:07:43','iblock','10',0,NULL,NULL,NULL,'=ID=10&EXTERNAL_ID=16&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Аладдин','Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»\r\r\n \rКомфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»','','products','2',NULL,NULL,NULL),(28,'2018-01-11 16:07:46','iblock','11',0,NULL,NULL,NULL,'=ID=11&EXTERNAL_ID=17&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Джоконда','Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.\r\r\n \rИзящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.','','products','2',NULL,NULL,NULL),(29,'2018-01-11 16:07:47','iblock','12',0,NULL,NULL,NULL,'=ID=12&EXTERNAL_ID=18&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Флора','Классическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.\r\r\n \rКлассическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.','','products','2',NULL,NULL,NULL),(30,'2018-01-11 16:07:49','iblock','13',0,NULL,NULL,NULL,'=ID=13&EXTERNAL_ID=19&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Престиж','Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.\r\r\n \rТахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.','','products','2',NULL,NULL,NULL),(31,'2018-01-11 16:07:51','iblock','14',0,NULL,NULL,NULL,'=ID=14&EXTERNAL_ID=20&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Лаура','Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.\r\r\n \rДвухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.','','products','2',NULL,NULL,NULL),(32,'2018-01-11 16:07:53','iblock','15',0,NULL,NULL,NULL,'=ID=15&EXTERNAL_ID=21&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Модерн','Основными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.\r\r\n \rОсновными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.','','products','2',NULL,NULL,NULL),(33,'2018-01-11 16:07:56','iblock','16',0,NULL,NULL,NULL,'=ID=16&EXTERNAL_ID=22&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Оптима','Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \rПравильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \rобязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать \rпространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\r\n \rУдачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.','','products','2',NULL,NULL,NULL),(34,'2018-01-11 16:08:00','iblock','17',0,NULL,NULL,NULL,'=ID=17&EXTERNAL_ID=23&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Собрание','Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\r\n \rЗаходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.','','products','2',NULL,NULL,NULL),(35,'2018-01-15 14:51:23','iblock','18',0,NULL,NULL,NULL,'=ID=18&EXTERNAL_ID=24&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Лидер','Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.\r\r\n \rЭтот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.','','products','2',NULL,NULL,NULL),(36,'2018-01-11 16:08:03','iblock','19',0,NULL,NULL,NULL,'=ID=19&EXTERNAL_ID=25&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Президент','Кресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.\r\r\n \rКресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \rДизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \rПроизводится ограниченными партиями - не более 10 кресел в год.','','products','2',NULL,NULL,NULL),(37,'2018-01-11 16:08:08','iblock','20',0,NULL,NULL,NULL,'=ID=20&EXTERNAL_ID=26&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Плутон','Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.\r\r\n \rОфисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.','','products','2',NULL,NULL,NULL),(38,'2018-01-11 16:08:09','iblock','21',0,NULL,NULL,NULL,'=ID=21&EXTERNAL_ID=27&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Парма','Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \rСтул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \rТонировка деревянных деталей может быть выполнена в любой цветовой палитре.\r\r\n \r <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>','','products','2',NULL,NULL,NULL),(39,'2018-01-15 14:51:37','iblock','22',0,NULL,NULL,NULL,'=ID=22&EXTERNAL_ID=28&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Палермо','Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.\r\r\n \rУниверсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.','','products','2',NULL,NULL,NULL),(40,'2018-01-11 16:08:10','iblock','23',0,NULL,NULL,NULL,'=ID=23&EXTERNAL_ID=29&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Валенсия','Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.\r\r\n \rСтильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.','','products','2',NULL,NULL,NULL),(41,'2018-01-11 16:08:11','iblock','24',0,NULL,NULL,NULL,'=ID=24&EXTERNAL_ID=30&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Фазенда','Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.\r\r\n \rСкладной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.','','products','2',NULL,NULL,NULL),(42,'2018-01-15 14:50:38','iblock','25',0,NULL,NULL,NULL,'=ID=25&EXTERNAL_ID=31&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Эра','Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.\r\r\n \rСтильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.','','products','2',NULL,NULL,NULL),(44,'2018-01-11 16:08:14','iblock','27',0,NULL,NULL,NULL,'=ID=27&EXTERNAL_ID=33&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Изопласт Хром','Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.\r\r\n \rПопулярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.','','products','2',NULL,NULL,NULL),(45,'2018-01-11 16:08:30','iblock','28',0,NULL,NULL,NULL,'=ID=28&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=','Мебель на заказ','Наша компания занимается разработкой мебели на заказ.\r\n \rНаша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\rгардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.\rМы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\rПо Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\rпроизведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.\rПосле заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\rгде опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\rнепосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\rсотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\rвносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.','','products','3',NULL,NULL,NULL),(46,'2018-01-11 16:08:38','iblock','29',0,NULL,NULL,NULL,'=ID=29&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=','Услуги дизайнера','Мы предлагаем широкий спектр услуг по дизайну мебели.\r\n \rДиагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.\rРазработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.\rРазработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие, рассмотреть его в деталях.\rПодбор и расстановка мебели.\rДекорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.','','products','3',NULL,NULL,NULL),(47,'2010-05-01 00:00:00','iblock','30',0,NULL,NULL,NULL,'=ID=30&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Продавец-дизайнер (кухни)','Требования\rУверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения\rОбязанности\rКонсультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.\rУсловия\rЗарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(48,'2010-05-01 00:00:00','iblock','31',0,NULL,NULL,NULL,'=ID=31&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Директор магазина','Требования\rВысшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.\rОбязанности\rРуководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(49,'2010-05-01 00:00:00','iblock','32',0,NULL,NULL,NULL,'=ID=32&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Бухгалтер отдела учета готовой продукции','Требования\rЖен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.\rОбязанности\rРабота с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя\rУсловия\rГрафик работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(50,'2018-01-15 13:28:33','iblock','33',0,NULL,NULL,NULL,'=ID=33&EXTERNAL_ID=33&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','http://test.ru/test/','','','news','5',NULL,NULL,NULL),(54,'2018-01-15 13:56:23','iblock','26',0,NULL,NULL,NULL,'=ID=26&EXTERNAL_ID=32&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Сити','Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.\r\r\n \rСтильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.','','products','2',NULL,NULL,NULL),(55,'2018-01-15 13:58:38','main','s1|/products/ex2/index.php',0,NULL,NULL,NULL,'/products/ex2/index.php','Экзамен2','Text here....','','','',NULL,NULL,NULL),(56,'2018-01-15 14:00:09','main','s1|/ex2/index.php',0,NULL,NULL,NULL,'/ex2/index.php','Экзамен2','Text here....','','','',NULL,NULL,NULL),(57,'2018-01-15 16:22:15','blog','U1',0,NULL,NULL,NULL,NULL,'manager','',NULL,'USER','2',NULL,NULL,NULL),(58,'2018-01-15 14:22:24','iblock','34',0,NULL,NULL,NULL,'=ID=34&EXTERNAL_ID=34&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=6&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','/products/2/20/','','','products','6',NULL,NULL,NULL),(59,'2018-01-15 14:22:50','iblock','35',0,NULL,NULL,NULL,'=ID=35&EXTERNAL_ID=35&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=6&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','/products/','','','products','6',NULL,NULL,NULL),(60,'2018-01-15 14:47:02','iblock','36',0,NULL,NULL,NULL,'=ID=36&EXTERNAL_ID=36&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=7&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','Лего','','','products','7',NULL,NULL,NULL),(61,'2018-01-15 14:47:20','iblock','37',0,NULL,NULL,NULL,'=ID=37&EXTERNAL_ID=37&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=7&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','Супер-стар','','','products','7',NULL,NULL,NULL),(62,'2018-01-15 14:47:27','iblock','38',0,NULL,NULL,NULL,'=ID=38&EXTERNAL_ID=38&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=7&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','Пушинка','','','products','7',NULL,NULL,NULL),(63,'2018-01-15 14:47:33','iblock','39',0,NULL,NULL,NULL,'=ID=39&EXTERNAL_ID=39&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=7&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','Мечта','','','products','7',NULL,NULL,NULL),(64,'2018-01-15 15:32:48','main','s1|/ex2/simplecomp2/index.php',0,NULL,NULL,NULL,'/ex2/simplecomp2/index.php','Простой компонент 2','','','','',NULL,NULL,NULL),(65,'2018-01-19 10:12:47','blog','U2',0,NULL,NULL,NULL,NULL,'test1','',NULL,'USER','3',NULL,NULL,NULL),(66,'2018-01-15 16:22:04','blog','U3',0,NULL,NULL,NULL,NULL,'test2','',NULL,'USER','4',NULL,NULL,NULL),(67,'2018-01-15 16:21:22','blog','U4',0,NULL,NULL,NULL,NULL,'test3','',NULL,'USER','5',NULL,NULL,NULL),(68,'2018-01-15 16:22:10','blog','U5',0,NULL,NULL,NULL,NULL,'admin','',NULL,'USER','1',NULL,NULL,NULL),(69,'2018-01-15 00:00:00','iblock','40',0,NULL,NULL,NULL,'=ID=40&EXTERNAL_ID=40&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Тестовая новость №1','','','news','1',NULL,'2018-01-15 00:00:00',NULL),(70,'2018-01-15 00:00:00','iblock','41',0,NULL,NULL,NULL,'=ID=41&EXTERNAL_ID=41&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Тестовая новость №2','','','news','1',NULL,'2018-01-15 00:00:00',NULL),(71,'2018-01-15 00:00:00','iblock','42',0,NULL,NULL,NULL,'=ID=42&EXTERNAL_ID=42&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Тестовая новость №3','','','news','1',NULL,'2018-01-15 00:00:00',NULL),(72,'2018-01-19 11:04:28','main','s1|/ex2/simplecomp3/index.php',0,NULL,NULL,NULL,'/ex2/simplecomp3/index.php','Простой компонент 3','','','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_freq`
--

DROP TABLE IF EXISTS `b_search_content_freq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_freq`
--

LOCK TABLES `b_search_content_freq` WRITE;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_param`
--

DROP TABLE IF EXISTS `b_search_content_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_param`
--

LOCK TABLES `b_search_content_param` WRITE;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_right`
--

DROP TABLE IF EXISTS `b_search_content_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_right`
--

LOCK TABLES `b_search_content_right` WRITE;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
INSERT INTO `b_search_content_right` VALUES (1,'G2'),(2,'G2'),(3,'G2'),(4,'G2'),(5,'G2'),(6,'G2'),(7,'G2'),(8,'G2'),(9,'G2'),(10,'G2'),(11,'G2'),(12,'G2'),(13,'G2'),(14,'G1'),(14,'G2'),(15,'G1'),(15,'G2'),(16,'G1'),(16,'G2'),(17,'G1'),(17,'G2'),(18,'G1'),(18,'G2'),(19,'G1'),(19,'G2'),(20,'G1'),(20,'G2'),(21,'G2'),(22,'G2'),(23,'G2'),(24,'G2'),(25,'G2'),(26,'G1'),(26,'G2'),(27,'G2'),(28,'G2'),(29,'G2'),(30,'G2'),(31,'G2'),(32,'G2'),(33,'G2'),(34,'G2'),(35,'G1'),(35,'G2'),(36,'G2'),(37,'G2'),(38,'G2'),(39,'G1'),(39,'G2'),(40,'G2'),(41,'G2'),(42,'G1'),(42,'G2'),(44,'G2'),(45,'G2'),(46,'G2'),(47,'G2'),(48,'G2'),(49,'G2'),(50,'G1'),(54,'G1'),(54,'G2'),(55,'G2'),(56,'G2'),(57,'G2'),(58,'G1'),(59,'G1'),(60,'G1'),(61,'G1'),(62,'G1'),(63,'G1'),(64,'G2'),(65,'G2'),(66,'G2'),(67,'G2'),(68,'G2'),(69,'G1'),(69,'G2'),(70,'G1'),(70,'G2'),(71,'G1'),(71,'G2'),(72,'G2');
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_site`
--

DROP TABLE IF EXISTS `b_search_content_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_site`
--

LOCK TABLES `b_search_content_site` WRITE;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` VALUES (1,'s1',''),(2,'s1',''),(3,'s1',''),(4,'s1',''),(5,'s1',''),(6,'s1',''),(7,'s1',''),(8,'s1',''),(9,'s1',''),(10,'s1',''),(11,'s1',''),(12,'s1',''),(13,'s1',''),(14,'s1',''),(15,'s1',''),(16,'s1',''),(17,'s1',''),(18,'s1',''),(19,'s1',''),(20,'s1',''),(21,'s1',''),(22,'s1',''),(23,'s1',''),(24,'s1',''),(25,'s1',''),(26,'s1',''),(27,'s1',''),(28,'s1',''),(29,'s1',''),(30,'s1',''),(31,'s1',''),(32,'s1',''),(33,'s1',''),(34,'s1',''),(35,'s1',''),(36,'s1',''),(37,'s1',''),(38,'s1',''),(39,'s1',''),(40,'s1',''),(41,'s1',''),(42,'s1',''),(44,'s1',''),(45,'s1',''),(46,'s1',''),(47,'s1',''),(48,'s1',''),(49,'s1',''),(50,'s1',''),(54,'s1',''),(55,'s1',''),(56,'s1',''),(57,'s1','/users/2.php'),(58,'s1',''),(59,'s1',''),(60,'s1',''),(61,'s1',''),(62,'s1',''),(63,'s1',''),(64,'s1',''),(65,'s1','/users/3.php'),(66,'s1','/users/4.php'),(67,'s1','/users/5.php'),(68,'s1','/users/1.php'),(69,'s1',''),(70,'s1',''),(71,'s1',''),(72,'s1','');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_stem`
--

DROP TABLE IF EXISTS `b_search_content_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_stem`
--

LOCK TABLES `b_search_content_stem` WRITE;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` VALUES (1,'ru',1,0.2314,1),(2,'ru',2,0.2314,1),(3,'ru',3,0.2314,1),(4,'ru',4,0.2314,1),(4,'ru',5,0.2314,2),(5,'ru',6,0.2314,1),(6,'ru',1,0.1679,99),(6,'ru',2,0.2662,80),(6,'ru',7,0.3359,21.3333),(6,'ru',8,0.39,17.75),(6,'ru',9,0.39,64.75),(6,'ru',10,0.1679,5),(6,'ru',11,0.1679,7),(6,'ru',12,0.1679,8),(6,'ru',13,0.1679,10),(6,'ru',14,0.1679,11),(6,'ru',15,0.1679,19),(6,'ru',16,0.1679,22),(6,'ru',17,0.1679,23),(6,'ru',18,0.1679,24),(6,'ru',19,0.1679,26),(6,'ru',20,0.1679,27),(6,'ru',21,0.1679,28),(6,'ru',22,0.2662,54.5),(6,'ru',23,0.1679,32),(6,'ru',24,0.1679,33),(6,'ru',25,0.1679,34),(6,'ru',26,0.2662,41),(6,'ru',27,0.1679,37),(6,'ru',28,0.1679,45),(6,'ru',29,0.1679,46),(6,'ru',30,0.1679,49),(6,'ru',31,0.1679,50),(6,'ru',32,0.1679,52),(6,'ru',33,0.1679,53),(6,'ru',34,0.1679,54),(6,'ru',35,0.1679,55),(6,'ru',36,0.1679,56),(6,'ru',37,0.2662,69.5),(6,'ru',38,0.2662,70.5),(6,'ru',39,0.1679,60),(6,'ru',40,0.1679,61),(6,'ru',41,0.1679,69),(6,'ru',42,0.1679,70),(6,'ru',43,0.1679,71),(6,'ru',44,0.1679,73),(6,'ru',45,0.2662,81),(6,'ru',46,0.1679,76),(6,'ru',47,0.1679,80),(6,'ru',48,0.1679,83),(6,'ru',49,0.1679,84),(6,'ru',50,0.1679,85),(6,'ru',51,0.1679,88),(6,'ru',52,0.1679,90),(7,'ru',2,0.2953,159.5),(7,'ru',7,0.2953,187.25),(7,'ru',8,0.4559,183.636),(7,'ru',9,0.2953,359.5),(7,'ru',17,0.1272,67),(7,'ru',18,0.1272,121),(7,'ru',27,0.1272,370),(7,'ru',29,0.1272,130),(7,'ru',31,0.1272,252),(7,'ru',36,0.2015,228),(7,'ru',39,0.1272,288),(7,'ru',40,0.2953,125.25),(7,'ru',42,0.1272,9),(7,'ru',48,0.2543,177.667),(7,'ru',51,0.1272,336),(7,'ru',53,0.1272,1),(7,'ru',54,0.1272,3),(7,'ru',55,0.1272,7),(7,'ru',56,0.2015,156.5),(7,'ru',57,0.1272,10),(7,'ru',58,0.1272,11),(7,'ru',59,0.1272,12),(7,'ru',60,0.1272,13),(7,'ru',61,0.1272,14),(7,'ru',62,0.1272,15),(7,'ru',63,0.1272,16),(7,'ru',64,0.2953,115.5),(7,'ru',65,0.1272,19),(7,'ru',66,0.1272,22),(7,'ru',67,0.1272,29),(7,'ru',68,0.1272,30),(7,'ru',69,0.1272,31),(7,'ru',70,0.1272,32),(7,'ru',71,0.1272,33),(7,'ru',72,0.1272,35),(7,'ru',73,0.2543,171.333),(7,'ru',74,0.1272,38),(7,'ru',75,0.1272,45),(7,'ru',76,0.2543,237.667),(7,'ru',77,0.1272,48),(7,'ru',78,0.1272,50),(7,'ru',79,0.1272,51),(7,'ru',80,0.1272,52),(7,'ru',81,0.1272,62),(7,'ru',82,0.1272,63),(7,'ru',83,0.1272,64),(7,'ru',84,0.1272,65),(7,'ru',85,0.1272,68),(7,'ru',86,0.1272,76),(7,'ru',87,0.1272,77),(7,'ru',88,0.1272,78),(7,'ru',89,0.1272,79),(7,'ru',90,0.1272,80),(7,'ru',91,0.1272,81),(7,'ru',92,0.1272,82),(7,'ru',93,0.2015,119.5),(7,'ru',94,0.1272,90),(7,'ru',95,0.1272,91),(7,'ru',96,0.1272,92),(7,'ru',97,0.1272,93),(7,'ru',98,0.2015,93),(7,'ru',99,0.2015,182),(7,'ru',100,0.2953,156.5),(7,'ru',101,0.1272,105),(7,'ru',102,0.2543,189.333),(7,'ru',103,0.3815,189.143),(7,'ru',104,0.1272,109),(7,'ru',105,0.1272,111),(7,'ru',106,0.2543,272),(7,'ru',107,0.2953,208.25),(7,'ru',108,0.1272,128),(7,'ru',109,0.1272,129),(7,'ru',110,0.1272,133),(7,'ru',111,0.1272,134),(7,'ru',112,0.1272,135),(7,'ru',113,0.1272,137),(7,'ru',114,0.1272,144),(7,'ru',115,0.1272,145),(7,'ru',116,0.2015,174),(7,'ru',117,0.1272,147),(7,'ru',118,0.2015,152),(7,'ru',119,0.2015,179),(7,'ru',120,0.1272,153),(7,'ru',121,0.1272,154),(7,'ru',122,0.1272,156),(7,'ru',123,0.1272,157),(7,'ru',124,0.1272,158),(7,'ru',125,0.1272,164),(7,'ru',126,0.1272,167),(7,'ru',127,0.1272,168),(7,'ru',128,0.1272,175),(7,'ru',129,0.1272,177),(7,'ru',130,0.1272,178),(7,'ru',131,0.1272,179),(7,'ru',132,0.1272,180),(7,'ru',133,0.1272,186),(7,'ru',134,0.2015,235),(7,'ru',135,0.1272,196),(7,'ru',136,0.1272,199),(7,'ru',137,0.2015,239.5),(7,'ru',138,0.1272,203),(7,'ru',139,0.1272,204),(7,'ru',140,0.1272,206),(7,'ru',141,0.2015,291),(7,'ru',142,0.2015,303),(7,'ru',143,0.2953,303),(7,'ru',144,0.1272,221),(7,'ru',145,0.1272,222),(7,'ru',146,0.1272,224),(7,'ru',147,0.1272,225),(7,'ru',148,0.1272,233),(7,'ru',149,0.1272,234),(7,'ru',150,0.1272,236),(7,'ru',151,0.1272,237),(7,'ru',152,0.1272,243),(7,'ru',153,0.1272,244),(7,'ru',154,0.1272,250),(7,'ru',155,0.1272,251),(7,'ru',156,0.2015,265),(7,'ru',157,0.1272,255),(7,'ru',158,0.1272,258),(7,'ru',159,0.1272,260),(7,'ru',160,0.1272,261),(7,'ru',161,0.1272,264),(7,'ru',162,0.1272,265),(7,'ru',163,0.1272,266),(7,'ru',164,0.1272,284),(7,'ru',165,0.1272,287),(7,'ru',166,0.2015,287),(7,'ru',167,0.1272,289),(7,'ru',168,0.1272,295),(7,'ru',169,0.1272,297),(7,'ru',170,0.1272,298),(7,'ru',171,0.1272,306),(7,'ru',172,0.1272,307),(7,'ru',173,0.1272,308),(7,'ru',174,0.2015,334.5),(7,'ru',175,0.2543,331),(7,'ru',176,0.1272,314),(7,'ru',177,0.2015,329.5),(7,'ru',178,0.1272,325),(7,'ru',179,0.1272,327),(7,'ru',180,0.1272,328),(7,'ru',181,0.1272,331),(7,'ru',182,0.1272,333),(7,'ru',183,0.1272,338),(7,'ru',184,0.1272,341),(7,'ru',185,0.1272,350),(7,'ru',186,0.1272,351),(7,'ru',187,0.1272,354),(7,'ru',188,0.1272,361),(7,'ru',189,0.1272,363),(7,'ru',190,0.1272,366),(7,'ru',191,0.1272,367),(7,'ru',192,0.1272,369),(7,'ru',193,0.2015,369),(7,'ru',194,0.1272,377),(7,'ru',195,0.1272,378),(7,'ru',196,0.2015,383.5),(7,'ru',197,0.1272,384),(7,'ru',198,0.1272,385),(7,'ru',199,0.1272,387),(7,'ru',200,0.1272,389),(8,'ru',2,0.2733,226),(8,'ru',7,0.4356,287.667),(8,'ru',8,0.5249,284.333),(8,'ru',11,0.1177,378),(8,'ru',12,0.1177,379),(8,'ru',14,0.1866,333.5),(8,'ru',22,0.1866,113.5),(8,'ru',24,0.1177,288),(8,'ru',26,0.3531,261.143),(8,'ru',27,0.2354,315.333),(8,'ru',29,0.2354,231),(8,'ru',31,0.2733,413.75),(8,'ru',40,0.1177,117),(8,'ru',42,0.3304,372.167),(8,'ru',45,0.1177,548),(8,'ru',56,0.1177,478),(8,'ru',57,0.2354,264.333),(8,'ru',58,0.1177,339),(8,'ru',69,0.1177,287),(8,'ru',75,0.1866,340.5),(8,'ru',80,0.1177,599),(8,'ru',94,0.1177,437),(8,'ru',99,0.1177,118),(8,'ru',109,0.1177,123),(8,'ru',113,0.1866,179.5),(8,'ru',130,0.1177,598),(8,'ru',136,0.1177,362),(8,'ru',142,0.1866,448.5),(8,'ru',143,0.2733,448.5),(8,'ru',156,0.3304,371.167),(8,'ru',157,0.1177,527),(8,'ru',161,0.1177,338),(8,'ru',168,0.1177,218),(8,'ru',169,0.1177,197),(8,'ru',170,0.1177,221),(8,'ru',172,0.1177,342),(8,'ru',173,0.1177,343),(8,'ru',175,0.2733,431),(8,'ru',177,0.1866,562.5),(8,'ru',184,0.1866,431),(8,'ru',193,0.1177,155),(8,'ru',201,0.1177,1),(8,'ru',202,0.1177,2),(8,'ru',203,0.1866,218),(8,'ru',204,0.1177,12),(8,'ru',205,0.1177,15),(8,'ru',206,0.1177,17),(8,'ru',207,0.1866,17),(8,'ru',208,0.3043,156.6),(8,'ru',209,0.1177,26),(8,'ru',210,0.1177,28),(8,'ru',211,0.1177,29),(8,'ru',212,0.3043,280),(8,'ru',213,0.1177,31),(8,'ru',214,0.2733,202),(8,'ru',215,0.1177,35),(8,'ru',216,0.1177,36),(8,'ru',217,0.1177,45),(8,'ru',218,0.1177,46),(8,'ru',219,0.1177,53),(8,'ru',220,0.1177,54),(8,'ru',221,0.1177,55),(8,'ru',222,0.1866,86.5),(8,'ru',223,0.1177,60),(8,'ru',224,0.1177,62),(8,'ru',225,0.1177,63),(8,'ru',226,0.1177,64),(8,'ru',227,0.1177,70),(8,'ru',228,0.1177,76),(8,'ru',229,0.1177,78),(8,'ru',230,0.1177,80),(8,'ru',231,0.1177,82),(8,'ru',232,0.1177,84),(8,'ru',233,0.1866,282.5),(8,'ru',234,0.1177,94),(8,'ru',235,0.1177,96),(8,'ru',236,0.2354,209.667),(8,'ru',237,0.1177,99),(8,'ru',238,0.1177,100),(8,'ru',239,0.1177,107),(8,'ru',240,0.1177,108),(8,'ru',241,0.3043,426),(8,'ru',242,0.1177,111),(8,'ru',243,0.1177,115),(8,'ru',244,0.1177,116),(8,'ru',245,0.1177,121),(8,'ru',246,0.1866,148),(8,'ru',247,0.1177,130),(8,'ru',248,0.1177,137),(8,'ru',249,0.1866,232),(8,'ru',250,0.1866,311),(8,'ru',251,0.1177,141),(8,'ru',252,0.1866,150),(8,'ru',253,0.1177,154),(8,'ru',254,0.1177,156),(8,'ru',255,0.1177,158),(8,'ru',256,0.1866,242),(8,'ru',257,0.1177,161),(8,'ru',258,0.1177,162),(8,'ru',259,0.1177,164),(8,'ru',260,0.1177,176),(8,'ru',261,0.1177,183),(8,'ru',262,0.1177,192),(8,'ru',263,0.1177,196),(8,'ru',264,0.1177,198),(8,'ru',265,0.1177,199),(8,'ru',266,0.1177,202),(8,'ru',267,0.1177,203),(8,'ru',268,0.1177,220),(8,'ru',269,0.1177,228),(8,'ru',270,0.1177,229),(8,'ru',271,0.1177,230),(8,'ru',272,0.2354,241.333),(8,'ru',273,0.1866,249),(8,'ru',274,0.2354,376),(8,'ru',275,0.1177,236),(8,'ru',276,0.1177,238),(8,'ru',277,0.1866,432),(8,'ru',278,0.1177,245),(8,'ru',279,0.1177,251),(8,'ru',280,0.1177,253),(8,'ru',281,0.1177,255),(8,'ru',282,0.1177,262),(8,'ru',283,0.1177,269),(8,'ru',284,0.1177,276),(8,'ru',285,0.1177,284),(8,'ru',286,0.1177,286),(8,'ru',287,0.1177,291),(8,'ru',288,0.1177,292),(8,'ru',289,0.1866,461.5),(8,'ru',290,0.2733,461.5),(8,'ru',291,0.1177,297),(8,'ru',292,0.1177,299),(8,'ru',293,0.1177,300),(8,'ru',294,0.1866,300),(8,'ru',295,0.1177,301),(8,'ru',296,0.1177,308),(8,'ru',297,0.1177,314),(8,'ru',298,0.2733,444),(8,'ru',299,0.2354,374.333),(8,'ru',300,0.2733,385.5),(8,'ru',301,0.2733,385.5),(8,'ru',302,0.2733,385.5),(8,'ru',303,0.1177,327),(8,'ru',304,0.2354,482.333),(8,'ru',305,0.2354,484.333),(8,'ru',306,0.1177,341),(8,'ru',307,0.1177,345),(8,'ru',308,0.1177,346),(8,'ru',309,0.1177,347),(8,'ru',310,0.1866,347),(8,'ru',311,0.1177,353),(8,'ru',312,0.1866,428.5),(8,'ru',313,0.3043,521.8),(8,'ru',314,0.1177,374),(8,'ru',315,0.2354,410),(8,'ru',316,0.1177,382),(8,'ru',317,0.2733,504.5),(8,'ru',318,0.1866,426.5),(8,'ru',319,0.1177,394),(8,'ru',320,0.1177,400),(8,'ru',321,0.1177,407),(8,'ru',322,0.1177,411),(8,'ru',323,0.1177,413),(8,'ru',324,0.2354,472.333),(8,'ru',325,0.1177,415),(8,'ru',326,0.1177,419),(8,'ru',327,0.1177,420),(8,'ru',328,0.1177,427),(8,'ru',329,0.1177,430),(8,'ru',330,0.1177,431),(8,'ru',331,0.1177,438),(8,'ru',332,0.1177,442),(8,'ru',333,0.1177,452),(8,'ru',334,0.2733,533.25),(8,'ru',335,0.1177,454),(8,'ru',336,0.1177,456),(8,'ru',337,0.1177,457),(8,'ru',338,0.1177,469),(8,'ru',339,0.1177,471),(8,'ru',340,0.1177,472),(8,'ru',341,0.1177,480),(8,'ru',342,0.1177,481),(8,'ru',343,0.1177,483),(8,'ru',344,0.1866,483),(8,'ru',345,0.1177,485),(8,'ru',346,0.1177,492),(8,'ru',347,0.2733,545.25),(8,'ru',348,0.1177,507),(8,'ru',349,0.1177,509),(8,'ru',350,0.1866,561),(8,'ru',351,0.1177,512),(8,'ru',352,0.1177,515),(8,'ru',353,0.1177,528),(8,'ru',354,0.1866,550.5),(8,'ru',355,0.1177,549),(8,'ru',356,0.1177,550),(8,'ru',357,0.1177,558),(8,'ru',358,0.1177,559),(8,'ru',359,0.1177,574),(8,'ru',360,0.1177,582),(8,'ru',361,0.1866,597),(8,'ru',362,0.1177,594),(8,'ru',363,0.1177,597),(8,'ru',364,0.1177,611),(8,'ru',365,0.1177,613),(8,'ru',366,0.1177,615),(8,'ru',367,0.1177,627),(8,'ru',368,0.1177,639),(8,'ru',369,0.1177,640),(9,'ru',370,0.2314,1),(10,'ru',2,0.3597,330.857),(10,'ru',7,0.2784,342.25),(10,'ru',8,0.3597,217),(10,'ru',9,0.4148,289.4),(10,'ru',10,0.1199,5),(10,'ru',11,0.1199,7),(10,'ru',12,0.1199,8),(10,'ru',13,0.1199,10),(10,'ru',14,0.19,248),(10,'ru',15,0.1199,19),(10,'ru',16,0.19,254),(10,'ru',17,0.1199,23),(10,'ru',18,0.1199,24),(10,'ru',19,0.1199,26),(10,'ru',20,0.1199,27),(10,'ru',21,0.1199,28),(10,'ru',22,0.2398,312.333),(10,'ru',23,0.1199,32),(10,'ru',24,0.19,257),(10,'ru',25,0.1199,34),(10,'ru',26,0.3597,156.286),(10,'ru',27,0.2784,327.5),(10,'ru',28,0.2398,293.667),(10,'ru',29,0.1199,398),(10,'ru',30,0.19,373),(10,'ru',31,0.1199,402),(10,'ru',32,0.1199,404),(10,'ru',33,0.1199,405),(10,'ru',34,0.1199,406),(10,'ru',35,0.1199,407),(10,'ru',36,0.19,376),(10,'ru',37,0.2398,374.333),(10,'ru',38,0.2398,306),(10,'ru',39,0.19,267.5),(10,'ru',40,0.3366,418.333),(10,'ru',41,0.1199,421),(10,'ru',42,0.1199,422),(10,'ru',43,0.1199,423),(10,'ru',44,0.1199,425),(10,'ru',45,0.2398,304),(10,'ru',46,0.1199,428),(10,'ru',47,0.1199,432),(10,'ru',48,0.1199,435),(10,'ru',49,0.1199,436),(10,'ru',50,0.1199,437),(10,'ru',51,0.19,243.5),(10,'ru',52,0.1199,442),(10,'ru',57,0.1199,503),(10,'ru',58,0.1199,203),(10,'ru',59,0.1199,459),(10,'ru',68,0.1199,49),(10,'ru',69,0.1199,331),(10,'ru',79,0.1199,129),(10,'ru',90,0.1199,50),(10,'ru',92,0.1199,44),(10,'ru',100,0.2398,247.667),(10,'ru',115,0.1199,245),(10,'ru',116,0.2398,483),(10,'ru',118,0.1199,490),(10,'ru',119,0.19,483.5),(10,'ru',121,0.1199,464),(10,'ru',124,0.1199,479),(10,'ru',127,0.19,495.5),(10,'ru',143,0.19,281.5),(10,'ru',149,0.1199,329),(10,'ru',150,0.19,196.5),(10,'ru',152,0.1199,328),(10,'ru',157,0.19,271.5),(10,'ru',161,0.1199,154),(10,'ru',163,0.1199,355),(10,'ru',165,0.1199,279),(10,'ru',166,0.2398,301.333),(10,'ru',169,0.1199,505),(10,'ru',179,0.1199,260),(10,'ru',183,0.1199,376),(10,'ru',186,0.1199,392),(10,'ru',207,0.19,77.5),(10,'ru',208,0.1199,478),(10,'ru',241,0.1199,56),(10,'ru',277,0.1199,336),(10,'ru',300,0.19,237.5),(10,'ru',301,0.19,237.5),(10,'ru',302,0.19,237.5),(10,'ru',331,0.1199,314),(10,'ru',351,0.1199,309),(10,'ru',355,0.1199,138),(10,'ru',371,0.1199,43),(10,'ru',372,0.1199,52),(10,'ru',373,0.1199,53),(10,'ru',374,0.1199,54),(10,'ru',375,0.19,85),(10,'ru',376,0.1199,57),(10,'ru',377,0.19,92),(10,'ru',378,0.1199,62),(10,'ru',379,0.19,90),(10,'ru',380,0.1199,70),(10,'ru',381,0.1199,72),(10,'ru',382,0.1199,74),(10,'ru',383,0.1199,83),(10,'ru',384,0.1199,86),(10,'ru',385,0.1199,87),(10,'ru',386,0.1199,88),(10,'ru',387,0.1199,89),(10,'ru',388,0.1199,91),(10,'ru',389,0.1199,92),(10,'ru',390,0.1199,96),(10,'ru',391,0.19,197),(10,'ru',392,0.1199,99),(10,'ru',393,0.19,112.5),(10,'ru',394,0.1199,107),(10,'ru',395,0.1199,108),(10,'ru',396,0.1199,109),(10,'ru',397,0.19,147),(10,'ru',398,0.1199,116),(10,'ru',399,0.2784,224),(10,'ru',400,0.1199,121),(10,'ru',401,0.1199,124),(10,'ru',402,0.1199,127),(10,'ru',403,0.1199,128),(10,'ru',404,0.1199,130),(10,'ru',405,0.2398,184.333),(10,'ru',406,0.1199,140),(10,'ru',407,0.1199,142),(10,'ru',408,0.1199,144),(10,'ru',409,0.19,144),(10,'ru',410,0.1199,146),(10,'ru',411,0.1199,147),(10,'ru',412,0.1199,148),(10,'ru',413,0.1199,155),(10,'ru',414,0.1199,156),(10,'ru',415,0.19,181.5),(10,'ru',416,0.1199,159),(10,'ru',417,0.1199,161),(10,'ru',418,0.1199,162),(10,'ru',419,0.1199,169),(10,'ru',420,0.1199,170),(10,'ru',421,0.1199,172),(10,'ru',422,0.1199,173),(10,'ru',423,0.1199,175),(10,'ru',424,0.19,191),(10,'ru',425,0.1199,177),(10,'ru',426,0.2398,299),(10,'ru',427,0.1199,181),(10,'ru',428,0.1199,183),(10,'ru',429,0.1199,185),(10,'ru',430,0.1199,187),(10,'ru',431,0.1199,196),(10,'ru',432,0.1199,198),(10,'ru',433,0.1199,199),(10,'ru',434,0.1199,200),(10,'ru',435,0.1199,201),(10,'ru',436,0.19,201),(10,'ru',437,0.1199,207),(10,'ru',438,0.1199,208),(10,'ru',439,0.1199,209),(10,'ru',440,0.19,236),(10,'ru',441,0.1199,218),(10,'ru',442,0.1199,220),(10,'ru',443,0.1199,221),(10,'ru',444,0.1199,223),(10,'ru',445,0.1199,232),(10,'ru',446,0.1199,234),(10,'ru',447,0.1199,246),(10,'ru',448,0.1199,251),(10,'ru',449,0.19,256),(10,'ru',450,0.1199,255),(10,'ru',451,0.1199,259),(10,'ru',452,0.19,270),(10,'ru',453,0.19,314.5),(10,'ru',454,0.2398,302.667),(10,'ru',455,0.1199,272),(10,'ru',456,0.1199,274),(10,'ru',457,0.1199,276),(10,'ru',458,0.1199,281),(10,'ru',459,0.1199,282),(10,'ru',460,0.1199,283),(10,'ru',461,0.1199,285),(10,'ru',462,0.1199,286),(10,'ru',463,0.1199,289),(10,'ru',464,0.1199,291),(10,'ru',465,0.1199,292),(10,'ru',466,0.1199,294),(10,'ru',467,0.1199,296),(10,'ru',468,0.1199,298),(10,'ru',469,0.1199,299),(10,'ru',470,0.1199,305),(10,'ru',471,0.1199,310),(10,'ru',472,0.19,314),(10,'ru',473,0.2784,314),(10,'ru',474,0.1199,316),(10,'ru',475,0.1199,324),(10,'ru',476,0.1199,327),(10,'ru',477,0.1199,332),(10,'ru',478,0.1199,333),(10,'ru',479,0.19,357.5),(10,'ru',480,0.1199,348),(10,'ru',481,0.19,348),(10,'ru',482,0.1199,356),(10,'ru',483,0.1199,357),(10,'ru',484,0.1199,361),(10,'ru',485,0.1199,362),(10,'ru',486,0.1199,373),(10,'ru',487,0.1199,374),(10,'ru',488,0.1199,378),(10,'ru',489,0.1199,380),(10,'ru',490,0.1199,388),(10,'ru',491,0.19,447.5),(10,'ru',492,0.1199,394),(10,'ru',493,0.1199,448),(10,'ru',494,0.1199,451),(10,'ru',495,0.1199,452),(10,'ru',496,0.1199,453),(10,'ru',497,0.1199,455),(10,'ru',498,0.1199,456),(10,'ru',499,0.19,479),(10,'ru',500,0.1199,472),(10,'ru',501,0.1199,473),(10,'ru',502,0.1199,484),(10,'ru',503,0.1199,487),(10,'ru',504,0.1199,492),(10,'ru',505,0.1199,494),(10,'ru',506,0.1199,495),(10,'ru',507,0.1199,497),(11,'ru',2,0.1353,60),(11,'ru',7,0.4288,101.25),(11,'ru',8,0.5006,145.25),(11,'ru',12,0.2144,32.5),(11,'ru',14,0.4058,150.143),(11,'ru',15,0.2706,139.667),(11,'ru',17,0.1353,91),(11,'ru',18,0.1353,231),(11,'ru',29,0.2144,136),(11,'ru',42,0.1353,67),(11,'ru',56,0.1353,71),(11,'ru',57,0.2144,203),(11,'ru',58,0.1353,165),(11,'ru',99,0.1353,59),(11,'ru',100,0.1353,9),(11,'ru',108,0.1353,66),(11,'ru',109,0.1353,64),(11,'ru',113,0.2144,104.5),(11,'ru',124,0.1353,41),(11,'ru',125,0.1353,102),(11,'ru',129,0.1353,205),(11,'ru',149,0.1353,142),(11,'ru',150,0.1353,76),(11,'ru',161,0.1353,7),(11,'ru',173,0.1353,72),(11,'ru',174,0.1353,75),(11,'ru',175,0.2144,79),(11,'ru',177,0.2144,76.5),(11,'ru',192,0.1353,77),(11,'ru',193,0.2144,77),(11,'ru',212,0.1353,70),(11,'ru',226,0.1353,62),(11,'ru',230,0.1353,234),(11,'ru',237,0.1353,95),(11,'ru',274,0.1353,78),(11,'ru',288,0.1353,42),(11,'ru',353,0.1353,2),(11,'ru',364,0.1353,69),(11,'ru',365,0.1353,98),(11,'ru',433,0.1353,6),(11,'ru',459,0.1353,101),(11,'ru',471,0.1353,22),(11,'ru',508,0.2144,5.5),(11,'ru',509,0.1353,8),(11,'ru',510,0.1353,23),(11,'ru',511,0.1353,35),(11,'ru',512,0.1353,38),(11,'ru',513,0.1353,39),(11,'ru',514,0.1353,40),(11,'ru',515,0.1353,43),(11,'ru',516,0.2144,43),(11,'ru',517,0.1353,57),(11,'ru',518,0.1353,58),(11,'ru',519,0.1353,61),(11,'ru',520,0.1353,80),(11,'ru',521,0.1353,81),(11,'ru',522,0.1353,83),(11,'ru',523,0.1353,92),(11,'ru',524,0.1353,94),(11,'ru',525,0.1353,96),(11,'ru',526,0.1353,97),(11,'ru',527,0.1353,108),(11,'ru',528,0.1353,112),(11,'ru',529,0.2144,112),(11,'ru',530,0.2144,136.5),(11,'ru',531,0.2144,137.5),(11,'ru',532,0.2144,151),(11,'ru',533,0.1353,117),(11,'ru',534,0.1353,118),(11,'ru',535,0.2706,191.333),(11,'ru',536,0.1353,126),(11,'ru',537,0.1353,127),(11,'ru',538,0.2144,190.5),(11,'ru',539,0.2706,194),(11,'ru',540,0.2144,193),(11,'ru',541,0.2144,165),(11,'ru',542,0.2144,166),(11,'ru',543,0.2144,179.5),(11,'ru',544,0.2144,185.5),(11,'ru',545,0.2144,174),(11,'ru',546,0.1353,145),(11,'ru',547,0.1353,146),(11,'ru',548,0.1353,148),(11,'ru',549,0.2144,179.5),(11,'ru',550,0.1353,158),(11,'ru',551,0.1353,162),(11,'ru',552,0.2144,205),(11,'ru',553,0.1353,166),(11,'ru',554,0.1353,167),(11,'ru',555,0.1353,169),(11,'ru',556,0.1353,171),(11,'ru',557,0.2706,220.333),(11,'ru',558,0.2706,221.333),(11,'ru',559,0.1353,184),(11,'ru',560,0.1353,185),(11,'ru',561,0.1353,186),(11,'ru',562,0.2144,228.5),(11,'ru',563,0.1353,190),(11,'ru',564,0.1353,202),(11,'ru',565,0.1353,203),(11,'ru',566,0.1353,217),(11,'ru',567,0.1353,218),(11,'ru',568,0.1353,233),(11,'ru',569,0.1353,244),(11,'ru',570,0.1353,249),(11,'ru',571,0.1353,250),(11,'ru',572,0.1353,251),(11,'ru',573,0.1353,254),(11,'ru',574,0.1353,257),(11,'ru',575,0.1353,258),(11,'ru',576,0.1353,269),(12,'ru',5,0.2314,3),(12,'ru',353,0.2314,7),(12,'ru',371,0.2314,16),(12,'ru',577,0.2314,1),(12,'ru',578,0.2314,5),(12,'ru',579,0.2314,8),(12,'ru',580,0.2314,14),(12,'ru',581,0.2314,17),(13,'ru',2,0.17,99),(13,'ru',9,0.2694,25.5),(13,'ru',26,0.2694,19),(13,'ru',134,0.17,12),(13,'ru',152,0.17,8),(13,'ru',166,0.17,5),(13,'ru',199,0.34,54.3333),(13,'ru',207,0.2694,79.5),(13,'ru',256,0.17,113),(13,'ru',310,0.17,43),(13,'ru',348,0.17,88),(13,'ru',374,0.17,36),(13,'ru',378,0.17,26),(13,'ru',391,0.17,17),(13,'ru',507,0.17,7),(13,'ru',574,0.17,19),(13,'ru',582,0.17,1),(13,'ru',583,0.2694,18),(13,'ru',584,0.17,9),(13,'ru',585,0.17,14),(13,'ru',586,0.17,18),(13,'ru',587,0.17,20),(13,'ru',588,0.17,22),(13,'ru',589,0.17,33),(13,'ru',590,0.3947,62.75),(13,'ru',591,0.17,40),(13,'ru',592,0.17,41),(13,'ru',593,0.17,45),(13,'ru',594,0.17,54),(13,'ru',595,0.17,55),(13,'ru',596,0.17,56),(13,'ru',597,0.17,59),(13,'ru',598,0.17,71),(13,'ru',599,0.34,74.6667),(13,'ru',600,0.17,73),(13,'ru',601,0.17,76),(13,'ru',602,0.17,78),(13,'ru',603,0.17,79),(13,'ru',604,0.17,80),(13,'ru',605,0.34,91),(13,'ru',606,0.17,90),(13,'ru',607,0.17,98),(13,'ru',608,0.17,100),(13,'ru',609,0.17,108),(13,'ru',610,0.17,109),(13,'ru',611,0.17,110),(14,'ru',7,0.4526,127.1),(14,'ru',8,0.1308,54),(14,'ru',12,0.2074,197.5),(14,'ru',14,0.3925,115.714),(14,'ru',25,0.1308,115),(14,'ru',26,0.4346,136.778),(14,'ru',27,0.1308,60),(14,'ru',28,0.1308,286),(14,'ru',29,0.2616,134.667),(14,'ru',67,0.1308,234),(14,'ru',70,0.1308,236),(14,'ru',77,0.1308,249),(14,'ru',113,0.1308,250),(14,'ru',156,0.1308,252),(14,'ru',157,0.1308,79),(14,'ru',161,0.1308,269),(14,'ru',166,0.1308,235),(14,'ru',168,0.1308,217),(14,'ru',207,0.1308,130),(14,'ru',264,0.2616,172),(14,'ru',267,0.1308,207),(14,'ru',290,0.1308,77),(14,'ru',300,0.2616,130.667),(14,'ru',301,0.2616,130.667),(14,'ru',302,0.2616,130.667),(14,'ru',335,0.1308,117),(14,'ru',365,0.1308,70),(14,'ru',384,0.1308,81),(14,'ru',399,0.1308,125),(14,'ru',405,0.2074,177),(14,'ru',421,0.2074,129),(14,'ru',425,0.2074,154),(14,'ru',451,0.1308,280),(14,'ru',483,0.1308,123),(14,'ru',507,0.1308,244),(14,'ru',545,0.1308,175),(14,'ru',610,0.2074,27),(14,'ru',612,0.4147,126.25),(14,'ru',613,0.3038,27.25),(14,'ru',614,0.2074,16),(14,'ru',615,0.2074,18),(14,'ru',616,0.2616,109),(14,'ru',617,0.2616,110),(14,'ru',618,0.3038,75.5),(14,'ru',619,0.2074,26),(14,'ru',620,0.2074,28),(14,'ru',621,0.2074,30),(14,'ru',622,0.2616,101.667),(14,'ru',623,0.1308,50),(14,'ru',624,0.2074,167),(14,'ru',625,0.1308,52),(14,'ru',626,0.1308,53),(14,'ru',627,0.1308,57),(14,'ru',628,0.1308,58),(14,'ru',629,0.1308,59),(14,'ru',630,0.1308,61),(14,'ru',631,0.1308,63),(14,'ru',632,0.2074,120.5),(14,'ru',633,0.1308,75),(14,'ru',634,0.1308,80),(14,'ru',635,0.1308,83),(14,'ru',636,0.1308,91),(14,'ru',637,0.1308,93),(14,'ru',638,0.1308,94),(14,'ru',639,0.2074,132),(14,'ru',640,0.1308,96),(14,'ru',641,0.3038,110.5),(14,'ru',642,0.2074,104),(14,'ru',643,0.1308,114),(14,'ru',644,0.1308,121),(14,'ru',645,0.1308,124),(14,'ru',646,0.1308,126),(14,'ru',647,0.1308,132),(14,'ru',648,0.1308,133),(14,'ru',649,0.1308,146),(14,'ru',650,0.1308,147),(14,'ru',651,0.1308,150),(14,'ru',652,0.1308,152),(14,'ru',653,0.1308,153),(14,'ru',654,0.1308,154),(14,'ru',655,0.1308,156),(14,'ru',656,0.2074,156),(14,'ru',657,0.1308,165),(14,'ru',658,0.1308,166),(14,'ru',659,0.1308,171),(14,'ru',660,0.1308,172),(14,'ru',661,0.1308,173),(14,'ru',662,0.1308,174),(14,'ru',663,0.2074,201.5),(14,'ru',664,0.2074,202.5),(14,'ru',665,0.1308,187),(14,'ru',666,0.1308,189),(14,'ru',667,0.1308,196),(14,'ru',668,0.1308,197),(14,'ru',669,0.1308,201),(14,'ru',670,0.1308,202),(14,'ru',671,0.2074,213),(14,'ru',672,0.2616,250.667),(14,'ru',673,0.1308,206),(14,'ru',674,0.1308,222),(14,'ru',675,0.1308,224),(14,'ru',676,0.1308,225),(14,'ru',677,0.2074,225),(14,'ru',678,0.1308,237),(14,'ru',679,0.1308,239),(14,'ru',680,0.1308,241),(14,'ru',681,0.1308,242),(14,'ru',682,0.1308,243),(14,'ru',683,0.1308,245),(14,'ru',684,0.1308,246),(14,'ru',685,0.1308,248),(14,'ru',686,0.1308,253),(14,'ru',687,0.1308,254),(14,'ru',688,0.1308,260),(14,'ru',689,0.1308,262),(14,'ru',690,0.2074,262),(14,'ru',691,0.1308,265),(14,'ru',692,0.1308,266),(14,'ru',693,0.1308,267),(14,'ru',694,0.1308,270),(14,'ru',695,0.1308,271),(14,'ru',696,0.1308,281),(14,'ru',697,0.1308,288),(15,'ru',7,0.1573,2),(15,'ru',8,0.1573,85),(15,'ru',14,0.3146,57),(15,'ru',15,0.1573,97),(15,'ru',26,0.2493,62.5),(15,'ru',31,0.1573,66),(15,'ru',169,0.1573,1),(15,'ru',174,0.1573,86),(15,'ru',207,0.1573,56),(15,'ru',212,0.1573,117),(15,'ru',218,0.1573,106),(15,'ru',241,0.3652,59),(15,'ru',281,0.1573,84),(15,'ru',348,0.1573,116),(15,'ru',369,0.1573,105),(15,'ru',378,0.1573,58),(15,'ru',385,0.1573,70),(15,'ru',386,0.1573,62),(15,'ru',405,0.1573,139),(15,'ru',421,0.1573,50),(15,'ru',617,0.3146,56),(15,'ru',622,0.1573,112),(15,'ru',624,0.1573,79),(15,'ru',643,0.1573,51),(15,'ru',658,0.2493,27.5),(15,'ru',664,0.4719,62.5714),(15,'ru',667,0.1573,136),(15,'ru',669,0.2493,23.5),(15,'ru',698,0.3652,23),(15,'ru',699,0.3652,24),(15,'ru',700,0.3652,25),(15,'ru',701,0.2493,29.5),(15,'ru',702,0.1573,53),(15,'ru',703,0.1573,60),(15,'ru',704,0.1573,64),(15,'ru',705,0.2493,64),(15,'ru',706,0.1573,65),(15,'ru',707,0.1573,68),(15,'ru',708,0.1573,77),(15,'ru',709,0.1573,80),(15,'ru',710,0.1573,87),(15,'ru',711,0.1573,88),(15,'ru',712,0.1573,94),(15,'ru',713,0.1573,98),(15,'ru',714,0.1573,101),(15,'ru',715,0.1573,103),(15,'ru',716,0.1573,104),(15,'ru',717,0.1573,114),(15,'ru',718,0.1573,118),(15,'ru',719,0.1573,119),(15,'ru',720,0.1573,120),(15,'ru',721,0.1573,137),(15,'ru',722,0.1573,140),(15,'ru',723,0.1573,143),(15,'ru',724,0.1573,144),(16,'ru',7,0.2165,56),(16,'ru',11,0.1366,67),(16,'ru',32,0.2165,50),(16,'ru',40,0.3171,176.25),(16,'ru',59,0.2165,74),(16,'ru',86,0.1366,149),(16,'ru',156,0.1366,6),(16,'ru',178,0.2165,45),(16,'ru',215,0.2165,55),(16,'ru',287,0.2165,65),(16,'ru',365,0.3171,64.5),(16,'ru',380,0.1366,164),(16,'ru',507,0.2165,3),(16,'ru',725,0.2732,53.6667),(16,'ru',726,0.2732,55),(16,'ru',727,0.2732,56.6667),(16,'ru',728,0.4097,108.429),(16,'ru',729,0.3834,89.6667),(16,'ru',730,0.2165,47),(16,'ru',731,0.2732,82.3333),(16,'ru',732,0.2165,51),(16,'ru',733,0.2165,52),(16,'ru',734,0.2165,52),(16,'ru',735,0.2165,53),(16,'ru',736,0.2165,58),(16,'ru',737,0.2165,59),(16,'ru',738,0.353,120),(16,'ru',739,0.2165,68),(16,'ru',740,0.2165,71),(16,'ru',741,0.2165,72),(16,'ru',742,0.2165,78),(16,'ru',743,0.4329,152.125),(16,'ru',744,0.1366,57),(16,'ru',745,0.1366,59),(16,'ru',746,0.2165,59),(16,'ru',747,0.1366,60),(16,'ru',748,0.1366,61),(16,'ru',749,0.1366,63),(16,'ru',750,0.1366,63),(16,'ru',751,0.1366,64),(16,'ru',752,0.1366,65),(16,'ru',753,0.1366,66),(16,'ru',754,0.1366,68),(16,'ru',755,0.1366,69),(16,'ru',756,0.1366,70),(16,'ru',757,0.1366,113),(16,'ru',758,0.1366,116),(16,'ru',759,0.1366,117),(16,'ru',760,0.1366,118),(16,'ru',761,0.2165,157.5),(16,'ru',762,0.4097,188.857),(16,'ru',763,0.1366,122),(16,'ru',764,0.1366,123),(16,'ru',765,0.1366,125),(16,'ru',766,0.1366,136),(16,'ru',767,0.1366,137),(16,'ru',768,0.1366,138),(16,'ru',769,0.1366,140),(16,'ru',770,0.2732,193),(16,'ru',771,0.1366,148),(16,'ru',772,0.1366,163),(16,'ru',773,0.2165,176.5),(16,'ru',774,0.2165,175),(16,'ru',775,0.1366,173),(16,'ru',776,0.1366,175),(16,'ru',777,0.1366,176),(16,'ru',778,0.2165,185),(16,'ru',779,0.1366,178),(16,'ru',780,0.2732,215.667),(16,'ru',781,0.2165,216.5),(16,'ru',782,0.2165,215),(16,'ru',783,0.2165,216),(16,'ru',784,0.2165,217),(16,'ru',785,0.2165,218),(16,'ru',786,0.1366,208),(16,'ru',787,0.1366,209),(16,'ru',788,0.1366,210),(16,'ru',789,0.2165,210),(16,'ru',790,0.1366,211),(16,'ru',791,0.1366,225),(16,'ru',792,0.1366,226),(16,'ru',793,0.1366,234),(16,'ru',794,0.1366,240),(16,'ru',795,0.1366,244),(16,'ru',796,0.1366,245),(17,'ru',26,0.3667,5),(17,'ru',335,0.3667,4),(17,'ru',797,0.2314,3),(17,'ru',798,0.2314,4),(17,'ru',799,0.2314,6),(18,'ru',26,0.2314,2),(18,'ru',797,0.2314,3),(18,'ru',800,0.2314,1),(18,'ru',801,0.2314,4),(18,'ru',802,0.2314,5),(19,'ru',26,0.2314,1),(19,'ru',384,0.2314,3),(19,'ru',801,0.2314,6),(19,'ru',802,0.2314,8),(19,'ru',803,0.2314,4),(19,'ru',804,0.2314,5),(20,'ru',26,0.3667,4.5),(20,'ru',335,0.2314,5),(20,'ru',385,0.3667,3.5),(20,'ru',802,0.2314,4),(20,'ru',805,0.2314,3),(21,'ru',402,0.3504,21.5),(21,'ru',425,0.3504,14.5),(21,'ru',653,0.3504,17.5),(21,'ru',806,0.2211,1),(21,'ru',807,0.3504,11.5),(21,'ru',808,0.3504,12.5),(21,'ru',809,0.3504,15.5),(21,'ru',810,0.3504,16.5),(21,'ru',811,0.3504,19.5),(21,'ru',812,0.3504,20.5),(21,'ru',813,0.3504,23.5),(21,'ru',814,0.3504,24.5),(22,'ru',70,0.3199,43.5),(22,'ru',90,0.3199,42.5),(22,'ru',287,0.3199,24.5),(22,'ru',377,0.3199,25.5),(22,'ru',776,0.3199,32.5),(22,'ru',808,0.3199,31.5),(22,'ru',815,0.2018,1),(22,'ru',816,0.3199,19.5),(22,'ru',817,0.3199,21.5),(22,'ru',818,0.3199,22.5),(22,'ru',819,0.3199,33.5),(22,'ru',820,0.3199,34.5),(22,'ru',821,0.3199,41.5),(22,'ru',822,0.3199,44.5),(22,'ru',823,0.3199,46.5),(22,'ru',824,0.3199,48.5),(23,'ru',39,0.2886,45.5),(23,'ru',75,0.2886,58.5),(23,'ru',151,0.2886,46.5),(23,'ru',356,0.2886,60.5),(23,'ru',399,0.2886,44.5),(23,'ru',406,0.2886,42.5),(23,'ru',798,0.2886,24.5),(23,'ru',800,0.2886,43.5),(23,'ru',825,0.3642,18),(23,'ru',826,0.2886,25.5),(23,'ru',827,0.2886,27.5),(23,'ru',828,0.2886,29.5),(23,'ru',829,0.2886,30.5),(23,'ru',830,0.2886,31.5),(23,'ru',831,0.2886,32.5),(23,'ru',832,0.2886,40.5),(23,'ru',833,0.4228,49.5),(23,'ru',834,0.2886,53.5),(23,'ru',835,0.2886,56.5),(23,'ru',836,0.2886,62.5),(23,'ru',837,0.2886,63.5),(24,'ru',55,0.2823,19),(24,'ru',58,0.2823,27),(24,'ru',377,0.2823,20),(24,'ru',798,0.2823,22),(24,'ru',800,0.2823,21),(24,'ru',823,0.2823,44),(24,'ru',824,0.4135,34),(24,'ru',838,0.1781,1),(24,'ru',839,0.2823,23),(24,'ru',840,0.2823,24),(24,'ru',841,0.2823,25),(24,'ru',842,0.2823,26),(24,'ru',843,0.2823,28),(24,'ru',844,0.2823,30),(24,'ru',845,0.2823,31),(24,'ru',846,0.2823,32),(24,'ru',847,0.2823,33),(24,'ru',848,0.2823,34),(24,'ru',849,0.2823,36),(24,'ru',850,0.2823,37),(24,'ru',851,0.2823,43),(24,'ru',852,0.2823,45),(24,'ru',853,0.2823,46),(24,'ru',854,0.2823,47),(25,'ru',179,0.3504,14),(25,'ru',384,0.3504,23),(25,'ru',390,0.3504,20),(25,'ru',406,0.3504,19),(25,'ru',802,0.3504,12),(25,'ru',855,0.4421,9),(25,'ru',856,0.3504,11),(25,'ru',857,0.3504,16),(25,'ru',858,0.3504,17),(25,'ru',859,0.3504,18),(25,'ru',860,0.3504,21),(26,'ru',425,0.3608,17),(26,'ru',589,0.3608,26),(26,'ru',643,0.3608,28),(26,'ru',653,0.3608,30),(26,'ru',807,0.3608,14),(26,'ru',808,0.3608,15),(26,'ru',809,0.3608,18),(26,'ru',811,0.3608,25),(26,'ru',820,0.3608,19),(26,'ru',861,0.2277,1),(26,'ru',862,0.3608,32),(27,'ru',35,0.2823,33.5),(27,'ru',50,0.2823,36.5),(27,'ru',90,0.2823,49.5),(27,'ru',377,0.2823,23.5),(27,'ru',455,0.2823,56.5),(27,'ru',653,0.2823,32.5),(27,'ru',811,0.2823,29.5),(27,'ru',821,0.2823,48.5),(27,'ru',833,0.2823,50.5),(27,'ru',863,0.1781,1),(27,'ru',864,0.2823,21.5),(27,'ru',865,0.2823,22.5),(27,'ru',866,0.2823,31.5),(27,'ru',867,0.2823,34.5),(27,'ru',868,0.2823,35.5),(27,'ru',869,0.2823,37.5),(27,'ru',870,0.2823,38.5),(27,'ru',871,0.2823,40.5),(27,'ru',872,0.2823,41.5),(27,'ru',873,0.2823,51.5),(27,'ru',874,0.2823,52.5),(27,'ru',875,0.2823,53.5),(27,'ru',876,0.2823,55.5),(27,'ru',877,0.2823,58.5),(27,'ru',878,0.2823,59.5),(28,'ru',35,0.2853,28),(28,'ru',50,0.2853,31),(28,'ru',70,0.2853,51),(28,'ru',90,0.2853,50),(28,'ru',291,0.2853,43),(28,'ru',589,0.2853,44),(28,'ru',653,0.2853,25),(28,'ru',807,0.2853,22),(28,'ru',808,0.2853,23),(28,'ru',811,0.418,34.5),(28,'ru',821,0.2853,49),(28,'ru',822,0.2853,52),(28,'ru',823,0.2853,56),(28,'ru',824,0.2853,54),(28,'ru',862,0.2853,47),(28,'ru',866,0.2853,24),(28,'ru',867,0.2853,29),(28,'ru',868,0.2853,30),(28,'ru',869,0.2853,32),(28,'ru',870,0.2853,33),(28,'ru',871,0.2853,35),(28,'ru',872,0.2853,36),(28,'ru',879,0.18,1),(29,'ru',329,0.3142,34),(29,'ru',377,0.4603,23),(29,'ru',399,0.4603,21),(29,'ru',406,0.3142,17),(29,'ru',469,0.3142,21),(29,'ru',810,0.3142,20),(29,'ru',857,0.3142,15),(29,'ru',868,0.3142,31),(29,'ru',871,0.3142,27),(29,'ru',880,0.1982,1),(29,'ru',881,0.3142,19),(29,'ru',882,0.3142,29),(29,'ru',883,0.3142,32),(29,'ru',884,0.3142,35),(29,'ru',885,0.3142,35),(30,'ru',491,0.3413,32),(30,'ru',589,0.3413,39),(30,'ru',653,0.3413,43),(30,'ru',811,0.3413,38),(30,'ru',824,0.3413,28),(30,'ru',857,0.3413,21),(30,'ru',862,0.3413,47),(30,'ru',886,0.2153,1),(30,'ru',887,0.3413,19),(30,'ru',888,0.3413,22),(30,'ru',889,0.3413,29),(30,'ru',890,0.5,30),(31,'ru',377,0.2853,45),(31,'ru',653,0.2853,41),(31,'ru',811,0.2853,43),(31,'ru',821,0.2853,34),(31,'ru',866,0.2853,40),(31,'ru',868,0.2853,44),(31,'ru',869,0.2853,46),(31,'ru',870,0.2853,47),(31,'ru',871,0.2853,49),(31,'ru',872,0.2853,50),(31,'ru',891,0.18,1),(31,'ru',892,0.2853,20),(31,'ru',893,0.2853,21),(31,'ru',894,0.418,25.5),(31,'ru',895,0.418,25.5),(31,'ru',896,0.2853,24),(31,'ru',897,0.2853,25),(31,'ru',898,0.2853,29),(31,'ru',899,0.2853,30),(31,'ru',900,0.2853,31),(31,'ru',901,0.418,31),(32,'ru',26,0.2351,58),(32,'ru',45,0.2351,97),(32,'ru',58,0.4164,75),(32,'ru',79,0.2351,68),(32,'ru',80,0.4164,90.3333),(32,'ru',150,0.2351,70),(32,'ru',207,0.2351,94),(32,'ru',252,0.2351,113),(32,'ru',287,0.3444,74.5),(32,'ru',382,0.2351,96),(32,'ru',425,0.3444,72),(32,'ru',654,0.2351,72),(32,'ru',758,0.2351,48),(32,'ru',840,0.2351,60),(32,'ru',841,0.2351,55),(32,'ru',857,0.2351,62),(32,'ru',860,0.2351,95),(32,'ru',888,0.2351,61),(32,'ru',902,0.1483,1),(32,'ru',903,0.2351,44),(32,'ru',904,0.2351,45),(32,'ru',905,0.3444,75.5),(32,'ru',906,0.2351,49),(32,'ru',907,0.2351,50),(32,'ru',908,0.2351,51),(32,'ru',909,0.2351,53),(32,'ru',910,0.2351,56),(32,'ru',911,0.2351,63),(32,'ru',912,0.2351,65),(32,'ru',913,0.2351,69),(32,'ru',914,0.2351,71),(32,'ru',915,0.2351,74),(32,'ru',916,0.2351,78),(32,'ru',917,0.2351,86),(32,'ru',918,0.2351,88),(32,'ru',919,0.2351,89),(32,'ru',920,0.2351,91),(32,'ru',921,0.2351,105),(32,'ru',922,0.2351,108),(32,'ru',923,0.2351,108),(32,'ru',924,0.2351,108),(32,'ru',925,0.2351,110),(32,'ru',926,0.2351,114),(32,'ru',927,0.2351,118),(32,'ru',928,0.3444,118),(32,'ru',929,0.2351,122),(33,'ru',8,0.2233,68),(33,'ru',21,0.2233,138),(33,'ru',26,0.3271,102.5),(33,'ru',64,0.2233,140),(33,'ru',68,0.2233,134),(33,'ru',73,0.3955,102),(33,'ru',74,0.3955,119.667),(33,'ru',80,0.3271,125.5),(33,'ru',103,0.2233,135),(33,'ru',129,0.2233,87),(33,'ru',137,0.2233,130),(33,'ru',142,0.2233,110),(33,'ru',143,0.3271,110),(33,'ru',150,0.2233,108),(33,'ru',207,0.2233,158),(33,'ru',222,0.2233,95),(33,'ru',225,0.2233,85),(33,'ru',323,0.2233,117),(33,'ru',353,0.2233,65),(33,'ru',399,0.2233,104),(33,'ru',403,0.2233,123),(33,'ru',433,0.2233,63),(33,'ru',491,0.2233,161),(33,'ru',554,0.2233,66),(33,'ru',596,0.2233,80),(33,'ru',801,0.2233,118),(33,'ru',905,0.2233,93),(33,'ru',913,0.2233,151),(33,'ru',918,0.2233,57),(33,'ru',930,0.3642,96.6),(33,'ru',931,0.2233,58),(33,'ru',932,0.2233,61),(33,'ru',933,0.2233,64),(33,'ru',934,0.2233,74),(33,'ru',935,0.2233,75),(33,'ru',936,0.2233,79),(33,'ru',937,0.2233,81),(33,'ru',938,0.2233,82),(33,'ru',939,0.2233,84),(33,'ru',940,0.2233,96),(33,'ru',941,0.2233,97),(33,'ru',942,0.3271,127.5),(33,'ru',943,0.2233,102),(33,'ru',944,0.2233,103),(33,'ru',945,0.2233,106),(33,'ru',946,0.2233,107),(33,'ru',947,0.2233,109),(33,'ru',948,0.2233,116),(33,'ru',949,0.2233,119),(33,'ru',950,0.2233,120),(33,'ru',951,0.2233,122),(33,'ru',952,0.2233,124),(33,'ru',953,0.2233,125),(33,'ru',954,0.2233,128),(33,'ru',955,0.2233,131),(33,'ru',956,0.2233,133),(33,'ru',957,0.2233,150),(33,'ru',958,0.2233,152),(33,'ru',959,0.2233,160),(34,'ru',26,0.3281,125.5),(34,'ru',37,0.224,134),(34,'ru',40,0.224,113),(34,'ru',163,0.224,108),(34,'ru',199,0.3281,89),(34,'ru',241,0.224,127),(34,'ru',274,0.224,69),(34,'ru',300,0.224,129),(34,'ru',301,0.224,129),(34,'ru',302,0.224,129),(34,'ru',324,0.224,103),(34,'ru',389,0.224,81),(34,'ru',397,0.224,52),(34,'ru',455,0.224,126),(34,'ru',463,0.224,122),(34,'ru',682,0.3281,57),(34,'ru',800,0.224,135),(34,'ru',801,0.3967,87.6667),(34,'ru',844,0.224,125),(34,'ru',857,0.224,102),(34,'ru',859,0.224,99),(34,'ru',872,0.224,98),(34,'ru',889,0.3281,58.5),(34,'ru',904,0.224,140),(34,'ru',917,0.224,96),(34,'ru',960,0.3653,65.4),(34,'ru',961,0.224,50),(34,'ru',962,0.224,57),(34,'ru',963,0.224,59),(34,'ru',964,0.224,60),(34,'ru',965,0.224,61),(34,'ru',966,0.224,65),(34,'ru',967,0.224,68),(34,'ru',968,0.224,71),(34,'ru',969,0.224,73),(34,'ru',970,0.224,79),(34,'ru',971,0.224,82),(34,'ru',972,0.224,83),(34,'ru',973,0.224,84),(34,'ru',974,0.224,86),(34,'ru',975,0.224,87),(34,'ru',976,0.224,88),(34,'ru',977,0.224,89),(34,'ru',978,0.224,95),(34,'ru',979,0.224,97),(34,'ru',980,0.224,101),(34,'ru',981,0.224,104),(34,'ru',982,0.224,107),(34,'ru',983,0.224,109),(34,'ru',984,0.224,110),(34,'ru',985,0.224,111),(34,'ru',986,0.3281,121),(34,'ru',987,0.224,121),(34,'ru',988,0.224,123),(34,'ru',989,0.224,130),(34,'ru',990,0.224,132),(34,'ru',991,0.224,137),(34,'ru',992,0.224,138),(34,'ru',993,0.224,139),(35,'ru',39,0.2577,87.5),(35,'ru',74,0.2577,59.5),(35,'ru',189,0.2577,71.5),(35,'ru',287,0.2577,92.5),(35,'ru',294,0.1626,1),(35,'ru',324,0.2577,83.5),(35,'ru',391,0.2577,85.5),(35,'ru',758,0.2577,89.5),(35,'ru',801,0.2577,36.5),(35,'ru',807,0.2577,44.5),(35,'ru',840,0.2577,46.5),(35,'ru',868,0.2577,42.5),(35,'ru',890,0.3776,52.5),(35,'ru',903,0.2577,90.5),(35,'ru',905,0.2577,93.5),(35,'ru',948,0.2577,88.5),(35,'ru',951,0.2577,76.5),(35,'ru',994,0.3776,60),(35,'ru',995,0.2577,37.5),(35,'ru',996,0.2577,39.5),(35,'ru',997,0.2577,43.5),(35,'ru',998,0.2577,54.5),(35,'ru',999,0.2577,56.5),(35,'ru',1000,0.2577,57.5),(35,'ru',1001,0.2577,58.5),(35,'ru',1002,0.2577,61.5),(35,'ru',1003,0.2577,62.5),(35,'ru',1004,0.2577,64.5),(35,'ru',1005,0.2577,70.5),(35,'ru',1006,0.2577,72.5),(35,'ru',1007,0.2577,73.5),(35,'ru',1008,0.2577,75.5),(35,'ru',1009,0.2577,82.5),(35,'ru',1010,0.2577,91.5),(36,'ru',14,0.1577,133),(36,'ru',17,0.25,31),(36,'ru',26,0.25,52),(36,'ru',58,0.25,57),(36,'ru',115,0.1577,102),(36,'ru',199,0.25,62),(36,'ru',241,0.1577,129),(36,'ru',389,0.25,42),(36,'ru',391,0.1577,98),(36,'ru',406,0.25,35),(36,'ru',441,0.1577,100),(36,'ru',550,0.25,55),(36,'ru',771,0.25,60),(36,'ru',782,0.1577,130),(36,'ru',798,0.3662,66),(36,'ru',800,0.25,53),(36,'ru',801,0.25,33),(36,'ru',824,0.1577,112),(36,'ru',826,0.25,27),(36,'ru',857,0.1577,103),(36,'ru',859,0.1577,104),(36,'ru',954,0.1577,118),(36,'ru',966,0.25,38),(36,'ru',967,0.3155,19),(36,'ru',1011,0.25,30),(36,'ru',1012,0.25,32),(36,'ru',1013,0.3662,46),(36,'ru',1014,0.25,39),(36,'ru',1015,0.25,40),(36,'ru',1016,0.25,41),(36,'ru',1017,0.25,48),(36,'ru',1018,0.25,51),(36,'ru',1019,0.25,56),(36,'ru',1020,0.25,59),(36,'ru',1021,0.25,61),(36,'ru',1022,0.25,63),(36,'ru',1023,0.25,65),(36,'ru',1024,0.25,66),(36,'ru',1025,0.25,68),(36,'ru',1026,0.1577,110),(36,'ru',1027,0.1577,114),(36,'ru',1028,0.1577,115),(36,'ru',1029,0.1577,117),(36,'ru',1030,0.1577,124),(36,'ru',1031,0.1577,125),(36,'ru',1032,0.1577,126),(36,'ru',1033,0.1577,131),(37,'ru',75,0.3042,46.5),(37,'ru',287,0.3042,38.5),(37,'ru',351,0.3042,29.5),(37,'ru',377,0.3042,39.5),(37,'ru',400,0.3042,21.5),(37,'ru',405,0.3042,40.5),(37,'ru',407,0.3042,23.5),(37,'ru',433,0.3042,45.5),(37,'ru',619,0.3042,28.5),(37,'ru',798,0.3042,20.5),(37,'ru',800,0.3042,19.5),(37,'ru',1034,0.192,1),(37,'ru',1035,0.3042,25.5),(37,'ru',1036,0.3042,26.5),(37,'ru',1037,0.3042,30.5),(37,'ru',1038,0.3042,32.5),(37,'ru',1039,0.3042,41.5),(37,'ru',1040,0.3042,43.5),(37,'ru',1041,0.3042,48.5),(38,'ru',236,0.2694,50.5),(38,'ru',302,0.2694,36.5),(38,'ru',335,0.2694,52.5),(38,'ru',384,0.2694,30.5),(38,'ru',412,0.2694,61.5),(38,'ru',429,0.2694,45.5),(38,'ru',441,0.2694,64.5),(38,'ru',589,0.2694,62.5),(38,'ru',683,0.2694,43.5),(38,'ru',802,0.3947,34.5),(38,'ru',856,0.2694,60.5),(38,'ru',919,0.2694,67.5),(38,'ru',1021,0.2694,66.5),(38,'ru',1042,0.34,18.6667),(38,'ru',1043,0.2694,28.5),(38,'ru',1044,0.2694,31.5),(38,'ru',1045,0.2694,32.5),(38,'ru',1046,0.2694,33.5),(38,'ru',1047,0.2694,34.5),(38,'ru',1048,0.2694,35.5),(38,'ru',1049,0.2694,44.5),(38,'ru',1050,0.2694,47.5),(38,'ru',1051,0.2694,48.5),(38,'ru',1052,0.2694,49.5),(38,'ru',1053,0.2694,51.5),(38,'ru',1054,0.2694,53.5),(38,'ru',1055,0.2694,59.5),(38,'ru',1056,0.2694,68.5),(39,'ru',68,0.2823,55),(39,'ru',222,0.2823,28),(39,'ru',391,0.2823,25),(39,'ru',397,0.4135,46),(39,'ru',399,0.2823,39),(39,'ru',492,0.2823,30),(39,'ru',800,0.2823,35),(39,'ru',802,0.5,34),(39,'ru',859,0.2823,62),(39,'ru',953,0.2823,31),(39,'ru',1014,0.2823,44),(39,'ru',1057,0.4604,31.4),(39,'ru',1058,0.2823,24),(39,'ru',1059,0.2823,26),(39,'ru',1060,0.2823,40),(39,'ru',1061,0.2823,43),(39,'ru',1062,0.2823,52),(39,'ru',1063,0.2823,53),(39,'ru',1064,0.2823,58),(39,'ru',1065,0.2823,59),(40,'ru',26,0.2823,51),(40,'ru',237,0.2823,46),(40,'ru',335,0.2823,33),(40,'ru',391,0.2823,22),(40,'ru',800,0.2823,50),(40,'ru',802,0.5,30.3333),(40,'ru',823,0.2823,31),(40,'ru',932,0.2823,53),(40,'ru',948,0.2823,29),(40,'ru',994,0.2823,21),(40,'ru',1007,0.2823,38),(40,'ru',1021,0.2823,49),(40,'ru',1054,0.2823,34),(40,'ru',1059,0.2823,23),(40,'ru',1066,0.3562,16.3333),(40,'ru',1067,0.2823,25),(40,'ru',1068,0.2823,26),(40,'ru',1069,0.2823,27),(40,'ru',1070,0.2823,30),(40,'ru',1071,0.2823,35),(40,'ru',1072,0.2823,37),(40,'ru',1073,0.2823,47),(41,'ru',80,0.2742,73.5),(41,'ru',204,0.2742,38.5),(41,'ru',300,0.2742,42.5),(41,'ru',301,0.4016,48),(41,'ru',302,0.2742,42.5),(41,'ru',329,0.2742,40.5),(41,'ru',653,0.2742,48.5),(41,'ru',802,0.2742,30.5),(41,'ru',823,0.2742,34.5),(41,'ru',856,0.2742,29.5),(41,'ru',864,0.2742,60.5),(41,'ru',884,0.2742,50.5),(41,'ru',899,0.2742,36.5),(41,'ru',1054,0.2742,32.5),(41,'ru',1074,0.173,1),(41,'ru',1075,0.2742,28.5),(41,'ru',1076,0.2742,37.5),(41,'ru',1077,0.2742,41.5),(41,'ru',1078,0.2742,51.5),(41,'ru',1079,0.2742,52.5),(41,'ru',1080,0.2742,56.5),(41,'ru',1081,0.2742,57.5),(41,'ru',1082,0.2742,59.5),(41,'ru',1083,0.2742,63.5),(41,'ru',1084,0.2742,65.5),(41,'ru',1085,0.2742,72.5),(41,'ru',1086,0.2742,75.5),(42,'ru',26,0.2613,68.5),(42,'ru',291,0.2613,63.5),(42,'ru',377,0.2613,57.5),(42,'ru',380,0.2613,38.5),(42,'ru',456,0.2613,61.5),(42,'ru',725,0.2613,56.5),(42,'ru',802,0.4628,41.8333),(42,'ru',808,0.2613,36.5),(42,'ru',833,0.3828,53),(42,'ru',847,0.2613,29.5),(42,'ru',852,0.2613,32.5),(42,'ru',953,0.2613,66.5),(42,'ru',964,0.2613,62.5),(42,'ru',994,0.2613,27.5),(42,'ru',1054,0.2613,33.5),(42,'ru',1059,0.2613,48.5),(42,'ru',1060,0.2613,70.5),(42,'ru',1070,0.2613,30.5),(42,'ru',1087,0.1649,1),(42,'ru',1088,0.2613,35.5),(42,'ru',1089,0.2613,37.5),(42,'ru',1090,0.2613,41.5),(42,'ru',1091,0.2613,42.5),(42,'ru',1092,0.2613,44.5),(42,'ru',1093,0.2613,46.5),(42,'ru',1094,0.2613,54.5),(42,'ru',1095,0.2613,58.5),(42,'ru',1096,0.2613,59.5),(42,'ru',1097,0.2613,72.5),(42,'ru',1098,0.3828,72.5),(44,'ru',40,0.2754,57.5),(44,'ru',237,0.2754,38.5),(44,'ru',377,0.2754,26.5),(44,'ru',399,0.2754,42.5),(44,'ru',455,0.2754,55.5),(44,'ru',500,0.2754,60.5),(44,'ru',501,0.2754,61.5),(44,'ru',725,0.2754,48.5),(44,'ru',800,0.2754,27.5),(44,'ru',802,0.4035,40.5),(44,'ru',808,0.2754,32.5),(44,'ru',823,0.2754,35.5),(44,'ru',838,0.1738,2),(44,'ru',845,0.2754,30.5),(44,'ru',1007,0.2754,53.5),(44,'ru',1021,0.2754,41.5),(44,'ru',1054,0.2754,37.5),(44,'ru',1088,0.2754,31.5),(44,'ru',1094,0.2754,63.5),(44,'ru',1100,0.1738,1),(44,'ru',1101,0.2754,25.5),(44,'ru',1102,0.2754,34.5),(44,'ru',1103,0.2754,39.5),(44,'ru',1104,0.2754,50.5),(44,'ru',1105,0.2754,58.5),(44,'ru',1106,0.2754,59.5),(44,'ru',1107,0.2754,64.5),(45,'ru',1,0.1417,173),(45,'ru',8,0.2246,11),(45,'ru',9,0.2835,30.3333),(45,'ru',15,0.2246,134),(45,'ru',25,0.1417,28),(45,'ru',26,0.3979,67),(45,'ru',29,0.2246,139.5),(45,'ru',45,0.2246,43),(45,'ru',52,0.1417,39),(45,'ru',58,0.2246,98),(45,'ru',75,0.1417,81),(45,'ru',138,0.1417,75),(45,'ru',143,0.1417,170),(45,'ru',150,0.1417,144),(45,'ru',166,0.2246,101.5),(45,'ru',174,0.1417,74),(45,'ru',188,0.1417,168),(45,'ru',207,0.1417,57),(45,'ru',241,0.1417,178),(45,'ru',300,0.1417,77),(45,'ru',301,0.1417,77),(45,'ru',302,0.1417,77),(45,'ru',307,0.2246,151.5),(45,'ru',310,0.2246,152.5),(45,'ru',351,0.1417,105),(45,'ru',355,0.3291,101),(45,'ru',378,0.1417,55),(45,'ru',389,0.1417,32),(45,'ru',393,0.1417,195),(45,'ru',396,0.1417,92),(45,'ru',397,0.1417,104),(45,'ru',399,0.1417,58),(45,'ru',406,0.1417,48),(45,'ru',412,0.1417,155),(45,'ru',425,0.2246,161),(45,'ru',428,0.1417,179),(45,'ru',438,0.1417,51),(45,'ru',439,0.1417,52),(45,'ru',440,0.2835,11.6667),(45,'ru',444,0.1417,119),(45,'ru',445,0.1417,159),(45,'ru',460,0.2835,141),(45,'ru',545,0.1417,135),(45,'ru',586,0.2246,13),(45,'ru',588,0.3291,170.75),(45,'ru',642,0.1417,146),(45,'ru',654,0.1417,161),(45,'ru',677,0.1417,76),(45,'ru',708,0.1417,70),(45,'ru',914,0.1417,91),(45,'ru',950,0.2246,32.5),(45,'ru',1007,0.1417,84),(45,'ru',1021,0.1417,83),(45,'ru',1030,0.2246,142.5),(45,'ru',1036,0.1417,103),(45,'ru',1108,0.2246,12),(45,'ru',1109,0.1417,26),(45,'ru',1110,0.1417,30),(45,'ru',1111,0.1417,31),(45,'ru',1112,0.1417,33),(45,'ru',1113,0.1417,34),(45,'ru',1114,0.1417,35),(45,'ru',1115,0.1417,37),(45,'ru',1116,0.1417,40),(45,'ru',1117,0.1417,41),(45,'ru',1118,0.1417,50),(45,'ru',1119,0.1417,59),(45,'ru',1120,0.1417,60),(45,'ru',1121,0.1417,73),(45,'ru',1122,0.1417,86),(45,'ru',1123,0.1417,89),(45,'ru',1124,0.1417,98),(45,'ru',1125,0.1417,101),(45,'ru',1126,0.2246,115),(45,'ru',1127,0.2835,148),(45,'ru',1128,0.1417,118),(45,'ru',1129,0.1417,122),(45,'ru',1130,0.1417,126),(45,'ru',1131,0.1417,130),(45,'ru',1132,0.1417,136),(45,'ru',1133,0.1417,137),(45,'ru',1134,0.1417,145),(45,'ru',1135,0.1417,148),(45,'ru',1136,0.1417,149),(45,'ru',1137,0.1417,154),(45,'ru',1138,0.1417,157),(45,'ru',1139,0.1417,160),(45,'ru',1140,0.1417,167),(45,'ru',1141,0.1417,171),(45,'ru',1142,0.1417,172),(45,'ru',1143,0.1417,174),(45,'ru',1144,0.1417,180),(45,'ru',1145,0.1417,192),(45,'ru',1146,0.1417,193),(45,'ru',1147,0.1417,196),(45,'ru',1148,0.2246,203),(45,'ru',1149,0.1417,199),(45,'ru',1150,0.1417,207),(45,'ru',1151,0.1417,209),(46,'ru',1,0.2424,4),(46,'ru',26,0.3551,57),(46,'ru',37,0.1529,91),(46,'ru',39,0.1529,87),(46,'ru',45,0.1529,138),(46,'ru',50,0.1529,97),(46,'ru',70,0.2424,76),(46,'ru',78,0.1529,4),(46,'ru',79,0.1529,66),(46,'ru',80,0.1529,26),(46,'ru',90,0.1529,62),(46,'ru',116,0.1529,124),(46,'ru',134,0.2424,95),(46,'ru',156,0.1529,25),(46,'ru',377,0.1529,77),(46,'ru',391,0.1529,9),(46,'ru',394,0.1529,2),(46,'ru',397,0.2424,74),(46,'ru',399,0.1529,122),(46,'ru',402,0.1529,58),(46,'ru',405,0.1529,94),(46,'ru',412,0.1529,101),(46,'ru',422,0.1529,95),(46,'ru',423,0.1529,42),(46,'ru',427,0.1529,28),(46,'ru',430,0.1529,20),(46,'ru',434,0.1529,40),(46,'ru',435,0.1529,21),(46,'ru',436,0.3058,36.3333),(46,'ru',456,0.1529,74),(46,'ru',460,0.2424,52),(46,'ru',564,0.1529,34),(46,'ru',586,0.3551,44.5),(46,'ru',642,0.1529,96),(46,'ru',655,0.1529,121),(46,'ru',656,0.2424,121),(46,'ru',713,0.1529,50),(46,'ru',814,0.2424,75.5),(46,'ru',859,0.1529,128),(46,'ru',943,0.1529,36),(46,'ru',1130,0.1529,57),(46,'ru',1132,0.1529,76),(46,'ru',1134,0.1529,52),(46,'ru',1152,0.1529,5),(46,'ru',1153,0.1529,6),(46,'ru',1154,0.1529,16),(46,'ru',1155,0.1529,18),(46,'ru',1156,0.1529,22),(46,'ru',1157,0.1529,23),(46,'ru',1158,0.1529,27),(46,'ru',1159,0.1529,29),(46,'ru',1160,0.1529,35),(46,'ru',1161,0.1529,38),(46,'ru',1162,0.1529,41),(46,'ru',1163,0.1529,49),(46,'ru',1164,0.1529,51),(46,'ru',1165,0.1529,55),(46,'ru',1166,0.2424,70.5),(46,'ru',1167,0.1529,60),(46,'ru',1168,0.1529,61),(46,'ru',1169,0.1529,63),(46,'ru',1170,0.1529,65),(46,'ru',1171,0.1529,75),(46,'ru',1172,0.1529,84),(46,'ru',1173,0.1529,88),(46,'ru',1174,0.1529,90),(46,'ru',1175,0.1529,92),(46,'ru',1176,0.1529,98),(46,'ru',1177,0.2424,112.5),(46,'ru',1178,0.1529,109),(46,'ru',1179,0.1529,116),(46,'ru',1180,0.1529,126),(46,'ru',1181,0.1529,139),(46,'ru',1182,0.1529,140),(46,'ru',1183,0.1529,141),(46,'ru',1184,0.1529,142),(47,'ru',7,0.1738,19),(47,'ru',26,0.1738,29),(47,'ru',90,0.2754,26),(47,'ru',100,0.1738,15),(47,'ru',105,0.1738,47),(47,'ru',118,0.1738,3),(47,'ru',135,0.1738,42),(47,'ru',355,0.2754,32),(47,'ru',384,0.1738,2),(47,'ru',394,0.1738,16),(47,'ru',440,0.2754,36),(47,'ru',450,0.2754,49),(47,'ru',451,0.1738,33),(47,'ru',454,0.1738,14),(47,'ru',545,0.1738,13),(47,'ru',646,0.1738,28),(47,'ru',662,0.1738,22),(47,'ru',775,0.1738,64),(47,'ru',946,0.1738,24),(47,'ru',957,0.1738,55),(47,'ru',1185,0.1738,1),(47,'ru',1186,0.1738,4),(47,'ru',1187,0.1738,5),(47,'ru',1188,0.1738,6),(47,'ru',1189,0.1738,7),(47,'ru',1190,0.1738,8),(47,'ru',1191,0.1738,10),(47,'ru',1192,0.1738,17),(47,'ru',1193,0.1738,20),(47,'ru',1194,0.1738,21),(47,'ru',1195,0.1738,23),(47,'ru',1196,0.1738,25),(47,'ru',1197,0.1738,26),(47,'ru',1198,0.1738,30),(47,'ru',1199,0.1738,31),(47,'ru',1200,0.1738,32),(47,'ru',1201,0.1738,36),(47,'ru',1202,0.1738,43),(47,'ru',1203,0.1738,44),(47,'ru',1204,0.1738,45),(47,'ru',1205,0.1738,48),(47,'ru',1206,0.1738,49),(47,'ru',1207,0.1738,50),(47,'ru',1208,0.1738,51),(47,'ru',1209,0.1738,53),(47,'ru',1210,0.1738,54),(47,'ru',1211,0.1738,56),(47,'ru',1212,0.1738,62),(47,'ru',1213,0.1738,65),(47,'ru',1214,0.1738,66),(48,'ru',20,0.1626,28),(48,'ru',100,0.3252,43.3333),(48,'ru',106,0.1626,32),(48,'ru',118,0.1626,3),(48,'ru',129,0.1626,45),(48,'ru',135,0.1626,62),(48,'ru',179,0.1626,53),(48,'ru',307,0.1626,24),(48,'ru',309,0.1626,25),(48,'ru',310,0.2577,25),(48,'ru',454,0.1626,6),(48,'ru',508,0.1626,41),(48,'ru',510,0.1626,13),(48,'ru',526,0.1626,7),(48,'ru',535,0.1626,5),(48,'ru',554,0.2577,46),(48,'ru',558,0.1626,1),(48,'ru',662,0.1626,18),(48,'ru',916,0.1626,44),(48,'ru',932,0.1626,47),(48,'ru',946,0.1626,40),(48,'ru',957,0.1626,67),(48,'ru',1095,0.1626,26),(48,'ru',1131,0.1626,14),(48,'ru',1187,0.1626,15),(48,'ru',1188,0.1626,16),(48,'ru',1194,0.1626,17),(48,'ru',1195,0.1626,19),(48,'ru',1202,0.1626,83),(48,'ru',1204,0.1626,84),(48,'ru',1205,0.1626,55),(48,'ru',1206,0.1626,88),(48,'ru',1207,0.1626,89),(48,'ru',1208,0.1626,90),(48,'ru',1210,0.1626,93),(48,'ru',1211,0.1626,68),(48,'ru',1212,0.1626,74),(48,'ru',1213,0.1626,65),(48,'ru',1214,0.1626,66),(48,'ru',1215,0.3252,31),(48,'ru',1216,0.1626,4),(48,'ru',1217,0.1626,10),(48,'ru',1218,0.2577,23.5),(48,'ru',1219,0.1626,21),(48,'ru',1220,0.2577,21),(48,'ru',1221,0.1626,22),(48,'ru',1222,0.1626,30),(48,'ru',1223,0.1626,31),(48,'ru',1224,0.1626,33),(48,'ru',1225,0.1626,34),(48,'ru',1226,0.1626,49),(48,'ru',1227,0.2577,54),(48,'ru',1228,0.1626,54),(48,'ru',1229,0.1626,63),(48,'ru',1230,0.1626,75),(48,'ru',1231,0.1626,78),(48,'ru',1232,0.1626,80),(48,'ru',1233,0.1626,81),(48,'ru',1234,0.1626,82),(48,'ru',1235,0.1626,85),(48,'ru',1236,0.1626,87),(48,'ru',1237,0.1626,92),(49,'ru',2,0.1626,5),(49,'ru',42,0.1626,49),(49,'ru',75,0.1626,32),(49,'ru',100,0.3776,47.25),(49,'ru',106,0.1626,27),(49,'ru',118,0.1626,6),(49,'ru',135,0.1626,61),(49,'ru',146,0.1626,52),(49,'ru',225,0.1626,29),(49,'ru',244,0.1626,25),(49,'ru',367,0.1626,79),(49,'ru',407,0.3252,23.3333),(49,'ru',454,0.1626,17),(49,'ru',642,0.1626,4),(49,'ru',693,0.2577,53),(49,'ru',776,0.1626,56),(49,'ru',782,0.1626,87),(49,'ru',821,0.1626,31),(49,'ru',826,0.1626,60),(49,'ru',844,0.1626,50),(49,'ru',888,0.1626,55),(49,'ru',939,0.1626,57),(49,'ru',946,0.1626,38),(49,'ru',957,0.1626,99),(49,'ru',1141,0.1626,2),(49,'ru',1186,0.1626,14),(49,'ru',1187,0.1626,15),(49,'ru',1188,0.1626,16),(49,'ru',1202,0.1626,85),(49,'ru',1204,0.2577,92),(49,'ru',1206,0.1626,95),(49,'ru',1211,0.1626,100),(49,'ru',1212,0.1626,106),(49,'ru',1218,0.1626,21),(49,'ru',1230,0.1626,62),(49,'ru',1238,0.2577,10),(49,'ru',1239,0.1626,7),(49,'ru',1240,0.1626,13),(49,'ru',1241,0.1626,20),(49,'ru',1242,0.1626,22),(49,'ru',1243,0.1626,24),(49,'ru',1244,0.1626,26),(49,'ru',1245,0.1626,28),(49,'ru',1246,0.1626,30),(49,'ru',1247,0.1626,41),(49,'ru',1248,0.1626,42),(49,'ru',1249,0.1626,45),(49,'ru',1250,0.1626,46),(49,'ru',1251,0.1626,47),(49,'ru',1252,0.2577,47),(49,'ru',1253,0.1626,51),(49,'ru',1254,0.1626,53),(49,'ru',1255,0.1626,54),(49,'ru',1256,0.1626,59),(49,'ru',1257,0.1626,65),(49,'ru',1258,0.1626,67),(49,'ru',1259,0.1626,68),(49,'ru',1260,0.1626,76),(49,'ru',1261,0.1626,77),(49,'ru',1262,0.1626,78),(49,'ru',1263,0.1626,88),(49,'ru',1264,0.1626,96),(50,'ru',1265,0.3667,5.5),(54,'ru',26,0.2921,50),(54,'ru',37,0.2921,43),(54,'ru',189,0.2921,27),(54,'ru',400,0.2921,44),(54,'ru',436,0.2921,41),(54,'ru',456,0.2921,49),(54,'ru',661,0.2921,40),(54,'ru',802,0.2921,24),(54,'ru',811,0.2921,42),(54,'ru',845,0.2921,26),(54,'ru',847,0.2921,32),(54,'ru',917,0.2921,46),(54,'ru',921,0.2921,45),(54,'ru',994,0.2921,20),(54,'ru',1007,0.2921,23),(54,'ru',1021,0.2921,48),(54,'ru',1067,0.2921,28),(54,'ru',1068,0.2921,29),(54,'ru',1069,0.2921,30),(54,'ru',1070,0.2921,33),(54,'ru',1094,0.2921,21),(54,'ru',1099,0.1843,1),(55,'ru',1266,0.2314,1),(55,'ru',1267,0.2314,2),(55,'ru',1268,0.2314,3),(56,'ru',1266,0.2314,1),(56,'ru',1267,0.2314,2),(56,'ru',1268,0.2314,3),(57,'ru',1269,0.2314,1),(58,'ru',614,0.2314,3),(58,'ru',1270,0.2314,1),(59,'ru',1270,0.2314,1),(60,'ru',1271,0.2314,1),(61,'ru',1272,0.2314,1),(62,'ru',1273,0.2314,1),(63,'ru',1274,0.2314,1),(64,'ru',789,0.2314,2),(64,'ru',1018,0.2314,1),(65,'ru',1275,0.2314,1),(66,'ru',1276,0.2314,1),(67,'ru',1277,0.2314,1),(68,'ru',1278,0.2314,1),(69,'ru',3,0.2314,2),(69,'ru',1279,0.2314,1),(70,'ru',3,0.2314,2),(70,'ru',1279,0.2314,1),(71,'ru',3,0.2314,2),(71,'ru',1279,0.2314,1),(72,'ru',789,0.2314,2),(72,'ru',1018,0.2314,1);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_text`
--

DROP TABLE IF EXISTS `b_search_content_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_text`
--

LOCK TABLES `b_search_content_text` WRITE;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
INSERT INTO `b_search_content_text` VALUES (1,'3140fa939e82d14de3829b731863cd80','УСЛУГИ\r\n\r\n'),(2,'43974ce3161b1536a23aab70dfdf083c','ПРОДУКЦИЯ\r\n\r\n'),(3,'626a5d1bd18fcc622fbe4e4e3619a88a','НОВОСТИ\r\n\r\n'),(4,'be3fe2336ca014ea48484837a6379cf7','КАРТА САЙТА\r\n\r\n'),(5,'f58e028735b5d07233c4a161c9231405','ПОИСК\r\n\r\n'),(6,'9dc81310e5f6940cd74425623ed50b52','МЕБЕЛЬНАЯ КОМПАНИЯ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ «МЕБЕЛЬНАЯ КОМПАНИЯ» ПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ.\n«МЕБЕЛЬНАЯ КОМПАНИЯ» ОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД – С ДРУГОЙ.\nНАША ПРОДУКЦИЯ\rНАШИ УСЛУГИ\r\n'),(7,'17e08217818f62561b1d2f0f3a016a1f','МИССИЯ И СТРАТЕГИЯ\r\nМЕБЕЛЬНАЯ КОМПАНИЯ\r- ДИНАМИЧНО РАЗВИВАЮЩЕЕСЯ ПРОИЗВОДСТВЕННОЕ 							ПРЕДПРИЯТИЕ, КОТОРОЕ ИМЕЕТ ПЕРЕД СОБОЙ \nЯСНО ВЫРАЖЕННЫЕ ЦЕЛИ И ИНСТРУМЕНТЫ ДЛЯ 							ИХ ДОСТИЖЕНИ.МЫ ПРЕДОСТАВЛЯЕМ КАЖДОМУ ЛУЧШУЮ ВОЗМОЖНОСТЬ ОБУСТРОИТЬ СВОЕ ЖИЗНЕННОЕ \nИ РАБОЧЕЕ ПРОСТРАНСТВО.МЫ РАБОТАЕМ НА ДОЛГОСРОЧНУЮ ПЕРСПЕКТИВУ И ПРЕДЛАГАЕМ ОПТИМАЛЬНЫЕ 							РЕШЕНИЯ. КОМПАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r- \nНАДЕЖНЫЙ, ТЕХНОЛОГИЧНЫЙ, ГИБКИЙ ПОСТАВЩИК 							С БОЛЬШИМИ МОЩНОСТЯМИ. 						\rЦЕЛИ И ЗАДАЧИ\rОПРАВДЫВАТЬ ОЖИДАНИЯ ЗАКАЗЧИКА: КЛИЕНТ ВСЕГДА ПРАВ. ТОЛЬКО ПОТРЕБИТЕЛЬ ФОРМИРУЕТ 									ЕДИНУЮ СИСТЕМУ ВЗГЛЯДОВ НА КАЧЕСТВО \nВЫПУСКАЕМОЙ ПРОДУКЦИИ И РАБОТ.\rДОБИТЬСЯ ОТ РАБОТНИКОВ КОМПАНИИ ПОНИМАНИЯ ИХ ЛИЧНОЙ ОТВЕТСТВЕННОСТИ ЗА КАЧЕСТВО 									РАБОТ.\rПУТЕМ ПОВЫШЕНИЯ КАЧЕСТВА ПРОДУКЦИИ И РАБОТ ПОСТОЯННО УВЕЛИЧИВАТЬ ОБЪЕМЫ ПРОИЗВОДСТВА 									С ЦЕЛЬЮ ПОСЛЕДУЮЩЕГО РЕИНВЕСТИРОВАНИЯ \nПРИБЫЛИ В РАЗВИТИЕ КОМПАНИИ.\rОБЕСПЕЧИВАТЬ СТРОГОЕ СООТВЕТСТВИЕ ПРОИЗВОДИМОЙ ПРОДУКЦИИ ТРЕБОВАНИЯМ ПОТРЕБИТЕЛЕЙ, 									НОРМАМ И ПРАВИЛАМ \nБЕЗОПАСНОСТИ, ТРЕБОВАНИЯМ ЗАЩИТЫ ОКРУЖАЮЩЕЙ СРЕДЫ.\rПОЛИТИКА КОМПАНИИ\rПОСТОЯННОЕ СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ КАЧЕСТВА. СВОЕВРЕМЕННОЕ И ЭФФЕКТИВНОЕ ПРИНЯТИЕ 									КОРРЕКТИРУЮЩИХ МЕР .\rЗАБОТА О РАБОТНИКАХ КОМПАНИИ. СОЗДАНИЕ УСЛОВИЙ ТРУДА И ОСНАЩЕНИЕ РАБОЧИХ МЕСТ, СООТВЕТСТВУЮЩИХ 									ВСЕМ САНИТАРНЫМ \nИ ГИГИЕНИЧЕСКИМ НОРМАМ.\rПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ СОТРУДНИКОВ. ОБЕСПЕЧЕНИЕ МОРАЛЬНОГО И МАТЕРИАЛЬНОГО УДОВЛЕТВОРЕНИЯ 									РАБОТНИКОВ КОМПАНИИ.\rСИСТЕМАТИЧЕСКОЕ ОБУЧЕНИЕ РАБОТНИКОВ ВСЕХ УРОВНЕЙ С ЦЕЛЬЮ ПОСТОЯННОГО ПОВЫШЕНИЯ ИХ 									ПРОФЕССИОНАЛЬНОГО МАСТЕРСТВА.\rВНЕДРЕНИЕ ВЫСОКОПРОИЗВОДИТЕЛЬНОГО ОБОРУДОВАНИЯ И НОВЕЙШИХ ТЕХНОЛОГИЙ ДЛЯ ПОВЫШЕНИЯ 									ПРОИЗВОДИТЕЛЬНОСТИ ТРУДА, \nОПТИМИЗАЦИИ ЗАТРАТ И, КАК РЕЗУЛЬТАТ, СНИЖЕНИЯ ЦЕН 									НА ВЫПУСКАЕМУЮ ПРОДУКЦИЮ.\rСОЗДАНИЕ НОВЫХ РАБОЧИХ МЕСТ. ПРИВЛЕЧЕНИЕ НА РАБОТУ СПЕЦИАЛИСТОВ ВЫСОКОЙ КВАЛИФИКАЦИИ.\rВЫХОД НА МЕЖДУНАРОДНЫЙ РЫНОК.\rМЫ РАЗВИВАЕМ ДОВЕРИТЕЛЬНЫЕ ВЗАИМОВЫГОДНЫЕ ОТНОШЕНИЯ СО СВОИМИ ПАРТНЕРАМИ В ДОЛГОСРОЧНЫХ 							ИНТЕРЕСАХ НАШЕГО БИЗНЕСА. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rОТВЕТСТВЕННО ОТНОСИТСЯ 							К ВЫПОЛНЕНИЮ ВЗЯТЫХ НА СЕБЯ ОБЯЗАТЕЛЬСТВ И ЖДЕТ ТАКОГО ЖЕ \nПОДХОДА К ДЕЛУ ОТ 							СВОИХ ПАРТНЕРОВ ПО БИЗНЕСУ. ЭТА ТРЕБОВАТЕЛЬНОСТЬ  ЗАЛОГ НАШЕЙ ДОЛГОСРОЧНОЙ ПРИБЫЛЬНОСТИ. 						\rСО ДНЯ СВОЕГО ОСНОВАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rСОДЕЙСТВУЕТ РОСТУ БЛАГОСОСТОЯНИЯ 							РЕГИОНОВ РОССИИ. МЫ ПОНИМАЕМ ВАЖНОСТЬ \nСОЦИАЛЬНОЙ ОТВЕТСТВЕННОСТИ НАШЕЙ КОМПАНИИ 							И ОСТАНЕМСЯ ПРИМЕРОМ В ВОПРОСАХ СОЦИАЛЬНОЙ ЗАЩИЩЕННОСТИ НАШИХ СОТРУДНИКОВ.\r\n'),(8,'55171aa121806afa21b564e0af9ed46f','ИСТОРИЯ\r\n1992Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНАЧИНАЛАСЬ С ИЗГОТОВЛЕНИЯ МЕБЕЛИ ДЛЯ ШКОЛ И ОФИСОВ. ПЕРВОЕ 									ПРОИЗВОДСТВО МЕБЕЛИ РАСПОЛАГАЛОСЬ В АРЕНДУЕМОЙ МАСТЕРСКОЙ, ПЛОЩАДЬЮ 400 М2 С ОДНИМ 									ДЕРЕВООБРАБАТЫВАЮЩИМ СТАНКОМ. В КОМПАНИИ РАБОТАЛО ДВАДЦАТЬ ЧЕЛОВЕК. ВСЕ ЗАРАБОТАННЫЕ 									СРЕДСТВА ВКЛАДЫВАЛИСЬ В РАЗВИТИЕ, ЧТО ПОЗВОЛИЛО МОЛОДОЙ КОМПАНИИ РАСТИ БЫСТРЫМИ 									ТЕМПАМИ. 								\r1993Г. 								\rВВЕДЕН В ЭКСПЛУАТАЦИЮ НОВЫЙ ЦЕХ ПЛОЩАДЬЮ 700 М2, СТАВШИЙ ПЕРВОЙ СОБСТВЕННОСТЬЮ 									\rМЕБЕЛЬНОЙ КОМПАНИИ\r. МОДЕРНИЗАЦИЯ ПРОИЗВОДСТВЕННОЙ БАЗЫ ПРЕДПРИЯТИЯ СТАЛА ХОРОШЕЙ 									ТРАДИЦИЕЙ. КОМПАНИЯ ПОСТЕПЕННО ПЕРЕШЛА К БОЛЕЕ СОВЕРШЕННОМУ ОБОРУДОВАНИЮ, ЧТО ПОЗВОЛИЛО 									ПОВЫСИТЬ УРОВЕНЬ КАЧЕСТВА ВЫПУСКАЕМОЙ ПРОДУКЦИИ И ЗНАЧИТЕЛЬНО УВЕЛИЧИТЬ ОБЪЕМЫ ПРОИЗВОДСТВА. 								\r1998Г. 								\rВ ВОРОНЕЖЕ ОТКРЫТ ПЕРВЫЙ ФИРМЕННЫЙ МАГАЗИН-САЛОН \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. ШАГ ЗА ШАГОМ 									ПРОДУКЦИЯ ПРЕДПРИЯТИЯ ЗАВОЕВЫВАЛА РЕГИОНЫ СИБИРИ И УРАЛА, МОСКВЫ И ПОДМОСКОВЬЯ, 									ЮГА И СЕВЕРО-ЗАПАДА РОССИИ. ПРОИЗВОДСТВЕННЫЕ ПЛОЩАДИ КОМПАНИИ УВЕЛИЧЕНЫ ДО 5000 									М2. 								\r1999Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rСТАЛА ДИПЛОМАНТОМ ОДНОЙ ИЗ САМЫХ ПРЕСТИЖНЫХ МЕЖДУНАРОДНЫХ 									ВЫСТАВОК \rЕВРОЭКСПОМЕБЕЛЬ-99\r- ПЕРВОЕ ОФИЦИАЛЬНОЕ ПРИЗНАНИЕ МЕБЕЛЬНОЙ ПРОДУКЦИИ 									МЕБЕЛЬНОЙ КОМПАНИИ. В ЭТОМ ЖЕ ГОДУ КОМПАНИЯ ВЫХОДИТ НА МИРОВОЙ РЫНОК. БЫЛ ЗАКЛЮЧЕН 									РЯД КОНТРАКТОВ НА ПОСТАВКУ МЕБЕЛИ В СТРАНЫ СНГ И БЛИЖНЕГО ЗАРУБЕЖЬЯ. 								\r2000Г. 								\rКОЛЛЕКТИВ КОМПАНИИ НАСЧИТЫВАЕТ БОЛЕЕ 500 СОТРУДНИКОВ. ЗАКЛЮЧАЮТСЯ НОВЫЕ КОНТРАКТ 									НА ПОСТАВКУ МЕБЕЛИ В ЕВРОПЕЙСКИЕ СТРАНЫ. 								\r2002Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rВОШЛА В ДЕСЯТКУ ЛУЧШИХ ПРОИЗВОДИТЕЛЕЙ МЕБЕЛИ ПО ДАННЫМ ВЕДУЩИХ 									МЕБЕЛЬНЫХ САЛОНОВ РОССИИ, А ТАКЖЕ В ЧИСЛО ЛИДЕРОВ ОРГАНИЗАЦИОННОГО РАЗВИТИЯ. 								\r2003Г. 								\rПРИСТУПИЛИ К СТРОИТЕЛЬСТВУ СКЛАДА МАТЕРИАЛОВ. В МОСКВЕ ОТКРЫТ ФИЛИАЛ КОМПАНИИ. \nПРОВЕДЕНА ПЕРВАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ, РЕЗУЛЬТАТОМ КОТОРОЙ СТАЛО УКРЕПЛЕНИЕ ВЗАИМОВЫГОДНЫХ 									ОТНОШЕНИЙ И ЗАКЛЮЧЕНИЕ ДИЛЕРСКИХ ДОГОВОРОВ. 								\r2004Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО И ОСНАЩЕНИЕ НОВОГО ПРОИЗВОДСТВЕННОГО КОРПУСА И СКЛАДА МАТЕРИАЛОВ. \nРАСШИРЕНО ПРЕДСТАВИТЕЛЬСТВО КОМПАНИИ НА РОССИЙСКОМ РЫНКЕ И ЗА РУБЕЖОМ. \nОТКРЫТО 									РЕГИОНАЛЬНОЕ ПРЕДСТАВИТЕЛЬСТВО \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ ЕКАТЕРИНБУРГЕ. 								\r2005Г. 								\rКОМПАНИЯ ПРИОБРЕТАЕТ НОВОЕ ПРОИЗВОДСТВЕННОЕ ОБОРУДОВАНИЕ КОНЦЕРНА - УГЛОВУЮ ЛИНИЮ 									РАСКРОЯ МАТЕРИАЛОВ И ЛИНИЮ ЗАГРУЗКИ ВЫГРУЗКИ. \nНАЧИНАЕТСЯ ВЫПУСК ПРОДУКЦИИ В 									НАТУРАЛЬНОМ ШПОНЕ. ФОРМИРУЕТСЯ ОТДЕЛЬНЫЙ СКЛАД МАТЕРИАЛОВ И КОМПЛЕКТУЮЩИХ. \nВ ЭТОМ ЖЕ ГОДУ ОТКРЫВАЕТСЯ ФАБРИКА МЯГКОЙ МЕБЕЛИ \rМЕБЕЛЬПЛЮС\r2006Г. 								\rОТКРЫТЫ РЕГИОНАЛЬНЫЕ ПРЕДСТАВИТЕЛЬСТВА \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ САНКТ-ПЕТЕРБУРГЕ 									И НИЖНЕМ НОВГОРОДЕ. \nРАЗВИВАЕТСЯ СОБСТВЕННАЯ РОЗНИЧНАЯ СЕТЬ ФИРМЕННЫХ МАГАЗИНОВ-САЛОНОВ 									НА ТЕРРИТОРИИ РОССИИ. 								\r2007Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО ВТОРОЙ ФАБРИКИ. ОБЩАЯ ПЛОЩАДЬ ПРОИЗВОДСВЕННО-СКЛАДСКИХ КОРПУСОВ 									КОМПАНИИ СОСТАВЛЯЕТ УЖЕ БОЛЕЕ 30000 М2. \nПРОВЕДЕНА ВТОРАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ 									КОМПАНИИ \r\"ТЕХНОЛОГИЯ УСПЕШНОГО БИЗНЕСА\"\r. 								\r2008Г. 								\rОТКРЫТО НОВОЕ ПРЕДПРИЯТИЕ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ \rКОМФОРТ\r. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОДОЛЖАЕТ ОБНОВЛЕНИЕ ОБОРУДОВАНИЯ. 								\r2008Г. 								\rНОВЕЙШИМ ОБОРУДОВАНИЕМ УКОМПЛЕКТОВАНА ВТОРАЯ ФАБРИКА. ЗАПУЩЕНА ВТОРАЯ ПРОИЗВОДСТВЕННАЯ 									ЛИНИЯ. \nПРОВЕДЕНА ТРЕТЬЯ КОНФЕРЕНЦИЯ \rПАРТНЕРСТВО - БИЗНЕС СЕГОДНЯ\rПРИНЯТО РЕШЕНИЕ О СТРОИТЕЛЬСТВЕ ТРЕТЬЕЙ ФАБРИКИ. ПЛОЩАДЬ ПРОИЗВОДСТВЕННО  СКЛАДСКИХ 									КОРПУСОВ СОСТАВИТ БОЛЕЕ 70000М2. \nПО ВСЕЙ СТРАНЕ И ЗАРУБЕЖОМ ОТКРЫТО 37 МЕБЕЛЬНЫХ 									САЛОНОВ. \nВ КОМПАНИИ РАБОТАЕТ БОЛЕЕ ПОЛУТОРА ТЫСЯЧ СОТРУДНИКОВ.\r\n'),(9,'d6ae18283686e0f65091531174c8b418','ВАКАНСИИ\r\n\r\n'),(10,'b535d9cb75c64e695d6ebad33b22d99c','О КОМПАНИИ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ. 						 \rГЛАВНОЕ ПРАВИЛО - ИНДИВИДУАЛЬНЫЙ ПОДХОД К КАЖДОМУ КЛИЕНТУ\rНА СЕГОДНЯШНИЙ ДЕНЬ НАМИ РАЗРАБОТАНО БОЛЕЕ ПЯТИСОТ МОДЕЛЕЙ ДЛЯ ОФИСА И ДОМА. ВМЕСТЕ С ТЕМ МЫ СТРЕМИМСЯ ОБЕСПЕЧИТЬ НЕПОВТОРИМОСТЬ СВОЕЙ ПРОДУКЦИИ. МЫ ИЗГОТОВИМ МЕБЕЛЬ ДЛЯ КУХНИ, ДЕТСКОЙ, ГОСТИНОЙ, СПАЛЬНОЙ ИЛИ ВАННОЙ КОМНАТЫ, МЕБЕЛЬ ДЛЯ ОФИСА ОСОБОГО ДИЗАЙНА И НЕСТАНДАРТНОГО РАЗМЕРА. \rНАШИ ДИЗАЙНЕРЫ ПРОИЗВЕДУТ ЗАМЕРЫ ПОМЕЩЕНИЯ И ВМЕСТЕ С ВАМИ РАЗРАБОТАЮТ ДИЗАЙН-ПРОЕКТ МЕБЕЛИ ДЛЯ ВАШЕГО ИНТЕРЬЕРА, ПОДОБРАВ С ВЫСОКОЙ ТОЧНОСТЬЮ РАЗМЕРЫ, МОДЕЛИ, ЦВЕТА, ПОМОГУТ ОПТИМАЛЬНО РАСПОЛОЖИТЬ МЕБЕЛЬ. \rВАШ ПРОЕКТ БУДЕТ СОЗДАН С УЧЕТОМ ВСЕХ НЮАНСОВ И ПРОРИСОВКОЙ МЕЛЬЧАЙШИХ ДЕТАЛЕЙ. РЕЗУЛЬТАТЫ СОВМЕСТНОГО ТВОРЧЕСТВА ВЫ СМОЖЕТЕ ПОСМОТРЕТЬ В ОБЪЕМНОМ ПРЕДСТАВЛЕНИИ. ВАМ НАГЛЯДНО ПРОДЕМОНСТРИРУЮТ, КАК БУДУТ ВЫГЛЯДЕТЬ В ЖИЗНИ ВЫБРАННЫЕ ЭЛЕМЕНТЫ ИНТЕРЬЕРА ПРИ РАЗНОМ ОСВЕЩЕНИИ, В КОНКРЕТНОМ ПОМЕЩЕНИИ, СДЕЛАННЫЕ ИЗ ОПРЕДЕЛЕННЫХ МАТЕРИАЛОВ. В ВАШЕ РАСПОРЯЖЕНИЕ БУДЕТ ПРЕДОСТАВЛЕНО МНОГО РАЗЛИЧНЫХ ВАРИАНТОВ, ИЗ КОТОРЫХ ВЫ СМОЖЕТЕ ВЫБРАТЬ НАИБОЛЕЕ ПОДХОДЯЩИЙ ИМЕННО ВАМ. 						 					\rЗАКАЗ БУДЕТ ВЫПОЛНЕН И ДОСТАВЛЕН ТОЧНО В СРОК. ВСЕ РАБОТЫ ПО СБОРКЕ И УСТАНОВКЕ МЕБЕЛИ ОСУЩЕСТВЛЯЮТ СОТРУДНИКИ НАШЕЙ КОМПАНИИ. СТРОГИЙ КОНТРОЛЬ КАЧЕСТВА ОСУЩЕСТВЛЯЕТСЯ НА ВСЕХ ЭТАПАХ РАБОТ: ОТ МОМЕНТА ОФОРМЛЕНИЯ ЗАКАЗА ДО МОМЕНТА ПРИЕМА ВЫПОЛНЕННЫХ РАБОТ. \rПЕРЕДОВЫЕ ТЕХНОЛОГИИ И БЕСЦЕННЫЙ ОПЫТ\rИСПОЛЬЗОВАНИЕ ПЕРЕДОВЫХ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ, МНОГОЛЕТНИЙ ОПЫТ НАШИХ СПЕЦИАЛИСТОВ ПОЗВОЛЯЮТ ПРОИЗВЕСТИ ГРАМОТНЫЕ РАСЧЕТЫ И СНИЗИТЬ РАСХОД МАТЕРИАЛОВ И СЕБЕСТОИМОСТЬ ПРОДУКЦИИ, ИЗБЕЖАТЬ ОШИБОК ПРИ ПРОЕКТИРОВАНИИ И ОПТИМИЗИРОВАТЬ ДИЗАЙН КОМПЛЕКСНЫХ ИНТЕРЬЕРОВ. ГАРАНТИЯ НА НАШУ ПРОДУКЦИЮ СОСТАВЛЯЕТ 18 МЕСЯЦЕВ, А НА ОТДЕЛЬНУЮ ПРОДУКЦИЮ 36 МЕСЯЦЕВ. \rМЫ ГОРДИМСЯ НАШИМИ СОТРУДНИКАМИ ПРОШЕДШИМИ ПРОФЕССИОНАЛЬНОЕ ОБУЧЕНИЕ В ЛУЧШИХ УЧЕБНЫХ ЗАВЕДЕНИЯХ РОССИИ И ЗАРУБЕЖЬЯ. У НАС ТРУДЯТСЯ ВЫСОКОКЛАССНЫЕ СПЕЦИАЛИСТЫ РАЗНЫХ ВОЗРАСТОВ. МЫ ЦЕНИМ ЭНТУЗИАЗМ МОЛОДЕЖИ И БЕСЦЕННЫЙ ОПЫТ СТАРШЕГО ПОКОЛЕНИЯ. ВСЕ МЫ РАЗНЫЕ, НО НАС ОБЪЕДИНЯЕТ ПРЕДАННОСТЬ СВОЕМУ ДЕЛУ И ВЕРА В ИДЕИ НАШЕЙ КОМПАНИИ. \rВЫСОЧАЙШИЕ СТАНДАРТЫ КАЧЕСТВА - ЗАЛОГ НАШЕГО УСПЕХА\rМЕБЕЛЬНАЯ КОМПАНИЯ\rОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД  С ДРУГОЙ. \rЕЖЕГОДНО НАША ПРОДУКЦИЯ ПРОХОДИТ СЕРТИФИКАЦИОННЫЕ ИСПЫТАНИЯ В СПЕЦИАЛИЗИРОВАННЫХ ЛАБОРАТОРИЯХ РОССИИ И ИМЕЕТ СЕРТИФИКАТЫ СООТВЕТСТВИЯ ПРОДУКЦИИ НОРМАМ БЕЗОПАСНОСТИ И КАЧЕСТВА. КРОМЕ ТОГО, \rМЕБЕЛЬНАЯ КОМПАНИЯ\rОДНОЙ ИЗ ПЕРВЫХ СРЕДИ МЕБЕЛЬНЫХ ПРОИЗВОДИТЕЛЕЙ РОССИИ В 2003 ГОДУ ПРОШЛА АУДИТ НА СООТВЕТСТВИЕ ТРЕБОВАНИЯМ СИСТЕМЫ МЕНЕДЖМЕНТА КАЧЕСТВА ИСО 9000 И ПОЛУЧИЛА СЕРТИФИКАТ СООТВЕТСТВИЯ СИСТЕМЫ КАЧЕСТВА НА ПРЕДПРИЯТИИ НОРМАМ МЕЖДУНАРОДНОГО СТАНДАРТА.\r\n'),(11,'c501a4fb29fd5bc92bc4babebf160ed9','РУКОВОДСТВО\r\nУСПЕШНОЕ РАЗВИТИЕ БИЗНЕСА  ВО МНОГОМ РЕЗУЛЬТАТ КВАЛИФИЦИРОВАННОЙ РАБОТЫ РУКОВОДСТВА. 							\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНА МЕБЕЛЬНОМ РЫНКЕ УЖЕ 18 ЛЕТ. ЗА ЭТО ВРЕМЯ КОМПАНИЯ 							НЕ ТОЛЬКО СОХРАНИЛА, НО И УПРОЧИЛА ЛИДИРУЮЩИЕ ПОЗИЦИИ СРЕДИ ВЕДУЩИХ ИГРОКОВ МЕБЕЛЬНОГО 							РЫНКА. 						\rМЕБЕЛЬНАЯ КОМПАНИЯ\rИЗ ГОДА В ГОД РАСШИРЯЕТ АССОРТИМЕНТ ВЫПУСКАЕМОЙ ПРОДУКЦИИ, 							НАРАЩИВАЕТ ТЕМПЫ И ОБЪЕМЫ ПРОИЗВОДСТВА, УВЕЛИЧИВАЕТ ПРОИЗВОДСТВЕННЫЕ И СКЛАДСКИЕ 							ПЛОЩАДИ, РАЗВИВАЕТ ОТНОШЕНИЯ С ПАРТНЕРАМИ СО ВСЕХ РЕГИОНОВ СТРАНЫ И НАЛАЖИВАЕТ СВЯЗИ 							С ЗАРУБЕЖНЫМИ ПАРТНЕРАМИ. В БОЛЬШОЙ СТЕПЕНИ ЭТО ЗАСЛУГА ХОРОШО ПОДГОТОВЛЕННОГО РУКОВОДЯЩЕГО 							СОСТАВА И ЕГО ГРАМОТНОЙ ПОЛИТИКИ. 						\rСОБСТВЕННИК КОМПАНИИ МЕБЕЛЬНАЯ КОМПАНИЯ\rКОЛЕСНИКОВ ВИКТОР ФЕДОРОВИЧ 								\rРОДИЛСЯ 3 СЕНТЯБРЯ 1964 ГОДА.\nОБРАЗОВАНИЕ: ЗАКОНЧИЛ АВИАЦИОННЫЙ ФАКУЛЬТЕТ ВОРОНЕЖСКОГО 									ГОСУДАРСТВЕННОГО ПОЛИТЕХНИЧЕСКОГО ИНСТИТУТА. В 1994 ГОДУ ПРОШЕЛ ОБУЧЕНИЕ ПО ПРОГРАММЕ 									ПОДГОТОВКА МАЛОГО И СРЕДНЕГО БИЗНЕСА В США.\nВ НАСТОЯЩЕЕ ВРЕМЯ ВИКТОР ФЕДОРОВИЧ 									ВОЗГЛАВЛЯЕТ УПРАВЛЯЮЩУЮ КОМПАНИЮ, КОТОРАЯ КООРДИНИРУЕТ ДЕЯТЕЛЬНОСТЬ ПРЕДПРИЯТИЙ, 									ВХОДЯЩИХ В ГРУППУ КОМПАНИЙ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. 								\rГЕНЕРАЛЬНЫЙ ДИРЕКТОР МЕБЕЛЬНОЙ КОМПАНИИ\rРАТЧЕНКО АЛЕКСАНДР ПЕТРОВИЧ 								\rРОДИЛСЯ 5 ИЮНЯ 1962 ГОДА.\nОБРАЗОВАНИЕ: ВОРОНЕЖСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ 									ПО СПЕЦИАЛЬНОСТИ ИНЖЕНЕР-ТЕХНОЛОГ; ПРОГРАММА ЭФФЕКТИВНОЕ РАЗВИТИЕ ПРОИЗВОДСТВА 									(США).\nВ \rМЕБЕЛЬНОЙ КОМПАНИИ\rСЕРГЕЙ ФОМИЧ С 1994 ГОДА. ЗА ЭТО ВРЕМЯ ПРОШЕЛ 									ПУТЬ ОТ НАЧАЛЬНИКА ЦЕХА ДО ГЕНЕРАЛЬНОГО ДИРЕКТОРА ПРЕДПРИЯТИЯ. 								\rЗАМЕСТИТЕЛЬ ГЕНЕРАЛЬНОГО ДИРЕКТОРА УПРАВЛЯЮЩЕЙ КОМПАНИИ\rРОГОВОЙ АНДРЕЙ ВЛАДИМИРОВИЧ 								\rОБРАЗОВАНИЕ: ФАКУЛЬТЕТ РАДИОТЕХНИКИ ВОРОНЕЖСКОГО ГОСУДАРСТВЕННОГО ТЕХНИЧЕСКОГО УНИВЕРСИТЕТА.\nВ КОМПАНИИ С 1 ИЮНЯ 2000 ГОДА.\r\n'),(12,'7c285f6a61d238a340b43f0ef846a536','ВХОД НА САЙТ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),(13,'d63c4b77cf485102f232c0d0d27f8bc3','КОНТАКТЫ\r\nОБРАТИТЕСЬ К НАШИМ СПЕЦИАЛИСТАМ И ПОЛУЧИТЕ ПРОФЕССИОНАЛЬНУЮ КОНСУЛЬТАЦИЮ ПО ВОПРОСАМ СОЗДАНИЯ И ПОКУПКИ МЕБЕЛИ (ОТ ДИЗАЙНА, РАЗРАБОТКИ ТЕХНИЧЕСКОГО ЗАДАНИЯ ДО ДОСТАВКИ МЕБЕЛИ К ВАМ ДОМОЙ).\rВЫ МОЖЕТЕ ОБРАТИТЬСЯ К НАМ ПО ТЕЛЕФОНУ, ПО ЭЛЕКТРОННОЙ ПОЧТЕ ИЛИ ДОГОВОРИТЬСЯ О ВСТРЕЧЕ В НАШЕМ ОФИСЕ. БУДЕМ РАДЫ ПОМОЧЬ ВАМ И ОТВЕТИТЬ НА ВСЕ ВАШИ ВОПРОСЫ. \rТЕЛЕФОНЫ\rТЕЛЕФОН/ФАКС:\n(495) 212-85-06\rТЕЛЕФОНЫ:\n(495) 212-85-07\r(495) 212-85-08\rEMAIL\rINFO@EXAMPLE.RU\r ОБЩИЕ ВОПРОСЫ\rSALES@EXAMPLE.RU\r ПРИОБРЕТЕНИЕ ПРОДУКЦИИ\rMARKETING@EXAMPLE.RU\r МАРКЕТИНГ/МЕРОПРИЯТИЯ/PR\rОФИС В МОСКВЕ\r\n'),(14,'92742420ff489208277435770b2dba28','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\n\rС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ \rБЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ \rИ\rУКРАИНЫ\r. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ:\rГОТОВОЙ МЕБЕЛИ\rИ \rМАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА\r.\rВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ:\rКОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ;\rПРЕДМЕТЫ ИНТЕРЬЕРА;\rКУХОННАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ.\rВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ.\rПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ ВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"\rНАРОДНОЕ ПРИЗНАНИЕ\r\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ.\rМЕБЕЛЬНЫЙ ФОРУМ\rПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ ВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \rМЕБЕЛЬНОГО ФОРУМА\r.\rПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ ДО 12 АПРЕЛЯ 2010 ГОДА.\r\n'),(15,'d28b14fc723b19c85e2a5f17daa89898','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. \r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.\r\n'),(16,'6e9c53b4377c8bda27a391c004332b06','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ СОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. \r\n\rАВТОРЫ ИЗОБРЕТЕНИЯ\r: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ И МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА \rПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566\rОПИСАНИЕ ИЗОБРЕТЕНИЯ\rИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ.\rДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \rИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ ПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ.\rЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.:\rКАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА\r64,5-79,2\r10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ\r4,4-20,5\rОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r0,6-2,0\rСМОЛЫ 2542\r13,0-15,8\r\n'),(17,'2efa39d6fa529b12dd51fd7139adec0e','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ\r\n'),(18,'2c9244e9e768ea36f0bb298526f21402','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ\r\n'),(19,'acd32268f26f878af2a96d753ccbc9c8','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ\r\n'),(20,'e986498f11e924c98c57e35939cf927f','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ\r\n'),(21,'f86144adfc89dc75855e25d200a5e333','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\n'),(22,'3a7ce138fe31e4cc12b2809a04e0db25','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\r\n \rБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\n'),(23,'df6d1da3eabe6c40954a796579d554cb','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\n'),(24,'bc3cb6280475204c00312b331b7c2fa9','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\r\n \rДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\n'),(25,'5c32b6f62c6126843cbd44b1a593d952','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\r\n \rДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\n'),(26,'7955bfe502463895d32a336f267421a8','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\n'),(27,'00e3040c167611cbe598003e6d5427ae','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\r\n \rКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\n'),(28,'f5e7877d0bc889cce24427c1d1e8d96f','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\n'),(29,'13ffbc270cbe931d486a5511fd6da896','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\r\n \rКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\n'),(30,'81fb3b3fcb9358b5de6446706e8e132c','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\r\n \rТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\n'),(31,'fee2bd8c63d03b8452efa69f751e6fb2','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\r\n \rДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\n'),(32,'e980bf84fb99998e698762a99222ea9a','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\r\n \rОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\n'),(33,'286e9f6fd660a7a29d1c58fd03b7cbfa','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. \rПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ \rОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ \rПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\r\n \rУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\n'),(34,'37c339b919a986e466960961039e1d6a','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\r\n \rЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\n'),(35,'cae6ed5ad18b5af81c184a7d384f6dd3','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\r\n \rЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\n'),(36,'07e40b7ee85f6e0586e6b7dca7071207','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \rДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. \rПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.\r\n'),(37,'eafc4c3a71f8b67e539a59cd7f90eeda','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\r\n \rОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\n'),(38,'d9c1fcdf56ed763d069672a51edaf886','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \rСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \rТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\r\n \r <P>СТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.</P>\r\n'),(39,'6b34dc50a2008617635888607e22f36c','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\r\n \rУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\n'),(40,'dde02b9a7017c12f3635df242d7fec2d','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\r\n \rСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\n'),(41,'e8afd744f2236f58877667738872c313','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\r\n \rСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\n'),(42,'fc9d38eebe941fe855bc8731bfa026c1','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\r\n \rСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\n'),(44,'53dd08f5b5b2624b7521c7f382c7f9f6','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\r\n \rПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\n'),(45,'da430218f51fdea19711a3806fb7a3c4','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ.\r\n \rНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ,\rГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ.\rМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ ИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ.\rПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И\rПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ.\rПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ СРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО,\rГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ\rНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ\rСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ\rВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.\r\n'),(46,'6ae9d8e3d86f6edc36947e4e39db948b','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ МЕБЕЛИ.\r\n \rДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ ПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ.\rРАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ РАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ.\rРАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ МОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ.\rПОДБОР И РАССТАНОВКА МЕБЕЛИ.\rДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ ИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.\r\n'),(47,'73b0737b640ddf58dcbdd46d5175e414','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\nТРЕБОВАНИЯ\rУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ ОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ\rОБЯЗАННОСТИ\rКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ МЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ.\rУСЛОВИЯ\rЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ\r\n'),(48,'fa5c9c5ac99f37b001a1a0421af4b144','ДИРЕКТОР МАГАЗИНА\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ РАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ.\rОБЯЗАННОСТИ\rРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ ЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ.\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ ГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ\r\n'),(49,'3187d1b1ae8eb650d8851807a7ab248b','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\nТРЕБОВАНИЯ\rЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ РАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ.\rОБЯЗАННОСТИ\rРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ МПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ\rУСЛОВИЯ\rГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ Г. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.\r\n'),(50,'e2b74aa2010779d239389bd7ba3b2961','HTTP://TEST.RU/TEST/\r\n\r\n'),(54,'3485e5d80bb6fbae95a83915c4aca23f','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\r\n \rСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\n'),(55,'2988bab0912d60e150015fcb7be704d4','ЭКЗАМЕН2\r\nTEXT HERE....\r\n'),(56,'2988bab0912d60e150015fcb7be704d4','ЭКЗАМЕН2\r\nTEXT HERE....\r\n'),(57,'417ffb05d7d46b59aad293882b7aefdd','MANAGER\r\n\r\n'),(58,'091db106978040427c3846c84be6c1d4','/PRODUCTS/2/20/\r\n\r\n'),(59,'034cd34030a4f18881460fa80c040ebe','/PRODUCTS/\r\n\r\n'),(60,'f2eb40bfe78ee7caffefc9eadfabda5d','ЛЕГО\r\n\r\n'),(61,'107ff584d4df8508150a1bb5fb4719b6','СУПЕР-СТАР\r\n\r\n'),(62,'f10b0a29f05fc66ed119a00ad27e5aef','ПУШИНКА\r\n\r\n'),(63,'badaa6476f7022609dd82e46abb3f446','МЕЧТА\r\n\r\n'),(64,'ed39fe152859ec247d853f93cfb90f94','ПРОСТОЙ КОМПОНЕНТ 2\r\n\r\n'),(65,'8ffb74ea4129c8f0808473dc80b9628b','TEST1\r\n\r\n'),(66,'e691d25e2d77d059df7a01af545ba818','TEST2\r\n\r\n'),(67,'7cd915769775a7e303ad744304d7cc2b','TEST3\r\n\r\n'),(68,'ae6a7829b96f1a1c44f57d79429b8109','ADMIN\r\n\r\n'),(69,'7f29e9da84218c25f582db9072718162','ТЕСТОВАЯ НОВОСТЬ №1\r\n\r\n'),(70,'10c10c3ac820d833d8e35bca19b7528e','ТЕСТОВАЯ НОВОСТЬ №2\r\n\r\n'),(71,'227ae7cef462adc2630e0c9676375d0a','ТЕСТОВАЯ НОВОСТЬ №3\r\n\r\n'),(72,'8fd32dde1e16ba50408f8e70e1cf6162','ПРОСТОЙ КОМПОНЕНТ 3\r\n\r\n');
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_title`
--

DROP TABLE IF EXISTS `b_search_content_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_title`
--

LOCK TABLES `b_search_content_title` WRITE;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
INSERT INTO `b_search_content_title` VALUES (1,'s1',0,'УСЛУГИ'),(2,'s1',0,'ПРОДУКЦИЯ'),(3,'s1',0,'НОВОСТИ'),(4,'s1',0,'КАРТА'),(4,'s1',6,'САЙТА'),(5,'s1',0,'ПОИСК'),(6,'s1',10,'КОМПАНИЯ'),(6,'s1',0,'МЕБЕЛЬНАЯ'),(7,'s1',1,'И'),(7,'s1',0,'МИССИЯ'),(7,'s1',9,'СТРАТЕГИЯ'),(8,'s1',0,'ИСТОРИЯ'),(9,'s1',0,'ВАКАНСИИ'),(10,'s1',2,'КОМПАНИИ'),(10,'s1',0,'О'),(11,'s1',0,'РУКОВОДСТВО'),(12,'s1',0,'ВХОД'),(12,'s1',5,'НА'),(12,'s1',8,'САЙТ'),(13,'s1',0,'КОНТАКТЫ'),(14,'s1',16,'БЕЛАРУСИ'),(14,'s1',0,'МЕБЕЛЬНЫЙ'),(14,'s1',10,'ФОРУМ'),(15,'s1',39,'DEL'),(15,'s1',43,'MOBILE'),(15,'s1',33,'SALON'),(15,'s1',24,'ВЫСТАВКА'),(15,'s1',14,'МЕБЕЛЬНАЯ'),(15,'s1',0,'МЕЖДУНАРОДНАЯ'),(16,'s1',17,'ВОДОСТОЙКОЕ'),(16,'s1',0,'ПОЛУЧЕНО'),(16,'s1',9,'ПРОЧНОЕ'),(16,'s1',29,'СОЕДИНЕНИЕ'),(17,'s1',7,'МЕБЕЛЬ'),(17,'s1',0,'МЯГКАЯ'),(18,'s1',8,'МЕБЕЛЬ'),(18,'s1',0,'ОФИСНАЯ'),(19,'s1',7,'ДЛЯ'),(19,'s1',11,'КУХНИ'),(19,'s1',0,'МЕБЕЛЬ'),(20,'s1',0,'ДЕТСКАЯ'),(20,'s1',8,'МЕБЕЛЬ'),(21,'s1',0,'ГЕРЦОГ'),(22,'s1',0,'МОНАЛИЗА'),(23,'s1',0,'МИНИСТР'),(24,'s1',0,'ХРОМ'),(25,'s1',0,'ЛИВЕРПУЛЬ'),(26,'s1',0,'ИЗАБЕЛЛА'),(27,'s1',0,'АЛАДДИН'),(28,'s1',0,'ДЖОКОНДА'),(29,'s1',0,'ФЛОРА'),(30,'s1',0,'ПРЕСТИЖ'),(31,'s1',0,'ЛАУРА'),(32,'s1',0,'МОДЕРН'),(33,'s1',0,'ОПТИМА'),(34,'s1',0,'СОБРАНИЕ'),(35,'s1',0,'ЛИДЕР'),(36,'s1',0,'ПРЕЗИДЕНТ'),(37,'s1',0,'ПЛУТОН'),(38,'s1',0,'ПАРМА'),(39,'s1',0,'ПАЛЕРМО'),(40,'s1',0,'ВАЛЕНСИЯ'),(41,'s1',0,'ФАЗЕНДА'),(42,'s1',0,'ЭРА'),(44,'s1',0,'ИЗОПЛАСТ'),(44,'s1',9,'ХРОМ'),(45,'s1',10,'ЗАКАЗ'),(45,'s1',0,'МЕБЕЛЬ'),(45,'s1',7,'НА'),(46,'s1',7,'ДИЗАЙНЕРА'),(46,'s1',0,'УСЛУГИ'),(47,'s1',19,'КУХНИ'),(47,'s1',0,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(48,'s1',0,'ДИРЕКТОР'),(48,'s1',9,'МАГАЗИНА'),(49,'s1',0,'БУХГАЛТЕР'),(49,'s1',23,'ГОТОВОЙ'),(49,'s1',10,'ОТДЕЛА'),(49,'s1',31,'ПРОДУКЦИИ'),(49,'s1',17,'УЧЕТА'),(50,'s1',0,'HTTP'),(50,'s1',12,'RU'),(50,'s1',7,'TEST'),(54,'s1',0,'СИТИ'),(55,'s1',0,'ЭКЗАМЕН2'),(56,'s1',0,'ЭКЗАМЕН2'),(57,'s1',0,'MANAGER'),(58,'s1',10,'2'),(58,'s1',12,'20'),(58,'s1',1,'PRODUCTS'),(59,'s1',1,'PRODUCTS'),(60,'s1',0,'ЛЕГО'),(61,'s1',0,'СУПЕР-СТАР'),(62,'s1',0,'ПУШИНКА'),(63,'s1',0,'МЕЧТА'),(64,'s1',18,'2'),(64,'s1',8,'КОМПОНЕНТ'),(64,'s1',0,'ПРОСТОЙ'),(65,'s1',0,'TEST1'),(66,'s1',0,'TEST2'),(67,'s1',0,'TEST3'),(68,'s1',0,'ADMIN'),(69,'s1',18,'1'),(69,'s1',9,'НОВОСТЬ'),(69,'s1',0,'ТЕСТОВАЯ'),(70,'s1',18,'2'),(70,'s1',9,'НОВОСТЬ'),(70,'s1',0,'ТЕСТОВАЯ'),(71,'s1',18,'3'),(71,'s1',9,'НОВОСТЬ'),(71,'s1',0,'ТЕСТОВАЯ'),(72,'s1',18,'3'),(72,'s1',8,'КОМПОНЕНТ'),(72,'s1',0,'ПРОСТОЙ');
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_custom_rank`
--

DROP TABLE IF EXISTS `b_search_custom_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_custom_rank`
--

LOCK TABLES `b_search_custom_rank` WRITE;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_phrase`
--

DROP TABLE IF EXISTS `b_search_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_phrase`
--

LOCK TABLES `b_search_phrase` WRITE;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_stem`
--

DROP TABLE IF EXISTS `b_search_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_stem`
--

LOCK TABLES `b_search_stem` WRITE;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
INSERT INTO `b_search_stem` VALUES (783,'-НЫ'),(796,'0-15'),(716,'000'),(782,'10'),(723,'10-Й'),(697,'12'),(795,'13'),(1203,'13500'),(718,'149'),(626,'160'),(1232,'168'),(471,'18'),(563,'1962'),(534,'1964'),(13,'1992'),(202,'1992Г'),(227,'1993Г'),(543,'1994'),(247,'1998Г'),(261,'1999Г'),(614,'20'),(576,'2000'),(1209,'20000'),(278,'2000Г'),(284,'2002Г'),(502,'2003'),(296,'2003Г'),(311,'2004Г'),(320,'2005Г'),(337,'2006Г'),(346,'2007Г'),(354,'2008Г'),(617,'2010'),(600,'212-85-06'),(601,'212-85-07'),(602,'212-85-08'),(1240,'22-45'),(615,'23'),(781,'2542'),(1235,'28000'),(1147,'30'),(715,'300'),(352,'30000'),(1237,'35000'),(474,'36'),(367,'37'),(1165,'3D-МОДЕЛ'),(793,'4-20'),(1264,'40'),(213,'400'),(1093,'45'),(599,'495'),(792,'5-79'),(281,'500'),(260,'5000'),(794,'6-2'),(791,'64'),(231,'700'),(366,'70000М2'),(1263,'800'),(719,'871'),(506,'9000'),(1278,'ADMIN'),(699,'DEL'),(603,'EMAIL'),(605,'EXAMPLE'),(1268,'HERE'),(604,'INFO'),(1269,'MANAGER'),(608,'MARKETING'),(700,'MOBILE'),(765,'N-ВИНИЛКАПРОЛАКТАМ'),(611,'PR'),(1270,'PRODUCTS'),(755,'RU2277566'),(606,'SALES'),(698,'SALON'),(1265,'TEST'),(1275,'TEST1'),(1276,'TEST2'),(1277,'TEST3'),(1267,'TEXT'),(705,'VIP-КАБИНЕТ'),(704,'VIP-КАБИНЕТОВ'),(995,'АБСОЛЮТН'),(537,'АВИАЦИОН'),(627,'АВСТР'),(744,'АВТОР'),(579,'АВТОРИЗОВА'),(1183,'АВТОРСК'),(647,'АДМИНИСТРАТИВН'),(1259,'АДРЕС'),(769,'АКРИЛОВ'),(764,'АКРИЛОНИТР'),(656,'АКСЕССУАР'),(655,'АКСЕССУАРОВ'),(1225,'АКТИВН'),(863,'АЛАДДИН'),(560,'АЛЕКСАНДР'),(768,'АММОН'),(751,'АН'),(752,'АНАТОЛЬЕВН'),(858,'АНГЛИЙСК'),(571,'АНДР'),(616,'АПРЕЛ'),(210,'АРЕНДУЕМ'),(518,'АССОРТИМЕНТ'),(860,'АТМОСФЕР'),(503,'АУД'),(1105,'АУДИТОРН'),(235,'БАЗ'),(1243,'БАЗОВ'),(1098,'БАР'),(1097,'БАРОВ'),(121,'БЕЗОПАСН'),(613,'БЕЛАРУС'),(453,'БЕСЦЕН'),(1113,'БИБЛИОТЕК'),(177,'БИЗНЕС'),(924,'БИЗНЕСМ'),(923,'БИЗНЕСМЕН'),(922,'БИЗНЕСМЕНОВ'),(141,'БЛАГОСОСТОЯН'),(276,'БЛИЖН'),(1003,'БЛОК'),(813,'БОГАТ'),(816,'БОГАТСТВ'),(241,'БОЛ'),(17,'БОЛЬШ'),(1261,'БОТИНСК'),(594,'БУД'),(405,'БУДЕТ'),(421,'БУДУТ'),(1051,'БУК'),(1238,'БУХГАЛТЕР'),(1242,'БУХГАЛТЕРСК'),(225,'БЫСТР'),(619,'ВАЖН'),(195,'ВАЖНОСТ'),(370,'ВАКАНС'),(1066,'ВАЛЕНС'),(388,'ВАН'),(436,'ВАРИАНТ'),(435,'ВАРИАНТОВ'),(1122,'ВАС'),(228,'ВВЕД'),(1017,'ВЕД'),(1250,'ВЕДЕН'),(288,'ВЕДУЩ'),(992,'ВЕЛИКОЛЕПН'),(488,'ВЕР'),(580,'ВЕРНУТ'),(172,'ВЗАИМОВЫГОДН'),(98,'ВЗГЛЯД'),(97,'ВЗГЛЯДОВ'),(180,'ВЗЯТ'),(842,'ВИД'),(530,'ВИКТОР'),(221,'ВКЛАДЫВА'),(706,'ВКЛЮЧ'),(773,'ВКЛЮЧА'),(572,'ВЛАДИМИРОВИЧ'),(379,'ВМЕСТ'),(1008,'ВМЕСТИТЕЛЬН'),(154,'ВНЕДРЕН'),(1043,'ВНЕСУТ'),(841,'ВНЕШН'),(1069,'ВНИМАН'),(1145,'ВНОС'),(726,'ВОДОСТОЙК'),(551,'ВОЗГЛАВЛЯ'),(70,'ВОЗМОЖН'),(963,'ВОЗНИКА'),(481,'ВОЗРАСТ'),(480,'ВОЗРАСТОВ'),(971,'ВОЙДЕТ'),(909,'ВОПЛОЩ'),(199,'ВОПРОС'),(977,'ВОПРОСОВ'),(248,'ВОРОНЕЖ'),(539,'ВОРОНЕЖСК'),(970,'ВОТ-ВОТ'),(285,'ВОШЛ'),(688,'ВПЕРВ'),(926,'ВПЕРЕД'),(830,'ВПЕЧАТЛЯЮЩ'),(1103,'ВПИСЫВА'),(15,'ВРЕМ'),(929,'ВРЕМЕН'),(1028,'ВРУЧН'),(710,'ВСЕГ'),(91,'ВСЕГД'),(138,'ВСЕМ'),(150,'ВСЕХ'),(593,'ВСТРЕЧ'),(1109,'ВСТРОЕН'),(347,'ВТОР'),(577,'ВХОД'),(555,'ВХОДЯ'),(931,'ВЫБОР'),(424,'ВЫБРА'),(831,'ВЫГЛЯД'),(422,'ВЫГЛЯДЕТ'),(327,'ВЫГРУЗК'),(441,'ВЫПОЛН'),(179,'ВЫПОЛНЕН'),(938,'ВЫПОЛНЯ'),(328,'ВЫПУСК'),(99,'ВЫПУСКА'),(818,'ВЫРАЖ'),(63,'ВЫРАЖЕН'),(39,'ВЫСОК'),(30,'ВЫСОКОКЛАССН'),(972,'ВЫСОКОПОСТАВЛЕН'),(155,'ВЫСОКОПРОИЗВОДИТЕЛЬН'),(490,'ВЫСОЧАЙШ'),(664,'ВЫСТАВК'),(264,'ВЫСТАВОК'),(1216,'ВЫСШ'),(1027,'ВЫТОЧ'),(168,'ВЫХОД'),(470,'ГАРАНТ'),(1111,'ГАРДЕРОБН'),(557,'ГЕНЕРАЛЬН'),(806,'ГЕРЦОГ'),(83,'ГИБК'),(140,'ГИГИЕНИЧЕСК'),(1011,'ГЛАВ'),(371,'ГЛАВН'),(976,'ГЛОБАЛЬН'),(14,'ГОД'),(475,'ГОРД'),(740,'ГОРЯЧ'),(877,'ГОСТЕВ'),(386,'ГОСТИН'),(540,'ГОСУДАРСТВЕН'),(642,'ГОТОВ'),(459,'ГРАМОТН'),(721,'ГРАНДИОЗН'),(1230,'ГРАФИК'),(556,'ГРУПП'),(287,'ДАН'),(1086,'ДАЧ'),(217,'ДВАДЦА'),(990,'ДВП'),(638,'ДВУХ'),(892,'ДВУХМЕСТН'),(814,'ДЕКОР'),(1179,'ДЕКОРИРОВАН'),(183,'ДЕЛ'),(1071,'ДЕЛА'),(662,'ДЕЛОВ'),(649,'ДЕМОНСТРИРОВА'),(373,'ДЕН'),(885,'ДЕР'),(884,'ДЕРЕВ'),(215,'ДЕРЕВООБРАБАТЫВА'),(856,'ДЕРЕВЯ'),(286,'ДЕСЯТК'),(644,'ДЕТ'),(412,'ДЕТАЛ'),(385,'ДЕТСК'),(986,'ДЕШЕВ'),(554,'ДЕЯТЕЛЬН'),(879,'ДЖОКОНД'),(1154,'ДИАГНОСТИК'),(797,'ДИВА'),(391,'ДИЗАЙН'),(398,'ДИЗАЙН-ПРОЕКТ'),(394,'ДИЗАЙНЕР'),(907,'ДИЗАЙНЕРСК'),(308,'ДИЛЕРСК'),(55,'ДИНАМИЧН'),(262,'ДИПЛОМАНТ'),(558,'ДИРЕКТОР'),(1257,'ДНЕ'),(188,'ДНЯ'),(101,'ДОБ'),(1062,'ДОБАВ'),(171,'ДОВЕРИТЕЛЬН'),(310,'ДОГОВОР'),(309,'ДОГОВОРОВ'),(1248,'ДОКУМЕНТ'),(34,'ДОЛ'),(1104,'ДОЛГОВЕЧН'),(76,'ДОЛГОСРОЧН'),(945,'ДОЛЖНОСТН'),(378,'ДОМ'),(1061,'ДОМАШН'),(635,'ДОМОТЕХ'),(776,'ДОПОЛНИТЕЛЬН'),(588,'ДОСТАВК'),(442,'ДОСТАВЛ'),(772,'ДОСТИГА'),(843,'ДОСТИГНУТ'),(66,'ДОСТИЖЕН'),(1010,'ДОСТОИНСТВ'),(1208,'ДОХОД'),(1048,'ДРЕВЕСН'),(52,'ДРУГ'),(989,'ДСП'),(283,'ЕВРОПЕЙСК'),(265,'ЕВРОЭКСПОМЕБЕЛЬ-99'),(747,'ЕГОР'),(95,'ЕДИН'),(493,'ЕЖЕГОДН'),(876,'ЕЖЕДНЕВН'),(319,'ЕКАТЕРИНБУРГ'),(997,'ЕМ'),(182,'ЖДЕТ'),(821,'ЖЕЛАН'),(1083,'ЖЕЛЕЗ'),(1239,'ЖЕН'),(852,'ЖЕСТК'),(423,'ЖИЗН'),(72,'ЖИЗНЕН'),(1252,'ЖУРНАЛОВ-ОРДЕР'),(1251,'ЖУРНАЛОВ-ОРДЕРОВ'),(133,'ЗАБОТ'),(478,'ЗАВЕДЕН'),(312,'ЗАВЕРШ'),(253,'ЗАВОЕВЫВА'),(326,'ЗАГРУЗК'),(587,'ЗАДАН'),(86,'ЗАДАЧ'),(440,'ЗАКАЗ'),(1149,'ЗАКАЗА'),(1201,'ЗАКАЗОВ'),(89,'ЗАКАЗЧИК'),(269,'ЗАКЛЮЧ'),(282,'ЗАКЛЮЧА'),(307,'ЗАКЛЮЧЕН'),(1223,'ЗАКОНОДАТЕЛЬСТВ'),(536,'ЗАКОНЧ'),(186,'ЗАЛОГ'),(396,'ЗАМЕР'),(569,'ЗАМЕСТИТЕЛ'),(1108,'ЗАНИМА'),(1181,'ЗАПРОС'),(360,'ЗАПУЩ'),(219,'ЗАРАБОТА'),(578,'ЗАРЕГИСТРИРОВА'),(1202,'ЗАРПЛАТ'),(277,'ЗАРУБЕЖ'),(522,'ЗАРУБЕЖН'),(524,'ЗАСЛУГ'),(160,'ЗАТРАТ'),(961,'ЗАХОД'),(122,'ЗАЩИТ'),(200,'ЗАЩИЩЕН'),(708,'ЗАЯВК'),(696,'ЗАЯВОК'),(648,'ЗДАН'),(1038,'ЗДОРОВ'),(1080,'ЗИМ'),(1218,'ЗНАН'),(936,'ЗНАЧ'),(245,'ЗНАЧИТЕЛЬН'),(820,'ЗОЛОТ'),(943,'ЗОН'),(516,'ИГРОК'),(515,'ИГРОКОВ'),(489,'ИД'),(1118,'ИДЕАЛЬН'),(1163,'ИДЕИ-ОБРАЗ'),(861,'ИЗАБЕЛЛ'),(464,'ИЗБЕЖА'),(383,'ИЗГОТОВ'),(204,'ИЗГОТОВЛЕН'),(50,'ИЗДЕЛ'),(1166,'ИЗОБРАЖЕН'),(729,'ИЗОБРЕТЕН'),(1100,'ИЗОПЛАСТ'),(817,'ИЗЫСК'),(979,'ИЗЫСКА'),(807,'ИЗЯЩН'),(59,'ИМЕЕТ'),(439,'ИМЕН'),(45,'ИНДИВИДУАЛЬН'),(565,'ИНЖЕНЕР-ТЕХНОЛОГ'),(1224,'ИНИЦИАТИВН'),(542,'ИНСТИТУТ'),(65,'ИНСТРУМЕНТ'),(176,'ИНТЕРЕС'),(701,'ИНТЕРЕСН'),(399,'ИНТЕРЬЕР'),(958,'ИНТЕРЬЕРН'),(469,'ИНТЕРЬЕРОВ'),(505,'ИС'),(1052,'ИСКЛЮЧЕН'),(888,'ИСПОЛНЕН'),(953,'ИСПОЛЬЗОВА'),(455,'ИСПОЛЬЗОВАН'),(735,'ИСПОЛЬЗУЕМ'),(496,'ИСПЫТАН'),(201,'ИСТОР'),(562,'ИЮН'),(966,'КАБИНЕТ'),(68,'КАЖД'),(780,'КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДН'),(761,'КАРБАМИДОФОРМАЛЬДЕГИДН'),(808,'КАРКАС'),(4,'КАРТ'),(947,'КАТЕГОР'),(1060,'КАФ'),(40,'КАЧЕСТВ'),(720,'КВ'),(167,'КВАЛИФИКАЦ'),(509,'КВАЛИФИЦИРОВА'),(770,'КИСЛОТ'),(857,'КЛАССИЧЕСК'),(759,'КЛЕ'),(728,'КЛЕЕВ'),(732,'КЛЕЯ'),(90,'КЛИЕНТ'),(1197,'КЛИЕНТОВ'),(862,'КОЖ'),(529,'КОЛЕСНИК'),(528,'КОЛЕСНИКОВ'),(937,'КОЛЛЕГ'),(279,'КОЛЛЕКТ'),(1184,'КОЛЛЕКЦ'),(1158,'КОЛОРИСТК'),(882,'КОЛОРИТН'),(898,'КОМБИНАЦ'),(1245,'КОММУНИКАБЕЛЬН'),(389,'КОМНАТ'),(1115,'КОМОД'),(1090,'КОМПАКТН'),(8,'КОМПАН'),(468,'КОМПЛЕКСН'),(332,'КОМПЛЕКТ'),(738,'КОМПОЗИЦ'),(789,'КОМПОНЕНТ'),(788,'КОМПОНЕНТОВ'),(911,'КОМПОНОВК'),(1041,'КОМПЬЮТЕР'),(456,'КОМПЬЮТЕРН'),(356,'КОМФОРТ'),(864,'КОМФОРТН'),(428,'КОНКРЕТН'),(928,'КОНКУРЕНТ'),(686,'КОНКУРЕНТН'),(927,'КОНКУРЕНТОВ'),(672,'КОНКУРС'),(1192,'КОНСТРУКТОР'),(1117,'КОНСТРУКЦ'),(584,'КОНСУЛЬТАЦ'),(1196,'КОНСУЛЬТИРОВАН'),(582,'КОНТАКТ'),(272,'КОНТРАКТ'),(271,'КОНТРАКТОВ'),(447,'КОНТРОЛ'),(896,'КОНУСН'),(305,'КОНФЕРЕНЦ'),(1106,'КОНФЕРЕНЦ-КРЕСЕЛ'),(322,'КОНЦЕРН'),(553,'КООРДИНИР'),(313,'КОРПУС'),(25,'КОРПУСН'),(350,'КОРПУСОВ'),(131,'КОРРЕКТИР'),(58,'КОТОР'),(980,'КРАСОТ'),(1033,'КРЕСЕЛ'),(798,'КРЕСЛ'),(846,'КРЕСТОВИН'),(805,'КРОВАТ'),(500,'КРОМ'),(1012,'КРУГЛ'),(23,'КРУПН'),(1110,'КУП'),(384,'КУХН'),(646,'КУХОН'),(498,'ЛАБОРАТОР'),(628,'ЛАТВ'),(891,'ЛАУР'),(1271,'ЛЕГ'),(1015,'ЛЕГЕНДАРН'),(1094,'ЛЕГК'),(510,'ЛЕТ'),(855,'ЛИВЕРПУЛ'),(294,'ЛИДЕР'),(293,'ЛИДЕРОВ'),(513,'ЛИДИР'),(324,'ЛИН'),(629,'ЛИТВ'),(105,'ЛИЧН'),(1053,'ЛИШ'),(69,'ЛУЧШ'),(1021,'ЛЮБ'),(214,'М2'),(1215,'МАГАЗИН'),(251,'МАГАЗИН-САЛОН'),(344,'МАГАЗИНОВ-САЛОН'),(343,'МАГАЗИНОВ-САЛОНОВ'),(1119,'МАКСИМАЛЬН'),(547,'МАЛ'),(19,'МАЛЕНЬК'),(609,'МАРКЕТИНГ'),(692,'МАРКЕТИНГОВ'),(790,'МАС'),(941,'МАСС'),(1050,'МАССИВ'),(865,'МАССИВН'),(44,'МАССОВ'),(666,'МАСТЕР-КЛАСС'),(211,'МАСТЕРСК'),(153,'МАСТЕРСТВ'),(668,'МАСШТАБН'),(302,'МАТЕРИА'),(301,'МАТЕРИАЛ'),(300,'МАТЕРИАЛОВ'),(146,'МАТЕРИАЛЬН'),(26,'МЕБЕЛ'),(7,'МЕБЕЛЬН'),(336,'МЕБЕЛЬПЛЮС'),(169,'МЕЖДУНАРОДН'),(411,'МЕЛЬЧАЙШ'),(504,'МЕНЕДЖМЕНТ'),(132,'МЕР'),(610,'МЕРОПРИЯТ'),(1234,'МЕС'),(137,'МЕСТ'),(473,'МЕСЯЦ'),(472,'МЕСЯЦЕВ'),(1088,'МЕТАЛЛИЧЕСК'),(1220,'МЕТОД'),(1219,'МЕТОДОВ'),(874,'МЕХАНИЗМ'),(1274,'МЕЧТ'),(750,'МЕЩЕРЯК'),(749,'МЕЩЕРЯКОВ'),(33,'МИНИМАЛЬН'),(969,'МИНИМУМ'),(825,'МИНИСТР'),(633,'МИНСК'),(711,'МИР'),(268,'МИРОВ'),(53,'МИСС'),(748,'МИХАЙЛОВИЧ'),(433,'МНОГ'),(742,'МНОГОКОМПОНЕНТН'),(457,'МНОГОЛЕТН'),(680,'МОД'),(377,'МОДЕЛ'),(1133,'МОДЕЛИРОВАН'),(902,'МОДЕРН'),(234,'МОДЕРНИЗАЦ'),(778,'МОДИФИКАТОР'),(589,'МОЖЕТ'),(833,'МОЖН'),(223,'МОЛОД'),(483,'МОЛОДЕЖ'),(449,'МОМЕНТ'),(815,'МОНАЛИЗ'),(1129,'МОНТАЖ'),(145,'МОРАЛЬН'),(256,'МОСКВ'),(85,'МОЩНОСТ'),(1249,'МПЗ'),(908,'МЫСЛ'),(335,'МЯГК'),(913,'НАБОР'),(1189,'НАВЫК'),(419,'НАГЛЯДН'),(81,'НАДЕЖН'),(437,'НАИБОЛ'),(921,'НАИЛУЧШ'),(940,'НАЙТ'),(1140,'НАКАНУН'),(883,'НАКЛАДК'),(41,'НАЛАЖ'),(520,'НАЛАЖИВА'),(374,'НАМ'),(519,'НАРАЩИВА'),(673,'НАРОДН'),(479,'НАС'),(550,'НАСТОЯ'),(280,'НАСЧИТЫВА'),(1172,'НАТУРАЛИСТИЧН'),(329,'НАТУРАЛЬН'),(889,'НАХОД'),(568,'НАЧАЛЬНИК'),(203,'НАЧИНА'),(974,'НАЧНЕТ'),(9,'НАШ'),(1258,'НЕДЕЛ'),(1039,'НЕЗАМЕНИМ'),(1139,'НЕКОТОР'),(835,'НЕМ'),(914,'НЕОБХОДИМ'),(869,'НЕОБЫКНОВЕН'),(1072,'НЕОБЫЧАЙН'),(847,'НЕОБЫЧН'),(382,'НЕПОВТОРИМ'),(1136,'НЕПОСРЕДСТВЕН'),(827,'НЕСМОТР'),(392,'НЕСТАНДАРТН'),(339,'НИЖН'),(828,'НИЗК'),(1082,'НИХ'),(156,'НОВ'),(340,'НОВГОРОД'),(906,'НОВИЗН'),(650,'НОВИНК'),(3,'НОВОСТ'),(1004,'НОГ'),(999,'НОЖК'),(49,'НОМЕНКЛАТУР'),(119,'НОРМ'),(409,'НЮАНС'),(408,'НЮАНСОВ'),(1045,'ОБАЯН'),(38,'ОБЕСПЕЧ'),(144,'ОБЕСПЕЧЕН'),(114,'ОБЕСПЕЧИВА'),(669,'ОБЕЩА'),(811,'ОБИВК'),(652,'ОБИВОЧН'),(730,'ОБЛАСТ'),(910,'ОБЛИК'),(358,'ОБНОВЛЕН'),(1236,'ОБОРОТ'),(31,'ОБОРУДОВАН'),(1138,'ОБРАБОТК'),(1180,'ОБРАЗ'),(535,'ОБРАЗОВАН'),(677,'ОБРАЗЦ'),(676,'ОБРАЗЦОВ'),(583,'ОБРАТ'),(1014,'ОБСТАНОВК'),(975,'ОБСУЖДЕН'),(71,'ОБУСТРО'),(942,'ОБУСТРОЙСТВ'),(1246,'ОБУЧАЕМ'),(149,'ОБУЧЕН'),(348,'ОБЩ'),(1195,'ОБЩЕН'),(486,'ОБЪЕДИНЯ'),(109,'ОБЪЕМ'),(417,'ОБЪЕМН'),(946,'ОБЯЗАН'),(181,'ОБЯЗАТЕЛЬСТВ'),(1128,'ОГОВАРИВА'),(1144,'ОГОВОР'),(1031,'ОГРАНИЧЕН'),(22,'ОДН'),(88,'ОЖИДАН'),(1026,'ОКАНТОВК'),(1204,'ОКЛАД'),(123,'ОКРУЖА'),(454,'ОП'),(998,'ОПИРА'),(756,'ОПИСАН'),(1151,'ОПЛАЧИВА'),(87,'ОПРАВДЫВА'),(430,'ОПРЕДЕЛЕН'),(933,'ОПРЕДЕЛЯ'),(983,'ОПРОВЕРГА'),(694,'ОПРОС'),(930,'ОПТИМ'),(79,'ОПТИМАЛЬН'),(159,'ОПТИМИЗАЦ'),(467,'ОПТИМИЗИРОВА'),(1131,'ОПЫТН'),(916,'ОРГАНИЗАЦ'),(295,'ОРГАНИЗАЦИОН'),(935,'ОРГАНИЗОВА'),(1064,'ОРГАНИЧН'),(1174,'ОРИГИНАЛ'),(840,'ОРИГИНАЛЬН'),(427,'ОСВЕЩЕН'),(1000,'ОСВОБОЖД'),(895,'ОСН'),(136,'ОСНАЩЕН'),(894,'ОСНОВ'),(189,'ОСНОВАН'),(903,'ОСНОВН'),(390,'ОСОБ'),(1036,'ОСОБЕН'),(1198,'ОСТАВЛЕН'),(1150,'ОСТАЛЬН'),(197,'ОСТАН'),(28,'ОСУЩЕСТВЛЯ'),(743,'ОТВЕРДИТЕЛ'),(597,'ОТВЕТ'),(106,'ОТВЕТСТВЕН'),(1141,'ОТДЕЛ'),(1157,'ОТДЕЛК'),(331,'ОТДЕЛЬН'),(249,'ОТКР'),(333,'ОТКРЫВА'),(317,'ОТКРЫТ'),(1095,'ОТЛИЧН'),(178,'ОТНОС'),(173,'ОТНОШЕН'),(1120,'ОТОБРАЖА'),(620,'ОТРАСЛ'),(693,'ОТЧЕТ'),(1227,'ОТЧЕТН'),(1254,'ОТЧЕТОВ'),(207,'ОФИС'),(634,'ОФИСКОМФОРТ'),(800,'ОФИСН'),(206,'ОФИСОВ'),(266,'ОФИЦИАЛЬН'),(450,'ОФОРМЛЕН'),(465,'ОШИБОК'),(965,'ОЩУЩЕН'),(1212,'ПАКЕТ'),(1057,'ПАЛЕРМ'),(1056,'ПАЛИТР'),(1042,'ПАРМ'),(1032,'ПАРТ'),(175,'ПАРТНЕР'),(184,'ПАРТНЕРОВ'),(362,'ПАРТНЕРСТВ'),(753,'ПАТЕНТ'),(208,'ПЕРВ'),(1247,'ПЕРВИЧН'),(682,'ПЕРЕГОВОР'),(962,'ПЕРЕГОВОРОВ'),(949,'ПЕРЕГОРОДК'),(60,'ПЕРЕД'),(1130,'ПЕРЕДА'),(452,'ПЕРЕДОВ'),(1161,'ПЕРЕКЛЮЧЕН'),(1156,'ПЕРЕПЛАНИРОВК'),(1159,'ПЕРЕСТАНОВК'),(240,'ПЕРЕШЛ'),(932,'ПЕРСОНА'),(77,'ПЕРСПЕКТИВ'),(561,'ПЕТРОВИЧ'),(1188,'ПК'),(1009,'ПЛАВН'),(1228,'ПЛАН'),(1084,'ПЛАСТИК'),(1102,'ПЛАСТИКОВ'),(1114,'ПЛАТЯН'),(899,'ПЛОТН'),(212,'ПЛОЩАД'),(1034,'ПЛУТОН'),(243,'ПОВЫС'),(107,'ПОВЫШЕН'),(709,'ПОДА'),(1170,'ПОДБИРА'),(1177,'ПОДБОР'),(660,'ПОДГОТОВ'),(546,'ПОДГОТОВК'),(691,'ПОДГОТОВЛ'),(525,'ПОДГОТОВЛЕН'),(853,'ПОДДЕРЖИВА'),(824,'ПОДЛОКОТНИК'),(848,'ПОДЛОКОТНИКОВ'),(257,'ПОДМОСКОВ'),(400,'ПОДОБРА'),(1096,'ПОДОЙДЕТ'),(1073,'ПОДОЙДУТ'),(1255,'ПОДРАЗДЕЛЕН'),(51,'ПОДХОД'),(438,'ПОДХОДЯ'),(1125,'ПОЖЕЛАН'),(222,'ПОЗВОЛ'),(37,'ПОЗВОЛЯ'),(854,'ПОЗВОНОЧНИК'),(514,'ПОЗИЦ'),(678,'ПОЗНАКОМ'),(6,'ПОИСК'),(667,'ПОИСТИН'),(485,'ПОКОЛЕН'),(585,'ПОКУПК'),(1001,'ПОЛЕЗН'),(541,'ПОЛИТЕХНИЧЕСК'),(125,'ПОЛИТИК'),(803,'ПОЛК'),(957,'ПОЛН'),(368,'ПОЛУТОР'),(507,'ПОЛУЧ'),(731,'ПОЛУЧЕН'),(1187,'ПОЛЬЗОВАТЕЛ'),(630,'ПОЛЬШ'),(397,'ПОМЕЩЕН'),(657,'ПОМИМ'),(403,'ПОМОГУТ'),(1013,'ПОМОЖЕТ'),(596,'ПОМОЧ'),(832,'ПОМОЩ'),(194,'ПОНИМА'),(104,'ПОНИМАН'),(1023,'ПОНЯТ'),(1101,'ПОПУЛЯРН'),(901,'ПОРОЛОН'),(900,'ПОРОЛОНОВ'),(714,'ПОСЕТ'),(695,'ПОСЕТИТЕЛ'),(1127,'ПОСЛ'),(110,'ПОСЛЕД'),(416,'ПОСМОТРЕТ'),(273,'ПОСТАВК'),(84,'ПОСТАВЩИК'),(239,'ПОСТЕПЕН'),(48,'ПОСТОЯ'),(1135,'ПОСТУПА'),(1029,'ПОТ'),(93,'ПОТРЕБИТЕЛ'),(956,'ПОТРЕБН'),(849,'ПОТРЯСА'),(592,'ПОЧТ'),(1262,'ПР-Д'),(92,'ПРАВ'),(120,'ПРАВИЛ'),(934,'ПРАВИЛЬН'),(683,'ПРАКТИЧЕСК'),(487,'ПРЕДАН'),(1164,'ПРЕДВАРИТЕЛЬН'),(1168,'ПРЕДЛАГ'),(78,'ПРЕДЛАГА'),(684,'ПРЕДЛОЖЕН'),(645,'ПРЕДМЕТ'),(739,'ПРЕДНАЗНАЧ'),(1146,'ПРЕДОПЛАТ'),(432,'ПРЕДОСТАВЛ'),(67,'ПРЕДОСТАВЛЯ'),(712,'ПРЕДПОЛАГА'),(57,'ПРЕДПРИЯТ'),(1175,'ПРЕДСТАВ'),(315,'ПРЕДСТАВИТЕЛЬСТВ'),(643,'ПРЕДСТАВЛ'),(418,'ПРЕДСТАВЛЕН'),(967,'ПРЕЗИДЕНТ'),(687,'ПРЕИМУЩЕСТВ'),(1085,'ПРЕКРАСН'),(1206,'ПРЕМ'),(968,'ПРЕМЬЕР-МИНИСТР'),(1155,'ПРЕОБРАЗОВАН'),(741,'ПРЕССОВАН'),(886,'ПРЕСТИЖ'),(263,'ПРЕСТИЖН'),(112,'ПРИБ'),(187,'ПРИБЫЛЬН'),(1241,'ПРИВЕТСВ'),(1068,'ПРИВЛЕКА'),(982,'ПРИВЛЕКАТЕЛЬН'),(164,'ПРИВЛЕЧЕН'),(925,'ПРИВЫКЛ'),(868,'ПРИДА'),(1121,'ПРИЕЗЖА'),(451,'ПРИЕМ'),(267,'ПРИЗНАН'),(32,'ПРИМЕНЕН'),(766,'ПРИМЕНЯ'),(198,'ПРИМЕР'),(839,'ПРИМЕЧАТЕЛЬН'),(623,'ПРИНИМА'),(637,'ПРИНЦИП'),(130,'ПРИНЯТ'),(321,'ПРИОБРЕТА'),(607,'ПРИОБРЕТЕН'),(1077,'ПРИРОДН'),(944,'ПРИСПОСОБ'),(955,'ПРИСПОСОБЛЕН'),(297,'ПРИСТУП'),(1112,'ПРИХОЖ'),(779,'ПРИЧ'),(304,'ПРОВЕД'),(713,'ПРОВЕДЕН'),(681,'ПРОВЕСТ'),(722,'ПРОВОД'),(545,'ПРОГРАММ'),(1185,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(1205,'ПРОДАЖ'),(420,'ПРОДЕМОНСТРИР'),(357,'ПРОДОЛЖА'),(2,'ПРОДУКЦ'),(355,'ПРОЕКТ'),(466,'ПРОЕКТИРОВАН'),(1200,'ПРОЕКТОВ'),(1123,'ПРОИЗВЕДЕТ'),(395,'ПРОИЗВЕДУТ'),(458,'ПРОИЗВЕСТ'),(1030,'ПРОИЗВОД'),(117,'ПРОИЗВОДИМ'),(24,'ПРОИЗВОДИТЕЛ'),(158,'ПРОИЗВОДИТЕЛЬН'),(349,'ПРОИЗВОДСВЕННО-СКЛАДСК'),(29,'ПРОИЗВОДСТВ'),(42,'ПРОИЗВОДСТВЕН'),(988,'ПРОИСХОД'),(737,'ПРОМЫШЛЕН'),(410,'ПРОРИСОВК'),(1018,'ПРОСТ'),(822,'ПРОСТЕЖК'),(74,'ПРОСТРАНСТВ'),(757,'ПРОТОТИП'),(152,'ПРОФЕССИОНАЛЬН'),(494,'ПРОХОД'),(43,'ПРОЦЕСС'),(799,'ПРОЧ'),(725,'ПРОЧН'),(476,'ПРОШЕДШ'),(544,'ПРОШЕЛ'),(16,'ПРОШЛ'),(897,'ПРУЖИН'),(18,'ПУТ'),(1273,'ПУШИНК'),(632,'ПЯТ'),(376,'ПЯТИСОТ'),(100,'РАБОТ'),(75,'РАБОТА'),(103,'РАБОТНИК'),(102,'РАБОТНИКОВ'),(1037,'РАБОТОСПОСОБН'),(73,'РАБОЧ'),(595,'РАД'),(573,'РАДИОТЕХНИК'),(724,'РАЗ'),(56,'РАЗВИВА'),(113,'РАЗВИТ'),(746,'РАЗИНЬК'),(745,'РАЗИНЬКОВ'),(434,'РАЗЛИЧН'),(393,'РАЗМЕР'),(717,'РАЗМЕСТ'),(426,'РАЗН'),(661,'РАЗНООБРАЗН'),(375,'РАЗРАБОТА'),(586,'РАЗРАБОТК'),(663,'РАМК'),(878,'РАСКЛАДУШК'),(1137,'РАСКР'),(325,'РАСКРО'),(819,'РАСПИСЫВА'),(209,'РАСПОЛАГА'),(404,'РАСПОЛОЖ'),(431,'РАСПОРЯЖЕН'),(1176,'РАССМОТРЕТ'),(1178,'РАССТАНОВК'),(224,'РАСТ'),(784,'РАСТВОР'),(462,'РАСХОД'),(460,'РАСЧЕТ'),(1134,'РАСЧЕТОВ'),(314,'РАСШИР'),(658,'РАСШИРЕН'),(517,'РАСШИРЯ'),(559,'РАТЧЕНК'),(952,'РАЦИОНАЛЬН'),(193,'РЕГИОН'),(318,'РЕГИОНАЛЬН'),(192,'РЕГИОНОВ'),(1162,'РЕЖИМ'),(161,'РЕЗУЛЬТАТ'),(111,'РЕИНВЕСТИРОВАН'),(671,'РЕСПУБЛИКАНСК'),(771,'РЕША'),(80,'РЕШЕН'),(570,'РОГОВ'),(532,'РОД'),(1217,'РОЗНИЦ'),(341,'РОЗНИЧН'),(872,'РОСКОШ'),(810,'РОСКОШН'),(809,'РОСПИС'),(27,'РОСС'),(11,'РОССИЙСК'),(191,'РОСТ'),(1210,'РУБ'),(316,'РУБЕЖ'),(1191,'РУК'),(826,'РУКОВОДИТЕЛ'),(508,'РУКОВОДСТВ'),(526,'РУКОВОДЯ'),(35,'РУЧН'),(1214,'РФ'),(12,'РЫНК'),(170,'РЫНОК'),(270,'РЯД'),(707,'САД'),(5,'САЙТ'),(290,'САЛОН'),(289,'САЛОНОВ'),(1244,'САМОСТОЯТЕЛЬН'),(139,'САНИТАРН'),(338,'САНКТ-ПЕТЕРБУРГ'),(445,'СБОРК'),(915,'СВЕЖ'),(128,'СВОЕВРЕМЕН'),(625,'СВЫШ'),(1143,'СВЯЖУТ'),(521,'СВЯЗ'),(429,'СДЕЛА'),(463,'СЕБЕСТОИМ'),(259,'СЕВЕРО-ЗАПАД'),(363,'СЕГОДН'),(372,'СЕГОДНЯШН'),(641,'СЕКТОР'),(640,'СЕКТОРОВ'),(665,'СЕМИНАР'),(533,'СЕНТЯБР'),(905,'СЕР'),(566,'СЕРГ'),(499,'СЕРТИФИКАТ'),(495,'СЕРТИФИКАЦИОН'),(342,'СЕТ'),(254,'СИБИР'),(1054,'СИДЕН'),(1081,'СИДЕТ'),(996,'СИММЕТРИЧ'),(774,'СИНТЕТИЧЕСК'),(96,'СИСТ'),(127,'СИСТЕМ'),(148,'СИСТЕМАТИЧЕСК'),(1002,'СИСТЕМН'),(1099,'СИТ'),(299,'СКЛАД'),(1075,'СКЛАДН'),(364,'СКЛАДСК'),(890,'СЛЕВ'),(786,'СЛЕД'),(1091,'СЛОЖ'),(1116,'СЛОЖН'),(1006,'СЛУЖ'),(415,'СМОЖЕТ'),(762,'СМОЛ'),(675,'СМОТР'),(275,'СНГ'),(162,'СНИЖЕН'),(461,'СНИЗ'),(174,'СО'),(61,'СОБ'),(960,'СОБРАН'),(233,'СОБСТВЕН'),(527,'СОБСТВЕННИК'),(242,'СОВЕРШЕН'),(126,'СОВЕРШЕНСТВОВАН'),(1025,'СОВЕСТ'),(1016,'СОВЕЩАТЕЛЬН'),(413,'СОВМЕСТН'),(1207,'СОВОКУПН'),(959,'СОВРЕМЕН'),(775,'СОГЛАСН'),(1022,'СОГЛАСУ'),(190,'СОДЕЙСТВ'),(777,'СОДЕРЖ'),(727,'СОЕДИНЕН'),(406,'СОЗДА'),(134,'СОЗДАН'),(920,'СОЗДАСТ'),(1065,'СОЛЬЮТ'),(116,'СООТВЕТСТВ'),(787,'СООТНОШЕН'),(763,'СОПОЛИМЕР'),(734,'СОСТА'),(365,'СОСТАВ'),(351,'СОСТАВЛЯ'),(733,'СОСТАВОВ'),(618,'СОСТО'),(760,'СОСТОЯ'),(143,'СОТРУДНИК'),(142,'СОТРУДНИКОВ'),(893,'СОФ'),(511,'СОХРАН'),(991,'СОХРАНЯ'),(1211,'СОЦ'),(196,'СОЦИАЛЬН'),(912,'СОЧЕТА'),(917,'СОЧЕТАН'),(703,'СПАЛ'),(387,'СПАЛЬН'),(1153,'СПЕКТР'),(497,'СПЕЦИАЛИЗИРОВА'),(166,'СПЕЦИАЛИСТ'),(165,'СПЕЦИАЛИСТОВ'),(564,'СПЕЦИАЛЬН'),(823,'СПИНК'),(1005,'СПРАВ'),(1067,'СРАЗ'),(124,'СРЕД'),(548,'СРЕДН'),(220,'СРЕДСТВ'),(444,'СРОК'),(232,'СТАВШ'),(236,'СТАЛ'),(491,'СТАНДАРТ'),(216,'СТАНК'),(674,'СТАНОВ'),(484,'СТАРШ'),(670,'СТАТ'),(523,'СТЕПЕН'),(859,'СТИЛ'),(994,'СТИЛЬН'),(829,'СТОИМОСТ'),(964,'СТОЙК'),(801,'СТОЛ'),(981,'СТОЛОВ'),(47,'СТОРОН'),(274,'СТРАН'),(581,'СТРАНИЦ'),(54,'СТРАТЕГ'),(381,'СТРЕМ'),(636,'СТРО'),(115,'СТРОГ'),(736,'СТРОИТЕЛЬН'),(298,'СТРОИТЕЛЬСТВ'),(867,'СТРОЧК'),(802,'СТУЛ'),(1059,'СТУЛЬЕВ'),(1148,'СУММ'),(1272,'СУПЕР-СТАР'),(10,'СУЩЕСТВ'),(1193,'СФЕР'),(1173,'СХОЖЕСТ'),(844,'СЧЕТ'),(1078,'СЧИТА'),(549,'США'),(291,'ТАКЖ'),(887,'ТАХТ'),(851,'ТВЕРД'),(414,'ТВОРЧЕСТВ'),(621,'ТЕКУЩ'),(590,'ТЕЛЕФОН'),(380,'ТЕМ'),(639,'ТЕМАТИЧЕСК'),(226,'ТЕМП'),(679,'ТЕНДЕНЦ'),(1079,'ТЕПЛ'),(345,'ТЕРРИТОР'),(1279,'ТЕСТОВ'),(1040,'ТЕХ'),(574,'ТЕХНИЧЕСК'),(157,'ТЕХНОЛОГ'),(82,'ТЕХНОЛОГИЧН'),(702,'ТИП'),(1213,'ТК'),(653,'ТКАН'),(501,'ТОГ'),(834,'ТОМ'),(1055,'ТОНИРОВК'),(20,'ТОРГОВ'),(443,'ТОЧН'),(401,'ТОЧНОСТ'),(238,'ТРАДИЦ'),(1142,'ТРАНСПОРТН'),(875,'ТРАНСФОРМАЦ'),(118,'ТРЕБОВАН'),(185,'ТРЕБОВАТЕЛЬН'),(361,'ТРЕТ'),(1132,'ТРЕХМЕРН'),(1019,'ТРОН'),(36,'ТРУД'),(1222,'ТРУДОВ'),(1229,'ТРУДОУСТРОЙСТВ'),(951,'ТУМБ'),(369,'ТЫСЯЧ'),(246,'УВЕЛИЧ'),(108,'УВЕЛИЧИВА'),(1186,'УВЕРЕН'),(685,'УВИДЕТ'),(323,'УГЛОВ'),(918,'УДАЧН'),(978,'УДИВИТЕЛЬН'),(1089,'УДОБ'),(1007,'УДОБН'),(147,'УДОВЛЕТВОРЕН'),(1256,'УКАЗАН'),(359,'УКОМПЛЕКТОВА'),(631,'УКРАИН'),(881,'УКРАШЕН'),(306,'УКРЕПЛЕН'),(987,'УМЕНЬШЕН'),(1058,'УНИВЕРСАЛЬН'),(575,'УНИВЕРСИТЕТ'),(954,'УНИКАЛЬН'),(1221,'УПРАВЛЕН'),(1020,'УПРАВЛЕНЦ'),(552,'УПРАВЛЯ'),(512,'УПРОЧ'),(255,'УРА'),(244,'УРОВЕН'),(151,'УРОВН'),(135,'УСЛОВ'),(1,'УСЛУГ'),(492,'УСПЕХ'),(353,'УСПЕШН'),(837,'УСТАЛ'),(873,'УСТАНОВ'),(446,'УСТАНОВК'),(984,'УСТОЯ'),(985,'УТВЕРЖДЕН'),(624,'УЧАСТ'),(690,'УЧАСТНИК'),(689,'УЧАСТНИКОВ'),(477,'УЧЕБН'),(407,'УЧЕТ'),(1124,'УЧИТЫВ'),(1063,'УЮТ'),(1044,'УЮТН'),(334,'ФАБРИК'),(1074,'ФАЗЕНД'),(598,'ФАКС'),(1167,'ФАКТУР'),(538,'ФАКУЛЬТЕТ'),(754,'ФЕДЕРАЦ'),(531,'ФЕДОРОВИЧ'),(1035,'ФИЗИОЛОГИЧЕСК'),(303,'ФИЛИА'),(1226,'ФИНАНСОВО-ХОЗЯЙСТВЕН'),(21,'ФИРМ'),(250,'ФИРМЕН'),(880,'ФЛОР'),(567,'ФОМИЧ'),(1070,'ФОРМ'),(94,'ФОРМИР'),(1253,'ФОРМИРОВАН'),(612,'ФОРУМ'),(939,'ФУНКЦ'),(1160,'ФУНКЦИОНАЛЬН'),(651,'ФУРНИТУР'),(46,'ХАРАКТЕР'),(904,'ХАРАКТЕРИСТИК'),(1076,'ХЛОПК'),(767,'ХЛОРИСТ'),(237,'ХОРОШ'),(1107,'ХРАН'),(1092,'ХРАНЕН'),(838,'ХРОМ'),(845,'ХРОМИРОВА'),(1199,'ХУДОЖЕСТВЕННО-КОНСТРУКТОРСК'),(402,'ЦВЕТ'),(1171,'ЦВЕТН'),(919,'ЦВЕТОВ'),(64,'ЦЕЛ'),(1049,'ЦЕЛИК'),(163,'ЦЕН'),(230,'ЦЕХ'),(1233,'ЧАС'),(218,'ЧЕЛОВЕК'),(1231,'ЧЕР'),(1190,'ЧЕРЧЕН'),(1024,'ЧЕСТ'),(973,'ЧИНОВНИК'),(292,'ЧИСЛ'),(1047,'ЧИСТ'),(836,'ЧУВСТВУ'),(252,'ШАГ'),(870,'ШАРМ'),(1260,'ШАТУР'),(1152,'ШИРОК'),(950,'ШКАФ'),(205,'ШКОЛ'),(330,'ШПОН'),(785,'ЩАВЕЛЕВ'),(1266,'ЭКЗАМЕН2'),(1046,'ЭКОЛОГИЧЕСК'),(1182,'ЭКСКЛЮЗИВН'),(1169,'ЭКСПЕРИМЕНТИРОВА'),(229,'ЭКСПЛУАТАЦ'),(993,'ЭКСПЛУАТАЦИОН'),(622,'ЭКСПОЗИЦ'),(659,'ЭКСПОФОРУМ'),(871,'ЭЛЕГАНТН'),(591,'ЭЛЕКТРОН'),(425,'ЭЛЕМЕНТ'),(654,'ЭЛЕМЕНТОВ'),(866,'ЭЛИТН'),(482,'ЭНТУЗИАЗМ'),(1087,'ЭР'),(850,'ЭРГОНОМИК'),(948,'ЭРГОНОМИЧН'),(1126,'ЭСКИЗН'),(448,'ЭТАП'),(1194,'ЭТИК'),(129,'ЭФФЕКТИВН'),(258,'ЮГ'),(758,'ЯВЛЯ'),(812,'ЯРК'),(62,'ЯСН'),(804,'ЯЩИК');
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_suggest`
--

DROP TABLE IF EXISTS `b_search_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_suggest`
--

LOCK TABLES `b_search_suggest` WRITE;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_tags`
--

DROP TABLE IF EXISTS `b_search_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_tags`
--

LOCK TABLES `b_search_tags` WRITE;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_user_right`
--

DROP TABLE IF EXISTS `b_search_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_user_right`
--

LOCK TABLES `b_search_user_right` WRITE;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_filter_mask`
--

DROP TABLE IF EXISTS `b_sec_filter_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_filter_mask`
--

LOCK TABLES `b_sec_filter_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_frame_mask`
--

DROP TABLE IF EXISTS `b_sec_frame_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_frame_mask`
--

LOCK TABLES `b_sec_frame_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule`
--

DROP TABLE IF EXISTS `b_sec_iprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule`
--

LOCK TABLES `b_sec_iprule` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_ip`
--

LOCK TABLES `b_sec_iprule_excl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_mask`
--

LOCK TABLES `b_sec_iprule_excl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_ip`
--

LOCK TABLES `b_sec_iprule_incl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_mask`
--

LOCK TABLES `b_sec_iprule_incl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_recovery_codes`
--

DROP TABLE IF EXISTS `b_sec_recovery_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_recovery_codes`
--

LOCK TABLES `b_sec_recovery_codes` WRITE;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_redirect_url`
--

DROP TABLE IF EXISTS `b_sec_redirect_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_redirect_url`
--

LOCK TABLES `b_sec_redirect_url` WRITE;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
INSERT INTO `b_sec_redirect_url` VALUES ('Y',10,'/bitrix/redirect.php','goto'),('Y',20,'/bitrix/rk.php','goto'),('Y',30,'/bitrix/click.php','goto');
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_session`
--

DROP TABLE IF EXISTS `b_sec_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_session`
--

LOCK TABLES `b_sec_session` WRITE;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_user`
--

DROP TABLE IF EXISTS `b_sec_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_user`
--

LOCK TABLES `b_sec_user` WRITE;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_virus`
--

DROP TABLE IF EXISTS `b_sec_virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_virus`
--

LOCK TABLES `b_sec_virus` WRITE;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_white_list`
--

DROP TABLE IF EXISTS `b_sec_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_white_list`
--

LOCK TABLES `b_sec_white_list` WRITE;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_security_sitecheck`
--

DROP TABLE IF EXISTS `b_security_sitecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_security_sitecheck`
--

LOCK TABLES `b_security_sitecheck` WRITE;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_autolog`
--

DROP TABLE IF EXISTS `b_seo_adv_autolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_autolog`
--

LOCK TABLES `b_seo_adv_autolog` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_banner`
--

DROP TABLE IF EXISTS `b_seo_adv_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_banner`
--

LOCK TABLES `b_seo_adv_banner` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_campaign`
--

DROP TABLE IF EXISTS `b_seo_adv_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_campaign`
--

LOCK TABLES `b_seo_adv_campaign` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_group`
--

DROP TABLE IF EXISTS `b_seo_adv_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_group`
--

LOCK TABLES `b_seo_adv_group` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_link`
--

DROP TABLE IF EXISTS `b_seo_adv_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_link`
--

LOCK TABLES `b_seo_adv_link` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_log`
--

DROP TABLE IF EXISTS `b_seo_adv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_log`
--

LOCK TABLES `b_seo_adv_log` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_order`
--

DROP TABLE IF EXISTS `b_seo_adv_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_order`
--

LOCK TABLES `b_seo_adv_order` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_region`
--

DROP TABLE IF EXISTS `b_seo_adv_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_region`
--

LOCK TABLES `b_seo_adv_region` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_keywords`
--

DROP TABLE IF EXISTS `b_seo_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_keywords`
--

LOCK TABLES `b_seo_keywords` WRITE;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_search_engine`
--

DROP TABLE IF EXISTS `b_seo_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_search_engine`
--

LOCK TABLES `b_seo_search_engine` WRITE;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` VALUES (1,'google','Y',200,'Google','868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com','EItMlJpZLC2WRPKB6QsA5bV9','urn:ietf:wg:oauth:2.0:oob',NULL),(2,'yandex','Y',300,'Yandex','f848c7bfc1d34a94ba6d05439f81bbd7','da0e73b2d9cc4e809f3170e49cb9df01','https://oauth.yandex.ru/verification_code',NULL),(3,'yandex_direct','Y',400,'Yandex.Direct','','','https://oauth.yandex.ru/verification_code',NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_log`
--

DROP TABLE IF EXISTS `b_seo_service_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_log`
--

LOCK TABLES `b_seo_service_log` WRITE;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_rtg_queue`
--

DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_rtg_queue`
--

LOCK TABLES `b_seo_service_rtg_queue` WRITE;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_webhook`
--

DROP TABLE IF EXISTS `b_seo_service_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_webhook`
--

LOCK TABLES `b_seo_service_webhook` WRITE;
/*!40000 ALTER TABLE `b_seo_service_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_webhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap`
--

DROP TABLE IF EXISTS `b_seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap`
--

LOCK TABLES `b_seo_sitemap` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_entity`
--

DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_entity`
--

LOCK TABLES `b_seo_sitemap_entity` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_iblock`
--

DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_iblock`
--

LOCK TABLES `b_seo_sitemap_iblock` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_runtime`
--

DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_runtime`
--

LOCK TABLES `b_seo_sitemap_runtime` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_yandex_direct_stat`
--

DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_yandex_direct_stat`
--

LOCK TABLES `b_seo_yandex_direct_stat` WRITE;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_short_uri`
--

DROP TABLE IF EXISTS `b_short_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_short_uri`
--

LOCK TABLES `b_short_uri` WRITE;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_site_template`
--

DROP TABLE IF EXISTS `b_site_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_site_template`
--

LOCK TABLES `b_site_template` WRITE;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` VALUES (1,'s1','',150,'furniture_pale-blue');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile`
--

DROP TABLE IF EXISTS `b_smile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile`
--

LOCK TABLES `b_smile` WRITE;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_lang`
--

DROP TABLE IF EXISTS `b_smile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_lang`
--

LOCK TABLES `b_smile_lang` WRITE;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_set`
--

DROP TABLE IF EXISTS `b_smile_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_set`
--

LOCK TABLES `b_smile_set` WRITE;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_ap`
--

DROP TABLE IF EXISTS `b_socialservices_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_ap`
--

LOCK TABLES `b_socialservices_ap` WRITE;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact`
--

DROP TABLE IF EXISTS `b_socialservices_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact`
--

LOCK TABLES `b_socialservices_contact` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact_connect`
--

DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact_connect`
--

LOCK TABLES `b_socialservices_contact_connect` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_message`
--

DROP TABLE IF EXISTS `b_socialservices_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_message`
--

LOCK TABLES `b_socialservices_message` WRITE;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user`
--

DROP TABLE IF EXISTS `b_socialservices_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user`
--

LOCK TABLES `b_socialservices_user` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user_link`
--

DROP TABLE IF EXISTS `b_socialservices_user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user_link`
--

LOCK TABLES `b_socialservices_user_link` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker`
--

DROP TABLE IF EXISTS `b_sticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker`
--

LOCK TABLES `b_sticker` WRITE;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker_group_task`
--

DROP TABLE IF EXISTS `b_sticker_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker_group_task`
--

LOCK TABLES `b_sticker_group_task` WRITE;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
INSERT INTO `b_sticker_group_task` VALUES (5,29);
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription`
--

DROP TABLE IF EXISTS `b_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription`
--

LOCK TABLES `b_subscription` WRITE;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription_rubric`
--

DROP TABLE IF EXISTS `b_subscription_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription_rubric`
--

LOCK TABLES `b_subscription_rubric` WRITE;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task`
--

DROP TABLE IF EXISTS `b_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task`
--

LOCK TABLES `b_task` WRITE;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` VALUES (1,'main_denied','D','main','Y',NULL,'module'),(2,'main_change_profile','P','main','Y',NULL,'module'),(3,'main_view_all_settings','R','main','Y',NULL,'module'),(4,'main_view_all_settings_change_profile','T','main','Y',NULL,'module'),(5,'main_edit_subordinate_users','V','main','Y',NULL,'module'),(6,'main_full_access','W','main','Y',NULL,'module'),(7,'fm_folder_access_denied','D','main','Y',NULL,'file'),(8,'fm_folder_access_read','R','main','Y',NULL,'file'),(9,'fm_folder_access_write','W','main','Y',NULL,'file'),(10,'fm_folder_access_full','X','main','Y',NULL,'file'),(11,'fm_folder_access_workflow','U','main','Y',NULL,'file'),(12,'bitrixcloud_deny','D','bitrixcloud','Y',NULL,'module'),(13,'bitrixcloud_control','W','bitrixcloud','Y',NULL,'module'),(14,'clouds_denied','D','clouds','Y',NULL,'module'),(15,'clouds_browse','F','clouds','Y',NULL,'module'),(16,'clouds_upload','U','clouds','Y',NULL,'module'),(17,'clouds_full_access','W','clouds','Y',NULL,'module'),(18,'fileman_denied','D','fileman','Y','','module'),(19,'fileman_allowed_folders','F','fileman','Y','','module'),(20,'fileman_full_access','W','fileman','Y','','module'),(21,'medialib_denied','D','fileman','Y','','medialib'),(22,'medialib_view','F','fileman','Y','','medialib'),(23,'medialib_only_new','R','fileman','Y','','medialib'),(24,'medialib_edit_items','V','fileman','Y','','medialib'),(25,'medialib_editor','W','fileman','Y','','medialib'),(26,'medialib_full','X','fileman','Y','','medialib'),(27,'stickers_denied','D','fileman','Y','','stickers'),(28,'stickers_read','R','fileman','Y','','stickers'),(29,'stickers_edit','W','fileman','Y','','stickers'),(30,'hblock_denied','D','highloadblock','Y',NULL,'module'),(31,'hblock_read','R','highloadblock','Y',NULL,'module'),(32,'hblock_write','W','highloadblock','Y',NULL,'module'),(33,'iblock_deny','D','iblock','Y',NULL,'iblock'),(34,'iblock_read','R','iblock','Y',NULL,'iblock'),(35,'iblock_element_add','E','iblock','Y',NULL,'iblock'),(36,'iblock_admin_read','S','iblock','Y',NULL,'iblock'),(37,'iblock_admin_add','T','iblock','Y',NULL,'iblock'),(38,'iblock_limited_edit','U','iblock','Y',NULL,'iblock'),(39,'iblock_full_edit','W','iblock','Y',NULL,'iblock'),(40,'iblock_full','X','iblock','Y',NULL,'iblock'),(41,'security_denied','D','security','Y',NULL,'module'),(42,'security_filter','F','security','Y',NULL,'module'),(43,'security_otp','S','security','Y',NULL,'module'),(44,'security_view_all_settings','T','security','Y',NULL,'module'),(45,'security_full_access','W','security','Y',NULL,'module'),(46,'seo_denied','D','seo','Y','','module'),(47,'seo_edit','F','seo','Y','','module'),(48,'seo_full_access','W','seo','Y','','module'),(49,'Контент-редакторы','Q','main','N','Разрешено изменять информацию в своем профайле. Управление кешем','module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task_operation`
--

DROP TABLE IF EXISTS `b_task_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task_operation`
--

LOCK TABLES `b_task_operation` WRITE;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` VALUES (2,2),(2,3),(3,2),(3,4),(3,5),(3,6),(3,7),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(5,2),(5,3),(5,5),(5,6),(5,7),(5,8),(5,9),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(8,19),(8,20),(8,21),(9,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(10,19),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(11,19),(11,20),(11,21),(11,24),(11,28),(13,36),(13,37),(13,38),(15,39),(16,39),(16,40),(17,39),(17,40),(17,41),(19,44),(19,45),(19,46),(19,47),(19,48),(19,49),(19,50),(19,52),(19,53),(20,42),(20,43),(20,44),(20,45),(20,46),(20,47),(20,48),(20,49),(20,50),(20,51),(20,52),(20,53),(20,54),(22,55),(23,55),(23,56),(23,60),(24,55),(24,60),(24,61),(24,62),(25,55),(25,56),(25,57),(25,58),(25,60),(25,61),(25,62),(26,55),(26,56),(26,57),(26,58),(26,59),(26,60),(26,61),(26,62),(28,63),(29,63),(29,64),(29,65),(29,66),(31,67),(32,68),(32,69),(34,70),(34,71),(35,72),(36,70),(36,71),(36,73),(37,70),(37,71),(37,72),(37,73),(38,70),(38,71),(38,72),(38,73),(38,74),(38,75),(38,76),(38,77),(39,70),(39,71),(39,72),(39,73),(39,74),(39,75),(39,76),(39,77),(39,78),(39,79),(39,80),(39,81),(40,70),(40,71),(40,72),(40,73),(40,74),(40,75),(40,76),(40,77),(40,78),(40,79),(40,80),(40,81),(40,82),(40,83),(40,84),(40,85),(40,86),(40,87),(42,88),(43,89),(44,90),(44,91),(44,92),(44,93),(44,94),(44,95),(44,96),(44,97),(44,98),(44,99),(44,100),(45,88),(45,89),(45,90),(45,91),(45,92),(45,93),(45,94),(45,95),(45,96),(45,97),(45,98),(45,99),(45,100),(45,101),(45,102),(45,103),(45,104),(45,105),(45,106),(45,107),(45,108),(45,109),(45,110),(45,111),(45,112),(45,113),(47,115),(48,114),(48,115),(49,2),(49,3),(49,14);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_undo`
--

DROP TABLE IF EXISTS `b_undo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_undo`
--

LOCK TABLES `b_undo` WRITE;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_metadata`
--

DROP TABLE IF EXISTS `b_urlpreview_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_metadata`
--

LOCK TABLES `b_urlpreview_metadata` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_route`
--

DROP TABLE IF EXISTS `b_urlpreview_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_route`
--

LOCK TABLES `b_urlpreview_route` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (1,'2018-01-15 13:22:09','admin','XvgvbYNl2c7775fe76f52adb89476ec8b337503c','r93VFglodf64abbca6415e314f5060f4a706745f','Y','','','admin@gmail.com','2018-01-23 13:24:53','2018-01-11 16:03:48','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,'',NULL,NULL,'2018-01-15 16:22:09','',NULL,0,NULL,'',NULL,NULL,'',NULL,''),(2,'2018-01-15 13:22:14','manager','Jw46GwwJ899e0c5d32508b4e5c6f85e3c4a60b16','WuK4tWLr0c164984123cbb2627bc1e3ac8c95486','Y','','','manager@manager.ru','2018-01-15 14:15:47','2018-01-15 14:08:46','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,'',NULL,NULL,'2018-01-15 16:22:14','',NULL,0,NULL,'',NULL,NULL,'',NULL,''),(3,'2018-01-19 07:12:46','test1','wQ3y9baHfe513e70a1d147ba687a24f512821cfd','nv6lvLbL2ae09019abb55a7b24a653422dc57164','Y','','','test1@mail.ru','2018-01-16 10:44:46','2018-01-15 16:19:02','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,'',NULL,NULL,'2018-01-19 10:12:46','',NULL,0,NULL,'',NULL,NULL,'',NULL,''),(4,'2018-01-15 13:22:04','test2','73ORypgK3c0b3072098e7558a3650b90fbaf91f1','xyXT0Yzsd254a1fccb7b99cf6b09a85cd37cc648','Y','','','test2@mail.ru','2018-01-16 14:04:49','2018-01-15 16:19:31','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,'',NULL,NULL,'2018-01-15 16:22:04','',NULL,0,NULL,'',NULL,NULL,'',NULL,''),(5,'2018-01-15 13:21:22','test3','ib3qAcAocc05bf7765d4e3b2c9ba931669d10dcb','n8KzEVLT7c4a3541bc014ac17a1ba566b6dc568a','Y','','','test3@mail.ru',NULL,'2018-01-15 16:19:53','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,'',NULL,NULL,'2018-01-15 16:21:22','',NULL,NULL,NULL,'',NULL,NULL,'',NULL,'');
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access`
--

DROP TABLE IF EXISTS `b_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access`
--

LOCK TABLES `b_user_access` WRITE;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` VALUES (0,'group','G2'),(1,'user','U1'),(2,'user','U2'),(1,'group','G1'),(1,'group','G3'),(1,'group','G4'),(1,'group','G2'),(3,'user','U3'),(4,'group','G3'),(4,'group','G4'),(4,'group','G2'),(4,'user','U4');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access_check`
--

DROP TABLE IF EXISTS `b_user_access_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access_check`
--

LOCK TABLES `b_user_access_check` WRITE;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
INSERT INTO `b_user_access_check` VALUES (1,'group'),(1,'user'),(2,'user'),(3,'user'),(4,'group'),(4,'user');
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_auth_action`
--

DROP TABLE IF EXISTS `b_user_auth_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_auth_action`
--

LOCK TABLES `b_user_auth_action` WRITE;
/*!40000 ALTER TABLE `b_user_auth_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_counter`
--

DROP TABLE IF EXISTS `b_user_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_counter`
--

LOCK TABLES `b_user_counter` WRITE;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_digest`
--

DROP TABLE IF EXISTS `b_user_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_digest`
--

LOCK TABLES `b_user_digest` WRITE;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field`
--

DROP TABLE IF EXISTS `b_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field`
--

LOCK TABLES `b_user_field` WRITE;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` VALUES (1,'BLOG_POST','UF_BLOG_POST_DOC','file','UF_BLOG_POST_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(2,'BLOG_COMMENT','UF_BLOG_COMMENT_DOC','file','UF_BLOG_COMMENT_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(3,'BLOG_POST','UF_BLOG_POST_URL_PRV','url_preview','UF_BLOG_POST_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(4,'BLOG_COMMENT','UF_BLOG_COMM_URL_PRV','url_preview','UF_BLOG_COMM_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(5,'BLOG_POST','UF_GRATITUDE','integer','UF_GRATITUDE',100,'N','N','N','N','Y','N','a:0:{}'),(6,'FORUM_MESSAGE','UF_FORUM_MES_URL_PRV','url_preview','UF_FORUM_MES_URL_PRV',100,'N','N','N','N','Y','N','a:0:{}'),(7,'IBLOCK_2_SECTION','UF_NEWS_LINK','iblock_element','',100,'Y','N','N','Y','Y','N','a:5:{s:7:\"DISPLAY\";s:4:\"LIST\";s:11:\"LIST_HEIGHT\";i:5;s:9:\"IBLOCK_ID\";i:1;s:13:\"DEFAULT_VALUE\";s:0:\"\";s:13:\"ACTIVE_FILTER\";s:1:\"N\";}'),(8,'USER','UF_AUTHOR_TYPE','enumeration','',100,'N','N','N','Y','Y','N','a:3:{s:7:\"DISPLAY\";s:4:\"LIST\";s:11:\"LIST_HEIGHT\";i:5;s:16:\"CAPTION_NO_VALUE\";s:0:\"\";}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_confirm`
--

DROP TABLE IF EXISTS `b_user_field_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_confirm`
--

LOCK TABLES `b_user_field_confirm` WRITE;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_enum`
--

DROP TABLE IF EXISTS `b_user_field_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_enum`
--

LOCK TABLES `b_user_field_enum` WRITE;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
INSERT INTO `b_user_field_enum` VALUES (1,8,'группа авторов 1','Y',500,'AUTHOR_GROUP1'),(2,8,'группа авторов 2','N',500,'AUTHOR_GROUP2');
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_lang`
--

DROP TABLE IF EXISTS `b_user_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_lang`
--

LOCK TABLES `b_user_field_lang` WRITE;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
INSERT INTO `b_user_field_lang` VALUES (7,'en','','','','',''),(7,'ru','','','','',''),(8,'en','','','','',''),(8,'ru','','','','','');
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_group`
--

DROP TABLE IF EXISTS `b_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_group`
--

LOCK TABLES `b_user_group` WRITE;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` VALUES (1,1,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(5,3,NULL,NULL),(5,4,NULL,NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_hit_auth`
--

DROP TABLE IF EXISTS `b_user_hit_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_hit_auth`
--

LOCK TABLES `b_user_hit_auth` WRITE;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_index`
--

DROP TABLE IF EXISTS `b_user_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_index`
--

LOCK TABLES `b_user_index` WRITE;
/*!40000 ALTER TABLE `b_user_index` DISABLE KEYS */;
INSERT INTO `b_user_index` VALUES (1,'001','','001 nqzva tznvy pbz nqzva@tznvy.pbz','','','','',''),(2,'002','','002 znantre znantre@znantre.eh','','','','',''),(3,'003','','003 grfg1 znvy grfg1@znvy.eh','','','','',''),(4,'004','','004 grfg2 znvy grfg2@znvy.eh','','','','',''),(5,'005','','005 grfg3 znvy grfg3@znvy.eh','','','','','');
/*!40000 ALTER TABLE `b_user_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_option`
--

DROP TABLE IF EXISTS `b_user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_option`
--

LOCK TABLES `b_user_option` WRITE;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` VALUES (1,0,'main.interface','global','a:1:{s:5:\"theme\";s:9:\"pale-blue\";}','Y'),(2,1,'admin_panel','settings','a:1:{s:4:\"edit\";s:3:\"off\";}','N'),(3,1,'hot_keys','user_defined','b:1;','N'),(5,1,'favorite','favorite_menu','a:1:{s:5:\"stick\";s:1:\"N\";}','N'),(6,1,'main','helper_hero_admin','a:1:{s:4:\"time\";s:10:\"1516703095\";}','N'),(8,1,'admin_menu','pos','a:1:{s:8:\"sections\";s:85:\"iblock_admin,menu_iblock,menu_fileman,menu_system,menu_templates,menu_util,menu_users\";}','N'),(10,1,'main.interface.grid','tbl_iblock_admin_508c75c8507a2ae5223dfd2faeb98122','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(11,1,'main.interface.grid','tbl_iblock_508c75c8507a2ae5223dfd2faeb98122','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(12,1,'filter','tbl_iblock_el_search58b9e6802bd886cf017f9f6a7690f699_filter','a:1:{s:4:\"rows\";s:9:\"IBLOCK_ID\";}','N'),(16,1,'main.interface.grid','tbl_iblock_86024cad1e83101d97359d7351051156','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(19,1,'filter','tbl_iblock_el_search8ea90877d704c35bc04ce409adc81ba5_filter','a:1:{s:4:\"rows\";s:2:\"id\";}','N'),(30,1,'main.interface.grid','tbl_user','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(32,2,'hot_keys','user_defined','b:1;','N'),(33,2,'favorite','favorite_menu','a:1:{s:5:\"stick\";s:1:\"N\";}','N'),(34,2,'main','helper_hero_admin','a:1:{s:4:\"time\";s:10:\"1516014612\";}','N'),(35,2,'admin_panel','settings','a:1:{s:4:\"edit\";s:3:\"off\";}','N'),(50,1,'main.interface.grid','tbl_iblock_admin_86024cad1e83101d97359d7351051156','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(51,1,'html_editor','user_settings_','a:3:{s:4:\"view\";s:7:\"wysiwyg\";s:13:\"taskbar_width\";s:2:\"20\";s:13:\"taskbar_shown\";s:1:\"1\";}','N'),(53,1,'list','tbl_iblock_section_83282f8abe10dba1648858eafb93e3f2','a:4:{s:7:\"columns\";s:44:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,UF_NEWS_LINK\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(54,1,'filter','tbl_iblock_el_search03f62642b8d8e89cef888dd1949b214e_filter','a:1:{s:4:\"rows\";s:2:\"id\";}','N'),(58,3,'hot_keys','user_defined','b:1;','N'),(61,4,'hot_keys','user_defined','b:1;','N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_stored_auth`
--

DROP TABLE IF EXISTS `b_user_stored_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_stored_auth`
--

LOCK TABLES `b_user_stored_auth` WRITE;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_comment`
--

DROP TABLE IF EXISTS `b_utm_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_comment`
--

LOCK TABLES `b_utm_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_post`
--

DROP TABLE IF EXISTS `b_utm_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_post`
--

LOCK TABLES `b_utm_blog_post` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_forum_message`
--

DROP TABLE IF EXISTS `b_utm_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_forum_message`
--

LOCK TABLES `b_utm_forum_message` WRITE;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_iblock_2_section`
--

DROP TABLE IF EXISTS `b_utm_iblock_2_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_iblock_2_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_IBLOCK_2_SECTION_1` (`FIELD_ID`),
  KEY `ix_utm_IBLOCK_2_SECTION_2` (`VALUE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_iblock_2_section`
--

LOCK TABLES `b_utm_iblock_2_section` WRITE;
/*!40000 ALTER TABLE `b_utm_iblock_2_section` DISABLE KEYS */;
INSERT INTO `b_utm_iblock_2_section` VALUES (1,4,7,NULL,2,NULL,NULL),(2,4,7,NULL,3,NULL,NULL),(3,1,7,NULL,2,NULL,NULL),(4,1,7,NULL,3,NULL,NULL),(5,2,7,NULL,1,NULL,NULL),(6,2,7,NULL,2,NULL,NULL),(7,2,7,NULL,3,NULL,NULL),(8,3,7,NULL,1,NULL,NULL),(9,3,7,NULL,2,NULL,NULL);
/*!40000 ALTER TABLE `b_utm_iblock_2_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_user`
--

DROP TABLE IF EXISTS `b_utm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_USER_1` (`FIELD_ID`),
  KEY `ix_utm_USER_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_user`
--

LOCK TABLES `b_utm_user` WRITE;
/*!40000 ALTER TABLE `b_utm_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_comment`
--

DROP TABLE IF EXISTS `b_uts_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_comment`
--

LOCK TABLES `b_uts_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_post`
--

DROP TABLE IF EXISTS `b_uts_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_post`
--

LOCK TABLES `b_uts_blog_post` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_forum_message`
--

DROP TABLE IF EXISTS `b_uts_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_forum_message`
--

LOCK TABLES `b_uts_forum_message` WRITE;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_iblock_2_section`
--

DROP TABLE IF EXISTS `b_uts_iblock_2_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_iblock_2_section` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_NEWS_LINK` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_iblock_2_section`
--

LOCK TABLES `b_uts_iblock_2_section` WRITE;
/*!40000 ALTER TABLE `b_uts_iblock_2_section` DISABLE KEYS */;
INSERT INTO `b_uts_iblock_2_section` VALUES (1,'a:2:{i:0;i:2;i:1;i:3;}'),(2,'a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}'),(3,'a:2:{i:0;i:1;i:1;i:2;}'),(4,'a:2:{i:0;i:2;i:1;i:3;}');
/*!40000 ALTER TABLE `b_uts_iblock_2_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_user`
--

DROP TABLE IF EXISTS `b_uts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_user` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_AUTHOR_TYPE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_user`
--

LOCK TABLES `b_uts_user` WRITE;
/*!40000 ALTER TABLE `b_uts_user` DISABLE KEYS */;
INSERT INTO `b_uts_user` VALUES (1,1),(2,2),(3,1),(4,1),(5,2);
/*!40000 ALTER TABLE `b_uts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote`
--

DROP TABLE IF EXISTS `b_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote`
--

LOCK TABLES `b_vote` WRITE;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_answer`
--

DROP TABLE IF EXISTS `b_vote_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_answer`
--

LOCK TABLES `b_vote_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_attached_object`
--

DROP TABLE IF EXISTS `b_vote_attached_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_attached_object`
--

LOCK TABLES `b_vote_attached_object` WRITE;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel`
--

DROP TABLE IF EXISTS `b_vote_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel`
--

LOCK TABLES `b_vote_channel` WRITE;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_group`
--

DROP TABLE IF EXISTS `b_vote_channel_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_group`
--

LOCK TABLES `b_vote_channel_2_group` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_site`
--

DROP TABLE IF EXISTS `b_vote_channel_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_site`
--

LOCK TABLES `b_vote_channel_2_site` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event`
--

DROP TABLE IF EXISTS `b_vote_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event`
--

LOCK TABLES `b_vote_event` WRITE;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_answer`
--

DROP TABLE IF EXISTS `b_vote_event_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_answer`
--

LOCK TABLES `b_vote_event_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_question`
--

DROP TABLE IF EXISTS `b_vote_event_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_question`
--

LOCK TABLES `b_vote_event_question` WRITE;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_question`
--

DROP TABLE IF EXISTS `b_vote_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_question`
--

LOCK TABLES `b_vote_question` WRITE;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_user`
--

DROP TABLE IF EXISTS `b_vote_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_user`
--

LOCK TABLES `b_vote_user` WRITE;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_xml_tree`
--

DROP TABLE IF EXISTS `b_xml_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_xml_tree`
--

LOCK TABLES `b_xml_tree` WRITE;
/*!40000 ALTER TABLE `b_xml_tree` DISABLE KEYS */;
INSERT INTO `b_xml_tree` VALUES (1,0,1,320,0,'КоммерческаяИнформация',NULL,'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),(2,1,2,67,1,'Классификатор',NULL,NULL),(3,2,3,4,2,'Ид','2',NULL),(4,2,5,6,2,'Наименование','Вакансии',NULL),(5,2,7,64,2,'Свойства',NULL,NULL),(6,5,8,15,3,'Свойство',NULL,NULL),(7,6,9,10,4,'Ид','CML2_ACTIVE',NULL),(8,6,11,12,4,'Наименование','БитриксАктивность',NULL),(9,6,13,14,4,'Множественное','false',NULL),(10,5,16,23,3,'Свойство',NULL,NULL),(11,10,17,18,4,'Ид','CML2_CODE',NULL),(12,10,19,20,4,'Наименование','Символьный код',NULL),(13,10,21,22,4,'Множественное','false',NULL),(14,5,24,31,3,'Свойство',NULL,NULL),(15,14,25,26,4,'Ид','CML2_SORT',NULL),(16,14,27,28,4,'Наименование','Сортировка',NULL),(17,14,29,30,4,'Множественное','false',NULL),(18,5,32,39,3,'Свойство',NULL,NULL),(19,18,33,34,4,'Ид','CML2_ACTIVE_FROM',NULL),(20,18,35,36,4,'Наименование','Начало активности',NULL),(21,18,37,38,4,'Множественное','false',NULL),(22,5,40,47,3,'Свойство',NULL,NULL),(23,22,41,42,4,'Ид','CML2_ACTIVE_TO',NULL),(24,22,43,44,4,'Наименование','Окончание активности',NULL),(25,22,45,46,4,'Множественное','false',NULL),(26,5,48,55,3,'Свойство',NULL,NULL),(27,26,49,50,4,'Ид','CML2_PREVIEW_TEXT',NULL),(28,26,51,52,4,'Наименование','Анонс',NULL),(29,26,53,54,4,'Множественное','false',NULL),(30,5,56,63,3,'Свойство',NULL,NULL),(31,30,57,58,4,'Ид','CML2_PREVIEW_PICTURE',NULL),(32,30,59,60,4,'Наименование','Картинка анонса',NULL),(33,30,61,62,4,'Множественное','false',NULL),(34,2,65,66,2,'Группы',NULL,NULL),(35,1,68,319,1,'Каталог',NULL,NULL),(36,35,69,70,2,'Ид','furniture_vacancies',NULL),(37,35,71,72,2,'ИдКлассификатора','2',NULL),(38,35,73,74,2,'Наименование','Вакансии',NULL),(39,35,75,76,2,'БитриксКод','furniture_vacancies',NULL),(40,35,77,78,2,'БитриксСортировка','500',NULL),(41,35,79,80,2,'БитриксURLСписок','#SITE_DIR#/company/vacancies.php',NULL),(42,35,81,82,2,'БитриксURLДеталь','#SITE_DIR#/company/vacancies.php##ID#',NULL),(43,35,83,84,2,'БитриксURLРаздел',NULL,NULL),(44,35,85,86,2,'БитриксКартинка',NULL,NULL),(45,35,87,88,2,'БитриксИндексироватьЭлементы','true',NULL),(46,35,89,90,2,'БитриксИндексироватьРазделы','false',NULL),(47,35,91,92,2,'БитриксДокументооборот','false',NULL),(48,35,93,154,2,'БитриксПодписи',NULL,NULL),(49,48,94,99,3,'БитриксПодпись',NULL,NULL),(50,49,95,96,4,'Ид','ELEMENT_NAME',NULL),(51,49,97,98,4,'Значение','Вакансия',NULL),(52,48,100,105,3,'БитриксПодпись',NULL,NULL),(53,52,101,102,4,'Ид','ELEMENTS_NAME',NULL),(54,52,103,104,4,'Значение','Вакансии',NULL),(55,48,106,111,3,'БитриксПодпись',NULL,NULL),(56,55,107,108,4,'Ид','ELEMENT_ADD',NULL),(57,55,109,110,4,'Значение','Добавить вакансию',NULL),(58,48,112,117,3,'БитриксПодпись',NULL,NULL),(59,58,113,114,4,'Ид','ELEMENT_EDIT',NULL),(60,58,115,116,4,'Значение','Изменить вакансию',NULL),(61,48,118,123,3,'БитриксПодпись',NULL,NULL),(62,61,119,120,4,'Ид','ELEMENT_DELETE',NULL),(63,61,121,122,4,'Значение','Удалить вакансию',NULL),(64,48,124,129,3,'БитриксПодпись',NULL,NULL),(65,64,125,126,4,'Ид','SECTION_NAME',NULL),(66,64,127,128,4,'Значение','Раздел',NULL),(67,48,130,135,3,'БитриксПодпись',NULL,NULL),(68,67,131,132,4,'Ид','SECTIONS_NAME',NULL),(69,67,133,134,4,'Значение','Разделы',NULL),(70,48,136,141,3,'БитриксПодпись',NULL,NULL),(71,70,137,138,4,'Ид','SECTION_ADD',NULL),(72,70,139,140,4,'Значение','Добавить раздел',NULL),(73,48,142,147,3,'БитриксПодпись',NULL,NULL),(74,73,143,144,4,'Ид','SECTION_EDIT',NULL),(75,73,145,146,4,'Значение','Изменить раздел',NULL),(76,48,148,153,3,'БитриксПодпись',NULL,NULL),(77,76,149,150,4,'Ид','SECTION_DELETE',NULL),(78,76,151,152,4,'Значение','Удалить раздел',NULL),(79,35,155,318,2,'Товары',NULL,NULL),(80,79,156,209,3,'Товар',NULL,NULL),(81,80,157,158,4,'Ид','2',NULL),(82,80,159,160,4,'Наименование','Продавец-дизайнер (кухни)',NULL),(83,80,161,162,4,'БитриксТеги',NULL,NULL),(84,80,163,164,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ',NULL),(85,80,165,208,4,'ЗначенияСвойств',NULL,NULL),(86,85,166,171,5,'ЗначенияСвойства',NULL,NULL),(87,86,167,168,6,'Ид','CML2_ACTIVE',NULL),(88,86,169,170,6,'Значение','true',NULL),(89,85,172,177,5,'ЗначенияСвойства',NULL,NULL),(90,89,173,174,6,'Ид','CML2_CODE',NULL),(91,89,175,176,6,'Значение',NULL,NULL),(92,85,178,183,5,'ЗначенияСвойства',NULL,NULL),(93,92,179,180,6,'Ид','CML2_SORT',NULL),(94,92,181,182,6,'Значение','200',NULL),(95,85,184,189,5,'ЗначенияСвойства',NULL,NULL),(96,95,185,186,6,'Ид','CML2_ACTIVE_FROM',NULL),(97,95,187,188,6,'Значение','2010-05-01 00:00:00',NULL),(98,85,190,195,5,'ЗначенияСвойства',NULL,NULL),(99,98,191,192,6,'Ид','CML2_ACTIVE_TO',NULL),(100,98,193,194,6,'Значение',NULL,NULL),(101,85,196,201,5,'ЗначенияСвойства',NULL,NULL),(102,101,197,198,6,'Ид','CML2_PREVIEW_TEXT',NULL),(103,101,199,200,6,'Значение',NULL,NULL),(104,85,202,207,5,'ЗначенияСвойства',NULL,NULL),(105,104,203,204,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(106,104,205,206,6,'Значение',NULL,NULL),(107,79,210,263,3,'Товар',NULL,NULL),(108,107,211,212,4,'Ид','3',NULL),(109,107,213,214,4,'Наименование','Директор магазина',NULL),(110,107,215,216,4,'БитриксТеги',NULL,NULL),(111,107,217,218,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ',NULL),(112,107,219,262,4,'ЗначенияСвойств',NULL,NULL),(113,112,220,225,5,'ЗначенияСвойства',NULL,NULL),(114,113,221,222,6,'Ид','CML2_ACTIVE',NULL),(115,113,223,224,6,'Значение','true',NULL),(116,112,226,231,5,'ЗначенияСвойства',NULL,NULL),(117,116,227,228,6,'Ид','CML2_CODE',NULL),(118,116,229,230,6,'Значение',NULL,NULL),(119,112,232,237,5,'ЗначенияСвойства',NULL,NULL),(120,119,233,234,6,'Ид','CML2_SORT',NULL),(121,119,235,236,6,'Значение','300',NULL),(122,112,238,243,5,'ЗначенияСвойства',NULL,NULL),(123,122,239,240,6,'Ид','CML2_ACTIVE_FROM',NULL),(124,122,241,242,6,'Значение','2010-05-01 00:00:00',NULL),(125,112,244,249,5,'ЗначенияСвойства',NULL,NULL),(126,125,245,246,6,'Ид','CML2_ACTIVE_TO',NULL),(127,125,247,248,6,'Значение',NULL,NULL),(128,112,250,255,5,'ЗначенияСвойства',NULL,NULL),(129,128,251,252,6,'Ид','CML2_PREVIEW_TEXT',NULL),(130,128,253,254,6,'Значение',NULL,NULL),(131,112,256,261,5,'ЗначенияСвойства',NULL,NULL),(132,131,257,258,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(133,131,259,260,6,'Значение',NULL,NULL),(134,79,264,317,3,'Товар',NULL,NULL),(135,134,265,266,4,'Ид','4',NULL),(136,134,267,268,4,'Наименование','Бухгалтер отдела учета готовой продукции',NULL),(137,134,269,270,4,'БитриксТеги',NULL,NULL),(138,134,271,272,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ',NULL),(139,134,273,316,4,'ЗначенияСвойств',NULL,NULL),(140,139,274,279,5,'ЗначенияСвойства',NULL,NULL),(141,140,275,276,6,'Ид','CML2_ACTIVE',NULL),(142,140,277,278,6,'Значение','true',NULL),(143,139,280,285,5,'ЗначенияСвойства',NULL,NULL),(144,143,281,282,6,'Ид','CML2_CODE',NULL),(145,143,283,284,6,'Значение',NULL,NULL),(146,139,286,291,5,'ЗначенияСвойства',NULL,NULL),(147,146,287,288,6,'Ид','CML2_SORT',NULL),(148,146,289,290,6,'Значение','400',NULL),(149,139,292,297,5,'ЗначенияСвойства',NULL,NULL),(150,149,293,294,6,'Ид','CML2_ACTIVE_FROM',NULL),(151,149,295,296,6,'Значение','2010-05-01 00:00:00',NULL),(152,139,298,303,5,'ЗначенияСвойства',NULL,NULL),(153,152,299,300,6,'Ид','CML2_ACTIVE_TO',NULL),(154,152,301,302,6,'Значение',NULL,NULL),(155,139,304,309,5,'ЗначенияСвойства',NULL,NULL),(156,155,305,306,6,'Ид','CML2_PREVIEW_TEXT',NULL),(157,155,307,308,6,'Значение',NULL,NULL),(158,139,310,315,5,'ЗначенияСвойства',NULL,NULL),(159,158,311,312,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(160,158,313,314,6,'Значение',NULL,NULL),(161,0,30,0,0,'',NULL,NULL),(162,0,31,0,0,'',NULL,NULL),(163,0,32,0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `b_xml_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-23 13:49:51
