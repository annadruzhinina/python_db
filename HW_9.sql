/* #1 В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users u WHERE id=1;
DELETE  FROM shop.users WHERE id=1;
COMMIT;

-- проверка
SELECT * FROM sample.users u WHERE id=1;
SELECT * FROM shop.users u WHERE id=1;

/* #2 Создайте представление, которое выводит название name товарной позиции из таблицы products
 и соответствующее название каталога name из таблицы catalogs. */

CREATE OR REPLACE VIEW name AS SELECT p.name AS products_name, c.name AS catalogs_name FROM products p
JOIN catalogs c ON  p.catalog_id=c.id;

-- обращение к представлению
SELECT * FROM name;

-- представление появляется в списке таблиц
SHOW TABLES;

-- _________________________________________________________________________________________________________

/*Практическое задание по теме “Хранимые процедуры и функции, триггеры"

#1 Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего 
времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция
 должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/
delimiter //
DROP FUNCTION IF EXISTS hello;

delimiter //
CREATE FUNCTION hello()
RETURNS varchar(255) DETERMINISTIC 
BEGIN
	DECLARE HOUR int;
	SET HOUR = hour(now());
	CASE 
		WHEN  HOUR BETWEEN 6 AND 11 THEN 
		RETURN 'Доброе утро';
		WHEN  HOUR BETWEEN 12 AND 17 THEN 
		RETURN 'Добрый день';
		WHEN  HOUR BETWEEN 18 AND 23 THEN 
		RETURN 'Добрый вечер';
		WHEN  HOUR BETWEEN 0 AND 5 THEN 
		RETURN  'Доброй ночи';
	END CASE;
END//
	
-- проверка
SELECT hello()	


/* №2 В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
 Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
 значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были 
 заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
DROP TRIGGER IF EXISTS products_filds;
delimiter //

CREATE TRIGGER products_filds BEFORE INSERT ON products
FOR EACH ROW 
BEGIN 

-- проверить что name и description не NULL
	IF(NEW.name = NULL and NEW.description = NULL ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'name and description can not be NULL';
    END IF;
END//

-- проверка
INSERT INTO products  (name, description) VALUES (NULL, NULL)














