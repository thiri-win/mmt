-- MySQL dump 10.13  Distrib 9.0.1, for macos14 (x86_64)
--
-- Host: localhost    Database: mmt
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `buy_infos`
--

DROP TABLE IF EXISTS `buy_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `dealer_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `buy_qty` decimal(15,2) DEFAULT NULL,
  `buy_price` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buy_infos_order_id_foreign` (`order_id`),
  KEY `buy_infos_dealer_id_foreign` (`dealer_id`),
  KEY `buy_infos_item_id_foreign` (`item_id`),
  CONSTRAINT `buy_infos_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  CONSTRAINT `buy_infos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `buy_infos_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_infos`
--

LOCK TABLES `buy_infos` WRITE;
/*!40000 ALTER TABLE `buy_infos` DISABLE KEYS */;
INSERT INTO `buy_infos` VALUES (1,1,1,3,0.90,160000,'2026-01-26 06:19:01','2026-01-26 06:19:01'),(2,2,3,2,90.00,260,'2026-01-26 06:23:25','2026-01-26 06:23:25'),(3,3,1,4,80.00,1600,'2026-01-26 06:27:34','2026-01-26 06:27:34'),(4,4,1,3,0.00,0,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,5,3,2,0.00,0,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,6,1,3,0.00,0,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,7,4,2,1.00,26000,'2026-01-26 07:11:52','2026-01-26 21:02:36'),(8,8,4,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,9,1,3,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:20:22'),(10,10,2,2,0.00,0,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,11,3,2,0.00,0,'2026-01-26 07:28:44','2026-01-26 07:28:44'),(12,12,2,2,0.00,0,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,13,4,2,1.25,24000,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,14,2,2,0.50,24000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,14,1,3,0.20,125000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(16,15,1,3,1.25,125000,'2026-01-26 21:14:35','2026-01-26 21:14:35'),(17,16,3,2,0.00,0,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(18,17,3,2,0.00,0,'2026-01-26 21:19:26','2026-01-26 21:19:26'),(19,18,2,2,0.00,0,'2026-01-29 21:27:26','2026-01-29 21:27:26'),(20,19,1,3,0.00,0,'2026-01-29 21:28:32','2026-01-29 21:28:32'),(21,20,3,2,0.00,0,'2026-01-29 21:29:55','2026-01-29 21:29:55'),(22,21,3,2,0.80,24000,'2026-01-29 21:31:18','2026-01-29 21:31:18'),(23,22,1,3,0.00,0,'2026-01-29 21:32:08','2026-01-29 21:32:08'),(24,23,6,2,0.00,0,'2026-01-29 21:33:53','2026-01-29 21:33:53'),(26,25,4,2,0.00,0,'2026-01-29 21:41:11','2026-01-29 21:41:11'),(27,26,2,2,0.00,0,'2026-01-29 21:42:24','2026-01-29 21:42:24'),(28,27,2,2,0.00,0,'2026-01-29 21:44:19','2026-01-29 21:44:19'),(29,27,1,3,0.00,0,'2026-01-29 21:44:19','2026-01-29 21:44:19'),(30,28,2,2,0.00,0,'2026-01-29 21:50:37','2026-01-29 21:50:37'),(33,31,2,2,0.00,0,'2026-01-29 22:34:43','2026-01-29 22:34:43'),(34,32,1,3,0.00,0,'2026-01-29 22:37:44','2026-01-29 22:37:44'),(35,33,2,2,0.00,0,'2026-01-29 22:40:53','2026-01-29 22:40:53'),(36,34,2,2,0.00,0,'2026-01-29 22:42:17','2026-01-29 22:42:17'),(37,35,2,2,0.00,0,'2026-01-29 22:44:27','2026-01-29 22:44:27'),(38,35,1,3,0.00,0,'2026-01-29 22:44:27','2026-01-29 22:44:27'),(39,36,2,2,0.00,0,'2026-01-29 22:45:03','2026-01-29 22:45:03'),(40,37,2,2,0.00,0,'2026-01-29 22:46:43','2026-01-29 22:46:43'),(41,37,1,3,0.00,0,'2026-01-29 22:46:43','2026-01-29 22:46:43'),(43,39,2,2,0.00,0,'2026-01-30 07:03:27','2026-01-30 07:03:27'),(44,40,2,2,1.25,24000,'2026-01-30 07:09:20','2026-01-30 07:09:20'),(45,41,1,3,0.00,0,'2026-01-30 07:12:26','2026-01-30 07:12:26'),(46,42,2,2,0.75,24000,'2026-01-30 07:19:07','2026-01-30 07:19:07'),(47,42,1,3,0.50,120000,'2026-01-30 07:19:07','2026-01-30 07:19:07'),(48,43,10,2,0.00,0,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(49,43,1,3,0.00,0,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(50,44,10,2,0.00,0,'2026-01-30 07:50:17','2026-01-30 07:50:17'),(51,45,6,2,0.00,0,'2026-01-30 07:52:46','2026-01-30 07:52:46'),(52,46,2,2,0.00,0,'2026-01-30 07:53:55','2026-01-30 07:53:55'),(53,47,10,2,0.00,0,'2026-01-30 07:55:18','2026-01-30 07:55:18'),(54,48,11,2,0.00,0,'2026-01-30 07:57:50','2026-01-30 07:57:50'),(55,49,2,2,0.00,0,'2026-01-30 07:59:38','2026-01-30 07:59:38'),(56,50,1,2,0.00,0,'2026-01-30 08:00:59','2026-01-30 08:00:59'),(57,51,1,2,0.00,0,'2026-01-30 08:01:50','2026-01-30 08:01:50'),(58,52,6,2,0.00,0,'2026-01-30 08:02:49','2026-01-30 08:02:49'),(59,53,6,2,0.00,0,'2026-01-30 08:04:06','2026-01-30 08:04:06'),(60,54,2,2,0.00,0,'2026-01-30 08:05:07','2026-01-30 08:05:07'),(61,55,2,2,0.00,0,'2026-01-30 08:06:23','2026-01-30 08:06:23'),(62,55,1,3,0.00,0,'2026-01-30 08:06:23','2026-01-30 08:06:23'),(63,56,1,3,0.00,0,'2026-01-30 08:08:05','2026-01-30 08:08:05'),(64,57,2,2,0.00,0,'2026-01-30 08:09:12','2026-01-30 08:09:12'),(65,58,2,2,0.00,0,'2026-01-30 08:10:26','2026-01-30 08:10:26'),(66,59,2,2,0.00,0,'2026-01-30 08:11:55','2026-01-30 08:11:55'),(67,60,2,2,0.00,0,'2026-01-30 08:12:37','2026-01-30 08:12:37'),(68,61,1,3,0.00,0,'2026-01-30 08:13:23','2026-01-30 08:13:23'),(69,62,6,2,0.00,0,'2026-01-30 08:14:03','2026-01-30 08:14:03'),(70,63,2,2,0.00,0,'2026-01-30 08:14:51','2026-01-30 08:14:51'),(71,64,2,2,0.00,0,'2026-01-30 08:16:43','2026-01-30 08:16:43'),(72,64,1,3,0.00,0,'2026-01-30 08:16:43','2026-01-30 08:16:43'),(73,65,2,2,0.00,0,'2026-01-30 08:17:58','2026-01-30 08:17:58'),(74,66,1,3,0.00,0,'2026-01-30 08:18:40','2026-01-30 08:18:40'),(75,67,10,2,0.00,0,'2026-01-30 08:20:10','2026-01-30 08:20:10'),(76,67,1,3,0.00,0,'2026-01-30 08:20:10','2026-01-30 08:20:10');
/*!40000 ALTER TABLE `buy_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-c525a5357e97fef8d3db25841c86da1a','i:1;',1769483461),('laravel-cache-c525a5357e97fef8d3db25841c86da1a:timer','i:1769483461;',1769483461),('mmt-cache-c525a5357e97fef8d3db25841c86da1a','i:1;',1769745128),('mmt-cache-c525a5357e97fef8d3db25841c86da1a:timer','i:1769745128;',1769745128);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'ပြည့်ဝစေ','Laudantium optio nesciunt voluptates possimus distinctio non eum impedit.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(2,'နောင်ရိုး','Quas non nesciunt et impedit est dolor doloremque.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(3,'ကိုကျော်ဝေ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(4,'ကောင်းမြတ်သာ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(5,'နေလ','Soluta incidunt ut dolore sequi quaerat autem officiis.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(6,'ကျော်မြင့်','Dolor eligendi error autem ut sequi hic nisi.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(7,'ဝင်းဇော်','Ut qui accusantium libero ea dolores.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(8,'ကြည်နိုင်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(9,'ရွှေအိမ်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(10,'အိမ်အော်ဒါ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(11,'အဘအောင်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(12,'လက်ငင်း','Dolorem aut enim quos aut reprehenderit.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(13,'မျိုးမြန်မာ',NULL,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(14,'မိုးမြင့်ကြယ်',NULL,'2026-01-26 07:05:29','2026-01-26 07:05:29');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dealers_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers`
--

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
INSERT INTO `dealers` VALUES (1,'မျိုးမြန်မာ','Itaque a nihil eos itaque commodi aut perspiciatis.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(2,'မိုးမြင့်ကြယ်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(3,'စံတင်','Quidem qui voluptate quo ullam non esse cumque.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(4,'ဦးပြား','Ut quo earum voluptatem qui voluptas inventore deserunt odit.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(5,'စိန်ရွှေမိုး',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(6,'ရွာမ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(7,'အဘအောင်','Aut ipsam error maiores et vel omnis earum consectetur.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(8,'မလိခ','Repellat et distinctio neque quasi quaerat nihil.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(9,'ငွေအိမ်စံ','Et eos provident sequi sit porro officiis omnis.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(10,'ကိုပြား',NULL,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(11,'ရာသက်ပန်',NULL,'2026-01-30 07:57:50','2026-01-30 07:57:50');
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'အုတ်','Asperiores pariatur ut labore magnam aut sed vero dolor.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(2,'သဲ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(3,'ကျောက်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(4,'ဘိလပ်မြေ','Omnis voluptas doloremque ratione voluptas.','2026-01-26 02:24:00','2026-01-26 02:24:00');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_08_14_170933_add_two_factor_columns_to_users_table',1),(5,'2026_01_04_100846_create_customers_table',1),(6,'2026_01_04_101025_create_dealers_table',1),(7,'2026_01_04_101118_create_items_table',1),(8,'2026_01_04_101229_create_orders_table',1),(9,'2026_01_06_080142_create_buy_infos_table',1),(10,'2026_01_06_080147_create_sell_infos_table',1),(11,'2026_01_19_055421_create_expenses_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_rent_cost` int NOT NULL,
  `extra_cost` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '1',
  `grand_total` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-01-26',9,'အောင်မင်္ဂလာကျောင်း',25000,0,1,169000,NULL,'2026-01-26 06:19:01','2026-01-26 21:00:27'),(2,'2026-01-26',1,'ဂန္ဓမာလမ်း',25000,0,1,51000,NULL,'2026-01-26 06:23:25','2026-01-26 21:00:50'),(3,'2026-01-26',1,'ဂန္ဓမာလမ်း',25000,0,1,169000,NULL,'2026-01-26 06:27:34','2026-01-26 21:01:09'),(4,'2026-01-26',13,'ပေ ၄၀',20000,0,1,20000,NULL,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,'2026-01-26',14,'သဇင်လမ်း',24000,0,1,24000,NULL,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,'2026-01-26',13,'မာလာမြိုင်',20000,0,1,20000,NULL,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,'2026-01-26',1,'ဆိုင်',25000,0,1,57500,NULL,'2026-01-26 07:11:52','2026-01-26 07:11:52'),(8,'2026-01-26',13,'သီရိ၄လမိး',18000,0,1,18000,NULL,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,'2026-01-26',14,'တေဇ၀ဂ္ဂီ',26000,0,1,26000,NULL,'2026-01-26 07:15:56','2026-01-26 07:21:20'),(10,'2026-01-26',14,'8 မိုင်',28000,0,1,28000,NULL,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,'2026-01-26',9,'ဗားကရာ',25000,0,1,25000,NULL,'2026-01-26 07:28:44','2026-01-26 21:00:00'),(12,'2026-01-01',13,'ကုန်းမြင့်ရိပ်သာ',27000,0,4,108000,NULL,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,'2026-01-01',1,'မြေနီကုန်း',30000,0,1,60000,NULL,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,'2026-01-01',1,'ဆိုင်ပုံ',25000,0,1,80250,NULL,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,'2026-01-01',3,'ပဏ္ဏိတလမ်း',20000,0,1,207500,NULL,'2026-01-26 21:14:35','2026-01-26 21:15:46'),(16,'2026-01-01',3,'ပဏ္ဏိတလမ်း',20000,0,1,56000,NULL,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(17,'2026-01-01',1,'မြေနီကုန်း',30000,0,1,60000,NULL,'2026-01-26 21:19:26','2026-01-26 21:19:26'),(18,'2026-01-02',1,'မြေနီကုန်း',30000,0,2,120000,NULL,'2026-01-29 21:27:26','2026-01-29 21:27:26'),(19,'2026-01-02',1,'မြေနီကုန်း',30000,0,1,186250,NULL,'2026-01-29 21:28:32','2026-01-29 21:28:32'),(20,'2026-01-02',13,'မာလာမြိုင်',20000,0,1,20000,NULL,'2026-01-29 21:29:55','2026-01-29 21:29:55'),(21,'2026-01-02',1,'ဆီဆုံလမ်း',28000,0,1,52000,NULL,'2026-01-29 21:31:18','2026-01-30 07:29:37'),(22,'2026-01-02',13,'မင်္ဂလာသီရိလမ်း',27000,0,1,27000,NULL,'2026-01-29 21:32:08','2026-01-29 21:34:15'),(23,'2026-01-02',13,'မင်္ဂလာသီရိလမ်း',27000,0,1,27000,NULL,'2026-01-29 21:33:53','2026-01-29 21:33:53'),(25,'2026-01-02',4,'ကောင်းမြတ်သာ',30000,0,1,60000,NULL,'2026-01-29 21:41:11','2026-01-30 07:28:35'),(26,'2026-01-03',1,'မြေနီကုန်း',30000,0,1,60000,NULL,'2026-01-29 21:42:24','2026-01-29 21:42:24'),(27,'2026-01-03',13,'သာသနာ့ရက္ခိတာကျောင်း',23000,0,1,23000,NULL,'2026-01-29 21:44:19','2026-01-29 21:44:19'),(28,'2026-01-03',1,'မြေနီကုန်း',30000,0,1,60000,NULL,'2026-01-29 21:50:37','2026-01-29 21:50:37'),(31,'2026-01-03',13,'အေးရိပ်မွန်',18000,0,1,18000,NULL,'2026-01-29 22:34:43','2026-01-29 22:35:13'),(32,'2026-01-03',3,'မယ်ဇီကုန်း',20000,0,2,415000,NULL,'2026-01-29 22:37:44','2026-01-30 07:35:06'),(33,'2026-01-03',3,'မယ်ဇီကုန်း',20000,0,1,56000,NULL,'2026-01-29 22:40:53','2026-01-30 07:36:56'),(34,'2026-01-03',1,'မြေနီကုန်း',30000,0,1,60000,NULL,'2026-01-29 22:42:17','2026-01-30 07:38:54'),(35,'2026-01-03',1,'ဆိုင်ပုံ',25000,0,1,105500,NULL,'2026-01-29 22:44:27','2026-01-29 22:44:27'),(36,'2026-01-03',1,'အလယ်တောရ',30000,0,1,42000,NULL,'2026-01-29 22:45:03','2026-01-30 07:40:36'),(37,'2026-01-03',1,'ဆီဆုံလမ်း',28000,0,1,102500,NULL,'2026-01-29 22:46:43','2026-01-29 22:47:17'),(39,'2026-01-05',13,'မာလာမြိုင်၃လမ်း',20000,0,7,140000,NULL,'2026-01-30 07:03:27','2026-01-30 07:03:27'),(40,'2026-01-05',13,'မင်္ဂလာသီရိလမ်း',27000,0,1,27000,NULL,'2026-01-30 07:09:20','2026-01-30 07:09:20'),(41,'2026-01-05',13,'မင်္ဂလာသီရိကျောင်း',27000,0,2,54000,NULL,'2026-01-30 07:12:26','2026-01-30 07:12:26'),(42,'2026-01-05',1,'ပြည့်ဝစေ',25000,0,1,105500,NULL,'2026-01-30 07:19:07','2026-01-30 07:19:07'),(43,'2026-01-03',13,'ဘုရားလမ်း',20000,0,3,60000,NULL,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(44,'2026-01-05',13,'ရွှေညောင်ပင်',18000,0,1,18000,NULL,'2026-01-30 07:50:17','2026-01-30 07:50:17'),(45,'2026-01-05',13,'မင်္ဂလာသီရိကျောင်း',20000,0,1,20000,NULL,'2026-01-30 07:52:46','2026-01-30 07:52:46'),(46,'2026-01-05',13,'ပန်းတနော်',23000,0,2,46000,NULL,'2026-01-30 07:53:55','2026-01-30 07:53:55'),(47,'2026-01-05',5,'ရိုးခြံရိပ်သာ',0,0,1,0,NULL,'2026-01-30 07:55:18','2026-01-30 07:56:03'),(48,'2026-01-05',13,'သမိုင်း ၁၁လမ်း',22000,0,1,22000,NULL,'2026-01-30 07:57:50','2026-01-30 07:57:50'),(49,'2026-01-06',13,'သမိုင်း ၁၂လမ်း',22000,0,3,66000,NULL,'2026-01-30 07:59:38','2026-01-30 07:59:38'),(50,'2026-01-06',13,'မာလာမြိုင် ၇ လမ်း',20000,0,3,60000,NULL,'2026-01-30 08:00:59','2026-01-30 08:00:59'),(51,'2026-01-06',13,'သာယာကုန်း',27000,0,1,27000,NULL,'2026-01-30 08:01:50','2026-01-30 08:01:50'),(52,'2026-01-06',13,'သာယာကုန်း',20000,0,1,20000,NULL,'2026-01-30 08:02:49','2026-01-30 08:02:49'),(53,'2026-01-06',13,'မင်္ဂလာသီရိလမ်း',20000,0,1,20000,NULL,'2026-01-30 08:04:06','2026-01-30 08:04:06'),(54,'2026-01-06',13,'ပန်းတနော်',25000,0,4,100000,NULL,'2026-01-30 08:05:07','2026-01-30 08:06:57'),(55,'2026-01-06',13,'အောင်မြေသာစည်',20000,0,1,20000,NULL,'2026-01-30 08:06:23','2026-01-30 08:08:25'),(56,'2026-01-06',3,'ပဏ္ဏိတလမ်း',20000,0,1,207500,NULL,'2026-01-30 08:08:05','2026-01-30 08:08:05'),(57,'2026-01-06',13,'ဘာဝနာလမ်း',25000,0,1,25000,NULL,'2026-01-30 08:09:12','2026-01-30 08:09:12'),(58,'2026-01-07',13,'ပန်းတနော်',25000,0,2,50000,NULL,'2026-01-30 08:10:26','2026-01-30 08:10:26'),(59,'2026-01-07',13,'မာလာမြိုင် ၅',20000,0,11,220000,NULL,'2026-01-30 08:11:55','2026-01-30 08:11:55'),(60,'2026-01-07',13,'မာလာမြိုင် ၇',20000,0,1,20000,NULL,'2026-01-30 08:12:37','2026-01-30 08:12:37'),(61,'2026-01-07',13,'မင်္ဂလာသီရိလမ်း',27000,0,1,27000,NULL,'2026-01-30 08:13:23','2026-01-30 08:13:23'),(62,'2026-01-07',13,'မင်္ဂလာသီရိလမ်း',20000,0,1,20000,NULL,'2026-01-30 08:14:03','2026-01-30 08:14:03'),(63,'2026-01-07',13,'သမိုင်း ၁၁လမ်း',22000,0,1,22000,NULL,'2026-01-30 08:14:51','2026-01-30 08:14:51'),(64,'2026-01-07',3,'ဓါတုဗေဒလမ်း',18000,0,1,155000,NULL,'2026-01-30 08:16:43','2026-01-30 08:16:56'),(65,'2026-01-07',10,'ကျောင်းကြီးတိုက်',0,0,1,0,NULL,'2026-01-30 08:17:58','2026-01-30 08:17:58'),(66,'2026-01-07',13,'အင်းယားလမ်း',25000,0,1,25000,NULL,'2026-01-30 08:18:40','2026-01-30 08:18:40'),(67,'2026-01-07',1,'ပြည့်ဝစေ',25000,0,1,80250,NULL,'2026-01-30 08:20:10','2026-01-30 08:20:10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_infos`
--

DROP TABLE IF EXISTS `sell_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `sell_qty` decimal(15,2) DEFAULT NULL,
  `sell_price` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_infos_order_id_foreign` (`order_id`),
  KEY `sell_infos_item_id_foreign` (`item_id`),
  CONSTRAINT `sell_infos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `sell_infos_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_infos`
--

LOCK TABLES `sell_infos` WRITE;
/*!40000 ALTER TABLE `sell_infos` DISABLE KEYS */;
INSERT INTO `sell_infos` VALUES (1,1,3,0.90,160000,'2026-01-26 06:19:01','2026-01-26 06:19:01'),(2,2,2,100.00,260,'2026-01-26 06:23:25','2026-01-26 06:23:25'),(3,3,3,90.00,1600,'2026-01-26 06:27:34','2026-01-26 06:27:34'),(4,4,3,0.00,0,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,5,2,0.00,0,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,6,3,0.00,0,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,7,2,1.25,26000,'2026-01-26 07:11:52','2026-01-26 21:02:36'),(8,8,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,9,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(10,10,2,0.00,0,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,11,2,0.00,0,'2026-01-26 07:28:44','2026-01-26 07:28:44'),(12,12,2,0.00,0,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,13,2,1.25,24000,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,14,2,1.00,24000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,14,3,0.25,125000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(16,15,3,1.50,125000,'2026-01-26 21:14:35','2026-01-26 21:14:35'),(17,16,2,1.50,24000,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(18,17,2,1.25,24000,'2026-01-26 21:19:26','2026-01-26 21:19:26'),(19,18,2,1.25,24000,'2026-01-29 21:27:26','2026-01-29 21:27:26'),(20,19,3,1.25,125000,'2026-01-29 21:28:32','2026-01-29 21:28:32'),(21,20,2,0.00,0,'2026-01-29 21:29:55','2026-01-29 21:29:55'),(22,21,2,1.00,24000,'2026-01-29 21:31:18','2026-01-30 07:29:37'),(23,22,3,0.00,0,'2026-01-29 21:32:08','2026-01-29 21:32:08'),(24,23,2,0.00,0,'2026-01-29 21:33:53','2026-01-29 21:33:53'),(26,25,2,1.25,24000,'2026-01-29 21:41:11','2026-01-29 21:41:11'),(27,26,2,1.25,24000,'2026-01-29 21:42:24','2026-01-29 21:42:24'),(28,27,2,0.00,0,'2026-01-29 21:44:19','2026-01-29 21:44:19'),(29,27,3,0.00,0,'2026-01-29 21:44:19','2026-01-29 21:44:19'),(30,28,2,1.25,24000,'2026-01-29 21:50:37','2026-01-29 21:50:37'),(33,31,2,0.00,0,'2026-01-29 22:34:44','2026-01-29 22:34:44'),(34,32,3,1.50,125000,'2026-01-29 22:37:44','2026-01-29 22:37:44'),(35,33,2,1.50,24000,'2026-01-29 22:40:53','2026-01-29 22:40:53'),(36,34,2,1.25,24000,'2026-01-29 22:42:17','2026-01-29 22:42:17'),(37,35,2,0.75,24000,'2026-01-29 22:44:27','2026-01-29 22:44:27'),(38,35,3,0.50,125000,'2026-01-29 22:44:27','2026-01-29 22:44:27'),(39,36,2,0.50,24000,'2026-01-29 22:45:03','2026-01-30 07:40:36'),(40,37,2,0.50,24000,'2026-01-29 22:46:43','2026-01-29 22:46:43'),(41,37,3,0.50,125000,'2026-01-29 22:46:43','2026-01-29 22:46:43'),(43,39,2,0.00,0,'2026-01-30 07:03:27','2026-01-30 07:03:27'),(44,40,2,0.00,0,'2026-01-30 07:09:20','2026-01-30 07:09:20'),(45,41,3,0.00,0,'2026-01-30 07:12:26','2026-01-30 07:12:26'),(46,42,2,0.75,24000,'2026-01-30 07:19:07','2026-01-30 07:19:07'),(47,42,3,0.50,125000,'2026-01-30 07:19:07','2026-01-30 07:19:07'),(48,43,2,0.00,0,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(49,43,3,0.00,0,'2026-01-30 07:44:01','2026-01-30 07:44:01'),(50,44,2,0.00,0,'2026-01-30 07:50:17','2026-01-30 07:50:17'),(51,45,2,0.00,0,'2026-01-30 07:52:46','2026-01-30 07:52:46'),(52,46,2,0.00,0,'2026-01-30 07:53:55','2026-01-30 07:53:55'),(53,47,2,0.00,0,'2026-01-30 07:55:18','2026-01-30 07:55:18'),(54,48,2,0.00,0,'2026-01-30 07:57:50','2026-01-30 07:57:50'),(55,49,3,0.00,0,'2026-01-30 07:59:38','2026-01-30 07:59:38'),(56,50,3,0.00,0,'2026-01-30 08:00:59','2026-01-30 08:00:59'),(57,51,3,0.00,0,'2026-01-30 08:01:50','2026-01-30 08:01:50'),(58,52,2,0.00,0,'2026-01-30 08:02:49','2026-01-30 08:02:49'),(59,53,3,0.00,0,'2026-01-30 08:04:06','2026-01-30 08:04:06'),(60,54,2,0.00,0,'2026-01-30 08:05:07','2026-01-30 08:05:07'),(61,55,2,0.00,0,'2026-01-30 08:06:23','2026-01-30 08:06:23'),(62,55,3,0.00,0,'2026-01-30 08:06:23','2026-01-30 08:06:23'),(63,56,3,1.50,125000,'2026-01-30 08:08:05','2026-01-30 08:08:05'),(64,57,2,0.00,0,'2026-01-30 08:09:12','2026-01-30 08:09:12'),(65,58,2,0.00,0,'2026-01-30 08:10:26','2026-01-30 08:10:26'),(66,59,2,0.00,0,'2026-01-30 08:11:55','2026-01-30 08:11:55'),(67,60,2,0.00,0,'2026-01-30 08:12:37','2026-01-30 08:12:37'),(68,61,3,0.00,0,'2026-01-30 08:13:23','2026-01-30 08:13:23'),(69,62,2,0.00,0,'2026-01-30 08:14:03','2026-01-30 08:14:03'),(70,63,2,0.00,0,'2026-01-30 08:14:51','2026-01-30 08:14:51'),(71,64,2,0.50,24000,'2026-01-30 08:16:43','2026-01-30 08:16:43'),(72,64,3,1.00,125000,'2026-01-30 08:16:43','2026-01-30 08:16:43'),(73,65,2,0.00,0,'2026-01-30 08:17:58','2026-01-30 08:17:58'),(74,66,3,0.00,0,'2026-01-30 08:18:40','2026-01-30 08:18:40'),(75,67,2,1.00,24000,'2026-01-30 08:20:10','2026-01-30 08:20:10'),(76,67,3,0.25,125000,'2026-01-30 08:20:10','2026-01-30 08:20:10');
/*!40000 ALTER TABLE `sell_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('NHOME8WtBOOdH72Ux2CqbRGDEvrfKPpP4yg1gtUo',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmpreXNwUWdKNU84Q24wZ1BLSFBMeHBJR3NUcUFPMzRuYnN5UFliUCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMjoiaHR0cDovL21tdC5sb2NhbC9iYWNrdXAtZGF0YWJhc2UiO3M6NToicm91dGUiO3M6MTU6ImJhY2t1cC1kYXRhYmFzZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1769837372);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Thiri Win','admin@gmail.com','2026-01-26 02:23:59','$2y$12$U/ktiCZdzTYO3Eg8vO.YO.bzwuYCwYIYNg0rz0gmg4E5lYhENmeC2',NULL,'2CXMIOBZEH','2026-01-26 02:24:00','FSeXJjc3jHr9vOiHLTTwVrlcoSRyvDTzAyGM7m7bXlMqKXd8GbTmjHJmCfGd','2026-01-26 02:24:00','2026-01-26 02:24:00');
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

-- Dump completed on 2026-01-31 12:08:32
