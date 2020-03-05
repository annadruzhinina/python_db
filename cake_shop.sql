/* 
Проект: Интернет магазин кондитерских изделий.
Цель  : Идея моего проекта в том, что я дам возможность людям с аллергией, вегатарианцам и 
		просто людям ведущем правильный образ жизни создать свой уникальный торт исходя из своих 
		вкусовых и эстетических предпочтений.  
		Мой сайт будет отличной торговой площадкой для самозанятых кондитеров, котрые ведут свой бизнес.
*/

DROP DATABASE IF EXISTS cake_shop;
CREATE DATABASE cake_shop;
USE cake_shop;

-- ----------------------------------------------------------------------------------------
-- Наполнители торотов 
DROP TABLE IF EXISTS `cake_fillings`;
CREATE TABLE `cake_fillings` (
  `id` SERIAL PRIMARY KEY,
  `name_fillings` varchar(50) DEFAULT NULL,
  `body` text
)
;

INSERT INTO cake_fillings
  (`id`, `name_fillings`, `body`)
VALUES
  ('1', 'Шоколадно-Апельсиновая','Яркое сочетание ароматного шоколада и апельсина'),
  ('2', 'Шоколад-Малина','Яркое сочетание ароматной малины и шоколада'),
  ('3', 'Шоколадно-Клубничная','Яркое сочетание ароматной клубники и шоколада'),
  ('4', 'Шоколадный мусс','Ярко выраженный вкус шоколада'),
  ('5', 'Фисташко-Вишнквая','Яркое сочетание ароматной фисташки и вишни'),
  ('6', 'Морковная начинка','Классический вкус морковного торта'),
  ('7', 'Кокосрвая начинка','Вкус баунти');
  

 
-- ----------------------------------------------------------------------------------------
-- Категория дессертов (тематика)
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(50) DEFAULT NULL
);

INSERT INTO `categories`
  (`id`, `name`)
VALUES
	('1', 'Свадебный'),
	('2', 'Детский День рождение'),
	('3', 'Мужской'),
	('4', 'Гендорный'),
	('5', 'Юбилей'),
	('6', 'Вегатарианский'),
	('7', 'Для диабетиков'),
    ('8', 'Готовые'),
    ('9', 'Пироженные');

-- ----------------------------------------------------------------------------------------
	

-- Вид декора дессерта
DROP TABLE IF EXISTS `decore`;
CREATE TABLE `decore` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(50) DEFAULT NULL
);

INSERT INTO `decore`
  (`id`, `name`)
VALUES
	('1', 'Мастика'),
	('2', 'Гляссаж'),
	('3', 'Крем'),
	('4', 'Безлактозный крем'),
	('5', 'Цветы'),
	('6', 'Для девочки'),
	('7', 'Для мальчика'),
	('8', 'Торт Бутман'),
	('9', 'Космос')
;


-- ----------------------------------------------------------------------------------------

-- Покупатели 
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
	`id` SERIAL PRIMARY KEY,
	`firstname` varchar(50) DEFAULT NULL,
	`lastname` varchar(50) DEFAULT NULL,
	`birthday` date,
	`email` varchar(120) DEFAULT NULL,
	`phone` bigint DEFAULT NULL,
	KEY index_of_email(email),
	KEY index_of_phone(phone)
);

INSERT INTO `customer`
  (`id`, `firstname`, `lastname`, `birthday`, `email`, `phone`)
