-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: twfi
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_deleted_at_index` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Twfi',NULL,'2021-08-09 18:05:43','2021-08-09 18:05:43',NULL),(2,'Francis Ventures',NULL,'2021-08-09 18:05:50','2021-08-16 18:00:42',NULL),(3,'Oasis Midstream ','Pipeline fabrication','2021-08-16 18:00:14','2021-08-16 18:00:14',NULL),(4,'sadadfadsfasdf',NULL,'2021-08-19 20:22:19','2021-08-19 20:22:25','2021-08-19 20:22:25'),(5,'adfadsf',NULL,'2021-08-19 20:22:31','2021-08-19 20:22:41','2021-08-19 20:22:41'),(6,'jhghj',NULL,'2021-08-19 20:25:22','2021-08-19 20:25:31','2021-08-19 20:25:31');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2018_04_29_153711_create_1525005431_companies_table',1),(9,'2018_04_29_153901_add_5ae5bce3c078c_relationships_to_employee_table',1),(10,'2021_06_18_003555_create_projects_table',1),(11,'2021_06_22_154532_create_roles_table',1),(12,'2021_06_22_155406_create_permission_lists_table',1),(13,'2021_06_22_155555_create_titles_table',1),(14,'2021_06_22_155907_create_role_permissions_table',1),(15,'2021_06_22_160205_create_user_permissions_table',1),(16,'2021_06_22_160342_create_user_titles_table',1),(17,'2021_06_22_161604_create_relations_users_roles',1),(18,'2021_06_25_130405_add_classification_fields_to_users_table',1),(19,'2021_06_28_014346_create_project_assigns_table',1),(20,'2021_06_28_015403_create_project_assign_projects_table',1),(21,'2021_06_28_015602_create_project_assign_users_table',1),(22,'2021_06_28_181351_update_projects_table_project_number_field',1),(23,'2021_06_28_202542_create_timecards_table',1),(24,'2021_07_06_212312_add_columns_to_timecards_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'TWFI Personal Access Client','nFD1shvLJTVF4BFxtN6Vf5vgScBvp40AtAROAT0s','http://localhost',1,0,0,'2021-08-09 16:32:50','2021-08-09 16:32:50'),(2,NULL,'TWFI Password Grant Client','pmbzRNy8z9WKfmSJqoTqzPbH8ddx4tUWfn9ktzYY','http://localhost',0,1,0,'2021-08-09 16:32:50','2021-08-09 16:32:50'),(3,NULL,'TWFI Personal Access Client','gsDAxSUyfk99uIVYHbDPDbvZlA56O7hYNyrNIiC6','http://localhost',1,0,0,'2021-08-09 16:33:07','2021-08-09 16:33:07'),(4,NULL,'TWFI Password Grant Client','gjz4qiJsBFs5VtkmpXqyknDeI607eOgbyU2FgHdY','http://localhost',0,1,0,'2021-08-09 16:33:07','2021-08-09 16:33:07'),(5,NULL,'TWFI Personal Access Client','ie3HxuH9B2NNQdIOgHxruJWAa64UAuOxe1VAoklJ','http://localhost',1,0,0,'2021-08-10 04:32:38','2021-08-10 04:32:38'),(6,NULL,'TWFI Password Grant Client','17GsqJ1ypNsArKggCxgeul9F3c6TAhAbzbzWySyq','http://localhost',0,1,0,'2021-08-10 04:32:38','2021-08-10 04:32:38'),(7,NULL,'TWFI Personal Access Client','nlib6sDwtgTJIeV8eH0RMXQUDmvOdOHfmH4c3hks','http://localhost',1,0,0,'2021-08-10 04:32:53','2021-08-10 04:32:53'),(8,NULL,'TWFI Password Grant Client','dJKKxUh9wi0K7t7VbsdrLA0q4HmNrGcTW0FyoMcT','http://localhost',0,1,0,'2021-08-10 04:32:53','2021-08-10 04:32:53');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-08-09 16:32:50','2021-08-09 16:32:50'),(2,3,'2021-08-09 16:33:07','2021-08-09 16:33:07'),(3,5,'2021-08-10 04:32:38','2021-08-10 04:32:38'),(4,7,'2021-08-10 04:32:53','2021-08-10 04:32:53');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('ttroutman@twfi.com','$2y$10$cGpWepLW7ejMyw36RoeI9uf.E15PyKZgCQmhib/v1YVBZYwPzln.2','2021-08-17 20:11:20'),('mtroutman@twfi.net','$2y$10$aEa7fsWnPv1E587diBchuufJifd2uRJM9zLuHLupGkj23xIOVwbWy','2021-08-17 20:29:53'),('admin@admin.com','$2y$10$8TKUddWdGbxrM4p3i2Pq2.euS0bxGFd.YWrhKslAl8N4JEVkfCtpm','2021-08-19 22:30:12');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_lists`
--

