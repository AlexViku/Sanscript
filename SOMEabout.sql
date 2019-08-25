
DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
id INT(5) PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL UNIQUE,
active BOOLEAN NOT NULL DEFAULT TRUE 
) ENGINE InnoDB;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
id INT(5) PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL UNIQUE,
regions_id INT(5) NOT NULL,
active BOOLEAN NOT NULL DEFAULT TRUE,
FOREIGN KEY (regions_id) REFERENCES regions(id)
) ENGINE InnoDB; #подсистема для работs системы внешних ключей 


mysqldump --opt -p +имябд > +имябд.sql #создание дампа бд
mysql -p +имябд < +имябд.sql #загрузка данных из дампа в бд


SHOW DATABASES; #показать доступные бд
DROP DATABASE +имя бд; #удалить бд
CREATE DATABASE +имя бд; #создать бд
USE +имябд; #использовать бд по умолчанию
SHOW TABLES; #показать таблицы
SHOW WARNINGS; #показать ошибки

CREATE TABLE +имятаб(+стобец +параметры, ...); #создание таблицы
+поле PRIMARY KEY; #Использования поля в качестве первичного ключа
FOREIGN KEY (+полеэтойтаб) REFERENCES +имядртаб(+поледртаб); #Использование поля как внешнего ключа для связи с др таблицей

DESC +имятаб; #вывод схемы таблицы

DROP TABLE +имятаб; #удаление таблицы
DROP TABLE IF EXISTS +имятаб; #Удалить таблицу если она существует

INSERT INTO +имятаб (+столбцы, ...) VALUES (+записи, ...); #внесение данных в таблицу 
INSERT INTO +имятаб2 SELECT +столбец1, +столбец2, ... FROM +имятаб1; #копирование содержимого из одной т. в др.
\ #Экранировка кавычек в записи

SELECT * FROM +имятаб; #вывести все данные содержащиеся в таблице
SELECT * FROM +имятаб WHERE +условие; =; !=; >; >=: LIKE '%x%'; OR; AND; #вывод данных из таблицы с условиями
SELECT DISTINCT +столбец FROM +имятаб; #вывод уникальных записей из столбца в таблице
SELECT имятаб.столбец1 AS c1, имятаб.столбец2 AS c2, ... FROM +имятаб; #вывод данных из таблицы с псевдонимами

SELECT +столбец, COUNT(+столбец) FROM +имятаб GROUP BY +столбец;
SELECT +столбец, COUNT(+столбец) FROM +имятаб GROUP BY +столбец HAVING COUNT(+столбец)>3;

SELECT * FROM +имятаб ORDER BY +столбец LIMIT x,y; #вывод записей таблицы сортированных по полю начиная с номера X и количеством Y
SELECT * FROM +имятаб ORDER BY +столбец ASC/DESC; #вывод данных с сортировкой по возрастанию/убыванию

SELECT data1, data2, ... FROM +таб1 LEFT JOIN +таб2 ON (таб1.key1 = таб2.key2); #вывод данных из двух таблиц с сопоставлением записей по указанным ключам слева (при абсолютном соответствии)
SELECT data1, data2, ... FROM +таб1 RIGHT JOIN +таб2 ON (таб1.key1 = таб2.key2); #вывод данных из двух таблиц с сопоставлением данных по указанным ключам справа (при абсолютном соответствии)
SELECT data1, data2, ... FROM +таб1 INNER JOIN +таб2 ON (таб1.key1 = таб2.key2); #вывод данных из двух таблиц с сопоставлением каждой из внутренних записей по указанным ключам
SELECT data1, data2, ... FROM +таб1 FULL JOIN +таб2 ON (таб1.key1 = таб2.key2); #вывод данных всех сочетаний при соответствии и не соответсвии указанных ключей
SELECT data1, data2, ... FROM +таб1 CROSS JOIN +таб2 ON (таб1.key1 = таб2.key2); #вывод всех вариаций данных таб2 для каждой записи из таб1
SELECT data1, data2 FROM +таб1, +таб2 WHERE key1 = key2; #тот же CROSS JOIN

UPDATE +имятаб SET +поле = значение WHERE +условие; #изменение данных в таблице
UPDATE +имятаб SET +поле = CASE WHEN усл1 THEN 'зна1' WHEN усл2 THEN 'зна2'... ELSE услХ THEN 'знаX' END; #изменение записей в полях срасширенным условием
UPDATE +имятаб SET +поле1 = значение WHERE +поле2 IN ('зна1', 'зна2', ...); #Изменение записей с условием для нескольких записей одновременно

DELETE FROM +имятаб; #удаление данных из таблицы
DELETE FROM +имятаб WHERE +условие; #удаление данных из таблицы с условием

ALTER TABLE +имятаб ADD COLUMN +столбец; #добавление столбца в таблицу
ALTER TABLE +имятаб DROP COLUMN +столбец; #удаление столбца из таблицы
ALTER TABLE +имятаб CHANGE COLUMN +столбец +новыйстолбец +параметры; #переименование столбца и изменение параметров
ALTER TABLE +имятаб MODIFY COLUMN +столбец +параметры; #изменение параметров столбца
ALTER TABLE +имятаб RENAME TO +новоеимятаб; #переименование таблицы

SELECT + COUNT(x); #вывод количества величин аргумента
SELECT + SUM(x); #вывод суммы величин в аргументе
SELECT + MIN(x); #вывод минимумальной величины аргумента
SELECT + MAX(x); #вывод максимальной величины аргумента
SELECT + ROUND(x); #округление аргумента до ближайшего целого числа
SELECT + RAND(); #вывод случайного числа от 0 до 1.0
SELECT + LENGTH(x); #показать длину строки аргумента
SELECT + TRIM(x); #удаление пробелов из начала и конца строки
SELECT + LTRIM(x); #удаление пробелов слева
SELECT + RTRIM(x); #удаление пробелов справа
SELECT + LOWER(x); #переключение символов в нижний регистр
SELECT + UPPER(x); #переключение символов в верхний регистр
SELECT + SUBSTR(x, y); #вывод строки X с позиции символа Y
SELECT + SUBSTRING_INDEX(+поле, 'x', 1/-1); #вывод записей из поля до или после разделителя x
SELECT + REPLACE(x, y, z); #вывод строки X в которой Y заменен на Z
SELECT + REVERSE(x); #разворот строки
SELECT + MD5(x); #вывод MD5 хэша аргумента
SELECT + SHA2(x, y); #вывод SHA2 хэша аргумента X разрядностью Y
SELECT + NOW(); #вывод текущей даты и времени
SELECT + UNIX_TIMESTAMP(); #вывод временной метки Unix Timestamp

CREATE VIEW +имя AS +запрос; #создание представления для запросов
SELECT * FROM +имя; #вывод записей по представлению
DROP VIEW +имя; #удаление представления
