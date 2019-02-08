-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: computerservice
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `computers` (
  `Computer_id` int(11) NOT NULL,
  `Computer_model` varchar(64) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `InDate` date DEFAULT NULL,
  `OutDate` date DEFAULT NULL,
  PRIMARY KEY (`Computer_id`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,'HP Pavilion Gaming 15-cx0010nu 4FM60EA',1,'2019-01-19','2019-01-26'),(2,'Lenovo V330 81AX00DWBM',2,'2019-01-20',NULL),(3,'HP 15 4GZ29EA',3,'2019-01-21','2019-01-25'),(4,'Lenovo Legion Y530 81FV00UWBM',4,'2019-01-22',NULL);
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `Customer_id` int(11) NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Dimitrov','Ivan','dimitrov.i@gmail.com','0883887266'),(2,'Nikolaev','Stanislav','stan.nikolaev','0898372612'),(3,'Kostadinov','Daniel','daniel.kostadinov','0888448921'),(4,'Ivanov','NIkolay','niki.ivanov@gmail.com','0883717365');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic`
--

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diagnostic` (
  `Computer_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Service_order` int(11) NOT NULL,
  `Diagnostic_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Service_order`),
  KEY `Computer_id` (`Computer_id`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `diagnostic_ibfk_1` FOREIGN KEY (`Computer_id`) REFERENCES `computers` (`computer_id`),
  CONSTRAINT `diagnostic_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic`
--

LOCK TABLES `diagnostic` WRITE;
/*!40000 ALTER TABLE `diagnostic` DISABLE KEYS */;
INSERT INTO `diagnostic` VALUES (1,1,1,'RAM-4GB Upgraded'),(3,3,2,'SSD-240GB Added');
/*!40000 ALTER TABLE `diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parts` (
  `Part_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PartName` varchar(64) DEFAULT NULL,
  `Part_price` decimal(10,0) DEFAULT NULL,
  `Part_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES ('1','CPU-i3',100,'CPU'),('10','RAM-8GB',120,'RAM'),('11','RAM-16GB',240,'RAM'),('12','HDD-500GB',80,'HDD'),('13','HDD-750GB',105,'HDD'),('14','HDD-1000GB',135,'HDD'),('15','HDD-1500GB',165,'HDD'),('16','HDD-2000GB',180,'HDD'),('17','SSD-80GB',80,'SSD'),('18','SSD-120GB',105,'SSD'),('19','SSD-200GB',150,'SSD'),('2','CPU-i5',150,'CPU'),('20','SSD-240GB',200,'SSD'),('21','SSD-320GB',290,'SSD'),('22','SSD-500GB',470,'SSD'),('23','SSD-1000GB',700,'SSD'),('3','CPU-i7',200,'CPU'),('4','CPU-i9',250,'CPU'),('5','Motherboard-AsRock',75,'Motherboarb'),('6','Motherboard-ASUS',125,'Motherboarb'),('7','Motherboard-Gigabyte',150,'Motherboarb'),('8','RAM-2GB',40,'RAM'),('9','RAM-4GB',80,'RAM');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `result` (
  `Service_order` int(11) DEFAULT NULL,
  `Computer_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Part_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Add_work` decimal(10,0) DEFAULT NULL,
  `Diagnostic_info` varchar(255) DEFAULT NULL,
  `Total_cost` decimal(10,0) DEFAULT NULL,
  KEY `Service_order` (`Service_order`),
  KEY `Computer_id` (`Computer_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Part_id` (`Part_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`Service_order`) REFERENCES `diagnostic` (`service_order`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`Computer_id`) REFERENCES `computers` (`computer_id`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `result_ibfk_4` FOREIGN KEY (`Part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,1,1,'9',0,'RAM-4GB Upgraded',80),(2,3,3,'20',10,'RAM-4GB Upgraded',210);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'computerservice'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-08 13:09:53
