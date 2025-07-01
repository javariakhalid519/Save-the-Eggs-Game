-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: saving_egg_game
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `achievement_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'First Egg','Collected your first egg'),(2,'Egg Master','Collected 50 eggs in one game'),(3,'Perfect Game','Won without missing any eggs'),(4,'Hard Victory','Won a game on Hard difficulty'),(5,'High Scorer','Scored 30+ points in one game');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_settings`
--

DROP TABLE IF EXISTS `audio_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_settings`
--

LOCK TABLES `audio_settings` WRITE;
/*!40000 ALTER TABLE `audio_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_sessions`
--

DROP TABLE IF EXISTS `game_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `game_sessions_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_sessions`
--

LOCK TABLES `game_sessions` WRITE;
/*!40000 ALTER TABLE `game_sessions` DISABLE KEYS */;
INSERT INTO `game_sessions` VALUES (1,1,'2025-06-12 11:57:04','2025-06-12 11:57:16',12),(2,1,'2025-06-12 11:57:27','2025-06-12 11:57:32',5),(3,3,'2025-06-12 11:57:52','2025-06-12 11:58:08',16),(4,4,'2025-06-12 11:58:32','2025-06-12 11:58:47',15),(5,4,'2025-06-12 11:58:58','2025-06-12 11:59:16',18),(6,6,'2025-06-12 11:59:42','2025-06-12 11:59:55',13),(7,7,'2025-06-12 12:00:24','2025-06-12 12:00:46',22),(8,10,'2025-06-12 15:30:00','2025-06-12 15:30:12',12),(9,11,'2025-06-12 16:05:57','2025-06-12 16:06:19',22),(10,12,'2025-06-24 20:58:18',NULL,NULL),(11,1,'2025-06-29 23:55:19',NULL,NULL);
/*!40000 ALTER TABLE `game_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_settings`
--

DROP TABLE IF EXISTS `game_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `egg_speed_easy` int NOT NULL DEFAULT '8',
  `egg_speed_medium` int NOT NULL DEFAULT '10',
  `egg_speed_hard` int NOT NULL DEFAULT '14',
  `win_threshold` int NOT NULL DEFAULT '20',
  `lose_threshold` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_settings`
--

LOCK TABLES `game_settings` WRITE;
/*!40000 ALTER TABLE `game_settings` DISABLE KEYS */;
INSERT INTO `game_settings` VALUES (1,8,10,14,20,5);
/*!40000 ALTER TABLE `game_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_achievements`
--

DROP TABLE IF EXISTS `player_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_achievements` (
  `player_id` int NOT NULL,
  `achievement_id` int NOT NULL,
  `unlocked_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`,`achievement_id`),
  KEY `achievement_id` (`achievement_id`),
  CONSTRAINT `player_achievements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  CONSTRAINT `player_achievements_ibfk_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_achievements`
--

LOCK TABLES `player_achievements` WRITE;
/*!40000 ALTER TABLE `player_achievements` DISABLE KEYS */;
INSERT INTO `player_achievements` VALUES (1,1,'2025-06-12 11:57:16'),(1,4,'2025-06-12 11:57:16'),(3,1,'2025-06-12 11:58:09'),(4,1,'2025-06-12 11:58:47'),(6,1,'2025-06-12 11:59:55'),(6,4,'2025-06-12 11:59:55'),(7,1,'2025-06-12 12:00:46'),(10,1,'2025-06-12 15:30:12'),(11,1,'2025-06-12 16:06:19');
/*!40000 ALTER TABLE `player_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_played` datetime DEFAULT NULL,
  `total_score` int DEFAULT '0',
  `highest_score` int DEFAULT '0',
  `games_played` int DEFAULT '0',
  `games_won` int DEFAULT '0',
  `eggs_collected` int DEFAULT '0',
  `eggs_missed` int DEFAULT '0',
  `highest_difficulty` enum('Easy','Medium','Hard') DEFAULT 'Easy',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_name` (`player_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'JOYA','2025-06-12 11:57:04','2025-06-12 13:39:27',48,25,3,2,33,13,'Medium'),(3,'yes','2025-06-12 11:57:52','2025-06-12 11:58:09',20,20,1,1,20,3,'Medium'),(4,'eman','2025-06-12 11:58:32','2025-06-12 11:59:16',70,20,4,2,70,22,'Medium'),(6,'arfa','2025-06-12 11:59:42','2025-06-12 11:59:55',40,20,2,2,40,8,'Hard'),(7,'me','2025-06-12 12:00:24','2025-06-12 12:00:46',19,19,1,0,19,6,'Easy'),(10,'eee','2025-06-12 15:30:00','2025-06-12 15:30:12',34,17,2,0,34,12,'Hard'),(11,'samraiz','2025-06-12 16:05:57','2025-06-12 16:06:19',20,20,1,1,20,3,'Easy'),(12,'jiya','2025-06-24 20:58:18',NULL,0,0,0,0,0,0,'Easy');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `score_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `score` int NOT NULL,
  `missed` int NOT NULL,
  `eggs_collected` int NOT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`score_id`),
  KEY `player_id` (`player_id`),
  KEY `idx_high_scores` (`difficulty`,`score` DESC),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,1,20,5,20,'Hard','2025-06-12 11:57:16'),(2,1,3,6,3,'Hard','2025-06-12 11:57:32'),(3,3,20,3,20,'Medium','2025-06-12 11:58:09'),(4,4,15,6,15,'Medium','2025-06-12 11:58:47'),(5,4,15,6,15,'Medium','2025-06-12 11:58:47'),(6,4,20,5,20,'Medium','2025-06-12 11:59:16'),(7,4,20,5,20,'Medium','2025-06-12 11:59:16'),(8,6,20,4,20,'Hard','2025-06-12 11:59:55'),(9,6,20,4,20,'Hard','2025-06-12 11:59:55'),(10,7,19,6,19,'Easy','2025-06-12 12:00:46'),(13,1,25,2,10,'Medium','2025-06-12 13:39:27'),(14,10,17,6,17,'Hard','2025-06-12 15:30:12'),(15,10,17,6,17,'Hard','2025-06-12 15:30:12'),(16,11,20,3,20,'Easy','2025-06-12 16:06:19');
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30  1:15:45
