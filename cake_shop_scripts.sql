
--  JOIN - Количество заказов (orders) по их статусу
SELECT 
	count(*),os.order_status_description 
FROM 
	orders o
	JOIN order_status os ON o.order_status_id =os.id 
GROUP BY order_status_id;


-- UNION - Все данные из обеих табл 
SELECT * FROM decore d2 
UNION ALL
SELECT * FROM categories c;

-- Limit
SELECT * FROM decore
UNION ALL
SELECT * FROM categories  
ORDER BY name 
LIMIT 2;

-- Order By, Limit, Union
(SELECT * FROM decore
ORDER BY name 
LIMIT 2)
UNION ALL
(SELECT * FROM categories
ORDER BY name 
LIMIT 2);


-- WHERE - DESC  Выбрать заказы, где торт превышает массу 3 кг
SELECT * FROM cake_build 
WHERE cake_weight >3
ORDER BY cake_weight ; -- по возрастанию


SELECT * 
FROM cake_build 
WHERE cake_weight >3
ORDER BY cake_weight DESC; -- по убыванию

-- HAVING - Выбрать постоянного клиента (более одного заказа)
SELECT 
	count(o.id) AS total_orders, customer_id, delivery_name 
FROM orders o
GROUP BY customer_id
HAVING count(o.id)>1;

-- LEFT JOIN -Вывести все доставки постоянных клиентов, включая ситуацию когда delivery_address_id=NULL
SELECT 
	o.customer_id, count(*), count(o.customer_id), count(delivery_address_id)
FROM 
	orders o
LEFT JOIN
	address a ON o.delivery_address_id=a.id
GROUP BY o.customer_id
HAVING count(DISTINCT delivery_address_id)>1;


-- IN - DISTINCT - COUNT- Вложенные запросы
-- Выбрать  клиента  у которого были разные адреса доставки, вывести эти адреса доставки.

SELECT 
	o.customer_id,  a.address_street, a.zip_code_id 
FROM 
	orders o
JOIN
	address a ON o.delivery_address_id=a.id
WHERE o.customer_id 
IN (
	SELECT 
		o.customer_id
	FROM 
		orders o
		JOIN address a ON o.delivery_address_id=a.id
	GROUP BY o.customer_id
	HAVING count(DISTINCT delivery_address_id)>1
	);


-- LIKE % - Вывести отмененные заказы

SELECT 
	o.customer_id , o.delivery_name,  a.address, a.address_to_date, os.order_status_description 
FROM 
	orders o 
	JOIN 
		address a ON o.delivery_address_id=a.id 
	JOIN 
		order_status os ON o.order_status_id=os.id
WHERE 
	os.order_status_description LIKE 'Can%';


-- Выбрать все декоры, ордеры которых в процессе.
SELECT 
	order_id, d.name, cb.order_id, os.order_status_description 
FROM 
	cake_build cb
	JOIN 
		decore d ON d.id =cb.decore_type_id 
	JOIN 
		orders o ON o.id =cb.order_id 
	JOIN order_status  os ON os.id=o.order_status_id 
WHERE os.order_status_description IN ('New', 'In progress');	


-- Представление
DROP VIEW IF EXISTS view_1;

CREATE VIEW view_1 AS SELECT delivery_name, email, purchase_data FROM orders o;
SELECT * FROM view_1 v WHERE purchase_data > now()- INTERVAL 20 DAY;

-- Представление -  Постоянные клиенты
DROP VIEW IF EXISTS vip_customers;

CREATE VIEW  vip_customers AS SELECT 
	count(o.id) AS total_orders, customer_id, delivery_name, o.id 
FROM orders o
GROUP BY customer_id
HAVING count(o.id)>1;

SELECT * FROM  VIP_customers;


-- Что заказывают  VIP клиенты (постоянные клиенты)

SELECT 
	o.customer_id,  d.name, cf.name_fillings, cb.price, cb.order_id 
FROM 
	cake_build cb 
	JOIN 
		decore d ON d.id=cb.decore_type_id 
	JOIN 
		cake_fillings cf ON cf.id=cb.name_fillings_id 
	JOIN 
	 	orders o ON o.id = cb.order_id 
WHERE 
	o.customer_id IN (SELECT vc.customer_id  FROM  VIP_customers vc)
ORDER BY o.customer_id;

-- Xранимые процедуры

DROP PROCEDURE IF exists order_total;

DELIMITER //
create procedure order_total (IN for_order_id bigint unsigned)
BEGIN 
	-- сумма(финансы) всех заказов
	SELECT sum(price) FROM cake_build cb WHERE order_id=for_order_id;
END //

-- Вызов процедуры
CALL order_total(1);

-- Xранимые процедура обновления order_total
DROP PROCEDURE IF exists update_order_total;

DELIMITER //
create procedure update_order_total (IN for_order_id bigint unsigned)
BEGIN 
	-- Сумма всех заказов
	UPDATE orders o
	SET 
		total_price=(SELECT sum(price) FROM cake_build cb WHERE order_id=for_order_id)
	WHERE id=for_order_id;
END //

-- Вызов процедуры
CALL update_order_total(1);


-- Тригер обновления total_order price

DROP TRIGGER IF EXISTS update_order_total_after_update;
DELIMITER //

CREATE TRIGGER update_order_total_after_update AFTER UPDATE ON cake_build
FOR EACH ROW
BEGIN
   CALL update_order_total(NEW.order_id);
END//

DELIMITER ;

-- 
DROP TRIGGER IF EXISTS update_order_total_after_insert;

DELIMITER //

CREATE TRIGGER update_order_total_after_insert AFTER INSERT ON cake_build
FOR EACH ROW
BEGIN
   CALL update_order_total(NEW.order_id);
END//

DELIMITER ;

-- 
DROP TRIGGER IF EXISTS update_order_total_after_delete;

DELIMITER //

CREATE TRIGGER update_order_total_after_delete AFTER DELETE ON cake_build
FOR EACH ROW
BEGIN
   CALL update_order_total(OLD.order_id);
END//

DELIMITER ;


-- Добавление продуктов в сузествующий заказ
INSERT INTO `cake_build` 
VALUES 
	('39','1','1','1','1','repellendus','1.5','1','Qui ut repellat rem placeat','2017-11-28 12:18:01','2019-10-16 22:53:34','1000');


-- Проверка обновления поля total_price таблицы orders
SELECT * FROM orders o  WHERE id=1; -- total_price=total_price+1000





