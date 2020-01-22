/* Урок 2. Видеоурок. Управление БД. Язык запросов SQL*/

/*
1.Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
*/
/*
[client]
password=qwerty
user=root
*/

/*
2.Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/
drop database if exists example; 
create database example;
use example; 

CREATE TABLE users (
	id INT NOT NULL,
	name varchar(100) NULL
);

INSERT INTO users (id, name)
VALUES(0, 'Anna');

INSERT INTO users (id, name)
VALUES(1, 'Mike');



/*
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/

/*
C:\Users\anna>mysqldump -u root -p example >example.sql
*/

-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)

drop database if exists sample; 
create database sample;
use sample; 

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1, 'Mike'),(0, 'Anna');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2020-01-21 22:51:45
