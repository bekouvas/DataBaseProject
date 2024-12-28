-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.40

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

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` char(6) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('45Tn34','Giannis Antetokounmpo','jonhant@gmail.com','6984125347'),('4K78k1','Marios Papadopoulos','papadm@gmail.com','6923654891'),('kl41','Maria Geronikolou','marakig@gmail.com','6932600548'),('n1P65','Orfeas Nikolopoulos','orfeasomorfos@yahoo.gr','6914702015'),('Okl641','Dimitris Panagiotopoulos','mhtsosPan@gmail.com','6902547863'),('Sd1452','Nick Caltathes','nickkal@gmail.com','6985475698'),('W968n1','Dimitra Tervou','Dimitratervou@gmail.com','6914203065');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!50001 DROP VIEW IF EXISTS `customer_log`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_log` AS SELECT 
 1 AS `RestaurantName`,
 1 AS `ReservationDate`,
 1 AS `PreorderRequests`,
 1 AS `RestaurantRating`,
 1 AS `ReservationStatus`,
 1 AS `CustomerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `NotificationID` char(6) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `NotificationType` varchar(12) NOT NULL,
  `DateSent` varchar(10) NOT NULL,
  `CustomerID` char(6) DEFAULT NULL,
  PRIMARY KEY (`NotificationID`),
  KEY `FK_Notification_Customer` (`CustomerID`),
  CONSTRAINT `FK_Notification_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('0Kl36','Reminder: You have a resernation today at 20:00PM','Reminder','24/12/2024','45Tn34'),('23A89','You have cancel your reservation!','Confirmation','21/12/2024','Okl641'),('48fT63','Your reservation is completed!','Confirmation','02/12/2024','Sd1452'),('975p3','Your reservation is completed!','Confirmation','08/10/2024','W968n1'),('98lP','Your reservation is paid!','Confirmation','06/12/2024','4K78k1'),('RT567','Reminder: You have a resernation today at 21:00PM','Reminder','07/12/2024','n1P65'),('TRE34','You are now on the second place in queue!','Inform','09/12/2024','kl41');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` char(6) NOT NULL,
  `Status` tinyint NOT NULL,
  `Method` varchar(15) NOT NULL,
  `Amount` float NOT NULL,
  `ReservationID` char(6) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_Payment_Reservation` (`ReservationID`),
  CONSTRAINT `FK_Payment_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('134',0,'Mastercard',50,'E475'),('3jj65',1,'Visa',71.45,'HET45'),('4ow1',1,'Visa',105.7,'ERT56'),('aa2',0,'PayPal',38,'TK689'),('hB12',1,'ApplePay',23.5,'C153'),('jk23b6',1,'PayPal',43.7,'60');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pendingpayments`
--

