/* Урок 3. Вебинар. Введение в проектирование БД*/

/*
1.Написать cкрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/


DROP TABLE IF EXISTS `video_type`;
CREATE TABLE `video_type`(
    id SERIAL PRIMARY KEY,
    -- name VARCHAR(255),
    `type` ENUM('My Videos', 'For you', 'Popular', 'Mysic&Dance', 'Entertainment', 'Sports', 'Trailers', 'Video Games', 'Beauty', 'Science&Technology','Hobbies'),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
    `id` SERIAL PRIMARY KEY,
    `video_type_id` BIGINT unsigned not null,
    `user_id` BIGINT unsigned not null,
    `body` text, 
     -- size BFILE,
    `file_name` VARCHAR(255),
     metadata JSON,
     created_at DATETIME DEFAULT NOW(),
     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 
    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (video_type_id) REFERENCES video_type(id)
);

DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE `credit_card` (
    `id` SERIAL PRIMARY KEY,
    `user_id` BIGINT unsigned not null,
    `transfer_sum` decimal(19,4),
    `card_number` VARCHAR(19),
    `valid_thru` DATE,
    `your_full_name` VARCHAR(50),
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS `money_transfer`;
CREATE TABLE `money_transfer` (
    `id` SERIAL PRIMARY KEY,
    `comment` text,
    `user_id_from` BIGINT unsigned not null,
    `user_id_to` BIGINT unsigned not null,
    `amaunt` decimal(19,4),
    `credit_card_from`BIGINT unsigned not null,
    `credit_card_to` BIGINT unsigned not null,
    `status`ENUM('In Progress', 'FAILED', 'SUCCESS', 'Try again'),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
     
    FOREIGN KEY (user_id_from) REFERENCES users(id),
    FOREIGN KEY (user_id_to) REFERENCES users(id),
    FOREIGN KEY (credit_card_from) REFERENCES credit_card(id),
    FOREIGN KEY (credit_card_to) REFERENCES credit_card(id)
);