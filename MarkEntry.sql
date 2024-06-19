-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mark_entry_schema
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `assessment_mark`
--

DROP TABLE IF EXISTS `assessment_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_mark` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `mark` int NOT NULL,
  PRIMARY KEY (`slno`),
  KEY `emp_id_fk11_idx` (`employee_id`),
  CONSTRAINT `emp_id_fk11` FOREIGN KEY (`employee_id`) REFERENCES `employee_master` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_mark`
--

LOCK TABLES `assessment_mark` WRITE;
/*!40000 ALTER TABLE `assessment_mark` DISABLE KEYS */;
INSERT INTO `assessment_mark` VALUES (2,4,60),(3,5,50),(4,3,89),(5,2,88),(6,1,66),(7,6,66);
/*!40000 ALTER TABLE `assessment_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_allocate`
--

DROP TABLE IF EXISTS `batch_allocate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_allocate` (
  `batch_allocate_id` int NOT NULL AUTO_INCREMENT,
  `batch_id` int NOT NULL,
  `technology_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`batch_allocate_id`),
  KEY `batch_id_fk_idx` (`batch_id`),
  KEY `technology_id_fk_idx` (`technology_id`),
  KEY `employee_id_fk_idx` (`employee_id`),
  CONSTRAINT `batch_id_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch_master` (`batch_id`),
  CONSTRAINT `employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee_master` (`employee_id`),
  CONSTRAINT `technology_id_fk` FOREIGN KEY (`technology_id`) REFERENCES `technology_master` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_allocate`
--

LOCK TABLES `batch_allocate` WRITE;
/*!40000 ALTER TABLE `batch_allocate` DISABLE KEYS */;
INSERT INTO `batch_allocate` VALUES (1,101,1,1),(2,101,5,2),(3,101,1,3),(4,101,3,4),(5,101,4,5),(6,101,2,6);
/*!40000 ALTER TABLE `batch_allocate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_master`
--

DROP TABLE IF EXISTS `batch_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_master` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(45) NOT NULL,
  `batch_start_date` date NOT NULL,
  `batch_strength` int NOT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_master`
--

LOCK TABLES `batch_master` WRITE;
/*!40000 ALTER TABLE `batch_master` DISABLE KEYS */;
INSERT INTO `batch_master` VALUES (101,'FY22-2  Batch 1','2023-04-04',6),(102,'FY22-2  Batch 2','2023-06-04',67),(103,'FY22-2  Batch 3','2023-08-04',47);
/*!40000 ALTER TABLE `batch_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_master`
--

DROP TABLE IF EXISTS `employee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_master` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) NOT NULL,
  `employee_phone` varchar(12) NOT NULL,
  `employee_email` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_master`
--

LOCK TABLES `employee_master` WRITE;
/*!40000 ALTER TABLE `employee_master` DISABLE KEYS */;
INSERT INTO `employee_master` VALUES (1,'Sunil Sarangi','9861098610','sunil@gmail.com'),(2,'Rabi Mohanty','9771497714','rabi@gmail.com'),(3,'Harish Jha','9861198611','harish@gmail.com'),(4,'Rama Mishra','9861298612','rama@gmail.com'),(5,'Puirana Mishra','9861398613','purna@gmail.com'),(6,'Rosa Sahoo','9861398614','rosa@gmail.com');
/*!40000 ALTER TABLE `employee_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_master`
--

DROP TABLE IF EXISTS `technology_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_master` (
  `technology_id` int NOT NULL AUTO_INCREMENT,
  `technology_name` varchar(45) NOT NULL,
  PRIMARY KEY (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_master`
--

LOCK TABLES `technology_master` WRITE;
/*!40000 ALTER TABLE `technology_master` DISABLE KEYS */;
INSERT INTO `technology_master` VALUES (1,'Dot Net'),(2,'Python'),(3,'Java'),(4,'PHP'),(5,'Database');
/*!40000 ALTER TABLE `technology_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mark_entry_schema'
--
/*!50003 DROP PROCEDURE IF EXISTS `mark_entry_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_entry_proc`(
	IN status varchar(28),
    IN p_batch_id INT,
    IN p_technology_id INT,
    IN p_employee_id INT,
    IN p_mark INT,
    OUT p_record_count varchar(128)
    
)
BEGIN
	declare v_count INT;

	IF status='sebatch' then
		select batch_id,batch_name,batch_start_date,batch_strength from batch_master;
	
    ELSEIF status='setech' then
		select technology_id, technology_name from technology_master;
        
	ELSEIF status = "seempbybidandtid" then
		select e.employee_id,e.employee_name from employee_master e inner join batch_allocate b
        on e.employee_id = b.employee_id
        where b.batch_id=p_batch_id and b.technology_id=p_technology_id;
    ELSEIF status = "inassignmark" then
    
		select count(*) into v_count from assessment_mark where employee_id = p_employee_id;
		IF v_count > 0 then
			set p_record_count = "Mark already exist for the employee !!";
		else    
			insert into assessment_mark(employee_id,mark) values(p_employee_id,p_mark);
            set p_record_count = "1 Mark saved Successfully !!";
        end if;
    ELSEIF status = "reportdata" then
		select b.batch_name, b.batch_start_date, t.technology_name, e.employee_name, e.employee_phone, a.mark
		from batch_master b inner join batch_allocate ba using(batch_id)
		inner join technology_master t using(technology_id)
		inner join employee_master e using(employee_id)
		inner join assessment_mark a using(employee_id);    
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 11:16:06
