-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: aestheticam
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `ci_id` int NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ci_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`username`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (124,'shinde_22',5,2,98),(125,'pjosh99',3,1,250),(126,'gp2020',1,2,720),(127,'A_Singh20',7,2,195);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `pd_id` int NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `cart_item_id` int NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `done_at` date DEFAULT NULL,
  PRIMARY KEY (`pd_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `cart_item_id` (`cart_item_id`),
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`username`),
  CONSTRAINT `payment_details_ibfk_2` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_item` (`ci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (201,'shinde_22',124,98,'Debit Card','Successful','2022-03-27'),(202,'pjosh99',125,250,'Debit Card','Failed','2022-03-27'),(203,'gp2020',126,720,'Cash On Delivery','Successful','2022-03-27'),(204,'A_Singh20',127,195,'Online Payment','Successful','2022-03-27');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `p_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `category_id` int NOT NULL,
  `inventory_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `inventory_id` (`inventory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory` (`i_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Emerald Admiration Hair Adoration Set (Green Hair clip set)','Quantity- 6 pieces, Material- Plastic',360,15,9),(2,'Pearl Paradise Clips','Note- This pack contains only one clip. It is not a pair. Material- Plastic, Colour- White',49,15,9),(3,'Pastel Satin Scrunchies(Pack of 6)','Satin scrunchies are for everyone, they take care of your hair to keep them hydrated and prevent unnecessary hair loss. Treat yourself today and get a combo of 6 just for 249',250,15,9),(4,'Ecstasy Satin Scrunchies','Satin scrunchies are for everyone, they take care of your hair to keep them hydrated and prevent unnecessary hair loss.',45,15,9),(5,'\"In the Blues\" Spiral Chic Hair holder','Spiral clutcher helps you in making full and half buns and looks soo chic, unique, and cute while doing that',49,15,9),(6,'Retro Polka Dot Donut Bun Maker','Bun Making is no more a hassle with the help of this simple bun maker. Colour- As you choose, Material- Cotton and Wire',100,15,9),(7,'Peach Matte Finish Handy Hairband','Hairbands are not just a style statement they are simply the best way to hold your hair back whenever you are getting into the girl boss mode, but they are not at all travel friendly? Dont worry we got you covered with this amazing product, HANDY HAIRBAND. They come in all neutral colors to help you get ON with the work vibe. Material- Matte Finish Plastic',98,15,9),(8,'Pastel Matte Pins','Hair holder, gives you a slick look while holding those bangs back tightly or lightly however you like it. Quantity- 3, Material- Metal',60,15,9),(9,'TicTac and Bobby Pin Set','The clip set which has the soft girl vibe something like this to your collection would be a lifesaver cause its basic and bold at the same time. Contains- 4 bobby pin & 4 tic tac',69,15,9),(10,'Turban Two Shades Head Bands','This Two shade bow Gorget Headband has Plastic basic preventing the headband from falling off the head, and simultaneously since it has no elastic and ends of the band are covered with cloath, ther is no pain and strain whatsoever, so it is perfect for work, party or even at home. Quantity- 1',99,15,9),(11,'Satin Head Bands','This Stripped Headband has Plastic basic preventing the headband from falling off the head, and simultaneously since it has no elastic and ends of the band are covered with cloath, ther is no pain and strain whatsoever, so it is perfect for work, party and even at home. Quantity- 1',99,15,9);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `c_id` int NOT NULL,
  `name` varchar(35) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (15,'Hair Accessories'),(16,'Earrings'),(17,'Necklaces'),(18,'Rings, Nails & Nose Rings'),(19,'Gift Hampers & Gift Packaging'),(20,'Flash Sale');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `pi_id` int NOT NULL,
  `product_id` int NOT NULL,
  `image1` blob NOT NULL,
  `image2` blob,
  `image3` blob,
  PRIMARY KEY (`pi_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (501,1,_binary '../Images/clip1.jpg',_binary '../Images/clip2.jpg',NULL),(502,2,_binary '../Images/clip3.jpg',NULL,NULL),(503,3,_binary '../Images/scrunchie1.jpg',NULL,NULL),(504,4,_binary '../Images/scrunchie2.jpg',NULL,NULL),(505,5,_binary '../Images/hairHolder1.jpg',NULL,NULL),(506,6,_binary '../Images/bunMaker1.jpg',_binary '../Images/bunMaker2.jpg',_binary '../Images/bunMaker3.jpg'),(507,7,_binary '../Images/hairBand1.jpg',_binary '../Images/hairBand2.jpg',NULL),(508,8,_binary '../Images/hairPin1.jpg',NULL,NULL),(509,9,_binary '../Images/hairPin2.jpg',NULL,NULL),(510,10,_binary '../Images/headBand1.jpg',NULL,NULL),(511,11,_binary '../Images/headBand2.jpg',NULL,NULL);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory` (
  `i_id` int NOT NULL,
  `item` varchar(35) NOT NULL,
  `quantity` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (9,'Hair Accessories',90,'2022-03-27','2022-03-27','2022-03-27'),(10,'Earrings',70,'2022-03-27','2022-03-27','2022-03-27'),(11,'Necklaces',60,'2022-03-27','2022-03-27','2022-03-27'),(12,'Rings, Nails & Nose Rings',65,'2022-03-27','2022-03-27','2022-03-27'),(13,'Gift Hampers & Gift Packaging',25,'2022-03-27','2022-03-27','2022-03-27'),(14,'Flash Sale',20,'2022-03-27','2022-03-27','2022-03-27');
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('A_Singh20','arunima678','Arunima','Singh','asingh@gmail.com','9034750953','2022-03-27'),('gp2020','ganesh123','Ganesh','Patil','gpatil@gmail.com','9654873218','2022-03-27'),('pjosh99','prakash456','Prakash','Joshi','pkjoshi@gmail.com','9487456123','2022-03-27'),('shinde_22','raj567','Raj','Shinde','rjshinde@yahoo.com','9812345677','2022-03-27');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `uadd_id` int NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`uadd_id`),
  UNIQUE KEY `user_name` (`user_name`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (101,'shinde_22','Akurdi',NULL,'Pune City','411035','Maharashtra','India'),(102,'pjosh99','Aundh',NULL,'Haveli','411007','Maharashtra','India'),(103,'gp2020','Baner Road',NULL,'Pune City','411008','Maharashtra','India'),(104,'A_Singh20','Rajuri',NULL,'Purandar','412104','Maharashtra','India');
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-30 17:36:50
