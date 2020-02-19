/*
i. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
 */
DONE
/*
ii Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
 */
SELECT DISTINCT firstname FROM users
ORDER BY firstname

/* ---------------------------------------------------------------------------------------------
iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/
ALTER TABLE profiles
DROP COLUMN is_active;

ALTER TABLE profiles
ADD is_active boolean NOT NULL DEFAULT TRUE
-- Column  is_active added, parametr =1 (true) for all users
SELECT * FROM profiles

-- Select users under 18 years
SELECT * , 
floor(datediff(curdate(), birthday)/365) <18
FROM `profiles`
WHERE floor(datediff(curdate(), birthday)/365) < 18

-- is_active=0 if they are less 18 years

UPDATE `profiles` SET is_active =0 WHERE  floor(datediff(curdate(), birthday)/365) < 18; 


/*---------------------------------------------------------------------------------------------
iv. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
*/
INSERT INTO messages values
('101','1','2','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','2020-08-28 22:44:29');
-- проверка того, что строка добавилась
SELECT * FROM messages m2 WHERE id=101
DELETE FROM messages WHERE created_at > curdate();
-- проверка, что строка удалена
SELECT * FROM messages m2 WHERE id=101

/*---------------------------------------------------------------------------------------------
v. Написать название темы курсового проекта (в комментарии)
*/
"Cake_shop"
Я саздаю базу данных для будущего сайта в котором пользователь сможет из предлоденного ассортимента (начинка, декор, вес, кол-во ярусов, продукты и тд) 
создать свой торт или собрать сладкий стол по своему вкусу и цвету. Моя цель сделать сайт привлекательным для аллергиков и вегитаринцев.