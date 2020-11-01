CREATE DATABASE  IF NOT EXISTS `db_datj` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_datj`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: db_datj
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'Nhân viên dịch vụ'),(1,'Nhân viên kho'),(3,'Nhân viên nhân sự'),(2,'Nhân viên thống kê đơn');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,28),(5,1,29),(6,1,30),(7,1,31),(8,1,32),(9,1,33),(10,1,34),(11,1,35),(12,1,36),(13,1,37),(14,1,38),(15,1,39),(16,1,40),(17,1,41),(18,1,42),(19,1,43),(20,1,44),(21,1,45),(22,1,46),(23,1,47),(24,1,48),(25,1,49),(26,1,50),(27,1,51),(28,1,52),(65,1,89),(66,1,90),(67,1,91),(68,1,92),(48,2,60),(45,2,70),(46,2,72),(53,3,9),(54,3,10),(55,3,11),(56,3,12),(50,3,13),(51,3,14),(52,3,15),(49,3,16),(61,4,53),(62,4,54),(63,4,55),(64,4,56),(57,4,73),(58,4,74),(59,4,75),(60,4,76);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add discount',7,'add_discount'),(26,'Can change discount',7,'change_discount'),(27,'Can delete discount',7,'delete_discount'),(28,'Can view discount',7,'view_discount'),(29,'Can add product attribute',8,'add_productattribute'),(30,'Can change product attribute',8,'change_productattribute'),(31,'Can delete product attribute',8,'delete_productattribute'),(32,'Can view product attribute',8,'view_productattribute'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add product attribute value',10,'add_productattributevalue'),(38,'Can change product attribute value',10,'change_productattributevalue'),(39,'Can delete product attribute value',10,'delete_productattributevalue'),(40,'Can view product attribute value',10,'view_productattributevalue'),(41,'Can add manufacturers',11,'add_manufacturers'),(42,'Can change manufacturers',11,'change_manufacturers'),(43,'Can delete manufacturers',11,'delete_manufacturers'),(44,'Can view manufacturers',11,'view_manufacturers'),(45,'Can add discount item',12,'add_discountitem'),(46,'Can change discount item',12,'change_discountitem'),(47,'Can delete discount item',12,'delete_discountitem'),(48,'Can view discount item',12,'view_discountitem'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add payment service',14,'add_paymentservice'),(54,'Can change payment service',14,'change_paymentservice'),(55,'Can delete payment service',14,'delete_paymentservice'),(56,'Can view payment service',14,'view_paymentservice'),(57,'Can add order detail',15,'add_orderdetail'),(58,'Can change order detail',15,'change_orderdetail'),(59,'Can delete order detail',15,'delete_orderdetail'),(60,'Can view order detail',15,'view_orderdetail'),(61,'Can add cart item',16,'add_cartitem'),(62,'Can change cart item',16,'change_cartitem'),(63,'Can delete cart item',16,'delete_cartitem'),(64,'Can view cart item',16,'view_cartitem'),(65,'Can add cart',17,'add_cart'),(66,'Can change cart',17,'change_cart'),(67,'Can delete cart',17,'delete_cart'),(68,'Can view cart',17,'view_cart'),(69,'Can add order',18,'add_order'),(70,'Can change order',18,'change_order'),(71,'Can delete order',18,'delete_order'),(72,'Can view order',18,'view_order'),(73,'Can add ship service',19,'add_shipservice'),(74,'Can change ship service',19,'change_shipservice'),(75,'Can delete ship service',19,'delete_shipservice'),(76,'Can view ship service',19,'view_shipservice'),(77,'Can add customer',20,'add_customer'),(78,'Can change customer',20,'change_customer'),(79,'Can delete customer',20,'delete_customer'),(80,'Can view customer',20,'view_customer'),(81,'Can add tel number',21,'add_telnumber'),(82,'Can change tel number',21,'change_telnumber'),(83,'Can delete tel number',21,'delete_telnumber'),(84,'Can view tel number',21,'view_telnumber'),(85,'Can add ship address',22,'add_shipaddress'),(86,'Can change ship address',22,'change_shipaddress'),(87,'Can delete ship address',22,'delete_shipaddress'),(88,'Can view ship address',22,'view_shipaddress'),(89,'Can add manufacturer',11,'add_manufacturer'),(90,'Can change manufacturer',11,'change_manufacturer'),(91,'Can delete manufacturer',11,'delete_manufacturer'),(92,'Can view manufacturer',11,'view_manufacturer'),(93,'Can add Token',23,'add_token'),(94,'Can change Token',23,'change_token'),(95,'Can delete Token',23,'delete_token'),(96,'Can view Token',23,'view_token'),(97,'Can add token',24,'add_tokenproxy'),(98,'Can change token',24,'change_tokenproxy'),(99,'Can delete token',24,'delete_tokenproxy'),(100,'Can view token',24,'view_tokenproxy'),(101,'Can add token',25,'add_token'),(102,'Can change token',25,'change_token'),(103,'Can delete token',25,'delete_token'),(104,'Can view token',25,'view_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$9ONlHM8W4Fjv$hmqQYZEWs1Gll9Nw/jX+6Yg/GNSma3LCDNI2QFOx6hU=','2020-11-01 16:23:15.391317',0,'admin','','','datzach31@gmail.com',1,1,'2020-10-10 17:32:59.000000'),(3,'pbkdf2_sha256$216000$ymfHhATj2snX$AAxmrGt09/iI1ApsBKdsd6Pc3iclO6M8cjY8y3COAeY=','2020-11-01 16:23:03.941013',0,'kho01','','','',1,1,'2020-11-01 16:22:24.000000'),(4,'pbkdf2_sha256$216000$iZcNSNMxFWOf$NRYu6ZAdKmciF1CW4amotlcqFaMEMrZhrbtNQxuuQsc=','2020-11-01 16:24:57.888395',0,'vu01','','','',1,1,'2020-11-01 16:23:46.000000'),(5,'pbkdf2_sha256$216000$b4xTDoK2d6zt$oymPzFI3lvFfJ08ce6DS5pYulX2ryu5OiWB6Utt2UWI=','2020-11-01 16:24:48.510736',0,'su01','','','',1,1,'2020-11-01 16:24:06.000000'),(6,'pbkdf2_sha256$216000$lfIVXQBic2re$ZJiR6G18HyvJF3OnnNT34aD4yjBxQpjzvzqXjq0mZI8=','2020-11-01 16:25:07.566941',0,'don01','','','',1,1,'2020-11-01 16:24:28.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,1),(4,1,2),(5,1,3),(6,1,4),(7,3,1),(8,4,4),(9,5,3),(10,6,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('26d5035e32d525ce261cbbbb6725cf5f407941d3','2020-10-21 15:17:39.622950',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customer`
--

DROP TABLE IF EXISTS `customer_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_customer_username_0781c93f_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customer`
--

