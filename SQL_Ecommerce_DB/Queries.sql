-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul','Sharma','rahul@example.com','9876500001','Bengaluru','2026-01-10'),(2,'Priya','Rao','priya@example.com','9876500002','Mysuru','2026-01-15'),(3,'Amit','Kumar','amit@example.com','9876500003','Chennai','2026-02-01'),(4,'Sneha','Patil','sneha@example.com','9876500004','Hyderabad','2026-02-12'),(5,'Arjun','Nair','arjun@example.com','9876500005','Bengaluru','2026-03-05'),(6,'Kiran','Reddy','kiran.reddy20@example.com','9000000020','Bengaluru','2026-04-01'),(7,'Divya','Shetty','divya.shetty21@example.com','9000000021','Mysuru','2026-04-02'),(8,'Rohan','Mehta','rohan.mehta22@example.com','9000000022','Mumbai','2026-04-03'),(9,'Ananya','Das','ananya.das23@example.com','9000000023','Kolkata','2026-04-04'),(10,'Vikram','Singh','vikram.singh24@example.com','9000000024','Delhi','2026-04-05'),(11,'Pooja','Nair','pooja.nair25@example.com','9000000025','Kochi','2026-04-06'),(12,'Rahul','Verma','rahul.verma26@example.com','9000000026','Pune','2026-04-07'),(13,'Meera','Joshi','meera.joshi27@example.com','9000000027','Hubballi','2026-04-08'),(14,'Sanjay','Rao','sanjay.rao28@example.com','9000000028','Mangaluru','2026-04-09'),(15,'Nisha','Kapoor','nisha.kapoor29@example.com','9000000029','Chennai','2026-04-10'),(16,'Arun','Pillai','arun.pillai30@example.com','9000000030','Thiruvananthapuram','2026-04-11'),(17,'Kavya','Iyer','kavya.iyer31@example.com','9000000031','Coimbatore','2026-04-12'),(18,'Manoj','Patel','manoj.patel32@example.com','9000000032','Ahmedabad','2026-04-13'),(19,'Snehal','Kulkarni','snehal.kulkarni33@example.com','9000000033','Nashik','2026-04-14'),(20,'Deepak','Yadav','deepak.yadav34@example.com','9000000034','Jaipur','2026-04-15');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0)),
  CONSTRAINT `order_items_chk_2` CHECK ((`unit_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,55000.00),(2,1,3,2,1500.00),(3,2,2,1,25000.00),(4,2,8,1,1299.00),(5,3,4,2,7500.00),(6,3,6,3,799.00),(7,4,3,1,1500.00),(8,4,7,1,2499.00),(9,5,5,1,6000.00),(10,5,8,2,1299.00),(11,6,2,1,25000.00),(12,6,3,1,1500.00),(13,7,6,2,799.00),(14,7,7,1,2499.00),(15,8,1,1,55000.00),(16,8,4,1,7500.00),(17,9,9,2,799.00),(18,10,10,1,2499.00),(19,11,11,3,499.00),(20,12,12,1,12000.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-03-10 10:30:00','Delivered'),(2,2,'2026-03-12 14:15:00','Shipped'),(3,3,'2026-03-15 09:00:00','Delivered'),(4,1,'2026-03-18 16:45:00','Pending'),(5,4,'2026-03-20 11:20:00','Delivered'),(6,5,'2026-03-22 13:10:00','Shipped'),(7,2,'2026-03-25 17:00:00','Pending'),(8,3,'2026-03-28 12:30:00','Delivered'),(9,6,'2026-04-01 10:00:00','Delivered'),(10,7,'2026-04-02 11:30:00','Shipped'),(11,8,'2026-04-03 12:15:00','Delivered'),(12,9,'2026-04-04 14:00:00','Pending'),(13,10,'2026-04-05 15:30:00','Delivered'),(14,11,'2026-04-06 09:45:00','Shipped'),(15,12,'2026-04-07 16:00:00','Delivered'),(16,13,'2026-04-08 13:20:00','Pending'),(17,14,'2026-04-09 10:45:00','Delivered'),(18,15,'2026-04-10 17:15:00','Shipped'),(19,16,'2026-04-11 11:00:00','Delivered'),(20,17,'2026-04-12 14:30:00','Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `payments_chk_1` CHECK ((`amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2026-03-10 10:35:00',58000.00,'UPI','Completed'),(2,2,'2026-03-12 14:20:00',26299.00,'Card','Completed'),(3,3,'2026-03-15 09:05:00',17397.00,'UPI','Completed'),(4,4,'2026-03-18 16:50:00',3999.00,'Card','Pending'),(5,5,'2026-03-20 11:25:00',8598.00,'Net Banking','Completed'),(6,6,'2026-03-22 13:15:00',26500.00,'UPI','Completed'),(7,7,'2026-03-25 17:05:00',4097.00,'Card','Failed'),(8,8,'2026-03-28 12:35:00',62500.00,'UPI','Completed'),(9,9,'2026-04-01 10:05:00',1598.00,'UPI','Completed'),(10,10,'2026-04-02 11:35:00',2499.00,'Card','Completed'),(11,11,'2026-04-03 12:20:00',1497.00,'UPI','Completed'),(12,12,'2026-04-04 14:05:00',12000.00,'Net Banking','Pending'),(13,13,'2026-04-05 15:35:00',899.00,'Card','Completed'),(14,14,'2026-04-06 09:50:00',4500.00,'UPI','Completed'),(15,15,'2026-04-07 16:05:00',1499.00,'Card','Completed'),(16,16,'2026-04-08 13:25:00',2299.00,'UPI','Pending'),(17,17,'2026-04-09 10:50:00',897.00,'Card','Completed'),(18,18,'2026-04-10 17:20:00',999.00,'UPI','Completed'),(19,19,'2026-04-11 11:05:00',399.00,'Card','Failed'),(20,20,'2026-04-12 14:35:00',699.00,'UPI','Completed');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','Electronics',55000.00,10),(2,'Smartphone','Electronics',25000.00,20),(3,'Headphones','Electronics',1500.00,50),(4,'Office Chair','Furniture',7500.00,15),(5,'Study Table','Furniture',6000.00,12),(6,'T-Shirt','Clothing',799.00,40),(7,'Running Shoes','Footwear',2499.00,25),(8,'Backpack','Accessories',1299.00,30),(9,'Wireless Mouse','Electronics',799.00,40),(10,'Mechanical Keyboard','Electronics',2499.00,25),(11,'USB Flash Drive','Electronics',499.00,60),(12,'Monitor','Electronics',12000.00,15),(13,'Desk Lamp','Home & Office',899.00,30),(14,'Bookshelf','Furniture',4500.00,10),(15,'Jeans','Clothing',1499.00,35),(16,'Jacket','Clothing',2299.00,20),(17,'Sports Socks','Clothing',299.00,50),(18,'Sandals','Footwear',999.00,25),(19,'Water Bottle','Accessories',399.00,45),(20,'Laptop Sleeve','Accessories',699.00,30);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-17 19:57:01
