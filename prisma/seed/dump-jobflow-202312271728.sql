-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 209.38.176.120    Database: jobflow
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `providerAccountId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `access_token` text COLLATE utf8mb4_unicode_ci,
  `expires_at` int(11) DEFAULT NULL,
  `token_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_token` text COLLATE utf8mb4_unicode_ci,
  `session_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_provider_providerAccountId_key` (`provider`,`providerAccountId`),
  KEY `Account_userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT 'DE',
  `company_id` int(10) unsigned DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_created_foreign` (`user_created`),
  KEY `address_user_updated_foreign` (`user_updated`),
  KEY `address_company_id_foreign` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (2,'draft',NULL,NULL,NULL,NULL,NULL,'ds','223','Germany',3,'la paz');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Careers`
--

DROP TABLE IF EXISTS `Careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Careers` (
  `id` char(36) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `salaryMin` int(11) DEFAULT NULL,
  `salaryMax` int(11) DEFAULT NULL,
  `retrainingWeeks` int(11) DEFAULT NULL,
  `pace` json DEFAULT NULL,
  `format` json DEFAULT NULL,
  `detailsTasks` text,
  `detailsSkills` text,
  `detailsRequirement` text,
  `detailsFuture` text,
  `image` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `careers_name_unique` (`name`),
  KEY `careers_user_created_foreign` (`user_created`),
  KEY `careers_user_updated_foreign` (`user_updated`),
  KEY `careers_image_foreign` (`image`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Careers`
--

LOCK TABLES `Careers` WRITE;
/*!40000 ALTER TABLE `Careers` DISABLE KEYS */;
INSERT INTO `Careers` VALUES ('3bc4c732-759a-448d-a2ef-6f4d84986ab0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:32:10','3673a855-5f81-40c5-a61b-8a2198620107','2023-12-18 16:10:15','UX-Designer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',37000,65000,NULL,'[\"part-time\", \"full-time\"]','[\"online\", \"on-campus\"]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','abc485b3-2e5c-4424-ade6-5f2b04de4c10'),('455554fa-0450-48f0-bae7-692ab3142f62','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 17:00:57',NULL,NULL,'Train Driver','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',40000,80000,12,'[\"full-time\"]','[\"on-campus\"]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','a4059f09-4e43-4381-bd45-9f3c5caa3dc1'),('5a6a3e27-0bb2-4b94-985b-01784a499d9b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 17:02:08',NULL,NULL,'Gardener','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',27000,48000,12,'[\"part-time\", \"full-time\"]','[\"on-campus\"]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','3540d97b-8d9f-4b24-ad3f-1db18b4650d2'),('60949dda-c1d9-41d5-822a-6ff8149d34f9','published',NULL,'9a5584cd-520b-41ea-bc88-417fa620f69f','2023-12-07 07:21:41','3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:07:48','Recruiter','Als Recruiter identifiziert man talentierte Fachkräfte, führt Interviews und gestaltet die Personalbeschaffung für Unternehmen. Man spielt eine Schlüsselrolle bei der Auswahl der besten Mitarbeiter, um das Team zu stärken und zum Unternehmenserfolg beizutragen.',40000,69998,12,'[\"full-time\", \"part-time\"]','[\"online\", \"on campus\"]','<ul>\n<li>Bedarfsanalyse und Anforderungsdefinition</li>\n<li>Entwicklung von Rekrutierungsstrategien</li>\n<li>Durchf&uuml;hrung von Bewerbungsgespr&auml;chen</li>\n<li>Aufbau und Pflege von Bewerberpools</li>\n<li>Zusammenarbeit mit internen Abteilungen und F&uuml;hrungskr&auml;ften</li>\n</ul>','<ul>\n<li>Active Sourcing</li>\n<li>Interviewf&uuml;hrung</li>\n<li>Verhandlungsgeschick</li>\n<li>Teamarbeit</li>\n<li>Zeitmanagement</li>\n</ul>','<ul>\n<li>Abgeschlossenes Studium im Bereich HR oder vergleichbare Qualifikation</li>\n<li>Erfahrung in der Personalbeschaffung</li>\n<li>Kommunikationsst&auml;rke und Empathie</li>\n<li>Kenntnisse im Arbeitsrecht</li>\n<li>Organisationsgeschick</li>\n</ul>','Die Zukunftsaussichten für Recruiter sind vielversprechend, da der Bedarf an qualifizierten Fachkräften weiter steigt. Eine zunehmende Bedeutung von Talentmanagement und die Notwendigkeit, die richtigen Mitarbeiter zu gewinnen, machen den Beruf des Recruiters zu einem Schlüsselakteur im Unternehmenserfolg.','cc71e0b6-a617-4ee2-adc4-22a32b3091b5'),('b3ce54ca-6871-4184-856a-936ded060d35','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 17:00:02','3673a855-5f81-40c5-a61b-8a2198620107','2023-12-22 19:08:33','Web Development','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',37000,65000,12,'[\"part-time\", \"full-time\"]','[\"online\", \"on-campus\"]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','37c31057-7387-452f-bc3b-f0d3252de685'),('f264c709-7205-4278-8005-ba76f83a1a57','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:39:42',NULL,NULL,'Data Analyst','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',37000,65000,12,'[\"part-time\", \"full-time\"]','[\"online\"]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','93b06164-7c13-4d82-aab0-5fd6731ff5c6');
/*!40000 ALTER TABLE `Careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Careers_Courses`
--

DROP TABLE IF EXISTS `Careers_Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Careers_Courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Careers_id` char(36) DEFAULT NULL,
  `Courses_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `careers_courses_courses_id_foreign` (`Courses_id`),
  KEY `careers_courses_careers_id_foreign` (`Careers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Careers_Courses`
--

LOCK TABLES `Careers_Courses` WRITE;
/*!40000 ALTER TABLE `Careers_Courses` DISABLE KEYS */;
INSERT INTO `Careers_Courses` VALUES (1,'3bc4c732-759a-448d-a2ef-6f4d84986ab0',1),(2,'b3ce54ca-6871-4184-856a-936ded060d35',8),(3,'b3ce54ca-6871-4184-856a-936ded060d35',7);
/*!40000 ALTER TABLE `Careers_Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `logo` char(36) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `email_billing` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_user_created_foreign` (`user_created`),
  KEY `companies_user_updated_foreign` (`user_updated`),
  KEY `companies_logo_foreign` (`logo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
INSERT INTO `Companies` VALUES (3,'draft',NULL,NULL,NULL,NULL,NULL,'Test company',NULL,NULL,'training','https://user.com/','user@example.com','vvar');
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `notify_lead_updates` tinyint(1) DEFAULT '1',
  `notify_view_updates` tinyint(1) DEFAULT '1',
  `notify_billing_updates` tinyint(1) DEFAULT '1',
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_user_updated_foreign` (`user_updated`),
  KEY `contact_user_created_foreign` (`user_created`),
  KEY `contact_company_id_foreign` (`company_id`),
  KEY `Contact_userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (2,'draft',NULL,NULL,NULL,NULL,NULL,'Name','last','user@example.com','12345678',3,1,1,1,'3e0fa069-32fd-4102-af10-e230be8dc31f');
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `sponsonrship` tinyint(1) DEFAULT NULL,
  `price` decimal(10,5) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `course_type` json DEFAULT NULL,
  `pace` json DEFAULT NULL,
  `image` char(36) DEFAULT NULL,
  `company` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_created_foreign` (`user_created`),
  KEY `courses_user_updated_foreign` (`user_updated`),
  KEY `courses_image_foreign` (`image`),
  KEY `courses_company_foreign` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (7,'published',NULL,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-22 18:30:12','Web Development Bootcamp 2','Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2',0,9800.00000,'On campus','2023-12-31','[\"apprenticenship\", \"training\"]','[\"part-time\", \"full-time\"]','46b88c3b-3d04-4073-8ada-f27085b0e8ad',3),(8,'published',NULL,NULL,NULL,NULL,NULL,'Web Development Bootcamp','Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.',1,7000.00000,'Remote','2024-01-26','[\"apprenticenship\", \"training\"]','[\"part-time\", \"full-time\"]','f5ab0bb9-9249-444e-8868-820c27976723',3);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EvaluationFormAnswer`
--

DROP TABLE IF EXISTS `EvaluationFormAnswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EvaluationFormAnswer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `question` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `letter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluationformanswer_user_updated_foreign` (`user_updated`),
  KEY `evaluationformanswer_user_created_foreign` (`user_created`),
  KEY `evaluationformanswer_question_foreign` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvaluationFormAnswer`
--

LOCK TABLES `EvaluationFormAnswer` WRITE;
/*!40000 ALTER TABLE `EvaluationFormAnswer` DISABLE KEYS */;
INSERT INTO `EvaluationFormAnswer` VALUES (151,'published',1,NULL,NULL,NULL,NULL,'1',239,'Interact with many, including strangers','E'),(152,'published',2,NULL,NULL,NULL,NULL,'2',239,'Interact with a few, known to you','I'),(153,'published',1,NULL,NULL,NULL,NULL,'1',240,'Realistic than speculative','S'),(154,'published',2,NULL,NULL,NULL,NULL,'2',240,'Speculative than realistic','N'),(155,'published',1,NULL,NULL,NULL,NULL,'1',241,'Have your \"head in the clouds\"','S'),(156,'published',2,NULL,NULL,NULL,NULL,'2',241,'Be \"in a rut\"','N'),(157,'published',1,NULL,NULL,NULL,NULL,'1',242,'Principles','T'),(158,'published',2,NULL,NULL,NULL,NULL,'2',242,'Emotions','F'),(159,'published',1,NULL,NULL,NULL,NULL,'1',243,'Convincing','T'),(160,'published',2,NULL,NULL,NULL,NULL,'2',243,'Touching','F'),(161,'published',1,NULL,NULL,NULL,NULL,'1',244,'To deadlines','J'),(162,'published',2,NULL,NULL,NULL,NULL,'2',244,'Just \"whenever\"','P'),(163,'published',1,NULL,NULL,NULL,NULL,'1',245,'Rather carefully','J'),(164,'published',2,NULL,NULL,NULL,NULL,'2',245,'Somewhat impulsively','P'),(165,'published',1,NULL,NULL,NULL,NULL,'1',246,'Stay late, with increasing energy','E'),(166,'published',2,NULL,NULL,NULL,NULL,'2',246,'Leave early with decreased energy','I'),(167,'published',1,NULL,NULL,NULL,NULL,'1',247,'Sensible people','S'),(168,'published',2,NULL,NULL,NULL,NULL,'2',247,'Imaginative people','N'),(169,'published',1,NULL,NULL,NULL,NULL,'1',248,'What is actual','S'),(170,'published',2,NULL,NULL,NULL,NULL,'2',248,'What is possible','N'),(171,'published',1,NULL,NULL,NULL,NULL,'1',249,'Laws than circumstances','T'),(172,'published',2,NULL,NULL,NULL,NULL,'2',249,'Circumstances than laws','F'),(173,'published',1,NULL,NULL,NULL,NULL,'1',250,'Objective','T'),(174,'published',2,NULL,NULL,NULL,NULL,'2',250,'Personal','F'),(175,'published',1,NULL,NULL,NULL,NULL,'1',251,'Punctual','J'),(176,'published',2,NULL,NULL,NULL,NULL,'2',251,'Leisurely','P'),(177,'published',1,NULL,NULL,NULL,NULL,'1',252,'Incomplete','P'),(178,'published',2,NULL,NULL,NULL,NULL,'2',252,'Completed','J'),(179,'published',1,NULL,NULL,NULL,NULL,'1',253,'Keep abreast of other’s happenings','E'),(180,'published',2,NULL,NULL,NULL,NULL,'2',253,'Get behind on the news','I'),(181,'published',1,NULL,NULL,NULL,NULL,'1',254,'Do it the usual way','S'),(182,'published',2,NULL,NULL,NULL,NULL,'2',254,'Do it your own way','N'),(183,'published',1,NULL,NULL,NULL,NULL,'1',255,'“Say what they mean and mean what they say”','S'),(184,'published',2,NULL,NULL,NULL,NULL,'2',255,'Express things more by use of analogy','N'),(185,'published',1,NULL,NULL,NULL,NULL,'1',256,'Consistency of thought','T'),(186,'published',2,NULL,NULL,NULL,NULL,'2',256,'Harmonious human relationships','F'),(187,'published',1,NULL,NULL,NULL,NULL,'1',257,'Logical judgments','T'),(188,'published',2,NULL,NULL,NULL,NULL,'2',257,'Value judgments','F'),(189,'published',1,NULL,NULL,NULL,NULL,'1',258,'Settled and decided','J'),(190,'published',2,NULL,NULL,NULL,NULL,'2',258,'Unsettled and undecided','P'),(191,'published',1,NULL,NULL,NULL,NULL,'1',259,'Serious and determined','J'),(192,'published',2,NULL,NULL,NULL,NULL,'2',259,'Easy-going','P'),(193,'published',1,NULL,NULL,NULL,NULL,'1',260,'Rarely question that it will all be said','P'),(194,'published',2,NULL,NULL,NULL,NULL,'2',260,'Rehearse what you’ll say','J'),(195,'published',1,NULL,NULL,NULL,NULL,'1',261,'“Speak for themselves”','S'),(196,'published',2,NULL,NULL,NULL,NULL,'2',261,'Illustrate principles','N'),(197,'published',1,NULL,NULL,NULL,NULL,'1',262,'somewhat annoying','S'),(198,'published',2,NULL,NULL,NULL,NULL,'2',262,'rather fascinating','N'),(199,'published',1,NULL,NULL,NULL,NULL,'1',263,'a cool-headed person','T'),(200,'published',2,NULL,NULL,NULL,NULL,'2',263,'a warm-hearted person','F'),(201,'published',1,NULL,NULL,NULL,NULL,'1',264,'unjust','F'),(202,'published',2,NULL,NULL,NULL,NULL,'2',264,'merciless','T'),(203,'published',1,NULL,NULL,NULL,NULL,'1',265,'by careful selection and choice','J'),(204,'published',2,NULL,NULL,NULL,NULL,'2',265,'randomly and by chance','P'),(205,'published',1,NULL,NULL,NULL,NULL,'1',266,'having purchased','J'),(206,'published',2,NULL,NULL,NULL,NULL,'2',266,'having the option to buy','P'),(207,'published',1,NULL,NULL,NULL,NULL,'1',267,'unjust','F'),(208,'published',2,NULL,NULL,NULL,NULL,'2',267,'merciless','T'),(209,'published',1,NULL,NULL,NULL,NULL,'1',268,'by careful selection and choice','J'),(210,'published',2,NULL,NULL,NULL,NULL,'2',268,'randomly and by chance','P'),(211,'published',1,NULL,NULL,NULL,NULL,'1',269,'having purchased','J'),(212,'published',2,NULL,NULL,NULL,NULL,'2',269,'having the option to buy','P'),(213,'published',1,NULL,NULL,NULL,NULL,'1',270,'standards','T'),(214,'published',2,NULL,NULL,NULL,NULL,'2',270,'feelings','F'),(215,'published',1,NULL,NULL,NULL,NULL,'1',271,'firm than gentle','T'),(216,'published',2,NULL,NULL,NULL,NULL,'2',271,'gentle than firm','F'),(217,'published',1,NULL,NULL,NULL,NULL,'1',272,'the ability to organize and be methodical','J'),(218,'published',2,NULL,NULL,NULL,NULL,'2',272,'the ability to adapt and make do','P'),(219,'published',1,NULL,NULL,NULL,NULL,'1',273,'infinite','N'),(220,'published',2,NULL,NULL,NULL,NULL,'2',273,'open-minded','S'),(221,'published',1,NULL,NULL,NULL,NULL,'1',274,'stimulate and energize you','E'),(222,'published',2,NULL,NULL,NULL,NULL,'2',274,'tax your reserves','I'),(223,'published',1,NULL,NULL,NULL,NULL,'1',275,'a practical sort of person','S'),(224,'published',2,NULL,NULL,NULL,NULL,'2',275,'a fanciful sort of person','N'),(225,'published',1,NULL,NULL,NULL,NULL,'1',276,'see how others are useful','T'),(226,'published',2,NULL,NULL,NULL,NULL,'2',276,'see how others see','F'),(227,'published',1,NULL,NULL,NULL,NULL,'1',277,'to discuss an issue thoroughly','T'),(228,'published',2,NULL,NULL,NULL,NULL,'2',277,'to arrive at agreement on an issue','F'),(229,'published',1,NULL,NULL,NULL,NULL,'1',278,'your head','T'),(230,'published',2,NULL,NULL,NULL,NULL,'2',278,'your heart','F'),(231,'published',1,NULL,NULL,NULL,NULL,'1',279,'your head','T'),(232,'published',2,NULL,NULL,NULL,NULL,'2',279,'your heart','F'),(233,'published',1,NULL,NULL,NULL,NULL,'1',280,'contracted','J'),(234,'published',2,NULL,NULL,NULL,NULL,'2',280,'done on a casual basis','P'),(235,'published',1,NULL,NULL,NULL,NULL,'1',281,'the orderly','J'),(236,'published',2,NULL,NULL,NULL,NULL,'2',281,'whatever turns up','P'),(237,'published',1,NULL,NULL,NULL,NULL,'1',282,'the orderly','J'),(238,'published',2,NULL,NULL,NULL,NULL,'2',282,'whatever turns up','P'),(239,'published',1,NULL,NULL,NULL,NULL,'1',283,'many friends with brief contact','E'),(240,'published',2,NULL,NULL,NULL,NULL,'2',283,'a few friends with more lengthy contact','I'),(241,'published',1,NULL,NULL,NULL,NULL,'1',284,'facts','S'),(242,'published',2,NULL,NULL,NULL,NULL,'2',284,'principles','N'),(243,'published',1,NULL,NULL,NULL,NULL,'1',285,'production and distribution','S'),(244,'published',2,NULL,NULL,NULL,NULL,'2',285,'design and research','N'),(245,'published',1,NULL,NULL,NULL,NULL,'1',286,'“There is a very logical person.”','T'),(246,'published',2,NULL,NULL,NULL,NULL,'2',286,'“There is a very sentimental person.”','F'),(247,'published',1,NULL,NULL,NULL,NULL,'1',287,'unwavering','J'),(248,'published',2,NULL,NULL,NULL,NULL,'2',287,'devoted','P'),(249,'published',1,NULL,NULL,NULL,NULL,'1',288,'final and unalterable statement','J'),(250,'published',2,NULL,NULL,NULL,NULL,'2',288,'tentative and preliminary statement','P'),(251,'published',1,NULL,NULL,NULL,NULL,'1',289,'after a decision','J'),(252,'published',2,NULL,NULL,NULL,NULL,'2',289,'before a decision','P'),(253,'published',1,NULL,NULL,NULL,NULL,'1',290,'speak easily and at length with strangers','E'),(254,'published',2,NULL,NULL,NULL,NULL,'2',290,'find little to say to strangers','I'),(255,'published',1,NULL,NULL,NULL,NULL,'1',291,'experience','S'),(256,'published',2,NULL,NULL,NULL,NULL,'2',291,'hunch','N'),(257,'published',1,NULL,NULL,NULL,NULL,'1',292,'more practical than ingenious','S'),(258,'published',2,NULL,NULL,NULL,NULL,'2',292,'more ingenious than practical','N'),(259,'published',1,NULL,NULL,NULL,NULL,'1',293,'clear reason','T'),(260,'published',2,NULL,NULL,NULL,NULL,'2',293,'strong feeling','F'),(261,'published',1,NULL,NULL,NULL,NULL,'1',294,'fair-minded','T'),(262,'published',2,NULL,NULL,NULL,NULL,'2',294,'sympathetic','F'),(263,'published',1,NULL,NULL,NULL,NULL,'1',295,'make sure things are arranged','J'),(264,'published',2,NULL,NULL,NULL,NULL,'2',295,'just let things happen','P'),(265,'published',1,NULL,NULL,NULL,NULL,'1',296,'re-negotiable','P'),(266,'published',2,NULL,NULL,NULL,NULL,'2',296,'random and circumstantial','J'),(267,'published',1,NULL,NULL,NULL,NULL,'1',297,'hasten to get to it first','E'),(268,'published',2,NULL,NULL,NULL,NULL,'2',297,'hope someone else will answer','I'),(269,'published',1,NULL,NULL,NULL,NULL,'1',298,'a strong sense of reality','S'),(270,'published',2,NULL,NULL,NULL,NULL,'2',298,'a vivid imagination','N'),(271,'published',1,NULL,NULL,NULL,NULL,'1',299,'fundamentals','S'),(272,'published',2,NULL,NULL,NULL,NULL,'2',299,'overtones','N'),(273,'published',1,NULL,NULL,NULL,NULL,'1',300,'to be too passionate','F'),(274,'published',2,NULL,NULL,NULL,NULL,'2',300,'to be too objective','T'),(275,'published',1,NULL,NULL,NULL,NULL,'1',301,'hard-headed','T'),(276,'published',2,NULL,NULL,NULL,NULL,'2',301,'soft-hearted','F'),(277,'published',1,NULL,NULL,NULL,NULL,'1',302,'the structured and scheduled','J'),(278,'published',2,NULL,NULL,NULL,NULL,'2',302,'the unstructured and unscheduled','P'),(279,'published',1,NULL,NULL,NULL,NULL,'1',303,'routinized than whimsical','J'),(280,'published',2,NULL,NULL,NULL,NULL,'2',303,'whimsical than routinized','P'),(281,'published',1,NULL,NULL,NULL,NULL,'1',304,'easy to approach','E'),(282,'published',2,NULL,NULL,NULL,NULL,'2',304,'somewhat reserved','I'),(283,'published',1,NULL,NULL,NULL,NULL,'1',305,'the more literal','S'),(284,'published',2,NULL,NULL,NULL,NULL,'2',305,'the more figurative','N'),(285,'published',1,NULL,NULL,NULL,NULL,'1',306,'identify with others','T'),(286,'published',2,NULL,NULL,NULL,NULL,'2',306,'utilize others','F'),(287,'published',1,NULL,NULL,NULL,NULL,'1',307,'clarity of reason','T'),(288,'published',2,NULL,NULL,NULL,NULL,'2',307,'strength of compassion','F'),(289,'published',1,NULL,NULL,NULL,NULL,'1',308,'being indiscriminate','P'),(290,'published',2,NULL,NULL,NULL,NULL,'2',308,'being critical','J'),(291,'published',1,NULL,NULL,NULL,NULL,'1',309,'planned event','J'),(292,'published',2,NULL,NULL,NULL,NULL,'2',309,'unplanned event','P'),(293,'published',1,NULL,NULL,NULL,NULL,'1',310,'deliberate than spontaneous','J'),(294,'published',2,NULL,NULL,NULL,NULL,'2',310,'spontaneous than deliberate','P');
/*!40000 ALTER TABLE `EvaluationFormAnswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EvaluationFormQuestion`
--

DROP TABLE IF EXISTS `EvaluationFormQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EvaluationFormQuestion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `step` int(10) unsigned DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluationformquestion_user_created_foreign` (`user_created`),
  KEY `evaluationformquestion_user_updated_foreign` (`user_updated`),
  KEY `evaluationformquestion_step_foreign` (`step`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvaluationFormQuestion`
--

LOCK TABLES `EvaluationFormQuestion` WRITE;
/*!40000 ALTER TABLE `EvaluationFormQuestion` DISABLE KEYS */;
INSERT INTO `EvaluationFormQuestion` VALUES (1,'published',1,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Was wäre die eine Sache, die ich auf der Welt ändern könnte?','text'),(2,'published',2,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Welche Charakterzüge haben die Menschen, die ich bewundere?','text'),(3,'published',3,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Was fordere ich typischerweise von meinen Mitmenschen ein?','text'),(4,'published',4,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Was würde ich tun, wenn ich nur noch einen Monat zu leben hätte?','text'),(5,'published',5,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Welche Charaktereigenschaft stört mich an anderen?','text'),(6,'published',6,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Wie reagiere ich typischerweise, wenn ich überraschend emotional bin?','text'),(7,'published',7,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',1,'Wie sieht ein perfekter Tag für dich aus?','text'),(8,'published',1,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',2,'Wobei bitten dich Menschen immer um Hilfe?','text'),(9,'published',2,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',2,'Was ist für dich selbstverständlich, was andere aber immer wieder erstaunt?','text'),(10,'published',3,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',2,'Wirst du manchmal ungeduldig, wenn andere etwas bestimmtes machen?','text'),(11,'published',4,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',2,'Welche Tätigkeit ist das?','text'),(12,'published',5,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',2,'Worin war ich als Kind besonders gut, was ich heute nicht mehr von mir behaupten würde?','text'),(13,'published',1,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',3,'Beziehst du aktuell Arbeitslosengeld?','checkbox'),(14,'published',2,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',3,'Bist du aktuell in Kurzarbeit?','checkbox'),(15,'published',3,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',3,'Hast du einen befristeten Arbeitsvertrag?','checkbox'),(16,'published',1,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich würde auch bei Wind und Wetter lieber draußen arbeiten','range'),(17,'published',2,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich wäre für meinen Beruf gerne sehr viel unterwegs','range'),(18,'published',3,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich würde gerne von überall aus arbeiten können','range'),(19,'published',4,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich arbeite lieber für mich alleine als im Team','range'),(20,'published',5,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich lerne im Rahmen meines Berufs gerne immer neue Dinge','range'),(21,'published',6,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich arbeite lieber in einem Start-Up als in einem Konzern','range'),(22,'published',7,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich hätte gerne Kundenkontakt in meinem Beruf','range'),(23,'published',8,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich habe lieber Abwechslung als Routine','range'),(24,'published',9,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 02:11:33',4,'Ich möchte bei der Arbeit anziehen was ich möchte','range'),(239,'published',1,NULL,NULL,NULL,NULL,5,'At a party do you:','mbti'),(240,'published',2,NULL,NULL,NULL,NULL,5,'Are you more:','mbti'),(241,'published',3,NULL,NULL,NULL,NULL,5,'Is it worse to:','mbti'),(242,'published',4,NULL,NULL,NULL,NULL,5,'Are you more impressed by:','mbti'),(243,'published',5,NULL,NULL,NULL,NULL,5,'Are more drawn toward the:','mbti'),(244,'published',6,NULL,NULL,NULL,NULL,5,'Do you prefer to work:','mbti'),(245,'published',7,NULL,NULL,NULL,NULL,5,'Do you tend to choose:','mbti'),(246,'published',8,NULL,NULL,NULL,NULL,5,'At parties do you:','mbti'),(247,'published',9,NULL,NULL,NULL,NULL,5,'Are you more attracted to:','mbti'),(248,'published',10,NULL,NULL,NULL,NULL,5,'Are you more interested in:','mbti'),(249,'published',11,NULL,NULL,NULL,NULL,5,'In judging others are you more swayed by:','mbti'),(250,'published',12,NULL,NULL,NULL,NULL,5,'In approaching others is your inclination to be somewhat:','mbti'),(251,'published',13,NULL,NULL,NULL,NULL,5,'Are you more:','mbti'),(252,'published',14,NULL,NULL,NULL,NULL,5,'Does it bother you more having things:','mbti'),(253,'published',15,NULL,NULL,NULL,NULL,5,'In your social groups do you:','mbti'),(254,'published',16,NULL,NULL,NULL,NULL,5,'In doing ordinary things are you more likely to:','mbti'),(255,'published',17,NULL,NULL,NULL,NULL,5,'Writers should:','mbti'),(256,'published',18,NULL,NULL,NULL,NULL,5,'Which appeals to you more:','mbti'),(257,'published',19,NULL,NULL,NULL,NULL,5,'Are you more comfortable in making:','mbti'),(258,'published',20,NULL,NULL,NULL,NULL,5,'Do you want things:','mbti'),(259,'published',21,NULL,NULL,NULL,NULL,5,'Would you say you are more:','mbti'),(260,'published',22,NULL,NULL,NULL,NULL,5,'In phoning do you:','mbti'),(261,'published',23,NULL,NULL,NULL,NULL,5,'Facts:','mbti'),(262,'published',24,NULL,NULL,NULL,NULL,5,'Are visionaries:','mbti'),(263,'published',25,NULL,NULL,NULL,NULL,5,'Are you more often:','mbti'),(264,'published',26,NULL,NULL,NULL,NULL,5,'Is it worse to be:','mbti'),(265,'published',27,NULL,NULL,NULL,NULL,5,'Should one usually let events occur:','mbti'),(266,'published',28,NULL,NULL,NULL,NULL,5,'Do you feel better about:','mbti'),(267,'published',26,NULL,NULL,NULL,NULL,5,'Is it worse to be:','mbti'),(268,'published',27,NULL,NULL,NULL,NULL,5,'Should one usually let events occur:','mbti'),(269,'published',28,NULL,NULL,NULL,NULL,5,'Do you feel better about:','mbti'),(270,'published',32,NULL,NULL,NULL,NULL,5,'In making decisions do you feel more comfortable with:','mbti'),(271,'published',33,NULL,NULL,NULL,NULL,5,'Are you more:','mbti'),(272,'published',34,NULL,NULL,NULL,NULL,5,'Which is more admirable:','mbti'),(273,'published',35,NULL,NULL,NULL,NULL,5,'Do you put more value on:','mbti'),(274,'published',36,NULL,NULL,NULL,NULL,5,'Does new and non-routine interaction with others:','mbti'),(275,'published',37,NULL,NULL,NULL,NULL,5,'Are you more frequently:','mbti'),(276,'published',38,NULL,NULL,NULL,NULL,5,'Are you more likely to:','mbti'),(277,'published',39,NULL,NULL,NULL,NULL,5,'Which is more satisfying:','mbti'),(278,'published',40,NULL,NULL,NULL,NULL,5,'Which rules you more:','mbti'),(279,'published',40,NULL,NULL,NULL,NULL,5,'Which rules you more:','mbti'),(280,'published',41,NULL,NULL,NULL,NULL,5,'Are you more comfortable with work that is:','mbti'),(281,'published',42,NULL,NULL,NULL,NULL,5,'Do you tend to look for:','mbti'),(282,'published',42,NULL,NULL,NULL,NULL,5,'Do you tend to look for:','mbti'),(283,'published',43,NULL,NULL,NULL,NULL,5,'Do you prefer:','mbti'),(284,'published',44,NULL,NULL,NULL,NULL,5,'Do you go more by:','mbti'),(285,'published',45,NULL,NULL,NULL,NULL,5,'Are you more interested in:','mbti'),(286,'published',46,NULL,NULL,NULL,NULL,5,'Which is more of a compliment:','mbti'),(287,'published',47,NULL,NULL,NULL,NULL,5,'Do you value in yourself more that you are:','mbti'),(288,'published',48,NULL,NULL,NULL,NULL,5,'Do you more often prefer the:','mbti'),(289,'published',49,NULL,NULL,NULL,NULL,5,'Are you more comfortable:','mbti'),(290,'published',50,NULL,NULL,NULL,NULL,5,'Do you:','mbti'),(291,'published',51,NULL,NULL,NULL,NULL,5,'Are you more likely to trust your:','mbti'),(292,'published',52,NULL,NULL,NULL,NULL,5,'Do you feel:','mbti'),(293,'published',53,NULL,NULL,NULL,NULL,5,'Which person is more to be complimented – one of:','mbti'),(294,'published',54,NULL,NULL,NULL,NULL,5,'Are you more inclined to be:','mbti'),(295,'published',55,NULL,NULL,NULL,NULL,5,'Is it preferable mostly to:','mbti'),(296,'published',56,NULL,NULL,NULL,NULL,5,'In relationships should most things be:','mbti'),(297,'published',57,NULL,NULL,NULL,NULL,5,'When the phone rings do you:','mbti'),(298,'published',58,NULL,NULL,NULL,NULL,5,'Do you prize more in yourself:','mbti'),(299,'published',59,NULL,NULL,NULL,NULL,5,'Are you drawn more to:','mbti'),(300,'published',60,NULL,NULL,NULL,NULL,5,'Which seems the greater error:','mbti'),(301,'published',61,NULL,NULL,NULL,NULL,5,'Do you see yourself as basically:','mbti'),(302,'published',62,NULL,NULL,NULL,NULL,5,'Which situation appeals to you more:','mbti'),(303,'published',63,NULL,NULL,NULL,NULL,5,'Are you a person that is more:','mbti'),(304,'published',64,NULL,NULL,NULL,NULL,5,'Are you more inclined to be:','mbti'),(305,'published',65,NULL,NULL,NULL,NULL,5,'In writings do you prefer:','mbti'),(306,'published',66,NULL,NULL,NULL,NULL,5,'Is it harder for you to:','mbti'),(307,'published',67,NULL,NULL,NULL,NULL,5,'Which do you wish more for yourself:','mbti'),(308,'published',68,NULL,NULL,NULL,NULL,5,'Which is the greater fault:','mbti'),(309,'published',69,NULL,NULL,NULL,NULL,5,'Do you prefer the:','mbti'),(310,'published',70,NULL,NULL,NULL,NULL,5,'Do you tend to be more:','mbti');
/*!40000 ALTER TABLE `EvaluationFormQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EvaluationFormStep`
--

DROP TABLE IF EXISTS `EvaluationFormStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EvaluationFormStep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluationformstep_title_unique` (`title`),
  KEY `evaluationformstep_user_created_foreign` (`user_created`),
  KEY `evaluationformstep_user_updated_foreign` (`user_updated`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvaluationFormStep`
--

LOCK TABLES `EvaluationFormStep` WRITE;
/*!40000 ALTER TABLE `EvaluationFormStep` DISABLE KEYS */;
INSERT INTO `EvaluationFormStep` VALUES (1,'draft',1,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-18 01:33:55','3673a855-5f81-40c5-a61b-8a2198620107','2023-11-28 17:38:32','Stärken','Die Fragen dienen dazu, die persönlichen Stärken einer Person aufgrund ihrer eigenen Selbsteinschätzung zu ermitteln und bieten Einblicke in ihre Werthaltung und Vorlieben. Ein Persönlichkeitstest wird zusätzlich verwendet, um die Stärken genauer zu analysieren und ein umfassenderes Bild der individuellen Persönlichkeit zu zeichnen.'),(2,'draft',2,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-28 17:38:36','Persönliche Werte','Unsere Werte sind tief verwurzelte Überzeugungen und Prinzipien, die das Verhalten und die Entscheidungen einer Person leiten. Es ist wichtig, sie zu kennen, da sie als innerer Kompass dienen und helfen,'),(3,'draft',3,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-28 17:38:42','Der ideale Arbeitsrahmen','Ein Arbeitsrahmen, der den eigenen Bedürfnissen entspricht, fördert die persönliche Zufriedenheit und das Wohlbefinden am Arbeitsplatz, da er eine angenehme und produktive Arbeitsumgebung schafft. Bei der Berufswahl ist es wichtig, diesen Rahmen zu berücksichtigen, um sicherzustellen, dass der gewählte Beruf und die Arbeitsbedingungen den individuellen Anforderungen und Vorlieben gerecht werden.'),(4,'draft',4,NULL,NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-28 17:38:46','Finanzierungsmöglichkeiten','Die Fragen zur Prüfung des Anspruchs auf einen Bildungsgutschein dienen dazu, die individuellen Bildungsbedürfnisse und beruflichen Ziele einer Person zu ermitteln. Dies ermöglicht es, festzustellen, ob sie berechtigt ist, staatliche Unterstützung für die Finanzierung ihrer Weiterbildung oder Umschulung zu erhalten.'),(5,'published',5,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-25 04:03:18',NULL,NULL,'Personality','Our values are deeply held beliefs and principles that guide a person\'s behavior and decisions. It is important to know them because they serve as an inner compass and help make authentic decisions that are in line with one\'s beliefs and goals.');
/*!40000 ALTER TABLE `EvaluationFormStep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EvaluationFormUserResponse`
--

DROP TABLE IF EXISTS `EvaluationFormUserResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EvaluationFormUserResponse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `question` int(10) unsigned DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluationformuserresponse_question_foreign` (`question`),
  KEY `EvaluationFormUserResponse_user_idx` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvaluationFormUserResponse`
--

LOCK TABLES `EvaluationFormUserResponse` WRITE;
/*!40000 ALTER TABLE `EvaluationFormUserResponse` DISABLE KEYS */;
INSERT INTO `EvaluationFormUserResponse` VALUES (845,NULL,NULL,239,'1',NULL,'1703697195589'),(846,NULL,NULL,240,'2',NULL,'1703697195589'),(847,NULL,NULL,241,'1',NULL,'1703697195589'),(848,NULL,NULL,242,'1',NULL,'1703697195589'),(849,NULL,NULL,243,'1',NULL,'1703697195589'),(850,NULL,NULL,244,'2',NULL,'1703697195589'),(851,NULL,NULL,245,'1',NULL,'1703697195589'),(852,NULL,NULL,239,'1',NULL,'1703697949025'),(853,NULL,NULL,240,'2',NULL,'1703697949025'),(854,NULL,NULL,241,'1',NULL,'1703697949025'),(855,NULL,NULL,242,'1',NULL,'1703697949025'),(856,NULL,NULL,243,'1',NULL,'1703697949025'),(857,NULL,NULL,244,'1',NULL,'1703697949025'),(858,NULL,NULL,245,'2',NULL,'1703697949025'),(859,NULL,NULL,246,'1',NULL,'1703697949025'),(860,NULL,NULL,247,'2',NULL,'1703697949025'),(861,NULL,NULL,248,'1',NULL,'1703697949025'),(862,NULL,NULL,249,'1',NULL,'1703697949025'),(863,NULL,NULL,250,'1',NULL,'1703697949025'),(864,NULL,NULL,251,'1',NULL,'1703697949025'),(865,NULL,NULL,252,'1',NULL,'1703697949025'),(866,NULL,NULL,253,'1',NULL,'1703697949025'),(867,NULL,NULL,254,'1',NULL,'1703697949025'),(868,NULL,NULL,255,'1',NULL,'1703697949025'),(869,NULL,NULL,256,'1',NULL,'1703697949025'),(870,NULL,NULL,257,'1',NULL,'1703697949025'),(871,NULL,NULL,258,'1',NULL,'1703697949025'),(872,NULL,NULL,259,'1',NULL,'1703697949025'),(873,NULL,NULL,260,'2',NULL,'1703697949025'),(874,NULL,NULL,261,'1',NULL,'1703697949025'),(875,NULL,NULL,262,'1',NULL,'1703697949025'),(876,NULL,NULL,263,'1',NULL,'1703697949025'),(877,NULL,NULL,267,'1',NULL,'1703697949025'),(878,NULL,NULL,264,'1',NULL,'1703697949025'),(879,NULL,NULL,265,'1',NULL,'1703697949025'),(880,NULL,NULL,268,'2',NULL,'1703697949025'),(881,NULL,NULL,266,'1',NULL,'1703697949025'),(882,NULL,NULL,269,'1',NULL,'1703697949025'),(883,NULL,NULL,270,'1',NULL,'1703697949025'),(884,NULL,NULL,271,'1',NULL,'1703697949025'),(885,NULL,NULL,272,'1',NULL,'1703697949025'),(886,NULL,NULL,273,'1',NULL,'1703697949025'),(887,NULL,NULL,274,'1',NULL,'1703697949025'),(888,NULL,NULL,275,'1',NULL,'1703697949025'),(889,NULL,NULL,276,'1',NULL,'1703697949025'),(890,NULL,NULL,277,'1',NULL,'1703697949025'),(891,NULL,NULL,278,'1',NULL,'1703697949025'),(892,NULL,NULL,279,'1',NULL,'1703697949025'),(893,NULL,NULL,280,'1',NULL,'1703697949025'),(894,NULL,NULL,281,'1',NULL,'1703697949025'),(895,NULL,NULL,282,'1',NULL,'1703697949025'),(896,NULL,NULL,283,'1',NULL,'1703697949025'),(897,NULL,NULL,284,'1',NULL,'1703697949025'),(898,NULL,NULL,285,'1',NULL,'1703697949025'),(899,NULL,NULL,286,'1',NULL,'1703697949025'),(900,NULL,NULL,287,'1',NULL,'1703697949025'),(901,NULL,NULL,288,'1',NULL,'1703697949025'),(902,NULL,NULL,289,'1',NULL,'1703697949025'),(903,NULL,NULL,291,'1',NULL,'1703697949025'),(904,NULL,NULL,290,'1',NULL,'1703697949025'),(905,NULL,NULL,293,'1',NULL,'1703697949025'),(906,NULL,NULL,292,'1',NULL,'1703697949025'),(907,NULL,NULL,295,'1',NULL,'1703697949025'),(908,NULL,NULL,296,'1',NULL,'1703697949025'),(909,NULL,NULL,294,'1',NULL,'1703697949025'),(910,NULL,NULL,297,'1',NULL,'1703697949025'),(911,NULL,NULL,298,'1',NULL,'1703697949025'),(912,NULL,NULL,299,'1',NULL,'1703697949025'),(913,NULL,NULL,300,'1',NULL,'1703697949025'),(914,NULL,NULL,301,'1',NULL,'1703697949025'),(915,NULL,NULL,302,'1',NULL,'1703697949025'),(916,NULL,NULL,303,'1',NULL,'1703697949025'),(917,NULL,NULL,304,'1',NULL,'1703697949025'),(918,NULL,NULL,305,'1',NULL,'1703697949025'),(919,NULL,NULL,306,'1',NULL,'1703697949025'),(920,NULL,NULL,307,'1',NULL,'1703697949025'),(921,NULL,NULL,308,'1',NULL,'1703697949025'),(922,NULL,NULL,309,'1',NULL,'1703697949025'),(923,NULL,NULL,310,'1',NULL,'1703697949025'),(924,NULL,NULL,239,'1',NULL,'1703703452365'),(925,NULL,NULL,240,'1',NULL,'1703703452365'),(926,NULL,NULL,241,'1',NULL,'1703703452365'),(927,NULL,NULL,242,'1',NULL,'1703703452365'),(928,NULL,NULL,243,'1',NULL,'1703703452365'),(929,NULL,NULL,244,'1',NULL,'1703703452365'),(930,NULL,NULL,245,'1',NULL,'1703703452365'),(931,NULL,NULL,246,'1',NULL,'1703703452365'),(932,NULL,NULL,247,'1',NULL,'1703703452365'),(933,NULL,NULL,248,'1',NULL,'1703703452365'),(934,NULL,NULL,249,'1',NULL,'1703703452365'),(935,NULL,NULL,250,'1',NULL,'1703703452365'),(936,NULL,NULL,251,'1',NULL,'1703703452365'),(937,NULL,NULL,252,'1',NULL,'1703703452365'),(938,NULL,NULL,253,'1',NULL,'1703703452365'),(939,NULL,NULL,254,'1',NULL,'1703703452365'),(940,NULL,NULL,255,'1',NULL,'1703703452365'),(941,NULL,NULL,256,'1',NULL,'1703703452365'),(942,NULL,NULL,257,'1',NULL,'1703703452365'),(943,NULL,NULL,258,'1',NULL,'1703703452365'),(944,NULL,NULL,259,'1',NULL,'1703703452365'),(945,NULL,NULL,260,'1',NULL,'1703703452365'),(946,NULL,NULL,261,'1',NULL,'1703703452365'),(947,NULL,NULL,262,'1',NULL,'1703703452365'),(948,NULL,NULL,263,'1',NULL,'1703703452365'),(949,NULL,NULL,267,'1',NULL,'1703703452365'),(950,NULL,NULL,264,'1',NULL,'1703703452365'),(951,NULL,NULL,265,'1',NULL,'1703703452365'),(952,NULL,NULL,268,'1',NULL,'1703703452365'),(953,NULL,NULL,266,'1',NULL,'1703703452365'),(954,NULL,NULL,269,'1',NULL,'1703703452365'),(955,NULL,NULL,270,'1',NULL,'1703703452365'),(956,NULL,NULL,271,'1',NULL,'1703703452365'),(957,NULL,NULL,272,'1',NULL,'1703703452365'),(958,NULL,NULL,273,'1',NULL,'1703703452365'),(959,NULL,NULL,274,'1',NULL,'1703703452365'),(960,NULL,NULL,275,'1',NULL,'1703703452365'),(961,NULL,NULL,276,'1',NULL,'1703703452365'),(962,NULL,NULL,277,'1',NULL,'1703703452365'),(963,NULL,NULL,278,'1',NULL,'1703703452365'),(964,NULL,NULL,279,'1',NULL,'1703703452365'),(965,NULL,NULL,280,'1',NULL,'1703703452365'),(966,NULL,NULL,281,'1',NULL,'1703703452365'),(967,NULL,NULL,282,'1',NULL,'1703703452365'),(968,NULL,NULL,283,'1',NULL,'1703703452365'),(969,NULL,NULL,284,'1',NULL,'1703703452365'),(970,NULL,NULL,285,'1',NULL,'1703703452365'),(971,NULL,NULL,286,'1',NULL,'1703703452365'),(972,NULL,NULL,287,'1',NULL,'1703703452365'),(973,NULL,NULL,288,'1',NULL,'1703703452365'),(974,NULL,NULL,289,'1',NULL,'1703703452365'),(975,NULL,NULL,290,'1',NULL,'1703703452365'),(976,NULL,NULL,291,'1',NULL,'1703703452365'),(977,NULL,NULL,292,'1',NULL,'1703703452365'),(978,NULL,NULL,293,'1',NULL,'1703703452365'),(979,NULL,NULL,294,'1',NULL,'1703703452365'),(980,NULL,NULL,295,'1',NULL,'1703703452365'),(981,NULL,NULL,296,'1',NULL,'1703703452365'),(982,NULL,NULL,297,'1',NULL,'1703703452365'),(983,NULL,NULL,298,'1',NULL,'1703703452365'),(984,NULL,NULL,299,'1',NULL,'1703703452365'),(985,NULL,NULL,300,'1',NULL,'1703703452365'),(986,NULL,NULL,301,'1',NULL,'1703703452365'),(987,NULL,NULL,302,'1',NULL,'1703703452365'),(988,NULL,NULL,303,'1',NULL,'1703703452365'),(989,NULL,NULL,304,'1',NULL,'1703703452365'),(990,NULL,NULL,305,'1',NULL,'1703703452365'),(991,NULL,NULL,306,'1',NULL,'1703703452365'),(992,NULL,NULL,307,'1',NULL,'1703703452365'),(993,NULL,NULL,308,'1',NULL,'1703703452365'),(994,NULL,NULL,309,'1',NULL,'1703703452365'),(995,NULL,NULL,310,'1',NULL,'1703703452365'),(996,NULL,NULL,243,'1',NULL,'1702495408091'),(997,NULL,NULL,244,'2',NULL,'1702495408091'),(998,NULL,NULL,239,'2',NULL,'1703712668424'),(999,NULL,NULL,240,'1',NULL,'1703712668424'),(1000,NULL,NULL,241,'1',NULL,'1703712668424'),(1001,NULL,NULL,242,'1',NULL,'1703712668424'),(1002,NULL,NULL,243,'1',NULL,'1703712668424'),(1003,NULL,NULL,244,'1',NULL,'1703712668424'),(1004,NULL,NULL,245,'2',NULL,'1703712668424'),(1005,NULL,NULL,246,'2',NULL,'1703712668424'),(1006,NULL,NULL,247,'2',NULL,'1703712668424'),(1007,NULL,NULL,248,'2',NULL,'1703712668424'),(1008,NULL,NULL,249,'2',NULL,'1703712668424'),(1009,NULL,NULL,250,'1',NULL,'1703712668424'),(1010,NULL,NULL,251,'1',NULL,'1703712668424'),(1011,NULL,NULL,252,'1',NULL,'1703712668424'),(1012,NULL,NULL,253,'2',NULL,'1703712668424'),(1013,NULL,NULL,254,'2',NULL,'1703712668424'),(1014,NULL,NULL,255,'1',NULL,'1703712668424'),(1015,NULL,NULL,256,'1',NULL,'1703712668424'),(1016,NULL,NULL,257,'1',NULL,'1703712668424'),(1017,NULL,NULL,258,'1',NULL,'1703712668424'),(1018,NULL,NULL,259,'1',NULL,'1703712668424'),(1019,NULL,NULL,260,'2',NULL,'1703712668424'),(1020,NULL,NULL,261,'1',NULL,'1703712668424'),(1021,NULL,NULL,262,'1',NULL,'1703712668424'),(1022,NULL,NULL,263,'1',NULL,'1703712668424'),(1023,NULL,NULL,267,'1',NULL,'1703712668424'),(1024,NULL,NULL,264,'1',NULL,'1703712668424'),(1025,NULL,NULL,265,'1',NULL,'1703712668424'),(1026,NULL,NULL,268,'1',NULL,'1703712668424'),(1027,NULL,NULL,266,'1',NULL,'1703712668424'),(1028,NULL,NULL,269,'1',NULL,'1703712668424'),(1029,NULL,NULL,270,'1',NULL,'1703712668424'),(1030,NULL,NULL,271,'1',NULL,'1703712668424'),(1031,NULL,NULL,272,'1',NULL,'1703712668424'),(1032,NULL,NULL,273,'2',NULL,'1703712668424'),(1033,NULL,NULL,274,'2',NULL,'1703712668424'),(1034,NULL,NULL,275,'1',NULL,'1703712668424'),(1035,NULL,NULL,276,'1',NULL,'1703712668424'),(1036,NULL,NULL,277,'2',NULL,'1703712668424'),(1037,NULL,NULL,278,'1',NULL,'1703712668424'),(1038,NULL,NULL,279,'1',NULL,'1703712668424'),(1039,NULL,NULL,280,'1',NULL,'1703712668424'),(1040,NULL,NULL,281,'2',NULL,'1703712668424'),(1041,NULL,NULL,282,'1',NULL,'1703712668424'),(1042,NULL,NULL,283,'2',NULL,'1703712668424'),(1043,NULL,NULL,284,'2',NULL,'1703712668424'),(1044,NULL,NULL,285,'1',NULL,'1703712668424'),(1045,NULL,NULL,286,'1',NULL,'1703712668424'),(1046,NULL,NULL,287,'2',NULL,'1703712668424'),(1047,NULL,NULL,288,'1',NULL,'1703712668424'),(1048,NULL,NULL,289,'1',NULL,'1703712668424'),(1049,NULL,NULL,290,'2',NULL,'1703712668424'),(1050,NULL,NULL,291,'1',NULL,'1703712668424'),(1051,NULL,NULL,292,'1',NULL,'1703712668424'),(1052,NULL,NULL,293,'1',NULL,'1703712668424'),(1053,NULL,NULL,294,'1',NULL,'1703712668424'),(1054,NULL,NULL,295,'1',NULL,'1703712668424'),(1055,NULL,NULL,296,'1',NULL,'1703712668424'),(1056,NULL,NULL,297,'2',NULL,'1703712668424'),(1057,NULL,NULL,298,'1',NULL,'1703712668424'),(1058,NULL,NULL,299,'1',NULL,'1703712668424'),(1059,NULL,NULL,300,'2',NULL,'1703712668424'),(1060,NULL,NULL,301,'1',NULL,'1703712668424'),(1061,NULL,NULL,302,'1',NULL,'1703712668424'),(1062,NULL,NULL,303,'1',NULL,'1703712668424'),(1063,NULL,NULL,304,'2',NULL,'1703712668424'),(1064,NULL,NULL,305,'1',NULL,'1703712668424'),(1065,NULL,NULL,306,'2',NULL,'1703712668424'),(1066,NULL,NULL,307,'1',NULL,'1703712668424'),(1067,NULL,NULL,308,'2',NULL,'1703712668424'),(1068,NULL,NULL,309,'1',NULL,'1703712668424'),(1069,NULL,NULL,310,'1',NULL,'1703712668424'),(1070,NULL,NULL,239,'2',NULL,'1703713088795'),(1071,NULL,NULL,240,'2',NULL,'1703713088795'),(1072,NULL,NULL,241,'1',NULL,'1703713088795'),(1073,NULL,NULL,242,'2',NULL,'1703713088795'),(1074,NULL,NULL,243,'1',NULL,'1703713088795'),(1075,NULL,NULL,244,'2',NULL,'1703713088795'),(1076,NULL,NULL,245,'2',NULL,'1703713088795'),(1077,NULL,NULL,246,'2',NULL,'1703713088795'),(1078,NULL,NULL,247,'2',NULL,'1703713088795'),(1079,NULL,NULL,248,'2',NULL,'1703713088795'),(1080,NULL,NULL,249,'1',NULL,'1703713088795'),(1081,NULL,NULL,250,'2',NULL,'1703713088795'),(1082,NULL,NULL,251,'2',NULL,'1703713088795'),(1083,NULL,NULL,252,'2',NULL,'1703713088795'),(1084,NULL,NULL,253,'1',NULL,'1703713088795'),(1085,NULL,NULL,254,'1',NULL,'1703713088795'),(1086,NULL,NULL,255,'2',NULL,'1703713088795'),(1087,NULL,NULL,245,'1',NULL,'1702495408091'),(1088,NULL,NULL,246,'2',NULL,'1702495408091'),(1089,NULL,NULL,247,'1',NULL,'1702495408091'),(1090,NULL,NULL,256,'1',NULL,'1703713088795'),(1091,NULL,NULL,257,'2',NULL,'1703713088795'),(1092,NULL,NULL,258,'1',NULL,'1703713088795'),(1093,NULL,NULL,259,'2',NULL,'1703713088795'),(1094,NULL,NULL,260,'2',NULL,'1703713088795'),(1095,NULL,NULL,261,'2',NULL,'1703713088795'),(1096,NULL,NULL,262,'1',NULL,'1703713088795'),(1097,NULL,NULL,263,'1',NULL,'1703713088795'),(1098,NULL,NULL,267,'1',NULL,'1703713088795'),(1099,NULL,NULL,264,'1',NULL,'1703713088795'),(1100,NULL,NULL,265,'2',NULL,'1703713088795'),(1101,NULL,NULL,268,'2',NULL,'1703713088795'),(1102,NULL,NULL,266,'2',NULL,'1703713088795'),(1103,NULL,NULL,269,'2',NULL,'1703713088795'),(1104,NULL,NULL,270,'1',NULL,'1703713088795'),(1105,NULL,NULL,271,'2',NULL,'1703713088795'),(1106,NULL,NULL,272,'1',NULL,'1703713088795'),(1107,NULL,NULL,273,'2',NULL,'1703713088795'),(1108,NULL,NULL,274,'2',NULL,'1703713088795'),(1109,NULL,NULL,275,'1',NULL,'1703713088795'),(1110,NULL,NULL,276,'2',NULL,'1703713088795'),(1111,NULL,NULL,277,'2',NULL,'1703713088795'),(1112,NULL,NULL,278,'2',NULL,'1703713088795'),(1113,NULL,NULL,279,'2',NULL,'1703713088795'),(1114,NULL,NULL,280,'1',NULL,'1703713088795'),(1115,NULL,NULL,281,'2',NULL,'1703713088795'),(1116,NULL,NULL,282,'2',NULL,'1703713088795'),(1117,NULL,NULL,283,'2',NULL,'1703713088795'),(1118,NULL,NULL,284,'1',NULL,'1703713088795'),(1119,NULL,NULL,285,'2',NULL,'1703713088795'),(1120,NULL,NULL,286,'2',NULL,'1703713088795'),(1121,NULL,NULL,287,'1',NULL,'1703713088795'),(1122,NULL,NULL,288,'1',NULL,'1703713088795'),(1123,NULL,NULL,289,'1',NULL,'1703713088795'),(1124,NULL,NULL,290,'2',NULL,'1703713088795'),(1125,NULL,NULL,291,'1',NULL,'1703713088795'),(1126,NULL,NULL,292,'2',NULL,'1703713088795'),(1127,NULL,NULL,293,'2',NULL,'1703713088795'),(1128,NULL,NULL,294,'2',NULL,'1703713088795'),(1129,NULL,NULL,295,'2',NULL,'1703713088795'),(1130,NULL,NULL,296,'2',NULL,'1703713088795'),(1131,NULL,NULL,297,'2',NULL,'1703713088795'),(1132,NULL,NULL,298,'2',NULL,'1703713088795'),(1133,NULL,NULL,299,'2',NULL,'1703713088795'),(1134,NULL,NULL,300,'2',NULL,'1703713088795'),(1135,NULL,NULL,301,'2',NULL,'1703713088795'),(1136,NULL,NULL,302,'2',NULL,'1703713088795'),(1137,NULL,NULL,303,'2',NULL,'1703713088795'),(1138,NULL,NULL,304,'2',NULL,'1703713088795'),(1139,NULL,NULL,305,'1',NULL,'1703713088795'),(1140,NULL,NULL,306,'2',NULL,'1703713088795'),(1141,NULL,NULL,307,'1',NULL,'1703713088795'),(1142,NULL,NULL,308,'2',NULL,'1703713088795'),(1143,NULL,NULL,309,'1',NULL,'1703713088795'),(1144,NULL,NULL,310,'2',NULL,'1703713088795');
/*!40000 ALTER TABLE `EvaluationFormUserResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FaqItem`
--

DROP TABLE IF EXISTS `FaqItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FaqItem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  PRIMARY KEY (`id`),
  KEY `faqitem_user_created_foreign` (`user_created`),
  KEY `faqitem_user_updated_foreign` (`user_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FaqItem`
--

LOCK TABLES `FaqItem` WRITE;
/*!40000 ALTER TABLE `FaqItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `FaqItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalityTags`
--

DROP TABLE IF EXISTS `PersonalityTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalityTags` (
  `id` char(36) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personalitytags_name_unique` (`name`),
  KEY `personalitytags_user_created_foreign` (`user_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalityTags`
--

LOCK TABLES `PersonalityTags` WRITE;
/*!40000 ALTER TABLE `PersonalityTags` DISABLE KEYS */;
INSERT INTO `PersonalityTags` VALUES ('022d006a-997c-4e61-aaec-323e54ccc18c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Aufgaben, die organisatorische und analytische Fähigkeiten erfordern'),('030c7704-47ea-48bc-9a68-ddfd0314566a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Zielorientiert'),('044f1557-7eb8-460c-9c37-2d2bd8e25a6f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Innovativ'),('0490fc2c-8009-4f47-81f4-eea9e3df3042','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:20:15','Betonung von klaren Kommunikationsprozessen'),('0523a9de-803a-4972-b564-3ee4c92075b4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Flexibel'),('067a35b9-cef1-4180-87e7-09f9e6c268e3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Raum für spontane und lebhafte Aktivitäten'),('06b325b3-7c9f-4a27-be91-084cb16e601f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegenheit, für Ordnung und Organisation zu sorgen'),('06f49483-3ff3-49c2-9438-6bff02d1838f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betonung von Unabhängigkeit und Selbstständigkeit'),('09075ea1-7bb6-4e0f-86d9-7788efb8e006','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Freiheit zur Entwicklung innovativer Ideen'),('096b6781-f722-445e-9095-a0e7a09c8b0f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Mangelnde Neigung zur umfangreichen Planung und Vorausschau'),('0a4299cc-b6c3-42e3-96d4-5a58c2bd969c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Abneigung gegenüber formalen Prozessen und bürokratischen Aufgaben'),('0b22b078-f954-4072-9f68-4471ee1b04be','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Kommunikativ'),('0b851571-2ed0-4032-90fa-781df88a1ad5','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Empathisch'),('0de908da-79fc-403d-97bf-f2cfd4f05dc9','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegentliche Herausforderungen bei der Teamarbeit, insbesondere in strikt strukturierten Umgebungen'),('0effebd7-774a-45b7-a211-d9e30c31a717','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Organisiert'),('0f7f1c5c-7742-4673-87e9-4852b794b37b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegentliche Zurückhaltung bei der Berücksichtigung von Emotionen in Entscheidungen'),('0fba97d1-2f7f-4142-9672-904145bd67f4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Praktisch'),('109518a1-acb1-43e3-b15a-3b14aa969028','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielle Überempfindlichkeit gegenüber Kritik oder negativem Feedback'),('12940814-5f21-49ba-b92f-c67480aed608','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Unorganisiertheit und Schwierigkeiten bei der Strukturierung von Aufgaben'),('138d96a9-e353-4ac3-b508-c2341b0b1f17','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Betont teamorientierte Rollen'),('13ba716d-4358-4ef7-a94d-7bae08dda0c0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Unterstützt die Umsetzung von sozialen oder humanitären Zielen'),('1465f15a-e193-4195-8fba-83ddcd23f1e1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Raum für spontane Problemlösungen'),('14b67b8c-b7ed-4611-b56c-6b909eee8547','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Mangelnde Geduld bei langwierigen oder abstrakten Aufgaben'),('153a2673-de57-46a1-a46a-5d199c4ff361','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schätzt Rollen, die die Erforschung neuer Ideen und das Lösen komplexer Probleme ermöglichen'),('16a59e8f-952d-4e93-8254-9c9cd4ede07e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Neugierig'),('1722e620-6bd5-43d0-8d9c-a41afb0caaad','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Herausforderungen in der Geduld, insbesondere bei Routineaufgaben'),('18148750-0391-4b23-a78a-55a97e64323f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Kreativ'),('190a930b-e037-4baa-b4a5-70dc85efb5dd','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Schwierigkeiten, Nein zu sagen oder eigene Bedürfnisse auszudrücken'),('1c9d7e3b-42ac-44c3-942d-0e9544ab4d3a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Gelegenheit zur Anwendung von analytischem Denken'),('1d5c5f9f-f3f9-4889-9fe9-1c87dbf9fa83','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betonung von praktischen Fähigkeiten und Fertigkeiten'),('1dbacda5-e056-4462-ab6e-6fd14b7250ce','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Führungspositionen sind verfügbar und geschätzt'),('1ebef036-7789-4374-a324-43dd35e57a99','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betont kreative Selbstentfaltung und praktische Umsetzung von Ideen'),('20436142-7584-4348-97d5-aa8c122a42a2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Fokus auf Effizienz kann zwischenmenschliche Beziehungen beeinträchtigen'),('24df7090-1921-406c-9ff3-eeca8424f07f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Fördert offene Kommunikation und Teamarbeit'),('25a53d4b-5b94-48d9-81a3-bef7c452d999','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betont Kreativität und soziale Interaktion'),('26115232-5250-4001-8725-d90ba42393b1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schwierigkeiten, in konfliktreichen Situationen ruhig zu bleiben'),('263d7db5-c1d7-4c77-9c53-579513f2fb71','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Tendenz zur Unnachgiebigkeit und Beharrlichkeit'),('29bf214a-2bb4-4e75-be28-e3111c92b644','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Bietet Klarheit und Struktur in den Aufgaben'),('2a0d911d-5c79-46ca-bfd9-293bbd50b35b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:18:13','Entscheidungsfreudig'),('2a1edef0-39fc-4fd0-b034-c94e56496b35','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-23 18:33:02','Einfühlsam'),('2bc31a22-fd32-4455-9f93-71ab146c02c3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Herausforderungsorientiert'),('2c5f854d-f199-467c-a7cd-28cdccf8a13c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Ruhig unter Druck'),('2d26b0ec-bf06-46ee-a494-cabdb7f527b6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten bei der Zusammenarbeit mit Personen, die ihren logischen Ansichten nicht folgen'),('2d63ec74-1a6b-4120-bc68-f2361534e045','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielles Überengagement und Überlastung'),('2dd92972-e344-413d-bca1-551e3a006650','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Fördert Zusammenarbeit und Teamarbeit'),('2e4270fd-2445-4485-8d03-322da8178378','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Sozial'),('2f9989bb-abc1-4115-ac43-185a7e5b96a4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Risiko, zu viele Projekte gleichzeitig zu verfolgen'),('302260a1-f29d-4a19-b6df-7363f9eed2c1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Raum für Erkundung sozialer und kultureller Themen'),('3181341c-8ccb-45f8-a45c-5102c1fa0d82','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Aktive Handlungsmöglichkeiten'),('32695a1b-4086-43a1-9a94-a982e2c6415d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Mangelnde Geduld in manchen Situationen'),('33a29fb9-8ae8-4303-bcfd-831607158ab2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Lebhaft'),('35d5f0f7-b3d4-48f4-9ce1-181b0f755e43','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Herausforderungen bei der Einhaltung von Zeitplänen und Deadlines'),('37f0cf8a-7236-4c35-aeb2-86334e753722','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Möglichkeit zur Übernahme von Verantwortung in strukturierten Aufgabenbereichen'),('39da2fe0-18c3-4096-900b-1386feb597a6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gefahr der Überlastung aufgrund von übermäßigem Engagement'),('3a12bdbf-c390-4c82-864f-d572ee6f2042','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Selbstbewusst'),('3a312b4b-cde2-4e89-8c68-cc30ccc02942','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Neigung zur Perfektion und zu hohen Erwartungen an sich selbst'),('3a32fdd1-0d70-49de-92e7-26289e9962ff','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betonung von intellektuellen Herausforderungen und Forschungsfreiheit'),('3abf80c2-c64d-4d17-ad7d-d824e8af704f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzieller Mangel an Geduld bei langsameren Prozessen'),('3bbaa694-282b-4bd5-ac2f-cf6bca516358','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Fürsorglich'),('3cba452e-7cf8-46ad-b600-2c849cca1781','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Risiko von übermäßiger emotionaler Sensibilität und Betroffenheit'),('402d420c-b902-4695-9e74-7394afec8d7b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Zurückhaltung und Introvertiertheit in sozialen Situationen'),('4212b629-1e06-4eee-ba96-ccc0d3d2494c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Herausfordernde Aufgaben, die analytische Fähigkeiten erfordern'),('4328897d-dd2c-43b5-9cfd-c01eb158de19','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Raum für kreative Ausdrucksmöglichkeiten'),('449c4b36-6f8d-4275-bb23-566e7c4971ce','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Unabhängigkeit und Autonomie in der Arbeitsweise'),('450b4f40-c745-4411-bc55-1fb36603f9ad','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Fördert soziale Interaktion'),('45edc877-1eea-4e0b-959c-761b7189a3e7','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Zuverlässig'),('47d2bd4c-19fe-4ccb-b79d-5c1b7e4ad0bb','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Intellektuell herausfordernde Umgebung'),('48a20a54-4685-42b7-8e66-37983d6f4fe6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Unorganisiertheit und Schwierigkeiten bei der Planung und Abstraktion'),('4b514597-2c18-4302-9832-a4c2dfb78700','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Abwechslungsreiche und praktische Herausforderungen'),('4f021f6c-2a8e-4ce4-8065-ee25ab5fa908','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betont soziale Interaktion und kreative Ausdrucksmöglichkeiten'),('4fd2855f-98d8-4346-9c95-cb59e585be79','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Anpassungsfähig'),('50052028-9eb2-4b60-8095-e6a6fa5cd49a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Problemlösungsfähigkeiten'),('506f4d32-a145-491e-8a2d-1554578f2176','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schätzt Visionen und innovative Ideen'),('534e922f-45ac-4e19-b4f2-b993363db1f9','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Ermöglicht Rollen, in denen sie andere inspirieren und motivieren können'),('542cd580-87f1-440b-848a-8fd21540c077','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Unterstützende Umgebung für kreative Entfaltung'),('5697a1dd-8dfa-42fc-b7d4-59de6218dbf5','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Begeisterungsfähig'),('574dd040-8844-4c36-af08-08ebd90e69b8','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Engagiert'),('58dad8d0-149c-43bb-9339-b112924d8978','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Die Möglichkeit, Entscheidungen zu treffen und Verantwortung zu übernehmen'),('59ec9d2b-4e2f-4e35-88aa-0f5bf65918f3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Potenzielle Überforderung aufgrund von Selbstlosigkeit'),('5a400cd1-ad3c-479f-90f6-5520217a2828','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Pragmatisch'),('5a6c4dcb-d122-4299-8182-0fcceabc6817','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Tendenz zur Unnachgiebigkeit und Beharrlichkeit in ihren Ansichten'),('5b305aa6-ea3d-4c6e-8925-69af3851b83f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Teamorientiert'),('5c6c3dfc-f8c2-49e3-9abe-7769d5a9d491','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Förderung von Kreativität und innovativer Lösungsfindung'),('5c77b0f5-8e5b-4bb5-bbc8-b4510e4184c0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Tendenz, zu kritisch gegenüber Abweichungen von festgelegten Regeln zu sein'),('5e5903df-8426-4580-a9b3-be327bb8476d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Unkonventionell'),('5e6f1991-9a35-464d-8c9c-117cceec0abd','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielle Unorganisiertheit und mangelnde Struktur'),('5edc045d-985c-485f-9681-3d3a2ddaa4a1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Strategisches Denken wird gefördert'),('5fe24308-cd3c-411b-8d9f-c4310ef0a6f1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schnelle Denker'),('60141d26-538a-45c2-b91a-4cb97b369455','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Raum für ästhetische und kreative Ausdrucksmöglichkeiten'),('6198b692-b2c1-44b3-ba13-56b6463fb096','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Unabhängig'),('625edcce-691f-4b43-be77-b378894392d3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Entschlossen'),('64235ff5-522e-46ca-ab56-4bd9fc6cd44f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Effizient'),('647bac2d-932e-40c4-bcc0-2dd6cf7e00d7','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Raum für einfühlsame Fähigkeiten und Mitgefühl'),('6498b1ff-1c99-4959-9947-737a4d1946b1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gewissenhaft'),('64b31830-6294-4cac-8e66-3e27d5070515','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Strategisch'),('673bb497-5e08-4c6a-9290-1976b84a4ed4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Positives und dynamisches Arbeitsumfeld'),('68b1fd84-725c-42d2-86be-3e8a2337425b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Herausforderungen bei der Priorisierung von Aufgaben und Zeitmanagement'),('6988f5b4-61a4-4bfb-b75c-a517f82a5002','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Risiko von mangelnder Zielorientierung und mangelnder Fokussierung auf langfristige Ziele'),('6ba72ef7-e03f-4d80-9351-a7ae304aa685','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Analytisch'),('6c8a15ca-9bdb-4b5f-998d-a1c99d3aaa26','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Handlungsorientiert'),('6d80db06-32a0-488d-be2d-8e8a7cd84a06','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Rollen, die fürsorgliches Handeln ermöglichen'),('6e9e650d-3c22-4400-a95e-425157c5e4d0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Ein ruhiges und effizientes Arbeitsumfeld'),('717f4470-ecf9-47bd-9d3c-955efaa162b4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Führungsfähigkeiten'),('71e60258-38f6-4333-abbc-d7dac42da5f8','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Raum für intellektuelle Stimulation'),('77cff907-ccff-4aee-8527-c3efcc7c8d3e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten bei der Anpassung an neue oder unerwartete Situationen'),('783cd4e5-dd5c-4f90-afff-b11f468c41a9','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Spontan'),('787ed862-b78e-4993-9595-69b1543a7f39','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Mögliche Überempfindlichkeit gegenüber Kritik'),('78d27760-c50f-4ad0-92bf-cbf88535c16b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betonung von Werten und sozialen Anliegen in der Arbeit'),('7ab7b16d-23e6-4b7d-8d9f-71ca85adae10','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko, die eigenen Bedürfnisse zugunsten anderer zu vernachlässigen'),('7d1ab58d-f441-41c9-b7b5-83c8f1c65bd2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Übermäßige Skepsis gegenüber unkonventionellen Ideen'),('80b4c2e8-2cc5-4c5d-befc-6cb2e9a07c35','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:20:43','Geschätzte Organisation und Ordnung'),('81d90fe7-e1c8-4a60-8efe-10a3ee037723','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schätzt Rollen, die handlungsorientiert und pragmatisch sind'),('84298e89-b84d-4e6f-9fc5-cbb3451c6588','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielle Impulsivität bei Entscheidungen und Aktionen'),('8511e19a-486a-45ff-812f-ed69518317f4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Strukturiert'),('85789116-6ecd-449a-b227-452d40d4d0ae','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko von Ablenkung und Unfokus'),('8603838a-b28c-4f5d-b9a1-1dcee224a33d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Herausforderungen in der sozialen Interaktion und Zurückhaltung in zwischenmenschlichen Situationen'),('88480d8a-5024-4913-9fe9-248727411ad0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Mangelnde Geduld bei langwierigen oder routinemäßigen Aufgaben'),('88a0087e-3a8f-4483-b19a-f0a89a0539f7','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Neigung zum Perfektionismus und hohen Ansprüchen an sich selbst'),('8933dd59-90f6-45b3-acdd-e0b6ba27d9e3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schätzt Rollen, die ihre kreativen Fähigkeiten nutzen und innovative Ideen fördern'),('8ad238bd-9660-4c2a-94bc-163924479e8a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Risiko von Impulsivität und schnellem Handeln ohne ausreichende Überlegung'),('8b0df081-5f62-4091-a1c4-e3ca769145cf','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Gelegentliche Ungeduld in Bezug auf langwierige Prozesse oder Abwesenheit von sofortigen Ergebnissen'),('8d6acaf8-696d-42c2-83a7-1d69bd77daa0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko, soziale Interaktionen aufgrund von Fokus auf Aufgaben zu vernachlässigen'),('8d7ed975-9cc2-4f59-82d4-b88f2f150ab9','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko von übermäßigem Risiko oder Unvorsichtigkeit'),('8f4b7391-ae2d-4fbf-a2d9-744bcc0e1230','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schätzt Rollen, die die Nutzung ihrer kreativen Fähigkeiten ermöglichen'),('8f79dda7-80dc-414b-9555-25ca172cf3b4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Loyal'),('908d343e-539a-42d6-8c5f-663bf33fd941','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Geschickte Problemlösung'),('9128ea6f-6973-4810-b3af-a4998adab207','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Klare, anspruchsvolle Ziele'),('93eaae36-6240-4d0c-93c5-047dc123cd92','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Gelegentliche Schwierigkeiten bei der Einhaltung von Zeitplänen und Deadlines'),('9425b259-bc03-460a-ac9e-29e4bd52290f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Herausforderungen bei der effektiven sozialen Kommunikation und zwischenmenschlichen Beziehungen'),('9471b1ca-50c5-4daf-8163-1e809c78aed2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Flexibilität und Unkonventionalität in der Herangehensweise'),('9b2f499e-f7df-4506-9757-a2ce9a90eb80','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Zielstrebig'),('9cd48f03-e33c-41fa-8194-7e34311f4e46','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Einfallsreich'),('9d96d8a2-aaaf-4b2c-84d7-bcf4b09d40db','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko, sich zu sehr auf die Bedürfnisse anderer zu konzentrieren und die eigenen zu vernachlässigen'),('9dfbd995-fec9-4f6f-9481-af5904628d45','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Klare Erwartungen und Strukturen'),('9e1aff01-0dca-4944-a8c0-666efd250fd1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Mögliche Zurückhaltung bei der Konfliktbewältigung'),('a1485b22-a214-4152-b536-9ca4b62eb7ea','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:20:02','Verantwortungsvolle Positionen und Aufgaben'),('a28b1241-ab48-49ef-a8f1-be1394bc0392','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betonung von praktischen Umsetzungsmöglichkeiten von Projekten und Ideen'),('a4f7213a-5a71-4d43-ac0f-3610b9136914','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielle Sturheit und Widerstand gegen Veränderungen'),('a9341e98-3ab3-4869-8153-f23782904e18','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schätzt Rollen, die ihre ästhetischen und kreativen Fähigkeiten nutzen'),('aa041e3f-38cf-416f-b21f-a3cd8d8cbc26','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Neigung zu einer kritischen Selbstwahrnehmung'),('aa39317c-beaa-4ca1-a8ee-45a93390272f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Ungeduld, insbesondere in Bezug auf langwierige oder abstrakte Aufgaben'),('ac6ba47a-756d-448d-b908-77436793cb0f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betont zwischenmenschliche Beziehungen und Harmonie'),('ae6ae6fc-0d40-4bc6-8602-43458689e885','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegentliche Ungeduld in Bezug auf langwierige Prozesse'),('ae75d8f7-d306-45cb-9a3e-5c4d7d0e86ae','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten, die Aufmerksamkeit auf detailorientierte oder repetitive Aufgaben zu richten'),('af8beaa0-5260-43b7-90c4-f4a470a6b0c2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten bei der langfristigen Planung oder strategischen Ausrichtung'),('afaf75ea-61a7-4833-9c70-7696b8220c4f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Intellektuell'),('b26fa603-a532-459d-a30d-bd69ff4ada45','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betonung von analytischen Fähigkeiten und kreativer Denkweise'),('b356cd95-4464-409c-a90d-4c4d7d1df13a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Risiko von fehlender Zielorientierung und mangelnder Fähigkeit, sich auf Routineaufgaben zu konzentrieren'),('b716dfcf-c8e3-4eac-8c66-65438261644a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Tendenz zum Perfektionismus und hohen Ansprüchen an sich selbst'),('b78ccd00-5cb5-4efb-9fd4-e36d7e785660','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Gelegentliche Schwierigkeiten in der Teamarbeit, insbesondere in hochstrukturierten Umgebungen'),('b7a05b86-ba51-453e-b05b-8ee592e72bcc','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schönheitssinn'),('b7aac0f7-4b81-44b4-9584-e397cc8cb607','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Bietet klare Erwartungen und Strukturen'),('b7cf3bdb-d18e-4602-8e46-70a33b214e9c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Werteorientiert'),('b966e39c-465b-4303-955c-9d25063ec2a6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Möglichkeit zur Teamarbeit und zum Teilen von Begeisterung'),('ba6ca803-1fd4-47f6-857c-f78c0656a3c6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betont intellektuelle Herausforderungen und unabhängige Forschung'),('bbdebb8f-ee1f-4f84-8289-e095ea7e0c2d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betont kreative Selbstentfaltung und Ausdrucksfreiheit'),('be799d69-3582-4bb7-9677-811a084cb60e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Unorganisiertheit und Herausforderungen bei der Priorisierung von Aufgaben'),('c09f073b-cc0c-4409-990f-3ad75e8e616a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten bei der Entwicklung langfristiger Pläne oder Strategien'),('c25fb9f6-3e33-4cfc-ad9b-106ff008412e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risikobereit'),('c3c1decb-4150-48db-9f02-fd425bf0a711','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Förderung von sozialen Beziehungen und zwischenmenschlicher Interaktion'),('c5803af5-af88-461a-a1bc-c6dd8f717637','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Visionär'),('c66b3700-71a5-4da8-8d7f-da5c14f654fa','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Potenzielle Schwierigkeiten in der Zusammenarbeit mit Personen, die ihren Ansichten nicht folgen'),('c72088a4-bef3-4c22-9892-233da87a4d0c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Betont soziale Interaktion und zwischenmenschliche Beziehungen'),('c86f9569-726e-44a2-9f10-6abb3c656e0c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-23 18:35:22','Energetisch'),('c88ed64c-6c18-47d9-8004-4ba9af00f5f0','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Möglichkeit zur strategischen Planung und Analyse'),('c9f670b2-f9f3-4485-9f8b-6f0679dac24c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Klare Regeln und Strukturen'),('cac9de5a-1210-4e36-82bc-43becb062574','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Unterstützende und teamorientierte Arbeitsatmosphäre'),('cb432821-2c9b-48f5-829e-c6be96aca4a2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Potenzielle Impulsivität bei Entscheidungen und Handlungen'),('cc5ee5ee-8342-4caf-98ba-0c7379ddd0ac','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betonung von praktischen Fähigkeiten und praktischer Anwendung'),('ce601e93-0145-40cd-92a8-b53d9008350e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Tendenz zur Zurückhaltung bei der Konfliktbewältigung'),('cfb57c1c-741f-45ea-9b6d-d50b30886f7e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:17:28','Klare Strukturen und Hierarchien'),('d0bfc746-24f8-4b99-86b9-4c2ccb5ca3d3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betont Kreativität und soziale Verantwortung'),('d12b02a8-58d7-4733-acfc-3b4f4def51b2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Umgebung, die ihre Ideen und Begeisterung unterstützt'),('d4db2f75-734d-4937-a155-6f13395d60ae','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:20:30','Effiziente Arbeitsumgebung'),('da6bb429-31cb-4ef8-b048-0ca857928427','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schafft eine unterstützende Umgebung für persönliche Entwicklung'),('daef2eaf-1c01-4670-aa78-5700f55217f4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Risiko, soziale Interaktionen zugunsten von Unabhängigkeit zu vernachlässigen'),('de1f421d-abe2-45cc-bb9c-c5f72decc1ab','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Logisch'),('dee3a9ef-aab4-466e-820c-cf0da1ba8242','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Neigung zur Vermeidung von Routineaufgaben'),('dfb13100-333c-40a0-9e61-2f5e5d069aaa','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Inspirierend'),('e0794d64-8dae-488f-bfda-9ce21d9b30a9','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Präzise'),('e1cf783b-0b12-4434-9643-ea5f1fb20a7e','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Kulturell bewusst'),('e20ae554-2b13-4fdb-b641-dc63fd7b0cc6','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegentliche Herausforderungen bei der Detailarbeit oder analytischen Aufgaben'),('e37b0d0f-d1bc-4c91-b446-6b6aca4c8ae4','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Gelegentliche Herausforderungen in Bezug auf Teamarbeit und Zusammenarbeit, insbesondere in emotionalen oder kreativen Kontexten'),('e3ba3285-b8cf-448c-9baf-e55117acf191','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Schwierigkeiten, Emotionen auszudrücken oder in sozialen Situationen sensibel zu sein'),('e3e1e44d-4929-454c-ad77-9158915a984b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:21:08','Neigung zur Überarbeitung'),('e54c6df0-d526-4844-844c-d785a8bab274','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schätzt Rollen, die ihre Lebendigkeit und soziale Fähigkeiten nutzen'),('e702608d-7a5c-456c-ac63-dff39f7272ae','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:42','Schafft ein unterstützendes und zwischenmenschliches Umfeld'),('e7f435e2-bc6e-4f23-87d9-a4a3e8c6f0e1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Raum für komplexe Problemlösung und Innovationsentwicklung'),('e93065d0-f09a-4b64-ac00-4b6876f86df1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:21:51','Potenzielle Schwierigkeiten, mit weniger strukturierten oder hierarchischen Arbeitsumgebungen umzugehen'),('e9479665-d1f6-44a9-9c28-162771eb26b3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schwierigkeiten bei der Ausdrucksweise von Kritik'),('ed4163ca-f1c7-4540-9e0b-d62832f35ae3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Betont praktische Herausforderungen und Anwendung handwerklicher Fähigkeiten'),('edc5714a-3669-4410-8659-af3ae04b3375','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Verantwortungsbewusst'),('eeeb6bad-759d-48e5-aad2-24521ff42af5','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:21:38','Widerstand gegen spontane Veränderungen'),('f1eebba0-8b26-44d8-87ba-39237c6cfff3','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Gelegentliche Überforderung aufgrund des Engagements für soziale oder humanitäre Zwecke'),('f274c029-ca14-4abb-899e-e4fcf846616f','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Potenzielle Unorganisiertheit und mangelnde Geduld bei langwierigen Aufgaben'),('f2d5202e-a409-4c4d-8521-72355ebb043c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Schnelle und dynamische Arbeitsumgebung'),('f3fc8f75-9511-461e-800a-e61e5a48507a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Ästhetisch'),('f55fcf87-a03d-4d93-8d7f-18fbd07fbdb2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:44','Raum für praktische Problemlösung und Umsetzung von Lösungen in der Praxis'),('f5fd5156-aff9-456c-ab05-9f89eb72cde2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:21:31','Schwierigkeiten in unstrukturierten oder kreativen Umgebungen'),('f60297cc-db99-44b4-b038-1e86f9343741','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:17:28','Tendenz zur Sturheit und Unflexibilität'),('f69c58ad-7bf9-4505-873e-9dc8a12f881d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Betonung von Präzision und Genauigkeit'),('f803064e-0c09-4de9-8f75-80892ca67049','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:08:43','Freiheit, eigene Visionen und Ideen zu verfolgen');
/*!40000 ALTER TABLE `PersonalityTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profile`
--

DROP TABLE IF EXISTS `Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profile` (
  `id` char(36) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `personality` char(36) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `userId` varchar(191) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `evaluation_response` text,
  `avatar` char(36) DEFAULT NULL,
  `country` varchar(255) DEFAULT 'DE',
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_uid_unique` (`uid`),
  KEY `profile_user_created_foreign` (`user_created`),
  KEY `profile_user_updated_foreign` (`user_updated`),
  KEY `profile_personality_foreign` (`personality`),
  KEY `Profile_userId_idx` (`userId`),
  KEY `profile_avatar_foreign` (`avatar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
INSERT INTO `Profile` VALUES ('6efbc44d-4d04-4d51-b2d8-326043e5419d','published',NULL,NULL,NULL,NULL,NULL,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994',NULL,NULL,'1703697949025','{\"careers\":[{\"career\":\"UX-Designer\",\"rating\":80,\"uid\":\"3bc4c732-759a-448d-a2ef-6f4d84986ab0\"},{\"career\":\"Train Driver\",\"rating\":70,\"uid\":\"455554fa-0450-48f0-bae7-692ab3142f62\"},{\"career\":\"Gardener\",\"rating\":60,\"uid\":\"5a6a3e27-0bb2-4b94-985b-01784a499d9b\"},{\"career\":\"Recruiter\",\"rating\":50,\"uid\":\"60949dda-c1d9-41d5-822a-6ff8149d34f9\"},{\"career\":\"Web Development\",\"rating\":70,\"uid\":\"b3ce54ca-6871-4184-856a-936ded060d35\"},{\"career\":\"Data Analyst\",\"rating\":80,\"uid\":\"f264c709-7205-4278-8005-ba76f83a1a57\"}]}',NULL,'DE',NULL);
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prototypes`
--

DROP TABLE IF EXISTS `Prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prototypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `completed` tinyint(1) DEFAULT '0',
  `image` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prototypes_image_foreign` (`image`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prototypes`
--

LOCK TABLES `Prototypes` WRITE;
/*!40000 ALTER TABLE `Prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuizzResource`
--

DROP TABLE IF EXISTS `QuizzResource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuizzResource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `quiz_id` int(10) unsigned DEFAULT NULL,
  `description` text,
  `file` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzresource_user_created_foreign` (`user_created`),
  KEY `quizzresource_user_updated_foreign` (`user_updated`),
  KEY `quizzresource_quiz_id_foreign` (`quiz_id`),
  KEY `quizzresource_file_foreign` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuizzResource`
--

LOCK TABLES `QuizzResource` WRITE;
/*!40000 ALTER TABLE `QuizzResource` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuizzResource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quizzes`
--

DROP TABLE IF EXISTS `Quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `description` text,
  `image` char(36) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_user_created_foreign` (`user_created`),
  KEY `quizzes_user_updated_foreign` (`user_updated`),
  KEY `quizzes_image_foreign` (`image`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quizzes`
--

LOCK TABLES `Quizzes` WRITE;
/*!40000 ALTER TABLE `Quizzes` DISABLE KEYS */;
INSERT INTO `Quizzes` VALUES (1,'published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-18 16:30:51',NULL,NULL,'The main task of a UX designer is to develop a good product, such as a website, app or software - which is easy to use lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus metus quis lorem.','f55a591a-3c99-4a8f-8991-2a99158ae3bf','01:30:00','HTML für Einsteiger');
/*!40000 ALTER TABLE `Quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Session` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sessionToken` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Session_sessionToken_key` (`sessionToken`),
  KEY `Session_userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailVerified` datetime(3) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `profileId` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_career_updates` tinyint(1) DEFAULT '1',
  `notify_training_updates` tinyint(1) DEFAULT '1',
  `evaluationCompleted` tinyint(1) DEFAULT NULL,
  `premium` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`),
  KEY `User_profileId_idx` (`profileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('3e0fa069-32fd-4102-af10-e230be8dc31f','Test company','$2a$12$QWN8pq2AuSDRfE40DC8E0.wxaGIzjT1TGRnUZrwJOxgSk465E7QAK','user@example.com',NULL,NULL,'2023-12-22 00:42:58.383','2023-12-22 00:42:58.383','6efbc44d-4d04-4d51-b2d8-326043e5419d',1,1,NULL,NULL),('9acd932c-a8cc-4ea3-ae13-405ce2f079ab','sdfsdf','$2a$12$rPSt0kO3bemffMSGaBXQE.8Oo6.Nzg.WqChOErp89.IwnBouKQDJq','dsfsdf@sdsdsd.copm',NULL,NULL,'2023-12-27 18:15:36.830','2023-12-27 18:15:36.830',NULL,1,1,NULL,NULL),('b3b836dc-42a3-41f6-a27f-e0489083c7cf','Jjj','$2a$12$FzFXDKtxUoXaY4R/B28TY.nOOjQPV07h4eBAEpmdGYpap90Pki2Z2','aaaa@guluarte.com',NULL,NULL,'2023-12-27 21:36:02.757','2023-12-27 21:36:02.757',NULL,1,1,NULL,1),('e67db379-aa58-4c22-ac24-fcc01e5dcf64','marcel reperich','$2a$12$BuWxg3cdGakM8REyPBVAJep/Y4Dbt0A2lMO1cbb2Q/6jzgvkaVePC','be-vent@hotmail.com',NULL,NULL,'2023-12-07 06:31:13.595','2023-12-07 06:31:13.595',NULL,1,1,NULL,NULL),('e8e6bab6-1eed-4c48-9949-69cb706027aa','vdsfsdf','$2a$12$Wl0a7vzoN67hGlw/Mwll0uqcDrvnWpUi7bGfzXxoamqCRLwXXiRTu','casdsfdsf@guluarte.com',NULL,NULL,'2023-12-27 18:30:28.645','2023-12-27 18:30:28.645',NULL,1,1,NULL,1),('ea189423-1b18-49d1-9a31-fd10ecc29f72','Jos Quintero','$2a$12$EaQjOdlahqiihiZk.TP/heZRQbV2XhJcfChLIQJgx3bwb9ROTxKQW','jossquintero@gmail.com',NULL,NULL,'2023-12-27 23:24:34.866','2023-12-27 23:24:34.866',NULL,1,1,NULL,1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPersonality`
--

DROP TABLE IF EXISTS `UserPersonality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserPersonality` (
  `id` char(36) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `you_at_work` text,
  `strengths_summary` text,
  `communications_skills` text,
  `leadership` text,
  `teamwork` text,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpersonality_name_unique` (`name`),
  KEY `userpersonality_user_created_foreign` (`user_created`),
  KEY `userpersonality_user_updated_foreign` (`user_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPersonality`
--

LOCK TABLES `UserPersonality` WRITE;
/*!40000 ALTER TABLE `UserPersonality` DISABLE KEYS */;
INSERT INTO `UserPersonality` VALUES ('0f64aed3-86e6-4ae3-a57c-12e93d0c5241','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als strategischer Denker und unabhängiger Problemlöser aus. Du bevorzugst klare Ziele und die effiziente Umsetzung von Projekten. Dein Arbeitsstil ist geprägt von Analyse, Innovation und Fokussierung auf langfristige Ziele.','Deine Stärken liegen in deinem strategischen Denken und deiner Fähigkeit, komplexe Probleme zu analysieren und innovative Lösungen zu finden. Du arbeitest äußerst eigenständig und verfolgst Ziele konsequent. Deine Fähigkeit, Visionen zu entwickeln und sie in die Realität umzusetzen, zeichnet dich aus.','Du kommunizierst in der Regel klar und präzise, bevorzugst jedoch oft sachliche und logische Argumentation. Dies kann dazu führen, dass du als zu direkt oder autoritär wahrgenommen wirst. Du schätzt klare und logische Kommunikation.','Als Führungskraft setzt du klare Ziele und ermutigst dein Team, diese zu erreichen. Du förderst kreatives Denken und strategisches Vorgehen. Dein Führungsstil ist von Zielorientierung und Effizienz geprägt.','Im Team bringst du analytische Fähigkeiten und strategisches Denken ein. Du trägst dazu bei, die Effizienz zu steigern und innovative Lösungen zu entwickeln. Deine Teammitglieder schätzen deine Fähigkeit, klare Ziele zu setzen und komplexe Probleme zu lösen.','INTJ'),('2c2a6c36-cef5-441a-a94b-e0418009e94a','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als sozialer und fürsorglicher Mitarbeiter aus. Du legst Wert auf Harmonie und zwischenmenschliche Beziehungen. Deine Stärken liegen in deinem Talent, Teams zu organisieren und für eine positive Arbeitsatmosphäre zu sorgen.','Deine Stärken liegen in deinem ausgeprägten sozialen Geschick und deiner Fähigkeit, gut mit anderen zusammenzuarbeiten. Du bist fürsorglich und unterstützend, und du sorgst dafür, dass die Bedürfnisse deiner Kollegen und Teammitglieder beachtet werden. Dein organisatorisches Talent und deine Kommunikationsfähigkeiten zeichnen dich aus.','Du kommunizierst einfühlsam und unterstützend, wobei du Konfrontationen oft meidest. Du legst Wert auf offene Kommunikation und harmonische Beziehungen. Du schaffst eine positive Atmosphäre durch deine kommunikativen Fähigkeiten.','Als Führungskraft förderst du Teamarbeit und zwischenmenschliche Beziehungen. Du setzt dich für das Wohl deiner Teammitglieder ein und sorgst dafür, dass ihre Bedürfnisse erfüllt werden. Dein Führungsstil ist von Fürsorglichkeit und Unterstützung geprägt.','Im Team bist du ein kooperativer Teamplayer. Du trägst dazu bei, eine harmonische Teamdynamik aufrechtzuerhalten und förderst die Zusammenarbeit aller Mitglieder. Deine Teammitglieder schätzen deine Unterstützung und soziale Kompetenz.','ESFJ'),('42e80925-46d9-4d68-af06-eb63c911e996','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als einfühlsamer und visionärer Mitarbeiter aus. Du legst Wert auf zwischenmenschliche Beziehungen und führst mit Empathie und einer tiefen Verbindung zu deinen Kollegen. Dein Arbeitsstil ist geprägt von Kreativität und einer starken Ausrichtung auf persönliches Wachstum und sozialen Fortschritt.','Deine Stärken liegen in deiner ausgeprägten Empathie und der Fähigkeit, tiefgehende zwischenmenschliche Beziehungen aufzubauen. Du bringst Kreativität und eine inspirierende Vision in die Arbeit ein und strebst nach sozialem Wandel. Deine Fähigkeit, alternative Perspektiven einzunehmen, trägt zu innovativen Lösungen bei.','Als Führungskraft inspirierst du durch deine Vision und förderst sozialen Wandel. Du bevorzugst partizipative Entscheidungsfindung und legst Wert auf die individuelle Entfaltung deiner Teammitglieder. Dein Führungsstil ist von Empathie und Inspiration geprägt.','Als Führungskraft inspirierst du durch deine Vision und förderst sozialen Wandel. Du bevorzugst partizipative Entscheidungsfindung und legst Wert auf die individuelle Entfaltung deiner Teammitglieder. Dein Führungsstil ist von Empathie und Inspiration geprägt.','Im Team bist du kooperativ und einfühlsam. Du trägst dazu bei, eine positive Teamdynamik aufrechtzuerhalten und förderst die Kreativität aller Mitglieder. Deine Teammitglieder schätzen deine Unterstützung und inspirierende Herangehensweise.','INFJ'),('5731e917-070d-4ab8-9e2e-f42d3439e66c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als strategischer und zielorientierter Anführer aus. Du bist energiegeladen, entscheidungsfreudig und hast eine natürliche Führungsfähigkeit. Du strebst danach, effektive Lösungen zu finden und Projekte erfolgreich umzusetzen.','In der Arbeitswelt zeichnest du dich als strategischer und zielorientierter Anführer aus. Du bist energiegeladen, entscheidungsfreudig und hast eine natürliche Führungsfähigkeit. Du strebst danach, effektive Lösungen zu finden und Projekte erfolgreich umzusetzen.','Du kommunizierst klar und direkt und bevorzugst effiziente Gespräche. Du bist bestrebt, deine Überzeugungen zu vertreten und erwartest, dass andere deine Sichtweise respektieren. Du schätzt klare und konstruktive Kommunikation.','Als Führungskraft setzt du klare Ziele und motivierst dein Team, diese zu erreichen. Du bevorzugst eine strukturierte Herangehensweise und förderst die Entwicklung deiner Teammitglieder. Dein Führungsstil ist auf Leistung und Erfolg ausgerichtet.','Im Team bringst du Struktur und Organisation ein, um Projekte voranzutreiben. Du förderst die Effizienz und strebst nach exzellenten Ergebnissen. Deine Teammitglieder schätzen deine Entschlossenheit und die klaren Richtlinien, die du setzt.','ENTJ'),('62bfbdd9-c6ef-4d80-b531-4518999594da','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als kreativer Denker und Innovator aus. Du bevorzugst intellektuelle Herausforderungen und liebst es, alternative Lösungsansätze zu erkunden. Dein Arbeitsstil ist geprägt von Neugier und der Fähigkeit, komplexe Probleme zu lösen.','Deine Stärken liegen in deiner Fähigkeit, innovative Lösungen zu entwickeln und neue Ideen zu generieren. Du bist ein strategischer Denker und ein ausgezeichneter Problemlöser. Deine Fähigkeit, verschiedene Perspektiven einzunehmen und kreativ zu denken, zeichnet dich aus.','Du kommunizierst lebhaft und mit Begeisterung. Du schätzt Debatten und den Austausch von Ideen und neigst dazu, konventionelle Ansichten in Frage zu stellen. Du förderst kritisches Denken und Herausforderungen in Gesprächen.','Als Führungskraft inspirierst du durch deine Kreativität und Innovationsfähigkeit. Du setzt auf strategisches Denken und förderst kreatives Denken in deinem Team. Dein Führungsstil ist von intellektueller Neugier und Freiheit geprägt.','Im Team bist du ein kreativer und innovativer Mitdenker. Du bringst frische Ideen und alternative Lösungsansätze ein und trägst dazu bei, komplexe Probleme zu lösen. Deine Teammitglieder schätzen deine intellektuelle Neugier und deine Fähigkeit, kritisch zu denken.','ENTP'),('654bf184-3ab7-4b1e-8030-52bb2f5732f5','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als einfühlsamer und kreativer Denker aus. Du bevorzugst Aufgaben, die mit deinen persönlichen Werten und Idealen in Einklang stehen. Dein Arbeitsstil ist geprägt von Empathie und der Fähigkeit, eine inspirierende Atmosphäre zu schaffen.','Deine Stärken liegen in deiner tiefen Empathie und deiner Fähigkeit, zwischenmenschliche Beziehungen aufzubauen. Du bringst Kreativität und eine inspirierende Vision in die Arbeit ein und strebst nach sozialer Veränderung. Deine Fähigkeit, alternative Perspektiven einzunehmen, trägt zu innovativen Lösungen bei.','Du kommunizierst einfühlsam und kreativ, neigst jedoch dazu, Konfrontationen zu meiden. Du bevorzugst tiefgründige Gespräche und schätzt offenen Austausch. Deine Kommunikationsfähigkeiten schaffen eine positive und unterstützende Arbeitsatmosphäre.','Als Führungskraft inspirierst du durch deine Vision und förderst soziale Veränderung. Du bevorzugst partizipative Entscheidungsfindung und legst Wert auf die individuelle Entfaltung deiner Teammitglieder. Dein Führungsstil ist von Empathie und Inspiration geprägt.','Im Team bist du kooperativ und einfühlsam. Du trägst dazu bei, eine positive Teamdynamik aufrechtzuerhalten und förderst die Kreativität aller Mitglieder. Deine Teammitglieder schätzen deine Unterstützung und inspirierende Herangehensweise.','INFP'),('880216fc-131f-4adb-a040-c00c3d7a5255','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als fürsorglicher und gewissenhafter Mitarbeiter aus. Du legst Wert auf Harmonie und zwischenmenschliche Beziehungen. Dein Arbeitsstil ist geprägt von Zuverlässigkeit und Verantwortungsbewusstsein, und du strebst danach, anderen zu helfen und eine positive Arbeitsumgebung zu schaffen.','Deine Stärken liegen in deiner hohen Empathie und der Fähigkeit, gut mit anderen zusammenzuarbeiten. Du bist fürsorglich und unterstützend, und du sorgst dafür, dass die Bedürfnisse deiner Kollegen und Teammitglieder beachtet werden. Dein organisatorisches Talent und deine Fähigkeit, anderen zu helfen, zeichnen dich aus.','Du kommunizierst einfühlsam und unterstützend, neigst jedoch dazu, Konfrontationen zu meiden. Du legst Wert auf offene Kommunikation und förderst harmonische Beziehungen. Deine Kommunikationsfähigkeiten schaffen eine positive Arbeitsatmosphäre.','Als Führungskraft setzt du auf Empathie und Unterstützung. Du fördertest die Zusammenarbeit in deinem Team und sorgst dafür, dass die Bedürfnisse deiner Mitarbeiter beachtet werden. Dein Führungsstil ist von fürsorglicher und unterstützender Natur.','Im Team bist du ein kooperativer und unterstützender Teamplayer. Du trägst dazu bei, eine harmonische Teamdynamik aufrechtzuerhalten und förderst die Zusammenarbeit aller Mitglieder. Deine Teammitglieder schätzen deine Fürsorglichkeit und deinen Beitrag zur Schaffung einer positiven Arbeitsumgebung.','ISFJ'),('8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als spontaner und sozialer Teamplayer aus. Du bevorzugst praktische Handlungen und bringst Enthusiasmus und Energie in die Arbeit ein. Dein Arbeitsstil ist geprägt von Flexibilität und der Fähigkeit, schnell auf neue Herausforderungen zu reagieren.','Deine Stärken liegen in deinem Enthusiasmus und deiner Anpassungsfähigkeit. Du bist ein Teamplayer und ein pragmatischer Umsetzer. Deine Fähigkeit, die Stimmung zu heben und Spaß in die Arbeit zu bringen, zeichnet dich aus.','Du kommunizierst spontan und aufgeschlossen. Du bevorzugst eine offene und freundliche Kommunikation und legst Wert auf das Aufrechterhalten einer positiven Stimmung. In deinen Gesprächen legst du den Fokus auf soziale Interaktion.','Als Führungskraft setzt du auf soziale Interaktion und die Förderung von Teamarbeit. Du bringst Energie und Begeisterung in dein Team und motivierst durch praktisches Handeln. Du schaffst eine positive und dynamische Arbeitsumgebung.','Im Team bist du ein lebhafter und sozialer Teamplayer. Du trägst dazu bei, die Stimmung zu heben und die soziale Interaktion zu fördern. Deine Teammitglieder schätzen deine Energie und deine Fähigkeit, Spaß in die Arbeit zu bringen und unerwartete Herausforderungen mit Begeisterung anzugehen.','ESFP'),('9241845e-d6b7-4d98-b994-281d12b3346d','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als inspirierender und einfühlsamer Teamplayer aus. Du legst Wert auf zwischenmenschliche Beziehungen und führst mit Empathie und Vision. Deine Stärken liegen in der Fähigkeit, Teams zu motivieren und gemeinsame Ziele zu erreichen.','Deine Stärken liegen in deiner ausgeprägten Empathie und der Fähigkeit, Menschen zu motivieren. Du bist inspirierend und förderst die Zusammenarbeit in Teams. Deine Vision und deine Führungskompetenz zeichnen dich aus.','Du kommunizierst einfühlsam und motivierend, neigst jedoch dazu, Konfrontationen zu meiden. Du legst Wert auf offene Kommunikation und förderst harmonische Beziehungen. Deine Kommunikationsfähigkeiten schaffen eine positive Arbeitsatmosphäre.','Als Führungskraft inspirierst du mit deiner Vision und deinem Engagement. Du förderst die Zusammenarbeit in deinem Team und setzt dich für das Wohl deiner Mitarbeiter ein. Dein Führungsstil ist von Empathie und Inspiration geprägt.','Im Team bist du ein einfühlsamer und motivierender Teamplayer. Du trägst dazu bei, eine positive Teamdynamik aufrechtzuerhalten und förderst die Zusammenarbeit aller Mitglieder. Deine Teammitglieder schätzen deine empathische Führung und deinen Beitrag zur Erreichung gemeinsamer Ziele.','ENFJ'),('93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als praktischer und handlungsorientierter Macher aus. Du bevorzugst konkrete Aufgaben und liebst es, Probleme direkt anzugehen. Dein Arbeitsstil ist geprägt von Flexibilität und der Fähigkeit, in herausfordernden Situationen Ruhe zu bewahren.','Deine Stärken liegen in deiner praktischen Denkweise und deiner Fähigkeit, effiziente Lösungen zu finden. Du bist ein ausgezeichneter Problemlöser und behältst in stressigen Situationen einen kühlen Kopf. Deine Fähigkeit, Dinge hands-on anzupacken, zeichnet dich aus.','Du kommunizierst klar und sachlich. Du bevorzugst direkte und unkomplizierte Kommunikation und legst Wert auf Effizienz. In deinen Gesprächen legst du den Fokus auf pragmatische Lösungen.','Als Führungskraft setzt du auf praktische Problemlösungen und Unabhängigkeit. Du förderst die Fähigkeit deines Teams, in herausfordernden Situationen Ruhe zu bewahren, und schätzt Effizienz. Dein Führungsstil ist von pragmatischer und stressresistenter Natur.','Im Team bist du ein handlungsorientierter und pragmatischer Mitarbeiter. Du bringst praktische Lösungen und direkte Handlungsfähigkeit ein und trägst dazu bei, effiziente Lösungen zu finden. Deine Teammitglieder schätzen deine Fähigkeit, in schwierigen Situationen einen kühlen Kopf zu bewahren und direkt zu handeln.','ISTP'),('a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','3673a855-5f81-40c5-a61b-8a2198620107','2023-11-16 04:25:54','In der Arbeitswelt zeichnest du dich als organisierter und zielstrebiger Teamplayer aus. Du bist jemand, der klare Strukturen bevorzugt und in der Lage ist, effektive Pläne umzusetzen. Dein Arbeitsstil ist geprägt von Zuverlässigkeit und Verantwortungsbewusstsein, und du strebst danach, produktive Ergebnisse zu erzielen. Stärken','Deine Stärken liegen in deiner hohen Organisationsfähigkeit und deiner Fähigkeit, klare Richtlinien zu setzen. Du bist äußerst verlässlich und zeigst eine ausgeprägte Verantwortungsbereitschaft. Die Umsetzung von Projekten und die Erreichung von Zielen sind deine Spezialität.','Du kommunizierst klar und präzise, bevorzugst jedoch oft eine direkte und sachliche Kommunikationsweise. Dies kann dazu führen, dass du in Konfliktsituationen als zu autoritär wahrgenommen wirst. Du schätzt klare und eindeutige Kommunikation','Als Führungskraft setzt du klare Ziele und ermutigst dein Team, diese zu erreichen. Du bevorzugst eine effiziente und strukturierte Herangehensweise und schaffst klare Erwartungen. Dein Führungsstil ist auf Ergebnisse ausgerichtet.','Im Team bringst du Struktur und Ordnung ein und sorgst dafür, dass Aufgaben klar verteilt sind. Du förderst die Effizienz und trägst dazu bei, dass Projekte termingerecht abgeschlossen werden. Deine Teammitglieder schätzen deine Zuverlässigkeit','ESTJ'),('a88b2f64-0acf-4c18-b33b-611fed63c43c','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als kreativer und inspirierender Innovator aus. Du bevorzugst intellektuelle Herausforderungen und liebst es, neue Ideen zu entwickeln. Dein Arbeitsstil ist geprägt von Leidenschaft und der Fähigkeit, andere zu begeistern.','Deine Stärken liegen in deiner Fähigkeit, kreative Lösungen zu finden und neue Ideen zu generieren. Du bist ein inspirierender Denker und ein hervorragender Problemlöser. Deine Fähigkeit, andere zu begeistern und für deine Visionen zu gewinnen, zeichnet dich aus.','Du kommunizierst lebhaft und mit Begeisterung. Du schätzt Debatten und den Austausch von Ideen und neigst dazu, konventionelle Ansichten in Frage zu stellen. Du inspirierst und motivierst andere durch deine inspirierenden Gespräche.','Als Führungskraft inspirierst du durch deine Kreativität und Innovationsfähigkeit. Du setzt auf inspirierendes Denken und förderst kreatives Denken in deinem Team. Dein Führungsstil ist von persönlichem Wachstum und Begeisterung geprägt.','Im Team bist du ein kreativer und inspirierender Mitdenker. Du bringst frische Ideen und alternative Lösungsansätze ein und trägst dazu bei, komplexe Probleme zu lösen. Deine Teammitglieder schätzen deine inspirierende Art und deine Fähigkeit, die Gruppe zu motivieren und zu begeistern.','ENFP'),('b413c37e-bbf8-4a7f-ba3c-ee681ece4994','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als zuverlässiger und strukturierter Mitarbeiter aus. Du bevorzugst klare Regeln und Prozesse und arbeitest gewissenhaft daran, Aufgaben zu erledigen. Dein Arbeitsstil ist geprägt von Präzision und Verantwortungsbewusstsein, und du strebst danach, effiziente Ergebnisse zu erzielen.','Deine Stärken liegen in deiner hohen Organisationsfähigkeit und deiner Fähigkeit, klare Pläne zu erstellen und zu befolgen. Du bist äußerst zuverlässig und zeigst eine ausgeprägte Verantwortungsbereitschaft. Die Einhaltung von Regeln und die Erfüllung von Aufgaben nach höchsten Standards sind deine Spezialitäten.','Du kommunizierst klar und direkt, bevorzugst jedoch oft eine sachliche und präzise Kommunikationsweise. Dies kann dazu führen, dass du in Konfliktsituationen als zu autoritär wahrgenommen wirst. Du schätzt klare und effiziente Kommunikation.','Als Führungskraft setzt du klare Regeln und ermutigst dein Team, diese zu befolgen. Du bevorzugst eine strukturierte Herangehensweise und förderst die Einhaltung von Standards. Dein Führungsstil ist auf Effizienz und Zuverlässigkeit ausgerichtet.','Im Team bringst du Struktur und Ordnung ein und sorgst dafür, dass Aufgaben klar verteilt und erledigt werden. Du förderst die Effizienz und trägst dazu bei, dass Projekte termingerecht abgeschlossen werden. Deine Teammitglieder schätzen deine Zuverlässigkeit und die klaren Prozesse, die du etablierst.','ISTJ'),('c6cd3140-1d25-45c0-8337-0ad3281df05b','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als analytischer Denker und innovativer Problemlöser aus. Du bevorzugst intellektuelle Herausforderungen und liebst es, komplexe Probleme zu lösen. Dein Arbeitsstil ist geprägt von Logik und der Fähigkeit, abstrakte Konzepte zu verstehen.','Deine Stärken liegen in deiner Fähigkeit, komplexe Probleme zu analysieren und innovative Lösungen zu entwickeln. Du bist ein kreativer Denker und ein exzellenter Problemlöser. Deine Fähigkeit, verschiedene Perspektiven einzunehmen und abstrakte Konzepte zu verstehen, zeichnet dich aus.','Du kommunizierst sachlich und präzise. Du bevorzugst klare und logische Kommunikation und legst Wert auf Effizienz. In deinen Gesprächen legst du den Fokus auf logische Argumentation.','Als Führungskraft inspirierst du durch analytisches Denken und Innovationsfähigkeit. Du förderst kritisches Denken und Herausforderungen in deinem Team. Dein Führungsstil ist von intellektueller Neugier und Kreativität geprägt.','Im Team bringst du analytische Fähigkeiten und Innovationsfähigkeit ein. Du trägst dazu bei, komplexe Probleme zu lösen und kreative Lösungen zu entwickeln. Deine Teammitglieder schätzen deine Fähigkeit, verschiedene Perspektiven einzunehmen und abstrakte Konzepte zu verstehen.','INTP'),('c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als spontaner und praktischer Macher aus. Du bevorzugst Handlungen vor Planung und arbeitest gut in dynamischen Umgebungen. Dein Arbeitsstil ist geprägt von Flexibilität und der Fähigkeit, sofortige Lösungen zu finden.','Deine Stärken liegen in deiner Spontaneität und Anpassungsfähigkeit. Du bist ein praktischer Problemlöser und ein risikofreudiger Umsetzer. Deine Fähigkeit, unter Druck Ruhe zu bewahren, zeichnet dich aus.','Du kommunizierst direkt und pragmatisch. Du bevorzugst klare und unkomplizierte Kommunikation und legst Wert auf Effizienz. In deinen Gesprächen legst du den Fokus auf Lösungen.','Als Führungskraft setzt du auf Handlung und praktische Umsetzung. Du förderst Risikobereitschaft und Flexibilität in deinem Team. Du bewahrst Ruhe unter Druck und inspirierst durch dein praktisches Handeln.','Im Team bist du ein dynamischer und anpassungsfähiger Mitarbeiter. Du trägst dazu bei, schnelle Lösungen zu finden und die Effizienz zu steigern. Deine Teammitglieder schätzen deine praktische Herangehensweise und deinen Beitrag zur Bewältigung unerwarteter Herausforderungen.','ESTP'),('d0641904-1587-4823-9ad5-e45602415cf2','published',NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,NULL,'In der Arbeitswelt zeichnest du dich als einfühlsamer und kreativer Umsetzer aus. Du bevorzugst konkrete Aufgaben und legst Wert auf die Gestaltung von ästhetisch ansprechenden Lösungen. Dein Arbeitsstil ist geprägt von Sensibilität und der Fähigkeit, eine harmonische Umgebung zu schaffen','Deine Stärken liegen in deinem kreativen Denken und deiner Fähigkeit, ästhetisch ansprechende Lösungen zu entwickeln. Du bist ein einfühlsamer Umsetzer und trägst zur Schaffung einer harmonischen Arbeitsatmosphäre bei. Deine Fähigkeit, alternative Perspektiven einzunehmen, zeichnet dich aus.','Du kommunizierst einfühlsam und kreativ, neigst jedoch dazu, Konfrontationen zu meiden. Du legst Wert auf offene und unterstützende Kommunikation und förderst harmonische Beziehungen. Deine Kommunikationsfähigkeiten schaffen eine positive und ästhetische Arbeitsatmosphäre.','Als Führungskraft inspirierst du durch kreative Lösungen und die Schaffung einer harmonischen Umgebung. Du förderst künstlerische Ausdrucksformen und zwischenmenschliche Beziehungen in deinem Team. Dein Führungsstil ist von Empathie und Ästhetik geprägt.','Im Team bist du ein einfühlsamer und kreativer Teamplayer. Du trägst zur Schaffung einer harmonischen Teamdynamik bei und bringst ästhetische und kreative Lösungen ein. Deine Teammitglieder schätzen deine Sensibilität und deine Fähigkeit, alternative Perspektiven einzunehmen.','ISFP');
/*!40000 ALTER TABLE `UserPersonality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPersonality_PersonalityTags`
--

DROP TABLE IF EXISTS `UserPersonality_PersonalityTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserPersonality_PersonalityTags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserPersonality_id` char(36) DEFAULT NULL,
  `PersonalityTags_id` char(36) DEFAULT NULL,
  `userPersonalityId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userpersonality_personalitytags_personalitytags_id_foreign` (`PersonalityTags_id`),
  KEY `userpersonality_personalitytags_userpersonality_id_foreign` (`UserPersonality_id`),
  KEY `UserPersonality_PersonalityTags_userPersonalityId_idx` (`userPersonalityId`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPersonality_PersonalityTags`
--

LOCK TABLES `UserPersonality_PersonalityTags` WRITE;
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags` DISABLE KEYS */;
INSERT INTO `UserPersonality_PersonalityTags` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL),(7,NULL,NULL,NULL),(8,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','0effebd7-774a-45b7-a211-d9e30c31a717',NULL),(9,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','45edc877-1eea-4e0b-959c-761b7189a3e7',NULL),(10,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','2a0d911d-5c79-46ca-bfd9-293bbd50b35b',NULL),(11,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','64235ff5-522e-46ca-ab56-4bd9fc6cd44f',NULL),(12,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','edc5714a-3669-4410-8659-af3ae04b3375',NULL),(13,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','8511e19a-486a-45ff-812f-ed69518317f4',NULL),(14,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','030c7704-47ea-48bc-9a68-ddfd0314566a',NULL),(15,'5731e917-070d-4ab8-9e2e-f42d3439e66c','625edcce-691f-4b43-be77-b378894392d3',NULL),(16,'5731e917-070d-4ab8-9e2e-f42d3439e66c','64b31830-6294-4cac-8e66-3e27d5070515',NULL),(17,'5731e917-070d-4ab8-9e2e-f42d3439e66c','717f4470-ecf9-47bd-9d3c-955efaa162b4',NULL),(18,'5731e917-070d-4ab8-9e2e-f42d3439e66c','030c7704-47ea-48bc-9a68-ddfd0314566a',NULL),(19,'5731e917-070d-4ab8-9e2e-f42d3439e66c','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(20,'5731e917-070d-4ab8-9e2e-f42d3439e66c','3a12bdbf-c390-4c82-864f-d572ee6f2042',NULL),(21,'5731e917-070d-4ab8-9e2e-f42d3439e66c','64235ff5-522e-46ca-ab56-4bd9fc6cd44f',NULL),(22,'2c2a6c36-cef5-441a-a94b-e0418009e94a','3bbaa694-282b-4bd5-ac2f-cf6bca516358',NULL),(23,'2c2a6c36-cef5-441a-a94b-e0418009e94a','5b305aa6-ea3d-4c6e-8925-69af3851b83f',NULL),(24,'2c2a6c36-cef5-441a-a94b-e0418009e94a','0effebd7-774a-45b7-a211-d9e30c31a717',NULL),(25,'2c2a6c36-cef5-441a-a94b-e0418009e94a','0b851571-2ed0-4032-90fa-781df88a1ad5',NULL),(26,'2c2a6c36-cef5-441a-a94b-e0418009e94a','0b22b078-f954-4072-9f68-4471ee1b04be',NULL),(27,'2c2a6c36-cef5-441a-a94b-e0418009e94a','45edc877-1eea-4e0b-959c-761b7189a3e7',NULL),(28,'2c2a6c36-cef5-441a-a94b-e0418009e94a','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(29,'9241845e-d6b7-4d98-b994-281d12b3346d','0b851571-2ed0-4032-90fa-781df88a1ad5',NULL),(30,'9241845e-d6b7-4d98-b994-281d12b3346d','dfb13100-333c-40a0-9e61-2f5e5d069aaa',NULL),(31,'9241845e-d6b7-4d98-b994-281d12b3346d','5b305aa6-ea3d-4c6e-8925-69af3851b83f',NULL),(32,'9241845e-d6b7-4d98-b994-281d12b3346d','0b22b078-f954-4072-9f68-4471ee1b04be',NULL),(33,'9241845e-d6b7-4d98-b994-281d12b3346d','2e4270fd-2445-4485-8d03-322da8178378',NULL),(34,'9241845e-d6b7-4d98-b994-281d12b3346d','717f4470-ecf9-47bd-9d3c-955efaa162b4',NULL),(35,'9241845e-d6b7-4d98-b994-281d12b3346d','0effebd7-774a-45b7-a211-d9e30c31a717',NULL),(36,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','45edc877-1eea-4e0b-959c-761b7189a3e7',NULL),(37,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','0effebd7-774a-45b7-a211-d9e30c31a717',NULL),(38,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','6498b1ff-1c99-4959-9947-737a4d1946b1',NULL),(39,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','8511e19a-486a-45ff-812f-ed69518317f4',NULL),(40,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(41,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','edc5714a-3669-4410-8659-af3ae04b3375',NULL),(42,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','e0794d64-8dae-488f-bfda-9ce21d9b30a9',NULL),(43,'880216fc-131f-4adb-a040-c00c3d7a5255','3bbaa694-282b-4bd5-ac2f-cf6bca516358',NULL),(44,'880216fc-131f-4adb-a040-c00c3d7a5255','45edc877-1eea-4e0b-959c-761b7189a3e7',NULL),(45,'880216fc-131f-4adb-a040-c00c3d7a5255','6498b1ff-1c99-4959-9947-737a4d1946b1',NULL),(46,'880216fc-131f-4adb-a040-c00c3d7a5255','0b851571-2ed0-4032-90fa-781df88a1ad5',NULL),(47,'880216fc-131f-4adb-a040-c00c3d7a5255','5b305aa6-ea3d-4c6e-8925-69af3851b83f',NULL),(48,'880216fc-131f-4adb-a040-c00c3d7a5255','0effebd7-774a-45b7-a211-d9e30c31a717',NULL),(49,'880216fc-131f-4adb-a040-c00c3d7a5255','8f79dda7-80dc-414b-9555-25ca172cf3b4',NULL),(50,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(51,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','64b31830-6294-4cac-8e66-3e27d5070515',NULL),(52,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','6198b692-b2c1-44b3-ba13-56b6463fb096',NULL),(53,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','030c7704-47ea-48bc-9a68-ddfd0314566a',NULL),(54,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','044f1557-7eb8-460c-9c37-2d2bd8e25a6f',NULL),(55,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','64235ff5-522e-46ca-ab56-4bd9fc6cd44f',NULL),(56,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','de1f421d-abe2-45cc-bb9c-c5f72decc1ab',NULL),(57,'42e80925-46d9-4d68-af06-eb63c911e996','2a1edef0-39fc-4fd0-b034-c94e56496b35',NULL),(58,'42e80925-46d9-4d68-af06-eb63c911e996','18148750-0391-4b23-a78a-55a97e64323f',NULL),(59,'42e80925-46d9-4d68-af06-eb63c911e996','574dd040-8844-4c36-af08-08ebd90e69b8',NULL),(60,'42e80925-46d9-4d68-af06-eb63c911e996','c5803af5-af88-461a-a1bc-c6dd8f717637',NULL),(61,'42e80925-46d9-4d68-af06-eb63c911e996','5b305aa6-ea3d-4c6e-8925-69af3851b83f',NULL),(62,'42e80925-46d9-4d68-af06-eb63c911e996','9b2f499e-f7df-4506-9757-a2ce9a90eb80',NULL),(63,'42e80925-46d9-4d68-af06-eb63c911e996','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(64,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','5a400cd1-ad3c-479f-90f6-5520217a2828',NULL),(65,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(66,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','c25fb9f6-3e33-4cfc-ad9b-106ff008412e',NULL),(67,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','6c8a15ca-9bdb-4b5f-998d-a1c99d3aaa26',NULL),(68,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','c86f9569-726e-44a2-9f10-6abb3c656e0c',NULL),(69,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','0fba97d1-2f7f-4142-9672-904145bd67f4',NULL),(70,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','50052028-9eb2-4b60-8095-e6a6fa5cd49a',NULL),(71,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','783cd4e5-dd5c-4f90-afff-b11f468c41a9',NULL),(72,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','2e4270fd-2445-4485-8d03-322da8178378',NULL),(73,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','33a29fb9-8ae8-4303-bcfd-831607158ab2',NULL),(74,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','5697a1dd-8dfa-42fc-b7d4-59de6218dbf5',NULL),(75,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','0523a9de-803a-4972-b564-3ee4c92075b4',NULL),(76,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(77,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','5b305aa6-ea3d-4c6e-8925-69af3851b83f',NULL),(78,'62bfbdd9-c6ef-4d80-b531-4518999594da','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(79,'62bfbdd9-c6ef-4d80-b531-4518999594da','18148750-0391-4b23-a78a-55a97e64323f',NULL),(80,'62bfbdd9-c6ef-4d80-b531-4518999594da','16a59e8f-952d-4e93-8254-9c9cd4ede07e',NULL),(81,'62bfbdd9-c6ef-4d80-b531-4518999594da','044f1557-7eb8-460c-9c37-2d2bd8e25a6f',NULL),(82,'62bfbdd9-c6ef-4d80-b531-4518999594da','0523a9de-803a-4972-b564-3ee4c92075b4',NULL),(83,'62bfbdd9-c6ef-4d80-b531-4518999594da','5fe24308-cd3c-411b-8d9f-c4310ef0a6f1',NULL),(84,'62bfbdd9-c6ef-4d80-b531-4518999594da','2bc31a22-fd32-4455-9f93-71ab146c02c3',NULL),(85,'a88b2f64-0acf-4c18-b33b-611fed63c43c','18148750-0391-4b23-a78a-55a97e64323f',NULL),(86,'a88b2f64-0acf-4c18-b33b-611fed63c43c','2e4270fd-2445-4485-8d03-322da8178378',NULL),(87,'a88b2f64-0acf-4c18-b33b-611fed63c43c','9cd48f03-e33c-41fa-8194-7e34311f4e46',NULL),(88,'a88b2f64-0acf-4c18-b33b-611fed63c43c','5697a1dd-8dfa-42fc-b7d4-59de6218dbf5',NULL),(89,'a88b2f64-0acf-4c18-b33b-611fed63c43c','0b851571-2ed0-4032-90fa-781df88a1ad5',NULL),(90,'a88b2f64-0acf-4c18-b33b-611fed63c43c','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(91,'a88b2f64-0acf-4c18-b33b-611fed63c43c','044f1557-7eb8-460c-9c37-2d2bd8e25a6f',NULL),(92,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','0fba97d1-2f7f-4142-9672-904145bd67f4',NULL),(93,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(94,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','2c5f854d-f199-467c-a7cd-28cdccf8a13c',NULL),(95,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','6c8a15ca-9bdb-4b5f-998d-a1c99d3aaa26',NULL),(96,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(97,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','908d343e-539a-42d6-8c5f-663bf33fd941',NULL),(98,'d0641904-1587-4823-9ad5-e45602415cf2','18148750-0391-4b23-a78a-55a97e64323f',NULL),(99,'d0641904-1587-4823-9ad5-e45602415cf2','2a1edef0-39fc-4fd0-b034-c94e56496b35',NULL),(100,'d0641904-1587-4823-9ad5-e45602415cf2','0fba97d1-2f7f-4142-9672-904145bd67f4',NULL),(101,'d0641904-1587-4823-9ad5-e45602415cf2','4fd2855f-98d8-4346-9c95-cb59e585be79',NULL),(102,'d0641904-1587-4823-9ad5-e45602415cf2','6c8a15ca-9bdb-4b5f-998d-a1c99d3aaa26',NULL),(103,'d0641904-1587-4823-9ad5-e45602415cf2','f3fc8f75-9511-461e-800a-e61e5a48507a',NULL),(104,'d0641904-1587-4823-9ad5-e45602415cf2','b7a05b86-ba51-453e-b05b-8ee592e72bcc',NULL),(105,'c6cd3140-1d25-45c0-8337-0ad3281df05b','6ba72ef7-e03f-4d80-9351-a7ae304aa685',NULL),(106,'c6cd3140-1d25-45c0-8337-0ad3281df05b','044f1557-7eb8-460c-9c37-2d2bd8e25a6f',NULL),(107,'c6cd3140-1d25-45c0-8337-0ad3281df05b','18148750-0391-4b23-a78a-55a97e64323f',NULL),(108,'c6cd3140-1d25-45c0-8337-0ad3281df05b','6198b692-b2c1-44b3-ba13-56b6463fb096',NULL),(109,'c6cd3140-1d25-45c0-8337-0ad3281df05b','50052028-9eb2-4b60-8095-e6a6fa5cd49a',NULL),(110,'c6cd3140-1d25-45c0-8337-0ad3281df05b','afaf75ea-61a7-4833-9c70-7696b8220c4f',NULL),(111,'c6cd3140-1d25-45c0-8337-0ad3281df05b','0523a9de-803a-4972-b564-3ee4c92075b4',NULL),(112,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','18148750-0391-4b23-a78a-55a97e64323f',NULL),(113,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','2a1edef0-39fc-4fd0-b034-c94e56496b35',NULL),(114,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','b7cf3bdb-d18e-4602-8e46-70a33b214e9c',NULL),(115,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','0523a9de-803a-4972-b564-3ee4c92075b4',NULL),(116,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','50052028-9eb2-4b60-8095-e6a6fa5cd49a',NULL),(117,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','5e5903df-8426-4580-a9b3-be327bb8476d',NULL),(118,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','e1cf783b-0b12-4434-9643-ea5f1fb20a7e',NULL);
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPersonality_PersonalityTags_1`
--

DROP TABLE IF EXISTS `UserPersonality_PersonalityTags_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserPersonality_PersonalityTags_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserPersonality_id` char(36) DEFAULT NULL,
  `PersonalityTags_id` char(36) DEFAULT NULL,
  `userPersonalityId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userpersonality_personalitytags_1_personalitytags_id_foreign` (`PersonalityTags_id`),
  KEY `userpersonality_personalitytags_1_userpersonality_id_foreign` (`UserPersonality_id`),
  KEY `UserPersonality_PersonalityTags_1_userPersonalityId_idx` (`userPersonalityId`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPersonality_PersonalityTags_1`
--

LOCK TABLES `UserPersonality_PersonalityTags_1` WRITE;
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags_1` DISABLE KEYS */;
INSERT INTO `UserPersonality_PersonalityTags_1` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','cfb57c1c-741f-45ea-9b6d-d50b30886f7e',NULL),(7,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','a1485b22-a214-4152-b536-9ca4b62eb7ea',NULL),(8,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','0490fc2c-8009-4f47-81f4-eea9e3df3042',NULL),(9,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','d4db2f75-734d-4937-a155-6f13395d60ae',NULL),(10,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','80b4c2e8-2cc5-4c5d-befc-6cb2e9a07c35',NULL),(11,'5731e917-070d-4ab8-9e2e-f42d3439e66c','5edc045d-985c-485f-9681-3d3a2ddaa4a1',NULL),(12,'5731e917-070d-4ab8-9e2e-f42d3439e66c','58dad8d0-149c-43bb-9339-b112924d8978',NULL),(13,'5731e917-070d-4ab8-9e2e-f42d3439e66c','1dbacda5-e056-4462-ab6e-6fd14b7250ce',NULL),(14,'5731e917-070d-4ab8-9e2e-f42d3439e66c','4212b629-1e06-4eee-ba96-ccc0d3d2494c',NULL),(15,'2c2a6c36-cef5-441a-a94b-e0418009e94a','450b4f40-c745-4411-bc55-1fb36603f9ad',NULL),(16,'2c2a6c36-cef5-441a-a94b-e0418009e94a','b7aac0f7-4b81-44b4-9584-e397cc8cb607',NULL),(17,'2c2a6c36-cef5-441a-a94b-e0418009e94a','138d96a9-e353-4ac3-b508-c2341b0b1f17',NULL),(18,'2c2a6c36-cef5-441a-a94b-e0418009e94a','e702608d-7a5c-456c-ac63-dff39f7272ae',NULL),(19,'9241845e-d6b7-4d98-b994-281d12b3346d','c72088a4-bef3-4c22-9892-233da87a4d0c',NULL),(20,'9241845e-d6b7-4d98-b994-281d12b3346d','534e922f-45ac-4e19-b4f2-b993363db1f9',NULL),(21,'9241845e-d6b7-4d98-b994-281d12b3346d','29bf214a-2bb4-4e75-be28-e3111c92b644',NULL),(22,'9241845e-d6b7-4d98-b994-281d12b3346d','24df7090-1921-406c-9ff3-eeca8424f07f',NULL),(23,'9241845e-d6b7-4d98-b994-281d12b3346d','da6bb429-31cb-4ef8-b048-0ca857928427',NULL),(24,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','c9f670b2-f9f3-4485-9f8b-6f0679dac24c',NULL),(25,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','022d006a-997c-4e61-aaec-323e54ccc18c',NULL),(26,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','6e9e650d-3c22-4400-a95e-425157c5e4d0',NULL),(27,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','f69c58ad-7bf9-4505-873e-9dc8a12f881d',NULL),(28,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','37f0cf8a-7236-4c35-aeb2-86334e753722',NULL),(29,'880216fc-131f-4adb-a040-c00c3d7a5255','ac6ba47a-756d-448d-b908-77436793cb0f',NULL),(30,'880216fc-131f-4adb-a040-c00c3d7a5255','6d80db06-32a0-488d-be2d-8e8a7cd84a06',NULL),(31,'880216fc-131f-4adb-a040-c00c3d7a5255','06b325b3-7c9f-4a27-be91-084cb16e601f',NULL),(32,'880216fc-131f-4adb-a040-c00c3d7a5255','cac9de5a-1210-4e36-82bc-43becb062574',NULL),(33,'880216fc-131f-4adb-a040-c00c3d7a5255','9dfbd995-fec9-4f6f-9481-af5904628d45',NULL),(34,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','47d2bd4c-19fe-4ccb-b79d-5c1b7e4ad0bb',NULL),(35,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','c88ed64c-6c18-47d9-8004-4ba9af00f5f0',NULL),(36,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','06f49483-3ff3-49c2-9438-6bff02d1838f',NULL),(37,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','9128ea6f-6973-4810-b3af-a4998adab207',NULL),(38,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','f803064e-0c09-4de9-8f75-80892ca67049',NULL),(39,'42e80925-46d9-4d68-af06-eb63c911e996','d0bfc746-24f8-4b99-86b9-4c2ccb5ca3d3',NULL),(40,'42e80925-46d9-4d68-af06-eb63c911e996','647bac2d-932e-40c4-bcc0-2dd6cf7e00d7',NULL),(41,'42e80925-46d9-4d68-af06-eb63c911e996','506f4d32-a145-491e-8a2d-1554578f2176',NULL),(42,'42e80925-46d9-4d68-af06-eb63c911e996','2dd92972-e344-413d-bca1-551e3a006650',NULL),(43,'42e80925-46d9-4d68-af06-eb63c911e996','13ba716d-4358-4ef7-a94d-7bae08dda0c0',NULL),(44,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','4b514597-2c18-4302-9832-a4c2dfb78700',NULL),(45,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','3181341c-8ccb-45f8-a45c-5102c1fa0d82',NULL),(46,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','cc5ee5ee-8342-4caf-98ba-0c7379ddd0ac',NULL),(47,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','f2d5202e-a409-4c4d-8521-72355ebb043c',NULL),(48,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','1465f15a-e193-4195-8fba-83ddcd23f1e1',NULL),(49,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','4f021f6c-2a8e-4ce4-8065-ee25ab5fa908',NULL),(50,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','067a35b9-cef1-4180-87e7-09f9e6c268e3',NULL),(51,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','e54c6df0-d526-4844-844c-d785a8bab274',NULL),(52,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','673bb497-5e08-4c6a-9290-1976b84a4ed4',NULL),(53,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','b966e39c-465b-4303-955c-9d25063ec2a6',NULL),(54,'62bfbdd9-c6ef-4d80-b531-4518999594da','47d2bd4c-19fe-4ccb-b79d-5c1b7e4ad0bb',NULL),(55,'62bfbdd9-c6ef-4d80-b531-4518999594da','09075ea1-7bb6-4e0f-86d9-7788efb8e006',NULL),(56,'62bfbdd9-c6ef-4d80-b531-4518999594da','b26fa603-a532-459d-a30d-bd69ff4ada45',NULL),(57,'62bfbdd9-c6ef-4d80-b531-4518999594da','5c6c3dfc-f8c2-49e3-9abe-7769d5a9d491',NULL),(58,'62bfbdd9-c6ef-4d80-b531-4518999594da','71e60258-38f6-4333-abbc-d7dac42da5f8',NULL),(59,'a88b2f64-0acf-4c18-b33b-611fed63c43c','25a53d4b-5b94-48d9-81a3-bef7c452d999',NULL),(60,'a88b2f64-0acf-4c18-b33b-611fed63c43c','4328897d-dd2c-43b5-9cfd-c01eb158de19',NULL),(61,'a88b2f64-0acf-4c18-b33b-611fed63c43c','8933dd59-90f6-45b3-acdd-e0b6ba27d9e3',NULL),(62,'a88b2f64-0acf-4c18-b33b-611fed63c43c','c3c1decb-4150-48db-9f02-fd425bf0a711',NULL),(63,'a88b2f64-0acf-4c18-b33b-611fed63c43c','d12b02a8-58d7-4733-acfc-3b4f4def51b2',NULL),(64,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','ed4163ca-f1c7-4540-9e0b-d62832f35ae3',NULL),(65,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','f55fcf87-a03d-4d93-8d7f-18fbd07fbdb2',NULL),(66,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','81d90fe7-e1c8-4a60-8efe-10a3ee037723',NULL),(67,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','1d5c5f9f-f3f9-4889-9fe9-1c87dbf9fa83',NULL),(68,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','1c9d7e3b-42ac-44c3-942d-0e9544ab4d3a',NULL),(69,'d0641904-1587-4823-9ad5-e45602415cf2','1ebef036-7789-4374-a324-43dd35e57a99',NULL),(70,'d0641904-1587-4823-9ad5-e45602415cf2','60141d26-538a-45c2-b91a-4cb97b369455',NULL),(71,'d0641904-1587-4823-9ad5-e45602415cf2','a9341e98-3ab3-4869-8153-f23782904e18',NULL),(72,'d0641904-1587-4823-9ad5-e45602415cf2','a28b1241-ab48-49ef-a8f1-be1394bc0392',NULL),(73,'d0641904-1587-4823-9ad5-e45602415cf2','542cd580-87f1-440b-848a-8fd21540c077',NULL),(74,'c6cd3140-1d25-45c0-8337-0ad3281df05b','ba6ca803-1fd4-47f6-857c-f78c0656a3c6',NULL),(75,'c6cd3140-1d25-45c0-8337-0ad3281df05b','e7f435e2-bc6e-4f23-87d9-a4a3e8c6f0e1',NULL),(76,'c6cd3140-1d25-45c0-8337-0ad3281df05b','153a2673-de57-46a1-a46a-5d199c4ff361',NULL),(77,'c6cd3140-1d25-45c0-8337-0ad3281df05b','3a32fdd1-0d70-49de-92e7-26289e9962ff',NULL),(78,'c6cd3140-1d25-45c0-8337-0ad3281df05b','449c4b36-6f8d-4275-bb23-566e7c4971ce',NULL),(79,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','bbdebb8f-ee1f-4f84-8289-e095ea7e0c2d',NULL),(80,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','302260a1-f29d-4a19-b6df-7363f9eed2c1',NULL),(81,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','8f4b7391-ae2d-4fbf-a2d9-744bcc0e1230',NULL),(82,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','78d27760-c50f-4ad0-92bf-cbf88535c16b',NULL),(83,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','9471b1ca-50c5-4daf-8163-1e809c78aed2',NULL);
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPersonality_PersonalityTags_2`
--

DROP TABLE IF EXISTS `UserPersonality_PersonalityTags_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserPersonality_PersonalityTags_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserPersonality_id` char(36) DEFAULT NULL,
  `PersonalityTags_id` char(36) DEFAULT NULL,
  `userPersonalityId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userpersonality_personalitytags_2_personalitytags_id_foreign` (`PersonalityTags_id`),
  KEY `userpersonality_personalitytags_2_userpersonality_id_foreign` (`UserPersonality_id`),
  KEY `UserPersonality_PersonalityTags_2_userPersonalityId_idx` (`userPersonalityId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPersonality_PersonalityTags_2`
--

LOCK TABLES `UserPersonality_PersonalityTags_2` WRITE;
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags_2` DISABLE KEYS */;
INSERT INTO `UserPersonality_PersonalityTags_2` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','f60297cc-db99-44b4-b038-1e86f9343741',NULL),(7,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','e3e1e44d-4929-454c-ad77-9158915a984b',NULL),(8,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','f5fd5156-aff9-456c-ab05-9f89eb72cde2',NULL),(9,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','eeeb6bad-759d-48e5-aad2-24521ff42af5',NULL),(10,'a1b0398f-ed65-46a8-a3e9-5a2ce93d3b80','e93065d0-f09a-4b64-ac00-4b6876f86df1',NULL),(11,'5731e917-070d-4ab8-9e2e-f42d3439e66c','32695a1b-4086-43a1-9a94-a982e2c6415d',NULL),(12,'5731e917-070d-4ab8-9e2e-f42d3439e66c','263d7db5-c1d7-4c77-9c53-579513f2fb71',NULL),(13,'5731e917-070d-4ab8-9e2e-f42d3439e66c','c66b3700-71a5-4da8-8d7f-da5c14f654fa',NULL),(14,'5731e917-070d-4ab8-9e2e-f42d3439e66c','20436142-7584-4348-97d5-aa8c122a42a2',NULL),(15,'2c2a6c36-cef5-441a-a94b-e0418009e94a','59ec9d2b-4e2f-4e35-88aa-0f5bf65918f3',NULL),(16,'2c2a6c36-cef5-441a-a94b-e0418009e94a','190a930b-e037-4baa-b4a5-70dc85efb5dd',NULL),(17,'2c2a6c36-cef5-441a-a94b-e0418009e94a','aa041e3f-38cf-416f-b21f-a3cd8d8cbc26',NULL),(18,'2c2a6c36-cef5-441a-a94b-e0418009e94a','9e1aff01-0dca-4944-a8c0-666efd250fd1',NULL),(19,'2c2a6c36-cef5-441a-a94b-e0418009e94a','9d96d8a2-aaaf-4b2c-84d7-bcf4b09d40db',NULL),(20,'9241845e-d6b7-4d98-b994-281d12b3346d','39da2fe0-18c3-4096-900b-1386feb597a6',NULL),(21,'9241845e-d6b7-4d98-b994-281d12b3346d','190a930b-e037-4baa-b4a5-70dc85efb5dd',NULL),(22,'9241845e-d6b7-4d98-b994-281d12b3346d','3a312b4b-cde2-4e89-8c68-cc30ccc02942',NULL),(23,'9241845e-d6b7-4d98-b994-281d12b3346d','787ed862-b78e-4993-9595-69b1543a7f39',NULL),(24,'9241845e-d6b7-4d98-b994-281d12b3346d','7ab7b16d-23e6-4b7d-8d9f-71ca85adae10',NULL),(25,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','a4f7213a-5a71-4d43-ac0f-3610b9136914',NULL),(26,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','7d1ab58d-f441-41c9-b7b5-83c8f1c65bd2',NULL),(27,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','77cff907-ccff-4aee-8527-c3efcc7c8d3e',NULL),(28,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','5c77b0f5-8e5b-4bb5-bbc8-b4510e4184c0',NULL),(29,'b413c37e-bbf8-4a7f-ba3c-ee681ece4994','8d6acaf8-696d-42c2-83a7-1d69bd77daa0',NULL),(30,'880216fc-131f-4adb-a040-c00c3d7a5255','ce601e93-0145-40cd-92a8-b53d9008350e',NULL),(31,'880216fc-131f-4adb-a040-c00c3d7a5255','88a0087e-3a8f-4483-b19a-f0a89a0539f7',NULL),(32,'880216fc-131f-4adb-a040-c00c3d7a5255','2d63ec74-1a6b-4120-bc68-f2361534e045',NULL),(33,'880216fc-131f-4adb-a040-c00c3d7a5255','e9479665-d1f6-44a9-9c28-162771eb26b3',NULL),(34,'880216fc-131f-4adb-a040-c00c3d7a5255','7ab7b16d-23e6-4b7d-8d9f-71ca85adae10',NULL),(35,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','3abf80c2-c64d-4d17-ad7d-d824e8af704f',NULL),(36,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','5a6c4dcb-d122-4299-8182-0fcceabc6817',NULL),(37,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','2d26b0ec-bf06-46ee-a494-cabdb7f527b6',NULL),(38,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','0f7f1c5c-7742-4673-87e9-4852b794b37b',NULL),(39,'0f64aed3-86e6-4ae3-a57c-12e93d0c5241','daef2eaf-1c01-4670-aa78-5700f55217f4',NULL),(40,'42e80925-46d9-4d68-af06-eb63c911e996','109518a1-acb1-43e3-b15a-3b14aa969028',NULL),(41,'42e80925-46d9-4d68-af06-eb63c911e996','b716dfcf-c8e3-4eac-8c66-65438261644a',NULL),(42,'42e80925-46d9-4d68-af06-eb63c911e996','190a930b-e037-4baa-b4a5-70dc85efb5dd',NULL),(43,'42e80925-46d9-4d68-af06-eb63c911e996','9d96d8a2-aaaf-4b2c-84d7-bcf4b09d40db',NULL),(44,'42e80925-46d9-4d68-af06-eb63c911e996','f1eebba0-8b26-44d8-87ba-39237c6cfff3',NULL),(45,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','84298e89-b84d-4e6f-9fc5-cbb3451c6588',NULL),(46,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','14b67b8c-b7ed-4611-b56c-6b909eee8547',NULL),(47,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','c09f073b-cc0c-4409-990f-3ad75e8e616a',NULL),(48,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','8d7ed975-9cc2-4f59-82d4-b88f2f150ab9',NULL),(49,'c7c89e80-b43b-4ca9-bc01-729a3a0c6a13','0de908da-79fc-403d-97bf-f2cfd4f05dc9',NULL),(50,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','cb432821-2c9b-48f5-829e-c6be96aca4a2',NULL),(51,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','14b67b8c-b7ed-4611-b56c-6b909eee8547',NULL),(52,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','af8beaa0-5260-43b7-90c4-f4a470a6b0c2',NULL),(53,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','85789116-6ecd-449a-b227-452d40d4d0ae',NULL),(54,'8c1ae065-3a93-49b6-a31b-a1f013e2bcb2','e20ae554-2b13-4fdb-b641-dc63fd7b0cc6',NULL),(55,'62bfbdd9-c6ef-4d80-b531-4518999594da','5e6f1991-9a35-464d-8c9c-117cceec0abd',NULL),(56,'62bfbdd9-c6ef-4d80-b531-4518999594da','1722e620-6bd5-43d0-8d9c-a41afb0caaad',NULL),(57,'62bfbdd9-c6ef-4d80-b531-4518999594da','ae75d8f7-d306-45cb-9a3e-5c4d7d0e86ae',NULL),(58,'62bfbdd9-c6ef-4d80-b531-4518999594da','2f9989bb-abc1-4115-ac43-185a7e5b96a4',NULL),(59,'62bfbdd9-c6ef-4d80-b531-4518999594da','ae6ae6fc-0d40-4bc6-8602-43458689e885',NULL),(60,'a88b2f64-0acf-4c18-b33b-611fed63c43c','12940814-5f21-49ba-b92f-c67480aed608',NULL),(61,'a88b2f64-0acf-4c18-b33b-611fed63c43c','88480d8a-5024-4913-9fe9-248727411ad0',NULL),(62,'a88b2f64-0acf-4c18-b33b-611fed63c43c','68b1fd84-725c-42d2-86be-3e8a2337425b',NULL),(63,'a88b2f64-0acf-4c18-b33b-611fed63c43c','2f9989bb-abc1-4115-ac43-185a7e5b96a4',NULL),(64,'a88b2f64-0acf-4c18-b33b-611fed63c43c','8b0df081-5f62-4091-a1c4-e3ca769145cf',NULL),(65,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','aa39317c-beaa-4ca1-a8ee-45a93390272f',NULL),(66,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','096b6781-f722-445e-9095-a0e7a09c8b0f',NULL),(67,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','e3ba3285-b8cf-448c-9baf-e55117acf191',NULL),(68,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','8ad238bd-9660-4c2a-94bc-163924479e8a',NULL),(69,'93c5f5fc-1eee-44f7-9c12-5b961a1ff4d1','e37b0d0f-d1bc-4c91-b446-6b6aca4c8ae4',NULL),(70,'d0641904-1587-4823-9ad5-e45602415cf2','48a20a54-4685-42b7-8e66-37983d6f4fe6',NULL),(71,'d0641904-1587-4823-9ad5-e45602415cf2','8603838a-b28c-4f5d-b9a1-1dcee224a33d',NULL),(72,'d0641904-1587-4823-9ad5-e45602415cf2','6988f5b4-61a4-4bfb-b75c-a517f82a5002',NULL),(73,'d0641904-1587-4823-9ad5-e45602415cf2','b78ccd00-5cb5-4efb-9fd4-e36d7e785660',NULL),(74,'d0641904-1587-4823-9ad5-e45602415cf2','0a4299cc-b6c3-42e3-96d4-5a58c2bd969c',NULL),(75,'c6cd3140-1d25-45c0-8337-0ad3281df05b','f274c029-ca14-4abb-899e-e4fcf846616f',NULL),(76,'c6cd3140-1d25-45c0-8337-0ad3281df05b','9425b259-bc03-460a-ac9e-29e4bd52290f',NULL),(77,'c6cd3140-1d25-45c0-8337-0ad3281df05b','b356cd95-4464-409c-a90d-4c4d7d1df13a',NULL),(78,'c6cd3140-1d25-45c0-8337-0ad3281df05b','93eaae36-6240-4d0c-93c5-047dc123cd92',NULL),(79,'c6cd3140-1d25-45c0-8337-0ad3281df05b','402d420c-b902-4695-9e74-7394afec8d7b',NULL),(80,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','be799d69-3582-4bb7-9677-811a084cb60e',NULL),(81,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','3cba452e-7cf8-46ad-b600-2c849cca1781',NULL),(82,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','26115232-5250-4001-8725-d90ba42393b1',NULL),(83,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','dee3a9ef-aab4-466e-820c-cf0da1ba8242',NULL),(84,'654bf184-3ab7-4b1e-8030-52bb2f5732f5','35d5f0f7-b3d4-48f4-9ce1-181b0f755e43',NULL);
/*!40000 ALTER TABLE `UserPersonality_PersonalityTags_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VerificationToken`
--

DROP TABLE IF EXISTS `VerificationToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VerificationToken` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(3) NOT NULL,
  UNIQUE KEY `VerificationToken_token_key` (`token`),
  UNIQUE KEY `VerificationToken_identifier_token_key` (`identifier`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VerificationToken`
--

LOCK TABLES `VerificationToken` WRITE;
/*!40000 ALTER TABLE `VerificationToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `VerificationToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_activity`
--

DROP TABLE IF EXISTS `directus_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_activity_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=3571 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_activity`
--

LOCK TABLES `directus_activity` WRITE;
/*!40000 ALTER TABLE `directus_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_collections`
--

DROP TABLE IF EXISTS `directus_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `singleton` tinyint(1) NOT NULL DEFAULT '0',
  `translations` json DEFAULT NULL,
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT '1',
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` json DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  `preview_url` varchar(255) DEFAULT NULL,
  `versioning` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collection`),
  KEY `directus_collections_group_foreign` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_collections`
--

LOCK TABLES `directus_collections` WRITE;
/*!40000 ALTER TABLE `directus_collections` DISABLE KEYS */;
INSERT INTO `directus_collections` VALUES ('Account',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,1,'User','open',NULL,0),('Address',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,1,'Companies','open',NULL,0),('Careers',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,2,NULL,'open',NULL,0),('Careers_Courses','import_export',NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,2,'Careers','open',NULL,0),('Companies',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,1,NULL,'open',NULL,0),('Contact',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,2,'Companies','open',NULL,0),('Courses',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,3,'Companies','open',NULL,0),('EvaluationFormAnswer',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,2,'EvaluationFormStep','open',NULL,0),('EvaluationFormQuestion',NULL,NULL,'{{question}}',0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,1,'EvaluationFormStep','open',NULL,0),('EvaluationFormStep',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,4,NULL,'open',NULL,0),('EvaluationFormUserResponse',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,3,'EvaluationFormStep','open',NULL,0),('FaqItem',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,5,NULL,'open',NULL,0),('PersonalityTags',NULL,NULL,'{{name}}',0,0,NULL,'status',1,'archived','draft','sort','all',NULL,'[\"name\"]',1,'UserPersonality','open',NULL,0),('Profile',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,3,'User','open',NULL,0),('Prototypes',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,1,'Careers','open',NULL,0),('Quizzes',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,6,NULL,'open',NULL,0),('QuizzResource',NULL,NULL,NULL,0,0,NULL,'status',1,'archived','draft','sort','all',NULL,NULL,1,'Quizzes','open',NULL,0),('Session',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,2,'User','open',NULL,0),('User',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,7,NULL,'open',NULL,0),('UserPersonality',NULL,NULL,'{{name}}',0,0,NULL,'status',1,'archived','draft','sort','all',NULL,'[\"name\"]',3,NULL,'open',NULL,0),('UserPersonality_PersonalityTags','import_export',NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,8,NULL,'open',NULL,0),('UserPersonality_PersonalityTags_1','import_export',NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,9,NULL,'open',NULL,0),('UserPersonality_PersonalityTags_2','import_export',NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,10,NULL,'open',NULL,0);
/*!40000 ALTER TABLE `directus_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_dashboards`
--

DROP TABLE IF EXISTS `directus_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_dashboards_user_created_foreign` (`user_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_dashboards`
--

LOCK TABLES `directus_dashboards` WRITE;
/*!40000 ALTER TABLE `directus_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_extensions`
--

DROP TABLE IF EXISTS `directus_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_extensions` (
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_extensions`
--

LOCK TABLES `directus_extensions` WRITE;
/*!40000 ALTER TABLE `directus_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_fields`
--

DROP TABLE IF EXISTS `directus_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` json DEFAULT NULL,
  `display` varchar(64) DEFAULT NULL,
  `display_options` json DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` json DEFAULT NULL,
  `note` text,
  `conditions` json DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `group` varchar(64) DEFAULT NULL,
  `validation` json DEFAULT NULL,
  `validation_message` text,
  PRIMARY KEY (`id`),
  KEY `directus_fields_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_fields`
--

LOCK TABLES `directus_fields` WRITE;
/*!40000 ALTER TABLE `directus_fields` DISABLE KEYS */;
INSERT INTO `directus_fields` VALUES (1,'Account','createdAt',NULL,NULL,NULL,NULL,NULL,0,0,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(3,'Quizzes','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(4,'Quizzes','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(5,'Quizzes','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(6,'Quizzes','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(7,'Quizzes','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(8,'Quizzes','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(9,'Quizzes','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(10,'Quizzes','description',NULL,'input-multiline',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(11,'QuizzResource','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(12,'QuizzResource','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(13,'QuizzResource','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(14,'QuizzResource','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(15,'QuizzResource','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(16,'QuizzResource','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(17,'QuizzResource','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(19,'QuizzResource','quiz_id','m2o',NULL,NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(20,'QuizzResource','description',NULL,'input-multiline',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(23,'Quizzes','image','file','file-image',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(24,'QuizzResource','file','file','file',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(25,'Companies','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(26,'Companies','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(27,'Companies','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(28,'Companies','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(29,'Companies','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(30,'Companies','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(31,'Companies','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(32,'Companies','name',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(33,'Companies','description',NULL,'input-multiline',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(34,'Companies','logo','file','file-image',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(35,'Courses','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(36,'Courses','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(37,'Courses','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(38,'Courses','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(39,'Courses','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(40,'Courses','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(41,'Courses','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(42,'Courses','name',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(43,'Courses','description',NULL,'input-multiline',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(44,'Courses','sponsonrship','cast-boolean','boolean',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(45,'Courses','price',NULL,'input',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(46,'Courses','location',NULL,'input','{\"defaultView\": {\"zoom\": 0, \"pitch\": 0, \"center\": {\"lat\": 0, \"lng\": 0}, \"bearing\": 0}, \"geometryType\": \"Point\"}',NULL,NULL,0,0,12,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(47,'Courses','start_date',NULL,'datetime','{}',NULL,NULL,0,0,13,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(49,'Quizzes','duration',NULL,'datetime',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(50,'Courses','course_type','cast-json','tags','{\"presets\": [\"training\", \"apprenticeship\"]}',NULL,NULL,0,0,15,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(51,'Courses','pace','cast-json','tags','{\"presets\": [\"part_time\", \"full_time\"]}',NULL,NULL,0,0,16,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(54,'Faq','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(55,'Faq','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(56,'Faq','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(57,'Faq','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(58,'Faq','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(59,'Faq','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(60,'Faq','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(61,'Faq','question',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(62,'Faq','answer',NULL,'input-multiline',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(63,'Faq','order',NULL,'input',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(64,'FaqItem','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(65,'FaqItem','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(66,'FaqItem','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(67,'FaqItem','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(68,'FaqItem','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(69,'FaqItem','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(70,'FaqItem','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(71,'FaqItem','question',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(72,'FaqItem','answer',NULL,'input-multiline',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(81,'PersonalityTags','id','uuid','input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(82,'PersonalityTags','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(83,'PersonalityTags','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(84,'PersonalityTags','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(85,'PersonalityTags','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(86,'PersonalityTags','name',NULL,'input','{\"trim\": true}',NULL,NULL,0,0,6,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(87,'UserPersonality','id','uuid','input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(88,'UserPersonality','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(89,'UserPersonality','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(90,'UserPersonality','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(91,'UserPersonality','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(92,'UserPersonality','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(93,'UserPersonality','strengths','m2m','list-m2m',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(94,'UserPersonality_PersonalityTags','id',NULL,NULL,NULL,NULL,NULL,0,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(95,'UserPersonality_PersonalityTags','UserPersonality_id',NULL,NULL,NULL,NULL,NULL,0,1,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(96,'UserPersonality_PersonalityTags','PersonalityTags_id',NULL,NULL,NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(97,'UserPersonality','ideal_work_environment','m2m','list-m2m',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(98,'UserPersonality_PersonalityTags_1','id',NULL,NULL,NULL,NULL,NULL,0,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(99,'UserPersonality_PersonalityTags_1','UserPersonality_id',NULL,NULL,NULL,NULL,NULL,0,1,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(100,'UserPersonality_PersonalityTags_1','PersonalityTags_id',NULL,NULL,NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(101,'UserPersonality','weaknesses','m2m','list-m2m',NULL,NULL,NULL,0,0,12,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(102,'UserPersonality_PersonalityTags_2','id',NULL,NULL,NULL,NULL,NULL,0,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(103,'UserPersonality_PersonalityTags_2','UserPersonality_id',NULL,NULL,NULL,NULL,NULL,0,1,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(104,'UserPersonality_PersonalityTags_2','PersonalityTags_id',NULL,NULL,NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(105,'UserPersonality','you_at_work',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(106,'UserPersonality','strengths_summary',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(107,'UserPersonality','communications_skills',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,13,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(108,'UserPersonality','leadership',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,14,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(109,'UserPersonality','teamwork',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,15,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(110,'UserPersonality','name',NULL,'input','{\"trim\": true}',NULL,NULL,0,0,7,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(115,'Profile','id','uuid','input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(116,'Profile','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(117,'Profile','sort',NULL,'input',NULL,NULL,NULL,0,1,4,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(118,'Profile','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(119,'Profile','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(120,'Profile','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(121,'Profile','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,8,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(122,'Profile','personality','m2o','select-dropdown-m2o','{\"template\": \"{{name}}\"}',NULL,NULL,0,0,9,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(123,'Profile','user','m2o','select-dropdown-m2o','{\"template\": \"{{id}}\"}',NULL,NULL,0,0,10,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(129,'Careers','id','uuid','input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(130,'Careers','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(131,'Careers','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(132,'Careers','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(133,'Careers','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(134,'Careers','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(135,'Careers','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(136,'Careers','name',NULL,'input',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(137,'Careers','description',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(138,'Careers','salaryMin',NULL,'input',NULL,NULL,NULL,0,0,15,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(139,'Careers','salaryMax',NULL,'input',NULL,NULL,NULL,0,0,16,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(140,'Careers','retrainingWeeks',NULL,'input',NULL,NULL,NULL,0,0,17,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(141,'Careers','pace','cast-json','tags',NULL,NULL,NULL,0,0,18,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(142,'Careers','format','cast-json','tags',NULL,NULL,NULL,0,0,19,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(143,'Careers','courses','m2m','list-m2m',NULL,'related-values','{\"template\": \"{{Courses_id.name}}\"}',0,0,20,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(144,'Careers_Courses','id',NULL,NULL,NULL,NULL,NULL,0,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(145,'Careers_Courses','Careers_id',NULL,NULL,NULL,NULL,NULL,0,1,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(146,'Careers_Courses','Courses_id',NULL,NULL,NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(168,'EvaluationFormStep','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(169,'EvaluationFormStep','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(170,'EvaluationFormStep','sort',NULL,'input',NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(171,'EvaluationFormStep','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(172,'EvaluationFormStep','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(173,'EvaluationFormStep','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(174,'EvaluationFormStep','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(175,'EvaluationFormQuestion','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(176,'EvaluationFormQuestion','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(177,'EvaluationFormQuestion','sort',NULL,'input',NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(178,'EvaluationFormQuestion','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(179,'EvaluationFormQuestion','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(180,'EvaluationFormQuestion','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(181,'EvaluationFormQuestion','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(182,'EvaluationFormQuestion','step','m2o','select-dropdown-m2o','{\"template\": \"{{id}}\"}','related-values','{\"template\": \"{{title}}\"}',0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(183,'EvaluationFormStep','title',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(184,'EvaluationFormStep','description',NULL,'input-multiline','{\"trim\": true}',NULL,NULL,0,0,9,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(185,'EvaluationFormAnswer','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(186,'EvaluationFormAnswer','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(187,'EvaluationFormAnswer','sort',NULL,'input',NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(188,'EvaluationFormAnswer','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(189,'EvaluationFormAnswer','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(190,'EvaluationFormAnswer','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(191,'EvaluationFormAnswer','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(192,'EvaluationFormAnswer','value',NULL,'input',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(193,'EvaluationFormAnswer','question','m2o','select-dropdown-m2o',NULL,'related-values','{\"template\": \"{{question}}\"}',0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(194,'EvaluationFormQuestion','question',NULL,'input',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(195,'EvaluationFormQuestion','type',NULL,'select-dropdown','{\"choices\": [{\"text\": \"Button Input\", \"value\": \"button_input\"}, {\"text\": \"Text\", \"value\": \"text\"}, {\"text\": \"Range\", \"value\": \"range\"}, {\"text\": \"Select\", \"value\": \"select\"}, {\"text\": \"MBTI Personality\", \"value\": \"mbti\"}]}',NULL,NULL,0,0,10,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(197,'EvaluationFormUserResponse','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(198,'EvaluationFormUserResponse','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,2,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(199,'EvaluationFormUserResponse','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,3,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(200,'EvaluationFormUserResponse','question','m2o','select-dropdown-m2o','{\"template\": \"{{question}}\"}',NULL,NULL,0,0,4,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(201,'EvaluationFormUserResponse','answer',NULL,'input',NULL,NULL,NULL,0,0,5,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(204,'EvaluationFormUserResponse','user','m2o','select-dropdown-m2o',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(205,'EvaluationFormUserResponse','uid',NULL,'input',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(206,'Profile','uid',NULL,'input',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(224,'EvaluationFormAnswer','label',NULL,'input',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(225,'EvaluationFormAnswer','letter',NULL,'select-dropdown','{\"choices\": [{\"text\": \"E\", \"value\": \"E\"}, {\"text\": \"I\", \"value\": \"I\"}, {\"text\": \"S\", \"value\": \"S\"}, {\"text\": \"N\", \"value\": \"N\"}, {\"text\": \"T\", \"value\": \"T\"}, {\"text\": \"F\", \"value\": \"F\"}, {\"text\": \"J\", \"value\": \"J\"}, {\"text\": \"P\", \"value\": \"P\"}]}',NULL,NULL,0,0,11,'full',NULL,'letter if the answers is of a MBTI personality question',NULL,0,NULL,NULL,NULL),(226,'Profile','evaluation_response','cast-json','input-code',NULL,NULL,NULL,0,0,12,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(227,'User','id',NULL,NULL,NULL,NULL,NULL,0,0,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(228,'Profile','avatar','file','file-image','{\"folder\": null}',NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(229,'Profile','userId',NULL,NULL,NULL,NULL,NULL,0,0,13,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(231,'User','notify_career_updates','cast-boolean','boolean',NULL,NULL,NULL,0,0,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(232,'User','notify_training_updates','cast-boolean','boolean',NULL,NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(233,'Profile','country',NULL,'input',NULL,NULL,NULL,0,0,14,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(234,'Profile','state',NULL,'input','{\"placeholder\": null}',NULL,NULL,0,0,15,'full',NULL,'ISO 3166 code - 2 letters HH',NULL,0,NULL,NULL,NULL),(235,'Address','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(236,'Address','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(237,'Address','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(238,'Address','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(239,'Address','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(240,'Address','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(241,'Address','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(242,'Address','street',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(244,'Address','zip',NULL,'input',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(245,'Address','country',NULL,'input',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(247,'Contact','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(248,'Contact','status',NULL,'select-dropdown','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}','labels','{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}',0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(249,'Contact','sort',NULL,'input',NULL,NULL,NULL,0,1,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(250,'Contact','user_created','user-created','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,4,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(251,'Contact','date_created','date-created','datetime',NULL,'datetime','{\"relative\": true}',1,1,5,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(252,'Contact','user_updated','user-updated','select-dropdown-m2o','{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}','user',NULL,1,1,6,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(253,'Contact','date_updated','date-updated','datetime',NULL,'datetime','{\"relative\": true}',1,1,7,'half',NULL,NULL,NULL,0,NULL,NULL,NULL),(254,'Contact','first_name',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(255,'Contact','last_name',NULL,'input',NULL,NULL,NULL,0,0,9,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(256,'Contact','email',NULL,'input',NULL,NULL,NULL,0,0,10,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(257,'Contact','phone',NULL,'input',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(258,'Address','company_id','m2o','select-dropdown-m2o','{\"template\": \"{{name}}\"}',NULL,NULL,0,0,13,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(259,'Contact','company_id','m2o','select-dropdown-m2o','{\"template\": \"{{name}}\"}',NULL,NULL,0,0,12,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(260,'Companies','addresses','o2m','list-o2m','{\"template\": \"{{street}}{{street_no}}{{zip}}{{country}}\"}',NULL,NULL,0,0,11,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(261,'Companies','contacts','o2m','list-o2m','{\"template\": \"{{first_name}}{{last_name}}\"}',NULL,NULL,0,0,12,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(262,'Contact','notify_lead_updates','cast-boolean','boolean',NULL,NULL,NULL,0,0,13,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(263,'Contact','notify_view_updates','cast-boolean','boolean',NULL,NULL,NULL,0,0,14,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(264,'Contact','notify_billing_updates','cast-boolean','boolean',NULL,NULL,NULL,0,0,15,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(265,'Careers','detailsTasks',NULL,'input-rich-text-html',NULL,NULL,NULL,0,0,11,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(267,'Careers','detailsSkills',NULL,'input-rich-text-html',NULL,NULL,NULL,0,0,13,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(271,'Careers','detailsRequirement',NULL,'input-rich-text-html',NULL,NULL,NULL,0,0,12,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(272,'Careers','detailsFuture',NULL,'input-multiline',NULL,NULL,NULL,0,0,14,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(273,'Prototypes','id',NULL,'input',NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(274,'Prototypes','name',NULL,'input',NULL,NULL,NULL,0,0,4,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(275,'Prototypes','description',NULL,'input-rich-text-html',NULL,NULL,NULL,0,0,5,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(276,'Prototypes','completed','cast-boolean','boolean','{\"label\": \"Completed\"}',NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(277,'Prototypes','image','file','file-image',NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(278,'Careers','image','file','file-image',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(281,'User','evaluationCompleted','cast-boolean','boolean',NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(282,'Courses','image','file','file-image',NULL,NULL,NULL,0,0,17,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(283,'Quizzes','name',NULL,'input',NULL,NULL,NULL,0,0,8,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(284,'Companies','type',NULL,'select-dropdown','{\"choices\": [{\"text\": \"Training Institute\", \"value\": \"training_institute\"}, {\"text\": \"Company\", \"value\": \"company\"}]}',NULL,NULL,0,0,13,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(285,'Companies','web',NULL,'input',NULL,NULL,NULL,0,0,14,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(286,'Companies','email_billing',NULL,'input','{\"placeholder\": \"Email for billing\"}',NULL,NULL,0,0,15,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(288,'Contact','userId','m2o','select-dropdown-m2o','{\"template\": \"{{email}}\"}',NULL,NULL,0,0,16,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(289,'Address','city',NULL,'input',NULL,NULL,NULL,0,0,14,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(290,'Companies','vat',NULL,'input',NULL,NULL,NULL,0,0,16,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(291,'Courses','company','m2o','select-dropdown-m2o','{\"template\": \"{{name}}\"}',NULL,NULL,0,0,18,'full',NULL,NULL,NULL,1,NULL,NULL,NULL),(292,'User','premium','cast-boolean','boolean',NULL,NULL,NULL,0,0,4,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `directus_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_files`
--

DROP TABLE IF EXISTS `directus_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text,
  `location` text,
  `tags` text,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  KEY `directus_files_modified_by_foreign` (`modified_by`),
  KEY `directus_files_folder_foreign` (`folder`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_files`
--

LOCK TABLES `directus_files` WRITE;
/*!40000 ALTER TABLE `directus_files` DISABLE KEYS */;
INSERT INTO `directus_files` VALUES ('096b6463-d320-4ea4-aa43-2304d160619d','local','096b6463-d320-4ea4-aa43-2304d160619d.webp','atwork-recruiter-3.webp','Atwork Recruiter 3','image/webp',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 14:19:49',NULL,'2023-12-15 14:19:49',NULL,20358,768,512,NULL,NULL,NULL,NULL,NULL,'{}'),('3540d97b-8d9f-4b24-ad3f-1db18b4650d2','local','3540d97b-8d9f-4b24-ad3f-1db18b4650d2.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 17:01:50',NULL,'2023-12-15 17:01:50',NULL,257029,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('37c31057-7387-452f-bc3b-f0d3252de685','local','37c31057-7387-452f-bc3b-f0d3252de685.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:59:27',NULL,'2023-12-15 16:59:27',NULL,206473,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('38bf6fde-de57-4a0e-ba6f-be11eaf2c0f8','local','38bf6fde-de57-4a0e-ba6f-be11eaf2c0f8.webp','Web Development Bootcamp','Web Development Bootcamp','image/webp',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 01:06:21',NULL,'2023-12-22 01:06:22',NULL,118104,1200,800,NULL,NULL,NULL,NULL,NULL,'{}'),('46b88c3b-3d04-4073-8ada-f27085b0e8ad','local','46b88c3b-3d04-4073-8ada-f27085b0e8ad.webp','Web Development Bootcamp 2','Web Development Bootcamp 2','image/webp',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 20:38:53',NULL,'2023-12-22 20:38:53',NULL,118104,1200,800,NULL,NULL,NULL,NULL,NULL,'{}'),('4fc7d4da-3a8f-443d-adfc-330438af7761','local','4fc7d4da-3a8f-443d-adfc-330438af7761.jpeg','we','we','image/jpeg',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-21 22:40:06',NULL,'2023-12-21 22:40:06',NULL,518458,1196,1847,NULL,NULL,NULL,NULL,NULL,'{}'),('6111c6f6-9887-4d98-9153-a8ec442c857c','local','6111c6f6-9887-4d98-9153-a8ec442c857c.jpeg','gfg','gfg','image/jpeg',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-21 22:49:01',NULL,'2023-12-21 22:49:01',NULL,518458,1196,1847,NULL,NULL,NULL,NULL,NULL,'{}'),('774cf134-31ce-4efb-916e-8cf4d0998a64','local','774cf134-31ce-4efb-916e-8cf4d0998a64.png','test 2','test 2','image/png',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 00:53:28',NULL,'2023-12-22 00:53:28',NULL,881799,1132,640,NULL,NULL,NULL,NULL,NULL,'{}'),('8047a554-0291-42f5-bfb9-7176c28a7a3e','local','8047a554-0291-42f5-bfb9-7176c28a7a3e.jpeg','test course','test course','image/jpeg',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 00:45:29',NULL,'2023-12-22 00:45:30',NULL,518458,1196,1847,NULL,NULL,NULL,NULL,NULL,'{}'),('93b06164-7c13-4d82-aab0-5fd6731ff5c6','local','93b06164-7c13-4d82-aab0-5fd6731ff5c6.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:39:34',NULL,'2023-12-15 16:39:35',NULL,167833,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('a4059f09-4e43-4381-bd45-9f3c5caa3dc1','local','a4059f09-4e43-4381-bd45-9f3c5caa3dc1.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 17:00:32',NULL,'2023-12-15 17:00:32',NULL,163505,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('aa896584-d215-4334-a06c-2c9d662bd6c0','local','aa896584-d215-4334-a06c-2c9d662bd6c0.jpeg','gfg','gfg','image/jpeg',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-21 22:49:37',NULL,'2023-12-21 22:49:37',NULL,518458,1196,1847,NULL,NULL,NULL,NULL,NULL,'{}'),('abc485b3-2e5c-4424-ade6-5f2b04de4c10','local','abc485b3-2e5c-4424-ade6-5f2b04de4c10.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:31:04',NULL,'2023-12-15 16:31:04',NULL,216483,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('aee4dcb4-3269-4030-85d4-c7274d6b77fc','local','aee4dcb4-3269-4030-85d4-c7274d6b77fc.webp','Web Development Bootcamp','Web Development Bootcamp','image/webp',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 18:31:41',NULL,'2023-12-22 18:31:41',NULL,118104,1200,800,NULL,NULL,NULL,NULL,NULL,'{}'),('c56ba460-67e5-498b-9f33-6b9d495accbd','local','c56ba460-67e5-498b-9f33-6b9d495accbd.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-18 16:09:34',NULL,'2023-12-18 16:09:35',NULL,881799,1132,640,NULL,NULL,NULL,NULL,NULL,'{}'),('cc71e0b6-a617-4ee2-adc4-22a32b3091b5','local','cc71e0b6-a617-4ee2-adc4-22a32b3091b5.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 16:07:42',NULL,'2023-12-15 16:07:44',NULL,141924,522,228,NULL,NULL,NULL,NULL,NULL,'{}'),('e496a492-3741-4b69-afbd-c169ad7a15b0','local','e496a492-3741-4b69-afbd-c169ad7a15b0.webp','atwork-recruiter-3.webp',NULL,'image/webp',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 14:18:57','3673a855-5f81-40c5-a61b-8a2198620107','2023-12-15 14:19:42',NULL,15692,649,393,NULL,NULL,NULL,NULL,NULL,'{}'),('eec8d92d-da61-4b8e-bc37-0f112502b554','local','eec8d92d-da61-4b8e-bc37-0f112502b554.png','4439796.png','4439796','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-11-13 19:13:18',NULL,'2023-11-13 19:13:18',NULL,20432,512,512,NULL,NULL,NULL,NULL,NULL,'{}'),('f55a591a-3c99-4a8f-8991-2a99158ae3bf','local','f55a591a-3c99-4a8f-8991-2a99158ae3bf.png','Untitled-1.png','Untitled 1','image/png',NULL,'3673a855-5f81-40c5-a61b-8a2198620107','2023-12-18 16:30:23',NULL,'2023-12-18 16:30:23',NULL,881799,1132,640,NULL,NULL,NULL,NULL,NULL,'{}'),('f5ab0bb9-9249-444e-8868-820c27976723','local','f5ab0bb9-9249-444e-8868-820c27976723.webp','Web Development Bootcamp','Web Development Bootcamp','image/webp',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 18:33:12',NULL,'2023-12-22 18:33:13',NULL,118104,1200,800,NULL,NULL,NULL,NULL,NULL,'{}'),('fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b','local','fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b.jpeg','Web Development Bootcamp','Web Development Bootcamp','image/jpeg',NULL,'34fe3a80-45f0-414f-854c-bebccd64b81a','2023-12-22 17:02:55',NULL,'2023-12-22 17:02:55',NULL,518458,1196,1847,NULL,NULL,NULL,NULL,NULL,'{}');
/*!40000 ALTER TABLE `directus_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_flows`
--

DROP TABLE IF EXISTS `directus_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` json DEFAULT NULL,
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  KEY `directus_flows_user_created_foreign` (`user_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_flows`
--

LOCK TABLES `directus_flows` WRITE;
/*!40000 ALTER TABLE `directus_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_folders`
--

DROP TABLE IF EXISTS `directus_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_folders_parent_foreign` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_folders`
--

LOCK TABLES `directus_folders` WRITE;
/*!40000 ALTER TABLE `directus_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_migrations`
--

DROP TABLE IF EXISTS `directus_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_migrations`
--

LOCK TABLES `directus_migrations` WRITE;
/*!40000 ALTER TABLE `directus_migrations` DISABLE KEYS */;
INSERT INTO `directus_migrations` VALUES ('20201028A','Remove Collection Foreign Keys','2023-11-13 18:08:11'),('20201029A','Remove System Relations','2023-11-13 18:08:11'),('20201029B','Remove System Collections','2023-11-13 18:08:11'),('20201029C','Remove System Fields','2023-11-13 18:08:11'),('20201105A','Add Cascade System Relations','2023-11-13 18:08:12'),('20201105B','Change Webhook URL Type','2023-11-13 18:08:12'),('20210225A','Add Relations Sort Field','2023-11-13 18:08:12'),('20210304A','Remove Locked Fields','2023-11-13 18:08:12'),('20210312A','Webhooks Collections Text','2023-11-13 18:08:12'),('20210331A','Add Refresh Interval','2023-11-13 18:08:12'),('20210415A','Make Filesize Nullable','2023-11-13 18:08:12'),('20210416A','Add Collections Accountability','2023-11-13 18:08:12'),('20210422A','Remove Files Interface','2023-11-13 18:08:12'),('20210506A','Rename Interfaces','2023-11-13 18:08:12'),('20210510A','Restructure Relations','2023-11-13 18:08:12'),('20210518A','Add Foreign Key Constraints','2023-11-13 18:08:12'),('20210519A','Add System Fk Triggers','2023-11-13 18:08:12'),('20210521A','Add Collections Icon Color','2023-11-13 18:08:12'),('20210525A','Add Insights','2023-11-13 18:08:13'),('20210608A','Add Deep Clone Config','2023-11-13 18:08:13'),('20210626A','Change Filesize Bigint','2023-11-13 18:08:13'),('20210716A','Add Conditions to Fields','2023-11-13 18:08:13'),('20210721A','Add Default Folder','2023-11-13 18:08:13'),('20210802A','Replace Groups','2023-11-13 18:08:13'),('20210803A','Add Required to Fields','2023-11-13 18:08:13'),('20210805A','Update Groups','2023-11-13 18:08:13'),('20210805B','Change Image Metadata Structure','2023-11-13 18:08:13'),('20210811A','Add Geometry Config','2023-11-13 18:08:13'),('20210831A','Remove Limit Column','2023-11-13 18:08:13'),('20210903A','Add Auth Provider','2023-11-13 18:08:13'),('20210907A','Webhooks Collections Not Null','2023-11-13 18:08:13'),('20210910A','Move Module Setup','2023-11-13 18:08:13'),('20210920A','Webhooks URL Not Null','2023-11-13 18:08:13'),('20210924A','Add Collection Organization','2023-11-13 18:08:13'),('20210927A','Replace Fields Group','2023-11-13 18:08:13'),('20210927B','Replace M2M Interface','2023-11-13 18:08:13'),('20210929A','Rename Login Action','2023-11-13 18:08:13'),('20211007A','Update Presets','2023-11-13 18:08:13'),('20211009A','Add Auth Data','2023-11-13 18:08:13'),('20211016A','Add Webhook Headers','2023-11-13 18:08:13'),('20211103A','Set Unique to User Token','2023-11-13 18:08:13'),('20211103B','Update Special Geometry','2023-11-13 18:08:13'),('20211104A','Remove Collections Listing','2023-11-13 18:08:13'),('20211118A','Add Notifications','2023-11-13 18:08:13'),('20211211A','Add Shares','2023-11-13 18:08:13'),('20211230A','Add Project Descriptor','2023-11-13 18:08:13'),('20220303A','Remove Default Project Color','2023-11-13 18:08:13'),('20220308A','Add Bookmark Icon and Color','2023-11-13 18:08:13'),('20220314A','Add Translation Strings','2023-11-13 18:08:14'),('20220322A','Rename Field Typecast Flags','2023-11-13 18:08:14'),('20220323A','Add Field Validation','2023-11-13 18:08:14'),('20220325A','Fix Typecast Flags','2023-11-13 18:08:14'),('20220325B','Add Default Language','2023-11-13 18:08:14'),('20220402A','Remove Default Value Panel Icon','2023-11-13 18:08:14'),('20220429A','Add Flows','2023-11-13 18:08:14'),('20220429B','Add Color to Insights Icon','2023-11-13 18:08:14'),('20220429C','Drop Non Null From IP of Activity','2023-11-13 18:08:14'),('20220429D','Drop Non Null From Sender of Notifications','2023-11-13 18:08:14'),('20220614A','Rename Hook Trigger to Event','2023-11-13 18:08:14'),('20220801A','Update Notifications Timestamp Column','2023-11-13 18:08:14'),('20220802A','Add Custom Aspect Ratios','2023-11-13 18:08:14'),('20220826A','Add Origin to Accountability','2023-11-13 18:08:14'),('20230401A','Update Material Icons','2023-11-13 18:08:14'),('20230525A','Add Preview Settings','2023-11-13 18:08:14'),('20230526A','Migrate Translation Strings','2023-11-13 18:08:14'),('20230721A','Require Shares Fields','2023-11-13 18:08:14'),('20230823A','Add Content Versioning','2023-11-13 18:08:14'),('20230927A','Themes','2023-11-13 18:08:15'),('20231009A','Update CSV Fields to Text','2023-11-13 18:08:15'),('20231009B','Update Panel Options','2023-11-13 18:08:15'),('20231010A','Add Extensions','2023-11-13 18:08:15');
/*!40000 ALTER TABLE `directus_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_notifications`
--

DROP TABLE IF EXISTS `directus_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_notifications_recipient_foreign` (`recipient`),
  KEY `directus_notifications_sender_foreign` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_notifications`
--

LOCK TABLES `directus_notifications` WRITE;
/*!40000 ALTER TABLE `directus_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_operations`
--

DROP TABLE IF EXISTS `directus_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `options` json DEFAULT NULL,
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  KEY `directus_operations_flow_foreign` (`flow`),
  KEY `directus_operations_user_created_foreign` (`user_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_operations`
--

LOCK TABLES `directus_operations` WRITE;
/*!40000 ALTER TABLE `directus_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_panels`
--

DROP TABLE IF EXISTS `directus_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT '0',
  `note` text,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` json DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_panels_dashboard_foreign` (`dashboard`),
  KEY `directus_panels_user_created_foreign` (`user_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_panels`
--

LOCK TABLES `directus_panels` WRITE;
/*!40000 ALTER TABLE `directus_panels` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_permissions`
--

DROP TABLE IF EXISTS `directus_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` json DEFAULT NULL,
  `validation` json DEFAULT NULL,
  `presets` json DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`),
  KEY `directus_permissions_collection_foreign` (`collection`),
  KEY `directus_permissions_role_foreign` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_permissions`
--

LOCK TABLES `directus_permissions` WRITE;
/*!40000 ALTER TABLE `directus_permissions` DISABLE KEYS */;
INSERT INTO `directus_permissions` VALUES (1,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_files','create','{}',NULL,NULL,'*'),(2,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_files','read','{}',NULL,NULL,'*'),(3,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_files','update','{}',NULL,NULL,'*'),(4,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_files','delete','{}',NULL,NULL,'*'),(5,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_dashboards','create','{}',NULL,NULL,'*'),(6,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_dashboards','read','{}',NULL,NULL,'*'),(7,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_dashboards','update','{}',NULL,NULL,'*'),(8,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_dashboards','delete','{}',NULL,NULL,'*'),(9,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_panels','create','{}',NULL,NULL,'*'),(10,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_panels','read','{}',NULL,NULL,'*'),(11,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_panels','update','{}',NULL,NULL,'*'),(12,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_panels','delete','{}',NULL,NULL,'*'),(13,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_folders','create','{}',NULL,NULL,'*'),(14,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_folders','read','{}',NULL,NULL,'*'),(15,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_folders','update','{}',NULL,NULL,'*'),(16,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_folders','delete','{}',NULL,NULL,NULL),(17,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_users','read','{}',NULL,NULL,'*'),(18,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_users','update','{\"id\": {\"_eq\": \"$CURRENT_USER\"}}',NULL,NULL,'first_name,last_name,email,password,location,title,description,avatar,language,appearance,theme_light,theme_dark,theme_light_overrides,theme_dark_overrides,tfa_secret'),(19,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_roles','read','{}',NULL,NULL,'*'),(20,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_shares','read','{\"_or\": [{\"role\": {\"_eq\": \"$CURRENT_ROLE\"}}, {\"role\": {\"_null\": true}}]}',NULL,NULL,'*'),(21,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_shares','create','{}',NULL,NULL,'*'),(22,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_shares','update','{\"user_created\": {\"_eq\": \"$CURRENT_USER\"}}',NULL,NULL,'*'),(23,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_shares','delete','{\"user_created\": {\"_eq\": \"$CURRENT_USER\"}}',NULL,NULL,'*'),(24,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','directus_flows','read','{\"trigger\": {\"_eq\": \"manual\"}}',NULL,NULL,'id,status,name,icon,color,options,trigger'),(25,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormAnswer','create','{}','{}',NULL,'*'),(26,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormQuestion','create','{}','{}',NULL,'*'),(27,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormStep','create','{}','{}',NULL,'*'),(28,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','FaqItem','create','{}','{}',NULL,'*'),(29,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','PersonalityTags','create','{}','{}',NULL,'*'),(30,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Quizzes','create','{}','{}',NULL,'*'),(31,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','QuizzResource','create','{}','{}',NULL,'*'),(32,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers','create','{}','{}',NULL,'*'),(33,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers_Courses','create','{}','{}',NULL,'*'),(34,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Courses','create','{}','{}',NULL,'*'),(35,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers','read','{}','{}',NULL,'*'),(36,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers','update','{}','{}',NULL,'*'),(37,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers','delete','{}','{}',NULL,'*'),(38,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers_Courses','read','{}','{}',NULL,'*'),(39,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers_Courses','update','{}','{}',NULL,'*'),(40,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Careers_Courses','delete','{}','{}',NULL,'*'),(41,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Courses','read','{}','{}',NULL,'*'),(42,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Companies','create','{}','{}',NULL,'*'),(43,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Companies','read','{}','{}',NULL,'*'),(44,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Companies','update','{}','{}',NULL,'*'),(45,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Companies','delete','{}','{}',NULL,'*'),(46,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Courses','update','{}','{}',NULL,'*'),(47,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Courses','delete','{}','{}',NULL,'*'),(48,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormAnswer','read','{}','{}',NULL,'*'),(49,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormAnswer','update','{}','{}',NULL,'*'),(50,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormAnswer','delete','{}','{}',NULL,'*'),(51,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormQuestion','read','{}','{}',NULL,'*'),(52,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormQuestion','update','{}','{}',NULL,'*'),(53,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormQuestion','delete','{}','{}',NULL,'*'),(54,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormStep','read','{}','{}',NULL,'*'),(55,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormStep','update','{}','{}',NULL,'*'),(56,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','EvaluationFormStep','delete','{}','{}',NULL,'*'),(57,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','FaqItem','read','{}','{}',NULL,'*'),(58,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','FaqItem','update','{}','{}',NULL,'*'),(59,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','FaqItem','delete','{}','{}',NULL,'*'),(60,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','PersonalityTags','read','{}','{}',NULL,'*'),(61,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','PersonalityTags','update','{}','{}',NULL,'*'),(62,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','PersonalityTags','delete','{}','{}',NULL,'*'),(63,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Quizzes','read','{}','{}',NULL,'*'),(64,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Quizzes','update','{}','{}',NULL,'*'),(65,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Quizzes','delete','{}','{}',NULL,'*'),(66,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','QuizzResource','delete','{}','{}',NULL,'*'),(67,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','QuizzResource','update','{}','{}',NULL,'*'),(68,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','QuizzResource','read','{}','{}',NULL,'*'),(69,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality','create','{}','{}',NULL,'*'),(70,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality','read','{}','{}',NULL,'*'),(71,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality','update','{}','{}',NULL,'*'),(72,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality','delete','{}','{}',NULL,'*'),(73,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality','share','{}','{}',NULL,'*'),(74,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags','create','{}','{}',NULL,'*'),(75,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_1','create','{}','{}',NULL,'*'),(76,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_2','create','{}','{}',NULL,'*'),(77,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags','read','{}','{}',NULL,'*'),(78,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_1','read','{}','{}',NULL,'*'),(79,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_2','read','{}','{}',NULL,'*'),(80,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_2','update','{}','{}',NULL,'*'),(81,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_1','update','{}','{}',NULL,'*'),(82,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags','update','{}','{}',NULL,'*'),(83,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags','delete','{}','{}',NULL,'*'),(84,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_1','delete','{}','{}',NULL,'*'),(85,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_2','delete','{}','{}',NULL,'*'),(86,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags','share','{}','{}',NULL,'*'),(87,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_1','share','{}','{}',NULL,'*'),(88,'b8b40fed-a039-4d21-a5e1-6cfbc01a6637','UserPersonality_PersonalityTags_2','share','{}','{}',NULL,'*'),(89,NULL,'Careers','read','{}','{}',NULL,'*');
/*!40000 ALTER TABLE `directus_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_presets`
--

DROP TABLE IF EXISTS `directus_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_presets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` json DEFAULT NULL,
  `layout_options` json DEFAULT NULL,
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` json DEFAULT NULL,
  `icon` varchar(30) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_presets_collection_foreign` (`collection`),
  KEY `directus_presets_user_foreign` (`user`),
  KEY `directus_presets_role_foreign` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_presets`
--

LOCK TABLES `directus_presets` WRITE;
/*!40000 ALTER TABLE `directus_presets` DISABLE KEYS */;
INSERT INTO `directus_presets` VALUES (1,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'directus_translations',NULL,NULL,'{\"tabular\": {\"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(2,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Account',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(3,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Companies',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(4,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Quizzes',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25, \"fields\": [\"name\", \"description\", \"image\", \"status\"]}}','{\"tabular\": {\"widths\": {}}}',NULL,NULL,'bookmark',NULL),(5,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Companies',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(7,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'QuizzResource',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(9,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Faq',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(10,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'directus_users',NULL,'cards','{\"cards\": {\"page\": 1, \"sort\": [\"email\"], \"limit\": 25}}','{\"cards\": {\"icon\": \"account_circle\", \"size\": 4, \"title\": \"{{ first_name }} {{ last_name }}\", \"subtitle\": \"{{ email }}\"}}',NULL,NULL,'bookmark',NULL),(11,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'directus_files',NULL,'cards','{\"cards\": {\"sort\": [\"-uploaded_on\"], \"limit\": 25}}','{\"cards\": {\"icon\": \"insert_drive_file\", \"size\": 4, \"title\": \"{{ title }}\", \"imageFit\": \"crop\", \"subtitle\": \"{{ type }} • {{ filesize }}\"}}',NULL,NULL,'bookmark',NULL),(12,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Courses',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25, \"fields\": [\"name\", \"description\", \"sponsonrship\", \"status\"]}}','{\"tabular\": {\"widths\": {\"name\": 418.1818237304687}}}',NULL,NULL,'bookmark',NULL),(13,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'FaqItem',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(14,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'FaqItem',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(15,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'User',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25, \"fields\": [\"email\", \"id\", \"notify_career_updates\", \"notify_training_updates\"]}}','{\"tabular\": {\"widths\": {\"id\": 391.8181762695313, \"notify_training_updates\": 289.09088134765625}}}',NULL,NULL,'bookmark',NULL),(16,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'UserPersonality',NULL,NULL,'{\"tabular\": {\"page\": 1, \"sort\": [\"name\"], \"limit\": 25, \"fields\": [\"name\", \"status\"]}}','{\"tabular\": {\"widths\": {}}}',NULL,NULL,'bookmark',NULL),(17,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'PersonalityTags',NULL,NULL,'{\"tabular\": {\"page\": 1, \"sort\": [\"name\"], \"limit\": 50, \"fields\": [\"name\", \"status\"]}}','{\"tabular\": {\"widths\": {\"name\": 608}}}',NULL,NULL,'bookmark',NULL),(18,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'directus_webhooks',NULL,'tabular','{\"tabular\": {\"limit\": 25, \"fields\": [\"status\", \"method\", \"name\", \"collections\", \"actions\"]}}','{\"tabular\": {\"widths\": {\"name\": 210, \"method\": 100, \"status\": 32, \"actions\": 210, \"collections\": 240}}}',NULL,NULL,'bookmark',NULL),(19,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Careers',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25, \"fields\": [\"name\", \"description\", \"salaryMin\", \"status\", \"id\"]}}','{\"tabular\": {\"widths\": {}}}',NULL,NULL,'bookmark',NULL),(20,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Profile',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(21,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'directus_activity',NULL,'tabular','{\"tabular\": {\"sort\": [\"-timestamp\"], \"limit\": 25, \"fields\": [\"action\", \"collection\", \"timestamp\", \"user\"]}}','{\"tabular\": {\"widths\": {\"user\": 240, \"action\": 120, \"timestamp\": 240, \"collection\": 210}}}',NULL,NULL,'bookmark',NULL),(22,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'EvaluationFormStep',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25, \"fields\": [\"sort\", \"title\", \"description\", \"status\"]}}','{\"tabular\": {\"widths\": {\"sort\": 89}}}',NULL,NULL,'bookmark',NULL),(23,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'EvaluationFormQuestion',NULL,NULL,'{\"tabular\": {\"page\": 1, \"sort\": [\"step\"], \"limit\": 100, \"fields\": [\"question\", \"sort\", \"status\", \"step\"]}}','{\"tabular\": {\"widths\": {\"step\": 314.5455322265625, \"question\": 308.1817626953125}}}',NULL,NULL,'bookmark',NULL),(24,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'EvaluationFormUserResponse',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 500}}',NULL,NULL,NULL,'bookmark',NULL),(25,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'EvaluationFormUserResponse',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(27,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'EvaluationFormAnswer',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 250, \"fields\": [\"question\", \"label\", \"sort\", \"status\"]}}','{\"tabular\": {\"widths\": {\"label\": 250.9090576171875, \"question\": 413.6363525390625}}}',NULL,NULL,'bookmark',NULL),(28,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Session',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(29,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Address',NULL,NULL,'{\"tabular\": {\"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(30,NULL,'53624c37-f595-436c-bfeb-8800ff7e38d6',NULL,'directus_users',NULL,'cards','{\"cards\": {\"page\": 1, \"sort\": [\"email\"], \"limit\": 25}}','{\"cards\": {\"icon\": \"account_circle\", \"size\": 4, \"title\": \"{{ first_name }} {{ last_name }}\", \"subtitle\": \"{{ email }}\"}}',NULL,NULL,'bookmark',NULL),(31,NULL,'53624c37-f595-436c-bfeb-8800ff7e38d6',NULL,'Careers',NULL,NULL,'{\"tabular\": {\"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(32,NULL,'53624c37-f595-436c-bfeb-8800ff7e38d6',NULL,'UserPersonality',NULL,NULL,'{\"tabular\": {\"page\": 1}}',NULL,NULL,NULL,'bookmark',NULL),(33,NULL,'53624c37-f595-436c-bfeb-8800ff7e38d6',NULL,'PersonalityTags',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(34,NULL,'9a5584cd-520b-41ea-bc88-417fa620f69f',NULL,'Companies',NULL,NULL,'{\"tabular\": {\"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(35,NULL,'9a5584cd-520b-41ea-bc88-417fa620f69f',NULL,'Careers',NULL,NULL,'{\"tabular\": {\"limit\": 25, \"fields\": [\"description\", \"name\", \"salaryMin\", \"status\"]}}','{\"tabular\": {\"widths\": {\"name\": 256.609375, \"description\": 190.11328125}}}',NULL,NULL,'bookmark',NULL),(36,NULL,'9a5584cd-520b-41ea-bc88-417fa620f69f',NULL,'directus_users',NULL,'cards','{\"cards\": {\"sort\": [\"email\"], \"limit\": 25}}','{\"cards\": {\"icon\": \"account_circle\", \"size\": 4, \"title\": \"{{ first_name }} {{ last_name }}\", \"subtitle\": \"{{ email }}\"}}',NULL,NULL,'bookmark',NULL),(37,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Prototypes',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL),(38,NULL,'3673a855-5f81-40c5-a61b-8a2198620107',NULL,'Contact',NULL,NULL,'{\"tabular\": {\"page\": 1, \"limit\": 25}}',NULL,NULL,NULL,'bookmark',NULL);
/*!40000 ALTER TABLE `directus_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_relations`
--

DROP TABLE IF EXISTS `directus_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify',
  PRIMARY KEY (`id`),
  KEY `directus_relations_many_collection_foreign` (`many_collection`),
  KEY `directus_relations_one_collection_foreign` (`one_collection`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_relations`
--

LOCK TABLES `directus_relations` WRITE;
/*!40000 ALTER TABLE `directus_relations` DISABLE KEYS */;
INSERT INTO `directus_relations` VALUES (1,'Quizzes','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(2,'Quizzes','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(3,'QuizzResource','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(4,'QuizzResource','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(5,'QuizzResource','quiz_id','Quizzes',NULL,NULL,NULL,NULL,NULL,'nullify'),(6,'Quizzes','image','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(7,'QuizzResource','file','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(8,'Companies','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(9,'Companies','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(10,'Companies','logo','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(11,'Courses','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(12,'Courses','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(13,'Faq','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(14,'Faq','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(15,'FaqItem','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(16,'FaqItem','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(19,'PersonalityTags','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(20,'UserPersonality','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(21,'UserPersonality','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(22,'UserPersonality_PersonalityTags','PersonalityTags_id','PersonalityTags',NULL,NULL,NULL,'UserPersonality_id',NULL,'nullify'),(23,'UserPersonality_PersonalityTags','UserPersonality_id','UserPersonality','strengths',NULL,NULL,'PersonalityTags_id',NULL,'nullify'),(24,'UserPersonality_PersonalityTags_1','PersonalityTags_id','PersonalityTags',NULL,NULL,NULL,'UserPersonality_id',NULL,'nullify'),(25,'UserPersonality_PersonalityTags_1','UserPersonality_id','UserPersonality','ideal_work_environment',NULL,NULL,'PersonalityTags_id',NULL,'nullify'),(26,'UserPersonality_PersonalityTags_2','PersonalityTags_id','PersonalityTags',NULL,NULL,NULL,'UserPersonality_id',NULL,'nullify'),(27,'UserPersonality_PersonalityTags_2','UserPersonality_id','UserPersonality','weaknesses',NULL,NULL,'PersonalityTags_id',NULL,'nullify'),(28,'Profile','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(29,'Profile','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(30,'Profile','personality','UserPersonality',NULL,NULL,NULL,NULL,NULL,'nullify'),(32,'Careers','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(33,'Careers','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(34,'Careers_Courses','Courses_id','Courses',NULL,NULL,NULL,'Careers_id',NULL,'nullify'),(35,'Careers_Courses','Careers_id','Careers','courses',NULL,NULL,'Courses_id',NULL,'nullify'),(42,'EvaluationFormStep','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(43,'EvaluationFormStep','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(44,'EvaluationFormQuestion','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(45,'EvaluationFormQuestion','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(46,'EvaluationFormQuestion','step','EvaluationFormStep',NULL,NULL,NULL,NULL,NULL,'nullify'),(47,'EvaluationFormAnswer','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(48,'EvaluationFormAnswer','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(49,'EvaluationFormAnswer','question','EvaluationFormQuestion',NULL,NULL,NULL,NULL,NULL,'nullify'),(50,'EvaluationFormUserResponse','question','EvaluationFormQuestion',NULL,NULL,NULL,NULL,NULL,'nullify'),(53,'Profile','avatar','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(54,'Address','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(55,'Address','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(56,'Contact','user_updated','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(57,'Contact','user_created','directus_users',NULL,NULL,NULL,NULL,NULL,'nullify'),(58,'Address','company_id','Companies','addresses',NULL,NULL,NULL,NULL,'nullify'),(59,'Contact','company_id','Companies','contacts',NULL,NULL,NULL,NULL,'nullify'),(60,'Prototypes','image','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(61,'Careers','image','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(62,'Courses','image','directus_files',NULL,NULL,NULL,NULL,NULL,'nullify'),(63,'Courses','company','Companies',NULL,NULL,NULL,NULL,NULL,'nullify');
/*!40000 ALTER TABLE `directus_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_revisions`
--

DROP TABLE IF EXISTS `directus_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(10) unsigned NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` json DEFAULT NULL,
  `delta` json DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `version` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_revisions_collection_foreign` (`collection`),
  KEY `directus_revisions_parent_foreign` (`parent`),
  KEY `directus_revisions_activity_foreign` (`activity`),
  KEY `directus_revisions_version_foreign` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=2045 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_revisions`
--

LOCK TABLES `directus_revisions` WRITE;
/*!40000 ALTER TABLE `directus_revisions` DISABLE KEYS */;
INSERT INTO `directus_revisions` VALUES (1972,2637,'Careers','f264c709-7205-4278-8005-ba76f83a1a57','{\"name\": \"Data Analyst\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"93b06164-7c13-4d82-aab0-5fd6731ff5c6\", \"format\": [\"online\"], \"status\": \"published\", \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"name\": \"Data Analyst\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"93b06164-7c13-4d82-aab0-5fd6731ff5c6\", \"format\": [\"online\"], \"status\": \"published\", \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}',NULL,NULL),(1973,2638,'directus_files','37c31057-7387-452f-bc3b-f0d3252de685','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}',NULL,NULL),(1974,2639,'Careers','b3ce54ca-6871-4184-856a-936ded060d35','{\"name\": \"Web Development\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"37c31057-7387-452f-bc3b-f0d3252de685\", \"format\": [\"online\", \"on-campus\"], \"status\": \"published\", \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"name\": \"Web Development\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"37c31057-7387-452f-bc3b-f0d3252de685\", \"format\": [\"online\", \"on-campus\"], \"status\": \"published\", \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}',NULL,NULL),(1975,2640,'directus_files','a4059f09-4e43-4381-bd45-9f3c5caa3dc1','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}',NULL,NULL),(1976,2641,'Careers','455554fa-0450-48f0-bae7-692ab3142f62','{\"name\": \"Train Driver\", \"pace\": [\"full-time\"], \"image\": \"a4059f09-4e43-4381-bd45-9f3c5caa3dc1\", \"format\": [\"on-campus\"], \"status\": \"published\", \"salaryMax\": 80000, \"salaryMin\": 40000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"name\": \"Train Driver\", \"pace\": [\"full-time\"], \"image\": \"a4059f09-4e43-4381-bd45-9f3c5caa3dc1\", \"format\": [\"on-campus\"], \"status\": \"published\", \"salaryMax\": 80000, \"salaryMin\": 40000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}',NULL,NULL),(1977,2642,'directus_files','3540d97b-8d9f-4b24-ad3f-1db18b4650d2','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}',NULL,NULL),(1978,2643,'Careers','5a6a3e27-0bb2-4b94-985b-01784a499d9b','{\"name\": \"Gardener\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"3540d97b-8d9f-4b24-ad3f-1db18b4650d2\", \"format\": [\"on-campus\"], \"status\": \"published\", \"salaryMax\": 48000, \"salaryMin\": 27000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"name\": \"Gardener\", \"pace\": [\"part-time\", \"full-time\"], \"image\": \"3540d97b-8d9f-4b24-ad3f-1db18b4650d2\", \"format\": [\"on-campus\"], \"status\": \"published\", \"salaryMax\": 48000, \"salaryMin\": 27000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}',NULL,NULL),(1979,3440,'directus_fields','279','{\"sort\": 3, \"field\": \"evaluation_completed\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}','{\"sort\": 3, \"field\": \"evaluation_completed\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}',NULL,NULL),(1980,3441,'directus_fields','280','{\"sort\": 3, \"field\": \"evaluationCompleted\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}','{\"sort\": 3, \"field\": \"evaluationCompleted\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}',NULL,NULL),(1981,3442,'directus_fields','281','{\"sort\": 3, \"field\": \"evaluationCompleted\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}','{\"sort\": 3, \"field\": \"evaluationCompleted\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}',NULL,NULL),(1982,3443,'User','3adcfabe-6f11-4547-ba2f-fa8bac596529','{\"id\": \"3adcfabe-6f11-4547-ba2f-fa8bac596529\", \"name\": \"Rodo Hale\", \"email\": \"guluarte@gmail.com\", \"image\": \"https://lh3.googleusercontent.com/a/ACg8ocJQDTwQOVZufDAtrdKQRwr4Xqpw1Pj2Ki2loB6UROA7lmo=s96-c\", \"password\": null, \"createdAt\": \"2023-11-27T18:09:45\", \"profileId\": \"c2660db4-8fce-46af-9ea3-09c67a457f8c\", \"updatedAt\": \"2023-11-27T18:09:45\", \"emailVerified\": null, \"evaluationCompleted\": true, \"notify_career_updates\": null, \"notify_training_updates\": null}','{\"evaluationCompleted\": true}',NULL,NULL),(1983,3444,'directus_fields','282','{\"sort\": 17, \"field\": \"image\", \"special\": [\"file\"], \"interface\": \"file-image\", \"collection\": \"Courses\"}','{\"sort\": 17, \"field\": \"image\", \"special\": [\"file\"], \"interface\": \"file-image\", \"collection\": \"Courses\"}',NULL,NULL),(1984,3445,'directus_files','c56ba460-67e5-498b-9f33-6b9d495accbd','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}',NULL,NULL),(1985,3446,'Courses','1','{\"name\": \"Cloud Computing Certification\", \"pace\": [\"full_time\"], \"image\": \"c56ba460-67e5-498b-9f33-6b9d495accbd\", \"price\": 10000, \"status\": \"published\", \"location\": \"online\", \"start_date\": \"2023-12-19\", \"course_type\": [\"training\"], \"description\": \"The main task of a UX designer is to develop a good product, such as a website, app or software - which is easy to use lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus metus quis lorem. Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.\"}','{\"name\": \"Cloud Computing Certification\", \"pace\": [\"full_time\"], \"image\": \"c56ba460-67e5-498b-9f33-6b9d495accbd\", \"price\": 10000, \"status\": \"published\", \"location\": \"online\", \"start_date\": \"2023-12-19\", \"course_type\": [\"training\"], \"description\": \"The main task of a UX designer is to develop a good product, such as a website, app or software - which is easy to use lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus metus quis lorem. Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.\"}',NULL,NULL),(1986,3447,'Careers_Courses','1','{\"Careers_id\": \"3bc4c732-759a-448d-a2ef-6f4d84986ab0\", \"Courses_id\": {\"id\": 1}}','{\"Careers_id\": \"3bc4c732-759a-448d-a2ef-6f4d84986ab0\", \"Courses_id\": {\"id\": 1}}',1987,NULL),(1987,3448,'Careers','3bc4c732-759a-448d-a2ef-6f4d84986ab0','{\"id\": \"3bc4c732-759a-448d-a2ef-6f4d84986ab0\", \"name\": \"UX-Designer\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"abc485b3-2e5c-4424-ade6-5f2b04de4c10\", \"format\": [\"online\", \"on-campus\"], \"status\": \"published\", \"courses\": [1], \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"date_created\": \"2023-12-15T16:32:10.000Z\", \"date_updated\": \"2023-12-18T16:10:15.000Z\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"user_created\": \"3673a855-5f81-40c5-a61b-8a2198620107\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": null, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"date_updated\": \"2023-12-18T16:10:14.545Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(1988,3449,'directus_fields','143','{\"id\": 143, \"note\": null, \"sort\": 20, \"field\": \"courses\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": \"related-values\", \"options\": null, \"special\": [\"m2m\"], \"readonly\": false, \"required\": false, \"interface\": \"list-m2m\", \"collection\": \"Careers\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"template\": \"{{Courses_id.name}}\"}, \"validation_message\": null}','{\"note\": null, \"sort\": 20, \"field\": \"courses\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": \"related-values\", \"options\": null, \"special\": [\"m2m\"], \"readonly\": false, \"required\": false, \"interface\": \"list-m2m\", \"collection\": \"Careers\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"template\": \"{{Courses_id.name}}\"}, \"validation_message\": null}',NULL,NULL),(1989,3450,'directus_fields','283','{\"sort\": 13, \"field\": \"name\", \"special\": null, \"interface\": \"input\", \"collection\": \"Quizzes\"}','{\"sort\": 13, \"field\": \"name\", \"special\": null, \"interface\": \"input\", \"collection\": \"Quizzes\"}',NULL,NULL),(1990,3451,'directus_fields','3','{\"id\": 3, \"note\": null, \"sort\": 1, \"field\": \"id\", \"group\": null, \"width\": \"full\", \"hidden\": true, \"display\": null, \"options\": null, \"special\": null, \"readonly\": true, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 1, \"field\": \"id\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1991,3452,'directus_fields','4','{\"id\": 4, \"note\": null, \"sort\": 2, \"field\": \"status\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": \"labels\", \"options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"select-dropdown\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}, \"validation_message\": null}','{\"sort\": 2, \"field\": \"status\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1992,3453,'directus_fields','5','{\"id\": 5, \"note\": null, \"sort\": 3, \"field\": \"sort\", \"group\": null, \"width\": \"full\", \"hidden\": true, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 3, \"field\": \"sort\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1993,3454,'directus_fields','283','{\"id\": 283, \"note\": null, \"sort\": 4, \"field\": \"name\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 4, \"field\": \"name\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1994,3455,'directus_fields','6','{\"id\": 6, \"note\": null, \"sort\": 5, \"field\": \"user_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": [\"user-created\"], \"readonly\": true, \"required\": false, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 5, \"field\": \"user_created\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1995,3456,'directus_fields','7','{\"id\": 7, \"note\": null, \"sort\": 6, \"field\": \"date_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"options\": null, \"special\": [\"date-created\"], \"readonly\": true, \"required\": false, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"relative\": true}, \"validation_message\": null}','{\"sort\": 6, \"field\": \"date_created\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1996,3457,'directus_fields','8','{\"id\": 8, \"note\": null, \"sort\": 7, \"field\": \"user_updated\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": [\"user-updated\"], \"readonly\": true, \"required\": false, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 7, \"field\": \"user_updated\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1997,3458,'directus_fields','9','{\"id\": 9, \"note\": null, \"sort\": 8, \"field\": \"date_updated\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"options\": null, \"special\": [\"date-updated\"], \"readonly\": true, \"required\": false, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"relative\": true}, \"validation_message\": null}','{\"sort\": 8, \"field\": \"date_updated\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1998,3459,'directus_fields','10','{\"id\": 10, \"note\": null, \"sort\": 9, \"field\": \"description\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"input-multiline\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 9, \"field\": \"description\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(1999,3460,'directus_fields','23','{\"id\": 23, \"note\": null, \"sort\": 10, \"field\": \"image\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": [\"file\"], \"readonly\": false, \"required\": true, \"interface\": \"file-image\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 10, \"field\": \"image\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2000,3461,'directus_fields','49','{\"id\": 49, \"note\": null, \"sort\": 11, \"field\": \"duration\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 11, \"field\": \"duration\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2001,3462,'directus_fields','3','{\"id\": 3, \"note\": null, \"sort\": 1, \"field\": \"id\", \"group\": null, \"width\": \"full\", \"hidden\": true, \"display\": null, \"options\": null, \"special\": null, \"readonly\": true, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 1, \"field\": \"id\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2002,3463,'directus_fields','4','{\"id\": 4, \"note\": null, \"sort\": 2, \"field\": \"status\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": \"labels\", \"options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"select-dropdown\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--theme--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--theme--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}, \"validation_message\": null}','{\"sort\": 2, \"field\": \"status\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2003,3464,'directus_fields','5','{\"id\": 5, \"note\": null, \"sort\": 3, \"field\": \"sort\", \"group\": null, \"width\": \"full\", \"hidden\": true, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 3, \"field\": \"sort\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2004,3465,'directus_fields','6','{\"id\": 6, \"note\": null, \"sort\": 4, \"field\": \"user_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": [\"user-created\"], \"readonly\": true, \"required\": false, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 4, \"field\": \"user_created\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2005,3466,'directus_fields','7','{\"id\": 7, \"note\": null, \"sort\": 5, \"field\": \"date_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"options\": null, \"special\": [\"date-created\"], \"readonly\": true, \"required\": false, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"relative\": true}, \"validation_message\": null}','{\"sort\": 5, \"field\": \"date_created\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2006,3467,'directus_fields','8','{\"id\": 8, \"note\": null, \"sort\": 6, \"field\": \"user_updated\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": [\"user-updated\"], \"readonly\": true, \"required\": false, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 6, \"field\": \"user_updated\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2007,3468,'directus_fields','9','{\"id\": 9, \"note\": null, \"sort\": 7, \"field\": \"date_updated\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"options\": null, \"special\": [\"date-updated\"], \"readonly\": true, \"required\": false, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"relative\": true}, \"validation_message\": null}','{\"sort\": 7, \"field\": \"date_updated\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2008,3469,'directus_fields','283','{\"id\": 283, \"note\": null, \"sort\": 8, \"field\": \"name\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 8, \"field\": \"name\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2009,3470,'directus_fields','10','{\"id\": 10, \"note\": null, \"sort\": 9, \"field\": \"description\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"input-multiline\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 9, \"field\": \"description\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2010,3471,'directus_fields','23','{\"id\": 23, \"note\": null, \"sort\": 10, \"field\": \"image\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": [\"file\"], \"readonly\": false, \"required\": true, \"interface\": \"file-image\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 10, \"field\": \"image\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2011,3472,'directus_fields','49','{\"id\": 49, \"note\": null, \"sort\": 11, \"field\": \"duration\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"datetime\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"sort\": 11, \"field\": \"duration\", \"group\": null, \"collection\": \"Quizzes\"}',NULL,NULL),(2012,3473,'directus_fields','283','{\"id\": 283, \"note\": null, \"sort\": 8, \"field\": \"name\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}','{\"note\": null, \"sort\": 8, \"field\": \"name\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": null, \"special\": null, \"readonly\": false, \"required\": true, \"interface\": \"input\", \"collection\": \"Quizzes\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}',NULL,NULL),(2013,3474,'directus_files','f55a591a-3c99-4a8f-8991-2a99158ae3bf','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}','{\"type\": \"image/png\", \"title\": \"Untitled 1\", \"storage\": \"local\", \"filename_download\": \"Untitled-1.png\"}',NULL,NULL),(2014,3475,'Quizzes','1','{\"name\": \"HTML für Einsteiger\", \"image\": \"f55a591a-3c99-4a8f-8991-2a99158ae3bf\", \"status\": \"published\", \"duration\": \"01:30:00\", \"description\": \"The main task of a UX designer is to develop a good product, such as a website, app or software - which is easy to use lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus metus quis lorem.\"}','{\"name\": \"HTML für Einsteiger\", \"image\": \"f55a591a-3c99-4a8f-8991-2a99158ae3bf\", \"status\": \"published\", \"duration\": \"01:30:00\", \"description\": \"The main task of a UX designer is to develop a good product, such as a website, app or software - which is easy to use lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus metus quis lorem.\"}',NULL,NULL),(2015,3476,'directus_fields','284','{\"sort\": 13, \"field\": \"type\", \"options\": {\"choices\": [{\"text\": \"Training Institute\", \"value\": \"training_institute\"}, {\"text\": \"Company\", \"value\": \"company\"}]}, \"special\": null, \"interface\": \"select-dropdown\", \"collection\": \"Companies\"}','{\"sort\": 13, \"field\": \"type\", \"options\": {\"choices\": [{\"text\": \"Training Institute\", \"value\": \"training_institute\"}, {\"text\": \"Company\", \"value\": \"company\"}]}, \"special\": null, \"interface\": \"select-dropdown\", \"collection\": \"Companies\"}',NULL,NULL),(2016,3477,'directus_fields','285','{\"sort\": 14, \"field\": \"web\", \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}','{\"sort\": 14, \"field\": \"web\", \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}',NULL,NULL),(2017,3478,'directus_fields','286','{\"sort\": 15, \"field\": \"email_billing\", \"options\": {\"placeholder\": \"Email for billing\"}, \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}','{\"sort\": 15, \"field\": \"email_billing\", \"options\": {\"placeholder\": \"Email for billing\"}, \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}',NULL,NULL),(2018,3479,'directus_fields','287','{\"sort\": 16, \"field\": \"user\", \"options\": {\"template\": \"{{email}}\"}, \"special\": [\"m2o\"], \"interface\": \"select-dropdown-m2o\", \"collection\": \"Contact\"}','{\"sort\": 16, \"field\": \"user\", \"options\": {\"template\": \"{{email}}\"}, \"special\": [\"m2o\"], \"interface\": \"select-dropdown-m2o\", \"collection\": \"Contact\"}',NULL,NULL),(2019,3480,'directus_fields','288','{\"sort\": 16, \"field\": \"userId\", \"options\": {\"template\": \"{{email}}\"}, \"special\": [\"m2o\"], \"interface\": \"select-dropdown-m2o\", \"collection\": \"Contact\"}','{\"sort\": 16, \"field\": \"userId\", \"options\": {\"template\": \"{{email}}\"}, \"special\": [\"m2o\"], \"interface\": \"select-dropdown-m2o\", \"collection\": \"Contact\"}',NULL,NULL),(2020,3481,'directus_fields','289','{\"sort\": 14, \"field\": \"city\", \"special\": null, \"interface\": \"input\", \"collection\": \"Address\"}','{\"sort\": 14, \"field\": \"city\", \"special\": null, \"interface\": \"input\", \"collection\": \"Address\"}',NULL,NULL),(2021,3482,'directus_fields','290','{\"sort\": 16, \"field\": \"vat\", \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}','{\"sort\": 16, \"field\": \"vat\", \"special\": null, \"interface\": \"input\", \"collection\": \"Companies\"}',NULL,NULL),(2022,3486,'directus_fields','291','{\"sort\": 18, \"field\": \"company\", \"options\": {\"template\": \"{{name}}\"}, \"special\": [\"m2o\"], \"required\": true, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Courses\"}','{\"sort\": 18, \"field\": \"company\", \"options\": {\"template\": \"{{name}}\"}, \"special\": [\"m2o\"], \"required\": true, \"interface\": \"select-dropdown-m2o\", \"collection\": \"Courses\"}',NULL,NULL),(2023,3487,'directus_files','4fc7d4da-3a8f-443d-adfc-330438af7761','{\"type\": \"image/jpeg\", \"title\": \"we\", \"storage\": \"local\", \"filename_download\": \"we\"}','{\"type\": \"image/jpeg\", \"title\": \"we\", \"storage\": \"local\", \"filename_download\": \"we\"}',NULL,NULL),(2024,3488,'directus_files','6111c6f6-9887-4d98-9153-a8ec442c857c','{\"type\": \"image/jpeg\", \"title\": \"gfg\", \"storage\": \"local\", \"filename_download\": \"gfg\"}','{\"type\": \"image/jpeg\", \"title\": \"gfg\", \"storage\": \"local\", \"filename_download\": \"gfg\"}',NULL,NULL),(2025,3489,'directus_files','aa896584-d215-4334-a06c-2c9d662bd6c0','{\"type\": \"image/jpeg\", \"title\": \"gfg\", \"storage\": \"local\", \"filename_download\": \"gfg\"}','{\"type\": \"image/jpeg\", \"title\": \"gfg\", \"storage\": \"local\", \"filename_download\": \"gfg\"}',NULL,NULL),(2026,3497,'directus_files','8047a554-0291-42f5-bfb9-7176c28a7a3e','{\"type\": \"image/jpeg\", \"title\": \"test course\", \"storage\": \"local\", \"filename_download\": \"test course\"}','{\"type\": \"image/jpeg\", \"title\": \"test course\", \"storage\": \"local\", \"filename_download\": \"test course\"}',NULL,NULL),(2027,3498,'directus_files','774cf134-31ce-4efb-916e-8cf4d0998a64','{\"type\": \"image/png\", \"title\": \"test 2\", \"storage\": \"local\", \"filename_download\": \"test 2\"}','{\"type\": \"image/png\", \"title\": \"test 2\", \"storage\": \"local\", \"filename_download\": \"test 2\"}',NULL,NULL),(2028,3501,'directus_files','38bf6fde-de57-4a0e-ba6f-be11eaf2c0f8','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}',NULL,NULL),(2029,3502,'directus_files','fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b','{\"type\": \"image/jpeg\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}','{\"type\": \"image/jpeg\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}',NULL,NULL),(2030,3503,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T17:05:47.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T17:05:46.541Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2031,3504,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:18:33.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:18:32.929Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2032,3505,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:19:45.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:19:44.830Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2033,3506,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:20:20.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:20:19.547Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2034,3507,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:21:54.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:21:54.063Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2035,3508,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:22:59.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:22:59.397Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2036,3509,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:23:17.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:23:17.339Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2037,3510,'Courses','7','{\"id\": 7, \"name\": \"Web Development Bootcamp 2\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"fa89bdf5-8fd0-4ae3-98fd-91638f6bed2b\", \"price\": 9800, \"status\": \"published\", \"company\": 3, \"location\": \"On campus\", \"start_date\": \"2023-12-31\", \"course_type\": [\"apprenticenship\", \"training\"], \"description\": \"Quisque a augue ut ante elementum condimentum. Suspendisse at pretium felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate sapien a est aliquet bibendum.2\", \"date_created\": null, \"date_updated\": \"2023-12-22T18:30:12.000Z\", \"sponsonrship\": false, \"user_created\": null, \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}','{\"status\": \"published\", \"date_updated\": \"2023-12-22T18:30:12.087Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2038,3511,'directus_files','aee4dcb4-3269-4030-85d4-c7274d6b77fc','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}',NULL,NULL),(2039,3512,'directus_files','f5ab0bb9-9249-444e-8868-820c27976723','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp\"}',NULL,NULL),(2040,3513,'Careers_Courses','2','{\"Careers_id\": \"b3ce54ca-6871-4184-856a-936ded060d35\", \"Courses_id\": {\"id\": 8}}','{\"Careers_id\": \"b3ce54ca-6871-4184-856a-936ded060d35\", \"Courses_id\": {\"id\": 8}}',2042,NULL),(2041,3514,'Careers_Courses','3','{\"Careers_id\": \"b3ce54ca-6871-4184-856a-936ded060d35\", \"Courses_id\": {\"id\": 7}}','{\"Careers_id\": \"b3ce54ca-6871-4184-856a-936ded060d35\", \"Courses_id\": {\"id\": 7}}',2042,NULL),(2042,3515,'Careers','b3ce54ca-6871-4184-856a-936ded060d35','{\"id\": \"b3ce54ca-6871-4184-856a-936ded060d35\", \"name\": \"Web Development\", \"pace\": [\"part-time\", \"full-time\"], \"sort\": null, \"image\": \"37c31057-7387-452f-bc3b-f0d3252de685\", \"format\": [\"online\", \"on-campus\"], \"status\": \"published\", \"courses\": [2, 3], \"salaryMax\": 65000, \"salaryMin\": 37000, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"date_created\": \"2023-12-15T17:00:02.000Z\", \"date_updated\": \"2023-12-22T19:08:33.000Z\", \"detailsTasks\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"user_created\": \"3673a855-5f81-40c5-a61b-8a2198620107\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\", \"detailsFuture\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\", \"detailsSkills\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\", \"retrainingWeeks\": 12, \"detailsRequirement\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\"}','{\"date_updated\": \"2023-12-22T19:08:32.581Z\", \"user_updated\": \"3673a855-5f81-40c5-a61b-8a2198620107\"}',NULL,NULL),(2043,3516,'directus_files','46b88c3b-3d04-4073-8ada-f27085b0e8ad','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp 2\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp 2\"}','{\"type\": \"image/webp\", \"title\": \"Web Development Bootcamp 2\", \"storage\": \"local\", \"filename_download\": \"Web Development Bootcamp 2\"}',NULL,NULL),(2044,3561,'directus_fields','292','{\"sort\": 4, \"field\": \"premium\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}','{\"sort\": 4, \"field\": \"premium\", \"special\": [\"cast-boolean\"], \"interface\": \"boolean\", \"collection\": \"User\"}',NULL,NULL);
/*!40000 ALTER TABLE `directus_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_roles`
--

DROP TABLE IF EXISTS `directus_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text,
  `ip_access` text,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT '0',
  `admin_access` tinyint(1) NOT NULL DEFAULT '0',
  `app_access` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_roles`
--

LOCK TABLES `directus_roles` WRITE;
/*!40000 ALTER TABLE `directus_roles` DISABLE KEYS */;
INSERT INTO `directus_roles` VALUES ('4121e329-1542-45dc-aca2-7cb6e2ba3d11','Administrator','verified','$t:admin_description',NULL,0,1,1),('b8b40fed-a039-4d21-a5e1-6cfbc01a6637','Content Creator','supervised_user_circle',NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `directus_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_sessions`
--

DROP TABLE IF EXISTS `directus_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `directus_sessions_user_foreign` (`user`),
  KEY `directus_sessions_share_foreign` (`share`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_sessions`
--

LOCK TABLES `directus_sessions` WRITE;
/*!40000 ALTER TABLE `directus_sessions` DISABLE KEYS */;
INSERT INTO `directus_sessions` VALUES ('49gDyhskxzYCbZu0m2ijGiSm5Mm5e_39tng1sPt2r9UwZVkdvDhr-eYTMVSWnOK8','3673a855-5f81-40c5-a61b-8a2198620107','2024-01-03 19:41:11','187.223.143.216','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',NULL,'https://directus.shiftyourcareer.de'),('B1RVr04Kfa6fJCZm_9RzmAw6IEEggmHQRPHq78BImLd6aRPxVR0SYjYEafNo9YBW','3673a855-5f81-40c5-a61b-8a2198620107','2023-12-14 21:35:56','187.223.143.216','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',NULL,'https://directus.laborflow.io'),('dTgc1WqIdP5CWWRXiMnvyhbKPXS3XjbUWoO1i6Y61uhTGI-O7E8Vdrr-4GZKSHga','9a5584cd-520b-41ea-bc88-417fa620f69f','2023-12-14 10:44:34','46.114.171.162','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',NULL,'https://directus.laborflow.io');
/*!40000 ALTER TABLE `directus_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_settings`
--

DROP TABLE IF EXISTS `directus_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(255) NOT NULL DEFAULT '#6644FF',
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text,
  `auth_login_attempts` int(10) unsigned DEFAULT '25',
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` json DEFAULT NULL,
  `custom_css` text,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` json DEFAULT NULL,
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` json DEFAULT NULL,
  `project_descriptor` varchar(100) DEFAULT NULL,
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` json DEFAULT NULL,
  `public_favicon` char(36) DEFAULT NULL,
  `default_appearance` varchar(255) NOT NULL DEFAULT 'auto',
  `default_theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` json DEFAULT NULL,
  `default_theme_dark` varchar(255) DEFAULT NULL,
  `theme_dark_overrides` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_settings_project_logo_foreign` (`project_logo`),
  KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  KEY `directus_settings_public_background_foreign` (`public_background`),
  KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`),
  KEY `directus_settings_public_favicon_foreign` (`public_favicon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_settings`
--

LOCK TABLES `directus_settings` WRITE;
/*!40000 ALTER TABLE `directus_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_shares`
--

DROP TABLE IF EXISTS `directus_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT '0',
  `max_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_shares_role_foreign` (`role`),
  KEY `directus_shares_user_created_foreign` (`user_created`),
  KEY `directus_shares_collection_foreign` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_shares`
--

LOCK TABLES `directus_shares` WRITE;
/*!40000 ALTER TABLE `directus_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_translations`
--

DROP TABLE IF EXISTS `directus_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_translations` (
  `id` char(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_translations`
--

LOCK TABLES `directus_translations` WRITE;
/*!40000 ALTER TABLE `directus_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_users`
--

DROP TABLE IF EXISTS `directus_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `tags` json DEFAULT NULL,
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` json DEFAULT NULL,
  `email_notifications` tinyint(1) DEFAULT '1',
  `appearance` varchar(255) DEFAULT NULL,
  `theme_dark` varchar(255) DEFAULT NULL,
  `theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` json DEFAULT NULL,
  `theme_dark_overrides` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  UNIQUE KEY `directus_users_email_unique` (`email`),
  UNIQUE KEY `directus_users_token_unique` (`token`),
  KEY `directus_users_role_foreign` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_users`
--

LOCK TABLES `directus_users` WRITE;
/*!40000 ALTER TABLE `directus_users` DISABLE KEYS */;
INSERT INTO `directus_users` VALUES ('34fe3a80-45f0-414f-854c-bebccd64b81a','Web','App',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','4121e329-1542-45dc-aca2-7cb6e2ba3d11','K5ASOTbnR4b7-_nA8Bo04YU-yBX0wAdA','2023-12-15 14:31:15',NULL,'default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),('3673a855-5f81-40c5-a61b-8a2198620107','Admin','User','rodo@guluarte.com','$argon2id$v=19$m=65536,t=3,p=4$wrIoTpj97KrUcuyMU7MKng$6KTqQ1OphOb8pGaStCXIiGjyFPgaekbMuBVghmKQdgk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','4121e329-1542-45dc-aca2-7cb6e2ba3d11',NULL,'2023-12-27 19:41:11','/content/User','default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),('53624c37-f595-436c-bfeb-8800ff7e38d6','Content','Creator','content@laborflow.io','$argon2id$v=19$m=65536,t=3,p=4$Q+ls3J5jSyIlhoadvl9IcQ$rzyMazygicsvcqEPHFFvbhKG2PoEnY9EE53w3uq1GPs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','b8b40fed-a039-4d21-a5e1-6cfbc01a6637',NULL,'2023-11-30 20:08:57','/content/Careers','default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),('9a5584cd-520b-41ea-bc88-417fa620f69f','Marcel','Reperich','Be-vent@hotmail.com','$argon2id$v=19$m=65536,t=3,p=4$hOKwC2uSUsP5HzPTYrKhMA$hmU/0ExUZiGVWPsNamPJS9k+DoLXaUlUlFKk0F0V5t8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','4121e329-1542-45dc-aca2-7cb6e2ba3d11',NULL,'2023-12-07 10:44:34','/users/53624c37-f595-436c-bfeb-8800ff7e38d6','default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `directus_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_versions`
--

DROP TABLE IF EXISTS `directus_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_versions` (
  `id` char(36) NOT NULL,
  `key` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_versions_collection_foreign` (`collection`),
  KEY `directus_versions_user_created_foreign` (`user_created`),
  KEY `directus_versions_user_updated_foreign` (`user_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_versions`
--

LOCK TABLES `directus_versions` WRITE;
/*!40000 ALTER TABLE `directus_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_webhooks`
--

DROP TABLE IF EXISTS `directus_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT '1',
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_webhooks`
--

LOCK TABLES `directus_webhooks` WRITE;
/*!40000 ALTER TABLE `directus_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
INSERT INTO `wp_commentmeta` VALUES (1,2,'_wp_trash_meta_status','0'),(2,2,'_wp_trash_meta_time','1701985338');
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2023-11-13 18:30:57','2023-11-13 18:30:57','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0),(2,1,'2YCttWCmdIrfSJHDGERggU64XCN','2YCttWCmdIrfSJHDGERggU64XCN@email.com','','45.95.172.40','2023-11-15 13:49:36','2023-11-15 13:49:36','2YCttWCmdIrfSJHDGERggU64XCN',0,'spam','Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','https://wp.laborflow.io','yes'),(2,'home','https://wp.laborflow.io','yes'),(3,'blogname','LaborFlow','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','rodo@guluarte.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:96:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:0:{}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','twentytwentyfour','yes'),(41,'stylesheet','twentytwentyfour','yes'),(42,'comment_registration','0','yes'),(43,'html_type','text/html','yes'),(44,'use_trackback','0','yes'),(45,'default_role','subscriber','yes'),(46,'db_version','56657','yes'),(47,'uploads_use_yearmonth_folders','1','yes'),(48,'upload_path','','yes'),(49,'blog_public','0','yes'),(50,'default_link_category','2','yes'),(51,'show_on_front','posts','yes'),(52,'tag_base','','yes'),(53,'show_avatars','1','yes'),(54,'avatar_rating','G','yes'),(55,'upload_url_path','','yes'),(56,'thumbnail_size_w','150','yes'),(57,'thumbnail_size_h','150','yes'),(58,'thumbnail_crop','1','yes'),(59,'medium_size_w','300','yes'),(60,'medium_size_h','300','yes'),(61,'avatar_default','mystery','yes'),(62,'large_size_w','1024','yes'),(63,'large_size_h','1024','yes'),(64,'image_default_link_type','none','yes'),(65,'image_default_size','','yes'),(66,'image_default_align','','yes'),(67,'close_comments_for_old_posts','0','yes'),(68,'close_comments_days_old','14','yes'),(69,'thread_comments','1','yes'),(70,'thread_comments_depth','5','yes'),(71,'page_comments','0','yes'),(72,'comments_per_page','50','yes'),(73,'default_comments_page','newest','yes'),(74,'comment_order','asc','yes'),(75,'sticky_posts','a:0:{}','yes'),(76,'widget_categories','a:0:{}','yes'),(77,'widget_text','a:0:{}','yes'),(78,'widget_rss','a:0:{}','yes'),(79,'uninstall_plugins','a:0:{}','no'),(80,'timezone_string','','yes'),(81,'page_for_posts','0','yes'),(82,'page_on_front','0','yes'),(83,'default_post_format','0','yes'),(84,'link_manager_enabled','0','yes'),(85,'finished_splitting_shared_terms','1','yes'),(86,'site_icon','0','yes'),(87,'medium_large_size_w','768','yes'),(88,'medium_large_size_h','0','yes'),(89,'wp_page_for_privacy_policy','3','yes'),(90,'show_comments_cookies_opt_in','1','yes'),(91,'admin_email_lifespan','1715452257','yes'),(92,'disallowed_keys','','no'),(93,'comment_previously_approved','1','yes'),(94,'auto_plugin_theme_update_emails','a:0:{}','no'),(95,'auto_update_core_dev','enabled','yes'),(96,'auto_update_core_minor','enabled','yes'),(97,'auto_update_core_major','enabled','yes'),(98,'wp_force_deactivated_plugins','a:0:{}','yes'),(99,'wp_attachment_pages_enabled','0','yes'),(100,'initial_db_version','56657','yes'),(101,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(102,'fresh_site','1','yes'),(103,'user_count','2','no'),(104,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','yes'),(105,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','yes'),(106,'cron','a:7:{i:1702917057;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1702924257;a:4:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1702924259;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1702924275;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1702924276;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1703010657;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes'),(107,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(112,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(113,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(114,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(115,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(116,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(117,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(118,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(119,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(120,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(121,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"6.4.2\";s:5:\"files\";a:500:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:20:\"block/editor-rtl.css\";i:29;s:24:\"block/editor-rtl.min.css\";i:30;s:16:\"block/editor.css\";i:31;s:20:\"block/editor.min.css\";i:32;s:21:\"button/editor-rtl.css\";i:33;s:25:\"button/editor-rtl.min.css\";i:34;s:17:\"button/editor.css\";i:35;s:21:\"button/editor.min.css\";i:36;s:20:\"button/style-rtl.css\";i:37;s:24:\"button/style-rtl.min.css\";i:38;s:16:\"button/style.css\";i:39;s:20:\"button/style.min.css\";i:40;s:22:\"buttons/editor-rtl.css\";i:41;s:26:\"buttons/editor-rtl.min.css\";i:42;s:18:\"buttons/editor.css\";i:43;s:22:\"buttons/editor.min.css\";i:44;s:21:\"buttons/style-rtl.css\";i:45;s:25:\"buttons/style-rtl.min.css\";i:46;s:17:\"buttons/style.css\";i:47;s:21:\"buttons/style.min.css\";i:48;s:22:\"calendar/style-rtl.css\";i:49;s:26:\"calendar/style-rtl.min.css\";i:50;s:18:\"calendar/style.css\";i:51;s:22:\"calendar/style.min.css\";i:52;s:25:\"categories/editor-rtl.css\";i:53;s:29:\"categories/editor-rtl.min.css\";i:54;s:21:\"categories/editor.css\";i:55;s:25:\"categories/editor.min.css\";i:56;s:24:\"categories/style-rtl.css\";i:57;s:28:\"categories/style-rtl.min.css\";i:58;s:20:\"categories/style.css\";i:59;s:24:\"categories/style.min.css\";i:60;s:19:\"code/editor-rtl.css\";i:61;s:23:\"code/editor-rtl.min.css\";i:62;s:15:\"code/editor.css\";i:63;s:19:\"code/editor.min.css\";i:64;s:18:\"code/style-rtl.css\";i:65;s:22:\"code/style-rtl.min.css\";i:66;s:14:\"code/style.css\";i:67;s:18:\"code/style.min.css\";i:68;s:18:\"code/theme-rtl.css\";i:69;s:22:\"code/theme-rtl.min.css\";i:70;s:14:\"code/theme.css\";i:71;s:18:\"code/theme.min.css\";i:72;s:22:\"columns/editor-rtl.css\";i:73;s:26:\"columns/editor-rtl.min.css\";i:74;s:18:\"columns/editor.css\";i:75;s:22:\"columns/editor.min.css\";i:76;s:21:\"columns/style-rtl.css\";i:77;s:25:\"columns/style-rtl.min.css\";i:78;s:17:\"columns/style.css\";i:79;s:21:\"columns/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:30:\"comment-template/style-rtl.css\";i:85;s:34:\"comment-template/style-rtl.min.css\";i:86;s:26:\"comment-template/style.css\";i:87;s:30:\"comment-template/style.min.css\";i:88;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:89;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:90;s:38:\"comments-pagination-numbers/editor.css\";i:91;s:42:\"comments-pagination-numbers/editor.min.css\";i:92;s:34:\"comments-pagination/editor-rtl.css\";i:93;s:38:\"comments-pagination/editor-rtl.min.css\";i:94;s:30:\"comments-pagination/editor.css\";i:95;s:34:\"comments-pagination/editor.min.css\";i:96;s:33:\"comments-pagination/style-rtl.css\";i:97;s:37:\"comments-pagination/style-rtl.min.css\";i:98;s:29:\"comments-pagination/style.css\";i:99;s:33:\"comments-pagination/style.min.css\";i:100;s:29:\"comments-title/editor-rtl.css\";i:101;s:33:\"comments-title/editor-rtl.min.css\";i:102;s:25:\"comments-title/editor.css\";i:103;s:29:\"comments-title/editor.min.css\";i:104;s:23:\"comments/editor-rtl.css\";i:105;s:27:\"comments/editor-rtl.min.css\";i:106;s:19:\"comments/editor.css\";i:107;s:23:\"comments/editor.min.css\";i:108;s:22:\"comments/style-rtl.css\";i:109;s:26:\"comments/style-rtl.min.css\";i:110;s:18:\"comments/style.css\";i:111;s:22:\"comments/style.min.css\";i:112;s:20:\"cover/editor-rtl.css\";i:113;s:24:\"cover/editor-rtl.min.css\";i:114;s:16:\"cover/editor.css\";i:115;s:20:\"cover/editor.min.css\";i:116;s:19:\"cover/style-rtl.css\";i:117;s:23:\"cover/style-rtl.min.css\";i:118;s:15:\"cover/style.css\";i:119;s:19:\"cover/style.min.css\";i:120;s:22:\"details/editor-rtl.css\";i:121;s:26:\"details/editor-rtl.min.css\";i:122;s:18:\"details/editor.css\";i:123;s:22:\"details/editor.min.css\";i:124;s:21:\"details/style-rtl.css\";i:125;s:25:\"details/style-rtl.min.css\";i:126;s:17:\"details/style.css\";i:127;s:21:\"details/style.min.css\";i:128;s:20:\"embed/editor-rtl.css\";i:129;s:24:\"embed/editor-rtl.min.css\";i:130;s:16:\"embed/editor.css\";i:131;s:20:\"embed/editor.min.css\";i:132;s:19:\"embed/style-rtl.css\";i:133;s:23:\"embed/style-rtl.min.css\";i:134;s:15:\"embed/style.css\";i:135;s:19:\"embed/style.min.css\";i:136;s:19:\"embed/theme-rtl.css\";i:137;s:23:\"embed/theme-rtl.min.css\";i:138;s:15:\"embed/theme.css\";i:139;s:19:\"embed/theme.min.css\";i:140;s:19:\"file/editor-rtl.css\";i:141;s:23:\"file/editor-rtl.min.css\";i:142;s:15:\"file/editor.css\";i:143;s:19:\"file/editor.min.css\";i:144;s:18:\"file/style-rtl.css\";i:145;s:22:\"file/style-rtl.min.css\";i:146;s:14:\"file/style.css\";i:147;s:18:\"file/style.min.css\";i:148;s:23:\"footnotes/style-rtl.css\";i:149;s:27:\"footnotes/style-rtl.min.css\";i:150;s:19:\"footnotes/style.css\";i:151;s:23:\"footnotes/style.min.css\";i:152;s:23:\"freeform/editor-rtl.css\";i:153;s:27:\"freeform/editor-rtl.min.css\";i:154;s:19:\"freeform/editor.css\";i:155;s:23:\"freeform/editor.min.css\";i:156;s:22:\"gallery/editor-rtl.css\";i:157;s:26:\"gallery/editor-rtl.min.css\";i:158;s:18:\"gallery/editor.css\";i:159;s:22:\"gallery/editor.min.css\";i:160;s:21:\"gallery/style-rtl.css\";i:161;s:25:\"gallery/style-rtl.min.css\";i:162;s:17:\"gallery/style.css\";i:163;s:21:\"gallery/style.min.css\";i:164;s:21:\"gallery/theme-rtl.css\";i:165;s:25:\"gallery/theme-rtl.min.css\";i:166;s:17:\"gallery/theme.css\";i:167;s:21:\"gallery/theme.min.css\";i:168;s:20:\"group/editor-rtl.css\";i:169;s:24:\"group/editor-rtl.min.css\";i:170;s:16:\"group/editor.css\";i:171;s:20:\"group/editor.min.css\";i:172;s:19:\"group/style-rtl.css\";i:173;s:23:\"group/style-rtl.min.css\";i:174;s:15:\"group/style.css\";i:175;s:19:\"group/style.min.css\";i:176;s:19:\"group/theme-rtl.css\";i:177;s:23:\"group/theme-rtl.min.css\";i:178;s:15:\"group/theme.css\";i:179;s:19:\"group/theme.min.css\";i:180;s:21:\"heading/style-rtl.css\";i:181;s:25:\"heading/style-rtl.min.css\";i:182;s:17:\"heading/style.css\";i:183;s:21:\"heading/style.min.css\";i:184;s:19:\"html/editor-rtl.css\";i:185;s:23:\"html/editor-rtl.min.css\";i:186;s:15:\"html/editor.css\";i:187;s:19:\"html/editor.min.css\";i:188;s:20:\"image/editor-rtl.css\";i:189;s:24:\"image/editor-rtl.min.css\";i:190;s:16:\"image/editor.css\";i:191;s:20:\"image/editor.min.css\";i:192;s:19:\"image/style-rtl.css\";i:193;s:23:\"image/style-rtl.min.css\";i:194;s:15:\"image/style.css\";i:195;s:19:\"image/style.min.css\";i:196;s:19:\"image/theme-rtl.css\";i:197;s:23:\"image/theme-rtl.min.css\";i:198;s:15:\"image/theme.css\";i:199;s:19:\"image/theme.min.css\";i:200;s:29:\"latest-comments/style-rtl.css\";i:201;s:33:\"latest-comments/style-rtl.min.css\";i:202;s:25:\"latest-comments/style.css\";i:203;s:29:\"latest-comments/style.min.css\";i:204;s:27:\"latest-posts/editor-rtl.css\";i:205;s:31:\"latest-posts/editor-rtl.min.css\";i:206;s:23:\"latest-posts/editor.css\";i:207;s:27:\"latest-posts/editor.min.css\";i:208;s:26:\"latest-posts/style-rtl.css\";i:209;s:30:\"latest-posts/style-rtl.min.css\";i:210;s:22:\"latest-posts/style.css\";i:211;s:26:\"latest-posts/style.min.css\";i:212;s:18:\"list/style-rtl.css\";i:213;s:22:\"list/style-rtl.min.css\";i:214;s:14:\"list/style.css\";i:215;s:18:\"list/style.min.css\";i:216;s:25:\"media-text/editor-rtl.css\";i:217;s:29:\"media-text/editor-rtl.min.css\";i:218;s:21:\"media-text/editor.css\";i:219;s:25:\"media-text/editor.min.css\";i:220;s:24:\"media-text/style-rtl.css\";i:221;s:28:\"media-text/style-rtl.min.css\";i:222;s:20:\"media-text/style.css\";i:223;s:24:\"media-text/style.min.css\";i:224;s:19:\"more/editor-rtl.css\";i:225;s:23:\"more/editor-rtl.min.css\";i:226;s:15:\"more/editor.css\";i:227;s:19:\"more/editor.min.css\";i:228;s:30:\"navigation-link/editor-rtl.css\";i:229;s:34:\"navigation-link/editor-rtl.min.css\";i:230;s:26:\"navigation-link/editor.css\";i:231;s:30:\"navigation-link/editor.min.css\";i:232;s:29:\"navigation-link/style-rtl.css\";i:233;s:33:\"navigation-link/style-rtl.min.css\";i:234;s:25:\"navigation-link/style.css\";i:235;s:29:\"navigation-link/style.min.css\";i:236;s:33:\"navigation-submenu/editor-rtl.css\";i:237;s:37:\"navigation-submenu/editor-rtl.min.css\";i:238;s:29:\"navigation-submenu/editor.css\";i:239;s:33:\"navigation-submenu/editor.min.css\";i:240;s:25:\"navigation/editor-rtl.css\";i:241;s:29:\"navigation/editor-rtl.min.css\";i:242;s:21:\"navigation/editor.css\";i:243;s:25:\"navigation/editor.min.css\";i:244;s:24:\"navigation/style-rtl.css\";i:245;s:28:\"navigation/style-rtl.min.css\";i:246;s:20:\"navigation/style.css\";i:247;s:24:\"navigation/style.min.css\";i:248;s:23:\"nextpage/editor-rtl.css\";i:249;s:27:\"nextpage/editor-rtl.min.css\";i:250;s:19:\"nextpage/editor.css\";i:251;s:23:\"nextpage/editor.min.css\";i:252;s:24:\"page-list/editor-rtl.css\";i:253;s:28:\"page-list/editor-rtl.min.css\";i:254;s:20:\"page-list/editor.css\";i:255;s:24:\"page-list/editor.min.css\";i:256;s:23:\"page-list/style-rtl.css\";i:257;s:27:\"page-list/style-rtl.min.css\";i:258;s:19:\"page-list/style.css\";i:259;s:23:\"page-list/style.min.css\";i:260;s:24:\"paragraph/editor-rtl.css\";i:261;s:28:\"paragraph/editor-rtl.min.css\";i:262;s:20:\"paragraph/editor.css\";i:263;s:24:\"paragraph/editor.min.css\";i:264;s:23:\"paragraph/style-rtl.css\";i:265;s:27:\"paragraph/style-rtl.min.css\";i:266;s:19:\"paragraph/style.css\";i:267;s:23:\"paragraph/style.min.css\";i:268;s:25:\"post-author/style-rtl.css\";i:269;s:29:\"post-author/style-rtl.min.css\";i:270;s:21:\"post-author/style.css\";i:271;s:25:\"post-author/style.min.css\";i:272;s:33:\"post-comments-form/editor-rtl.css\";i:273;s:37:\"post-comments-form/editor-rtl.min.css\";i:274;s:29:\"post-comments-form/editor.css\";i:275;s:33:\"post-comments-form/editor.min.css\";i:276;s:32:\"post-comments-form/style-rtl.css\";i:277;s:36:\"post-comments-form/style-rtl.min.css\";i:278;s:28:\"post-comments-form/style.css\";i:279;s:32:\"post-comments-form/style.min.css\";i:280;s:23:\"post-date/style-rtl.css\";i:281;s:27:\"post-date/style-rtl.min.css\";i:282;s:19:\"post-date/style.css\";i:283;s:23:\"post-date/style.min.css\";i:284;s:27:\"post-excerpt/editor-rtl.css\";i:285;s:31:\"post-excerpt/editor-rtl.min.css\";i:286;s:23:\"post-excerpt/editor.css\";i:287;s:27:\"post-excerpt/editor.min.css\";i:288;s:26:\"post-excerpt/style-rtl.css\";i:289;s:30:\"post-excerpt/style-rtl.min.css\";i:290;s:22:\"post-excerpt/style.css\";i:291;s:26:\"post-excerpt/style.min.css\";i:292;s:34:\"post-featured-image/editor-rtl.css\";i:293;s:38:\"post-featured-image/editor-rtl.min.css\";i:294;s:30:\"post-featured-image/editor.css\";i:295;s:34:\"post-featured-image/editor.min.css\";i:296;s:33:\"post-featured-image/style-rtl.css\";i:297;s:37:\"post-featured-image/style-rtl.min.css\";i:298;s:29:\"post-featured-image/style.css\";i:299;s:33:\"post-featured-image/style.min.css\";i:300;s:34:\"post-navigation-link/style-rtl.css\";i:301;s:38:\"post-navigation-link/style-rtl.min.css\";i:302;s:30:\"post-navigation-link/style.css\";i:303;s:34:\"post-navigation-link/style.min.css\";i:304;s:28:\"post-template/editor-rtl.css\";i:305;s:32:\"post-template/editor-rtl.min.css\";i:306;s:24:\"post-template/editor.css\";i:307;s:28:\"post-template/editor.min.css\";i:308;s:27:\"post-template/style-rtl.css\";i:309;s:31:\"post-template/style-rtl.min.css\";i:310;s:23:\"post-template/style.css\";i:311;s:27:\"post-template/style.min.css\";i:312;s:24:\"post-terms/style-rtl.css\";i:313;s:28:\"post-terms/style-rtl.min.css\";i:314;s:20:\"post-terms/style.css\";i:315;s:24:\"post-terms/style.min.css\";i:316;s:24:\"post-title/style-rtl.css\";i:317;s:28:\"post-title/style-rtl.min.css\";i:318;s:20:\"post-title/style.css\";i:319;s:24:\"post-title/style.min.css\";i:320;s:26:\"preformatted/style-rtl.css\";i:321;s:30:\"preformatted/style-rtl.min.css\";i:322;s:22:\"preformatted/style.css\";i:323;s:26:\"preformatted/style.min.css\";i:324;s:24:\"pullquote/editor-rtl.css\";i:325;s:28:\"pullquote/editor-rtl.min.css\";i:326;s:20:\"pullquote/editor.css\";i:327;s:24:\"pullquote/editor.min.css\";i:328;s:23:\"pullquote/style-rtl.css\";i:329;s:27:\"pullquote/style-rtl.min.css\";i:330;s:19:\"pullquote/style.css\";i:331;s:23:\"pullquote/style.min.css\";i:332;s:23:\"pullquote/theme-rtl.css\";i:333;s:27:\"pullquote/theme-rtl.min.css\";i:334;s:19:\"pullquote/theme.css\";i:335;s:23:\"pullquote/theme.min.css\";i:336;s:39:\"query-pagination-numbers/editor-rtl.css\";i:337;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:338;s:35:\"query-pagination-numbers/editor.css\";i:339;s:39:\"query-pagination-numbers/editor.min.css\";i:340;s:31:\"query-pagination/editor-rtl.css\";i:341;s:35:\"query-pagination/editor-rtl.min.css\";i:342;s:27:\"query-pagination/editor.css\";i:343;s:31:\"query-pagination/editor.min.css\";i:344;s:30:\"query-pagination/style-rtl.css\";i:345;s:34:\"query-pagination/style-rtl.min.css\";i:346;s:26:\"query-pagination/style.css\";i:347;s:30:\"query-pagination/style.min.css\";i:348;s:25:\"query-title/style-rtl.css\";i:349;s:29:\"query-title/style-rtl.min.css\";i:350;s:21:\"query-title/style.css\";i:351;s:25:\"query-title/style.min.css\";i:352;s:20:\"query/editor-rtl.css\";i:353;s:24:\"query/editor-rtl.min.css\";i:354;s:16:\"query/editor.css\";i:355;s:20:\"query/editor.min.css\";i:356;s:19:\"query/style-rtl.css\";i:357;s:23:\"query/style-rtl.min.css\";i:358;s:15:\"query/style.css\";i:359;s:19:\"query/style.min.css\";i:360;s:19:\"quote/style-rtl.css\";i:361;s:23:\"quote/style-rtl.min.css\";i:362;s:15:\"quote/style.css\";i:363;s:19:\"quote/style.min.css\";i:364;s:19:\"quote/theme-rtl.css\";i:365;s:23:\"quote/theme-rtl.min.css\";i:366;s:15:\"quote/theme.css\";i:367;s:19:\"quote/theme.min.css\";i:368;s:23:\"read-more/style-rtl.css\";i:369;s:27:\"read-more/style-rtl.min.css\";i:370;s:19:\"read-more/style.css\";i:371;s:23:\"read-more/style.min.css\";i:372;s:18:\"rss/editor-rtl.css\";i:373;s:22:\"rss/editor-rtl.min.css\";i:374;s:14:\"rss/editor.css\";i:375;s:18:\"rss/editor.min.css\";i:376;s:17:\"rss/style-rtl.css\";i:377;s:21:\"rss/style-rtl.min.css\";i:378;s:13:\"rss/style.css\";i:379;s:17:\"rss/style.min.css\";i:380;s:21:\"search/editor-rtl.css\";i:381;s:25:\"search/editor-rtl.min.css\";i:382;s:17:\"search/editor.css\";i:383;s:21:\"search/editor.min.css\";i:384;s:20:\"search/style-rtl.css\";i:385;s:24:\"search/style-rtl.min.css\";i:386;s:16:\"search/style.css\";i:387;s:20:\"search/style.min.css\";i:388;s:20:\"search/theme-rtl.css\";i:389;s:24:\"search/theme-rtl.min.css\";i:390;s:16:\"search/theme.css\";i:391;s:20:\"search/theme.min.css\";i:392;s:24:\"separator/editor-rtl.css\";i:393;s:28:\"separator/editor-rtl.min.css\";i:394;s:20:\"separator/editor.css\";i:395;s:24:\"separator/editor.min.css\";i:396;s:23:\"separator/style-rtl.css\";i:397;s:27:\"separator/style-rtl.min.css\";i:398;s:19:\"separator/style.css\";i:399;s:23:\"separator/style.min.css\";i:400;s:23:\"separator/theme-rtl.css\";i:401;s:27:\"separator/theme-rtl.min.css\";i:402;s:19:\"separator/theme.css\";i:403;s:23:\"separator/theme.min.css\";i:404;s:24:\"shortcode/editor-rtl.css\";i:405;s:28:\"shortcode/editor-rtl.min.css\";i:406;s:20:\"shortcode/editor.css\";i:407;s:24:\"shortcode/editor.min.css\";i:408;s:24:\"site-logo/editor-rtl.css\";i:409;s:28:\"site-logo/editor-rtl.min.css\";i:410;s:20:\"site-logo/editor.css\";i:411;s:24:\"site-logo/editor.min.css\";i:412;s:23:\"site-logo/style-rtl.css\";i:413;s:27:\"site-logo/style-rtl.min.css\";i:414;s:19:\"site-logo/style.css\";i:415;s:23:\"site-logo/style.min.css\";i:416;s:27:\"site-tagline/editor-rtl.css\";i:417;s:31:\"site-tagline/editor-rtl.min.css\";i:418;s:23:\"site-tagline/editor.css\";i:419;s:27:\"site-tagline/editor.min.css\";i:420;s:25:\"site-title/editor-rtl.css\";i:421;s:29:\"site-title/editor-rtl.min.css\";i:422;s:21:\"site-title/editor.css\";i:423;s:25:\"site-title/editor.min.css\";i:424;s:24:\"site-title/style-rtl.css\";i:425;s:28:\"site-title/style-rtl.min.css\";i:426;s:20:\"site-title/style.css\";i:427;s:24:\"site-title/style.min.css\";i:428;s:26:\"social-link/editor-rtl.css\";i:429;s:30:\"social-link/editor-rtl.min.css\";i:430;s:22:\"social-link/editor.css\";i:431;s:26:\"social-link/editor.min.css\";i:432;s:27:\"social-links/editor-rtl.css\";i:433;s:31:\"social-links/editor-rtl.min.css\";i:434;s:23:\"social-links/editor.css\";i:435;s:27:\"social-links/editor.min.css\";i:436;s:26:\"social-links/style-rtl.css\";i:437;s:30:\"social-links/style-rtl.min.css\";i:438;s:22:\"social-links/style.css\";i:439;s:26:\"social-links/style.min.css\";i:440;s:21:\"spacer/editor-rtl.css\";i:441;s:25:\"spacer/editor-rtl.min.css\";i:442;s:17:\"spacer/editor.css\";i:443;s:21:\"spacer/editor.min.css\";i:444;s:20:\"spacer/style-rtl.css\";i:445;s:24:\"spacer/style-rtl.min.css\";i:446;s:16:\"spacer/style.css\";i:447;s:20:\"spacer/style.min.css\";i:448;s:20:\"table/editor-rtl.css\";i:449;s:24:\"table/editor-rtl.min.css\";i:450;s:16:\"table/editor.css\";i:451;s:20:\"table/editor.min.css\";i:452;s:19:\"table/style-rtl.css\";i:453;s:23:\"table/style-rtl.min.css\";i:454;s:15:\"table/style.css\";i:455;s:19:\"table/style.min.css\";i:456;s:19:\"table/theme-rtl.css\";i:457;s:23:\"table/theme-rtl.min.css\";i:458;s:15:\"table/theme.css\";i:459;s:19:\"table/theme.min.css\";i:460;s:23:\"tag-cloud/style-rtl.css\";i:461;s:27:\"tag-cloud/style-rtl.min.css\";i:462;s:19:\"tag-cloud/style.css\";i:463;s:23:\"tag-cloud/style.min.css\";i:464;s:28:\"template-part/editor-rtl.css\";i:465;s:32:\"template-part/editor-rtl.min.css\";i:466;s:24:\"template-part/editor.css\";i:467;s:28:\"template-part/editor.min.css\";i:468;s:27:\"template-part/theme-rtl.css\";i:469;s:31:\"template-part/theme-rtl.min.css\";i:470;s:23:\"template-part/theme.css\";i:471;s:27:\"template-part/theme.min.css\";i:472;s:30:\"term-description/style-rtl.css\";i:473;s:34:\"term-description/style-rtl.min.css\";i:474;s:26:\"term-description/style.css\";i:475;s:30:\"term-description/style.min.css\";i:476;s:27:\"text-columns/editor-rtl.css\";i:477;s:31:\"text-columns/editor-rtl.min.css\";i:478;s:23:\"text-columns/editor.css\";i:479;s:27:\"text-columns/editor.min.css\";i:480;s:26:\"text-columns/style-rtl.css\";i:481;s:30:\"text-columns/style-rtl.min.css\";i:482;s:22:\"text-columns/style.css\";i:483;s:26:\"text-columns/style.min.css\";i:484;s:19:\"verse/style-rtl.css\";i:485;s:23:\"verse/style-rtl.min.css\";i:486;s:15:\"verse/style.css\";i:487;s:19:\"verse/style.min.css\";i:488;s:20:\"video/editor-rtl.css\";i:489;s:24:\"video/editor-rtl.min.css\";i:490;s:16:\"video/editor.css\";i:491;s:20:\"video/editor.min.css\";i:492;s:19:\"video/style-rtl.css\";i:493;s:23:\"video/style-rtl.min.css\";i:494;s:15:\"video/style.css\";i:495;s:19:\"video/style.min.css\";i:496;s:19:\"video/theme-rtl.css\";i:497;s:23:\"video/theme-rtl.min.css\";i:498;s:15:\"video/theme.css\";i:499;s:19:\"video/theme.min.css\";}}','yes'),(123,'recovery_keys','a:0:{}','yes'),(126,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1702882626;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:3:\"5.3\";s:9:\"hello.php\";s:5:\"1.7.2\";}}','no'),(129,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1702882626;s:7:\"checked\";a:3:{s:16:\"twentytwentyfour\";s:3:\"1.0\";s:17:\"twentytwentythree\";s:3:\"1.3\";s:15:\"twentytwentytwo\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.0\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.0.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.3.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.6.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}','no'),(130,'theme_mods_twentytwentyfour','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes'),(133,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:17:\"rodo@guluarte.com\";s:7:\"version\";s:5:\"6.4.2\";s:9:\"timestamp\";i:1701985040;}','no'),(140,'can_compress_scripts','0','yes'),(155,'finished_updating_comment_type','1','yes'),(181,'https_detection_errors','a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}','yes'),(182,'_transient_health-check-site-status-result','{\"good\":19,\"recommended\":4,\"critical\":0}','yes'),(216,'WPLANG','','yes'),(217,'new_admin_email','rodo@guluarte.com','yes'),(221,'category_children','a:0:{}','yes'),(282,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.2\";s:7:\"version\";s:5:\"6.4.2\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1702882625;s:15:\"version_checked\";s:5:\"6.4.2\";s:12:\"translations\";a:0:{}}','no'),(299,'recently_activated','a:0:{}','yes'),(554,'_site_transient_timeout_theme_roots','1702884425','no'),(555,'_site_transient_theme_roots','a:3:{s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}','no'),(556,'_transient_doing_cron','1703718993.5017290115356445312500','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2023-11-13 18:30:57','2023-11-13 18:30:57','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2023-11-13 18:30:57','2023-11-13 18:30:57','',0,'http://209.38.176.120:8080/?p=1',0,'post','',1),(2,1,'2023-11-13 18:30:57','2023-11-13 18:30:57','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://209.38.176.120:8080/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2023-11-13 18:30:57','2023-11-13 18:30:57','',0,'http://209.38.176.120:8080/?page_id=2',0,'page','',0),(3,1,'2023-11-13 18:30:57','2023-11-13 18:30:57','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://209.38.176.120:8080.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2023-11-13 18:30:57','2023-11-13 18:30:57','',0,'http://209.38.176.120:8080/?page_id=3',0,'page','',0),(4,0,'2023-11-13 18:30:58','2023-11-13 18:30:58','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2023-11-13 18:30:58','2023-11-13 18:30:58','',0,'http://209.38.176.120:8080/2023/11/13/navigation/',0,'wp_navigation','',0),(5,0,'2023-12-18 01:11:02','2023-12-18 01:11:02','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation-2','','','2023-12-18 01:11:02','2023-12-18 01:11:02','',0,'https://wp.laborflow.io/2023/12/18/navigation-2/',0,'wp_navigation','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','jobflow'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','0'),(16,1,'session_tokens','a:2:{s:64:\"a433a6a83da0543334bdf6be919947df1b047ef71b987030da39f6a87128f143\";a:4:{s:10:\"expiration\";i:1702157844;s:2:\"ip\";s:15:\"187.223.143.216\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36\";s:5:\"login\";i:1701985044;}s:64:\"6612cdb1f169b37128d95361722dd52f1ccd9020568a7a0d9bea3615b97194b7\";a:4:{s:10:\"expiration\";i:1702158107;s:2:\"ip\";s:15:\"187.223.143.216\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36\";s:5:\"login\";i:1701985307;}}'),(17,1,'wp_dashboard_quick_press_last_post_id','5'),(18,1,'community-events-location','a:1:{s:2:\"ip\";s:13:\"187.223.143.0\";}'),(19,2,'nickname','marcel'),(20,2,'first_name','Marcel'),(21,2,'last_name','Reperich'),(22,2,'description',''),(23,2,'rich_editing','true'),(24,2,'syntax_highlighting','true'),(25,2,'comment_shortcuts','false'),(26,2,'admin_color','fresh'),(27,2,'use_ssl','0'),(28,2,'show_admin_bar_front','true'),(29,2,'locale',''),(30,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(31,2,'wp_user_level','10'),(32,2,'dismissed_wp_pointers',''),(33,2,'session_tokens','a:1:{s:64:\"2af073b321eace17db64a9cde1fb7ea4c97a24e2ed4bff1f527a999b919c7d70\";a:4:{s:10:\"expiration\";i:1702157980;s:2:\"ip\";s:15:\"187.223.143.216\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36\";s:5:\"login\";i:1701985180;}}'),(34,2,'wp_dashboard_quick_press_last_post_id','6'),(35,2,'community-events-location','a:1:{s:2:\"ip\";s:13:\"187.223.143.0\";}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'jobflow','$P$Bi.YUTP48IND2T9iGZMLNTdZBaA79V0','jobflow','rodo@guluarte.com','http://209.38.176.120:8080','2023-11-13 18:30:57','',0,'jobflow'),(2,'marcel','$P$Bzxj9qrNjstGbR6WfWirPMot7Uk1Mj0','marcel','be-vent@hotmail.com','http://laborflow.io','2023-12-07 21:39:21','',0,'Marcel Reperich');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jobflow'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-27 17:31:08