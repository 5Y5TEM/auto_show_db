SET CHARSET utf8;

CREATE DATABASE IF NOT EXISTS `stud161040`;
USE `stud161040`;

TRUNCATE TABLE `CAR`;
TRUNCATE TABLE `MODEL`;
TRUNCATE TABLE `EQUIPMENT`;
TRUNCATE TABLE `TRANSMISSION`;
TRUNCATE TABLE `BODY`;
TRUNCATE TABLE `ENGINE`;
TRUNCATE TABLE `TYPE_OF_ENGINE`;
TRUNCATE TABLE `SOURCE_OF_ENERGY`;
TRUNCATE TABLE `SUPPLY`;
TRUNCATE TABLE `SUPPLIER`;
TRUNCATE TABLE `BUYER`;
TRUNCATE TABLE `PASSPORT`;
TRUNCATE TABLE `MANUFACTURER_HISTORY`;
TRUNCATE TABLE `MANUFACTURER`;
TRUNCATE TABLE `CONCERN`;
TRUNCATE TABLE `CAR_CATEGORY`;

INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('B', '����������, �� ����������� ����������� � ��������� A, ����������� ������������ ����� ������� �� ��������� 3500 �� � ����� ������� ���� �������, ������ ������� ��������, �� ��������� ������');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('C', '����������, �� ����������� ����������� � ��������� D, ����������� ������������ ����� ������� ��������� 3500 ��');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('D', ' ����������, ��������������� ��� ��������� ���������� � ������� ����� ������ ������� ����, ������ ������� ��������');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('E', '������� ������������ ������� � �������, ����������� � ���������� B, C ��� D, �������� �������� ����� ����� ���������, �� ������� �� ������ ���� � ���� �� ���� ��������� ��� � ��� ���������');

INSERT INTO `CONCERN`(`concern_name`, `concern_type`, `key_people`, `website`)
	VALUES(' Volkswagen AG', '����������� ��������', '������ ����������', 'www.volkswagenag.com');
INSERT INTO `CONCERN`(`concern_name`, `concern_type`, `key_people`, `website`)
	VALUES('Daimler AG','����������� ��������', '����� �����', 'www.daimler.com');

INSERT INTO `MANUFACTURER`(`name`, `type`, `key_people`, `id_concern`, `website`)
	VALUES('Volkswagen', '����������� ��������', '������ ����������', 1, 'www.volkswagen.ru');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Audi AG', '����������� ��������', '������ ����������', 1, 'www.audi.ru');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Lamborghini', '�������� ����������� ��������', '������ ����������', 1, 'www.lamborghini.com'); 
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Mercedes-Benz', '������������� Daimler AG', '����� �����', 2, 'www.mercedes-benz.de');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Porsche AG', '����������� ��������', '��������� �����', 1,'www.porsche.com');

INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(1, '1938', '���������� ������������� ����������');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(2, '1909', '������ �����');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(3, '1963', '�������� ����������');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(4, '1886', '���� ����, ������ �������, ��������� ������');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(5, '1931', '��������� �����');

INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('2341 345234', '����� ���������� ���� ������ ���������� ������� 25.11.1983', '���������� ���., �. ������, ��. ��������, �. 15, ��. 25');
INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('4332 234929', '����� ���������� ���� ������ �������� ������� 14.01.1974', '�������� ���., �. �����, ��. 26 ��������� ����������, �. 41, ��. 2');
INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('8383 283235', '����� ���������� ���� ������ ���������� ������� 31.01.1991', '���������� ���., �. ������, ��. ������������, �. 31, ��. 118');

INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`, `paid` )
	VALUES('�������', '���������', '����������', 1, FALSE);
INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`,  `paid`)
	VALUES('������', '�������', '����������', 2, TRUE);
INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`, `paid`)
	VALUES('��������', '��������', '����������', 3, TRUE);

INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Volkswagen Group ������', '78-36-78', '40702643915468254083');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Audi Prod �����������', '+49 (0)841 886 3100', '40702643915468854976');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Porsche Club Russland', '783-324-38-20', '40702643915468253542');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('�����-����', '+7(8552)444777', '40702643915468258736');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('NERVESA AUTORECUPERO', '+7(4345)5354867','40702643915468254756');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('NUOVA CAPITAL AUTO', '734-345-34-21', '40702643915468254756');

INSERT INTO `SUPPLY`(`date`,`id_supplier`)
	VALUES('2012-12-31', 1);
INSERT INTO `SUPPLY`(`date`,`id_supplier`)
	VALUES('2012-11-28', 2);
INSERT INTO `SUPPLY`(`date`,`id_supplier`)
	VALUES('2013-01-10', 3);
INSERT INTO `SUPPLY`(`date`,`id_supplier`)
	VALUES('2013-01-10', 4);

INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('������', '������� ����� ����� ������������� � ������������ ������� �� 30 �� 200 �C. ��������� ����� 0,75 �/��?. ������������ ����������� �������� 10 500 ����/�� (46 ���/��, 34,5 ���/����).');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('���.�������', '������� �� �������������� ��������-���������� ������� ������ ��������� � �� 1/5 �� �������� ����������� � ����������.');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('���', '����� ��������� ��� ��������� ����� ������������� � ������������ ������� �� -50 �� 0 �C.');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('���������', '������������ ����� ������ ��������� �������, ����� ������������� ����������� ������������ �������, ������� ��������� ������������� ������� ���������.');

INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('���������', 1,'��������������');
INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('���������', 2,'��������������');
INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('�������-���������', 1, '������������');

INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('V6 TDI', 3000, 6, 2);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('V8 FSI', 4163, 8, 1);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('M159', 6208, 8, 1);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('Panamera Turbo', 4806, 8, 1);

INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('�����������', '5', '����� ���������� c ����������� �������� ���������.');
INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('����', 2, '���� ��� ��� ���� �������, ���������� ��������� ��������, ��� ��������� ����� � ������ ������.');
INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('�������', '3; 5', '���� ��� ��� ���� �������, ����� � ������ ������, ����������� ������ ����.');

INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(8, '�������');
INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(6, '��������');
INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(7, '�������');

INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('3-�������� �������������� ����� ������������ �������: � ����������������, � ������������ �� ������, 3-�������� �������������� ����� ������������ �����, ����������� ������� ������������ ��� �������� � ��������� ���������, � ������������ ����������� ������� ������������ ��� ��������� ���������, ������� ������������ ��� ������ ������ ������� � �����, ������� ������� ������� �������, ���������� �������/ ������: �������������� ��������� ������ �� ����� ��� ��������� �� ������ � �������������� ��������������� ��� �������� ����,����������� ������� �������� ������������ (ESP), �������: ����������������� ������� ABS plus, ������������������ ������� ASR, ����������� ���������� ������������� EDS, ������� ISOFIX (������� ������������ ����� ��� ��������� ���� ������� ������ �� ������ �������, ��������������� ����, ��������� ���������� ����, ����������� ������������');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('����������� ������� ������������ ��� �������� � ��������� ���������, � ������������ ����������� ������� ������������ ��� ��������� ���������, ������� ������������ ��� ������ ������ ������� � �����, ������� ������� ������� �������, ���������� �������/ ������: �������������� ��������� ������ �� ����� ��� ��������� �� ������ � �������������� ��������������� ��� �������� ����,����������� ������� �������� ������������ (ESP), �������: ����������������� ������� ABS plus, ������������������ ������� ASR, ����������� ���������� ������������� EDS, ������� ISOFIX (������� ������������ ����� ��� ��������� ���� ������� ������ �� ������ �������, ��������������� ����, ��������� ���������� ����, ����������� ������������');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('���������� � ����������, ������� �������,    3-�������� �������������� ����� ������������ �������: � ����������������, � ������������ �� ������, 3-�������� �������������� ����� ������������ �����, ����������� ������� ������������ ��� �������� � ��������� ���������, � ������������ ����������� ������� ������������ ��� ��������� ���������, ������� ������������ ��� ������ ������ ������� � �����, ������� ������� ������� �������, ���������� �������/ ������: �������������� ��������� ������ �� ����� ��� ��������� �� ������ � �������������� ��������������� ��� �������� ����,����������� ������� �������� ������������ (ESP), �������: ����������������� ������� ABS plus, ������������������ ������� ASR, ����������� ���������� ������������� EDS, ������� ISOFIX (������� ������������ ����� ��� ��������� ���� ������� ������ �� ������ �������, ��������������� ����, ��������� ���������� ����, ����������� ������������');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('������� ����, 3-�������� �������������� ����� ������������ �������: � ����������������, � ������������ �� ������, 3-�������� �������������� ����� ������������ �����, ����������� ������� ������������ ��� �������� � ��������� ���������, � ������������ ����������� ������� ������������ ��� ��������� ���������, ������� ������������ ��� ������ ������ ������� � �����, ������� ������� ������� �������, ���������� �������/ ������: �������������� ��������� ������ �� ����� ��� ��������� �� ������ � �������������� ��������������� ��� �������� ����,����������� ������� �������� ������������ (ESP), �������: ����������������� ������� ABS plus, ������������������ ������� ASR, ����������� ���������� ������������� EDS, ������� ISOFIX (������� ������������ ����� ��� ��������� ���� ������� ������ �� ������ �������, ��������������� ����, ��������� ���������� ����, ����������� ������������');

INSERT INTO `MODEL`(`model_name`,`id_body_type`,`sizes`, `id_engine`,`id_transmission`,`kerb_weight`,`id_equipment`)
	VALUES('Touareg', 1, '4407/ 1791/ 1443', 1, 1, 1930, 1);
INSERT INTO `MODEL`(`model_name`,`id_body_type`,`sizes`, `id_engine`,`id_transmission`,`kerb_weight`,`id_equipment`)
	VALUES('R8', 2, '4430/ 1900/ 1250', 2, 2, 1560, 2);
INSERT INTO `MODEL`(`model_name`,`id_body_type`,`sizes`, `id_engine`,`id_transmission`,`kerb_weight`,`id_equipment`)
	VALUES('SLS AMG', 2, '4638/ 1939/ 1262', 3, 3, 1620, 3);
INSERT INTO `MODEL`(`model_name`,`id_body_type`,`sizes`, `id_engine`,`id_transmission`,`kerb_weight`,`id_equipment`)
	VALUES('Panamera Turbo', 3, '4970/ 1931/ 1418', 4, 3, 1800, 4);

INSERT INTO `CAR`(`id_manufacturer`,`id_model`,`id_category`,`color`,`price`,`id_buyer`,`id_supply`)
	VALUES(1, 1, 1, 'Deep Black', 2325000, 1, 1);
INSERT INTO `CAR`(`id_manufacturer`,`id_model`,`id_category`,`color`,`price`,`id_buyer`,`id_supply`)
	VALUES(2, 2, 1, 'Ibis White', 5670000, 1, 2);
INSERT INTO `CAR`(`id_manufacturer`,`id_model`,`id_category`,`color`,`price`,`id_buyer`,`id_supply`)
	VALUES(4, 3, 1, 'Alubeam silver', 12000000, 2, 4);
INSERT INTO `CAR`(`id_manufacturer`,`id_model`,`id_category`,`color`,`price`,`id_buyer`,`id_supply`)
	VALUES(5, 4, 1, 'Basalt Black Metallic', 10038000,3, 3);