DROP TABLE IF EXISTS `pendingpayments`;
/*!50001 DROP VIEW IF EXISTS `pendingpayments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pendingpayments` AS SELECT 
 1 AS `ReservationID`,
 1 AS `RestaurantName`,
 1 AS `TotalAmount`,
 1 AS `PaymentMethod`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preorder`
--

DROP TABLE IF EXISTS `preorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preorder` (
  `PreOrderID` char(6) NOT NULL,
  `Status` tinyint NOT NULL,
  `SpecialRequest` varchar(200) DEFAULT NULL,
  `ReservationID` char(6) DEFAULT NULL,
  PRIMARY KEY (`PreOrderID`),
  KEY `FK_PreOrder_Reservation` (`ReservationID`),
  CONSTRAINT `FK_PreOrder_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preorder`
--

LOCK TABLES `preorder` WRITE;
/*!40000 ALTER TABLE `preorder` DISABLE KEYS */;
INSERT INTO `preorder` VALUES ('475',1,'Can’t eat pepper','E475'),('560',1,'No salt in my food','60'),('C143',0,'Alergic to oregano','C153'),('ET56',1,'vegetarian','ERT56'),('HRT45',1,'I don’t eat onions','HET45'),('RIT5',1,'vegan','23ERT'),('TA689',0,'I want my stake well cooked','TK689');
/*!40000 ALTER TABLE `preorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` char(6) NOT NULL,
  `Time` varchar(5) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `NumberOfCustomers` int NOT NULL,
  `Status` tinyint NOT NULL,
  `CustomerID` char(6) DEFAULT NULL,
  `RestaurantID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `FK_Reservation_Customer` (`CustomerID`),
  KEY `FK_Reservation_Restaurant` (`RestaurantID`),
  CONSTRAINT `FK_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reservation_Restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('23ERT','18.00','19/12/2024',4,0,'W968n1','35pR3'),('60','14.00','26/12/2024',2,1,'n1P65','10k10'),('C153','20.00','22/12/2024',4,1,'Sd1452','X1536'),('E475','22.00','12/12/2024',5,1,'45Tn34','T20h9'),('ERT56','16.00','17/12/2024',2,0,'kl41','8lO91'),('HET45','21.30','2/12/2024',3,1,'4K78k1','29P45'),('TK689','13.30','5/12/2024',7,1,'Okl641','352Sa');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` char(6) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `RatingAverage` float DEFAULT NULL,
  `OpeningHours` varchar(15) DEFAULT NULL,
  `StartDate` varchar(10) DEFAULT NULL,
  `RestaurantAdministratorID` char(6) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`),
  KEY `FK_Restaurant_Admin` (`RestaurantAdministratorID`),
  CONSTRAINT `FK_Restaurant_Admin` FOREIGN KEY (`RestaurantAdministratorID`) REFERENCES `restaurantadministrator` (`RestaurantAdministratorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES ('10k10','Signora Tratoria','Venizelou 89, Thessaloniki 54879','2310004596',5,'12:00PM-2:00AM','18/09/2005','560'),('29P45','Ouzo ston pinaka','Balanou Street 27, Thessaloniki 54623','2310765984',4.9,'11:00AM-23:00PM','15/09/2020','HRT45'),('352Sa','Mavri Thalassa','Nick. Plastiras 3,Kalamaria 551 32','2310532467',4.2,'12:00PM-1:00AM','14/07/2017','TA689'),('35pR3','Loupino','Andrianoupoleos 27,Thessaloniki 57845','2310856541',3.9,'11:00AM-1:00AM','21/12/2010','RIT5'),('8lO91','Bakal','Tsimiski 45, Thessaloniki 56987','2310759642',3.7,'12:00PM-1:00AM','19/08/2021','ET56'),('T20h9','Anama','Kolokotroni 10, Evosmos 56224','2310589647',4.8,'12:00PM-3:00AM','13/05/2009','475'),('X1536','Mamalouka','Ionos Dragoumi 3, Thessaloniki 54625','2310555223',4.5,'12:00PM-1:00AM','11/12/2010','C143');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantadministrator`
--

DROP TABLE IF EXISTS `restaurantadministrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantadministrator` (
  `RestaurantAdministratorID` char(6) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`RestaurantAdministratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantadministrator`
--

LOCK TABLES `restaurantadministrator` WRITE;
/*!40000 ALTER TABLE `restaurantadministrator` DISABLE KEYS */;
INSERT INTO `restaurantadministrator` VALUES ('475','Chriderm@gmail.com'),('560','Tekrezimaria@gmail.com'),('C143','Chrysakarag@gmail.com'),('ET56','Annapapadopoulou@gmail.com'),('HRT45','Alexpapadop@gmail.com'),('RIT5','Pinelopikaravasili@gamil.com'),('TA689','Anastasiabouboureli@gmail.com');
/*!40000 ALTER TABLE `restaurantadministrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` char(6) NOT NULL,
  `Comments` varchar(200) DEFAULT NULL,
  `Rating` float NOT NULL,
  `Date` varchar(10) NOT NULL,
  `CustomerID` char(6) DEFAULT NULL,
  `RestaurantID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `FK_Review_Customer` (`CustomerID`),
  KEY `FK_Review_Restaurant` (`RestaurantID`),
  CONSTRAINT `FK_Review_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Review_Restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('12','The food was great . Prices were a bit expensive.',4.5,'17/12/2024','Sd1452','X1536'),('3567T','Nice place, good prices.',3.9,'12/12/2024','n1P65','10k10'),('578ER','Best souvlaki in salonika.',5,'12/12/2024','45Tn34','T20h9'),('BR456','AWFUL FOOD, RUDE PEOPLE,0/5, !!!',0,'5/12/2024','4K78k1','29P45'),('HRTI8','Will definately vist again, really good restaurant.',4.8,'3/12/2024','Okl641','352Sa');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `TableID` char(6) NOT NULL,
  `Status` tinyint DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Location` varchar(10) DEFAULT NULL,
  `RestaurantID` char(6) DEFAULT NULL,
  PRIMARY KEY (`TableID`),
  KEY `FK_Table_Restaurant` (`RestaurantID`),
  CONSTRAINT `FK_Table_Restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES ('10',0,4,'Indoor','X1536'),('12',1,4,'Indoor','35pR3'),('2',0,8,'Indoor','29P45'),('30',1,2,'Outdoor','352Sa'),('4',1,7,'Indoor','8lO91'),('5',1,3,'Indoor','10k10'),('9',1,7,'Outdoor','T20h9');
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlist`
--

DROP TABLE IF EXISTS `waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist` (
  `WaitlistID` char(6) NOT NULL,
  `PlaceInQueue` int NOT NULL,
  `CustomerID` char(6) DEFAULT NULL,
  `RestaurantID` char(6) DEFAULT NULL,
  PRIMARY KEY (`WaitlistID`),
  KEY `FK_Waitlist_Customer` (`CustomerID`),
  KEY `FK_Waitlist_Restaurant` (`RestaurantID`),
  CONSTRAINT `FK_Waitlist_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Waitlist_Restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlist`
--

LOCK TABLES `waitlist` WRITE;
/*!40000 ALTER TABLE `waitlist` DISABLE KEYS */;
INSERT INTO `waitlist` VALUES ('1',2,'Sd1452','X1536'),('11',12,'45Tn34','T20h9'),('12',3,'kl41','8lO91'),('3',5,'4K78k1','29P45'),('4',6,'W968n1','35pR3'),('7',9,'Okl641','352Sa'),('9',4,'n1P65','10k10');
/*!40000 ALTER TABLE `waitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_log`
--

/*!50001 DROP VIEW IF EXISTS `customer_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_log` AS select `r`.`Name` AS `RestaurantName`,`res`.`Date` AS `ReservationDate`,`pre`.`SpecialRequest` AS `PreorderRequests`,`rev`.`Rating` AS `RestaurantRating`,`res`.`Status` AS `ReservationStatus`,`res`.`CustomerID` AS `CustomerID` from (((`restaurant` `r` join `reservation` `res` on((`r`.`RestaurantID` = `res`.`RestaurantID`))) left join `preorder` `pre` on((`res`.`ReservationID` = `pre`.`ReservationID`))) left join `review` `rev` on((`res`.`RestaurantID` = `rev`.`RestaurantID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pendingpayments`
--

/*!50001 DROP VIEW IF EXISTS `pendingpayments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pendingpayments` AS select `res`.`ReservationID` AS `ReservationID`,`r`.`Name` AS `RestaurantName`,`pay`.`Amount` AS `TotalAmount`,`pay`.`Method` AS `PaymentMethod` from (((`payment` `pay` join `reservation` `res` on((`pay`.`ReservationID` = `res`.`ReservationID`))) join `customer` `c` on((`res`.`CustomerID` = `c`.`CustomerID`))) join `restaurant` `r` on((`res`.`RestaurantID` = `r`.`RestaurantID`))) where (`pay`.`Status` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-28  1:57:50
