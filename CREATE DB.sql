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
	`id_category` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`symbol` ENUM('B','C','D','E') NOT NULL COMMENT '��������� ����������',
	`description` TEXT NOT NULL COMMENT '��������'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '��������� ����������';

CREATE TABLE `CONCERN`
(
	`id_concern` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`concern_name` VARCHAR(20) NOT NULL COMMENT '�������� ��������',
	`concern_type` VARCHAR(20) NOT NULL COMMENT '��� ��������',
	`key_people` VARCHAR(20) NOT NULL COMMENT '�������� ������',
	`website` VARCHAR(20) COMMENT '���� ��������'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '����������� ��������';

CREATE TABLE `MANUFACTURER`
(
	`id_manufacturer` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`name` VARCHAR(20) NOT NULL COMMENT '�������� �������������',
	`type` VARCHAR(20) NOT NULL COMMENT '��� �����������',
	`key_people` VARCHAR(20) NOT NULL COMMENT '�������� ������',
	`id_concern` INT UNSIGNED NOT NULL COMMENT '����������� ��������',
	`website` VARCHAR(20) COMMENT '�������������',
	FOREIGN KEY (`id_concern`)
		REFERENCES `CONCERN`(`id_concern`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '������������� ����������';

CREATE TABLE `MANUFACTURER_HISTORY`
(
	`id_manufacturer` INT UNSIGNED NOT NULL PRIMARY KEY COMMENT '������������� ����������',
	`year` INT UNSIGNED NOT NULL COMMENT '��� ���������', 
	`founders` TINYTEXT NOT NULL COMMENT '����������',
	FOREIGN KEY(`id_manufacturer`)
		REFERENCES `MANUFACTURER`(`id_manufacturer`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '������� �������������';

CREATE TABLE `PASSPORT`
(
	`id_passport` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '�������� ����',
	`passport` VARCHAR(20) NOT NULL COMMENT '�����, ����� ��������',
	`issued` TEXT NOT NULL COMMENT '������� �����',
	`adress` TEXT NOT NULL COMMENT '�����'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '������� ����������';

CREATE TABLE `BUYER`
(
	`id_buyer` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`surname` VARCHAR(20) NOT NULL COMMENT '�������',
	`name` VARCHAR(20) NOT NULL COMMENT '���',
	`middle_name` VARCHAR(20) NOT NULL COMMENT '��������',
	`id_passport` INT UNSIGNED NOT NULL COMMENT '�������',
	`paid` BOOL COMMENT '��������',
	FOREIGN KEY(`id_passport`)
		REFERENCES `PASSPORT`(`id_passport`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '����������';

CREATE TABLE `SUPPLIER`
(
	`id_supplier` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`name` TINYTEXT NOT NULL COMMENT '�������� ����������',
	`contact` VARCHAR(20) NOT NULL COMMENT '�������',
	`bank_account` VARCHAR(20) NOT NULL COMMENT '����� �����'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '���������';

CREATE TABLE `SUPPLY`
(
	`id_supply` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'��������� ����',
	`date` DATE NOT NULL COMMENT'���� ��������',
	`id_supplier` INT UNSIGNED NOT NULL COMMENT'���������',
	FOREIGN KEY(`id_supplier`)
		REFERENCES `SUPPLIER`(`id_supplier`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '��������';

CREATE TABLE `SOURCE_OF_ENERGY`
(
	`id_energy_source` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`energy_source` VARCHAR(20) NOT NULL COMMENT '�������� �������',
	`description` TEXT COMMENT '��������'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '�������� �������';

CREATE TABLE `TYPE_OF_ENGINE`
(
	`id_engine_type` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`engine_type` VARCHAR(20) NOT NULL COMMENT '��� ���������',
	`id_energy_source` INT UNSIGNED NOT NULL COMMENT '�������� �������',
	`movement_type` VARCHAR(20) NOT NULL COMMENT '��� ��������',
	FOREIGN KEY(`id_energy_source`)
		REFERENCES `SOURCE_OF_ENERGY`(`id_energy_source`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '��� ���������';

CREATE TABLE `ENGINE`
(
	`id_engine` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`name` VARCHAR(20) COMMENT '�������� ���������',
	`volume` INT UNSIGNED NOT NULL COMMENT '����� ���������',
	`cylinders` TINYINT UNSIGNED NOT NULL COMMENT'���������� ���������',
	`id_engine_type` INT UNSIGNED NOT NULL COMMENT'��� ���������',
	FOREIGN KEY(`id_engine_type`)
		REFERENCES `TYPE_OF_ENGINE`(`id_engine_type`)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '���������';

CREATE TABLE `BODY`
(
	`id_body_type` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'��������� ����',
	`body_type` VARCHAR(20) NOT NULL COMMENT '��� ������',
	`doors_count` VARCHAR(20) NOT NULL COMMENT'���������� ������',
	`features` TINYTEXT COMMENT'�����������'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '��� ������';

CREATE TABLE `TRANSMISSION`
(
	`id_transmission` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`speeds` TINYINT NOT NULL COMMENT '���������� ���������',
	`gearbox` ENUM('�������','��������')
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '�����������';

CREATE TABLE `EQUIPMENT`
(
	`id_equipment` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'��������� ����',
	`equipment` TEXT NOT NULL COMMENT '������������'
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
COMMENT = '������������';

CREATE TABLE `MODEL`
(
	`id_model` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`model_name` VARCHAR(20) NOT NULL COMMENT '������������ ������',
	`id_body_type` INT UNSIGNED NOT NULL COMMENT '��� ������',
	`sizes` VARCHAR(30) NOT NULL COMMENT '�������',
	`id_engine` INT UNSIGNED NOT NULL COMMENT '���������',
	`id_transmission` INT UNSIGNED NOT NULL COMMENT '�����������',
	`kerb_weight` INT UNSIGNED NOT NULL COMMENT '����������� �����',
	`id_equipment` INT UNSIGNED NOT NULL COMMENT '������������',
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
COMMENT = '������';

CREATE TABLE `CAR`
(
	`id_car` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��������� ����',
	`id_manufacturer` INT UNSIGNED NOT NULL COMMENT '',
	`id_model` INT UNSIGNED NOT NULL COMMENT '',
	`id_category` INT UNSIGNED NOT NULL COMMENT '',
	`color` VARCHAR(20) NOT NULL COMMENT '',
	`price` BIGINT UNSIGNED NOT NULL COMMENT '����',
	`id_buyer` INT UNSIGNED NOT NULL COMMENT '�����������',
	`id_supply` INT UNSIGNED NOT NULL COMMENT '����������� �����',
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
COMMENT = '����������';





