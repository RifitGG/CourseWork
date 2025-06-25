-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eduplus
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Python для начинающих','Основы Python',500.00,1),(2,'Frontend: HTML/CSS/JS','С нуля до PRO',700.00,2),(3,'Python для начинающих','Основы синтаксиса, работа с библиотеками, первые проекты',500.00,1),(4,'Продвинутый Python','Глубокое погружение: OOP, асинхронность, оптимизация',700.00,1),(5,'Web-разработка','HTML, CSS, JavaScript, фреймворки React и Vue',800.00,2),(6,'SQL и базы данных','Проектирование схем, оптимизация запросов, транзакции',600.00,3),(7,'DevOps практики','CI/CD, Docker, Kubernetes, мониторинг',900.00,4);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `enroll_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1,'2025-06-24 19:52:53'),(2,1,1,'2025-06-24 19:53:06');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `duration_min` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,1,'Введение','Что такое Python',10),(2,1,'Переменные','Типы и переменные',20),(3,2,'HTML основы','Разметка страницы',15),(4,2,'CSS стили','Оформление',25),(5,1,'Введение в Python','Обзор языка, установка окружения',15),(6,1,'Переменные и типы данных','int, float, str, list, dict',20),(7,1,'Условные операторы','if, else, elif',25),(8,2,'Классы и объекты','Создание классов, наследование',30),(9,2,'Асинхронность','asyncio, задачики, event loop',35),(10,3,'Основы HTML/CSS','Теги, стили, макеты',20),(11,3,'JavaScript для веба','DOM, события, ES6+',25),(12,4,'Введение в SQL','SELECT, INSERT, UPDATE, DELETE',15),(13,4,'Продвинутые JOIN','INNER, LEFT, RIGHT, FULL JOIN',20),(14,5,'Введение в Docker','Контейнеризация приложений',30),(15,5,'Kubernetes в практике','Создание подов, сервисов, deployment',40);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,500.00,'2025-06-24 19:52:53'),(2,1,1,500.00,'2025-06-24 19:53:06');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_payment` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  INSERT IGNORE INTO enrollments(user_id, course_id)
    VALUES (NEW.user_id, NEW.course_id);

  UPDATE users
    SET balance = balance - NEW.amount
  WHERE id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `started_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,1,'2025-06-24 19:53:11','2025-06-24 19:53:11'),(2,1,1,'2025-06-24 19:53:16','2025-06-24 19:53:16');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Иван Иванов','Эксперт по Python'),(2,'Пётр Петров','Веб-разработка и JavaScript'),(3,'Иван Иванов','Эксперт по Python и Data Science'),(4,'Пётр Петров','Специалист по веб-разработке и JavaScript'),(5,'Мария Смирнова','Преподаватель по базам данных и SQL'),(6,'Елена Кузнецова','Инструктор по DevOps и CI/CD');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice','$2y$…','alice@eduplus.com',100.00),(2,'bob','$2y$…','bob@eduplus.com',0.00),(3,'carol','$2y$…','carol@eduplus.com',0.00),(4,'dave','$2y$abc4','dave@eduplus.com',500.00),(5,'erin','$2y$abc5','erin@eduplus.com',1500.00),(6,'frank','$2y$abc6','frank@eduplus.com',700.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_course_overview`
--

