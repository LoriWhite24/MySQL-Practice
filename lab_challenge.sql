CREATE DATABASE  IF NOT EXISTS `aws` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `aws`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: mydbcluster-instance-1.c24pyeyroo2l.us-west-2.rds.amazonaws.com    Database: aws
-- ------------------------------------------------------
-- Server version	5.7.12

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `cloud_practitioner`
--

DROP TABLE IF EXISTS `cloud_practitioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_practitioner` (
  `cert_id` int(11) NOT NULL AUTO_INCREMENT,
  `cert_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `expir_date` datetime GENERATED ALWAYS AS ((`cert_date` + interval 3 year)) VIRTUAL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`cert_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `cloud_practitioner_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `restart` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_practitioner`
--

LOCK TABLES `cloud_practitioner` WRITE;
/*!40000 ALTER TABLE `cloud_practitioner` DISABLE KEYS */;
INSERT INTO `cloud_practitioner` (`cert_id`, `cert_date`, `student_id`) VALUES (1,'2021-10-28 00:00:00',1),(2,'2021-10-30 00:00:00',2),(3,'2021-11-04 00:00:00',5),(4,'2021-11-08 00:00:00',8),(5,'2021-11-09 00:00:00',11);
/*!40000 ALTER TABLE `cloud_practitioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restart`
--

DROP TABLE IF EXISTS `restart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restart` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `full_name` varchar(47) GENERATED ALWAYS AS (concat(`last_name`,', ',`first_name`)) VIRTUAL,
  `restart_city` varchar(25) NOT NULL,
  `grad_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restart`
--

LOCK TABLES `restart` WRITE;
/*!40000 ALTER TABLE `restart` DISABLE KEYS */;
INSERT INTO `restart` (`student_id`, `first_name`, `last_name`, `restart_city`, `grad_date`) VALUES (1,'Paula','Casey','Durham','2021-08-26 20:06:56'),(2,'Jaida','Santos','Orlando','2021-08-26 20:06:57'),(3,'Lyla','Woodward','Cleveland','2021-08-26 20:06:57'),(4,'Kieran','Mullen','Miami','2021-08-26 20:06:57'),(5,'Mariana','Mcfarland','New York','2021-08-26 20:06:57'),(6,'Helena','Costa','Austin','2021-08-26 20:06:57'),(7,'Nigel','Mcgee','Durham','2021-08-26 20:06:58'),(8,'Bryan','Fields','Orlando','2021-08-26 20:06:58'),(9,'Peyton','Shelton','New York','2021-08-26 20:06:58'),(10,'Seamus','Stewart','New York','2021-08-26 20:06:58'),(11,'Jayvion','Dunn','Austin','2021-08-26 20:06:59'),(12,'Ally','Roberts','Orlando','2021-08-26 20:06:59');
/*!40000 ALTER TABLE `restart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'aws'
--

--
-- Dumping routines for database 'aws'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-26 17:02:28
