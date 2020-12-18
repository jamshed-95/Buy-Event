--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.3.148.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 04.07.2020 16:54:28
-- Версия сервера: 5.5.5-10.1.28-MariaDB
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE buy_event;

--
-- Удалить таблицу "purchase"
--
DROP TABLE IF EXISTS purchase;

--
-- Удалить таблицу "event_type"
--
DROP TABLE IF EXISTS event_type;

--
-- Удалить таблицу "event_history"
--
DROP TABLE IF EXISTS event_history;

--
-- Удалить таблицу "clients"
--
DROP TABLE IF EXISTS clients;

--
-- Установка базы данных по умолчанию
--
USE buy_event;

--
-- Создать таблицу "clients"
--
CREATE TABLE clients (
  id int(11) NOT NULL AUTO_INCREMENT,
  telephone varchar(16) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  status int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IDX_clients (telephone, email)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу "event_history"
--
CREATE TABLE event_history (
  id int(11) NOT NULL AUTO_INCREMENT,
  client_id int(11) DEFAULT NULL,
  purchase_id int(11) DEFAULT NULL,
  text text DEFAULT NULL,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  status int(11) DEFAULT 1,
  sms_id text DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IDX_event_history (client_id, purchase_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу "event_type"
--
CREATE TABLE event_type (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  status int(11) DEFAULT 1,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу "purchase"
--
CREATE TABLE purchase (
  id int(11) NOT NULL AUTO_INCREMENT,
  client_id int(11) DEFAULT NULL,
  product varchar(55) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  event_status int(11) DEFAULT 0,
  PRIMARY KEY (id),
  INDEX IDX_purchase_user_id (client_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы clients
--
INSERT INTO clients VALUES
(1, '+992928323320', 'isoboev.jamshed95@gmail.com', NULL);

-- 
-- Вывод данных для таблицы event_history
--
INSERT INTO event_history VALUES
(9, 1, 1, NULL, '2020-07-04 14:03:30', '2020-07-04 14:03:30', 1, NULL),
(10, 1, 1, NULL, '2020-07-04 14:07:01', '2020-07-04 14:07:01', 1, NULL),
(11, 1, 1, NULL, '2020-07-04 14:07:59', '2020-07-04 14:07:59', 1, NULL),
(12, 1, 1, NULL, '2020-07-04 14:10:06', '2020-07-04 14:10:06', 1, NULL),
(13, 1, 1, NULL, '2020-07-04 14:16:10', '2020-07-04 14:16:10', 1, NULL),
(14, 1, 2, NULL, '2020-07-04 14:16:11', '2020-07-04 14:16:11', 1, NULL);

-- 
-- Вывод данных для таблицы event_type
--
INSERT INTO event_type VALUES
(1, 'sms', 1),
(2, 'email', 1);

-- 
-- Вывод данных для таблицы purchase
--
INSERT INTO purchase VALUES
(1, 1, 'computer', 10000.00, 0),
(2, 1, '23423', 100.00, 0);
-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