DROP TABLE IF EXISTS `vw_course_overview`;
/*!50001 DROP VIEW IF EXISTS `vw_course_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_course_overview` AS SELECT 
 1 AS `course_id`,
 1 AS `course_title`,
 1 AS `course_description`,
 1 AS `teacher`,
 1 AS `enrolled_count`,
 1 AS `total_lessons`,
 1 AS `total_revenue`,
 1 AS `avg_progress_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_teacher_courses`
--

DROP TABLE IF EXISTS `vw_teacher_courses`;
/*!50001 DROP VIEW IF EXISTS `vw_teacher_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_teacher_courses` AS SELECT 
 1 AS `teacher_id`,
 1 AS `teacher_name`,
 1 AS `teacher_bio`,
 1 AS `course_id`,
 1 AS `course_title`,
 1 AS `course_description`,
 1 AS `enrolled_count`,
 1 AS `total_lessons`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'eduplus'
--

--
-- Dumping routines for database 'eduplus'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_user_progress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_user_progress`(u_id INT, c_id INT) RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
  DECLARE total_lessons INT;
  DECLARE done_lessons  INT;
  DECLARE pct          DECIMAL(5,2);

  SELECT COUNT(*) INTO total_lessons
    FROM lessons WHERE course_id = c_id;

  SELECT COUNT(*) INTO done_lessons
    FROM sessions s
    JOIN lessons l ON s.lesson_id = l.id
    WHERE s.user_id = u_id
      AND l.course_id = c_id
      AND s.completed_at IS NOT NULL;

  IF total_lessons = 0 THEN
    SET pct = 0;
  ELSE
    SET pct = done_lessons/total_lessons*100;
  END IF;

  RETURN pct;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_enroll_and_pay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_enroll_and_pay`(
  IN p_user   INT,
  IN p_course INT
)
BEGIN
  DECLARE course_price DECIMAL(10,2);
  DECLARE user_bal     DECIMAL(10,2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Ошибка: транзакция отменена.' AS msg;
  END;

  START TRANSACTION;
    SELECT price INTO course_price
      FROM courses
      WHERE id = p_course
      FOR UPDATE;

    SELECT balance INTO user_bal
      FROM users
      WHERE id = p_user
      FOR UPDATE;

    IF user_bal >= course_price THEN
      INSERT INTO payments(user_id, course_id, amount)
        VALUES (p_user, p_course, course_price);
      -- enrollments и списание баланса сделает триггер
      COMMIT;
      SELECT 'Успешно зачислен на курс!' AS msg;
    ELSE
      ROLLBACK;
      SELECT 'Недостаточно средств.' AS msg;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_course_overview`
--

/*!50001 DROP VIEW IF EXISTS `vw_course_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_course_overview` AS select `c`.`id` AS `course_id`,`c`.`title` AS `course_title`,`c`.`description` AS `course_description`,`t`.`name` AS `teacher`,count(distinct `e`.`user_id`) AS `enrolled_count`,count(distinct `l`.`id`) AS `total_lessons`,ifnull(sum(`p`.`amount`),0) AS `total_revenue`,ifnull(avg(`fn_user_progress`(`e`.`user_id`,`c`.`id`)),0) AS `avg_progress_pct` from ((((`courses` `c` join `teachers` `t` on((`c`.`teacher_id` = `t`.`id`))) left join `enrollments` `e` on((`c`.`id` = `e`.`course_id`))) left join `lessons` `l` on((`c`.`id` = `l`.`course_id`))) left join `payments` `p` on((`c`.`id` = `p`.`course_id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_teacher_courses`
--

/*!50001 DROP VIEW IF EXISTS `vw_teacher_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_teacher_courses` AS select `t`.`id` AS `teacher_id`,`t`.`name` AS `teacher_name`,`t`.`bio` AS `teacher_bio`,`c`.`id` AS `course_id`,`c`.`title` AS `course_title`,`c`.`description` AS `course_description`,ifnull(`cnt_enr`.`enrolled_count`,0) AS `enrolled_count`,ifnull(`cnt_less`.`total_lessons`,0) AS `total_lessons`,ifnull(`sum_pay`.`total_revenue`,0.00) AS `total_revenue` from ((((`teachers` `t` left join `courses` `c` on((`c`.`teacher_id` = `t`.`id`))) left join (select `enrollments`.`course_id` AS `course_id`,count(distinct `enrollments`.`user_id`) AS `enrolled_count` from `enrollments` group by `enrollments`.`course_id`) `cnt_enr` on((`cnt_enr`.`course_id` = `c`.`id`))) left join (select `lessons`.`course_id` AS `course_id`,count(0) AS `total_lessons` from `lessons` group by `lessons`.`course_id`) `cnt_less` on((`cnt_less`.`course_id` = `c`.`id`))) left join (select `payments`.`course_id` AS `course_id`,sum(`payments`.`amount`) AS `total_revenue` from `payments` group by `payments`.`course_id`) `sum_pay` on((`sum_pay`.`course_id` = `c`.`id`))) order by `t`.`id`,`c`.`id` */;
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

-- Dump completed on 2025-06-25  3:20:28