DROP TABLE IF EXISTS `permission_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_lists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_lists`
--

LOCK TABLES `permission_lists` WRITE;
/*!40000 ALTER TABLE `permission_lists` DISABLE KEYS */;
INSERT INTO `permission_lists` VALUES (1,'Admin','2021-08-09 18:09:15','2021-08-17 16:27:41',NULL),(2,'Office Administrator','2021-08-09 18:09:21','2021-08-17 16:27:57',NULL),(3,'Manger','2021-08-09 18:09:25','2021-08-19 08:13:28',NULL),(4,'Laborer','2021-08-09 18:09:30','2021-08-17 16:28:17',NULL);
/*!40000 ALTER TABLE `permission_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_assign_projects`
--

DROP TABLE IF EXISTS `project_assign_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_assign_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assign_id` int unsigned DEFAULT NULL,
  `project_id` int unsigned DEFAULT NULL,
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_assign_projects_assign_id` (`assign_id`),
  KEY `project_assign_projects_project_id` (`project_id`),
  CONSTRAINT `project_assign_projects_assign_id` FOREIGN KEY (`assign_id`) REFERENCES `project_assigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_assign_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_assign_projects`
--

LOCK TABLES `project_assign_projects` WRITE;
/*!40000 ALTER TABLE `project_assign_projects` DISABLE KEYS */;
INSERT INTO `project_assign_projects` VALUES (1,1,1,NULL,'2021-08-09 18:27:52','2021-08-09 18:27:52'),(2,3,1,NULL,'2021-08-16 17:00:23','2021-08-16 17:00:23'),(3,6,2,NULL,'2021-08-16 20:23:01','2021-08-16 20:23:01');
/*!40000 ALTER TABLE `project_assign_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_assign_users`
--

DROP TABLE IF EXISTS `project_assign_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_assign_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assign_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_assign_users_assign_id` (`assign_id`),
  KEY `project_assign_users_user_id` (`user_id`),
  CONSTRAINT `project_assign_users_assign_id` FOREIGN KEY (`assign_id`) REFERENCES `project_assigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_assign_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_assign_users`
--

LOCK TABLES `project_assign_users` WRITE;
/*!40000 ALTER TABLE `project_assign_users` DISABLE KEYS */;
INSERT INTO `project_assign_users` VALUES (1,1,1,'t-1',NULL,'2021-08-09 18:27:52','2021-08-09 18:27:52'),(2,3,2,'t-1',NULL,'2021-08-16 17:00:23','2021-08-16 17:00:23'),(3,6,3,'t-1',NULL,'2021-08-16 20:23:01','2021-08-16 20:23:01');
/*!40000 ALTER TABLE `project_assign_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_assigns`
--

DROP TABLE IF EXISTS `project_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_assigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_assigns`
--

LOCK TABLES `project_assigns` WRITE;
/*!40000 ALTER TABLE `project_assigns` DISABLE KEYS */;
INSERT INTO `project_assigns` VALUES (1,NULL,'2021-08-09 18:27:52','2021-08-09 18:27:52'),(2,NULL,'2021-08-11 15:55:04','2021-08-11 15:55:04'),(3,NULL,'2021-08-16 17:00:23','2021-08-16 17:00:23'),(4,NULL,'2021-08-16 18:21:39','2021-08-16 18:21:39'),(5,NULL,'2021-08-16 18:23:06','2021-08-16 18:23:06'),(6,NULL,'2021-08-16 20:23:01','2021-08-16 20:23:01');
/*!40000 ALTER TABLE `project_assigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `project` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','On Deck') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'project-1','1','Active','2021-08-09','2021-08-15','United States','14627 Noel ST','Williston','North Dakota','58801',NULL,NULL,'2021-08-09 18:10:46','2021-08-09 18:10:46',NULL),(2,'Indian Hill Federal ','0001','Active','2021-07-28','2021-08-25','County','Street','City','North West',NULL,NULL,NULL,'2021-08-16 18:16:20','2021-08-16 18:16:20',NULL),(3,'Balance Oasis ','12345','Active','2021-08-01','2021-11-28','USA','Optional','City','North East','17860',NULL,NULL,'2021-08-16 18:18:40','2021-08-16 18:18:40',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned DEFAULT NULL,
  `permission_id` int unsigned DEFAULT NULL,
  `permission` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id` (`role_id`),
  KEY `role_permissions_permission_id` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permissions_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1,1,1,'2021-08-17 16:28:29','2021-08-17 16:28:29',NULL),(2,2,2,1,'2021-08-17 16:28:34','2021-08-17 16:28:34',NULL),(3,3,3,1,'2021-08-17 16:28:38','2021-08-17 16:28:38',NULL),(4,4,4,1,'2021-08-17 16:28:42','2021-08-17 16:28:42',NULL);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','2021-08-09 16:32:19','2021-08-09 18:03:48',NULL),(2,'Office Administrator','2021-08-09 16:32:19','2021-08-16 20:08:49',NULL),(3,'Manger','2021-08-09 18:04:15','2021-08-16 20:09:03',NULL),(4,'Laborer','2021-08-09 18:04:24','2021-08-16 20:09:26',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timecards`
--

DROP TABLE IF EXISTS `timecards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timecards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `assign_id` int unsigned DEFAULT NULL,
  `project_id` int unsigned DEFAULT NULL,
  `check_in` int DEFAULT NULL,
  `check_out` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cost_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_absent` tinyint DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `is_open` tinyint DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timecards_user_id` (`user_id`),
  KEY `timecards_assign_id` (`assign_id`),
  KEY `timecards_project_id` (`project_id`),
  CONSTRAINT `timecards_assign_id` FOREIGN KEY (`assign_id`) REFERENCES `project_assigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timecards_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timecards_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timecards`
--

LOCK TABLES `timecards` WRITE;
/*!40000 ALTER TABLE `timecards` DISABLE KEYS */;
INSERT INTO `timecards` VALUES (2,1,NULL,1,427,788,'2021-08-10 16:46:03','2021-08-12 17:43:04','123e4','Drive Time - DRV','Bulldozer','','test',NULL,372,NULL,'2021-08-11'),(4,1,NULL,1,370,624,'2021-08-13 03:35:13','2021-08-13 03:35:13',NULL,'Regular Time - RT',NULL,NULL,NULL,NULL,254,NULL,'2021-08-12'),(8,1,NULL,1,900,900,'2021-08-16 18:26:11','2021-08-16 18:26:11',NULL,'Regular Time - RT',NULL,NULL,NULL,NULL,0,NULL,'2021-08-16'),(9,1,NULL,1,780,1140,'2021-08-16 18:27:40','2021-08-16 18:29:43','Welder / Forman / Material Handler ','Regular Time - RT',NULL,NULL,NULL,NULL,360,NULL,'2021-08-16');
/*!40000 ALTER TABLE `timecards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'t-1','2021-08-09 18:09:39','2021-08-09 18:09:39',NULL),(2,'t-2','2021-08-09 18:09:43','2021-08-09 18:09:43',NULL),(3,'t-3','2021-08-09 18:09:47','2021-08-09 18:09:47',NULL),(4,'t-4','2021-08-09 18:09:52','2021-08-09 18:09:52',NULL),(5,'t-5','2021-08-09 18:09:56','2021-08-09 18:09:56',NULL);
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `permission_id` int unsigned DEFAULT NULL,
  `permission` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_permissions_user_id` (`user_id`),
  KEY `user_permissions_permission_id` (`permission_id`),
  CONSTRAINT `user_permissions_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (20,5,1,1,'2021-08-17 20:13:01','2021-08-17 20:13:01',NULL),(22,1,1,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(24,2,2,1,'2021-08-19 08:12:57','2021-08-19 08:12:57',NULL),(28,3,1,1,'2021-08-19 10:53:40','2021-08-19 10:53:40',NULL);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_titles`
--

DROP TABLE IF EXISTS `user_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_titles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `title_id` int unsigned DEFAULT NULL,
  `is_include` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_titles_user_id` (`user_id`),
  KEY `user_titles_title_id` (`title_id`),
  CONSTRAINT `user_titles_title_id` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_titles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_titles`
--

LOCK TABLES `user_titles` WRITE;
/*!40000 ALTER TABLE `user_titles` DISABLE KEYS */;
INSERT INTO `user_titles` VALUES (24,1,1,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(25,1,3,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(26,1,2,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(27,1,5,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(28,1,4,1,'2021-08-19 08:10:48','2021-08-19 08:10:48',NULL),(30,2,1,1,'2021-08-19 08:12:57','2021-08-19 08:12:57',NULL),(40,3,1,1,'2021-08-19 10:53:40','2021-08-19 10:53:40',NULL),(41,3,3,1,'2021-08-19 10:53:40','2021-08-19 10:53:40',NULL),(42,3,5,1,'2021-08-19 10:53:40','2021-08-19 10:53:40',NULL);
/*!40000 ALTER TABLE `user_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_number` int DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `phone_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_notes` text COLLATE utf8mb4_unicode_ci,
  `emergency_contact_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `trade` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_collaborator` tinyint DEFAULT NULL,
  `send_invitation_email` tinyint DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `266_5ae5bce3adfe2` (`company_id`),
  KEY `users_role_id` (`role_id`),
  CONSTRAINT `266_5ae5bce3adfe2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'upload/wkc07RC4oOU2qzwxj0kghh71OghRGc3vpP8gYX7i.jpeg','Admin','user','admin@admin.com',1,'$2y$10$kPq/W/oz2Nd00pCGUjVqgOhY0NTA2Wr/XOVUI5BwFTjCIZ.ZsKXLW',1,NULL,'123456789',NULL,NULL,NULL,'9bIaZTBD8GYK9DAC7XSWR6DqRe6cZG8N52xsNfc7z60HrWaJWHI8nxWVb8oT','2021-08-09 16:32:19','2021-08-19 08:10:48',NULL,NULL,'Assistant Constr\'s Mgr',NULL,NULL,NULL,0,2),(2,'upload/JfON4o6v2NOO6wRKYUbvfPxktwnsBCt1izuUjq1a.jpeg','Ming','Ming','onefire430@outlook.com',2345,'$2y$10$7NPUCrQ9OMim2BWesm9OnOzUxZYoDZnP1mcqeAFlSFp4TgB9PSnkC',2,NULL,'5805837004',NULL,'',NULL,'YZyioZXyLZuSujNVE8ZfVovksbysjsQ2fkBaYdeR7FPhbvN44TzaN1MmOGXX','2021-08-09 19:44:32','2021-08-20 01:39:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(3,'upload/5I3hWlHTkl3hCd9ETVOw3SgrXvMx4YmscYXMiAXN.png','Tim','Troutman','ttroutman@twfi.net',5,'$2y$10$3zrnyiEMz8fkmDQp5Qz24uo5rshgOlR9SgRDStAP2t/OZeskysi8i',1,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-16 17:40:49','2021-08-19 10:53:40',NULL,NULL,'Construction Manager','',NULL,NULL,1,1),(5,NULL,'Melanie ','Troutman','mtroutman@twfi.net',6,'$2y$10$0q6a94T8p65RvIHIXK7s0Or0r36lh6HHFNYwumyoBpIvq2HFTo/I6',1,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-16 17:57:33','2021-08-17 20:13:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-20 19:14:26