LOCK TABLES `customer_customer` WRITE;
/*!40000 ALTER TABLE `customer_customer` DISABLE KEYS */;
INSERT INTO `customer_customer` VALUES (3,'nbdat22','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Bá Đạt','dat123@gmail.com','MALE','1996-02-29'),(4,'dqdong26','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Quý Đông','null','MALE','1999-04-25'),(5,'tnanh23','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Ánh','null','FEMALE','1999-09-25'),(6,'vvnminh90','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Minh','null','FEMALE','1999-01-05'),(7,'dmkhoa60','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Khoa','khoa123@gmail.com','MALE','1999-09-24'),(8,'testAcc','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','Testing','null','MALE','1999-09-24');
/*!40000 ALTER TABLE `customer_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_shipaddress`
--

DROP TABLE IF EXISTS `customer_shipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_shipaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apartment_number` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_shipaddress_customer_id_6580374c_fk_customer_` (`customer_id`),
  CONSTRAINT `customer_shipaddress_customer_id_6580374c_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shipaddress`
--

LOCK TABLES `customer_shipaddress` WRITE;
/*!40000 ALTER TABLE `customer_shipaddress` DISABLE KEYS */;
INSERT INTO `customer_shipaddress` VALUES (1,'32','Đường số 3','Tân Thới Hiệp','12','Hồ Chí Minh','null',4),(3,'1092','Nguyễn Văn Quá','Đông Hưng Thuận','12','Hồ Chí Minh','test',3),(5,'21','Nguyễn Kiệm','Phường 09','Phú Nhuận','Hồ Chí Minh','null',3);
/*!40000 ALTER TABLE `customer_shipaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_telnumber`
--

DROP TABLE IF EXISTS `customer_telnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_telnumber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tel_number` varchar(20) NOT NULL,
  `number_type` varchar(30) NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_telnumber_customer_id_a0e7a355_fk_customer_customer_id` (`customer_id`),
  CONSTRAINT `customer_telnumber_customer_id_a0e7a355_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_telnumber`
--

LOCK TABLES `customer_telnumber` WRITE;
/*!40000 ALTER TABLE `customer_telnumber` DISABLE KEYS */;
INSERT INTO `customer_telnumber` VALUES (2,'0987255114','null',4),(3,'0987255114','Di động',5),(4,'0327255114','Di động',6),(5,'0927221474','Di động',7),(6,'0968122547','Di động',3),(7,'092147474','Di động',8);
/*!40000 ALTER TABLE `customer_telnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_token`
--

DROP TABLE IF EXISTS `customer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `customer_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_token_key_0a7214b9_uniq` (`key`),
  KEY `customer_token_customer_id_d4a7e6c4_fk_customer_customer_id` (`customer_id`),
  CONSTRAINT `customer_token_customer_id_d4a7e6c4_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_token`
--

LOCK TABLES `customer_token` WRITE;
/*!40000 ALTER TABLE `customer_token` DISABLE KEYS */;
INSERT INTO `customer_token` VALUES (1,'683ba443df9d47286eb45e7474418e78b8b8322911531fa70e691df85baee64d',3,'2020-10-30 11:03:53.136612'),(2,'a3d3dc5292981d33ca61651aa72b32793347a54220d3741f7569572df5bdf6e2',4,'2020-10-28 08:55:59.203436'),(5,'5c116d3415b33df503879f428b78421472faade892958758a44666386a11dcbe',7,'2020-10-28 08:57:41.311139');
/*!40000 ALTER TABLE `customer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-10-13 03:53:33.553438','1','Nhân viên kho',1,'[{\"added\": {}}]',3,1),(2,'2020-10-13 04:02:30.187133','2','nbdat22',1,'[{\"added\": {}}]',4,1),(3,'2020-10-13 04:03:19.937908','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(4,'2020-10-13 04:03:29.838790','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(5,'2020-10-13 04:06:20.596904','1','Nhân viên kho',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(6,'2020-10-13 04:09:26.984838','2','Nhân viên thống kê đơn',1,'[{\"added\": {}}]',3,1),(7,'2020-10-13 14:15:17.957408','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(8,'2020-10-13 14:20:07.077018','3','Nhân viên nhân sự',1,'[{\"added\": {}}]',3,1),(9,'2020-10-13 14:20:35.075940','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\", \"Groups\"]}}]',4,1),(10,'2020-10-13 14:21:35.869819','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(11,'2020-10-13 14:21:58.699707','3','Nhân viên nhân sự',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(12,'2020-10-13 14:22:12.149405','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(13,'2020-10-13 14:35:15.504992','1','Laptop',1,'[{\"added\": {}}]',9,1),(14,'2020-10-13 14:35:33.188341','2','Màn hình',1,'[{\"added\": {}}]',9,1),(15,'2020-10-13 14:35:42.687858','3','Bàn phím',1,'[{\"added\": {}}]',9,1),(16,'2020-10-13 14:35:47.066912','4','Chuột',1,'[{\"added\": {}}]',9,1),(17,'2020-10-13 14:35:57.468946','5','Tai nghe',1,'[{\"added\": {}}]',9,1),(18,'2020-10-13 14:36:38.918509','1','Asus',1,'[{\"added\": {}}]',11,1),(19,'2020-10-13 14:36:52.241434','2','Dell',1,'[{\"added\": {}}]',11,1),(20,'2020-10-13 14:36:56.128654','3','HP',1,'[{\"added\": {}}]',11,1),(21,'2020-10-13 14:56:48.410413','1','Thông số màn hình',1,'[{\"added\": {}}]',8,1),(22,'2020-10-13 14:57:14.973785','2','CPU',1,'[{\"added\": {}}]',8,1),(23,'2020-10-13 14:57:44.767062','3','Ram',1,'[{\"added\": {}}]',8,1),(24,'2020-10-13 14:58:00.599270','4','Ổ cứng',1,'[{\"added\": {}}]',8,1),(25,'2020-10-13 14:58:20.945735','5','Pin',1,'[{\"added\": {}}]',8,1),(26,'2020-10-13 14:58:53.461498','6','Ảnh',1,'[{\"added\": {}}]',8,1),(27,'2020-10-13 15:00:54.873055','1','ROG Zephyrus M GU502GU AZ090T',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS, 100% sRGB, 240Hz, 3ms, 300nits, Pantone\\u00ae Validated, NanoEdge\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7-9750H 2.6GHz up to 4.5GHz 12MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16GB DDR4 2666MHz Onboard (1x SO-DIMM socket, up to 32GB SDRAM)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"512GB SSD PCIE G3X4 (Support RAID 0) (2 slots)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 Cell 76WHr\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/og-zephyrus-m-laptop_gaming_asus_rog_zephyrus_s_gu502gu_az089t-black-2_3cea5ec698d14abe944331a246bcac4e.jpg\"}}]',13,1),(28,'2020-10-13 15:04:02.845780','2','Asus ROG Strix SCAR 15 G532L VAZ044T',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7-10875H 2.3GHz up to 5.1GHz 16MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1TB SSD PCIE G3X4 (3 slot)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS Non-Glare, NanoEdge, 100% sRGB, 300nits, 240Hz/3ms\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 Cell 66WHrs\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/r-15-g532l-vaz044t-i7-10875h_2_30905bbaa46845a2a0acca89e98e4eb9_grande_44248586cdba41eb8082d31af6051093.jpg\"}}]',13,1),(29,'2020-10-13 15:04:49.702540','1','Asus ROG Zephyrus M GU502GU AZ090T',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',13,1),(30,'2020-10-13 15:06:36.527353','3','Dell G3 Inspiron 3590 N5I5517W',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i5-9300H 2.4GHz up to 4.1GHz 8MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"2 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"256GB SSD M.2 PCIE\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS, Anti-Glarec\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3 Cell 56WHr\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/ll-g3-inspiron-3590-n5i5517w_1_0c916cb24b5e4f328e249eb350768f22_master_3aa6f65982af408b913ab1f85f0f3b40.jpg\"}}]',13,1),(31,'2020-10-13 15:09:01.273002','4','Dell Inspiron G5 5590 N5590 4F4Y41',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7 9750Hc\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7 9750H\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"256GB SSD M.2 NVMe / 1TB HDD 5400RPM\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" IPS (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 cell 60 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"lh3.googleusercontent.com/LrhiDvauO8bqfTdGPoZ6uCIPtOmUCmpkzQ81ZeEFcXHklSDlNuXrbEy2WRAQ-V-c139mkJRD4l6gSGBQBFU=w1000-rw\"}}]',13,1),(32,'2020-10-13 15:11:48.604497','5','HP ENVY 13-aq1057TX',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"HP ENVY 13-aq1057TX\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 8GB Onboard DDR4 2400MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"512GB SSD M.2 NVMe\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"13.3\\\" IPS (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 cell 53 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/Mrj88XkDCITkh1iUfEE9kgALjHsvESvU0Irje4tAtzCiEYiMwT_RhpHpD3m1-3AR_s04sZcKbGAD6ae2Xydn=w1000-rw\"}}]',13,1),(33,'2020-10-13 15:13:52.722750','6','HP Pavilion 15-cs3008TU',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"HP Pavilion 15-cs3008TU\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3 cell 41 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/gObfRF8xddJDDREli44AS77pfc9-DsYpdICgNj4IecqNDIlhv2uhHcBVdXQAKSZiKwAD6LzOju6NsmGF_w=w1000-rw\"}}]',13,1),(34,'2020-10-13 16:18:26.040851','6','msi',3,'',9,1),(35,'2020-10-25 13:32:03.051091','1','TEST01',1,'[{\"added\": {}}]',7,1),(36,'2020-10-25 13:32:33.509558','1','DiscountItem object (1)',1,'[{\"added\": {}}]',12,1),(37,'2020-10-25 13:32:47.504137','2','DiscountItem object (2)',1,'[{\"added\": {}}]',12,1),(38,'2020-10-25 13:40:45.299036','1','TEST01',2,'[{\"added\": {\"name\": \"discount item\", \"object\": \"DiscountItem object (3)\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"DiscountItem object (4)\"}}, {\"deleted\": {\"name\": \"discount item\", \"object\": \"DiscountItem object (None)\"}}, {\"deleted\": {\"name\": \"discount item\", \"object\": \"DiscountItem object (None)\"}}]',7,1),(39,'2020-10-25 13:46:39.414142','4','Nhân viên dịch vụ',1,'[{\"added\": {}}]',3,1),(40,'2020-10-25 13:46:48.767933','1','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(41,'2020-10-25 13:47:57.521510','1','Viettel Post',1,'[{\"added\": {}}]',19,1),(42,'2020-10-25 13:48:23.486758','2','Giao hàng tiết kiệm',1,'[{\"added\": {}}]',19,1),(43,'2020-10-25 13:48:26.648586','3','DHL',1,'[{\"added\": {}}]',19,1),(44,'2020-10-25 13:48:42.979240','4','giaohangnhanh',1,'[{\"added\": {}}]',19,1),(45,'2020-10-25 13:49:03.918417','2','giaohangtietkiem.vn',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',19,1),(46,'2020-10-25 13:49:10.081680','4','giaohangnhanh.vn',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',19,1),(47,'2020-10-25 13:49:39.477226','5','EMS',1,'[{\"added\": {}}]',19,1),(48,'2020-10-25 13:50:02.960205','1','Thanh toán khi nhận hàng',1,'[{\"added\": {}}]',14,1),(49,'2020-10-25 13:50:10.453518','2','Momo',1,'[{\"added\": {}}]',14,1),(50,'2020-10-25 13:50:19.648696','3','Credit card',1,'[{\"added\": {}}]',14,1),(51,'2020-10-25 13:52:40.877697','4','Master card',1,'[{\"added\": {}}]',14,1),(52,'2020-10-25 13:53:14.170968','5','ATM card',1,'[{\"added\": {}}]',14,1),(53,'2020-10-25 13:53:20.364596','5','ATM Card',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(54,'2020-10-25 13:53:29.598977','4','Master Card',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(55,'2020-10-25 13:53:33.795885','3','Credit Card',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(56,'2020-10-25 14:48:28.635453','1','TEST01',2,'[{\"changed\": {\"fields\": [\"Discount percent\"]}}]',7,1),(57,'2020-10-25 15:12:31.682810','1','TEST01',2,'[{\"changed\": {\"fields\": [\"On bill\"]}}]',7,1),(58,'2020-10-25 15:13:17.579089','1','TEST01',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',7,1),(59,'2020-10-25 15:13:33.413817','1','TEST01',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',7,1),(60,'2020-10-25 16:54:36.613864','2','Nhân viên thống kê đơn',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(61,'2020-10-25 16:55:11.576783','4','Order-4-nbdat22-10/25/2020, 23:35:54',2,'[{\"changed\": {\"fields\": [\"Stage\"]}}]',18,1),(62,'2020-10-28 03:17:24.418715','2','Asus ROG Strix SCAR 15 G532L VAZ044T',2,'[{\"changed\": {\"fields\": [\"Unit in order\"]}}]',13,1),(63,'2020-10-28 06:41:51.744732','2','Asus ROG Strix SCAR 15 G532L VAZ044T',2,'[{\"changed\": {\"fields\": [\"Unit in stock\", \"Unit in order\"]}}]',13,1),(64,'2020-10-28 06:41:55.739624','1','Asus ROG Zephyrus M GU502GU AZ090T',2,'[]',13,1),(65,'2020-10-28 10:12:20.034229','2','Asus11',1,'[{\"added\": {}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - Asus ROG Zephyrus M GU502GU AZ090T\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - Asus ROG Strix SCAR 15 G532L VAZ044T\"}}]',7,1),(66,'2020-10-28 10:13:01.940210','3','CEL10',1,'[{\"added\": {}}]',7,1),(67,'2020-10-28 10:13:23.157287','2','nbdat22',3,'',4,1),(68,'2020-11-01 15:12:36.446672','7','Kích thước',1,'[{\"added\": {}}]',8,1),(69,'2020-11-01 15:12:49.564427','8','Độ phân giải',1,'[{\"added\": {}}]',8,1),(70,'2020-11-01 15:13:07.398468','9','Tấm nền',1,'[{\"added\": {}}]',8,1),(71,'2020-11-01 15:13:20.847887','10','Tần số quét',1,'[{\"added\": {}}]',8,1),(72,'2020-11-01 15:18:16.208619','11','Kiểu màn hình',1,'[{\"added\": {}}]',8,1),(73,'2020-11-01 15:18:22.196977','12','Kiểu màn hình',1,'[{\"added\": {}}]',8,1),(74,'2020-11-01 15:18:39.244134','13','Cổng xuất hình',1,'[{\"added\": {}}]',8,1),(75,'2020-11-01 15:19:02.020979','14','Phụ kiện đi kèm',1,'[{\"added\": {}}]',8,1),(76,'2020-11-01 15:19:11.383911','7','Màn hình LCD ASUS 27\'\' VA27EHE',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"27\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1920 x 1080 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"IPS\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"75Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI , 1 x VGA/D-sub\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"HDMI, 1 Ngu\\u1ed3n, S\\u00e1ch h\\u01b0\\u1edbng d\\u1eabn\"}}]',13,1),(77,'2020-11-01 15:21:52.118172','8','Màn hình cong ASUS 27\'\' VG27VQ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"27\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1920 x 1080 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"VA\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"165Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh cong\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI 2.0 , 1 x DisplayPort 1.2 , 1 x DVI-D\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Adaptor, C\\u00e1p ngu\\u1ed3n, C\\u00e1p Displayport, C\\u00e1p \\u00e2m thanh 3.5\"}}]',13,1),(78,'2020-11-01 15:24:07.877786','9','Màn Hình ASUS 19.5\" VS207DF',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"19.5\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1366 x 768 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"TN\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"60Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x VGA/D-sub\"}}]',13,1),(79,'2020-11-01 15:24:26.815061','41','Màn hình phẳng',2,'[{\"changed\": {\"fields\": [\"Product attribute\"]}}]',10,1),(80,'2020-11-01 15:24:41.317703','12','Kiểu màn hình',3,'',8,1),(81,'2020-11-01 15:27:15.502855','10','Màn Hình Dell Ultrasharp 24\" U2419H',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"24\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1920 x 1080 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"IPS LED\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"60Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI 1.4 , 2 x DisplayPort 1.4\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"C\\u00e1p Displayport, C\\u00e1p USB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/h01DMBO4OTG-Uxi9kUCana8ZCIQjgAvHMxcK0ghTKTsmghwY4ZRaaSSKp2_lExi3c-ovLHA7F1SMkGfR180=w500-rw\"}}]',13,1),(82,'2020-11-01 15:28:04.764432','9','Màn Hình ASUS 19.5\" VS207DF',2,'[{\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/gt5rI3XY8gDkpfzr-XreZknTetbOZnuK77VpB8NEVEXCOYoviaNtHKsdJ1DAVLERSPFY8oTrmJ96XysH3kxo=w500-rw\"}}]',13,1),(83,'2020-11-01 15:28:24.707500','8','Màn hình cong ASUS 27\'\' VG27VQ',2,'[{\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/ZAjqnXLB8nnq53qQ9d3Pmta8V0qpFQXzDv-n5zOpUBCRyNC5B7Sv-lZh7Sk0VqZHYmXra_f6iRvJkKm7Kws=w500-rw\"}}]',13,1),(84,'2020-11-01 15:28:42.854884','7','Màn hình LCD ASUS 27\'\' VA27EHE',2,'[{\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/ooQ1FV3mlk_l02CE0tuPItmk3CWlmrcC4U39bS4bybykujxohgnxFEv95jC3sRQKWgoqU4JPkrRJ5uF3Vw=w500-rw\"}}]',13,1),(85,'2020-11-01 15:31:17.436805','11','Màn hình LCD Dell 32\" U3219Q',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"31.5\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3840 x 2160 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"IPS LED\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"60Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI , 1 x DisplayPort\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"C\\u00e1p ngu\\u1ed3n, c\\u00e1p Displayport\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/Vw-8mDbJWCfHj--9v5hcNig2_6vFpJq6M8FJyqrvQ-RzWHBeRuWTxmfSSTn978GqerTVT7MQepR8et2NCcI=w500-rw\"}}]',13,1),(86,'2020-11-01 15:32:24.265730','12','Màn hình Dell 27\" U2720Q',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"27\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3840 x 2160 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"IPS LED\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"60Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI , 1 x DisplayPort\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"C\\u00e1p ngu\\u1ed3n, c\\u00e1p USB-C, c\\u00e1p Displayport\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/hzH4kjJabYPNg2A1cNF8TycIaww_CcRbrt264LxdEI-azWmBhn0g9DB9IfPH2j0f7SKWoqDJZdAOHxjK6FV_=w500-rw\"}}]',13,1),(87,'2020-11-01 15:34:48.778973','13','Màn Hình HP Pavilion 27x WTY_3WL53AA',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"27\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1920 x 1080 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"TN LED\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"144Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI , 1 x DisplayPort\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/kF_8OmBeUpm55ZbhbHU3i8T6YAXXyVx_Yc57IqcliGu7XfG1THg-RJBLksiWwYKaCh9znjudyH4uOVaZePM=w500-rw\"}}]',13,1),(88,'2020-11-01 15:39:35.005997','14','Màn hình HP 27\'\' 1JS10A4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"27\\\"\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"2560 x 1440 ( 16:9 )\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"IPS LED\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"60Hz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"M\\u00e0n h\\u00ecnh ph\\u1eb3ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x HDMI , 2 x DisplayPort , 1 x DVI-D\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"C\\u00e1p Type A to Type C, C\\u00e1p Displayport\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/Ky3LptYYe9Oqmf78D9ZhqUEWrYBlC0dGCPJS141YNC-1CjSCx_KBLaWaytPm25q2RYR709eCqxxv8Qd49qw=w500-rw\"}}]',13,1),(89,'2020-11-01 15:41:29.835753','15','Kết nối',1,'[{\"added\": {}}]',8,1),(90,'2020-11-01 15:41:37.836553','16','Kích thước',1,'[{\"added\": {}}]',8,1),(91,'2020-11-01 15:41:50.276198','17','Loại bàn phím',1,'[{\"added\": {}}]',8,1),(92,'2020-11-01 15:42:04.360079','18','Kiểu switch',1,'[{\"added\": {}}]',8,1),(93,'2020-11-01 15:42:13.695743','19','Đèn',1,'[{\"added\": {}}]',8,1),(94,'2020-11-01 15:42:26.856433','15','Bàn phím cơ ASUS Strix Flare',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Full size\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m c\\u01a1\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Cherry MX Red\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/UVFW4tBVy3imNBmjLaE-vjuBQNXZau3LCilveXAY9gyiX-_59LEXnnCVt0uF1CvU16pW0AEH7e2XVZ-wlXA=w500-rw\"}}]',13,1),(95,'2020-11-01 15:43:56.327465','1','Nhân viên kho',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(96,'2020-11-01 15:44:30.372675','4','CORSAIR',1,'[{\"added\": {}}]',11,1),(97,'2020-11-01 15:45:44.814641','16','Bàn phím cơ CORSAIR K63',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Tenkeyless\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m c\\u01a1\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Cherry MX Blue\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"\\u0110o\\u0309\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/DTrK_wi3JPpTl0dxYfyBzv-jvvU36bAGLarU6xATlexRTh6XWAn4oLS-Kp52aSKX2Fm436fZbMFtqS3YR2RW=w500-rw\"}}]',13,1),(98,'2020-11-01 15:47:05.900990','17','Bàn phím cơ CORSAIR K70 MK.2 SE RGB MX',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Full size\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m c\\u01a1\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Cherry MX Speed\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/UDTW51uyUIQLyCXWpnBloXiEtubiDnCM_Vs8ql0ZOJTH3jid0AVJIZKAUqZseAcJbr9ybpcgugjFejWRqQ=w500-rw\"}}]',13,1),(99,'2020-11-01 15:49:12.061087','5','LOGITECH',1,'[{\"added\": {}}]',11,1),(100,'2020-11-01 15:50:16.090574','18','Bàn phím cơ Logitech G613 không dây',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m kh\\u00f4ng d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Full size\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m c\\u01a1\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Romer-G\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Kh\\u00f4ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/5wVHIcm69jXd7YaVf7fNu9Y7i_VsmGmBsA57QyIA4xXuuy7R_uaPeINi1vnv1gRqiWN4-vU89mXE9qvBA6c=w500-rw\"}}]',13,1),(101,'2020-11-01 15:57:44.957350','19','Bàn phím cơ Gaming Logitech G Pro X',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Tenkeyless\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m c\\u01a1\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"GX switch Blue\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/EGuDcz8z-Ovp8CMdMos43hwSofGy8vKI8ADb3UAgpdKofaJeHZcDeoK-epYHFK0X0fYyTR27VtJeDanfykY=w500-rw\"}}]',13,1),(102,'2020-11-01 15:59:12.372563','20','Bàn phím Logitech K120',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Full size\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Ba\\u0300n phi\\u0301m th\\u01b0\\u01a1\\u0300ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Kh\\u00f4ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/WMtrJx2DQb9BGyFW5zRr4jOa61qLmcPyq0eoeGziIj_dq6ClACFWf3lON-urnfJ3rpkTHUKp_UKD_0qBcA=w500-rw\"}}]',13,1),(103,'2020-11-01 16:01:30.874612','20','Độ phân giải (CPI/DPI)',1,'[{\"added\": {}}]',8,1),(104,'2020-11-01 16:01:38.899952','21','Dạng cảm biến',1,'[{\"added\": {}}]',8,1),(105,'2020-11-01 16:02:01.759069','22','Khối lượng',1,'[{\"added\": {}}]',8,1),(106,'2020-11-01 16:02:15.468980','21','Chuột gaming CorSAIR Ironclaw',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"18000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"105g\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/ZMYd3uspIuDKSXs2pXbUxFObJtqbEC74WoELoFtV0YiV5C67vvcHvBrvMeK9dW884Yulqh94gJmYwbVPsw=w500-rw\"}}]',13,1),(107,'2020-11-01 16:04:17.289737','22','Chuột máy tính Corsair Harpoon PRO RGB',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"12000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"85g\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/qSA-CpRnWtaYfaSoB-f_ygR_7qPAKqE4C0NNJKKNo6ajceuLB4il8K8VoX9iVi4G40MRVPX0mCPXNO6iGAk=w500-rw\"}}]',13,1),(108,'2020-11-01 16:07:05.540246','23','Chuột gaming không dây CORSAIR Corsair Dark Core R',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t kh\\u00f4ng d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"128g\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/QRh9ZtnxAyFaQTr84lW1E9v86Xmv0TmQGG2DXUFqsQTo_EB3ko_o7WYgjc7kz1ahbsvrEBC-PSgNaJD2VzE=w1000-rw\"}}]',13,1),(109,'2020-11-01 16:09:06.532452','24','Chuột máy tính không dây Logitech M337',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t kh\\u00f4ng d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Kh\\u00f4ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/WJYeaCY3bPr7--9hl9MWKB-CW6Cgq6MphJXRuJb3kZHiaUk-8VFjvtcQVk1NK53UoQzMuDv8vhHy4pHd4_4=w500-rw\"}}]',13,1),(110,'2020-11-01 16:11:13.507608','25','Chuột máy tính không dây Logitech Mx Anywhere 2S',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t kh\\u00f4ng d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Kh\\u00f4ng\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/84LpglS-Omv1zdl8p3SPUdDWt54ejAn508tq1-fuXafKZvGV58jbFle0TzFlY8rWycCA1rjc4pIbSElY9g=w500-rw\"}}]',13,1),(111,'2020-11-01 16:12:46.978079','26','Chuột gaming Logitech G403 Hero',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"87.3g\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/-U22765ktLJTHXZbGTSuMHZs_UYUSDXNQ87BnoD_zSo_r1Mp0sDMb5gGlOPkqKLYLJuym_wPv39hkKCnIiI=w500-rw\"}}]',13,1),(112,'2020-11-01 16:14:41.654580','27','Chuột máy tính Asus TUF Gaming M3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Chu\\u00f4\\u0323t co\\u0301 d\\u00e2y\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"RGB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"7000DPI\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Optical\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"84 g\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/835MfBqgcTVYh7g1zWDtJUFp2QnjeMswHm7JE_qLVp5mBAmR1Hep69EL3Jab4Dm6jyDaKBJIAKcfKqK4sQ=w500-rw\"}}]',13,1),(113,'2020-11-01 16:15:29.681333','5','Tai nghe',3,'',9,1),(114,'2020-11-01 16:16:02.677825','7','Thiết bị ngoại vi',1,'[{\"added\": {}}]',9,1),(115,'2020-11-01 16:16:09.334254','4','Chuột',2,'[{\"changed\": {\"fields\": [\"Category belong\"]}}]',9,1),(116,'2020-11-01 16:16:14.093862','3','Bàn phím',2,'[{\"changed\": {\"fields\": [\"Category belong\"]}}]',9,1),(117,'2020-11-01 16:17:43.024401','2','Asus11',2,'[{\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - M\\u00e0n h\\u00ecnh LCD ASUS 27\'\' VA27EHE\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - M\\u00e0n H\\u00ecnh ASUS 19.5\\\" VS207DF\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - M\\u00e0n h\\u00ecnh cong ASUS 27\'\' VG27VQ\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - Ba\\u0300n phi\\u0301m c\\u01a1 ASUS Strix Flare\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Asus11 - Chu\\u1ed9t m\\u00e1y t\\u00ednh Asus TUF Gaming M3\"}}]',7,1),(118,'2020-11-01 16:18:45.298084','4','Mouse101',1,'[{\"added\": {}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t gaming CorSAIR Ironclaw\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t m\\u00e1y t\\u00ednh Corsair Harpoon PRO RGB\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t gaming kh\\u00f4ng d\\u00e2y CORSAIR Corsair Dark Core R\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t m\\u00e1y t\\u00ednh kh\\u00f4ng d\\u00e2y Logitech M337\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t m\\u00e1y t\\u00ednh kh\\u00f4ng d\\u00e2y Logitech Mx Anywhere 2S\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t gaming Logitech G403 Hero\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Mouse101 - Chu\\u1ed9t m\\u00e1y t\\u00ednh Asus TUF Gaming M3\"}}]',7,1),(119,'2020-11-01 16:20:42.867307','5','Corsair44',1,'[{\"added\": {}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Corsair44 - Ba\\u0300n phi\\u0301m c\\u01a1 CORSAIR K63\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Corsair44 - Ba\\u0300n phi\\u0301m c\\u01a1 CORSAIR K70 MK.2 SE RGB MX\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Corsair44 - Chu\\u1ed9t gaming CorSAIR Ironclaw\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Corsair44 - Chu\\u1ed9t m\\u00e1y t\\u00ednh Corsair Harpoon PRO RGB\"}}, {\"added\": {\"name\": \"discount item\", \"object\": \"Corsair44 - Chu\\u1ed9t gaming kh\\u00f4ng d\\u00e2y CORSAIR Corsair Dark Core R\"}}]',7,1),(120,'2020-11-01 16:20:54.713366','1','TEST01',2,'[{\"changed\": {\"fields\": [\"On bill\"]}}, {\"deleted\": {\"name\": \"discount item\", \"object\": \"TEST01 - Dell G3 Inspiron 3590 N5I5517W\"}}, {\"deleted\": {\"name\": \"discount item\", \"object\": \"TEST01 - Dell Inspiron G5 5590 N5590 4F4Y41\"}}]',7,1),(121,'2020-11-01 16:22:24.714550','3','kho01',1,'[{\"added\": {}}]',4,1),(122,'2020-11-01 16:22:49.439921','3','kho01',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(123,'2020-11-01 16:22:57.196795','3','kho01',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(124,'2020-11-01 16:23:46.957970','4','vu01',1,'[{\"added\": {}}]',4,1),(125,'2020-11-01 16:23:54.069394','4','vu01',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',4,1),(126,'2020-11-01 16:24:06.560382','5','su01',1,'[{\"added\": {}}]',4,1),(127,'2020-11-01 16:24:13.430717','5','su01',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',4,1),(128,'2020-11-01 16:24:29.085485','6','don01',1,'[{\"added\": {}}]',4,1),(129,'2020-11-01 16:24:34.758004','6','don01',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(23,'authtoken','token'),(24,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(20,'customer','customer'),(22,'customer','shipaddress'),(21,'customer','telnumber'),(25,'customer','token'),(17,'order','cart'),(16,'order','cartitem'),(18,'order','order'),(15,'order','orderdetail'),(14,'order','paymentservice'),(19,'order','shipservice'),(9,'product','category'),(7,'product','discount'),(12,'product','discountitem'),(11,'product','manufacturer'),(13,'product','product'),(8,'product','productattribute'),(10,'product','productattributevalue'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-10 15:06:07.791779'),(2,'auth','0001_initial','2020-10-10 15:06:08.136303'),(3,'admin','0001_initial','2020-10-10 15:06:09.126429'),(4,'admin','0002_logentry_remove_auto_add','2020-10-10 15:06:09.313547'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-10 15:06:09.322570'),(6,'contenttypes','0002_remove_content_type_name','2020-10-10 15:06:09.459979'),(7,'auth','0002_alter_permission_name_max_length','2020-10-10 15:06:09.548743'),(8,'auth','0003_alter_user_email_max_length','2020-10-10 15:06:09.570798'),(9,'auth','0004_alter_user_username_opts','2020-10-10 15:06:09.578748'),(10,'auth','0005_alter_user_last_login_null','2020-10-10 15:06:09.663291'),(11,'auth','0006_require_contenttypes_0002','2020-10-10 15:06:09.667185'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-10 15:06:09.675456'),(13,'auth','0008_alter_user_username_max_length','2020-10-10 15:06:09.886511'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-10 15:06:10.060073'),(15,'auth','0010_alter_group_name_max_length','2020-10-10 15:06:10.078844'),(16,'auth','0011_update_proxy_permissions','2020-10-10 15:06:10.087177'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-10 15:06:10.194888'),(18,'sessions','0001_initial','2020-10-10 15:06:10.228734'),(19,'customer','0001_initial','2020-10-10 17:32:09.451897'),(20,'product','0001_initial','2020-10-10 17:32:09.891227'),(21,'order','0001_initial','2020-10-10 17:32:10.991979'),(22,'order','0002_auto_20201011_0044','2020-10-10 17:44:31.208494'),(23,'product','0002_auto_20201011_0044','2020-10-10 17:44:31.214533'),(24,'order','0003_auto_20201012_1006','2020-10-12 03:06:52.507471'),(25,'product','0003_auto_20201012_1006','2020-10-12 03:06:52.625520'),(26,'order','0004_auto_20201013_2325','2020-10-13 16:25:20.362587'),(27,'product','0004_auto_20201013_2325','2020-10-13 16:25:20.370524'),(28,'order','0005_auto_20201019_1512','2020-10-19 08:12:37.306021'),(29,'product','0005_auto_20201019_1512','2020-10-19 08:12:37.542485'),(30,'authtoken','0001_initial','2020-10-21 15:01:54.299450'),(31,'authtoken','0002_auto_20160226_1747','2020-10-21 15:01:54.548761'),(32,'authtoken','0003_tokenproxy','2020-10-21 15:01:54.554713'),(33,'order','0006_auto_20201021_2201','2020-10-21 15:01:54.566426'),(34,'product','0006_auto_20201021_2201','2020-10-21 15:01:54.767762'),(35,'order','0007_auto_20201022_1520','2020-10-22 08:20:46.645913'),(36,'product','0007_auto_20201022_1520','2020-10-22 08:20:46.661130'),(37,'customer','0002_token','2020-10-24 15:18:51.695737'),(38,'order','0008_auto_20201024_2218','2020-10-24 15:18:51.783057'),(39,'product','0008_auto_20201024_2218','2020-10-24 15:18:51.789466'),(40,'customer','0003_token_created','2020-10-24 15:34:03.351341'),(41,'order','0009_auto_20201024_2233','2020-10-24 15:34:03.360317'),(42,'product','0009_auto_20201024_2233','2020-10-24 15:34:03.365916'),(43,'customer','0004_auto_20201024_2250','2020-10-24 15:50:16.981436'),(44,'order','0010_auto_20201024_2250','2020-10-24 15:50:16.991051'),(45,'product','0010_auto_20201024_2250','2020-10-24 15:50:16.996359'),(46,'customer','0005_auto_20201025_1434','2020-10-25 07:35:03.614104'),(47,'order','0011_auto_20201025_1434','2020-10-25 07:35:03.708230'),(48,'product','0011_auto_20201025_1434','2020-10-25 07:35:03.715276'),(49,'customer','0006_auto_20201025_2308','2020-10-25 16:08:27.397234'),(50,'order','0012_auto_20201025_2308','2020-10-25 16:08:27.501543'),(51,'product','0012_auto_20201025_2308','2020-10-25 16:08:27.529740'),(52,'customer','0007_auto_20201025_2322','2020-10-25 16:22:33.890390'),(53,'order','0013_auto_20201025_2322','2020-10-25 16:22:33.990281'),(54,'product','0013_auto_20201025_2322','2020-10-25 16:22:33.996266'),(55,'customer','0008_auto_20201025_2334','2020-10-25 16:34:43.916134'),(56,'order','0014_auto_20201025_2334','2020-10-25 16:34:43.930097'),(57,'product','0014_auto_20201025_2334','2020-10-25 16:34:43.936081'),(58,'customer','0009_auto_20201027_2155','2020-10-27 14:56:04.923102'),(59,'order','0015_auto_20201027_2155','2020-10-27 14:56:05.069130'),(60,'product','0015_auto_20201027_2155','2020-10-27 14:56:05.074556'),(61,'customer','0010_auto_20201027_2239','2020-10-27 15:39:32.082067'),(62,'order','0016_auto_20201027_2239','2020-10-27 15:39:32.091635'),(63,'product','0016_auto_20201027_2239','2020-10-27 15:39:32.097608'),(64,'customer','0011_auto_20201027_2300','2020-10-27 16:00:40.069635'),(65,'order','0017_auto_20201027_2300','2020-10-27 16:00:40.080954'),(66,'product','0017_auto_20201027_2300','2020-10-27 16:00:40.086897'),(67,'customer','0002_auto_20201027_2312','2020-10-27 16:12:07.424512'),(68,'order','0002_auto_20201027_2312','2020-10-27 16:12:07.447495'),(69,'product','0002_auto_20201027_2312','2020-10-27 16:12:07.453629'),(70,'customer','0002_auto_20201027_2316','2020-10-27 16:17:07.751827'),(71,'order','0002_auto_20201027_2316','2020-10-27 16:17:07.863866'),(72,'product','0002_auto_20201027_2316','2020-10-27 16:17:07.869878'),(73,'customer','0003_auto_20201028_1715','2020-10-28 10:15:18.957105'),(74,'order','0003_auto_20201028_1715','2020-10-28 10:15:18.969918'),(75,'product','0003_auto_20201028_1715','2020-10-28 10:15:18.978289');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9tmt3pb9cl5mm8e3ss6mif02ble8f3e4','.eJxVjEEOwiAQRe_C2pCBAqUu3fcMZDoMUjU0Ke3KeHdp0oVu33v_v0XAfcthr7yGOYqrUOLyyyakJ5dDxAeW-yJpKds6T_JI5GmrHJfIr9vZ_h1krLmtNQ1eARlib5KlARBiDxrZWwsqNeV671EntuyUIhMbBuo0WA2dc-LzBc-HNsM:1kY4AA:YWNubdOLrgpfuFKa76yao1oYRhQiRjDm2RwPEV0eo3k','2020-11-12 09:24:06.876534');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cart`
--

DROP TABLE IF EXISTS `order_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_cart_customer_id_6237d072_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cart`
--

LOCK TABLES `order_cart` WRITE;
/*!40000 ALTER TABLE `order_cart` DISABLE KEYS */;
INSERT INTO `order_cart` VALUES (14,0,7),(31,0,3);
/*!40000 ALTER TABLE `order_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cartitem`
--

DROP TABLE IF EXISTS `order_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_cartitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_cartitem_cart_id_9b4c287a_fk_order_cart_id` (`cart_id`),
  KEY `order_cartitem_product_id_ad323e40_fk_product_product_id` (`product_id`),
  CONSTRAINT `order_cartitem_cart_id_9b4c287a_fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `order_cart` (`id`),
  CONSTRAINT `order_cartitem_product_id_ad323e40_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cartitem`
--

LOCK TABLES `order_cartitem` WRITE;
/*!40000 ALTER TABLE `order_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipped_date` datetime(6) DEFAULT NULL,
  `paid_date` datetime(6) DEFAULT NULL,
  `discount_code` varchar(30) DEFAULT NULL,
  `total_discount` double NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `stage` varchar(20) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  `ship_by_id` int DEFAULT NULL,
  `ship_to_id` int DEFAULT NULL,
  `total_actual_price` double NOT NULL,
  `total_price` double NOT NULL,
  `contact_tel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_payment_type_id_93f93be0_fk_order_paymentservice_id` (`payment_type_id`),
  KEY `order_order_ship_by_id_fe47631c_fk_order_shipservice_id` (`ship_by_id`),
  KEY `order_order_ship_to_id_b22407ea_fk_customer_shipaddress_id` (`ship_to_id`),
  KEY `order_order_customer_id_5bbbd957_fk_customer_customer_id` (`customer_id`),
  KEY `order_order_contact_tel_id_8b053b1f_fk_customer_telnumber_id` (`contact_tel_id`),
  CONSTRAINT `order_order_contact_tel_id_8b053b1f_fk_customer_telnumber_id` FOREIGN KEY (`contact_tel_id`) REFERENCES `customer_telnumber` (`id`),
  CONSTRAINT `order_order_customer_id_5bbbd957_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `order_order_payment_type_id_93f93be0_fk_order_paymentservice_id` FOREIGN KEY (`payment_type_id`) REFERENCES `order_paymentservice` (`id`),
  CONSTRAINT `order_order_ship_by_id_fe47631c_fk_order_shipservice_id` FOREIGN KEY (`ship_by_id`) REFERENCES `order_shipservice` (`id`),
  CONSTRAINT `order_order_ship_to_id_b22407ea_fk_customer_shipaddress_id` FOREIGN KEY (`ship_to_id`) REFERENCES `customer_shipaddress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (43,'2020-11-05 06:31:38.861081',NULL,NULL,0,'2020-10-29 06:31:38.861081','RETURN',NULL,3,1,1,3,89070000,89070000,6),(44,'2020-11-05 07:18:01.127846',NULL,NULL,0,'2020-10-29 07:18:01.127846','CANCEL',NULL,3,1,2,3,29690000,29690000,6),(45,'2020-11-05 07:28:09.137667',NULL,NULL,0,'2020-10-29 07:28:09.137667','RETURN',NULL,3,4,3,3,90970000,90970000,6),(46,'2020-11-05 07:48:49.430717',NULL,NULL,0,'2020-10-29 07:48:49.430717','CANCEL',NULL,3,4,3,3,62680000,62680000,6),(47,'2020-11-05 07:52:19.125687',NULL,NULL,0,'2020-10-29 07:52:19.125687','CANCEL',NULL,3,4,3,3,29690000,29690000,6),(48,'2020-11-05 07:53:39.664747','2020-10-29 07:53:39.664747','CEL10',27992000,'2020-10-29 07:53:39.664747','DONE',NULL,3,4,3,3,146958000,174950000,6),(49,'2020-11-06 06:13:50.150716','2020-10-30 06:13:50.150716','CEL10',5598400,'2020-10-30 06:13:50.150716','SHIPPING',NULL,3,4,3,3,29391600,34990000,6),(50,'2020-11-06 11:05:09.651609','2020-10-30 11:13:33.451463','Asus11',0,'2020-10-30 11:05:09.651609','DONE',NULL,3,1,4,3,174950000,174950000,6),(51,'2020-11-06 11:07:38.583985','2020-10-30 11:07:38.583985','Asus11',19794000,'2020-10-30 11:07:38.583985','PROCESSING',NULL,3,2,1,3,69176000,88970000,6);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdetail`
--

DROP TABLE IF EXISTS `order_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `discount_code` varchar(30) DEFAULT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` double NOT NULL,
  `discount_amount` double NOT NULL,
  `unit_actual_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdetail_order_id_2c6526df_fk_order_order_id` (`order_id`),
  KEY `order_orderdetail_product_id_76983dc0_fk_product_product_id` (`product_id`),
  CONSTRAINT `order_orderdetail_order_id_2c6526df_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_orderdetail_product_id_76983dc0_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdetail`
--

LOCK TABLES `order_orderdetail` WRITE;
/*!40000 ALTER TABLE `order_orderdetail` DISABLE KEYS */;
INSERT INTO `order_orderdetail` VALUES (30,3,NULL,43,5,89070000,0,89070000),(31,1,NULL,44,5,29690000,0,29690000),(32,1,NULL,45,2,44990000,0,44990000),(33,2,NULL,45,3,45980000,0,45980000),(34,1,NULL,46,1,32990000,0,32990000),(35,1,NULL,46,5,29690000,0,29690000),(36,1,NULL,47,5,29690000,0,29690000),(37,5,'CEL10',48,4,174950000,0,174950000),(38,1,'CEL10',49,4,34990000,0,34990000),(39,5,'Asus11',50,4,174950000,0,174950000),(40,2,'Asus11',51,1,65980000,19794000,46186000),(41,1,'Asus11',51,3,22990000,0,22990000);
/*!40000 ALTER TABLE `order_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymentservice`
--

DROP TABLE IF EXISTS `order_paymentservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_paymentservice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentservice`
--

LOCK TABLES `order_paymentservice` WRITE;
/*!40000 ALTER TABLE `order_paymentservice` DISABLE KEYS */;
INSERT INTO `order_paymentservice` VALUES (1,'Thanh toán khi nhận hàng',1),(2,'Momo',1),(3,'Credit Card',1),(4,'Master Card',1),(5,'ATM Card',1);
/*!40000 ALTER TABLE `order_paymentservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipservice`
--

DROP TABLE IF EXISTS `order_shipservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_shipservice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipservice`
--

LOCK TABLES `order_shipservice` WRITE;
/*!40000 ALTER TABLE `order_shipservice` DISABLE KEYS */;
INSERT INTO `order_shipservice` VALUES (1,'Viettel Post',1),(2,'giaohangtietkiem.vn',1),(3,'DHL',1),(4,'giaohangnhanh.vn',1),(5,'EMS',1);
/*!40000 ALTER TABLE `order_shipservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `category_belong_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_category_belong_id_e12b76fe_fk_product_c` (`category_belong_id`),
  CONSTRAINT `product_category_category_belong_id_e12b76fe_fk_product_c` FOREIGN KEY (`category_belong_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Laptop',NULL,NULL),(2,'Màn hình',NULL,NULL),(3,'Bàn phím',NULL,7),(4,'Chuột',NULL,7),(7,'Thiết bị ngoại vi',NULL,NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `discount_percent` double NOT NULL,
  `on_bill` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `apply_date` datetime(6) NOT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_discount_code_ee4d649a_uniq` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discount`
--

LOCK TABLES `product_discount` WRITE;
/*!40000 ALTER TABLE `product_discount` DISABLE KEYS */;
INSERT INTO `product_discount` VALUES (1,'TEST01',0.1,1,1,'2020-10-25 13:28:39.000000','2020-10-27 13:32:01.000000'),(2,'Asus11',0.15,0,1,'2020-10-28 10:07:41.000000',NULL),(3,'CEL10',0.16,1,1,'2020-10-28 10:07:41.000000',NULL),(4,'Mouse101',0.2,0,1,'2020-11-01 15:36:43.000000',NULL),(5,'Corsair44',0.14,0,1,'2020-11-01 15:36:43.000000',NULL);
/*!40000 ALTER TABLE `product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discountitem`
--

DROP TABLE IF EXISTS `product_discountitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discountitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_discountitem_discount_id_31f6b572_fk_product_discount_id` (`discount_id`),
  KEY `product_discountitem_product_id_505506fc_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_discountitem_discount_id_31f6b572_fk_product_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `product_discount` (`id`),
  CONSTRAINT `product_discountitem_product_id_505506fc_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discountitem`
--

LOCK TABLES `product_discountitem` WRITE;
/*!40000 ALTER TABLE `product_discountitem` DISABLE KEYS */;
INSERT INTO `product_discountitem` VALUES (5,2,1),(6,2,2),(7,2,7),(8,2,9),(9,2,8),(10,2,15),(11,2,27),(12,4,21),(13,4,22),(14,4,23),(15,4,24),(16,4,25),(17,4,26),(18,4,27),(19,5,16),(20,5,17),(21,5,21),(22,5,22),(23,5,23);
/*!40000 ALTER TABLE `product_discountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacturer`
--

DROP TABLE IF EXISTS `product_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_manufacturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacturer`
--

LOCK TABLES `product_manufacturer` WRITE;
/*!40000 ALTER TABLE `product_manufacturer` DISABLE KEYS */;
INSERT INTO `product_manufacturer` VALUES (1,'Asus',NULL),(2,'Dell',NULL),(3,'HP',NULL),(4,'CORSAIR',NULL),(5,'LOGITECH',NULL);
/*!40000 ALTER TABLE `product_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `unit_in_order` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `unit_in_stock` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_category_id_0c725779_fk_product_category_id` (`category_id`),
  KEY `product_product_manufacturers_id_e1298339_fk_product_m` (`manufacturer_id`),
  CONSTRAINT `product_product_category_id_0c725779_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_product_manufacturer_id_4a7a0ae9_fk_product_m` FOREIGN KEY (`manufacturer_id`) REFERENCES `product_manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'Asus ROG Zephyrus M GU502GU AZ090T',32990000,2,1,NULL,1,1,20),(2,'Asus ROG Strix SCAR 15 G532L VAZ044T',44990000,0,1,NULL,1,1,15),(3,'Dell G3 Inspiron 3590 N5I5517W',22990000,1,1,NULL,1,2,30),(4,'Dell Inspiron G5 5590 N5590 4F4Y41',34990000,0,1,NULL,1,2,4),(5,'HP ENVY 13-aq1057TX',29690000,0,1,NULL,1,3,23),(6,'HP Pavilion 15-cs3008TU',13490000,0,1,NULL,1,3,24),(7,'Màn hình LCD ASUS 27\'\' VA27EHE',4390000,0,1,NULL,2,1,16),(8,'Màn hình cong ASUS 27\'\' VG27VQ',7990000,0,1,NULL,2,1,12),(9,'Màn Hình ASUS 19.5\" VS207DF',2090000,0,1,NULL,2,1,20),(10,'Màn Hình Dell Ultrasharp 24\" U2419H',5690000,0,1,NULL,2,2,0),(11,'Màn hình LCD Dell 32\" U3219Q',20990000,0,1,NULL,2,2,11),(12,'Màn hình Dell 27\" U2720Q',13990000,0,1,NULL,2,2,17),(13,'Màn Hình HP Pavilion 27x WTY_3WL53AA',7990000,0,1,NULL,2,3,26),(14,'Màn hình HP 27\'\' 1JS10A4',12188000,0,1,NULL,2,3,14),(15,'Bàn phím cơ ASUS Strix Flare',3990000,0,1,NULL,3,1,7),(16,'Bàn phím cơ CORSAIR K63',1990000,0,1,NULL,3,4,31),(17,'Bàn phím cơ CORSAIR K70 MK.2 SE RGB MX',4450000,0,1,NULL,3,4,24),(18,'Bàn phím cơ Logitech G613 không dây',1890000,0,1,NULL,3,5,13),(19,'Bàn phím cơ Gaming Logitech G Pro X',3799000,0,1,NULL,3,5,4),(20,'Bàn phím Logitech K120',159000,0,1,NULL,3,5,47),(21,'Chuột gaming CorSAIR Ironclaw',1790000,0,1,NULL,4,4,28),(22,'Chuột máy tính Corsair Harpoon PRO RGB',499000,0,1,NULL,4,4,34),(23,'Chuột gaming không dây CORSAIR Corsair Dark Core R',2290000,0,1,NULL,4,4,3),(24,'Chuột máy tính không dây Logitech M337',530000,0,1,NULL,4,5,21),(25,'Chuột máy tính không dây Logitech Mx Anywhere 2S',1810000,0,1,NULL,4,5,14),(26,'Chuột gaming Logitech G403 Hero',1599000,0,1,NULL,4,5,11),(27,'Chuột máy tính Asus TUF Gaming M3',690000,0,1,NULL,4,1,12);
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productattribute`
--

DROP TABLE IF EXISTS `product_productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productattribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productattribute`
--

LOCK TABLES `product_productattribute` WRITE;
/*!40000 ALTER TABLE `product_productattribute` DISABLE KEYS */;
INSERT INTO `product_productattribute` VALUES (1,'Thông số màn hình',NULL),(2,'CPU',NULL),(3,'Ram',NULL),(4,'Ổ cứng',NULL),(5,'Pin',NULL),(6,'Ảnh',NULL),(7,'Kích thước',NULL),(8,'Độ phân giải',NULL),(9,'Tấm nền',NULL),(10,'Tần số quét',NULL),(11,'Kiểu màn hình',NULL),(13,'Cổng xuất hình',NULL),(14,'Phụ kiện đi kèm',NULL),(15,'Kết nối',NULL),(16,'Kích thước',NULL),(17,'Loại bàn phím',NULL),(18,'Kiểu switch',NULL),(19,'Đèn',NULL),(20,'Độ phân giải (CPI/DPI)',NULL),(21,'Dạng cảm biến',NULL),(22,'Khối lượng',NULL);
/*!40000 ALTER TABLE `product_productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productattributevalue`
--

DROP TABLE IF EXISTS `product_productattributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productattributevalue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(200) NOT NULL,
  `product_id` int NOT NULL,
  `product_attribute_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productattri_product_id_35b2eda0_fk_product_p` (`product_id`),
  KEY `product_productattri_product_attribute_id_de4809a9_fk_product_p` (`product_attribute_id`),
  CONSTRAINT `product_productattri_product_attribute_id_de4809a9_fk_product_p` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_productattribute` (`id`),
  CONSTRAINT `product_productattri_product_id_35b2eda0_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productattributevalue`
--

LOCK TABLES `product_productattributevalue` WRITE;
/*!40000 ALTER TABLE `product_productattributevalue` DISABLE KEYS */;
INSERT INTO `product_productattributevalue` VALUES (1,'15.6\" FHD (1920 x 1080) IPS, 100% sRGB, 240Hz, 3ms, 300nits, Pantone® Validated, NanoEdge',1,1),(2,'Intel Core i7-9750H 2.6GHz up to 4.5GHz 12MB',1,2),(3,'16GB DDR4 2666MHz Onboard (1x SO-DIMM socket, up to 32GB SDRAM)',1,3),(4,'512GB SSD PCIE G3X4 (Support RAID 0) (2 slots)',1,4),(5,'4 Cell 76WHr',1,5),(6,'https://product.hstatic.net/1000026716/product/og-zephyrus-m-laptop_gaming_asus_rog_zephyrus_s_gu502gu_az089t-black-2_3cea5ec698d14abe944331a246bcac4e.jpg',1,6),(7,'Intel Core i7-10875H 2.3GHz up to 5.1GHz 16MB',2,2),(8,'16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',2,3),(9,'1TB SSD PCIE G3X4 (3 slot)',2,4),(10,'15.6\" FHD (1920 x 1080) IPS Non-Glare, NanoEdge, 100% sRGB, 300nits, 240Hz/3ms',2,1),(11,'4 Cell 66WHrs',2,5),(12,'https://product.hstatic.net/1000026716/product/r-15-g532l-vaz044t-i7-10875h_2_30905bbaa46845a2a0acca89e98e4eb9_grande_44248586cdba41eb8082d31af6051093.jpg',2,6),(13,'Intel Core i5-9300H 2.4GHz up to 4.1GHz 8MB',3,2),(14,'2 x 4GB DDR4 2666MHz',3,3),(15,'256GB SSD M.2 PCIE',3,4),(16,'15.6\" FHD (1920 x 1080) IPS, Anti-Glarec',3,1),(17,'3 Cell 56WHr',3,5),(18,'https://product.hstatic.net/1000026716/product/ll-g3-inspiron-3590-n5i5517w_1_0c916cb24b5e4f328e249eb350768f22_master_3aa6f65982af408b913ab1f85f0f3b40.jpg',3,6),(19,'Intel Core i7 9750Hc',4,2),(20,'Intel Core i7 9750H',4,3),(21,'256GB SSD M.2 NVMe / 1TB HDD 5400RPM',4,4),(22,'15.6\" IPS (1920 x 1080)',4,1),(23,'4 cell 60 Wh Pin liền',4,5),(24,'lh3.googleusercontent.com/LrhiDvauO8bqfTdGPoZ6uCIPtOmUCmpkzQ81ZeEFcXHklSDlNuXrbEy2WRAQ-V-c139mkJRD4l6gSGBQBFU=w1000-rw',4,6),(25,'HP ENVY 13-aq1057TX',5,2),(26,'1 x 8GB Onboard DDR4 2400MHz',5,3),(27,'512GB SSD M.2 NVMe',5,4),(28,'13.3\" IPS (1920 x 1080)',5,1),(29,'4 cell 53 Wh Pin liền',5,5),(30,'https://lh3.googleusercontent.com/Mrj88XkDCITkh1iUfEE9kgALjHsvESvU0Irje4tAtzCiEYiMwT_RhpHpD3m1-3AR_s04sZcKbGAD6ae2Xydn=w1000-rw',5,6),(31,'HP Pavilion 15-cs3008TU',6,2),(32,'1 x 4GB DDR4 2666MHz',6,3),(33,'1 x 4GB DDR4 2666MHz',6,4),(34,'15.6\" (1920 x 1080)',6,1),(35,'3 cell 41 Wh Pin liền',6,5),(36,'https://lh3.googleusercontent.com/gObfRF8xddJDDREli44AS77pfc9-DsYpdICgNj4IecqNDIlhv2uhHcBVdXQAKSZiKwAD6LzOju6NsmGF_w=w1000-rw',6,6),(37,'27\"',7,7),(38,'1920 x 1080 ( 16:9 )',7,8),(39,'IPS',7,9),(40,'75Hz',7,10),(41,'Màn hình phẳng',7,11),(42,'1 x HDMI , 1 x VGA/D-sub',7,13),(43,'HDMI, 1 Nguồn, Sách hướng dẫn',7,14),(44,'27\"',8,7),(45,'1920 x 1080 ( 16:9 )',8,8),(46,'VA',8,9),(47,'165Hz',8,10),(48,'Màn hình cong',8,11),(49,'1 x HDMI 2.0 , 1 x DisplayPort 1.2 , 1 x DVI-D',8,13),(50,'Adaptor, Cáp nguồn, Cáp Displayport, Cáp âm thanh 3.5',8,14),(51,'19.5\"',9,7),(52,'1366 x 768 ( 16:9 )',9,8),(53,'TN',9,9),(54,'60Hz',9,10),(55,'Màn hình phẳng',9,11),(56,'1 x VGA/D-sub',9,13),(57,'24\"',10,7),(58,'1920 x 1080 ( 16:9 )',10,8),(59,'IPS LED',10,9),(60,'60Hz',10,10),(61,'Màn hình phẳng',10,11),(62,'1 x HDMI 1.4 , 2 x DisplayPort 1.4',10,13),(63,'Cáp Displayport, Cáp USB',10,14),(64,'https://lh3.googleusercontent.com/h01DMBO4OTG-Uxi9kUCana8ZCIQjgAvHMxcK0ghTKTsmghwY4ZRaaSSKp2_lExi3c-ovLHA7F1SMkGfR180=w500-rw',10,6),(65,'https://lh3.googleusercontent.com/gt5rI3XY8gDkpfzr-XreZknTetbOZnuK77VpB8NEVEXCOYoviaNtHKsdJ1DAVLERSPFY8oTrmJ96XysH3kxo=w500-rw',9,6),(66,'https://lh3.googleusercontent.com/ZAjqnXLB8nnq53qQ9d3Pmta8V0qpFQXzDv-n5zOpUBCRyNC5B7Sv-lZh7Sk0VqZHYmXra_f6iRvJkKm7Kws=w500-rw',8,6),(67,'https://lh3.googleusercontent.com/ooQ1FV3mlk_l02CE0tuPItmk3CWlmrcC4U39bS4bybykujxohgnxFEv95jC3sRQKWgoqU4JPkrRJ5uF3Vw=w500-rw',7,6),(68,'31.5\"',11,7),(69,'3840 x 2160 ( 16:9 )',11,8),(70,'IPS LED',11,9),(71,'60Hz',11,10),(72,'Màn hình phẳng',11,11),(73,'1 x HDMI , 1 x DisplayPort',11,13),(74,'Cáp nguồn, cáp Displayport',11,14),(75,'https://lh3.googleusercontent.com/Vw-8mDbJWCfHj--9v5hcNig2_6vFpJq6M8FJyqrvQ-RzWHBeRuWTxmfSSTn978GqerTVT7MQepR8et2NCcI=w500-rw',11,6),(76,'27\"',12,7),(77,'3840 x 2160 ( 16:9 )',12,8),(78,'IPS LED',12,9),(79,'60Hz',12,10),(80,'Màn hình phẳng',12,11),(81,'1 x HDMI , 1 x DisplayPort',12,13),(82,'Cáp nguồn, cáp USB-C, cáp Displayport',12,14),(83,'https://lh3.googleusercontent.com/hzH4kjJabYPNg2A1cNF8TycIaww_CcRbrt264LxdEI-azWmBhn0g9DB9IfPH2j0f7SKWoqDJZdAOHxjK6FV_=w500-rw',12,6),(84,'27\"',13,7),(85,'1920 x 1080 ( 16:9 )',13,8),(86,'TN LED',13,9),(87,'144Hz',13,10),(88,'Màn hình phẳng',13,11),(89,'1 x HDMI , 1 x DisplayPort',13,13),(90,'https://lh3.googleusercontent.com/kF_8OmBeUpm55ZbhbHU3i8T6YAXXyVx_Yc57IqcliGu7XfG1THg-RJBLksiWwYKaCh9znjudyH4uOVaZePM=w500-rw',13,6),(91,'27\"',14,7),(92,'2560 x 1440 ( 16:9 )',14,8),(93,'IPS LED',14,9),(94,'60Hz',14,10),(95,'Màn hình phẳng',14,11),(96,'1 x HDMI , 2 x DisplayPort , 1 x DVI-D',14,13),(97,'Cáp Type A to Type C, Cáp Displayport',14,14),(98,'https://lh3.googleusercontent.com/Ky3LptYYe9Oqmf78D9ZhqUEWrYBlC0dGCPJS141YNC-1CjSCx_KBLaWaytPm25q2RYR709eCqxxv8Qd49qw=w500-rw',14,6),(99,'Bàn phím có dây',15,15),(100,'Full size',15,16),(101,'Bàn phím cơ',15,17),(102,'Cherry MX Red',15,18),(103,'RGB',15,19),(104,'https://lh3.googleusercontent.com/UVFW4tBVy3imNBmjLaE-vjuBQNXZau3LCilveXAY9gyiX-_59LEXnnCVt0uF1CvU16pW0AEH7e2XVZ-wlXA=w500-rw',15,6),(105,'Bàn phím có dây',16,15),(106,'Tenkeyless',16,16),(107,'Bàn phím cơ',16,17),(108,'Cherry MX Blue',16,18),(109,'Đỏ',16,19),(110,'https://lh3.googleusercontent.com/DTrK_wi3JPpTl0dxYfyBzv-jvvU36bAGLarU6xATlexRTh6XWAn4oLS-Kp52aSKX2Fm436fZbMFtqS3YR2RW=w500-rw',16,6),(111,'Bàn phím có dây',17,15),(112,'Full size',17,16),(113,'Bàn phím cơ',17,17),(114,'Cherry MX Speed',17,18),(115,'RGB',17,19),(116,'https://lh3.googleusercontent.com/UDTW51uyUIQLyCXWpnBloXiEtubiDnCM_Vs8ql0ZOJTH3jid0AVJIZKAUqZseAcJbr9ybpcgugjFejWRqQ=w500-rw',17,6),(117,'Bàn phím không dây',18,15),(118,'Full size',18,16),(119,'Bàn phím cơ',18,17),(120,'Romer-G',18,18),(121,'Không',18,19),(122,'https://lh3.googleusercontent.com/5wVHIcm69jXd7YaVf7fNu9Y7i_VsmGmBsA57QyIA4xXuuy7R_uaPeINi1vnv1gRqiWN4-vU89mXE9qvBA6c=w500-rw',18,6),(123,'Bàn phím có dây',19,15),(124,'Tenkeyless',19,16),(125,'Bàn phím cơ',19,17),(126,'GX switch Blue',19,18),(127,'RGB',19,19),(128,'https://lh3.googleusercontent.com/EGuDcz8z-Ovp8CMdMos43hwSofGy8vKI8ADb3UAgpdKofaJeHZcDeoK-epYHFK0X0fYyTR27VtJeDanfykY=w500-rw',19,6),(129,'Bàn phím có dây',20,15),(130,'Full size',20,16),(131,'Bàn phím thường',20,17),(132,'Không',20,19),(133,'https://lh3.googleusercontent.com/WMtrJx2DQb9BGyFW5zRr4jOa61qLmcPyq0eoeGziIj_dq6ClACFWf3lON-urnfJ3rpkTHUKp_UKD_0qBcA=w500-rw',20,6),(134,'Chuột có dây',21,15),(135,'RGB',21,19),(136,'18000DPI',21,20),(137,'Optical',21,21),(138,'105g',21,22),(139,'https://lh3.googleusercontent.com/ZMYd3uspIuDKSXs2pXbUxFObJtqbEC74WoELoFtV0YiV5C67vvcHvBrvMeK9dW884Yulqh94gJmYwbVPsw=w500-rw',21,6),(140,'Chuột có dây',22,15),(141,'RGB',22,19),(142,'12000DPI',22,20),(143,'Optical',22,21),(144,'85g',22,22),(145,'https://lh3.googleusercontent.com/qSA-CpRnWtaYfaSoB-f_ygR_7qPAKqE4C0NNJKKNo6ajceuLB4il8K8VoX9iVi4G40MRVPX0mCPXNO6iGAk=w500-rw',22,6),(146,'Chuột không dây',23,15),(147,'RGB',23,19),(148,'16000DPI',23,20),(149,'Optical',23,21),(150,'128g',23,22),(151,'https://lh3.googleusercontent.com/QRh9ZtnxAyFaQTr84lW1E9v86Xmv0TmQGG2DXUFqsQTo_EB3ko_o7WYgjc7kz1ahbsvrEBC-PSgNaJD2VzE=w1000-rw',23,6),(152,'Chuột không dây',24,15),(153,'Không',24,19),(154,'1000DPI',24,20),(155,'Optical',24,21),(156,'https://lh3.googleusercontent.com/WJYeaCY3bPr7--9hl9MWKB-CW6Cgq6MphJXRuJb3kZHiaUk-8VFjvtcQVk1NK53UoQzMuDv8vhHy4pHd4_4=w500-rw',24,6),(157,'Chuột không dây',25,15),(158,'Không',25,19),(159,'4000DPI',25,20),(160,'Optical',25,21),(161,'https://lh3.googleusercontent.com/84LpglS-Omv1zdl8p3SPUdDWt54ejAn508tq1-fuXafKZvGV58jbFle0TzFlY8rWycCA1rjc4pIbSElY9g=w500-rw',25,6),(162,'Chuột có dây',26,15),(163,'RGB',26,19),(164,'16000DPI',26,20),(165,'Optical',26,21),(166,'87.3g',26,22),(167,'https://lh3.googleusercontent.com/-U22765ktLJTHXZbGTSuMHZs_UYUSDXNQ87BnoD_zSo_r1Mp0sDMb5gGlOPkqKLYLJuym_wPv39hkKCnIiI=w500-rw',26,6),(168,'Chuột có dây',27,15),(169,'RGB',27,19),(170,'7000DPI',27,20),(171,'Optical',27,21),(172,'84 g',27,22),(173,'https://lh3.googleusercontent.com/835MfBqgcTVYh7g1zWDtJUFp2QnjeMswHm7JE_qLVp5mBAmR1Hep69EL3Jab4Dm6jyDaKBJIAKcfKqK4sQ=w500-rw',27,6);
/*!40000 ALTER TABLE `product_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 23:38:59
