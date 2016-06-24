-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: pokes_db
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `poked_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`user_id`),
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (1,1,9),(2,1,9),(3,2,9),(4,2,9),(5,3,9),(6,3,9),(7,4,9),(8,4,9),(9,4,9),(10,4,9),(11,4,9),(12,5,9),(13,6,5),(14,6,5),(15,6,5),(16,8,5),(17,8,5),(18,1,5),(19,1,5),(20,1,7),(21,1,7),(22,7,1),(23,7,1),(24,7,1),(25,9,1),(26,9,1),(27,9,1),(28,9,1),(29,9,1),(30,7,9),(31,7,9),(32,5,9),(33,5,9),(34,3,10),(35,4,10),(36,5,10),(37,7,10),(38,6,10),(39,8,10),(40,9,10),(41,11,10),(42,11,10),(43,1,11),(44,4,11),(45,5,11),(46,9,11),(47,10,11),(48,10,11),(49,10,11),(50,10,11),(51,10,11),(52,8,11);
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pw` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `poked` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nicole zhou','nicole','nicole@gmail.com','$2b$12$AdOHqN/BPEBs6w0hU.fg8u160Q0KRCiyF.Cnw1sWtZHfbNnXKoUHe','2016-06-15 00:00:00','7','2016-06-24 11:24:42','2016-06-24 11:24:42'),(2,'dasd','sdsada','dos@g.com','$2b$12$E5QhwmsbQXGY7Z9zEswjYecBmAgsebf/suQ96Ou5LWzSij0E/UvnW','2016-06-14 00:00:00','2','2016-06-24 11:25:52','2016-06-24 11:25:52'),(3,'kjjj','jkkj','lol@g.com','$2b$12$k3kKfYyoKZK42S3i2igqLOUx0OrXEUoRdxrtqD8rwilZEosjx53VW','2016-06-21 00:00:00','3','2016-06-24 11:29:54','2016-06-24 11:29:54'),(4,'llil','ili','lil@g.com','$2b$12$/zoRzdyHkUlMqvXNfn/3GuzfppHr5LaaCXNYyb1LJnIeRKra1SlEa','2016-06-22 00:00:00','7','2016-06-24 11:33:47','2016-06-24 11:33:47'),(5,'ed dao','ed','ed@g.com','$2b$12$xBa9uU/WTmQt0etW9CxmtO0RDP.j2iilZE7FfSkeTiQIjlsIl3W62','2016-06-08 00:00:00','5','2016-06-24 11:39:36','2016-06-24 11:39:36'),(6,'pdf','sdfdsffdfd','dfd@g.com','$2b$12$AockuyP/QpnXlDHsoALvZ.Mm3CSg.W8.0RU.nfUsTcKO2PRS0udjy','2016-06-14 00:00:00','4','2016-06-24 11:42:04','2016-06-24 11:42:04'),(7,'neha','neha','neha@g.com','$2b$12$FNDFgTw8jN0cunz9XOPw5uZUZaGJNRhj8I2uCcHZHmh2q2qWQTQ5S','2016-06-06 00:00:00','6','2016-06-24 11:51:53','2016-06-24 11:51:53'),(8,'sdsadsad','fgfdgfd','dfsadf@g.com','$2b$12$svw.boVv6bl0tvTAjfdSH.A0aQ9rUHUw4Z5z2WisSzqThKRVRiXk2','2016-06-06 00:00:00','4','2016-06-24 11:52:40','2016-06-24 11:52:40'),(9,'cd dao','cd','cd@g.com','$2b$12$BDMaoRhtWBQ4Gfql9HIsv.p22LeSerK3qtHBPCfSgRWmr3ktkhPiC','2016-06-07 00:00:00','7','2016-06-24 12:16:49','2016-06-24 12:16:49'),(10,'bana zhou','bana','bana@g.com','$2b$12$vjLKfvgyb.RqHsUuAzOAl.vdTi/viiRQxdAQYkP5HkqE72xBvT9by','2015-12-15 00:00:00','5','2016-06-24 12:28:17','2016-06-24 12:28:17'),(11,'apple zhou','apple','apple@g.com','$2b$12$qJPoPyChTkioEwanKqLw/u/N1O01RIEa4ai593TaM5sj3XBRKyfkO','2014-08-10 00:00:00','2','2016-06-24 12:28:57','2016-06-24 12:28:57');
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

-- Dump completed on 2016-06-24 12:35:41
