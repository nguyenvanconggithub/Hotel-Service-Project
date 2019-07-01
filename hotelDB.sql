-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `passWord` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('babahotel1','123456','1',1),('chuhotelgo1','123456','1',1),('chuhotelten1','123456','1',1),('chuKS1','123456','1',1),('duongks0','1','1',1),('duongksnb','1','1',1),('duongksnb0','1','1',1),('hotelmanager2','1234','1',1),('kakichuks1','123456','1',1),('luat2','1234','1',1),('luathotel2','1234','1',1),('luatnewuser2','1234','2',1),('luatuser2','1234','1',1),('makesomeawsome1','123456','1',1),('mamahotel1','123456','1',1),('managerhotel2','1234','1',1),('nguyenphuluat2','1234','1',1),('taikhoanchuks1','123456','1',1),('toilaai1234','123456','2',1),('user0','1','2',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bed` (
  `idBed` int(11) NOT NULL AUTO_INCREMENT,
  `bedName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idBed`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,'Giường Đơn'),(2,'Giường Đôi'),(3,'Giường Gia Đình'),(4,'Hai Giường Đôi');
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booking` (
  `idBooking` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `bookingTime` datetime DEFAULT NULL,
  `checkIn` date DEFAULT NULL,
  `checkOut` date NOT NULL,
  `note` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idHotel` int(11) DEFAULT NULL,
  `statusBooking` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBooking`),
  KEY `fk_booking_user_idx` (`idUser`),
  KEY `fk_booking_hotel_idx` (`idHotel`),
  CONSTRAINT `fk_booking_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailbooking`
--

DROP TABLE IF EXISTS `detailbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detailbooking` (
  `idRoom` int(11) NOT NULL,
  `idBooking` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `bookingNumber` int(11) DEFAULT NULL,
  `ownRoomName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idHotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRoom`,`idBooking`),
  KEY `fk_booking_idx` (`idHotel`),
  CONSTRAINT `fk_booking` FOREIGN KEY (`idHotel`) REFERENCES `booking` (`idHotel`),
  CONSTRAINT `fk_detail_room` FOREIGN KEY (`idRoom`) REFERENCES `room` (`idRoom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailbooking`
--

LOCK TABLES `detailbooking` WRITE;
/*!40000 ALTER TABLE `detailbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `detailbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `SDT` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idHotel`),
  KEY `fk_hotel_account` (`userName`),
  FULLTEXT KEY `index_name` (`hotelName`),
  FULLTEXT KEY `hotelName` (`hotelName`),
  FULLTEXT KEY `address` (`address`),
  FULLTEXT KEY `hotelName_2` (`hotelName`),
  FULLTEXT KEY `address_2` (`address`),
  CONSTRAINT `fk_hotel_account` FOREIGN KEY (`userName`) REFERENCES `account` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Hightview Apartment, Near Ben Thanh Market',4,'151-155 Ben Van Don Street Hightview, River Gate Residence, District 4, HCM City','chuKS1',0,0,'0364788745'),(2,'Phan Anh Backpackers Hotel',3,'373/6 Phạm Ngũ Lão, Quận 1, TP HCM','chuKS1',0,0,'0356664478'),(3,' Grand Hotel Saigon',4,'8 Đồng Khởi Street, Quận 1, TP HCM','taikhoanchuks1',0,0,'0345554747'),(4,'Khách Sạn Aloha Saigon',2,'24/3 Đỗ Quan Đấu, Phạm Ngũ Lão, Quận 1,  HCM','kakichuks1',0,0,'0345554746'),(5,'Rising Dragon Villa Hotel',5,'43A Bat Su Street, Quận Hoàn Kiếm, Hà Nội','duongksnb',0,0,'0123456789'),(6,'Aria Grand Hotel',5,'Ngu Hanh Son District,, Đà Nẵng, Việt Nam','hotelmanager2',0,0,'0845303509'),(7,'Mercure Danang French Village Bana Hills',4,'An Son Hamlet, Hoa Ninh Commune, Hoa Vang Dist, Đà Nẵng, Việt Nam','hotelmanager2',0,0,'0845303509'),(8,'Sweet Home',1,' 41 An Thượng 3, Đà Nẵng, Việt Nam ','hotelmanager2',0,0,'0845303509'),(9,'The Queen Hotel & Spa',5,'67 Thuốc Bắc, Hàng Bồ, Hàng Bồ, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongksnb',0,0,'0000000000'),(10,'Mai Villa And Apartment',3,'37 Che Lan Vien, Ngu Hanh Son, Da Nang, Đà Nẵng, Việt Nam','hotelmanager2',0,0,'0845303509'),(11,'Luxury Furama DaNaTrip Villas',3,'  Furama Resort Da Nang, 107 Võ Nguyên Giáp, Ngũ Hành Sơn, Đà Nẵng, Việt Nam','hotelmanager2',0,1,'0845303509'),(12,'Grand Plaza Hanoi Hotel',5,'117 Trần Duy Hưng, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội, Việt Nam','duongksnb',0,0,'0333333333'),(13,'Luxury Furama DaNaTrip Villas',3,'Furama Resort Da Nang, 107 Võ Nguyên Giáp, Ngũ Hành Sơn, Đà Nẵng, Việt Nam','luathotel2',0,0,'0845303509'),(14,'Nam\'s Apartment',3,'26 Lê Lộ, Đà Nẵng, Việt Nam ','luathotel2',0,0,'0845303509'),(15,'OYO 212 Luxury Hotel Da Nang',3,'167 Tôn Đản, Hoà An, Cẩm Lệ, Đà Nẵng 550000, Việt Nam, Da-Nang, Đà Nẵng, Việt Nam','luathotel2',0,0,'0845303509'),(16,'AZ Hanoi Hostel',5,'27 Bát Đàn, Hàng Bồ, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongksnb0',0,0,'0333333333'),(17,'Tiffany House Da Nang',2,' 1 Mỹ Khê 1, Đà Nẵng, Việt Nam','managerhotel2',0,0,'0845303509'),(18,'Hangmy Boutique Hotel',5,'41 Hang Quat, Hoan Kiem, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongksnb0',0,0,'0337493535'),(19,'Lighting Hotel',2,'Lot G5, Pham Van Dong, Quan Son Tra, 550000 Đà Nẵng, Việt Nam','managerhotel2',0,0,'0845303509'),(20,'Eco Luxury Hotel Hanoi',5,'17 Cua Dong, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongksnb0',0,0,'0333333333'),(21,'Garden & Pool Signature Rivergate',4,'151 155 ben van don, District 4, Ho Chi Minh City, Vietnam','chuhotelten1',0,0,'0354747474'),(22,'A La Carte Da Nang Beach ',4,'200 Vo Nguyen Giap Street, Son Tra District, Đà Nẵng, Việt Nam','managerhotel2',0,0,'0845303509'),(23,'Hanoi Chic Hotel ',5,'18 Hang Hom Street, Quận Hoàn Kiếm, Hà Nội, Việt Nam ','duongksnb0',0,0,'0333333333'),(24,'Queen\'s Finger Hotel Da Nang',3,' 155-157 Le Quang Dao, Ngu Hanh Son, Đà Nẵng, Việt Nam','luat2',0,0,'0845303509'),(25,'Cherish Central Hotel & Apartment',3,'5/10 Nguyen Sieu, Ben Nghe Ward, District 1, District 1, Ho Chi Minh City, Vietnam','makesomeawsome1',0,0,'0364747458'),(26,'Hanoi 3B Premier Hotel',5,'67 Hang Than, Quận Ba Đình, Hà Nội, Việt Nam','duongks0',0,0,'0333333333'),(27,'North East Hotel',3,'Lot 5 - 6 An Thuong 29, Đà Nẵng, Việt Nam','luat2',0,0,'0845303509'),(28,'Khách Sạn Homie',3,'1051 Hoang Sa, District 3, Ho Chi Minh City, Vietnam','chuhotelgo1',0,0,'0345558888'),(29,'My Moon Hotel Hanoi',5,'59 Cua Dong, Hoan Kiem, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongks0',0,0,'0333333333'),(30,'Christina\'s Da Nang',3,'197 Lê Quang Đạo, Đà Nẵng, Việt Nam ','luat2',0,0,'0845303509'),(31,'Villa Pool The Ocean',1,'Trường Sa, Ngũ Hành Sơn, Hoà Hải, Đà Nẵng Resort Villa Ocean Beach, Đà Nẵng, Việt Nam','nguyenphuluat2',0,0,'0845303509'),(32,'Vinhomes Central Park-Luxury Arpartment',5,'208 Nguyễn Hữu Cảnh, Quận Bình Thạnh, Ho Chi Minh City, Vietnam','mamahotel1',0,0,'0364755588'),(33,'The Code Hotel & Spa',4,'Khu A2.3, Đường Hoàng Sa, Phường Thọ Quang, Quận Sơn Trà, Đà Nẵng, Việt Nam','nguyenphuluat2',0,0,'0845303509'),(34,'One Opera Danang Hotel',5,'115 Nguyen Van Linh ,Hai Chau, Đà Nẵng, Việt Nam','nguyenphuluat2',0,0,'0845303509'),(35,'Cozrum Homes Lý Chính Thắng',2,'07/07 Lý Chính Thắng, Phường 08, Quận 03, District 3, Ho Chi Minh City, Vietnam','babahotel1',0,0,'0364887547'),(36,'Centre Point Hanoi Hotel',5,'25 Hang Hanh, Hoan Kiem District, Quận Hoàn Kiếm, Hà Nội, Việt Nam','duongks0',0,0,'0333333333');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelimage`
--

DROP TABLE IF EXISTS `hotelimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotelimage` (
  `idHotelImage` int(11) NOT NULL AUTO_INCREMENT,
  `linkImage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idHotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHotelImage`),
  KEY `fk_hotel_image_idx` (`idHotel`),
  CONSTRAINT `fk_hotelimage` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelimage`
--

LOCK TABLES `hotelimage` WRITE;
/*!40000 ALTER TABLE `hotelimage` DISABLE KEYS */;
INSERT INTO `hotelimage` VALUES (1,'images/chuKS1HOTEL1198209805.jpg',1),(2,'images/chuKS1HOTEL2193231359.jpg',1),(3,'images/chuKS1HOTEL3198210033.jpg',1),(4,'images/chuKS1HOTEL4206804334.jpg',1),(5,'images/chuKS1HOTEL5189747016.jpg',2),(6,'images/chuKS1HOTEL6189747035.jpg',2),(7,'images/chuKS1HOTEL7189747908.jpg',2),(8,'images/taikhoanchuks1HOTEL87021199.jpg',3),(9,'images/taikhoanchuks1HOTEL9170828171.jpg',3),(10,'images/taikhoanchuks1HOTEL10170829702.jpg',3),(11,'images/taikhoanchuks1HOTEL11196407744.jpg',3),(12,'images/taikhoanchuks1HOTEL12196407753.jpg',3),(13,'images/taikhoanchuks1HOTEL13196407819.jpg',3),(14,'images/kakichuks1HOTEL14139090775.jpg',4),(15,'images/kakichuks1HOTEL15139090785.jpg',4),(16,'images/kakichuks1HOTEL16139090795.jpg',4),(17,'images/kakichuks1HOTEL17139090799.jpg',4),(18,'images/kakichuks1HOTEL18139090804.jpg',4),(19,'images/duongksnbHOTEL19rising2.jpg',5),(20,'images/duongksnbHOTEL20rsww.jpg',5),(21,'images/duongksnbHOTEL21rising3.jpg',5),(22,'images/duongksnbHOTEL22risng4.jpg',5),(25,'images/hotelmanager2HOTEL25167163711.jpg',6),(26,'images/hotelmanager2HOTEL26167495035.jpg',6),(30,'images/hotelmanager2HOTEL30191514459.jpg',6),(31,'images/hotelmanager2HOTEL31193595810.jpg',6),(33,'images/hotelmanager2HOTEL33196352180.jpg',6),(36,'images/hotelmanager2HOTEL36197327477.jpg',6),(37,'images/hotelmanager2HOTEL37197327911.jpg',6),(41,'images/hotelmanager2HOTEL41199919716.jpg',6),(45,'images/hotelmanager2HOTEL4553941948.jpg',7),(46,'images/hotelmanager2HOTEL4653941949.jpg',7),(49,'images/hotelmanager2HOTEL4958986104.jpg',7),(66,'images/hotelmanager2HOTEL66175412218.jpg',7),(68,'images/hotelmanager2HOTEL68190393927.jpg',7),(70,'images/hotelmanager2HOTEL69198182952.jpg',8),(71,'images/hotelmanager2HOTEL71198182954.jpg',8),(72,'images/hotelmanager2HOTEL72198182980.jpg',8),(73,'images/hotelmanager2HOTEL73198183041.jpg',8),(74,'images/duongksnbHOTEL74qe3.jpeg',9),(75,'images/duongksnbHOTEL75qe2',9),(76,'images/duongksnbHOTEL76qe1',9),(77,'images/hotelmanager2HOTEL77203373226.jpg',10),(78,'images/hotelmanager2HOTEL78203373262.jpg',10),(79,'images/hotelmanager2HOTEL79203374856.jpg',10),(80,'images/hotelmanager2HOTEL80203485540.jpg',10),(81,'images/hotelmanager2HOTEL81161125227.jpg',11),(82,'images/hotelmanager2HOTEL82161125271.jpg',11),(83,'images/hotelmanager2HOTEL83163602636.jpg',11),(84,'images/hotelmanager2HOTEL84191720041.jpg',11),(85,'images/duongksnbHOTEL85gr1',12),(86,'images/duongksnbHOTEL86gr2',12),(87,'images/duongksnbHOTEL87gr3',12),(88,'images/luathotel2HOTEL88161125227.jpg',13),(89,'images/luathotel2HOTEL89161125271.jpg',13),(90,'images/luathotel2HOTEL90163602636.jpg',13),(91,'images/luathotel2HOTEL91191720041.jpg',13),(92,'images/luathotel2HOTEL92196247178.jpg',14),(93,'images/luathotel2HOTEL93197965655.jpg',14),(94,'images/luathotel2HOTEL94197965667.jpg',14),(95,'images/luathotel2HOTEL95197966424.jpg',14),(96,'images/luathotel2HOTEL96196964394.jpg',15),(97,'images/luathotel2HOTEL97196964396.jpg',15),(98,'images/luathotel2HOTEL98196964400.jpg',15),(99,'images/duongksnb0HOTEL991.jpeg',16),(100,'images/duongksnb0HOTEL1002',16),(101,'images/duongksnb0HOTEL1013',16),(102,'images/managerhotel2HOTEL102192540875.jpg',17),(103,'images/managerhotel2HOTEL103192542018.jpg',17),(104,'images/managerhotel2HOTEL104194425961.jpg',17),(105,'images/managerhotel2HOTEL105200073534.jpg',17),(106,'images/managerhotel2HOTEL106200073750.jpg',17),(107,'images/duongksnb0HOTEL1074.jpg',18),(108,'images/duongksnb0HOTEL1083',18),(109,'images/duongksnb0HOTEL1092',18),(110,'images/duongksnb0HOTEL1101.jpg',18),(111,'images/managerhotel2HOTEL111162629431.jpg',19),(112,'images/managerhotel2HOTEL112185362145.jpg',19),(113,'images/managerhotel2HOTEL113201181824.jpg',19),(114,'images/managerhotel2HOTEL114201894221.jpg',19),(115,'images/managerhotel2HOTEL115201894791.jpg',19),(116,'images/duongksnb0HOTEL1162',20),(117,'images/duongksnb0HOTEL1173',20),(118,'images/duongksnb0HOTEL1181.jpg',20),(119,'images/chuhotelten1HOTEL119139217969.jpg',21),(120,'images/chuhotelten1HOTEL120141575134.jpg',21),(121,'images/chuhotelten1HOTEL121148168998.jpg',21),(122,'images/managerhotel2HOTEL12235160746.jpg',22),(123,'images/managerhotel2HOTEL12335160850.jpg',22),(124,'images/managerhotel2HOTEL12484387996.jpg',22),(125,'images/managerhotel2HOTEL12584509970.jpg',22),(126,'images/managerhotel2HOTEL126194664981.jpg',22),(127,'images/duongksnb0HOTEL1271.jpg',23),(128,'images/duongksnb0HOTEL1283',23),(129,'images/duongksnb0HOTEL1292',23),(130,'images/luat2HOTEL130187021208.jpg',24),(131,'images/luat2HOTEL131187021210.jpg',24),(132,'images/luat2HOTEL132187033377.jpg',24),(133,'images/luat2HOTEL133187033380.jpg',24),(134,'images/luat2HOTEL134187056809.jpg',24),(135,'images/makesomeawsome1HOTEL135139196377.jpg',25),(136,'images/makesomeawsome1HOTEL136139196382.jpg',25),(137,'images/makesomeawsome1HOTEL137170548097.jpg',25),(138,'images/duongks0HOTEL1381.jpg',26),(139,'images/duongks0HOTEL1392',26),(140,'images/duongks0HOTEL1403',26),(141,'images/luat2HOTEL141183584378.jpg',27),(142,'images/luat2HOTEL142183585531.jpg',27),(143,'images/luat2HOTEL143186676016.jpg',27),(144,'images/luat2HOTEL144186676020.jpg',27),(145,'images/luat2HOTEL145186676021.jpg',27),(146,'images/chuhotelgo1HOTEL146123086366.jpg',28),(147,'images/chuhotelgo1HOTEL147123086421.jpg',28),(148,'images/chuhotelgo1HOTEL148148528376.jpg',28),(149,'images/duongks0HOTEL1491.jpg',29),(150,'images/duongks0HOTEL1502',29),(151,'images/duongks0HOTEL1513',29),(152,'images/duongks0HOTEL1524.jpg',29),(153,'images/luat2HOTEL15391989641.jpg',30),(154,'images/luat2HOTEL15496845605.jpg',30),(155,'images/luat2HOTEL15596846587.jpg',30),(156,'images/luat2HOTEL15696846603.jpg',30),(157,'images/luat2HOTEL157120007722.jpg',30),(158,'images/nguyenphuluat2HOTEL158201539562.jpg',31),(159,'images/nguyenphuluat2HOTEL159201554588.jpg',31),(160,'images/nguyenphuluat2HOTEL160201554589.jpg',31),(161,'images/nguyenphuluat2HOTEL161201661084.jpg',31),(162,'images/mamahotel1HOTEL162146517634.jpg',32),(163,'images/mamahotel1HOTEL163175552959.jpg',32),(164,'images/mamahotel1HOTEL164175553180.jpg',32),(165,'images/mamahotel1HOTEL165176623658.jpg',32),(166,'images/nguyenphuluat2HOTEL166196999121.jpg',33),(167,'images/nguyenphuluat2HOTEL167197005537.jpg',33),(168,'images/nguyenphuluat2HOTEL168197552092.jpg',33),(169,'images/nguyenphuluat2HOTEL169199392394.jpg',33),(170,'images/nguyenphuluat2HOTEL170199625637.jpg',33),(171,'images/nguyenphuluat2HOTEL171193812805.jpg',34),(172,'images/nguyenphuluat2HOTEL172196964148.jpg',34),(173,'images/nguyenphuluat2HOTEL173196964166.jpg',34),(174,'images/nguyenphuluat2HOTEL174198007466.jpg',34),(175,'images/babahotel1HOTEL175198089691.jpg',35),(176,'images/babahotel1HOTEL176198167502.jpg',35),(177,'images/babahotel1HOTEL177198252882.jpg',35),(178,'images/duongks0HOTEL1783',36),(179,'images/duongks0HOTEL1792',36),(180,'images/duongks0HOTEL1801.jpg',36);
/*!40000 ALTER TABLE `hotelimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelutilities`
--

DROP TABLE IF EXISTS `hotelutilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotelutilities` (
  `idutility` int(11) NOT NULL,
  `idhotel` int(11) NOT NULL,
  PRIMARY KEY (`idutility`,`idhotel`),
  KEY `fk_tienichks_idx` (`idhotel`),
  CONSTRAINT `fk_hotel_uti` FOREIGN KEY (`idhotel`) REFERENCES `hotel` (`idHotel`),
  CONSTRAINT `fk_hotelulity` FOREIGN KEY (`idutility`) REFERENCES `utilities` (`idUtility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelutilities`
--

LOCK TABLES `hotelutilities` WRITE;
/*!40000 ALTER TABLE `hotelutilities` DISABLE KEYS */;
INSERT INTO `hotelutilities` VALUES (2,1),(3,1),(4,1),(5,1),(6,1),(8,1),(2,2),(3,2),(4,2),(5,2),(6,2),(10,2),(2,3),(3,3),(4,3),(6,3),(7,3),(10,3),(11,3),(2,4),(4,4),(5,4),(6,4),(8,4),(9,4),(2,5),(3,5),(4,5),(5,5),(6,5),(8,5),(2,6),(3,6),(5,6),(6,6),(7,6),(8,6),(10,6),(2,7),(3,7),(4,7),(6,7),(7,7),(8,7),(2,8),(6,8),(2,9),(3,9),(4,9),(5,9),(6,9),(8,9),(10,9),(2,10),(5,10),(6,10),(7,10),(2,11),(3,11),(5,11),(6,11),(7,11),(11,11),(2,12),(3,12),(4,12),(5,12),(6,12),(7,12),(8,12),(10,12),(11,12),(2,13),(5,13),(6,13),(7,13),(8,13),(2,14),(6,14),(2,15),(3,15),(4,15),(6,15),(2,16),(3,16),(4,16),(6,16),(8,16),(10,16),(2,17),(3,17),(5,17),(6,17),(8,17),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(8,18),(10,18),(2,19),(6,19),(8,19),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20),(8,20),(2,21),(3,21),(4,21),(5,21),(6,21),(7,21),(9,21),(10,21),(2,22),(3,22),(5,22),(6,22),(7,22),(8,22),(2,23),(3,23),(4,23),(5,23),(6,23),(2,24),(3,24),(4,24),(5,24),(6,24),(7,24),(2,25),(3,25),(4,25),(6,25),(8,25),(2,26),(3,26),(4,26),(5,26),(6,26),(8,26),(2,27),(3,27),(6,27),(2,28),(3,28),(5,28),(6,28),(7,28),(9,28),(2,29),(3,29),(4,29),(5,29),(6,29),(7,29),(8,29),(2,30),(3,30),(6,30),(2,31),(3,31),(6,31),(2,32),(3,32),(4,32),(5,32),(6,32),(7,32),(8,32),(9,32),(10,32),(11,32),(2,33),(3,33),(5,33),(6,33),(7,33),(8,33),(10,33),(11,33),(2,34),(3,34),(5,34),(6,34),(7,34),(8,34),(9,34),(10,34),(11,34),(2,35),(6,35),(8,35),(9,35),(2,36),(3,36),(4,36),(5,36),(6,36);
/*!40000 ALTER TABLE `hotelutilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `idRoom` int(11) NOT NULL AUTO_INCREMENT,
  `roomName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idHotel` int(11) NOT NULL,
  `idBed` int(11) NOT NULL,
  `idRoomType` int(11) NOT NULL,
  `acreage` float DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `roomLeft` int(11) DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idRoom`),
  KEY `fk_bed_idx` (`idBed`),
  KEY `fk_roomtype_idx` (`idRoomType`),
  KEY `fk_room_hotel_idx` (`idHotel`),
  CONSTRAINT `fk_bed` FOREIGN KEY (`idBed`) REFERENCES `bed` (`idBed`),
  CONSTRAINT `fk_room_hotel` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`),
  CONSTRAINT `fk_roomtype` FOREIGN KEY (`idRoomType`) REFERENCES `roomtype` (`idRoomType`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Phòng Superio',5,1,1,16,650000,3,4,4,0),(2,'Phòng Sang Trọng',4,1,1,25,100000,1,16,16,0),(3,'Phòng Deluxe',5,1,1,25,700000,2,5,5,0),(4,'PhÃ²ng TiÃªu Chuáº©n',4,3,3,25,85000,10,9,9,1),(5,'Phòng premier',6,1,1,30,1200000,2,2,2,0),(6,'suite junior',6,1,1,32,1300000,1,3,3,0),(7,'PhÃ²ng TiÃªu Chuáº©n',4,3,3,25,85000,5,9,9,1),(8,'suite gia ÄÃ¬nh',6,3,3,30,1950000,4,3,3,0),(9,'PhÃ²ng TiÃªu Chuáº©n',4,1,1,25,86000,5,9,9,1),(10,'Phòng tiêu chuẩn',7,1,1,22,3102000,2,3,1,0),(11,'Phòng Tiêu Chuẩn',4,3,3,25,85000,5,9,9,0),(12,'Superior',7,2,2,25,3500000,2,2,1,0),(13,'Phòng Sang Trọng',1,2,2,75,2025000,2,17,17,0),(14,'Tiêu Chuẩn',8,2,2,25,1000000,2,2,2,0),(15,'Phòng Thượng Hạng',1,3,3,129,2780000,4,23,23,0),(16,'Standard Room',9,1,1,15,350000,2,5,4,0),(17,'Superior Room',9,2,1,20,400000,1,2,2,0),(18,'studio',10,2,2,35,1100000,2,2,2,0),(19,'Family Room',9,3,3,35,600000,4,3,3,0),(20,'Deluxe King Or Twin Room',12,4,2,45,2520000,4,5,5,0),(21,'Villa Deluxe',13,4,3,1000,1000000000,1,1,1,0),(22,'Parlour Suite Room',12,2,1,70,4845000,4,3,3,0),(23,'Executive Suite Room',12,2,1,90,7000000,2,2,2,0),(24,'Phòng Sang Trọng',2,4,2,22,250000,2,25,25,0),(25,'superior',14,2,2,35,400000,2,2,2,0),(26,'deluxe',14,4,3,40,500000,1,1,1,0),(27,'Plaza Suite Room',12,1,1,118,50000000,2,2,2,0),(28,'Phòng Tiêu Chuẩn',3,2,2,32,2580000,2,23,23,0),(29,'Phòng Sang Trọng',3,4,2,32,2780000,2,20,20,0),(30,'superior',15,2,2,25,287000,1,2,2,0),(31,' Standard Mixed Dormitory Room',16,1,1,40,80000,4,5,5,0),(32,'Deluxe Mixed Dormitory',16,1,1,40,135000,6,4,4,0),(33,'superior',17,2,2,18,400000,1,2,2,0),(34,'deluxe',17,2,2,25,700000,2,3,3,0),(35,'Superior Room',18,1,1,20,450000,2,5,5,0),(36,'superior',19,1,1,25,400000,1,1,1,0),(37,'Deluxe Room',18,2,1,35,700000,2,3,3,0),(38,'Family Room',18,3,3,45,850000,4,5,5,0),(39,'size king',19,1,2,25,500000,2,1,1,0),(40,'Deluxe Mixed Dormitory',20,2,1,25,748000,2,5,5,0),(41,'light studio',22,1,2,44,2000000,2,2,2,0),(42,'Phòng Thượng Hạng',21,3,3,80,1490000,4,23,23,0),(43,'Suite Junior',20,1,1,30,1550000,2,4,4,0),(44,'Phòng Sang Trọng',21,2,2,31.7,950000,2,12,12,0),(45,'Deluxe Room',23,1,1,20,1092000,2,5,1,0),(46,'Family Room',23,1,1,30,9050000,4,3,3,0),(47,'Superior',24,2,2,25,800000,2,2,2,0),(48,'Premium',23,2,1,30,505000,2,4,4,0),(49,'deluxe',24,2,2,30,1200000,1,2,2,0),(50,'PhÃ²ng TiÃªu Chuáº©n',25,1,1,25,150000,1,24,24,0),(51,'Superior Room',26,2,1,16,468000,2,5,5,0),(52,'Deluxe Room',26,1,1,20,558000,2,4,4,0),(53,'deluxe',27,3,3,25,630000,3,2,2,0),(54,'Family Room',26,3,3,45,1152000,4,5,5,0),(55,'junior suite',27,3,3,25,980000,3,1,1,0),(56,'Suite Junior',26,2,1,80,1440000,3,4,4,0),(57,'Phòng Tiêu Chuẩn',28,1,1,25,150000,1,22,22,0),(58,'Phòng Sang Trọng',28,2,2,35,350000,2,17,17,0),(59,'studio',30,2,2,25,931000,2,1,1,0),(60,'villa',31,3,3,315,6400000,5,1,1,0),(61,'Phòng Sang Trọng',32,2,2,59,1650000,2,23,23,0),(62,'superior',33,2,2,32,1449000,2,2,2,0),(63,'Deluxe Room',29,2,1,18,535000,2,5,5,0),(64,'Phòng Thượng Hạng',32,3,3,119,2800000,4,23,23,0),(65,'Suite Junior',29,1,1,28,790000,2,4,4,0),(66,'superior',34,1,2,45,1787000,2,2,2,0),(67,'Executive Suite',29,1,1,40,902000,3,4,4,0),(68,'pentium',34,2,2,45,1980000,2,1,1,0),(69,'suite',34,3,3,45,6400000,5,1,1,0),(70,'Suite Junior',36,2,1,20,713000,2,5,5,0),(71,'PhÃ²ng TiÃªu Chuáº©n',35,2,2,28,150000,2,23,23,0),(72,'Deluxe Room',36,2,1,22,900000,2,4,4,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomimage`
--

DROP TABLE IF EXISTS `roomimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roomimage` (
  `idRoomImage` int(11) NOT NULL AUTO_INCREMENT,
  `linkImage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idRoom` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRoomImage`),
  KEY `fk_room_image_idx` (`idRoom`),
  CONSTRAINT `fk_room_image` FOREIGN KEY (`idRoom`) REFERENCES `room` (`idRoom`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomimage`
--

LOCK TABLES `roomimage` WRITE;
/*!40000 ALTER TABLE `roomimage` DISABLE KEYS */;
INSERT INTO `roomimage` VALUES (1,'images/duongksnbROOM1rising.jpg',1),(2,'images/duongksnbROOM2rs16.jpg',1),(3,'images/duongksnbROOM3rs8.jpg',1),(4,'images/duongksnbROOM4rs9.jpg',1),(5,'images/kakichuks1ROOM5139090841.jpg',2),(6,'images/kakichuks1ROOM6139090859.jpg',2),(7,'images/kakichuks1ROOM7139090864.jpg',2),(9,'images/duongksnbROOM9rs12.jpg',3),(10,'images/duongksnbROOM10rs16.jpg',3),(11,'images/duongksnbROOM11rs145.jpg',3),(12,'images/duongksnbROOM12rs11.jpg',3),(13,'images/kakichuks1ROOM13139090831.jpg',4),(14,'images/kakichuks1ROOM14139090837.jpg',4),(15,'images/kakichuks1ROOM15139090841.jpg',4),(16,'images/kakichuks1ROOM16139090859.jpg',4),(17,'images/hotelmanager2ROOM17176106467.jpg',5),(18,'images/hotelmanager2ROOM18195548335.jpg',5),(19,'images/hotelmanager2ROOM19196336142.jpg',5),(20,'images/hotelmanager2ROOM20202277758.jpg',5),(21,'images/hotelmanager2ROOM21158584527.jpg',6),(22,'images/hotelmanager2ROOM22176106467.jpg',6),(23,'images/hotelmanager2ROOM23202676403.jpg',6),(24,'images/hotelmanager2ROOM24202677106.jpg',6),(25,'images/kakichuks1ROOM25139090831.jpg',7),(26,'images/kakichuks1ROOM26139090837.jpg',7),(27,'images/kakichuks1ROOM27139090841.jpg',7),(28,'images/kakichuks1ROOM28139090859.jpg',7),(29,'images/hotelmanager2ROOM29195548335.jpg',8),(30,'images/hotelmanager2ROOM30196611163.jpg',8),(31,'images/hotelmanager2ROOM31197327961.jpg',8),(32,'images/kakichuks1ROOM32139090831.jpg',9),(33,'images/kakichuks1ROOM33139090837.jpg',9),(34,'images/kakichuks1ROOM34139090841.jpg',9),(35,'images/kakichuks1ROOM35139090859.jpg',9),(36,'images/hotelmanager2ROOM3653932363.jpg',10),(37,'images/hotelmanager2ROOM3753932509.jpg',10),(38,'images/hotelmanager2ROOM3880166675.jpg',10),(39,'images/hotelmanager2ROOM39175187271.jpg',10),(40,'images/kakichuks1ROOM40139090831.jpg',11),(41,'images/kakichuks1ROOM41139090837.jpg',11),(42,'images/kakichuks1ROOM42139090841.jpg',11),(43,'images/kakichuks1ROOM43139090859.jpg',11),(44,'images/hotelmanager2ROOM4468639907.jpg',12),(45,'images/hotelmanager2ROOM4571614037.jpg',12),(46,'images/hotelmanager2ROOM46175187271.jpg',12),(47,'images/hotelmanager2ROOM47175187320.jpg',12),(48,'images/chuks1ROOM48193245375.jpg',13),(49,'images/chuks1ROOM49193245431.jpg',13),(50,'images/chuks1ROOM50198209840.jpg',13),(51,'images/chuks1ROOM51206804640.jpg',13),(52,'images/hotelmanager2ROOM52198183041.jpg',14),(53,'images/chuks1ROOM53193229559.jpg',15),(54,'images/chuks1ROOM54193231359.jpg',15),(55,'images/chuks1ROOM55193236395.jpg',15),(56,'images/chuks1ROOM56194049305.jpg',15),(57,'images/duongksnbROOM57qe3.jpeg',16),(58,'images/duongksnbROOM58qe1',16),(59,'images/duongksnbROOM59qe11.jpeg',16),(60,'images/duongksnbROOM60qe111.jpeg',16),(61,'images/duongksnbROOM61qe22.jpeg',17),(62,'images/duongksnbROOM62qe222.jpeg',17),(63,'images/duongksnbROOM63qe2222.jpeg',17),(64,'images/hotelmanager2ROOM64203373269.jpg',18),(65,'images/hotelmanager2ROOM65203377100.jpg',18),(66,'images/hotelmanager2ROOM66203485095.jpg',18),(67,'images/duongksnbROOM67qe31.jpeg',19),(68,'images/duongksnbROOM68qe33.jpeg',19),(69,'images/duongksnbROOM69qe333.jpeg',19),(70,'images/duongksnbROOM70a1.jpeg',20),(71,'images/duongksnbROOM71a2.jpeg',20),(72,'images/duongksnbROOM72a3.jpeg',20),(73,'images/luathotel2ROOM73191719753.jpg',21),(74,'images/luathotel2ROOM74191719759.jpg',21),(75,'images/luathotel2ROOM75191719764.jpg',21),(76,'images/duongksnbROOM76b1.jpeg',22),(77,'images/duongksnbROOM77b2.jpeg',22),(78,'images/duongksnbROOM78b3.jpeg',22),(79,'images/duongksnbROOM79q1.jpeg',23),(80,'images/duongksnbROOM80q2.jpeg',23),(81,'images/duongksnbROOM81q3.jpeg',23),(82,'images/chuks1ROOM82124355466.jpg',24),(83,'images/chuks1ROOM83189739769.jpg',24),(84,'images/luathotel2ROOM84197965646.jpg',25),(85,'images/luathotel2ROOM85197965660.jpg',25),(86,'images/luathotel2ROOM86196964394.jpg',26),(87,'images/luathotel2ROOM87196964396.jpg',26),(88,'images/luathotel2ROOM88196964400.jpg',26),(89,'images/duongksnbROOM891.jpeg',27),(90,'images/duongksnbROOM902.jpeg',27),(91,'images/duongksnbROOM91q1.jpeg',27),(92,'images/taikhoanchuks1ROOM929567731.jpg',28),(93,'images/taikhoanchuks1ROOM93170828273.jpg',28),(94,'images/taikhoanchuks1ROOM94172259545.jpg',28),(95,'images/taikhoanchuks1ROOM95196410140.jpg',28),(97,'images/taikhoanchuks1ROOM97170828273.jpg',29),(100,'images/luathotel2ROOM100198877893.jpg',30),(101,'images/luathotel2ROOM101198877894.jpg',30),(102,'images/luathotel2ROOM102198877901.jpg',30),(103,'images/taikhoanchuks1ROOM10318628300.jpg',29),(104,'images/taikhoanchuks1ROOM104170830788.jpg',29),(105,'images/duongksnb0ROOM1051.jpeg',31),(106,'images/duongksnb0ROOM1062',31),(107,'images/duongksnb0ROOM1071.jpeg',32),(108,'images/duongksnb0ROOM1082',32),(109,'images/duongksnb0ROOM1093',32),(110,'images/managerhotel2ROOM110200073534.jpg',33),(111,'images/managerhotel2ROOM111194425961.jpg',33),(112,'images/managerhotel2ROOM112192540875.jpg',33),(113,'images/managerhotel2ROOM113200073534.jpg',34),(114,'images/managerhotel2ROOM114192540875.jpg',34),(115,'images/managerhotel2ROOM115192542018.jpg',34),(116,'images/duongksnb0ROOM1161.jpg',35),(117,'images/duongksnb0ROOM1172',35),(118,'images/duongksnb0ROOM1183',35),(119,'images/managerhotel2ROOM119158345018.jpg',36),(120,'images/managerhotel2ROOM120158348207.jpg',36),(121,'images/managerhotel2ROOM121158348847.jpg',36),(122,'images/duongksnb0ROOM1221.jpg',37),(123,'images/duongksnb0ROOM1233',37),(124,'images/duongksnb0ROOM1241.jpg',38),(125,'images/duongksnb0ROOM1253',38),(126,'images/duongksnb0ROOM1263',38),(127,'images/managerhotel2ROOM127162439629.jpg',39),(128,'images/managerhotel2ROOM128162629431.jpg',39),(129,'images/managerhotel2ROOM129201181824.jpg',39),(130,'images/duongksnb0ROOM1301.jpg',40),(131,'images/duongksnb0ROOM1312',40),(132,'images/managerhotel2ROOM13229244848.jpg',41),(133,'images/managerhotel2ROOM13380737290.jpg',41),(134,'images/managerhotel2ROOM134148814926.jpg',41),(135,'images/chuhotelten1ROOM135139220881.jpg',42),(136,'images/chuhotelten1ROOM136139220902.jpg',42),(137,'images/chuhotelten1ROOM137141575118.jpg',42),(138,'images/chuhotelten1ROOM138168374205.jpg',42),(139,'images/duongksnb0ROOM1391.jpg',43),(140,'images/duongksnb0ROOM1402',43),(141,'images/duongksnb0ROOM1413',43),(142,'images/chuhotelten1ROOM142139196377.jpg',44),(143,'images/chuhotelten1ROOM143139196382.jpg',44),(144,'images/chuhotelten1ROOM144170548097.jpg',44),(145,'images/duongksnb0ROOM1451.jpg',45),(146,'images/duongksnb0ROOM1463',45),(147,'images/duongksnb0ROOM1472',45),(148,'images/duongksnb0ROOM1481.jpg',46),(149,'images/duongksnb0ROOM1492',46),(150,'images/duongksnb0ROOM1504.jpg',46),(151,'images/luat2ROOM151200h11000000r0lyo40C3_R_550_412.jpg',47),(152,'images/luat2ROOM152220g14000000vy3304A91_R_550_412.jpg',47),(153,'images/duongksnb0ROOM1531.jpg',48),(154,'images/duongksnb0ROOM1542',48),(155,'images/duongksnb0ROOM1554.jpg',48),(156,'images/luat2ROOM156187014037.jpg',49),(157,'images/luat2ROOM157187014048.jpg',49),(158,'images/luat2ROOM158187021224.jpg',49),(159,'images/makesomeawsome1ROOM159149571795.jpg',50),(160,'images/makesomeawsome1ROOM160149571806.jpg',50),(161,'images/makesomeawsome1ROOM161166062958.jpg',50),(162,'images/duongks0ROOM1621.jpg',51),(163,'images/duongks0ROOM1632',51),(164,'images/duongks0ROOM1643',51),(165,'images/duongks0ROOM1651.jpg',52),(166,'images/duongks0ROOM1662',52),(167,'images/duongks0ROOM1673',52),(168,'images/luat2ROOM168183585101.jpg',53),(169,'images/luat2ROOM169183585112.jpg',53),(170,'images/luat2ROOM170183585118.jpg',53),(171,'images/luat2ROOM171183585126.jpg',53),(172,'images/luat2ROOM172183585135.jpg',53),(173,'images/duongks0ROOM1731.jpg',54),(174,'images/duongks0ROOM1744.jpg',54),(175,'images/duongks0ROOM1753',54),(176,'images/luat2ROOM176183585101.jpg',55),(177,'images/luat2ROOM177183585112.jpg',55),(178,'images/luat2ROOM178183585118.jpg',55),(179,'images/luat2ROOM179183585135.jpg',55),(180,'images/luat2ROOM180183585126.jpg',55),(181,'images/duongks0ROOM1811.jpg',56),(182,'images/duongks0ROOM1822',56),(183,'images/duongks0ROOM1833',56),(184,'images/duongks0ROOM1844.jpg',56),(185,'images/chuhotelgo1ROOM185123076566.jpg',57),(186,'images/chuhotelgo1ROOM186123080033.jpg',57),(187,'images/chuhotelgo1ROOM187144287292.jpg',57),(188,'images/chuhotelgo1ROOM18886570655.jpg',58),(189,'images/chuhotelgo1ROOM18986570673.jpg',58),(190,'images/chuhotelgo1ROOM19086570675.jpg',58),(191,'images/luat2ROOM19196849064.jpg',59),(192,'images/luat2ROOM192120007742.jpg',59),(193,'images/luat2ROOM193120007745.jpg',59),(194,'images/luat2ROOM194124741408.jpg',59),(195,'images/nguyenphuluat2ROOM195201542038.jpg',60),(196,'images/nguyenphuluat2ROOM196201542304.jpg',60),(197,'images/nguyenphuluat2ROOM197201553372.jpg',60),(198,'images/mamahotel1ROOM198175551341.jpg',61),(199,'images/mamahotel1ROOM199175551356.jpg',61),(200,'images/mamahotel1ROOM200175551424.jpg',61),(201,'images/nguyenphuluat2ROOM20155101599474475a9c6735fb9292a7315.jpg',62),(202,'images/duongks0ROOM2021.jpg',63),(203,'images/duongks0ROOM2032',63),(204,'images/duongks0ROOM2043',63),(205,'images/mamahotel1ROOM205175551750.jpg',64),(206,'images/mamahotel1ROOM206175551758.jpg',64),(207,'images/mamahotel1ROOM207175551804.jpg',64),(208,'images/duongks0ROOM2081.jpg',65),(209,'images/duongks0ROOM2092',65),(210,'images/duongks0ROOM2103',65),(211,'images/nguyenphuluat2ROOM211196989188.jpg',66),(212,'images/nguyenphuluat2ROOM212196991837.jpg',66),(213,'images/nguyenphuluat2ROOM213198008408.jpg',66),(214,'images/nguyenphuluat2ROOM214198008412.jpg',66),(215,'images/duongks0ROOM2151.jpg',67),(216,'images/duongks0ROOM2162',67),(217,'images/duongks0ROOM2174.jpg',67),(218,'images/duongks0ROOM2183',67),(219,'images/nguyenphuluat2ROOM219196992614.jpg',68),(220,'images/nguyenphuluat2ROOM220196992643.jpg',68),(221,'images/nguyenphuluat2ROOM221196992656.jpg',68),(222,'images/nguyenphuluat2ROOM222196992673.jpg',68),(223,'images/nguyenphuluat2ROOM223193809850.jpg',69),(224,'images/nguyenphuluat2ROOM224193809851.jpg',69),(225,'images/nguyenphuluat2ROOM225193809858.jpg',69),(226,'images/nguyenphuluat2ROOM226193809862.jpg',69),(227,'images/duongks0ROOM2271.jpg',70),(228,'images/duongks0ROOM2282',70),(229,'images/duongks0ROOM2293',70),(230,'images/babahotel1ROOM230198079762.jpg',71),(231,'images/babahotel1ROOM231198079824.jpg',71),(232,'images/babahotel1ROOM232198080331.jpg',71),(233,'images/duongks0ROOM2331.jpg',72),(234,'images/duongks0ROOM2342',72),(235,'images/duongks0ROOM2353',72);
/*!40000 ALTER TABLE `roomimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roomtype` (
  `idRoomType` int(11) NOT NULL AUTO_INCREMENT,
  `roomTypeName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idRoomType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Phòng Đơn'),(2,'Phòng Đôi'),(3,'Phòng Gia Đình');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomutilities`
--

DROP TABLE IF EXISTS `roomutilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roomutilities` (
  `idUtility` int(11) NOT NULL,
  `idRoom` int(11) NOT NULL,
  PRIMARY KEY (`idUtility`,`idRoom`),
  KEY `fk_uti_room_idx` (`idRoom`),
  CONSTRAINT `fk_roomuti` FOREIGN KEY (`idUtility`) REFERENCES `utilities` (`idUtility`),
  CONSTRAINT `fk_uti_room` FOREIGN KEY (`idRoom`) REFERENCES `room` (`idRoom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomutilities`
--

LOCK TABLES `roomutilities` WRITE;
/*!40000 ALTER TABLE `roomutilities` DISABLE KEYS */;
INSERT INTO `roomutilities` VALUES (2,1),(6,1),(2,2),(3,2),(4,2),(6,2),(2,3),(3,3),(4,3),(6,3),(2,4),(3,4),(6,4),(9,4),(2,5),(6,5),(2,6),(6,6),(2,7),(3,7),(6,7),(9,7),(2,8),(6,8),(7,8),(9,8),(2,9),(3,9),(6,9),(9,9),(2,10),(6,10),(7,10),(2,11),(3,11),(6,11),(9,11),(2,12),(6,12),(7,12),(2,13),(3,13),(4,13),(5,13),(6,13),(7,13),(8,13),(9,13),(10,13),(11,13),(2,14),(6,14),(2,15),(3,15),(4,15),(5,15),(6,15),(7,15),(8,15),(9,15),(10,15),(11,15),(2,16),(3,16),(6,16),(2,17),(3,17),(4,17),(6,17),(2,18),(5,18),(6,18),(8,18),(2,19),(3,19),(4,19),(6,19),(2,20),(3,20),(4,20),(6,20),(2,21),(5,21),(6,21),(7,21),(8,21),(9,21),(11,21),(2,22),(3,22),(4,22),(5,22),(6,22),(2,23),(3,23),(4,23),(5,23),(6,23),(8,23),(9,23),(2,24),(3,24),(4,24),(5,24),(6,24),(9,24),(2,25),(6,25),(2,26),(6,26),(7,26),(2,27),(3,27),(4,27),(5,27),(6,27),(7,27),(8,27),(9,27),(10,27),(11,27),(2,28),(3,28),(4,28),(5,28),(6,28),(7,28),(8,28),(9,28),(10,28),(11,28),(2,29),(3,29),(4,29),(5,29),(6,29),(7,29),(8,29),(9,29),(10,29),(11,29),(2,30),(4,30),(6,30),(2,31),(6,31),(8,31),(2,32),(3,32),(6,32),(2,33),(6,33),(2,34),(6,34),(2,35),(3,35),(4,35),(6,35),(8,35),(2,36),(3,36),(6,36),(2,37),(3,37),(4,37),(5,37),(6,37),(8,37),(2,38),(3,38),(4,38),(5,38),(6,38),(7,38),(2,39),(3,39),(6,39),(2,40),(3,40),(4,40),(6,40),(2,41),(3,41),(6,41),(2,42),(3,42),(4,42),(5,42),(6,42),(7,42),(8,42),(10,42),(11,42),(2,43),(3,43),(4,43),(5,43),(6,43),(2,44),(3,44),(4,44),(5,44),(6,44),(7,44),(8,44),(10,44),(11,44),(2,45),(3,45),(4,45),(6,45),(2,46),(3,46),(4,46),(5,46),(6,46),(2,47),(3,47),(6,47),(2,48),(3,48),(4,48),(6,48),(2,49),(3,49),(6,49),(2,50),(3,50),(4,50),(6,50),(9,50),(2,51),(3,51),(5,51),(6,51),(2,52),(3,52),(5,52),(6,52),(2,53),(3,53),(6,53),(2,54),(3,54),(4,54),(5,54),(6,54),(2,55),(3,55),(6,55),(2,56),(3,56),(4,56),(5,56),(6,56),(2,57),(3,57),(5,57),(6,57),(9,57),(2,58),(3,58),(5,58),(6,58),(9,58),(2,59),(3,59),(6,59),(2,60),(3,60),(5,60),(6,60),(7,60),(8,60),(10,60),(11,60),(2,61),(3,61),(4,61),(5,61),(6,61),(7,61),(8,61),(9,61),(10,61),(11,61),(2,62),(3,62),(6,62),(2,63),(3,63),(6,63),(2,64),(3,64),(4,64),(5,64),(6,64),(7,64),(8,64),(9,64),(10,64),(11,64),(2,65),(4,65),(5,65),(6,65),(8,65),(2,66),(3,66),(5,66),(6,66),(7,66),(8,66),(9,66),(10,66),(11,66),(2,67),(3,67),(6,67),(2,68),(3,68),(5,68),(6,68),(7,68),(8,68),(10,68),(11,68),(2,69),(3,69),(5,69),(6,69),(7,69),(8,69),(10,69),(11,69),(2,70),(3,70),(6,70),(2,71),(6,71),(9,71),(2,72),(4,72),(6,72);
/*!40000 ALTER TABLE `roomutilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_account` (`userName`),
  CONSTRAINT `fk_account` FOREIGN KEY (`userName`) REFERENCES `account` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Phạm Hải Dương','a@gmail.com','0123456789','user0'),(2,'Công Nguyễn Văn','nvc19021998@gmail.com','0364883022','chuKS1'),(3,'vũ văn cao','haiduong1006@gmail.com','0337493535','duongksnb'),(4,'Nguyễn Thị Thơm','thomisdua@gmail.com','0365478747','taikhoanchuks1'),(5,'Lê Mạnh Hùng','kalikkki@gmail.com','0364447479','kakichuks1'),(6,'nguyen phu luat','ongluatlangvang@gmail.com','0344449998','hotelmanager2'),(7,'nguyen phu luat','luathotel2@gmail.com','0845303509','luathotel2'),(8,'Nguyễn Văn Thụ','a@gmail.com','0333333333','duongksnb0'),(9,'nguyen phu luat','managerhotel2@gmail.com','0845303509','managerhotel2'),(10,'Đinh Văn Một','emaillungtung@gmail.com','0354787458','chuhotelten1'),(11,'nguyen phu luat','luat@gmail.com','0845303509','luat2'),(12,'Calos Training','calosboene@gmail.com','0364874587','makesomeawsome1'),(13,'Nguyễn Tiến Thành','a@gmail.com','0333333333','duongks0'),(14,'Lê Văn Tài','letai1@gmail.com','0364785474','chuhotelgo1'),(15,'nguyen phu luat','ongluatlangvang@gmail.com','0845303509','nguyenphuluat2'),(16,'Nguyễn Thị Nhung','nhung23hol@gmail.com','0364587458','mamahotel1'),(17,'Nguyễn Văn Ván','vanvan@gmail.com','0364785474','babahotel1'),(18,'nguyen phu luat','luatuser2@gmail.com','0845303509','luatuser2'),(19,'Hoàng Văn Tý','tytyteoteo@gmai.com','0364587458','toilaai1234'),(20,'nguyen phu luat','ongluatlangvang@gmail.com','0845303509','luatnewuser2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilities`
--

DROP TABLE IF EXISTS `utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilities` (
  `idUtility` int(11) NOT NULL AUTO_INCREMENT,
  `utilityName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idUtility`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities`
--

LOCK TABLES `utilities` WRITE;
/*!40000 ALTER TABLE `utilities` DISABLE KEYS */;
INSERT INTO `utilities` VALUES (2,'Máy lạnh'),(3,'Lễ tân 24/24'),(4,'Thang máy'),(5,'Nhà hàng'),(6,'Wifi'),(7,'Hồ bơi'),(8,'Hỗ trợ đỗ xe'),(9,'Nhận thú nuôi'),(10,'Phòng thể hình'),(11,'Phòng Spa');
/*!40000 ALTER TABLE `utilities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-02  5:03:10
