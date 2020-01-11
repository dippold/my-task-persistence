-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: taskmng
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `abstractentity`
--

DROP TABLE IF EXISTS `abstractentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abstractentity` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abstractentity`
--

LOCK TABLES `abstractentity` WRITE;
/*!40000 ALTER TABLE `abstractentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `abstractentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actiontype`
--

DROP TABLE IF EXISTS `actiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actiontype` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actiontype`
--

LOCK TABLES `actiontype` WRITE;
/*!40000 ALTER TABLE `actiontype` DISABLE KEYS */;
INSERT INTO `actiontype` VALUES (00000000001,'SignIn'),(00000000002,'SignOut'),(00000000003,'Create'),(00000000004,'Update'),(00000000005,'Delete');
/*!40000 ALTER TABLE `actiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backloggroup`
--

DROP TABLE IF EXISTS `backloggroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backloggroup` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backloggroup_unique01` (`companyId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backloggroup`
--

LOCK TABLES `backloggroup` WRITE;
/*!40000 ALTER TABLE `backloggroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backloggroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backlogitem`
--

DROP TABLE IF EXISTS `backlogitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backlogitem` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `companyAreaId` int(11) unsigned zerofill NOT NULL,
  `statusId` int(11) unsigned zerofill NOT NULL,
  `stakeholderId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `requestDate` date DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `estimatedResources` varchar(255) DEFAULT NULL,
  `estimatedWork` int(11) DEFAULT '0',
  `estimatedDuration` int(11) DEFAULT '0',
  `estimatedCost` int(11) DEFAULT NULL,
  `wishDate` date DEFAULT NULL,
  `plannedDate` date DEFAULT NULL,
  `dateDelivered` date DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `stakeholderConcern` varchar(255) DEFAULT NULL,
  `readyConcept` varchar(255) DEFAULT NULL,
  `groupId` int(11) unsigned zerofill DEFAULT NULL,
  `isFavorite` tinyint(1) DEFAULT '0',
  `baselineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backlogitem_unique_01` (`companyId`,`name`),
  KEY `backlogitem_fk_04_idx` (`stakeholderId`),
  KEY `backlogitem_fk_03_idx` (`statusId`),
  KEY `backlogitem_fk_05_idx` (`companyAreaId`),
  CONSTRAINT `backlogitem_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_03` FOREIGN KEY (`statusId`) REFERENCES `projectstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_04` FOREIGN KEY (`stakeholderId`) REFERENCES `stakeholder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_05` FOREIGN KEY (`companyAreaId`) REFERENCES `companyarea` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9403 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backlogitem`
--

LOCK TABLES `backlogitem` WRITE;
/*!40000 ALTER TABLE `backlogitem` DISABLE KEYS */;
INSERT INTO `backlogitem` VALUES (00000000001,00000000001,00000000002,00000003401,00000006252,'2018-01-01','Indicador FIPE Neogrid','',NULL,12,0,NULL,NULL,NULL,NULL,'','','',NULL,0,NULL),(00000000001,00000002255,00000000004,00000003401,00000006352,'2018-06-01','Consultoria Dataquality','Contratação de consultoria em processos de qualidade de dados para o projeto.','Consultoria externa em dataquality.',2001,62,59995,'2018-07-02','2018-07-27','2018-08-03','','','',NULL,0,NULL),(00000000001,00000002255,00000000008,00000005152,00000009402,'2018-06-01','Padronização Unidades de Medida','Padronização de unidades de medidas de todos os produtos com sistema internacional.','Analista de qualidade de dados',100,60,NULL,'2018-07-31','2018-06-29',NULL,'Iniciou na Sprint 2018-6.\r\nPlanejada na Sprint 2018-7.','Varejo trabalha com unidades e a industria trabalha com vários tipos de embalagens','Aprovado na comissão de produto.',NULL,0,NULL);
/*!40000 ALTER TABLE `backlogitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backlogitemstatus`
--

DROP TABLE IF EXISTS `backlogitemstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backlogitemstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backlogitemstatus_unique_01` (`companyId`,`name`),
  CONSTRAINT `backlogitemstatus_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backlogitemstatus`
--

LOCK TABLES `backlogitemstatus` WRITE;
/*!40000 ALTER TABLE `backlogitemstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `backlogitemstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline`
--

DROP TABLE IF EXISTS `baseline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `entityId` int(11) unsigned zerofill NOT NULL,
  `userId` int(11) unsigned zerofill NOT NULL,
  `statusId` int(11) NOT NULL DEFAULT '1',
  `createDate` date DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `estimatedResources` varchar(255) DEFAULT NULL,
  `estimatedRisks` varchar(255) DEFAULT NULL,
  `estimatedCost` int(11) DEFAULT NULL,
  `estimatedWork` int(11) DEFAULT NULL,
  `estimatedStartDate` date DEFAULT NULL,
  `estimatedEndDate` date DEFAULT NULL,
  `estimatedDuration` int(11) DEFAULT NULL,
  `estimatedCompleteness` int(11) DEFAULT NULL,
  `changeObservations` varchar(255) DEFAULT NULL,
  `changeAprovalNotes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline`
--

LOCK TABLES `baseline` WRITE;
/*!40000 ALTER TABLE `baseline` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baselinestatus`
--

DROP TABLE IF EXISTS `baselinestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baselinestatus` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baselinestatus`
--

LOCK TABLES `baselinestatus` WRITE;
/*!40000 ALTER TABLE `baselinestatus` DISABLE KEYS */;
INSERT INTO `baselinestatus` VALUES (00000000001,'Ativa'),(00000000002,'Histórico');
/*!40000 ALTER TABLE `baselinestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `userId` int(11) unsigned zerofill NOT NULL,
  `className` varchar(25) NOT NULL,
  `entityId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_unique_01` (`companyId`,`name`),
  KEY `comment_fk_02_idx` (`userId`),
  CONSTRAINT `comment_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_fk_02` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `groupId` int(11) unsigned zerofill NOT NULL DEFAULT '00000000001',
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_unique_01` (`groupId`,`name`),
  CONSTRAINT `company_fk_01` FOREIGN KEY (`groupId`) REFERENCES `companygroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (00000000001,00000000001,'My Money','684.416.909-44');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyarea`
--

DROP TABLE IF EXISTS `companyarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyarea` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyarea_unique_01` (`companyId`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyarea`
--

LOCK TABLES `companyarea` WRITE;
/*!40000 ALTER TABLE `companyarea` DISABLE KEYS */;
INSERT INTO `companyarea` VALUES (00000000001,00000000001,'CEO'),(00000000001,00000002255,'Data Quality'),(00000000001,00000000003,'Diretoria Inovação'),(00000000001,00000000002,'Diretoria Produto'),(00000000001,00000000004,'Diretoria Vendas');
/*!40000 ALTER TABLE `companyarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companygroup`
--

DROP TABLE IF EXISTS `companygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companygroup` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companygroup`
--

LOCK TABLES `companygroup` WRITE;
/*!40000 ALTER TABLE `companygroup` DISABLE KEYS */;
INSERT INTO `companygroup` VALUES (00000000003,'Group 1'),(00000000004,'Group 2'),(00000000002,'Guest'),(00000000001,'My Money');
/*!40000 ALTER TABLE `companygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configkey`
--

DROP TABLE IF EXISTS `configkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configkey` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `keyValue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `configkey_unique_01` (`companyId`,`name`),
  CONSTRAINT `configkey_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configkey`
--

LOCK TABLES `configkey` WRITE;
/*!40000 ALTER TABLE `configkey` DISABLE KEYS */;
INSERT INTO `configkey` VALUES (00000000001,00000000001,'users.license','30'),(00000000001,00000000002,'smtp.server','smtp.google.com'),(00000000001,00000000003,'smtp.server.user','dippold.br@gmail.com'),(00000000001,00000000004,'smtp.server.passwd','galateo2013'),(00000000001,00000000005,'smtp.server.port','25'),(00000000001,00000000101,'passwd.default','mytask@123'),(00000000001,00000000251,'records.per.page','10');
/*!40000 ALTER TABLE `configkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `userId` varchar(45) NOT NULL,
  `entityId` varchar(45) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fieldName` varchar(45) DEFAULT NULL,
  `oldValue` varchar(100) DEFAULT NULL,
  `newValue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_fk_01_idx` (`companyId`),
  CONSTRAINT `log_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11902 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (00000000001,'Fabio Tavares Dippold','1','2018-06-21 18:48:22',00000000451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 18:49:41',00000000452,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 18:50:17',00000000501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:08:16',00000000551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:09:08',00000000601,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:09:28',00000000651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:11:51',00000000652,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:12:06',00000000701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','1','2018-06-21 19:14:26',00000000702,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 10:09:33',00000000751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:11:16',00000000752,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 11:11:55',00000000753,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:11:57',00000000754,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:22:24',00000000755,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 11:23:11',00000000756,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:23:15',00000000757,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:23:30',00000000758,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 11:32:21',00000000759,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:32:23',00000000760,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:33:07',00000000801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:42:12',00000000851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:42:35',00000000852,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 11:47:45',00000000901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:06:41',00000000951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:06:56',00000000952,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:10:47',00000001001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:11:19',00000001002,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:12:40',00000001003,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:28:40',00000001051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 12:30:47',00000001052,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:31:03',00000001101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:31:19',00000001102,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:31:44',00000001103,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:39:37',00000001151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:45:48',00000001201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:47:31',00000001251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:47:51',00000001301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:53:05',00000001351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 12:59:38',00000001401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:02:54',00000001451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:09:52',00000001501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:20:58',00000001601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 13:21:44',00000001602,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:21:57',00000001603,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 13:31:39',00000001651,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:32:15',00000001652,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 13:39:57',00000001653,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 14:19:18',00000001654,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:24:25',00000001655,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:29:58',00000001701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:33:19',00000001751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:33:55',00000001801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:40:27',00000001851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:44:49',00000001903,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:50:47',00000001951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 15:52:11',00000001953,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:03:10',00000002001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:04:49',00000002051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:06:05',00000002101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:20:50',00000002102,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:36:13',00000002151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:36:29',00000002152,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:36:46',00000002153,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 16:39:40',00000002154,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 17:05:06',00000002201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 17:12:41',00000002301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 17:45:16',00000002302,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 17:57:32',00000002351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 17:58:26',00000002352,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:08:57',00000002353,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:11:20',00000002401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:13:44',00000002402,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 18:18:34',00000002403,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:18:49',00000002451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 18:19:09',00000002452,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:19:22',00000002501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:19:55',00000002551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:23:22',00000002552,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:24:43',00000002601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:25:21',00000002651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:29:14',00000002701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 18:30:34',00000002751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 19:16:02',00000002801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 19:25:03',00000002851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 19:26:20',00000002901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 20:12:52',00000002902,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 20:23:47',00000002903,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 20:30:11',00000002951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 21:52:54',00000003001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 21:57:16',00000003051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:03:49',00000003101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:13:08',00000003151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:21:18',00000003201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:22:58',00000003251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:27:29',00000003301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:32:09',00000003351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:46:13',00000003451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:49:09',00000003501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:56:33',00000003551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:57:34',00000003601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:58:03',00000003602,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:59:10',00000003651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 22:59:14',00000003652,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 23:03:36',00000003654,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:17:05',00000003701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:19:39',00000003751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:19:56',00000003752,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:26:11',00000003801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 23:26:17',00000003802,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:26:20',00000003803,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:35:05',00000003851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:39:14',00000003951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-22 23:39:17',00000003952,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:39:41',00000003953,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-22 23:41:23',00000004001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 00:38:29',00000004002,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-23 00:48:11',00000004004,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 00:48:48',00000004005,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 00:51:01',00000004006,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-23 00:55:08',00000004007,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 00:55:14',00000004008,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 00:57:43',00000004010,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:20:32',00000004051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:29:31',00000004101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:29:58',00000004102,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:35:15',00000004151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-23 01:35:20',00000004152,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:35:22',00000004153,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:37:53',00000004201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-23 01:42:11',00000004251,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:42:30',00000004301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:45:35',00000004351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:48:47',00000004401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-23 01:49:30',00000004402,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 08:40:11',00000004451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 16:32:38',00000004501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 16:51:55',00000004551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 16:51:55',00000004552,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-25 17:02:11',00000004553,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:02:30',00000004601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-25 17:05:13',00000004651,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:05:27',00000004701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:11:19',00000004751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:12:47',00000004801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:15:16',00000004851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-25 17:20:42',00000004852,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-25 17:21:07',00000004901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 09:27:34',00000004902,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 09:43:01',00000004951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 09:44:43',00000005001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 10:02:20',00000005051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 12:18:19',00000005052,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-26 12:51:02',00000005053,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 12:51:27',00000005101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-26 13:12:50',00000005201,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 13:13:08',00000005251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 13:15:45',00000005301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 16:41:04',00000005351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 16:44:59',00000005401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 20:46:18',00000005451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 21:58:56',00000005501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-26 22:12:22',00000005502,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-26 22:12:40',00000005551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 09:38:15',00000005601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:07:56',00000005651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:20:59',00000005701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:40:35',00000005751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:43:10',00000005801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:46:41',00000005851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 10:58:57',00000005901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 11:00:16',00000005951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 14:41:26',00000006001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 14:42:58',00000006101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 14:48:31',00000006151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 15:50:49',00000006152,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 16:09:58',00000006201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 16:12:05',00000006251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-28 16:24:16',00000006301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:01:33',00000006351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:33:11',00000006401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:37:26',00000006451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:38:54',00000006501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:48:01',00000006551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:50:00',00000006601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:51:31',00000006651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 09:55:47',00000006701,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 09:56:02',00000006751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:03:13',00000006801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:04:55',00000006851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:15:08',00000006901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:30:56',00000006951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:42:12',00000007001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:48:53',00000007051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 10:52:40',00000007101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 13:38:12',00000007151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 13:40:38',00000007201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 16:35:50',00000007251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 16:37:32',00000007301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:00:53',00000007302,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:01:09',00000007351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:07:42',00000007401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:09:27',00000007402,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:09:43',00000007451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:11:01',00000007452,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:11:20',00000007501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:14:36',00000007502,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:14:52',00000007551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:17:50',00000007552,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:18:08',00000007601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-06-29 17:21:33',00000007602,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-06-29 17:21:47',00000007651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-03 17:57:12',00000007652,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-03 18:00:29',00000007653,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:32:54',00000007701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:36:59',00000007751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:43:56',00000007801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:50:25',00000007851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-04 18:55:04',00000007852,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:55:25',00000007901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:59:17',00000007951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 18:59:44',00000008001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-04 19:02:39',00000008051,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:03:00',00000008101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:04:16',00000008151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:05:35',00000008201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:08:39',00000008251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:10:27',00000008301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-04 19:10:34',00000008302,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-04 19:11:49',00000008351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-05 14:57:28',00000008401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-05 15:01:31',00000008451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-05 15:03:42',00000008501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-05 15:05:01',00000008551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 12:23:00',00000008601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 12:32:04',00000008651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 16:14:08',00000008701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-07 16:15:12',00000008702,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 16:15:42',00000008703,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 16:16:21',00000008704,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-07 16:22:46',00000008705,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 17:09:39',00000008751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-07 17:10:05',00000008752,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-07 17:10:10',00000008753,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 13:12:58',00000008801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 13:33:51',00000008851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 13:48:55',00000008901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-08 13:54:36',00000008951,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 13:54:48',00000009001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 13:58:30',00000009051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:00:06',00000009101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:08:01',00000009151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:21:54',00000009201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-08 14:23:07',00000009202,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:23:20',00000009251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-08 14:24:07',00000009252,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:24:20',00000009301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-08 14:27:17',00000009302,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:27:30',00000009351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-08 14:28:58',00000009352,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:29:10',00000009401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:38:47',00000009451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:42:04',00000009501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:50:39',00000009551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:58:41',00000009601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 14:59:38',00000009651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 15:10:52',00000009701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 15:48:54',00000009751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 17:21:58',00000009801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 21:08:53',00000009802,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 21:27:51',00000009851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 21:30:04',00000009901,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 21:38:24',00000009951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-08 23:34:06',00000010001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 10:43:54',00000010002,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 11:25:12',00000010051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 11:34:30',00000010101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 11:49:55',00000010151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 13:51:48',00000010152,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 13:55:01',00000010201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 17:20:32',00000010202,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 17:59:29',00000010251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:02:27',00000010301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:06:20',00000010351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:10:13',00000010401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:16:47',00000010451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:19:40',00000010501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:26:22',00000010551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:27:44',00000010601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:43:53',00000010651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 18:49:03',00000010701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 22:46:48',00000010702,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 22:50:33',00000010751,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 22:52:48',00000010801,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 23:37:35',00000010851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-09 23:51:08',00000010901,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 23:51:18',00000010902,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-09 23:52:54',00000010903,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 10:56:58',00000010951,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 11:23:01',00000011001,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 11:27:33',00000011051,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 11:31:13',00000011101,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 11:36:26',00000011151,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 14:09:27',00000011152,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 23:06:12',00000011201,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-10 23:15:27',00000011251,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 10:00:39',00000011301,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 11:38:30',00000011302,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 11:43:53',00000011351,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 11:55:23',00000011401,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 12:19:13',00000011451,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 12:21:06',00000011501,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 12:22:40',00000011551,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 13:57:31',00000011601,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-11 14:02:26',00000011602,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 15:18:16',00000011603,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 15:18:54',00000011651,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 15:41:29',00000011701,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-11 15:58:30',00000011751,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 15:58:56',00000011752,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-11 16:04:41',00000011753,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 16:04:57',00000011754,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-11 16:15:51',00000011801,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 17:15:38',00000011851,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','LogOutCmd','2018-07-11 17:15:43',00000011852,'SignOut',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-11 17:15:44',00000011853,'SignIn',NULL,NULL,NULL),(00000000001,'Fabio Tavares Dippold','SignInServiceServlet','2018-07-12 21:18:49',00000011901,'SignIn',NULL,NULL,NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwd`
--

DROP TABLE IF EXISTS `passwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwd` (
  `userId` int(11) unsigned zerofill NOT NULL,
  `passwdStatusId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `passwd_fk_01_idx` (`userId`),
  KEY `passwd_fk_02_idx` (`passwdStatusId`),
  CONSTRAINT `passwd_fk_01` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `passwd_fk_02` FOREIGN KEY (`passwdStatusId`) REFERENCES `passwdstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwd`
--

LOCK TABLES `passwd` WRITE;
/*!40000 ALTER TABLE `passwd` DISABLE KEYS */;
INSERT INTO `passwd` VALUES (00000000001,00000000001,00000000001,'galateo2013','2018-06-20 17:49:26'),(00000000002,00000000002,00000000002,'mytask@123','2018-06-20 17:49:26'),(00000000002,00000000001,00000000401,'galateo2013','2018-06-21 17:47:30');
/*!40000 ALTER TABLE `passwd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwdstatus`
--

DROP TABLE IF EXISTS `passwdstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwdstatus` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwdstatus`
--

LOCK TABLES `passwdstatus` WRITE;
/*!40000 ALTER TABLE `passwdstatus` DISABLE KEYS */;
INSERT INTO `passwdstatus` VALUES (00000000001,'Ativa'),(00000000002,'Inativa');
/*!40000 ALTER TABLE `passwdstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_fk_01_idx` (`companyId`),
  CONSTRAINT `product_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressstatus`
--

DROP TABLE IF EXISTS `progressstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `progressstatus_unique_01` (`companyId`,`name`),
  CONSTRAINT `progressstatus_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressstatus`
--

LOCK TABLES `progressstatus` WRITE;
/*!40000 ALTER TABLE `progressstatus` DISABLE KEYS */;
INSERT INTO `progressstatus` VALUES (00000000001,00000000200,'A verificar'),(00000000001,00000000040,'Aprovada'),(00000000001,00000000140,'Backlog'),(00000000001,00000000150,'Cancelada'),(00000000001,00000000080,'Em Andamento'),(00000000001,00000000030,'Em Aprovação'),(00000000001,00000000060,'Em Planejamentp'),(00000000001,00000000020,'Em Triagem'),(00000000001,00000000120,'Esperando Por...'),(00000000001,00000000130,'Finalizada'),(00000000001,00000000090,'Parada'),(00000000001,00000000070,'Planejada'),(00000000001,00000000050,'Reprovada'),(00000000001,00000000110,'Retomado Andamento'),(00000000001,00000000010,'Solicitada');
/*!40000 ALTER TABLE `progressstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `projectGroupId` int(11) unsigned zerofill NOT NULL,
  `backlogItemId` int(11) unsigned zerofill NOT NULL,
  `projectStatusId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `progressObservation` varchar(255) DEFAULT NULL,
  `estimatedResources` varchar(255) DEFAULT NULL,
  `estimatedWork` int(11) NOT NULL DEFAULT '0',
  `estimatedDuration` int(11) DEFAULT NULL,
  `estimatedCost` int(11) DEFAULT NULL,
  `wishDate` varchar(45) DEFAULT NULL,
  `plannedStartDate` varchar(45) DEFAULT NULL,
  `plannedEndDate` varchar(45) DEFAULT NULL,
  `plannedDuration` int(11) DEFAULT NULL,
  `dateDelivered` varchar(45) DEFAULT NULL,
  `completeness` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_unique_01` (`companyId`,`name`),
  KEY `project_fk_02_idx` (`projectStatusId`),
  KEY `project_fk_03_idx` (`backlogItemId`),
  KEY `project_fk_04_idx` (`projectGroupId`),
  CONSTRAINT `project_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_fk_02` FOREIGN KEY (`projectStatusId`) REFERENCES `progressstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_fk_03` FOREIGN KEY (`backlogItemId`) REFERENCES `backlogitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_fk_04` FOREIGN KEY (`projectGroupId`) REFERENCES `projectgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectgroup`
--

DROP TABLE IF EXISTS `projectgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectgroup` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectgroup_unique_01` (`companyId`,`name`),
  CONSTRAINT `projectgroup_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectgroup`
--

LOCK TABLES `projectgroup` WRITE;
/*!40000 ALTER TABLE `projectgroup` DISABLE KEYS */;
INSERT INTO `projectgroup` VALUES (00000000001,00000000001,'Outros'),(00000000001,00000000002,'Roadmap 2018'),(00000000001,00000001552,'Roadmap 2019');
/*!40000 ALTER TABLE `projectgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectphase`
--

DROP TABLE IF EXISTS `projectphase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectphase` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectphase_unique_01` (`companyId`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectphase`
--

LOCK TABLES `projectphase` WRITE;
/*!40000 ALTER TABLE `projectphase` DISABLE KEYS */;
INSERT INTO `projectphase` VALUES (00000000001,00000000002,'Blueprint'),(00000000001,00000000005,'Cut Over'),(00000000001,00000000006,'Go Live & Suporte Pós'),(00000000001,00000000001,'Preparação'),(00000000001,00000000004,'Preparação Final'),(00000000001,00000000003,'Realização');
/*!40000 ALTER TABLE `projectphase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectstatus`
--

DROP TABLE IF EXISTS `projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectstatus_unique_01` (`companyId`,`name`),
  CONSTRAINT `projectstatus_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3902 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectstatus`
--

LOCK TABLES `projectstatus` WRITE;
/*!40000 ALTER TABLE `projectstatus` DISABLE KEYS */;
INSERT INTO `projectstatus` VALUES (00000000001,00000000011,'Cancelado'),(00000000001,00000003901,'Em Aprovação'),(00000000001,00000000002,'Em Backlog'),(00000000001,00000000008,'Em Execução'),(00000000001,00000000004,'Em Planejamento'),(00000000001,00000000001,'Em Portifolio'),(00000000001,00000000003,'Em Reaprovação'),(00000000001,00000000007,'Em Replanejamento'),(00000000001,00000000006,'Finalizado'),(00000000001,00000000005,'Parado'),(00000000001,00000000010,'Planejado'),(00000000001,00000000009,'Retomado Execução');
/*!40000 ALTER TABLE `projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projecttype`
--

DROP TABLE IF EXISTS `projecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projecttype` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projecttype_unique_01` (`companyId`,`name`),
  KEY `projecttype_fk_01_idx` (`companyId`),
  CONSTRAINT `projecttype_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttype`
--

LOCK TABLES `projecttype` WRITE;
/*!40000 ALTER TABLE `projecttype` DISABLE KEYS */;
INSERT INTO `projecttype` VALUES (00000000001,00000000007,'Atualização Produto'),(00000000001,00000000006,'Campanha Marketing'),(00000000001,00000000003,'Consultoria'),(00000000001,00000000002,'Correção Emergêncial'),(00000000001,00000000001,'Implantação'),(00000000001,00000000008,'Inovação'),(00000000001,00000000005,'Melhoria Processo'),(00000000001,00000000004,'Qualidade Dados'),(00000000001,00000001952,'Rollout');
/*!40000 ALTER TABLE `projecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `userId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_unique_01` (`companyId`,`name`),
  KEY `resource_fk_02_idx` (`userId`),
  CONSTRAINT `resource_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `resource_fk_02` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roadmap`
--

DROP TABLE IF EXISTS `roadmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roadmap` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `companyAreaId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roadmap_unique_01` (`companyId`,`name`,`companyAreaId`),
  KEY `roadmap_fk_02_idx` (`companyAreaId`),
  CONSTRAINT `roadmap_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roadmap_fk_02` FOREIGN KEY (`companyAreaId`) REFERENCES `companyarea` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roadmap`
--

LOCK TABLES `roadmap` WRITE;
/*!40000 ALTER TABLE `roadmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `roadmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_unique_01` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (00000000002,'gp'),(00000000004,'guest'),(00000000001,'root'),(00000000003,'user');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('SEQ_GEN',11950);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_fk_01` (`companyId`,`name`),
  CONSTRAINT `skill_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (00000000001,00000000003,'Analista de Negócio'),(00000000001,00000000002,'Analista de Qualidade de Dados'),(00000000001,00000000004,'Analista de Sistemas'),(00000000001,00000000007,'Arquiteto de Sistemas'),(00000000001,00000000010,'Basis'),(00000000001,00000000001,'Cientista de Dados'),(00000000001,00000000005,'DBA'),(00000000001,00000000008,'Desenvolvedor'),(00000000001,00000000009,'GP'),(00000000001,00000000006,'Testador');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprint`
--

DROP TABLE IF EXISTS `sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprint` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `projectId` int(11) unsigned zerofill NOT NULL,
  `sprintStatusId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `workCapacity` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprint_unique_01` (`name`,`companyId`),
  KEY `sprint_fk_01_idx` (`companyId`),
  KEY `sprint_fk_02_idx` (`sprintStatusId`),
  KEY `sprint_fk_03_idx` (`projectId`),
  CONSTRAINT `sprint_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sprint_fk_02` FOREIGN KEY (`sprintStatusId`) REFERENCES `sprintstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sprint_fk_03` FOREIGN KEY (`projectId`) REFERENCES `projectstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprintstatus`
--

DROP TABLE IF EXISTS `sprintstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprintstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprintstatus_unique_01` (`companyId`,`name`),
  CONSTRAINT `sprintstatus_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprintstatus`
--

LOCK TABLES `sprintstatus` WRITE;
/*!40000 ALTER TABLE `sprintstatus` DISABLE KEYS */;
INSERT INTO `sprintstatus` VALUES (00000000001,00000000008,'Cancelada'),(00000000001,00000000006,'Em Aceitação'),(00000000001,00000000002,'Em Planejamento'),(00000000001,00000000004,'Em Progresso'),(00000000001,00000000009,'Em Replanejamento'),(00000000001,00000000005,'Em Testes'),(00000000001,00000000001,'Esperando Planejamento'),(00000000001,00000000007,'Finalizada'),(00000000001,00000000010,'Parada'),(00000000001,00000000003,'Planejada');
/*!40000 ALTER TABLE `sprintstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stakeholder`
--

DROP TABLE IF EXISTS `stakeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stakeholder` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `stakeholderGroupId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stakeholder_unique_01` (`companyId`,`name`),
  KEY `stakeholder_fk_03_idx` (`stakeholderGroupId`),
  CONSTRAINT `stakeholder_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stakeholder_fk_03` FOREIGN KEY (`stakeholderGroupId`) REFERENCES `stakeholdergroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stakeholder`
--

LOCK TABLES `stakeholder` WRITE;
/*!40000 ALTER TABLE `stakeholder` DISABLE KEYS */;
INSERT INTO `stakeholder` VALUES (00000000001,00000003502,00000003302,'Edilson Correa','edilson.correa@neogrid.com','Vice presidente de Produto'),(00000000001,00000002251,00000003401,'Miguel Abuhab','migueal.abuhab@neogrid.com','Fundador da Datasul S.A.'),(00000000001,00000004009,00000004003,'Fábio Dippold','fabio.dippold@neogrid.com','Analista sênior na área Data Quality\r\nProfessor da Católica de Santa Catarina\r\nMBA em Gerencia de Projetos\r\nMBA em Engenharia de Software'),(00000000001,00000004009,00000005151,'Henry S. Glock','henry.glock@neogrid.com','Henry Saute Glock'),(00000000001,00000004009,00000005152,'Gilsiley H. Daru','gilsiley.daru@neogrid.com','');
/*!40000 ALTER TABLE `stakeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stakeholdergroup`
--

DROP TABLE IF EXISTS `stakeholdergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stakeholdergroup` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stakeholdergroup_unique_01` (`companyId`,`name`),
  CONSTRAINT `stakeholdergroup_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stakeholdergroup`
--

LOCK TABLES `stakeholdergroup` WRITE;
/*!40000 ALTER TABLE `stakeholdergroup` DISABLE KEYS */;
INSERT INTO `stakeholdergroup` VALUES (00000000001,00000002251,'CEO'),(00000000001,00000002253,'Company Staff'),(00000000001,00000002252,'Consultoria DQ'),(00000000001,00000004009,'DQ Area'),(00000000001,00000002254,'Microsoft'),(00000000001,00000003502,'VP Neogrid');
/*!40000 ALTER TABLE `stakeholdergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `projectId` int(11) unsigned zerofill NOT NULL,
  `sprintId` int(11) unsigned zerofill NOT NULL,
  `typeId` int(11) unsigned zerofill NOT NULL,
  `taskStatusId` int(11) unsigned zerofill NOT NULL,
  `resourseId` int(11) unsigned zerofill NOT NULL,
  `parentId` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  `id` int(11) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `wasPlanned` tinyint(1) NOT NULL DEFAULT '1',
  `estimatedWork` int(11) NOT NULL DEFAULT '0',
  `workdone` int(11) NOT NULL DEFAULT '0',
  `expectedStartDate` date NOT NULL,
  `expectedEndDate` date NOT NULL,
  `startDateDone` date DEFAULT NULL,
  `actualEndDate` date DEFAULT NULL,
  `completeness` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_unique_01` (`name`,`companyId`,`projectId`,`sprintId`,`resourseId`),
  KEY `task_fk_01_idx` (`companyId`),
  KEY `task_fk_02_idx` (`projectId`),
  KEY `task_fk_03_idx` (`sprintId`),
  KEY `task_fk_04_idx` (`typeId`),
  KEY `task_fk_05_idx` (`taskStatusId`),
  KEY `task_fk_06_idx` (`resourseId`),
  KEY `task_fk_07_idx` (`parentId`),
  CONSTRAINT `task_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_fk_02` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_fk_03` FOREIGN KEY (`sprintId`) REFERENCES `sprint` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_fk_04` FOREIGN KEY (`typeId`) REFERENCES `tasktype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_fk_05` FOREIGN KEY (`taskStatusId`) REFERENCES `taskstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_fk_06` FOREIGN KEY (`resourseId`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskstatus`
--

DROP TABLE IF EXISTS `taskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskstatus_unique_01` (`companyId`,`name`),
  CONSTRAINT `taskstatus_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskstatus`
--

LOCK TABLES `taskstatus` WRITE;
/*!40000 ALTER TABLE `taskstatus` DISABLE KEYS */;
INSERT INTO `taskstatus` VALUES (00000000001,00000000009,'Cancelada'),(00000000001,00000000004,'Em Andamento'),(00000000001,00000000001,'Em Backlog'),(00000000001,00000000002,'Em Planejamento'),(00000000001,00000000011,'Em Replanejamento'),(00000000001,00000000007,'Esperando Por...'),(00000000001,00000000008,'Finalizada'),(00000000001,00000000005,'Parada'),(00000000001,00000000003,'Planejada'),(00000000001,00000000010,'Postergada'),(00000000001,00000000006,'Retomado Andamento');
/*!40000 ALTER TABLE `taskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasktype`
--

DROP TABLE IF EXISTS `tasktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasktype` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tasktype_unique_01` (`companyId`,`name`),
  CONSTRAINT `tasktype_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasktype`
--

LOCK TABLES `tasktype` WRITE;
/*!40000 ALTER TABLE `tasktype` DISABLE KEYS */;
INSERT INTO `tasktype` VALUES (00000000001,00000000007,'Análise de Negócio'),(00000000001,00000000006,'Análise de Sistemas'),(00000000001,00000000009,'Apresentação'),(00000000001,00000000004,'Categorização'),(00000000001,00000000005,'Desenvolvimento Indicador Qualidade'),(00000000001,00000000011,'Modelar Processo'),(00000000001,00000000003,'Padronização'),(00000000001,00000000010,'Participar Treianmento'),(00000000001,00000000008,'Plano de Projeto'),(00000000001,00000000002,'Projeto Data Quality'),(00000000001,00000000001,'Saneamento');
/*!40000 ALTER TABLE `tasktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timekeeping`
--

DROP TABLE IF EXISTS `timekeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timekeeping` (
  `taskId` int(11) unsigned zerofill NOT NULL,
  `userId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `registrationDate` date NOT NULL,
  `dateWorked` date NOT NULL,
  `workQuantity` double NOT NULL,
  `unitQuantity` int(11) unsigned zerofill NOT NULL,
  `observation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timekeeping`
--

LOCK TABLES `timekeeping` WRITE;
/*!40000 ALTER TABLE `timekeeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `timekeeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `ruleId` int(11) unsigned zerofill NOT NULL,
  `userStatusId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_01` (`email`),
  UNIQUE KEY `user_unique_02` (`companyId`,`name`),
  KEY `user_fk_01_idx` (`ruleId`),
  KEY `user_fk_03_idx` (`userStatusId`),
  KEY `user_idx_02` (`companyId`),
  CONSTRAINT `user_fk_01` FOREIGN KEY (`ruleId`) REFERENCES `rule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_fk_02` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_fk_03` FOREIGN KEY (`userStatusId`) REFERENCES `userstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (00000000001,00000000001,00000000001,00000000001,'Fabio Tavares Dippold','dippold.br@gmail.com'),(00000000001,00000000003,00000000001,00000000002,'Galateo','galateo@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskill`
--

DROP TABLE IF EXISTS `userskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userskill` (
  `comanyId` int(11) unsigned zerofill NOT NULL,
  `userId` int(11) unsigned zerofill NOT NULL,
  `skillId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userskill_unique_01` (`skillId`,`userId`,`comanyId`),
  KEY `userskill_fk_01_idx` (`comanyId`),
  KEY `userskill_fk_02_idx` (`userId`),
  KEY `userskill_fk_03_idx` (`skillId`),
  CONSTRAINT `userskill_fk_01` FOREIGN KEY (`comanyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userskill_fk_02` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userskill_fk_03` FOREIGN KEY (`skillId`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskill`
--

LOCK TABLES `userskill` WRITE;
/*!40000 ALTER TABLE `userskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `userskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstatus`
--

DROP TABLE IF EXISTS `userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userstatus` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatus`
--

LOCK TABLES `userstatus` WRITE;
/*!40000 ALTER TABLE `userstatus` DISABLE KEYS */;
INSERT INTO `userstatus` VALUES (00000000001,'Ativo'),(00000000003,'Bloqueado'),(00000000002,'Inativo'),(00000000004,'Trial');
/*!40000 ALTER TABLE `userstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workquantityunit`
--

DROP TABLE IF EXISTS `workquantityunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workquantityunit` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `initials` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `initials_UNIQUE` (`initials`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workquantityunit`
--

LOCK TABLES `workquantityunit` WRITE;
/*!40000 ALTER TABLE `workquantityunit` DISABLE KEYS */;
INSERT INTO `workquantityunit` VALUES (00000000001,'Hora','H'),(00000000002,'Dia','D'),(00000000003,'Semana','S'),(00000000004,'Mês','M'),(00000000005,'Ano','A');
/*!40000 ALTER TABLE `workquantityunit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-16 16:09:26