VALUES
	('1', 'Reuben', 'Nienow','1973-10-17', 'arlo50@example.org', '9374071116'),
	('2', 'Frederik', 'Upton','1976-04-19','terrence.cartwright@example.org', '9127498182'),
	('3', 'Unique', 'Windler','1983-09-07', 'rupert55@example.org', '9921090703'),
	('4', 'Norene', 'West','2014-07-31', 'rebekah29@example.net', '9592139196'),
	('5', 'Frederick', 'Effertz','1975-03-26', 'von.bridget@example.net', '9909791725'),
	('6', 'Victoria', 'Medhurst','1999-03-26', 'sstehr@example.net', '9456642385'),
	('7', 'Austyn', 'Braun', '1978-03-06','itzel.beahan@example.com', '9448906606'),
	('8', 'Jaida', 'Kilback', '1965-09-12','johnathan.wisozk@example.com', '9290679311'),
	('9', 'Mireya', 'Orn','1986-11-07', 'missouri87@example.org', '9228624339'),
	('10', 'Jordyn', 'Jerde','1975-03-26', 'edach@example.com', '9443126821'),
	('11', 'Thad', 'McDermott','1975-03-26', 'shaun.ferry@example.org', '9840726982'),
	('12', 'Aiden', 'Runolfsdottir','1975-03-26', 'doug57@example.net', '9260442904'),
	('13', 'Bernadette', 'Haag','1975-03-26', 'lhoeger@example.net', '9984574866'),
	('14', 'Dedric', 'Stanton','1975-03-26', 'tconsidine@example.org', '9499932439'),
	('15', 'Clare', 'Wolff','1975-03-26', 'effertz.laverna@example.org', '9251665331'),
	('16', 'Lina', 'Macejkovic','1975-03-26','smitham.demarcus@example.net', '9762021357'),
	('17', 'Jerrell', 'Stanton', '1975-03-26','deja00@example.com', '9191103792'),
	('18', 'Golden', 'Wisozk','1975-03-26', 'frida19@example.com', '9331565437'),
	('19', 'Elisa', 'Balistreri','1975-03-26', 'romaine27@example.org', '9372983850'),
	('20', 'Reed', 'Bogan','1975-03-26', 'zhyatt@example.com', '9924753974'),
	('21', 'Gwendolyn', 'McClure','1975-03-26', 'zluettgen@example.net', '9745046704'),
	('22', 'Luz', 'Bailey','1975-03-26', 'tillman.iliana@example.org', '9881942174'),
	('23', 'Alyce', 'Toy','1975-03-26', 'russel.ewell@example.com', '9754884857'),
	('24', 'Oma', 'Ortiz','1975-03-26', 'jailyn.feest@example.com', '9339073755'),
	('25', 'Valentine', 'Goldner','1975-03-26', 'matteo.wiza@example.net', '9803404650'),
	('26', 'Rasheed', 'Ebert','1975-03-26', 'brenden32@example.net', '9924275184'),
	('27', 'Misael', 'Lakin', '1975-03-26','benjamin.hilpert@example.com', '9619165091'),
	('28', 'Shaun', 'Fritsch','1977-09-26', 'wwiegand@example.org', '9231898080'),
	('29', 'Katarina', 'Sipes', '1998-03-21','jenifer.gislason@example.net', '9348426774');

-- ----------------------------------------------------------------------------------------

-- Список стран 
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
	`id` SERIAL PRIMARY KEY,
	`country_name` varchar(50)
	
);
INSERT INTO `country` VALUES
	('1','Solomon Islands'),
	('2','Swaziland'),
	('3','Senegal'),
	('4','Pitcairn Islands'),
	('5','Ecuador'),
	('6','Lithuania'),
	('7','Cuba'),
	('8','Paraguay'),
	('9','Somalia'),
	('10','Norway'); 

-- ----------------------------------------------------------------------------------------

-- Список городов
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
	`id` SERIAL PRIMARY KEY,
	`city_name` varchar(50),
	KEY index_of_city_name(city_name)
);

INSERT INTO `city` VALUES 
	('1','North Claudefurt'),
	('2','New Koryberg'),
	('3','South Triston'),
	('4','Brakusside'),
	('5','Laneville'),
	('6','Hanebury'),
	('7','Lake Addison'),
	('8','North Daphneyton'),
	('9','Schusterhaven'),
	('10','Port Jody'),
	('11','Hicklemouth'),
	('12','New Verner'),
	('13','Chanelstad'),
	('14','O\'Keefeshire'),
	('15','Ferryport'),
	('16','West Javon'),
	('17','Carsonmouth'),
	('18','Strosinview'),
	('19','Donnietown'),
	('20','West Flossieview'); 

