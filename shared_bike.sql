-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shared_bike_separate
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `type` int DEFAULT NULL COMMENT '管理员类型：1 监管部门，2 运营人员，3 调度人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'jg','123456',1),(2,'yy','123456',2),(3,'dd','123456',3);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appeal`
--

DROP TABLE IF EXISTS `appeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appeal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL COMMENT '申诉内容',
  `status` int DEFAULT NULL COMMENT '申诉状态：0 未审核，1 申诉成功，2 申诉失败',
  `reason` varchar(200) DEFAULT NULL COMMENT '申诉失败原因',
  `vid` int DEFAULT NULL,
  `appeal_time` datetime DEFAULT NULL,
  `do_appeal_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
INSERT INTO `appeal` VALUES (1,11,'不合理扣费',1,'已更正',1,'2024-04-30 12:42:44','2024-04-30 12:49:59'),(7,11,'单车质量问题',2,'不符合真实情况',1,'2024-04-30 12:42:46','2024-04-30 12:50:00'),(18,11,'不合理扣费',1,'已更正',1,'2024-04-30 12:42:46','2024-04-30 13:20:00'),(19,11,'计时错误',2,'不符合真实情况',1,'2024-04-30 12:42:47','2024-04-30 13:20:04'),(20,11,'非人为因素',1,'已核实',1,'2024-04-30 12:42:47','2024-04-30 13:24:56');
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL COMMENT '监管人员编号',
  `area` varchar(200) DEFAULT NULL COMMENT '停放区域',
  `leftlng` float(11,6) DEFAULT NULL COMMENT '左下角经度',
  `leftlat` float(11,6) DEFAULT NULL COMMENT '左下角纬度',
  `rightlng` float(11,6) DEFAULT NULL COMMENT '右上角经度',
  `rightlat` float(11,6) DEFAULT NULL COMMENT '右上角纬度',
  `price` int DEFAULT NULL COMMENT '收费标准/小时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (99,1,'停车区1',116.405121,39.850052,116.406395,39.850578,2),(100,1,'停车区2',116.401390,39.848984,116.402725,39.849468,3),(101,1,'停车区3',116.408867,39.848488,116.410522,39.849178,2),(102,1,'停车区4',116.400841,39.850292,116.402901,39.850853,2),(103,1,'停车区5',116.404373,39.849194,116.406021,39.849781,3),(104,1,'停车区6',116.404434,39.848030,116.406273,39.848606,2),(105,1,'停车区7',116.407890,39.850357,116.409149,39.850826,3);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike`
--

DROP TABLE IF EXISTS `bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(200) DEFAULT NULL COMMENT '编号',
  `aid` int DEFAULT NULL COMMENT '所属区域编号',
  `lng` float(11,6) DEFAULT NULL COMMENT '位置经度\n',
  `lat` float(11,6) DEFAULT NULL COMMENT '位置纬度',
  `deposit` varchar(200) DEFAULT NULL COMMENT '押金',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bike_number_uindex` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike`
--

LOCK TABLES `bike` WRITE;
/*!40000 ALTER TABLE `bike` DISABLE KEYS */;
INSERT INTO `bike` VALUES (1,'A001',99,116.402992,39.850979,'100','2024-04-29 10:49:10'),(2,'A002',99,116.404251,39.850632,'100','2024-04-29 10:49:13'),(3,'A003',99,116.402061,39.850521,'100','2024-04-29 10:49:13'),(55,'A004',100,116.403137,39.849846,'100','2024-05-05 17:09:34'),(56,'A005',100,116.401352,39.849712,'100','2024-05-05 17:09:36'),(57,'A006',101,116.405907,39.849873,'100','2024-05-05 17:09:37'),(58,'A007',101,116.400879,39.850433,'100','2024-05-05 17:12:36'),(59,'A008',102,116.402161,39.849133,'100','2024-05-05 17:12:37'),(60,'A009',103,116.406189,39.849213,'100','2024-05-05 17:12:38'),(61,'A010',103,116.401337,39.848923,'100','2024-05-05 17:12:38');
/*!40000 ALTER TABLE `bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL COMMENT '运营人员编号',
  `content` varchar(200) DEFAULT NULL COMMENT '调度内容',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch`
--

LOCK TABLES `dispatch` WRITE;
/*!40000 ALTER TABLE `dispatch` DISABLE KEYS */;
INSERT INTO `dispatch` VALUES (1,3,'更新车辆','2024-04-29 11:09:55'),(22,3,'维护车辆','2024-04-29 11:09:57'),(33,3,'停车区升级','2024-05-05 13:45:20');
/*!40000 ALTER TABLE `dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fault`
--

DROP TABLE IF EXISTS `fault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL COMMENT '调度人员编号',
  `bid` int DEFAULT NULL COMMENT '单车编号',
  `reason` varchar(200) DEFAULT NULL COMMENT '故障原因',
  `lng` float(11,6) DEFAULT NULL COMMENT '车辆停放经度',
  `lat` float(11,6) DEFAULT NULL COMMENT '车辆停放纬度',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fault`
--

LOCK TABLES `fault` WRITE;
/*!40000 ALTER TABLE `fault` DISABLE KEYS */;
INSERT INTO `fault` VALUES (1,11,1,'爆胎',116.405396,39.846622,'2024-04-29 11:34:37'),(2,11,2,'座椅破损',116.400299,39.847183,'2024-04-29 11:34:38'),(43,11,3,'无法开锁',116.406258,39.847233,'2024-05-05 16:27:55');
/*!40000 ALTER TABLE `fault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `spread` int DEFAULT NULL COMMENT '0不展开1展开',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'单车定位','bike.html',0,'el-icon-location-information'),(3,'单车管理','bikeManager.html',0,'el-icon-bicycle'),(4,'调度查询','dispatchQuery.html',0,'el-icon-edit-outline'),(6,'单车使用时长','pie.html',0,'el-icon-watch'),(7,'区域单车数量','bar.html',0,'el-icon-notebook-2\r\n'),(8,'停车区域管理','area.html',0,'el-icon-coordinate'),(9,'申诉处理','appealManager.html',0,'el-icon-wallet'),(10,'故障管理','faultManager.html',0,'el-icon-circle-close'),(11,'调度管理','dispatchManager.html',0,'el-icon-edit-outline'),(16,'故障上报','faultAdd.html',0,'el-icon-circle-close'),(18,'违规记录','violationManager.html',0,'el-icon-c-scale-to-original\r\n'),(19,'申诉记录','appealQuery.html',0,'el-icon-wallet'),(23,'骑行记录','record.html',0,'el-icon-bicycle'),(24,'骑行时长','line.html',0,'el-icon-watch-1');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_authority`
--

DROP TABLE IF EXISTS `menu_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `mid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_authority`
--

