-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mmt
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_infos`
--

LOCK TABLES `buy_infos` WRITE;
/*!40000 ALTER TABLE `buy_infos` DISABLE KEYS */;
INSERT INTO `buy_infos` VALUES (1,1,1,3,0.90,160000,'2026-01-26 06:19:01','2026-01-26 06:19:01'),(2,2,3,2,90.00,260,'2026-01-26 06:23:25','2026-01-26 06:23:25'),(3,3,1,4,80.00,1600,'2026-01-26 06:27:34','2026-01-26 06:27:34'),(4,4,1,3,0.00,0,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,5,3,2,0.00,0,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,6,1,3,0.00,0,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,7,4,2,1.00,26000,'2026-01-26 07:11:52','2026-01-26 21:02:36'),(8,8,4,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,9,1,3,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:20:22'),(10,10,2,2,0.00,0,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,11,3,2,0.00,0,'2026-01-26 07:28:44','2026-01-26 07:28:44'),(12,12,2,2,0.00,0,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,13,4,2,1.25,24000,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,14,2,2,0.50,24000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,14,1,3,0.20,125000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(16,15,1,3,1.25,125000,'2026-01-26 21:14:35','2026-01-26 21:14:35'),(17,16,3,2,0.00,0,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(18,17,3,2,0.00,0,'2026-01-26 21:19:26','2026-01-26 21:19:26');
/*!40000 ALTER TABLE `buy_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-c525a5357e97fef8d3db25841c86da1a','i:1;',1769483461),('laravel-cache-c525a5357e97fef8d3db25841c86da1a:timer','i:1769483461;',1769483461);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dealers_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers`
--

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
INSERT INTO `dealers` VALUES (1,'မျိုးမြန်မာ','Itaque a nihil eos itaque commodi aut perspiciatis.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(2,'မိုးမြင့်ကြယ်',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(3,'စံတင်','Quidem qui voluptate quo ullam non esse cumque.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(4,'ဦးပြား','Ut quo earum voluptatem qui voluptas inventore deserunt odit.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(5,'စိန်ရွှေမိုး',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(6,'ရွာမ',NULL,'2026-01-26 02:24:00','2026-01-26 02:24:00'),(7,'အဘအောင်','Aut ipsam error maiores et vel omnis earum consectetur.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(8,'မလိခ','Repellat et distinctio neque quasi quaerat nihil.','2026-01-26 02:24:00','2026-01-26 02:24:00'),(9,'ငွေအိမ်စံ','Et eos provident sequi sit porro officiis omnis.','2026-01-26 02:24:00','2026-01-26 02:24:00');
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
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
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_rent_cost` int NOT NULL,
  `grand_total` int NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-01-26',9,'အောင်မင်္ဂလာကျောင်း',25000,169000,1,NULL,'2026-01-26 06:19:01','2026-01-26 21:00:27'),(2,'2026-01-26',1,'ဂန္ဓမာလမ်း',25000,51000,1,NULL,'2026-01-26 06:23:25','2026-01-26 21:00:50'),(3,'2026-01-26',1,'ဂန္ဓမာလမ်း',25000,169000,1,NULL,'2026-01-26 06:27:34','2026-01-26 21:01:09'),(4,'2026-01-26',13,'ပေ ၄၀',20000,20000,1,NULL,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,'2026-01-26',14,'သဇင်လမ်း',24000,24000,1,NULL,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,'2026-01-26',13,'မာလာမြိုင်',20000,20000,1,NULL,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,'2026-01-26',1,'ဆိုင်',25000,57500,1,NULL,'2026-01-26 07:11:52','2026-01-26 07:11:52'),(8,'2026-01-26',13,'သီရိ၄လမိး',18000,18000,1,NULL,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,'2026-01-26',14,'တေဇ၀ဂ္ဂီ',26000,26000,1,NULL,'2026-01-26 07:15:56','2026-01-26 07:21:20'),(10,'2026-01-26',14,'8 မိုင်',28000,28000,1,NULL,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,'2026-01-26',9,'ဗားကရာ',25000,25000,1,NULL,'2026-01-26 07:28:44','2026-01-26 21:00:00'),(12,'2026-01-01',13,'ကုန်းမြင့်ရိပ်သာ',27000,108000,4,NULL,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,'2026-01-01',1,'မြေနီကုန်း',30000,60000,1,NULL,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,'2026-01-01',1,'ဆိုင်ပုံ',25000,80250,1,NULL,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,'2026-01-01',3,'ပဏ္ဏိတလမ်း',20000,207500,1,NULL,'2026-01-26 21:14:35','2026-01-26 21:15:46'),(16,'2026-01-01',3,'ပဏ္ဏိတလမ်း',20000,56000,1,NULL,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(17,'2026-01-01',1,'မြေနီကုန်း',30000,60000,1,NULL,'2026-01-26 21:19:26','2026-01-26 21:19:26');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_infos`
--

LOCK TABLES `sell_infos` WRITE;
/*!40000 ALTER TABLE `sell_infos` DISABLE KEYS */;
INSERT INTO `sell_infos` VALUES (1,1,3,0.90,160000,'2026-01-26 06:19:01','2026-01-26 06:19:01'),(2,2,2,100.00,260,'2026-01-26 06:23:25','2026-01-26 06:23:25'),(3,3,3,90.00,1600,'2026-01-26 06:27:34','2026-01-26 06:27:34'),(4,4,3,0.00,0,'2026-01-26 06:52:21','2026-01-26 06:52:21'),(5,5,2,0.00,0,'2026-01-26 07:05:29','2026-01-26 07:06:19'),(6,6,3,0.00,0,'2026-01-26 07:09:33','2026-01-26 07:09:33'),(7,7,2,1.25,26000,'2026-01-26 07:11:52','2026-01-26 21:02:36'),(8,8,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(9,9,2,0.00,0,'2026-01-26 07:15:56','2026-01-26 07:15:56'),(10,10,2,0.00,0,'2026-01-26 07:23:43','2026-01-26 07:23:43'),(11,11,2,0.00,0,'2026-01-26 07:28:44','2026-01-26 07:28:44'),(12,12,2,0.00,0,'2026-01-26 21:06:57','2026-01-26 21:06:57'),(13,13,2,1.25,24000,'2026-01-26 21:08:19','2026-01-26 21:20:42'),(14,14,2,1.00,24000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(15,14,3,0.25,125000,'2026-01-26 21:12:01','2026-01-26 21:12:01'),(16,15,3,1.50,125000,'2026-01-26 21:14:35','2026-01-26 21:14:35'),(17,16,2,1.50,24000,'2026-01-26 21:17:38','2026-01-26 21:17:38'),(18,17,2,1.25,24000,'2026-01-26 21:19:26','2026-01-26 21:19:26');
/*!40000 ALTER TABLE `sell_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `sessions` VALUES ('QaAAu0JMzWOr3YypbvS2F3nKtIlkUBvehZZEnhWD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmlQcVBxQjJ6MDlZdTc2cEI3UEhYMktnd01PbEFwa3pkNzV4TlVLTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTU6Imh0dHA6Ly9tbXQudGVzdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769483383),('Qxt7XcjiNSwrl110mXBkzqxENZms6ki0idqjhplX',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVl4SHNUSHBuZE5PMWthbU44T2oycFRjeUNZUnpyUTRCU3NHV1N2MyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMToiaHR0cDovL21tdC50ZXN0L2JhY2t1cC1kYXRhYmFzZSI7czo1OiJyb3V0ZSI7czoxNToiYmFja3VwLWRhdGFiYXNlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769488408),('TXeorDzwKB4AxsYJy2C9gCrmXLgMjsTa3LFu0s3D',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoia2xjTHhyZVpwUkxISWRpblNTRGw0TkdtRUk3UjdOcmIzcGZTand6OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly9tbXQudGVzdC9vcmRlcnMvcHJpbnQ/Y3VzdG9tZXI9MSZkZWFsZXI9JmZyb209MjAyNi0wMS0wMSZ0bz0yMDI2LTAxLTMxIjtzOjU6InJvdXRlIjtzOjEyOiJvcmRlcnMucHJpbnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1769483509);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- Dump completed on 2026-01-27 11:33:47
