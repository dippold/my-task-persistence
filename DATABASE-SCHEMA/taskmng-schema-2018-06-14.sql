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
-- Table structure for table `backlogitem`
--

DROP TABLE IF EXISTS `backlogitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backlogitem` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `roadmapId` int(11) unsigned zerofill NOT NULL,
  `progressStatusId` int(11) unsigned zerofill NOT NULL,
  `stakeholdeIid` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `estimatedWork` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `backlogitem_unique_01` (`companyId`,`name`),
  KEY `backlogitem_fk_03_idx` (`progressStatusId`),
  KEY `backlogitem_fk_04_idx` (`stakeholdeIid`),
  KEY `backlogitem_fk_05_idx` (`roadmapId`),
  CONSTRAINT `backlogitem_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_03` FOREIGN KEY (`progressStatusId`) REFERENCES `progressstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_04` FOREIGN KEY (`stakeholdeIid`) REFERENCES `stakeholder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `backlogitem_fk_05` FOREIGN KEY (`roadmapId`) REFERENCES `roadmap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backlogitem`
--

LOCK TABLES `backlogitem` WRITE;
/*!40000 ALTER TABLE `backlogitem` DISABLE KEYS */;
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
  `cnpf` varchar(18) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyarea`
--

LOCK TABLES `companyarea` WRITE;
/*!40000 ALTER TABLE `companyarea` DISABLE KEYS */;
INSERT INTO `companyarea` VALUES (00000000001,00000000001,'CEO'),(00000000001,00000000002,'Diretoria A'),(00000000001,00000000003,'Diretoria B'),(00000000001,00000000004,'Diretoria C');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configkey`
--

LOCK TABLES `configkey` WRITE;
/*!40000 ALTER TABLE `configkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `configkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `companyId` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `actionType` varchar(45) NOT NULL,
  `entityId` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fieldName` varchar(45) DEFAULT NULL,
  `oldValue` varchar(45) DEFAULT NULL,
  `newValue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
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
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `passwd_fk_01_idx` (`userId`),
  KEY `passwd_fk_02_idx` (`passwdStatusId`),
  CONSTRAINT `passwd_fk_01` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `passwd_fk_02` FOREIGN KEY (`passwdStatusId`) REFERENCES `passwdstatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwd`
--

LOCK TABLES `passwd` WRITE;
/*!40000 ALTER TABLE `passwd` DISABLE KEYS */;
INSERT INTO `passwd` VALUES (00000000001,00000000001,00000000001,'galateo2013','2018-06-13 16:57:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
  `estimatedWork` varchar(45) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectgroup`
--

LOCK TABLES `projectgroup` WRITE;
/*!40000 ALTER TABLE `projectgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectstatus`
--

DROP TABLE IF EXISTS `projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectstatus` (
  `companyId` int(11) unsigned zerofill NOT NULL,
  `projectTypeId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectstatus_unique_01` (`companyId`,`projectTypeId`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectstatus`
--

LOCK TABLES `projectstatus` WRITE;
/*!40000 ALTER TABLE `projectstatus` DISABLE KEYS */;
INSERT INTO `projectstatus` VALUES (00000000001,00000000001,00000000003,'Blueprint'),(00000000001,00000000001,00000000011,'Cancelado'),(00000000001,00000000001,00000000006,'Cutover'),(00000000001,00000000001,00000000009,'Em Auditoria'),(00000000001,00000000001,00000000010,'Encerrado'),(00000000001,00000000001,00000000007,'Go Live'),(00000000001,00000000001,00000000001,'Iniciação'),(00000000001,00000000001,00000000002,'Planejamneto'),(00000000001,00000000001,00000000004,'Realização'),(00000000001,00000000001,00000000008,'Suporte Pós'),(00000000001,00000000001,00000000005,'Testes');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttype`
--

LOCK TABLES `projecttype` WRITE;
/*!40000 ALTER TABLE `projecttype` DISABLE KEYS */;
INSERT INTO `projecttype` VALUES (00000000001,00000000007,'Atualização de Produto'),(00000000001,00000000006,'Campanha de Marketing'),(00000000001,00000000003,'Consultoria'),(00000000001,00000000002,'Desenvolvimento'),(00000000001,00000000001,'Implantação'),(00000000001,00000000008,'Inovação'),(00000000001,00000000005,'Melhoria de Processo'),(00000000001,00000000004,'Qualidade de Dados');
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
  `companyId` int(11) unsigned zerofill NOT NULL,
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_unique_01` (`companyId`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (00000000001,00000000002,'gp'),(00000000001,00000000004,'guest'),(00000000001,00000000001,'root'),(00000000001,00000000003,'user');
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
INSERT INTO `sequence` VALUES ('SEQ_GEN',0);
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
  `email` varchar(45) NOT NULL,
  `observation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stakeholder_unique_01` (`companyId`,`name`),
  KEY `stakeholder_fk_03_idx` (`stakeholderGroupId`),
  CONSTRAINT `stakeholder_fk_01` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stakeholder_fk_03` FOREIGN KEY (`stakeholderGroupId`) REFERENCES `stakeholdergroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stakeholder`
--

LOCK TABLES `stakeholder` WRITE;
/*!40000 ALTER TABLE `stakeholder` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stakeholdergroup`
--

LOCK TABLES `stakeholdergroup` WRITE;
/*!40000 ALTER TABLE `stakeholdergroup` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (00000000001,00000000001,00000000001,00000000001,'Fabio Tavares Dippold','dippold.br@gmail.com');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-14 14:32:40
