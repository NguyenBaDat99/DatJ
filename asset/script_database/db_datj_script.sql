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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Nhân viên kho'),(3,'Nhân viên nhân sự'),(2,'Nhân viên thống kê đơn');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,28),(5,1,29),(6,1,30),(7,1,31),(8,1,32),(9,1,33),(10,1,34),(11,1,35),(12,1,36),(13,1,37),(14,1,38),(15,1,39),(16,1,40),(17,1,41),(18,1,42),(19,1,43),(20,1,44),(21,1,45),(22,1,46),(23,1,47),(24,1,48),(25,1,49),(26,1,50),(27,1,51),(28,1,52),(47,2,58),(48,2,60),(43,2,64),(44,2,68),(45,2,70),(46,2,72),(53,3,9),(54,3,10),(55,3,11),(56,3,12),(50,3,13),(51,3,14),(52,3,15),(49,3,16);
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add discount',7,'add_discount'),(26,'Can change discount',7,'change_discount'),(27,'Can delete discount',7,'delete_discount'),(28,'Can view discount',7,'view_discount'),(29,'Can add product attribute',8,'add_productattribute'),(30,'Can change product attribute',8,'change_productattribute'),(31,'Can delete product attribute',8,'delete_productattribute'),(32,'Can view product attribute',8,'view_productattribute'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add product attribute value',10,'add_productattributevalue'),(38,'Can change product attribute value',10,'change_productattributevalue'),(39,'Can delete product attribute value',10,'delete_productattributevalue'),(40,'Can view product attribute value',10,'view_productattributevalue'),(41,'Can add manufacturers',11,'add_manufacturers'),(42,'Can change manufacturers',11,'change_manufacturers'),(43,'Can delete manufacturers',11,'delete_manufacturers'),(44,'Can view manufacturers',11,'view_manufacturers'),(45,'Can add discount item',12,'add_discountitem'),(46,'Can change discount item',12,'change_discountitem'),(47,'Can delete discount item',12,'delete_discountitem'),(48,'Can view discount item',12,'view_discountitem'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add payment service',14,'add_paymentservice'),(54,'Can change payment service',14,'change_paymentservice'),(55,'Can delete payment service',14,'delete_paymentservice'),(56,'Can view payment service',14,'view_paymentservice'),(57,'Can add order detail',15,'add_orderdetail'),(58,'Can change order detail',15,'change_orderdetail'),(59,'Can delete order detail',15,'delete_orderdetail'),(60,'Can view order detail',15,'view_orderdetail'),(61,'Can add cart item',16,'add_cartitem'),(62,'Can change cart item',16,'change_cartitem'),(63,'Can delete cart item',16,'delete_cartitem'),(64,'Can view cart item',16,'view_cartitem'),(65,'Can add cart',17,'add_cart'),(66,'Can change cart',17,'change_cart'),(67,'Can delete cart',17,'delete_cart'),(68,'Can view cart',17,'view_cart'),(69,'Can add order',18,'add_order'),(70,'Can change order',18,'change_order'),(71,'Can delete order',18,'delete_order'),(72,'Can view order',18,'view_order'),(73,'Can add ship service',19,'add_shipservice'),(74,'Can change ship service',19,'change_shipservice'),(75,'Can delete ship service',19,'delete_shipservice'),(76,'Can view ship service',19,'view_shipservice'),(77,'Can add customer',20,'add_customer'),(78,'Can change customer',20,'change_customer'),(79,'Can delete customer',20,'delete_customer'),(80,'Can view customer',20,'view_customer'),(81,'Can add tel number',21,'add_telnumber'),(82,'Can change tel number',21,'change_telnumber'),(83,'Can delete tel number',21,'delete_telnumber'),(84,'Can view tel number',21,'view_telnumber'),(85,'Can add ship address',22,'add_shipaddress'),(86,'Can change ship address',22,'change_shipaddress'),(87,'Can delete ship address',22,'delete_shipaddress'),(88,'Can view ship address',22,'view_shipaddress');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$9ONlHM8W4Fjv$hmqQYZEWs1Gll9Nw/jX+6Yg/GNSma3LCDNI2QFOx6hU=','2020-10-13 14:21:28.000000',0,'admin','','','datzach31@gmail.com',1,1,'2020-10-10 17:32:59.000000'),(2,'pbkdf2_sha256$216000$6HW5gPENutmv$WaLVuuJwttPyB3KnF/sogGgiSCF+h3gB8EqtzykIU0g=','2020-10-13 14:21:18.721031',0,'nbdat22','','','',1,1,'2020-10-13 04:02:29.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,1),(4,1,2),(5,1,3),(1,2,1),(2,2,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customer`
--

LOCK TABLES `customer_customer` WRITE;
/*!40000 ALTER TABLE `customer_customer` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shipaddress`
--

LOCK TABLES `customer_shipaddress` WRITE;
/*!40000 ALTER TABLE `customer_shipaddress` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_telnumber`
--

LOCK TABLES `customer_telnumber` WRITE;
/*!40000 ALTER TABLE `customer_telnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_telnumber` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-10-13 03:53:33.553438','1','Nhân viên kho',1,'[{\"added\": {}}]',3,1),(2,'2020-10-13 04:02:30.187133','2','nbdat22',1,'[{\"added\": {}}]',4,1),(3,'2020-10-13 04:03:19.937908','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(4,'2020-10-13 04:03:29.838790','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(5,'2020-10-13 04:06:20.596904','1','Nhân viên kho',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(6,'2020-10-13 04:09:26.984838','2','Nhân viên thống kê đơn',1,'[{\"added\": {}}]',3,1),(7,'2020-10-13 14:15:17.957408','2','nbdat22',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(8,'2020-10-13 14:20:07.077018','3','Nhân viên nhân sự',1,'[{\"added\": {}}]',3,1),(9,'2020-10-13 14:20:35.075940','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\", \"Groups\"]}}]',4,1),(10,'2020-10-13 14:21:35.869819','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(11,'2020-10-13 14:21:58.699707','3','Nhân viên nhân sự',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(12,'2020-10-13 14:22:12.149405','1','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(13,'2020-10-13 14:35:15.504992','1','Laptop',1,'[{\"added\": {}}]',9,1),(14,'2020-10-13 14:35:33.188341','2','Màn hình',1,'[{\"added\": {}}]',9,1),(15,'2020-10-13 14:35:42.687858','3','Bàn phím',1,'[{\"added\": {}}]',9,1),(16,'2020-10-13 14:35:47.066912','4','Chuột',1,'[{\"added\": {}}]',9,1),(17,'2020-10-13 14:35:57.468946','5','Tai nghe',1,'[{\"added\": {}}]',9,1),(18,'2020-10-13 14:36:38.918509','1','Asus',1,'[{\"added\": {}}]',11,1),(19,'2020-10-13 14:36:52.241434','2','Dell',1,'[{\"added\": {}}]',11,1),(20,'2020-10-13 14:36:56.128654','3','HP',1,'[{\"added\": {}}]',11,1),(21,'2020-10-13 14:56:48.410413','1','Thông số màn hình',1,'[{\"added\": {}}]',8,1),(22,'2020-10-13 14:57:14.973785','2','CPU',1,'[{\"added\": {}}]',8,1),(23,'2020-10-13 14:57:44.767062','3','Ram',1,'[{\"added\": {}}]',8,1),(24,'2020-10-13 14:58:00.599270','4','Ổ cứng',1,'[{\"added\": {}}]',8,1),(25,'2020-10-13 14:58:20.945735','5','Pin',1,'[{\"added\": {}}]',8,1),(26,'2020-10-13 14:58:53.461498','6','Ảnh',1,'[{\"added\": {}}]',8,1),(27,'2020-10-13 15:00:54.873055','1','ROG Zephyrus M GU502GU AZ090T',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS, 100% sRGB, 240Hz, 3ms, 300nits, Pantone\\u00ae Validated, NanoEdge\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7-9750H 2.6GHz up to 4.5GHz 12MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16GB DDR4 2666MHz Onboard (1x SO-DIMM socket, up to 32GB SDRAM)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"512GB SSD PCIE G3X4 (Support RAID 0) (2 slots)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 Cell 76WHr\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/og-zephyrus-m-laptop_gaming_asus_rog_zephyrus_s_gu502gu_az089t-black-2_3cea5ec698d14abe944331a246bcac4e.jpg\"}}]',13,1),(28,'2020-10-13 15:04:02.845780','2','Asus ROG Strix SCAR 15 G532L VAZ044T',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7-10875H 2.3GHz up to 5.1GHz 16MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1TB SSD PCIE G3X4 (3 slot)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS Non-Glare, NanoEdge, 100% sRGB, 300nits, 240Hz/3ms\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 Cell 66WHrs\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/r-15-g532l-vaz044t-i7-10875h_2_30905bbaa46845a2a0acca89e98e4eb9_grande_44248586cdba41eb8082d31af6051093.jpg\"}}]',13,1),(29,'2020-10-13 15:04:49.702540','1','Asus ROG Zephyrus M GU502GU AZ090T',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',13,1),(30,'2020-10-13 15:06:36.527353','3','Dell G3 Inspiron 3590 N5I5517W',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i5-9300H 2.4GHz up to 4.1GHz 8MB\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"2 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"256GB SSD M.2 PCIE\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" FHD (1920 x 1080) IPS, Anti-Glarec\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3 Cell 56WHr\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://product.hstatic.net/1000026716/product/ll-g3-inspiron-3590-n5i5517w_1_0c916cb24b5e4f328e249eb350768f22_master_3aa6f65982af408b913ab1f85f0f3b40.jpg\"}}]',13,1),(31,'2020-10-13 15:09:01.273002','4','Dell Inspiron G5 5590 N5590 4F4Y41',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7 9750Hc\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"Intel Core i7 9750H\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"256GB SSD M.2 NVMe / 1TB HDD 5400RPM\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" IPS (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 cell 60 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"lh3.googleusercontent.com/LrhiDvauO8bqfTdGPoZ6uCIPtOmUCmpkzQ81ZeEFcXHklSDlNuXrbEy2WRAQ-V-c139mkJRD4l6gSGBQBFU=w1000-rw\"}}]',13,1),(32,'2020-10-13 15:11:48.604497','5','HP ENVY 13-aq1057TX',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"HP ENVY 13-aq1057TX\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 8GB Onboard DDR4 2400MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"512GB SSD M.2 NVMe\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"13.3\\\" IPS (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"4 cell 53 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/Mrj88XkDCITkh1iUfEE9kgALjHsvESvU0Irje4tAtzCiEYiMwT_RhpHpD3m1-3AR_s04sZcKbGAD6ae2Xydn=w1000-rw\"}}]',13,1),(33,'2020-10-13 15:13:52.722750','6','HP Pavilion 15-cs3008TU',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"HP Pavilion 15-cs3008TU\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"1 x 4GB DDR4 2666MHz\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"15.6\\\" (1920 x 1080)\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"3 cell 41 Wh Pin li\\u1ec1n\"}}, {\"added\": {\"name\": \"product attribute value\", \"object\": \"https://lh3.googleusercontent.com/gObfRF8xddJDDREli44AS77pfc9-DsYpdICgNj4IecqNDIlhv2uhHcBVdXQAKSZiKwAD6LzOju6NsmGF_w=w1000-rw\"}}]',13,1),(34,'2020-10-13 16:18:26.040851','6','msi',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'customer','customer'),(22,'customer','shipaddress'),(21,'customer','telnumber'),(17,'order','cart'),(16,'order','cartitem'),(18,'order','order'),(15,'order','orderdetail'),(14,'order','paymentservice'),(19,'order','shipservice'),(9,'product','category'),(7,'product','discount'),(12,'product','discountitem'),(11,'product','manufacturers'),(13,'product','product'),(8,'product','productattribute'),(10,'product','productattributevalue'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-10 15:06:07.791779'),(2,'auth','0001_initial','2020-10-10 15:06:08.136303'),(3,'admin','0001_initial','2020-10-10 15:06:09.126429'),(4,'admin','0002_logentry_remove_auto_add','2020-10-10 15:06:09.313547'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-10 15:06:09.322570'),(6,'contenttypes','0002_remove_content_type_name','2020-10-10 15:06:09.459979'),(7,'auth','0002_alter_permission_name_max_length','2020-10-10 15:06:09.548743'),(8,'auth','0003_alter_user_email_max_length','2020-10-10 15:06:09.570798'),(9,'auth','0004_alter_user_username_opts','2020-10-10 15:06:09.578748'),(10,'auth','0005_alter_user_last_login_null','2020-10-10 15:06:09.663291'),(11,'auth','0006_require_contenttypes_0002','2020-10-10 15:06:09.667185'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-10 15:06:09.675456'),(13,'auth','0008_alter_user_username_max_length','2020-10-10 15:06:09.886511'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-10 15:06:10.060073'),(15,'auth','0010_alter_group_name_max_length','2020-10-10 15:06:10.078844'),(16,'auth','0011_update_proxy_permissions','2020-10-10 15:06:10.087177'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-10 15:06:10.194888'),(18,'sessions','0001_initial','2020-10-10 15:06:10.228734'),(19,'customer','0001_initial','2020-10-10 17:32:09.451897'),(20,'product','0001_initial','2020-10-10 17:32:09.891227'),(21,'order','0001_initial','2020-10-10 17:32:10.991979'),(22,'order','0002_auto_20201011_0044','2020-10-10 17:44:31.208494'),(23,'product','0002_auto_20201011_0044','2020-10-10 17:44:31.214533'),(24,'order','0003_auto_20201012_1006','2020-10-12 03:06:52.507471'),(25,'product','0003_auto_20201012_1006','2020-10-12 03:06:52.625520'),(26,'order','0004_auto_20201013_2325','2020-10-13 16:25:20.362587'),(27,'product','0004_auto_20201013_2325','2020-10-13 16:25:20.370524');
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
INSERT INTO `django_session` VALUES ('mel31wyvixn81n0vkisn9l7umof8a4fi','.eJxVjEEOwiAQRe_C2pCBAqUu3fcMZDoMUjU0Ke3KeHdp0oVu33v_v0XAfcthr7yGOYqrUOLyyyakJ5dDxAeW-yJpKds6T_JI5GmrHJfIr9vZ_h1krLmtNQ1eARlib5KlARBiDxrZWwsqNeV671EntuyUIhMbBuo0WA2dc-LzBc-HNsM:1kSLBA:FAa3zfCf3LsXanZwwSsgXD0oka-nw6W-PGlhivn1zZc','2020-10-27 14:21:28.198056');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cart`
--

LOCK TABLES `order_cart` WRITE;
/*!40000 ALTER TABLE `order_cart` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `order_cartitem_cart_id_9b4c287a_fk_order_cart_id` (`cart_id`),
  KEY `order_cartitem_product_id_ad323e40_fk_product_product_id` (`product_id`),
  CONSTRAINT `order_cartitem_cart_id_9b4c287a_fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `order_cart` (`id`),
  CONSTRAINT `order_cartitem_product_id_ad323e40_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  PRIMARY KEY (`id`),
  KEY `order_order_payment_type_id_93f93be0_fk_order_paymentservice_id` (`payment_type_id`),
  KEY `order_order_ship_by_id_fe47631c_fk_order_shipservice_id` (`ship_by_id`),
  KEY `order_order_ship_to_id_b22407ea_fk_customer_shipaddress_id` (`ship_to_id`),
  KEY `order_order_customer_id_5bbbd957_fk_customer_customer_id` (`customer_id`),
  CONSTRAINT `order_order_customer_id_5bbbd957_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `order_order_payment_type_id_93f93be0_fk_order_paymentservice_id` FOREIGN KEY (`payment_type_id`) REFERENCES `order_paymentservice` (`id`),
  CONSTRAINT `order_order_ship_by_id_fe47631c_fk_order_shipservice_id` FOREIGN KEY (`ship_by_id`) REFERENCES `order_shipservice` (`id`),
  CONSTRAINT `order_order_ship_to_id_b22407ea_fk_customer_shipaddress_id` FOREIGN KEY (`ship_to_id`) REFERENCES `customer_shipaddress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,NULL,NULL,NULL,0,'2020-10-13 00:00:00.000000','Done',NULL,NULL,NULL,NULL,NULL);
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
  `discount_code` varchar(30) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdetail_order_id_2c6526df_fk_order_order_id` (`order_id`),
  KEY `order_orderdetail_product_id_76983dc0_fk_product_product_id` (`product_id`),
  CONSTRAINT `order_orderdetail_order_id_2c6526df_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_orderdetail_product_id_76983dc0_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdetail`
--

LOCK TABLES `order_orderdetail` WRITE;
/*!40000 ALTER TABLE `order_orderdetail` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentservice`
--

LOCK TABLES `order_paymentservice` WRITE;
/*!40000 ALTER TABLE `order_paymentservice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipservice`
--

LOCK TABLES `order_shipservice` WRITE;
/*!40000 ALTER TABLE `order_shipservice` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Laptop',NULL,NULL),(2,'Màn hình',NULL,NULL),(3,'Bàn phím',NULL,NULL),(4,'Chuột',NULL,NULL),(5,'Tai nghe',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discount`
--

LOCK TABLES `product_discount` WRITE;
/*!40000 ALTER TABLE `product_discount` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discountitem`
--

LOCK TABLES `product_discountitem` WRITE;
/*!40000 ALTER TABLE `product_discountitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_discountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacturers`
--

DROP TABLE IF EXISTS `product_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacturers`
--

LOCK TABLES `product_manufacturers` WRITE;
/*!40000 ALTER TABLE `product_manufacturers` DISABLE KEYS */;
INSERT INTO `product_manufacturers` VALUES (1,'Asus',NULL),(2,'Dell',NULL),(3,'HP',NULL);
/*!40000 ALTER TABLE `product_manufacturers` ENABLE KEYS */;
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
  `manufacturers_id` int DEFAULT NULL,
  `unit_in_stock` int,
  PRIMARY KEY (`id`),
  KEY `product_product_category_id_0c725779_fk_product_category_id` (`category_id`),
  KEY `product_product_manufacturers_id_e1298339_fk_product_m` (`manufacturers_id`),
  CONSTRAINT `product_product_category_id_0c725779_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_product_manufacturers_id_e1298339_fk_product_m` FOREIGN KEY (`manufacturers_id`) REFERENCES `product_manufacturers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'Asus ROG Zephyrus M GU502GU AZ090T',32990000,0,1,NULL,1,1,20),(2,'Asus ROG Strix SCAR 15 G532L VAZ044T',44990000,0,1,NULL,1,1,15),(3,'Dell G3 Inspiron 3590 N5I5517W',22990000,0,1,NULL,1,2,30),(4,'Dell Inspiron G5 5590 N5590 4F4Y41',34990000,0,1,NULL,1,2,18),(5,'HP ENVY 13-aq1057TX',29690000,0,1,NULL,1,3,23),(6,'HP Pavilion 15-cs3008TU',13490000,0,1,NULL,1,3,24);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productattribute`
--

LOCK TABLES `product_productattribute` WRITE;
/*!40000 ALTER TABLE `product_productattribute` DISABLE KEYS */;
INSERT INTO `product_productattribute` VALUES (1,'Thông số màn hình',NULL),(2,'CPU',NULL),(3,'Ram',NULL),(4,'Ổ cứng',NULL),(5,'Pin',NULL),(6,'Ảnh',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productattributevalue`
--

LOCK TABLES `product_productattributevalue` WRITE;
/*!40000 ALTER TABLE `product_productattributevalue` DISABLE KEYS */;
INSERT INTO `product_productattributevalue` VALUES (1,'15.6\" FHD (1920 x 1080) IPS, 100% sRGB, 240Hz, 3ms, 300nits, Pantone® Validated, NanoEdge',1,1),(2,'Intel Core i7-9750H 2.6GHz up to 4.5GHz 12MB',1,2),(3,'16GB DDR4 2666MHz Onboard (1x SO-DIMM socket, up to 32GB SDRAM)',1,3),(4,'512GB SSD PCIE G3X4 (Support RAID 0) (2 slots)',1,4),(5,'4 Cell 76WHr',1,5),(6,'https://product.hstatic.net/1000026716/product/og-zephyrus-m-laptop_gaming_asus_rog_zephyrus_s_gu502gu_az089t-black-2_3cea5ec698d14abe944331a246bcac4e.jpg',1,6),(7,'Intel Core i7-10875H 2.3GHz up to 5.1GHz 16MB',2,2),(8,'16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',2,3),(9,'1TB SSD PCIE G3X4 (3 slot)',2,4),(10,'15.6\" FHD (1920 x 1080) IPS Non-Glare, NanoEdge, 100% sRGB, 300nits, 240Hz/3ms',2,1),(11,'4 Cell 66WHrs',2,5),(12,'https://product.hstatic.net/1000026716/product/r-15-g532l-vaz044t-i7-10875h_2_30905bbaa46845a2a0acca89e98e4eb9_grande_44248586cdba41eb8082d31af6051093.jpg',2,6),(13,'Intel Core i5-9300H 2.4GHz up to 4.1GHz 8MB',3,2),(14,'2 x 4GB DDR4 2666MHz',3,3),(15,'256GB SSD M.2 PCIE',3,4),(16,'15.6\" FHD (1920 x 1080) IPS, Anti-Glarec',3,1),(17,'3 Cell 56WHr',3,5),(18,'https://product.hstatic.net/1000026716/product/ll-g3-inspiron-3590-n5i5517w_1_0c916cb24b5e4f328e249eb350768f22_master_3aa6f65982af408b913ab1f85f0f3b40.jpg',3,6),(19,'Intel Core i7 9750Hc',4,2),(20,'Intel Core i7 9750H',4,3),(21,'256GB SSD M.2 NVMe / 1TB HDD 5400RPM',4,4),(22,'15.6\" IPS (1920 x 1080)',4,1),(23,'4 cell 60 Wh Pin liền',4,5),(24,'lh3.googleusercontent.com/LrhiDvauO8bqfTdGPoZ6uCIPtOmUCmpkzQ81ZeEFcXHklSDlNuXrbEy2WRAQ-V-c139mkJRD4l6gSGBQBFU=w1000-rw',4,6),(25,'HP ENVY 13-aq1057TX',5,2),(26,'1 x 8GB Onboard DDR4 2400MHz',5,3),(27,'512GB SSD M.2 NVMe',5,4),(28,'13.3\" IPS (1920 x 1080)',5,1),(29,'4 cell 53 Wh Pin liền',5,5),(30,'https://lh3.googleusercontent.com/Mrj88XkDCITkh1iUfEE9kgALjHsvESvU0Irje4tAtzCiEYiMwT_RhpHpD3m1-3AR_s04sZcKbGAD6ae2Xydn=w1000-rw',5,6),(31,'HP Pavilion 15-cs3008TU',6,2),(32,'1 x 4GB DDR4 2666MHz',6,3),(33,'1 x 4GB DDR4 2666MHz',6,4),(34,'15.6\" (1920 x 1080)',6,1),(35,'3 cell 41 Wh Pin liền',6,5),(36,'https://lh3.googleusercontent.com/gObfRF8xddJDDREli44AS77pfc9-DsYpdICgNj4IecqNDIlhv2uhHcBVdXQAKSZiKwAD6LzOju6NsmGF_w=w1000-rw',6,6);
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

-- Dump completed on 2020-10-18 10:06:23
