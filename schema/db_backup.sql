-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: OrderMe
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `CUSTOMER`
--
CREATE DATABASE IF NOT EXISTS OrderMe;
DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `SHIPPING_ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'Eshan','Sudharaka','esudharaka@gmail.com','0714445419','Kalapaluwawa, Rajagiriya'),(2,'Eshan','Sudharaka','esudharaka@gmail.com','0714445419','Kalapaluwawa, Rajagiriya'),(22,'lakithi','lakprabha','lakithi@gmail.com','071','dfd'),(23,'dddddd','wew','we','we','we'),(24,'lakkhana','swarnamali','luxrulez@gmail.com','07745322','NHSL'),(25,'Novel','Fernando','e@no.com','09','111'),(26,'Lox','Loc','my','09','ere');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM`
--

DROP TABLE IF EXISTS `ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,0) NOT NULL DEFAULT '0',
  `IS_ACTIVE` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM`
--

LOCK TABLES `ITEM` WRITE;
/*!40000 ALTER TABLE `ITEM` DISABLE KEYS */;
INSERT INTO `ITEM` VALUES (1,'PIZZA',10,1),(2,'Bun',5,1);
/*!40000 ALTER TABLE `ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `SHIPPING_ADDRESS` varchar(255) NOT NULL,
  `CREATED_DATE_TS` timestamp(6) NULL DEFAULT NULL,
  `UPDATE_DATE_TS` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_customer_idx` (`CUSTOMER_ID`),
  CONSTRAINT `order_customer` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_INVOCE`
--

DROP TABLE IF EXISTS `ORDER_INVOCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_INVOCE` (
  `ORDER_ID` int(11) NOT NULL,
  `RECEIPT` tinyblob,
  PRIMARY KEY (`ORDER_ID`),
  CONSTRAINT `order_receipt` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_INVOCE`
--

LOCK TABLES `ORDER_INVOCE` WRITE;
/*!40000 ALTER TABLE `ORDER_INVOCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_INVOCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_LINE_ITEM`
--

DROP TABLE IF EXISTS `ORDER_LINE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_LINE_ITEM` (
  `ID` varchar(20) NOT NULL,
  `ORDER_ID` int(11) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `LINE_NO` int(11) DEFAULT NULL,
  `QTY` int(11) DEFAULT '0',
  `ITEM_PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_line_item_idx` (`ORDER_ID`),
  KEY `item_line_item_idx` (`ITEM_ID`),
  CONSTRAINT `item_line_item` FOREIGN KEY (`ITEM_ID`) REFERENCES `ITEM` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_line_item` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_LINE_ITEM`
--

LOCK TABLES `ORDER_LINE_ITEM` WRITE;
/*!40000 ALTER TABLE `ORDER_LINE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_LINE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-02  9:48:01