-- ----------------------------------------------------------------------------------------

-- Почтовый индекс
DROP TABLE IF EXISTS `zip_code`;
CREATE TABLE `zip_code` (
	`id` SERIAL PRIMARY KEY,
	`city_id` bigint unsigned NOT NULL,
	`country_code`  bigint unsigned NOT NULL,
	`state_code` int,
	FOREIGN KEY (`country_code`) REFERENCES `country` (`id`),
	FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
);

INSERT INTO `zip_code` VALUES 
	('1','1','1','07302'),
	('2','2','2','07302'),
	('3','3','3','07302'),
	('4','4','4','07302'),
	('5','5','5','07302'),
	('6','1','3','07302'),
	('7','1','5','07302');

-- ----------------------------------------------------------------------------------------


-- Адресса покупателей
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
	`id` SERIAL PRIMARY KEY,
  	`address_from_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`address_to_date` DATETIME DEFAULT NULL,
	`address` varchar(120) DEFAULT NULL,
	`zip_code_id`  bigint unsigned NOT NULL,
	`customer_id` bigint unsigned NOT NULL,
	FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`),
	FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
);
 
INSERT INTO `address`
VALUES 
	('1','2019-10-30 09:19:58',NULL,'33002 Effertz Grove\nEast Earlland, CA 74915-2644','1','1'),
	('2','2019-10-03 04:06:11',NULL,'79889 Brendan Brook\nSouth Fritz, SD 74067-6221','2','2'),
	('3','2019-06-10 19:30:58',NULL,'59356 Kassandra Well\nPort Frederickfurt, DC 36164','3','3'),
	('4','2019-05-10 08:47:46',NULL,'4125 Hettie Shoals Apt. 775\nDuaneland, ME 21125-5823','4','4'),
	('5','2019-11-28 09:43:40',NULL,'897 Juliana Wells\nEast Dorthaburgh, AZ 43984-9982','5','5'),
	('6','2019-02-14 01:06:38',NULL,'897 Kirlin Extensions\nGrimesburgh, VA 44465-4110','6','6'),
	('7','2019-03-14 08:18:31',NULL,'195 Shaina Street Suite 769\nEleanoramouth, MO 44593','7','7'),
	('8','2019-11-13 12:33:40',NULL,'963 Lowe Well\nNew Mariettafurt, VT 50252','1','8'),
	('9','2019-12-16 15:47:10',NULL,'0670 Salvatore Courts Suite 096\nSouth Anselland, CO 83914-5343','1','9'),
	('10','2019-03-17 06:13:07',NULL,'9157 Terrance Pines\nBradtkeville, NH 94739-8131','2','10'),
	('11','2019-12-24 21:16:48',NULL,'99609 Broderick Throughway Apt. 317\nLennashire, AZ 18842-6020','3','11'),
	('12','2019-03-23 12:34:49',NULL,'27945 Langworth Stream\nGoodwinview, AR 76231','4','12'),
	('13','2019-02-10 12:07:09',NULL,'445 Olaf Fords Suite 958\nNorth Katheryn, OK 77162','5','13'),
	('14','2016-05-23 15:41:32',NULL,'3464 Brekke Shore\nHesselshire, IL 35135','6','14'),
	('15','2019-11-22 07:14:47',NULL,'18697 Nienow Key\nLeannonburgh, AK 79567-2637','7','15'),
	('16','2011-12-18 23:18:53',NULL,'61302 Carli Parkways Apt. 530\nEinofurt, OK 56147-9078','1','16'),
	('17','2019-02-08 10:16:22',NULL,'568 Katelyn Shores\nSouth Herbertstad, ME 61203-5721','1','17'),
	('18','2010-02-03 21:33:50',NULL,'43070 Wilkinson Cape\nWolfview, MS 50394-7410','3','18'),
	('19','2000-12-09 10:43:33',NULL,'185 Reynolds Pines Suite 657\nAldaview, AL 99492','1','20'),
	('20','2019-07-31 16:48:48',NULL,'40941 Kyler Cliff Apt. 890\nLake Devonteville, CO 04256','1','19'),
	('21','2019-06-10 09:18:08',NULL,'1160 Heaney Forest Suite 182\nHaleighton, AR 40376','5','21'),
	('22','2019-10-14 05:02:57',NULL,'045 Yazmin Forges Apt. 641\nEast Devante, OK 61427','1','29'),
	('23','2019-04-15 09:30:28',NULL,'02300 Camila Shoals\nSouth Nat, DC 90076-4402','5','22'),
	('24','2019-08-27 02:42:27',NULL,'18864 Larry Port\nGerlachland, IN 04552-7795','1','23'),
	('25','2018-06-13 23:30:22',NULL,'42249 Welch Cliffs Suite 081\nLake Mortonmouth, IL 06887-4827','1','24'),
	('26','2018-07-10 22:06:17',NULL,'383 Borer Centers Apt. 539\nNorth Roberta, WA 01404','1','25'),
	('27','2018-04-06 03:05:36',NULL,'553 Devonte Court Apt. 318\nSouth Destiny, NE 16100-4950','1','26'),
	('28','2018-05-25 14:04:02',NULL,'20844 Sporer Ports\nPort Demarco, PA 26558','2','27'),
	('29','2018-10-10 16:47:42',NULL,'27046 Jazmyne Ranch\nCurtview, MN 73599-4925','3','28'),
	('30','2008-07-26 15:00:07',NULL,'6860 Lilyan Plains\nNew Millerstad, WI 63189','4','11'),
	('31','2014-12-26 11:59:43',NULL,'9843 Gottlieb Trafficway Suite 290\nLake Shayne, TN 87042','5','7'),
	('32','2014-11-26 18:49:18',NULL,'350 Moore Shores\nSchowalterfurt, SD 50584','1','2'),
	('33','2018-01-15 07:44:33',NULL,'17919 Joesph Extensions\nNew Garnett, RI 22089-0391','1','2'),
	('34','2018-08-22 13:58:10',NULL,'23617 Corene Divide\nWest Nannieview, IL 15659','1','2'),
	('35','2018-05-10 11:35:21',NULL,'9278 Brakus Harbors Suite 278\nBethelfurt, RI 67984','1','2'),
	('36','2018-01-23 04:42:58',NULL,'4291 Noe Plains Suite 406\nChaddmouth, NH 61113','1','2'),
	('37','2012-07-31 02:15:20',NULL,'1689 Mateo Terrace\nEast Marilie, AL 52189','1','2'),
	('38','2018-08-12 14:32:53',NULL,'325 Stokes Field\nWilliamsonland, IA 22094-5730','1','2'),
	('39','2018-02-11 01:15:56',NULL,'788 Melvina Heights Apt. 641\nNew Beverlyland, IL 37968','1','2'),
	('40','2019-02-18 16:53:56',NULL,'2605 Judy Park Suite 266\nPort Candelario, MN 85174','1','2'),
	('41','2018-01-15 11:27:08',NULL,'43720 Kamron Pines\nBalistrerihaven, ME 34785','1','2'),
	('42','2016-12-31 05:04:34',NULL,'9766 Schmitt Ville\nPort Romaineville, MA 65529','1','2'),
	('43','2019-03-20 08:34:54',NULL,'5477 Jamal Burg\nConnellyburgh, NY 52736','1','2'),
	('44','2018-11-22 01:32:35',NULL,'71666 Bette Ford\nSchroederfort, OH 14604-0101','1','2');