LOCK TABLES `menu_authority` WRITE;
/*!40000 ALTER TABLE `menu_authority` DISABLE KEYS */;
INSERT INTO `menu_authority` VALUES (1,1,2),(2,1,8),(3,1,9),(4,1,10),(5,1,6),(6,1,7),(7,2,2),(8,2,3),(9,2,4),(10,2,6),(11,2,7),(12,3,11),(13,3,10),(14,3,6),(15,3,7),(16,11,2),(17,11,16),(18,11,18),(19,11,19),(20,11,23),(21,11,24);
/*!40000 ALTER TABLE `menu_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operate`
--

DROP TABLE IF EXISTS `operate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `lng` float(11,6) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `lat` float(11,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operate`
--

LOCK TABLES `operate` WRITE;
/*!40000 ALTER TABLE `operate` DISABLE KEYS */;
INSERT INTO `operate` VALUES (1,1,11,116.382378,2,'2024-03-25',33,39.915874),(2,2,11,116.987656,4,'2024-03-26',21,40.222836),(6,3,11,116.382378,6,'2024-03-27',6,40.222836),(7,55,11,116.382378,3,'2024-03-28',18,39.915874),(8,56,11,116.382378,2,'2024-03-29',40,40.222836),(9,57,11,116.382378,3,'2024-05-01',11,40.222836),(10,58,11,116.987656,6,'2024-05-02',56,39.915874),(11,59,11,116.382378,2,'2024-05-03',7,40.222836),(12,60,11,116.382378,3,'2024-05-04',16,39.915874),(13,61,11,116.382378,6,'2024-05-05',76,39.915874);
/*!40000 ALTER TABLE `operate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `endlng` float(11,6) DEFAULT NULL,
  `endlat` float(11,6) DEFAULT NULL,
  `startlng` float(11,6) DEFAULT NULL,
  `startlat` float(11,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,11,1,116.372681,39.846466,116.366035,39.843666),(2,11,1,116.391510,39.850258,116.379547,39.849426),(3,11,2,116.405739,39.847351,116.395790,39.848183),(4,12,2,116.392662,39.846355,116.388962,39.842312),(5,12,2,116.385330,39.841423,116.375954,39.839401);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `gender` varchar(200) DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'user','123456','男',20,'13312345678');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violation`
--

DROP TABLE IF EXISTS `violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int DEFAULT NULL,
  `cause` varchar(200) DEFAULT NULL,
  `violation_time` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violation`
--

LOCK TABLES `violation` WRITE;
/*!40000 ALTER TABLE `violation` DISABLE KEYS */;
INSERT INTO `violation` VALUES (1,1,'违规停车','2024-04-29 13:41:20',11),(2,2,'支付超时','2024-04-02 14:14:15',11),(3,22,'未上锁','2024-05-02 15:43:32',11);
/*!40000 ALTER TABLE `violation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 21:20:02
