CREATE DATABASE  IF NOT EXISTS `airlines` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airlines`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: airlines
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aircrafts` (
  `AircraftID` int(11) NOT NULL,
  `ICAO code` text,
  `Model` text,
  `Years` int(11) DEFAULT NULL,
  `LastMaintenanceDate` date DEFAULT NULL,
  `NextMaintenanceDate` date DEFAULT NULL,
  `TotalMilesFlown` bigint(20) DEFAULT NULL,
  `Seats` text,
  `LeaseDuration` int(11) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES (123,'A144','Boeing 737-700',10,'2019-08-08','2022-09-16',123450,NULL,10),(145,'A145','McDonnell Douglas MD-70',NULL,'2021-05-26','2022-10-04',148140,'92',NULL),(222,'A146','Boeing 737-800',30,'2019-07-14','2022-10-24',370350,'34',18),(274,'A151','Airbus A318 (sharklets)',7,'2019-05-16','2022-11-01',86415,'92',NULL),(333,'A147','Boeing 737-700',NULL,'2021-05-20','2022-10-25',111105,'64',8),(740,'A142','Boeing 777-300ER',NULL,'2019-11-24','2022-11-08',NULL,NULL,7),(772,'A136','Airbus A319',4,'2020-11-02','2022-10-28',49380,'70',NULL),(781,'A141','Boeing 767-300',6,'2021-01-24','2022-12-09',74070,'40',NULL),(783,'A152','Airbus A320',NULL,'2020-04-16','2022-10-02',61725,'46',30),(787,'A124','Airbus A310-300',15,'2019-05-25','2022-10-05',185175,'30',NULL),(788,'A126','Airbus A318',7,'2019-02-04','2022-11-18',86415,'30',24),(790,'A127','Airbus A350-900',10,'2021-09-29','2022-10-18',123450,'90',NULL),(794,'A128','Bell 212',5,'2021-12-10','2022-10-27',NULL,'120',12),(798,'A125','Airbus A318 (sharklets)',8,'2021-11-21','2022-12-08',98760,'50',29),(827,'A129','Boeing 737-800',6,'2021-02-27','2022-09-19',74070,NULL,29),(843,'A137','Boeing 737-900ER',3,'2021-02-23','2022-09-20',37035,'135',22),(847,'A130','Boeing 737-700',3,'2020-10-01','2022-11-25',37035,'120',16),(850,'A133','Bombardier CRJ200',10,'2019-01-30','2022-09-18',NULL,'100',10),(888,'A150','Airbus A310-300',9,'2021-09-10','2022-09-09',NULL,'30',10),(901,'A153','McDonnell Douglas MD-88',NULL,'2019-05-17','2022-09-20',37035,'71',15),(902,'A134','Boeing 757-200',22,'2021-10-14','2022-11-25',271590,'60',19),(909,'A140','Airbus A330-200',11,'2019-08-22','2022-11-26',NULL,'80',7),(917,'A135','Embraer E175',7,'2020-03-24','2022-11-25',NULL,'55',8),(925,'A143','ATR 42',8,'2019-09-13','2022-11-29',98760,NULL,12),(950,'A132','Airbus A321',2,'2020-07-31','2022-09-14',24690,'25',10),(964,'A138','Bombardier CRJ900',2,'2021-12-05','2022-09-28',24690,'80',NULL),(978,'A131','Airbus A320',1,'2020-01-17','2022-09-30',12345,'90',24),(989,'A148','Airbus A320',20,'2020-10-20','2022-10-08',NULL,'51',NULL),(996,'A139','McDonnell Douglas MD-88',1,'2019-08-31','2022-09-27',12345,'70',18),(999,'A149','Airbus A321',11,'2019-10-24','2022-12-07',135795,'100',30),(1002,'A142','ATR 44',5,NULL,NULL,12555,NULL,NULL),(1003,'A154',NULL,7,'2019-09-13',NULL,78545,'120',NULL);
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `LastName` text,
  `FirstName` text,
  `Gender` text,
  `DOB` date DEFAULT NULL,
  `Phone` text,
  `MembershipLevel` text,
  `TotalPurchasesPastYears` int(11) DEFAULT NULL,
  `TotalMilesFlownPastYears` int(11) DEFAULT NULL,
  `LatestPurchase` text,
  `TotalPoints` double DEFAULT NULL,
  `PromotionLevel` double DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (6,'Alex','Finch','M','1979-07-31','6358811296','Platinum',20,114152,'2021-08-05',5707.6,0.05),(44,'Jim','Hayes',NULL,'1963-03-04','6611526065','Silver',8,6395,'2021-06-12',799.4,NULL),(97,'Kristy','Beckett','F','2002-11-05','4327515696','Platinum',10,26398,'2022-01-27',2639.8,0.05),(220,'Jay','Bardot','M','1999-11-14','7011171029','Gold',17,4082,'2022-01-21',240.1,NULL),(428,'TJ','Cho','M','1962-07-28','5472754105','Platinum',16,282100,'2022-03-07',17631.3,0.15),(880,'Max','Walsh','M','1953-07-05','3078959781','Silver',17,147346,'2022-03-02',8667.4,0.15),(1493,'Jennifer','Gasper','F','1966-12-09','6667388459','Platinum',9,24502,'2022-01-27',2722.4,0.05),(2342,'Eric','Song','M','2017-10-16','5521014972',NULL,24,17379,'2022-01-23',724.1,0.1),(2900,'Marvin','Brown','M','2011-02-20','6594344147','Gold',2,6264,'2022-01-03',3132,NULL),(2905,'Cynthia','Gannon','F','1976-04-21','6373325347','Silver',21,6440,'2021-09-04',306.7,NULL),(3032,'Sofia','Katz','F','1999-02-03','4069013323','Silver',23,10106,'2021-10-19',439.4,NULL),(3152,'Cheryl','Max','F','2008-05-26','4410226304',NULL,NULL,NULL,'2021-09-01',NULL,NULL),(3167,'Annie','Ashley','F','1953-06-14','4795073890','Gold',24,9510,'2022-04-07',396.3,NULL),(3726,'Jason','Raven',NULL,'1960-04-01','8471566668','Gold',8,15425,'2022-03-12',1928.1,0.1),(3915,'Bella','Madden','F','2011-07-31','4230513833',NULL,NULL,NULL,'2021-12-10',NULL,NULL),(4167,'Abigail','Yarrow','F','2004-08-06','3153365967','Silver',13,15086,'2022-03-23',1160.5,0.05),(4569,'Conrad','May',NULL,'1986-09-16','7060366843','Platinum',10,112000,'2021-12-06',11200,0.15),(4708,'Liam','Amos',NULL,'2008-01-07','5267224571',NULL,NULL,NULL,'2022-04-10',NULL,NULL),(5046,'Henry','Hart','M','1997-06-17','3172000430','Silver',13,132670,'2021-07-26',10205.4,0.15),(5209,'May','Camila','F','1979-12-03','5813324958','Gold',20,25003,'2021-08-24',1250.2,0.05),(5313,'Ann','Wilson','F','2014-01-17','4020751573',NULL,1,24106,'2021-07-26',24106,0.15),(5455,'George','Gray','M','1952-03-03','8672827001','Platinum',15,16156,'2021-11-27',1077.1,0.05),(5976,'Mara','Keller',NULL,'2004-06-06','8000514863','Platinum',1,22438,'2022-01-12',22438,0.15),(6088,'Eleanor','Sharpe','F','1986-05-11',NULL,'Silver',7,9229,'2021-09-19',1318.4,0.1),(6151,'Snee','Marty','M','1971-10-02',NULL,'Platinum',25,23456,'2021-07-28',938.2,0.05),(6457,'Matt','St. James','M','2013-03-29','5186011052','Platinum',8,29795,'2021-10-13',3724.4,0.1),(6473,'DeeDee','Caddel','F','1971-03-17','4450812555','Gold',3,8028,'2021-10-09',2676,0.05),(7110,'Sam','West','M','1977-06-14',NULL,'Platinum',5,18996,'2022-03-15',3799.2,0.05),(7760,'Jim','Taylor','M','1974-06-08','5886648569','Platinum',11,22621,'2022-01-13',2056.5,0.15),(7887,'Sam','Mintz','M','2015-02-01','9951155468','Silver',11,4014,'2021-07-05',364.9,NULL),(8051,'Kaleb','Ogley',NULL,'1993-07-29','3326083159','Gold',19,980,'2021-09-15',51.6,NULL),(8590,'Elise','Levine','F','1999-06-05',NULL,'Platinum',19,5783,'2022-01-15',304.4,NULL),(8649,'Talia','Cassidy','F','1993-11-23','8321759966','Gold',20,9706,'2021-12-08',485.3,NULL),(8698,'Vivian','Ford','F','1955-12-30','9549962386','Silver',14,26839,'2021-08-04',1917.1,0.05),(8820,'Luna','Oatrun','F','1966-08-25','9025401044','Platinum',18,26507,'2022-03-09',1472.6,NULL),(8860,'Joe','Thatcher',NULL,'1971-06-06','5259520052','Silver',8,27836,'2021-08-21',3479.5,0.1),(9000,'Benjamin','Bird','M','1968-12-20','6296865068','Platinum',11,11206,'2022-01-23',1018.7,0.1),(9117,'Lucas','Singh','M','1994-08-17','5314080101','Gold',10,17594,'2022-05-07',1759.4,0.1),(9548,'Belinda','Green','F','1996-07-15','8393458185','Gold',24,352000,'2022-01-17',14666.7,0.15),(9744,'Ella','Moses','F','1973-01-13','8403088790','Platinum',23,7475,'2021-12-25',325,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservations` (
  `CustomerID` int(11) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `PurchaseDate` date NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `RegularPrice` int(11) DEFAULT NULL,
  `CostOfExtraServices` int(11) DEFAULT NULL,
  `PremiumRatio` text,
  `Class` text,
  `Seat` text,
  `BagTag` int(11) DEFAULT NULL,
  `CancelationWindow` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`RouteID`,`PurchaseDate`,`DepartureTime`,`ArrivalTime`),
  KEY `fk_res_has_customer` (`CustomerID`),
  KEY `fk_res_has_route` (`RouteID`),
  CONSTRAINT `fk_res_has_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_res_has_route` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (6,7,'2022-08-07','05:28:53','06:52:44',180,25,NULL,'Economy Plus','C34',NULL,12),(44,1,'2022-09-01','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(44,3,'2022-09-08','13:00:00','15:00:00',360,42,NULL,'Basic Economy','G23',NULL,30),(44,4,'2022-09-01','14:00:00','09:00:00',600,19,'1.5','Basic Economy','D09',NULL,2),(44,5,'2022-08-21','22:20:33','00:01:27',3200,800,'2.0','business ','H15',70,3),(44,7,'2022-08-07','05:28:53','06:52:44',856,NULL,'0.5','Basic Economy','G21',63,26),(44,13,'2022-09-08','22:52:33','04:20:39',793,0,'0.5','Basic Economy','A10',5,20),(44,18,'2022-08-09','12:49:14','02:50:18',3890,NULL,'1.5','First Class','F07',90,4),(97,1,'2022-08-26','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(97,2,'2022-08-17','11:00:00','12:00:00',320,80,'0.5','Basic Economy','A22',NULL,10),(220,1,'2022-08-26','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',90,20),(220,2,'2022-08-17','20:21:27','22:28:20',700,72,NULL,'Basic Economy','A21',NULL,9),(428,1,'2022-09-01','16:00:00','19:50:00',180,100,'1.0','Basic Economy','B23',86,10),(428,3,'2022-09-09','13:00:00','15:00:00',657,80,'1.0','Basic Economy',NULL,NULL,3),(428,4,'2022-08-06','14:00:00','09:00:00',290,32,'1.5','business ','H34',22,5),(428,4,'2022-09-28','14:00:00','09:00:00',290,32,NULL,'Basic Economy','D08',NULL,26),(428,7,'2022-08-30','05:28:53','06:52:44',796,NULL,NULL,'Basic Economy','B13',33,0),(428,10,'2022-08-30','09:47:08','15:12:15',900,0,'1.0','First Class','D02',75,2),(428,11,'2022-07-01','11:49:49','16:50:25',864,20,'0.5','Basic Economy','B01',95,15),(428,19,'2022-08-16','09:46:21','16:01:45',352,10,'0.5','Basic Economy','B13',NULL,30),(880,3,'2022-08-24','13:00:00','15:00:00',480,NULL,'2.0','First Class','G02',12,20),(880,13,'2022-08-09','22:52:33','04:20:39',700,70,'1.0','Economy Plus','D15',2,11),(1493,1,'2022-08-26','13:23:15','15:30:15',530,61,'0.5','Basic Economy','G43',NULL,10),(1493,1,'2022-09-03','16:00:00','19:50:00',180,100,'1.0','Economy Plus','B13',25,2),(1493,3,'2022-08-17','13:00:00','15:00:00',929,15,'0.5','Basic Economy',NULL,63,10),(1493,5,'2022-08-11','22:20:33','00:01:27',3200,88,'2.0','business ','H15',70,3),(1493,5,'2022-08-30','22:20:33','00:01:27',302,60,NULL,'Basic Economy','A25',48,15),(1493,7,'2022-08-07','05:28:53','06:52:44',407,0,'0.5','Basic Economy','B12',NULL,30),(1493,18,'2022-08-28','12:49:14','02:50:18',3890,0,'1.5','Basic Economy','A10',NULL,21),(1493,19,'2022-08-16','09:46:21','16:01:45',606,0,NULL,'Basic Economy',NULL,NULL,23),(2905,3,'2022-09-05','13:00:00','15:00:00',480,20,NULL,'Economy Plus','B08',NULL,30),(3032,3,'2022-08-11','19:45:08','21:45:21',800,70,'0.5','Basic Economy','C21',13,23),(3032,9,'2022-08-25','18:36:48','02:13:39',770,53,NULL,'Basic Economy','B23',NULL,10),(3032,18,'2022-08-25','12:49:14','02:50:18',3890,600,'2.0','business ','A1',25,21),(3152,1,'2022-08-21','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(3167,2,'2022-08-14','02:49:27','04:18:33',730,32,NULL,'First Class','A03',81,2),(3167,13,'2022-09-09','22:52:33','04:20:39',700,70,'2.0','Economy Plus','C12',1,3),(3726,1,'2022-08-26','16:00:00','19:50:00',1700,NULL,'2.0','business ','B01',33,0),(3726,1,'2022-09-02','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(3726,4,'2022-09-28','14:00:00','09:00:00',290,32,NULL,'Basic Economy','D20',32,10),(3726,10,'2022-08-30','09:47:08','15:12:15',900,98,'1.0','First Class','D01',75,2),(3726,11,'2022-08-26','11:49:49','16:50:25',525,70,'1.0','Basic Economy',NULL,NULL,23),(4167,1,'2022-08-24','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',95,20),(4167,3,'2022-09-10','13:00:00','15:00:00',864,15,NULL,'Basic Economy',NULL,23,23),(4569,1,'2022-07-01','13:23:15','15:30:15',408,88,NULL,'Basic Economy','H15',87,20),(4569,1,'2022-08-26','13:23:15','15:30:15',240,0,'0.0','Basic Economy','G21',NULL,0),(4569,3,'2022-08-17','13:00:00','15:00:00',889,14,'2.0','Basic Economy','A10',15,10),(4569,5,'2022-08-14','15:00:00','03:50:00',70,42,'0.5','Basic Economy','F20',9,0),(4569,8,'2022-08-31','06:16:48','07:13:39',121,0,NULL,'Basic Economy','C12',NULL,4),(4569,11,'2022-08-28','11:49:49','16:50:25',1900,500,'2.0','business ','B08',62,20),(4569,18,'2022-08-26','12:49:14','02:50:18',180,0,'0.5','Basic Economy','A10',NULL,21),(4569,19,'2022-08-21','18:25:24','15:03:24',99,80,NULL,'Basic Economy','D21',NULL,22),(4708,1,'2022-08-21','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',75,20),(5046,3,'2022-08-14','13:00:00','15:00:00',415,10,NULL,'Basic Economy',NULL,NULL,10),(5046,9,'2022-08-25','18:36:48','02:13:39',251,28,'1.0','Basic Economy','B22',87,0),(5046,18,'2022-08-26','12:49:14','02:50:18',3890,600,'2.0','business ','A2',24,21),(5209,1,'2022-08-21','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(5209,1,'2022-08-26','13:23:15','15:30:15',530,61,'0.5','Basic Economy','G12',NULL,0),(5209,3,'2022-08-17','13:00:00','15:00:00',530,0,'2.0','Basic Economy',NULL,70,30),(5209,5,'2022-08-11','22:20:33','00:01:27',3200,800,'2.0','business ','H15',70,3),(5209,5,'2022-08-26','19:45:08','21:45:21',800,70,'1.0','Basic Economy','C21',13,23),(5209,7,'2022-07-01','05:28:53','06:52:44',199,55,'0.5','Basic Economy','A10',5,23),(5209,18,'2022-08-26','12:49:14','02:50:18',390,0,NULL,'Basic Economy','A10',NULL,21),(5455,2,'2022-08-14','02:49:27','04:18:33',730,32,'1.0','First Class','A03',81,15),(5455,11,'2022-09-01','14:56:31','00:01:27',2500,200,'2.0','Economy Plus','H11',19,30),(5976,1,'2022-08-25','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',55,20),(5976,2,'2022-08-17','11:00:00','12:00:00',320,80,'0.5','Basic Economy','A23',NULL,7),(6088,1,'2022-07-02','13:23:15','15:30:15',135,15,'2.0','Basic Economy','G40',53,0),(6088,1,'2022-08-26','13:23:15','15:30:15',240,30,NULL,'Basic Economy','G20',NULL,10),(6088,3,'2022-08-17','13:00:00','15:00:00',116,0,'0.5','Basic Economy',NULL,NULL,30),(6088,5,'2022-08-11','22:20:33','00:01:27',3200,80,'2.0','business ','H15',70,3),(6088,5,'2022-08-21','22:20:33','00:01:27',135,20,NULL,'Basic Economy','A22',39,30),(6088,8,'2022-08-31','06:16:48','07:13:39',121,0,NULL,'Basic Economy','C11',NULL,0),(6088,18,'2022-08-26','12:49:14','02:50:18',121,15,NULL,'Basic Economy','A11',NULL,21),(6151,1,'2022-08-30','16:00:00','19:50:00',180,100,'1.0','Economy Plus','B13',77,2),(6473,1,'2022-09-03','13:23:15','15:30:15',929,0,'2.0','Economy Plus','A07',20,0),(7110,3,'2022-09-04','13:00:00','15:00:00',700,NULL,'2.0','Economy Plus','B07',NULL,30),(7760,3,'2022-09-06','13:00:00','15:00:00',480,88,NULL,'Economy Plus','B09',NULL,30),(8051,1,'2022-07-01','13:23:15','15:30:15',300,61,'0.5','Basic Economy','G40',NULL,0),(8051,1,'2022-08-26','13:23:15','15:30:15',240,20,NULL,'Basic Economy','G22',NULL,20),(8051,3,'2022-08-16','13:00:00','15:00:00',279,68,'1.0','Basic Economy','B13',NULL,15),(8051,5,'2022-08-14','22:20:33','00:01:27',890,97,'1.5','Basic Economy','A11',94,30),(8051,9,'2022-09-10','18:36:48','02:13:39',553,15,'0.5','Basic Economy','B24',59,30),(8051,11,'2022-08-26','11:49:49','16:50:25',1900,NULL,'2.0','business ','H01',NULL,10),(8051,18,'2022-08-24','12:49:14','02:50:18',158,59,'0.5','Basic Economy','A22',24,23),(8051,19,'2022-08-21','18:25:24','15:03:24',776,70,'0.5','Basic Economy','A22',NULL,30),(8590,1,'2022-08-26','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G23',NULL,20),(8590,2,'2022-08-17','20:21:27','22:28:20',700,72,NULL,'Basic Economy','A20',33,30),(8649,1,'2022-08-26','13:23:15','15:30:15',300,20,'0.5','Basic Economy','G22',23,20),(8649,2,'2022-09-07','11:00:00','12:00:00',320,80,NULL,'Basic Economy','H06',9,30),(8649,3,'2022-08-16','13:00:00','15:00:00',878,0,'0.5','Basic Economy','H15',NULL,7),(8649,7,'2022-09-05','05:28:53','06:52:44',637,NULL,NULL,'Basic Economy','G23',34,10),(8649,9,'2022-08-28','18:36:48','02:13:39',2510,0,'1.0','Basic Economy','G02',NULL,27),(8649,11,'2022-08-26','11:49:49','16:50:25',1900,96,'2.0','business ','H02',NULL,12),(8649,18,'2022-08-09','12:49:14','02:50:18',89,0,'2.0','Basic Economy',NULL,34,20),(8649,19,'2022-08-21','18:25:24','15:03:24',831,15,NULL,'Basic Economy',NULL,10,30),(8698,1,'2022-09-03','16:00:00','19:50:00',1000,100,NULL,'Basic Economy','B24',54,30),(8698,4,'2022-09-28','14:00:00','09:00:00',290,32,NULL,'Basic Economy','D51',30,0),(8698,5,'2022-08-25','19:45:08','21:45:21',800,70,'1.0','First Class','D08',22,7),(8698,11,'2022-08-26','11:49:49','16:50:25',994,85,'1.5','Basic Economy','B13',NULL,30),(8698,19,'2022-08-16','09:46:21','16:01:45',1700,14,'1.5','Economy Plus','D38',74,12),(8820,1,'2022-08-26','13:23:15','15:30:15',530,61,'0.5','Basic Economy','G41',NULL,0),(8820,1,'2022-09-04','13:23:15','15:30:15',1300,42,'2.0','Economy Plus','G40',80,1),(8820,3,'2022-08-28','19:45:08','21:45:21',800,70,'2.0','Basic Economy','C20',13,23),(8820,4,'2022-08-06','14:00:00','09:00:00',290,22,'1.5','Basic Economy','C21',83,0),(8820,5,'2022-08-21','22:20:33','00:01:27',3200,800,'1.0','business ','H15',70,3),(8820,7,'2022-08-07','05:28:53','06:52:44',800,0,'0.5','Basic Economy','G23',15,30),(8820,18,'2022-08-30','12:49:14','02:50:18',890,60,'1.5','Basic Economy','A10',NULL,21),(8860,1,'2022-09-02','16:00:00','19:50:00',700,100,'1.0','Economy Plus','B20',15,0),(9000,1,'2022-09-03','16:00:00','19:50:00',180,NULL,'1.0','Economy Plus','B13',NULL,8),(9117,1,'2022-08-26','16:00:00','19:50:00',180,100,'1.0','Basic Economy','B22',8,0),(9117,2,'2022-09-06','11:00:00','12:00:00',320,80,NULL,'Basic Economy','H05',1,3),(9117,3,'2022-08-16','13:00:00','15:00:00',831,10,NULL,'Basic Economy','A11',93,23),(9117,9,'2022-08-26','18:36:48','02:13:39',331,28,'0.5','Basic Economy','B20',48,0),(9117,11,'2022-08-26','11:49:49','16:50:25',1900,39,'2.0','business ','H05',NULL,12),(9548,3,'2022-08-14','13:00:00','15:00:00',810,80,'0.5','Basic Economy',NULL,24,30),(9548,9,'2022-08-26','18:36:48','02:13:39',266,100,'1.0','Basic Economy','B01',12,0),(9548,11,'2022-08-03','11:49:49','16:50:25',1900,500,'1.0','business ','B01',3,10),(9744,3,'2022-09-07','13:00:00','15:00:00',480,20,NULL,'Economy Plus','B11',25,30);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `routes` (
  `RouteID` int(11) NOT NULL,
  `FlightNumber` int(11) DEFAULT NULL,
  `Origin` text,
  `Destination` text,
  `AircraftID` int(11) DEFAULT NULL,
  `Distance` int(11) DEFAULT NULL,
  `OntimeRate` float DEFAULT NULL,
  `WeeklyFlights` int(11) DEFAULT NULL,
  `CrewSize` int(11) DEFAULT NULL,
  `NumberOfMeals` int(11) DEFAULT NULL,
  `FlightType` text,
  PRIMARY KEY (`RouteID`),
  KEY `fk_route_has_aircraft` (`AircraftID`),
  CONSTRAINT `fk_route_has_aircraft` FOREIGN KEY (`AircraftID`) REFERENCES `aircrafts` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,101,'STL','SEA',798,11800,87,2,15,1,'Long'),(2,102,'LAS','SEA',788,400,97,5,10,0,'Short'),(3,103,'LAS','CLT',790,12000,95,1,12,2,NULL),(4,104,'ATL','ORD',794,1390,90,4,20,1,'Intermediate'),(5,105,'PHX','MCO',901,1600,78,2,8,0,'Intermediate'),(6,106,'ORD','BOS',847,20000,98,1,NULL,3,'Long'),(7,107,'SYR','CLT',978,1120,79,4,9,1,'Intermediate'),(8,108,'ANI','AKN',950,2291,89,1,5,1,'Short'),(9,109,'ATL','HNL',850,17557,99,3,10,2,'Long'),(10,110,'LAX','SBA',902,16912,60,9,6,1,NULL),(11,111,'AEX','HYS',917,11656,77,5,10,NULL,'Long'),(12,112,'ILM','PDX',772,7261,87,8,7,NULL,NULL),(13,113,'OMA','LAS',964,15650,62,5,NULL,2,'Long'),(14,114,'DEN','SJC',888,571,65,6,8,NULL,'Short'),(15,115,'PIT','MYR',996,3850,76,NULL,7,1,'Intermediate'),(16,116,'MCO','STL',909,17201,68,NULL,10,1,'Long'),(17,117,'ATL','MIA',781,1684,73,NULL,5,NULL,'Short'),(18,118,'BNA','AUS',740,9459,59,1,7,1,'Intermediate'),(19,119,'HNL','MIA',925,18909,98,1,14,3,'Long'),(20,120,'CMH','PDX',787,2721,97,2,10,1,'Intermediate'),(21,122,'ORD','STL',950,425,76,NULL,4,NULL,'Short'),(22,123,'ORD','LAX',917,1741,66,2,4,0,'Intermediate');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 12:23:20
