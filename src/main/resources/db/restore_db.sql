DROP SCHEMA IF EXISTS db_example;
CREATE SCHEMA db_example DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
drop user IF EXISTS 'springuser'@'%';
create user 'springuser'@'%' identified by 'ThePassword'; -- Creates the user
grant all on db_example.* to 'springuser'@'%';  -- Gives all privileges to the new user on the newly created database
USE db_example;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_example
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FKekew2gjlccdp7hclyyfp8s0l5` (`product_id`),
  KEY `FKfp7yinn3dh4sy1ia364xp3d9g` (`user_id`),
  CONSTRAINT `FKekew2gjlccdp7hclyyfp8s0l5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKfp7yinn3dh4sy1ia364xp3d9g` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (2,1,1),(3,5,1);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (6),(6),(6);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptop` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `hd` double DEFAULT NULL,
  `screen` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `model_idx` (`model`),
  CONSTRAINT `fk_laptop_model-product_model` FOREIGN KEY (`model`) REFERENCES `product` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES (1,'1297',350,32,4,11,700),(2,'1321',500,64,8,12,970),(3,'1750',750,128,12,14,1200),(4,'1298',600,64,10,15,1050),(5,'1752',750,128,10,14,1150),(6,'1299',450,64,10,12,950);
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `hd` double DEFAULT NULL,
  `cd` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `idpc_UNIQUE` (`code`),
  KEY `fk_pc_model-product_model_idx` (`model`),
  CONSTRAINT `fk_pc_model-product_model` FOREIGN KEY (`model`) REFERENCES `product` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
INSERT INTO `pc` VALUES (2,'1232',500,64,5,'12x',600),(3,'1260',500,32,10,'12x',350),(4,'1237',900,128,40,'40x',980),(5,'1238',800,128,20,'50x',970),(6,'1121',750,128,14,'40x',850),(7,'1239',500,64,5,'12x',600),(8,'1122',600,128,14,'40x',850),(9,'1123',600,128,8,'40x',850),(10,'1233',750,128,20,'50x',950),(11,'1234',500,32,10,'12x',400),(12,'1235',450,64,8,'24x',350),(13,'1236',450,32,10,'24x',350);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(1) DEFAULT NULL,
  `print_type` varchar(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `model_idx` (`model`),
  CONSTRAINT `fk_print_model-product_model` FOREIGN KEY (`model`) REFERENCES `product` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer`
--

LOCK TABLES `printer` WRITE;
/*!40000 ALTER TABLE `printer` DISABLE KEYS */;
INSERT INTO `printer` VALUES (1,'1276','n','Laser',400),(2,'1433','y','Jet',270),(3,'1434','y','Jet',290),(4,'1401','n','Matrix',150),(5,'1408','n','Matrix',270),(6,'1288','n','Laser',400);
/*!40000 ALTER TABLE `printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `maker` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `model_UNIQUE` (`model`),
  KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'smartphone1.jpg','smartphone','Xiaomi Redmi GO 8Gb Black','F'),(2,'smartphone2.jpg','smartphone','Apple iPhone XS MAX 256GB Space Gray','F'),(3,'smartphone3.jpg','smartphone','Samsung Galaxy S10 8/128','F'),(4,'tv1.jpg','tv','Samsung PS-50C530C1W','F'),(5,'tv2.jpg','tv','Asano 40LF1010T','F'),(6,'tv3.jpg','tv','LG 65UU661H','F'),(7,'notebook1.jpg','notebook','Toshiba L20-100 Intel Pentium M740','F'),(8,'notebook2.jpg','notebook','Lenovo IdeaPad 530S-14IKB 81EU00BBRU Copper','F'),(9,'stone1.jpg','stone','it is just a stone','F'),(10,NULL,'PC','1232','A'),(11,NULL,'PC','1233','A'),(12,NULL,'Printer','1276','A'),(13,NULL,'Laptop','1298','A'),(14,NULL,'Printer','1401','A'),(15,NULL,'Printer','1408','A'),(16,NULL,'Laptop','1752','A'),(17,NULL,'PC','1121','B'),(18,NULL,'Laptop','1750','B'),(19,NULL,'Laptop','1321','C'),(20,NULL,'Printer','1288','D'),(21,NULL,'Printer','1433','D'),(22,NULL,'PC','1260','E'),(23,NULL,'Printer','1434','E'),(24,NULL,'PC','2112','E'),(25,NULL,'PC','2113','E'),(26,NULL,'Laptop','1297','G'),(27,NULL,'Laptop','1299','G'),(28,NULL,'PC','1122','G'),(29,NULL,'PC','1123','G'),(30,NULL,'PC','1234','G'),(31,NULL,'PC','1235','G'),(32,NULL,'PC','1236','G'),(33,NULL,'PC','1237','G'),(34,NULL,'PC','1238','G'),(35,NULL,'PC','1239','G');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'p1','user1'),(5,'p2','user2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-09  0:45:23
