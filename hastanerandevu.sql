-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hastanerandevu
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `hastalar`
--

DROP TABLE IF EXISTS `hastalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hastalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adsoyad` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `tckimlik` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `dogumtarihi` datetime NOT NULL,
  `email` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `tel` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `cinsiyet` varchar(2) COLLATE utf8_turkish_ci NOT NULL,
  `adres` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `parola_hash` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastalar`
--

LOCK TABLES `hastalar` WRITE;
/*!40000 ALTER TABLE `hastalar` DISABLE KEYS */;
INSERT INTO `hastalar` VALUES (1,'Aykut Önal','17768202508','1994-04-06 00:00:00','aykutonall@gmail.com','05376266031','E','Günal Sokak No:11 D:5 Kağıthane/ISTANBUL','$2a$13$E9vMHM9gxea8y99zuGhs3OMzXylDTcy1c2ZOdZzh8V9cGSYDFw6Fi');
/*!40000 ALTER TABLE `hastalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastaneler`
--

DROP TABLE IF EXISTS `hastaneler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hastaneler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ilceid` int(11) NOT NULL,
  `hastaneadi` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hastaneler_ilceid_ilceler_id` (`ilceid`),
  CONSTRAINT `FK_hastaneler_ilceid_ilceler_id` FOREIGN KEY (`ilceid`) REFERENCES `ilceler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastaneler`
--

LOCK TABLES `hastaneler` WRITE;
/*!40000 ALTER TABLE `hastaneler` DISABLE KEYS */;
INSERT INTO `hastaneler` VALUES (1,1,'Okmeydanı SSK'),(2,1,'Şişli Etfal'),(3,1,'Cerrahpaşa Tıp'),(4,1,'Çapa Tıp'),(5,3,'Sivas Numune Hastanesi'),(6,3,'Tıp Fakültesi');
/*!40000 ALTER TABLE `hastaneler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hekimler`
--

DROP TABLE IF EXISTS `hekimler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hekimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hastaneid` int(11) NOT NULL,
  `klinikid` int(11) NOT NULL,
  `hekimadi` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hekimler`
--

LOCK TABLES `hekimler` WRITE;
/*!40000 ALTER TABLE `hekimler` DISABLE KEYS */;
INSERT INTO `hekimler` VALUES (1,1,1,'Dr. Mehmet Öz','$2a$13$nCAwfVe4xJ.GaqQ/3kuu5Oo/LjS8VPYgx0N4oDlXpfUCD5uPcEQGK','mehmetoz@hotmail.com'),(2,5,5,'Dr. Cemal Metin','$2a$13$3ab9bhUsnvqeGqrMzyxWDuoBG.riiEiMcv6vCQLV8CWQ2w9sU.18m','cemalmetin@hotmail.com');
/*!40000 ALTER TABLE `hekimler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilceler`
--

DROP TABLE IF EXISTS `ilceler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ilceler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ilid` int(11) NOT NULL,
  `ilceadi` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilceler`
--

LOCK TABLES `ilceler` WRITE;
/*!40000 ALTER TABLE `ilceler` DISABLE KEYS */;
INSERT INTO `ilceler` VALUES (1,1,'Şişli'),(2,2,'Merkez'),(3,5,'Merkez');
/*!40000 ALTER TABLE `ilceler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iller`
--

DROP TABLE IF EXISTS `iller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iladi` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iller`
--

LOCK TABLES `iller` WRITE;
/*!40000 ALTER TABLE `iller` DISABLE KEYS */;
INSERT INTO `iller` VALUES (1,'İstanbul'),(2,'Ankara'),(3,'İzmir'),(4,'Antalya'),(5,'Sivas'),(6,'Giresun');
/*!40000 ALTER TABLE `iller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klinikler`
--

DROP TABLE IF EXISTS `klinikler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klinikler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klinikadi` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klinikler`
--

LOCK TABLES `klinikler` WRITE;
/*!40000 ALTER TABLE `klinikler` DISABLE KEYS */;
INSERT INTO `klinikler` VALUES (1,'Dahiliye'),(2,'KBB'),(3,'Göz'),(4,'Nefroloji'),(5,'Psikiyatri');
/*!40000 ALTER TABLE `klinikler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevular`
--

DROP TABLE IF EXISTS `randevular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `randevular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hastaid` int(11) NOT NULL,
  `hekimid` int(11) NOT NULL,
  `klinikid` int(11) NOT NULL,
  `saat` int(11) NOT NULL,
  `tarih` datetime NOT NULL,
  `randevudurumu` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_randevular_hastaid_hastalar_id` (`hastaid`),
  KEY `FK_randevular_hekimid_hekimler_id` (`hekimid`),
  KEY `FK_randevular_klinikid_klinikler_id` (`klinikid`),
  CONSTRAINT `FK_randevular_hastaid_hastalar_id` FOREIGN KEY (`hastaid`) REFERENCES `hastalar` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_randevular_hekimid_hekimler_id` FOREIGN KEY (`hekimid`) REFERENCES `hekimler` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_randevular_klinikid_klinikler_id` FOREIGN KEY (`klinikid`) REFERENCES `klinikler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevular`
--

LOCK TABLES `randevular` WRITE;
/*!40000 ALTER TABLE `randevular` DISABLE KEYS */;
/*!40000 ALTER TABLE `randevular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saatler`
--

DROP TABLE IF EXISTS `saatler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saatler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hekimid` int(11) NOT NULL,
  `bossaat` int(11) NOT NULL,
  `dolusaat` int(11) NOT NULL,
  `tarih` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_saatler_hekimid_hekimler_id` (`hekimid`),
  CONSTRAINT `FK_saatler_hekimid_hekimler_id` FOREIGN KEY (`hekimid`) REFERENCES `hekimler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saatler`
--

LOCK TABLES `saatler` WRITE;
/*!40000 ALTER TABLE `saatler` DISABLE KEYS */;
/*!40000 ALTER TABLE `saatler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versioninfo`
--

DROP TABLE IF EXISTS `versioninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versioninfo` (
  `Version` bigint(20) NOT NULL,
  `AppliedOn` datetime DEFAULT NULL,
  `Description` varchar(1024) COLLATE utf8_turkish_ci DEFAULT NULL,
  UNIQUE KEY `UC_Version` (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versioninfo`
--

LOCK TABLES `versioninfo` WRITE;
/*!40000 ALTER TABLE `versioninfo` DISABLE KEYS */;
INSERT INTO `versioninfo` VALUES (1,'2018-10-04 19:17:59','_001_Hastalar_Yoneticiler'),(2,'2018-10-04 19:17:59','_002_Hastane_Hekim_Randevu'),(3,'2018-10-04 19:17:59','_003_Hekim_Email_Alani'),(4,'2018-10-04 19:18:00','_004_randevu_tablosu');
/*!40000 ALTER TABLE `versioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yoneticiler`
--

DROP TABLE IF EXISTS `yoneticiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yoneticiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adsoyad` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yoneticiler`
--

LOCK TABLES `yoneticiler` WRITE;
/*!40000 ALTER TABLE `yoneticiler` DISABLE KEYS */;
INSERT INTO `yoneticiler` VALUES (1,'Aykut Önal','aykutonall@gmail.com',1,'$2a$13$SfGPoujNgQrUfi.8UnfZ3e2Lu3zzeigHpDh5Bsneo883nZ45kNkOu');
/*!40000 ALTER TABLE `yoneticiler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-08 11:47:40
