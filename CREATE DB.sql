CREATE DATABASE IF NOT EXISTS `stud161040`;
USE `stud161040`;

DROP TABLE IF EXISTS `CAR`;
DROP TABLE IF EXISTS `MODEL`;
DROP TABLE IF EXISTS `EQUIPMENT`;
DROP TABLE IF EXISTS `TRANSMISSION`;
DROP TABLE IF EXISTS `BODY`;
DROP TABLE IF EXISTS `ENGINE`;
DROP TABLE IF EXISTS `TYPE_OF_ENGINE`;
DROP TABLE IF EXISTS `SOURCE_OF_ENERGY`;
DROP TABLE IF EXISTS `SUPPLY`;
DROP TABLE IF EXISTS `SUPPLIER`;
DROP TABLE IF EXISTS `BUYER`;
DROP TABLE IF EXISTS `PASSPORT`;
DROP TABLE IF EXISTS `MANUFACTURER_HISTORY`;
DROP TABLE IF EXISTS `MANUFACTURER`;
DROP TABLE IF EXISTS `CONCERN`;
DROP TABLE IF EXISTS `CAR_CATEGORY`;

CREATE TABLE `CAR_CATEGORY`
(
	`id_category` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`symbol` ENUM('B','C','D','E') NOT NULL COMMENT 'Категория автомобиля',
	`description` TEXT NOT NULL COMMENT 'Описание'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Категория автомобиля';

CREATE TABLE `CONCERN`
(
	`id_concern` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`concern_name` VARCHAR(20) NOT NULL COMMENT 'Название концерна',
	`concern_type` VARCHAR(20) NOT NULL COMMENT 'Тип компании',
	`key_people` VARCHAR(20) NOT NULL COMMENT 'Ключевая фигура',
	`website` VARCHAR(20) COMMENT 'Сайт компании'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Материнская компания';

CREATE TABLE `MANUFACTURER`
(
	`id_manufacturer` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`name` VARCHAR(20) NOT NULL COMMENT 'Название производителя',
	`type` VARCHAR(20) NOT NULL COMMENT 'Тип организации',
	`key_people` VARCHAR(20) NOT NULL COMMENT 'Ключевая фигура',
	`id_concern` INT UNSIGNED NOT NULL COMMENT 'Материнская компания',
	`website` VARCHAR(20) COMMENT 'Производитель',
	FOREIGN KEY (`id_concern`)
		REFERENCES `CONCERN`(`id_concern`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Производитель автомобиля';

CREATE TABLE `MANUFACTURER_HISTORY`
(
	`id_manufacturer` INT UNSIGNED NOT NULL PRIMARY KEY COMMENT 'Производитель автомобиля',
	`year` INT UNSIGNED NOT NULL COMMENT 'Год основания', 
	`founders` TINYTEXT NOT NULL COMMENT 'Основатели',
	FOREIGN KEY(`id_manufacturer`)
		REFERENCES `MANUFACTURER`(`id_manufacturer`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'История производителя';

CREATE TABLE `PASSPORT`
(
	`id_passport` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первиный ключ',
	`passport` VARCHAR(20) NOT NULL COMMENT 'Серия, номер паспорта',
	`issued` TEXT NOT NULL COMMENT 'Паспорт выдан',
	`adress` TEXT NOT NULL COMMENT 'Адрес'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Паспорт покупателя';

CREATE TABLE `BUYER`
(
	`id_buyer` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`surname` VARCHAR(20) NOT NULL COMMENT 'Фамилия',
	`name` VARCHAR(20) NOT NULL COMMENT 'Имя',
	`middle_name` VARCHAR(20) NOT NULL COMMENT 'Отчество',
	`id_passport` INT UNSIGNED NOT NULL COMMENT 'Паспорт',
	`paid` BOOL COMMENT 'Оплачено',
	FOREIGN KEY(`id_passport`)
		REFERENCES `PASSPORT`(`id_passport`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Покупатель';

CREATE TABLE `SUPPLIER`
(
	`id_supplier` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`name` TINYTEXT NOT NULL COMMENT 'Название поставщика',
	`contact` VARCHAR(20) NOT NULL COMMENT 'Контакт',
	`bank_account` VARCHAR(20) NOT NULL COMMENT 'Номер счета'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Поставщик';

CREATE TABLE `SUPPLY`
(
	`id_supply` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'Первичный ключ',
	`date` DATE NOT NULL COMMENT'Дата поставки',
	`id_supplier` INT UNSIGNED NOT NULL COMMENT'Поставщик',
	FOREIGN KEY(`id_supplier`)
		REFERENCES `SUPPLIER`(`id_supplier`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Поставка';

CREATE TABLE `SOURCE_OF_ENERGY`
(
	`id_energy_source` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`energy_source` VARCHAR(20) NOT NULL COMMENT 'Источник энергии',
	`description` TEXT COMMENT 'Описание'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Источник энергии';

CREATE TABLE `TYPE_OF_ENGINE`
(
	`id_engine_type` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`engine_type` VARCHAR(20) NOT NULL COMMENT 'Тип двигателя',
	`id_energy_source` INT UNSIGNED NOT NULL COMMENT 'Источник энергии',
	`movement_type` VARCHAR(20) NOT NULL COMMENT 'Тип движения',
	FOREIGN KEY(`id_energy_source`)
		REFERENCES `SOURCE_OF_ENERGY`(`id_energy_source`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Тип двигателя';

CREATE TABLE `ENGINE`
(
	`id_engine` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`name` VARCHAR(20) COMMENT 'Название двигателя',
	`volume` INT UNSIGNED NOT NULL COMMENT 'Объем двигателя',
	`cylinders` TINYINT UNSIGNED NOT NULL COMMENT'Количество цилиндров',
	`id_engine_type` INT UNSIGNED NOT NULL COMMENT'Тип двигателя',
	FOREIGN KEY(`id_engine_type`)
		REFERENCES `TYPE_OF_ENGINE`(`id_engine_type`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Двигатель';

CREATE TABLE `BODY`
(
	`id_body_type` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'Первичный ключ',
	`body_type` VARCHAR(20) NOT NULL COMMENT 'Тип кузова',
	`doors_count` VARCHAR(20) NOT NULL COMMENT'Количество дверей',
	`features` TINYTEXT COMMENT'Особенности'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Тип кузова';

CREATE TABLE `TRANSMISSION`
(
	`id_transmission` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`speeds` TINYINT NOT NULL COMMENT 'Количество скоростей',
	`gearbox` ENUM('Автомат','Механика')
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Трансмиссия';

CREATE TABLE `EQUIPMENT`
(
	`id_equipment` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'Первичный ключ',
	`equipment` TEXT NOT NULL COMMENT 'Комплектация'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Комплектация';

CREATE TABLE `MODEL`
(
	`id_model` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`model_name` VARCHAR(20) NOT NULL COMMENT 'Наименование модели',
	`id_body_type` INT UNSIGNED NOT NULL COMMENT 'Тип кузова',
	`sizes` VARCHAR(30) NOT NULL COMMENT 'Размеры',
	`id_engine` INT UNSIGNED NOT NULL COMMENT 'Двигатель',
	`id_transmission` INT UNSIGNED NOT NULL COMMENT 'Трансмиссия',
	`kerb_weight` INT UNSIGNED NOT NULL COMMENT 'Снаряженная масса',
	`id_equipment` INT UNSIGNED NOT NULL COMMENT 'Комплектация',
	FOREIGN KEY(`id_body_type`)
		REFERENCES `BODY`(`id_body_type`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_engine`)
		REFERENCES `ENGINE`(`id_engine`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_transmission`)
		REFERENCES `TRANSMISSION`(`id_transmission`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_equipment`)
		REFERENCES `EQUIPMENT`(`id_equipment`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Модель';

CREATE TABLE `CAR`
(
	`id_car` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Первичный ключ',
	`id_manufacturer` INT UNSIGNED NOT NULL COMMENT '',
	`id_model` INT UNSIGNED NOT NULL COMMENT '',
	`id_category` INT UNSIGNED NOT NULL COMMENT '',
	`color` VARCHAR(20) NOT NULL COMMENT '',
	`price` BIGINT UNSIGNED NOT NULL COMMENT 'Цена',
	`id_buyer` INT UNSIGNED NOT NULL COMMENT 'Трансмиссия',
	`id_supply` INT UNSIGNED NOT NULL COMMENT 'Снаряженная масса',
	FOREIGN KEY(`id_manufacturer`)
		REFERENCES `MANUFACTURER`(`id_manufacturer`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_model`)
		REFERENCES `MODEL`(`id_model`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_category`)
		REFERENCES `CAR_CATEGORY`(`id_category`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_buyer`)
		REFERENCES `BUYER`(`id_buyer`)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(`id_supply`)
		REFERENCES `SUPPLY`(`id_supply`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = 'Автомобиль';