-- ----------------------------------------------------------------------------------------

-- Статус заказа
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
	`id` SERIAL PRIMARY KEY,
	`order_status_code` char(10),
	`order_status_description` text
);

INSERT INTO `order_status` 
VALUES
	('1','90438','New'),
	('2','52997','In progress'),
	('3','05620','Shipped'),
	('4','26805','Delivered'),
	('5','85387','Canceled'),
	('6','92149','Return');

-- ----------------------------------------------------------------------------------------


-- Заказы
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
	`id` SERIAL PRIMARY KEY,
	`customer_id` bigint unsigned NOT NULL,
	`delivery_name` varchar(50),
	`email` varchar(50),
	`purchase_data` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`order_status_id`  bigint unsigned NOT NULL,
	`delivery_address_id` bigint unsigned,
	`total_price` int,
	FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
	FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`),
	FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
	KEY index_of_order_status_id(order_status_id),
	KEY index_of_delivery_address_id(delivery_address_id),
	KEY index_of_customer_id(customer_id)
);



INSERT INTO `cake_shop.orders` 
VALUES
	 ('1', '1', 'Reuben Nienow','arlo50@example.org','2020-02-24','1','1', '5000'),
	 ('2', '2', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','2','2', '3400'),
	 ('3', '3', 'Frederik Upton','rupert55@example.org','2019-11-09','3','3', '1400'),
	 ('4', '4', 'Norene West','rebekah29@example.net','2019-11-23','4','4', '2500'),
	 ('5', '5', 'Frederick Effertzn','von.bridget@example.net','2020-01-01','5','5', '500'),
	 ('6', '6', 'Victoria Medhurst','sstehr@example.net','2020-01-01','6','6', '1456'),
	 ('7', '7', 'Austyn Braun','itzel.beahan@example.com','2020-01-01','1','7', '7689.86'),
	 ('8', '8', 'Jaida Kilback','arlo50@example.org','2020-02-24','1','8', '5000'),
	 ('9', '9', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','2','9', '3400'),
	 ('10', '10', 'Jordyn Jerde','edach@example.com','2019-11-09','3','10', '1400'),
	 ('11', '11', 'Thad McDermott','shaun.ferry@example.org','2019-11-23','4','11', '2500'),
	 ('12', '12', 'Aiden Runolfsdottir','doug57@example.net','2020-01-01','5','12', '500'),
	 ('13', '13', 'Bernadette Haag','lhoeger@example.net','2020-01-01','6','13', '1456'),
	 ('14', '14', 'Dedric Stanton','tconsidine@example.org','2020-01-01','1','14', '7689.86'),
	 ('15', '15', 'Clare Wolff','effertz.laverna@example.org','2020-02-24','1','15', '5000'),
	 ('16', '16', 'Lina Macejkovic','smitham.demarcus@example.net','2020-01-01','2','16', '3400'),
	 ('17', '17', 'Jerrell Stanton','deja00@example.com','2019-11-09','3','17', '1400'),
	 ('18', '18', 'Golden Wisozk','frida19@example.com','2019-11-23','4','18', '2500'),
	 ('19', '19', 'Elisa Balistreri','romaine27@example.org','2020-01-01','5','19', '500'),
	 ('20', '20', 'Reed Bogan','zhyatt@example.com','2020-01-01','6','20', '1456'),
	 ('21', '21', 'Gwendolyn McClure','zluettgen@example.net','2020-01-01','1','21', '7689.86'),
	 ('22', '22', 'Luz Bailey','tillman.iliana@example.org','2020-02-24','1','22', '5000'),
	 ('23', '23', 'Alyce Toy','russel.ewell@example.com','2020-01-01','2','23', '3400'),
	 ('24', '24', 'Oma Ortiz','jailyn.feest@example.com','2019-11-09','3','24', '1400'),
	 ('25', '25', 'Valentine Goldner','matteo.wiza@example.net','2019-11-23','4','25', '2500'),
	 ('26', '26', 'Rasheed Ebert','brenden32@example.net','2020-01-01','5','26', '500'),
	 ('27', '27', 'Misael Lakin','benjamin.hilpert@example.com','2020-01-01','6','27', '1456'),
	 ('28', '28', 'Shaun Fritsch','wwiegand@example.org','2020-01-01','1','28', '7689.86'),
	 ('29', '29', 'Katarina Sipes','jenifer.gislason@example.net','2020-01-01','1','29', '7689.86'),
	 ('30', '1', 'Reuben Nienow','arlo50@example.org','2020-02-24','1','1', '3000'),
	 ('31', '1', 'Reuben Nienow','arlo50@example.org','2020-02-24','1','1', '4000'),
	 ('32', '2', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','2','2', '4546'),
	 ('33', '2', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','4','2', '3488'),
	 ('34', '2', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','4','3', '1200'),
	 ('35', '2', 'Unique Windler','terrence.cartwright@example.org','2020-01-01','4','3', '4500'),
	 ('36', '3', 'Frederik Upton','rupert55@example.org','2019-11-09','3','4', '1400'),
	 ('37', '2', 'lol cec','1@example.org','2019-11-09','3', null, '1400');
	

-- ----------------------------------------------------------------------------------------

-- 	Конструктор  индивидуального заказа
DROP TABLE IF EXISTS `cake_build`;
CREATE TABLE `cake_build` (
  `id` SERIAL PRIMARY KEY,
  `order_id`bigint unsigned NOT NULL, 
  `decore_type_id` bigint unsigned NOT NULL,  
  `categories_id` bigint unsigned NOT NULL, 
  `name_fillings_id` bigint unsigned NOT NULL, 
  `name` varchar(50) DEFAULT NULL,
  `cake_weight` float NOT NULL,
  `count` int NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int,
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`decore_type_id`) REFERENCES `decore` (`id`),
  FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  FOREIGN KEY (`name_fillings_id`) REFERENCES `cake_fillings` (`id`)
);


INSERT INTO `cake_build` 
VALUES 
	('1','1','1','1','1','repellendus','1.5','1','Qui ut repellat rem placeat','2017-11-28 12:18:01','2019-10-16 22:53:34','1593'),
	('2','2','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('3','3','3','3','2','labore','2','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('4','4','4','4','3','at','1.5','1',' Voluptas nisi occaecati eos voluptas.','1984-06-21 03:41:14','2010-05-04 01:55:46','2345'),
	('5','5','5','5','4','laborum','5.3','1','CAutem est sapiente ullam consequatur dolor molestias. Per','1974-09-20 23:43:56','2014-05-15 13:44:41','3333'),
	('6','6','6','5','5','doloribus','2','1','Est rerum beatae exee quia cupiditate dolore.','1997-09-05 09:36:47','2009-04-12 03:08:54','3333'),
	('29','7','7','6','6','tempore','2','1','. Ipsa corrupti iusto dantium illum fugit iste.','2000-12-24 23:34:20','2003-03-25 06:15:32','5715'),
	('7','8','8','8','7','deserunt','2.1','3',' Voluptas omnis sunt repudiandae voluptatem est commodi.','1987-07-01 06:48:10','1977-02-25 01:13:34','4311'),
	('8','9','9','9','4','rem','3.4','1','odio laboriosam perspiciatis architecto explicabo aspernatur.','2013-06-03 01:47:47','1984-11-25 15:22:04','1319'),
	('9','10','1','1','1','doloremque','3.6','1','sed eligendi magnam possimus. Nihil ceectus vel non odit.','2009-06-29 23:16:33','1992-08-13 16:02:27','3333'),
	('10','11','2','2','2','officia','2.5','5','magni soluta.','1991-05-15 11:21:56','1991-01-19 08:59:07','1111'),
	('11','12','3','3','3','aut','1','8','Doloribusaecati dolor. Occaecati soluta voluptas et eum. Qui','1980-06-04 04:02:46','2004-04-14 10:33:11','1457'),
	('12','13','4','4','5','tempore','4.4','1',' consequuntur et cupiditate.','1972-03-12 08:36:13','1974-04-21 17:36:06','2391'),
	('13','14','5','5','4','consequatur','2','2','illo voluptatuse ipsa sit mollit','1975-02-16 01:18:15','1996-07-10 11:04:35','7581'),
	('14','15','6','6','6','eum','7.4','1','m quia magni id aut. Ratione ut sit cum aut voluptatem ab.','2013-11-03 15:56:32','1983-03-17 15:18:23','2220'),
	('15','16','7','7','7','voluptatem','3.3','2',' Quo beatae iste vero ut ut vel accusamus.','1990-04-21 16:09:42','1987-01-20 15:26:16','2221'),
	('16','17','8','8','1','iusto','11','2','t beatae sed eum optio est iusto.','2018-08-17 21:32:11','1996-06-07 12:36:56','3335'),
	('17','18','9','9','2','voluptatem','1.2','2','c. Voluptas voluptatem non iste sunt.','2005-09-12 18:37:23','1999-07-11 09:44:16','264'),
	('18','19','1','1','3','quo','1','22','onsequatur autem distinctio omnis cupiditate.','2012-12-02 16:36:33','2019-07-08 00:33:15','4459'),
	('19','20','2','9','4','aperiam','4.5','1','Puisquam exeronem hic odit voluptas in.','1978-12-09 19:32:44','1982-04-25 05:57:55','4136'),
	('20','21','3','8','5','illo','1.7','1','e voluptatem eum enim dolorem debitis.','1998-08-09 07:23:51','2009-09-14 16:43:48','3456'),
	('21','22','4','7','6','perspiciatis','3.7','1',' Comunt cumque.','1980-07-15 12:21:06','2009-12-06 23:59:58','3000'),
	('22','23','5','6','6','saepe','3','1','tionem qui corporis eum. Atque non nihil possimus accusamus.','2006-03-24 09:58:13','1970-06-30 15:26:00','6234'),
	('23','24','6','5','7','occaecati','2','2','pariatur tempore earum ex. ','1989-10-26 05:15:39','1974-02-25 06:54:07','4000'),
	('24','25','7','4','2','aspernatur','1','2',' Expedita repudiandae voluptas aut magnam odio.','1988-05-19 09:47:27','2003-09-26 04:33:19','1846'),
	('25','26','8','1','3','sed','2.4','1','Qui adiitatibus. Nesciunt excepturi molestiae vel dolore.','1987-06-03 10:14:04','2016-03-21 10:23:33','1000'),
	('26','27','8','3','1','totam','1.3','1','re  maiores quisquam qui.','2005-04-28 14:33:42','1990-03-22 06:26:46','1234'),
	('27','28','9','2','1','inventore','1.1','1','ritatis et dicta.','1974-06-10 22:29:02','1974-09-04 23:56:36','3512'),
	('28','29','1','1','1','non','1.7','1',' Similique veritatis earum vitae iure et.','1971-05-26 06:19:25','1982-08-08 10:49:31','9065'),
	('37','30','1','1','1','repellendus','1.5','1','Qui ut repellat rem placeat','2017-11-28 12:18:01','2019-10-16 22:53:34','1593'),
	('30','31','1','1','1','repellendus','1.5','1','Qui ut repellat rem placeat','2017-11-28 12:18:01','2019-10-16 22:53:34','1593'),
	('31','32','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('32','33','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('33','34','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('34','35','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('35','36','2','2','1','labore','9.25','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000'),
	('36','37','3','3','2','labore','2','2','Ea consequatur et numquam deleniti unde maxime','1980-01-03 02:50:04','2008-10-21 23:02:45','1000');
	

