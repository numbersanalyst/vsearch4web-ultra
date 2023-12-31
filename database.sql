-- MariaDB dump 10.19-11.2.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: vsearchlogDB
-- ------------------------------------------------------
-- Server version	11.2.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `vsearchlogDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vsearchlogdb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `vsearchlogDB`;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT current_timestamp(),
  `phrase` varchar(128) NOT NULL,
  `letters` varchar(32) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `browser_string` varchar(256) NOT NULL,
  `results` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES
(1,'2023-09-18 21:00:01','Hello World!','eloy','127.0.0.1','Safari/537.36','{\'e\': 1, \'l\': 3, \'o\': 2}'),
(2,'2023-09-19 08:35:42','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','inusxqrb','127.0.0.1','Safari/537.36','{\'i\': 6, \'n\': 2, \'u\': 2, \'s\': 4, \'r\': 3}'),
(3,'2023-09-19 08:35:53','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','insxqrb','127.0.0.1','Safari/537.36','{\'i\': 6, \'n\': 2, \'s\': 4, \'r\': 3}'),
(4,'2023-09-19 08:37:27','paranoiczny android','aeiou','127.0.0.1','Safari/537.36','{\'a\': 3, \'i\': 2, \'o\': 2}'),
(5,'2023-09-19 08:42:35','She sometimes looks at her grandmother\'s picture.','aeiou','127.0.0.1','Safari/537.36','{\'a\': 2, \'e\': 6, \'i\': 2, \'o\': 4, \'u\': 1}'),
(6,'2023-09-19 20:03:38','If you do not tell the truth about yourself you cannot tell it about other people.','dsa','127.0.0.1','Safari/537.36','{\'d\': 1, \'s\': 1, \'a\': 3}'),
(7,'2023-09-19 20:04:15','Strong lives are motivated by dynamic purposes.','okuymnS','127.0.0.1','Safari/537.36','{\'o\': 3, \'u\': 1, \'y\': 2, \'m\': 2, \'n\': 2, \'S\': 1}'),
(8,'2023-09-19 20:13:21','Strong lives are motivated by dynamic purposes.','okuymnS','127.0.0.1','Safari/537.36','{\'o\': 3, \'u\': 1, \'y\': 2, \'m\': 2, \'n\': 2, \'s\': 4}');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 22:52:56
