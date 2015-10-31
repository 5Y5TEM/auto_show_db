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
	VALUES('B', 'автомобили, за исключением относящихся к категории A, разрешённая максимальная масса которых не превышает 3500 кг и число сидячих мест которых, помимо сиденья водителя, не превышает восьми');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('C', 'автомобили, за исключением относящихся к категории D, разрешённая максимальная масса которых превышает 3500 кг');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('D', ' автомобили, предназначенные для перевозки пассажиров и имеющие более восьми сидячих мест, помимо сиденья водителя');
INSERT INTO `CAR_CATEGORY`(`symbol`, `description`)
	VALUES('E', 'составы транспортных средств с тягачом, относящимся к категориям B, C или D, которыми водитель имеет право управлять, но которые не входят сами в одну из этих категорий или в эти категории');

INSERT INTO `CONCERN`(`concern_name`, `concern_type`, `key_people`, `website`)
	VALUES(' Volkswagen AG', 'Акционерное общество', 'Мартин Винтеркорн', 'www.volkswagenag.com');
INSERT INTO `CONCERN`(`concern_name`, `concern_type`, `key_people`, `website`)
	VALUES('Daimler AG','Акционерное общество', 'Дитер Цетше', 'www.daimler.com');

INSERT INTO `MANUFACTURER`(`name`, `type`, `key_people`, `id_concern`, `website`)
	VALUES('Volkswagen', 'Акционерное общество', 'Мартин Винтеркорн', 1, 'www.volkswagen.ru');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Audi AG', 'Акционерное общество', 'Мартин Винтеркорн', 1, 'www.audi.ru');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Lamborghini', 'Закрытое акционерное общество', 'Стефан Винкельман', 1, 'www.lamborghini.com'); 
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Mercedes-Benz', 'Подразделение Daimler AG', 'Дитер Цетше', 2, 'www.mercedes-benz.de');
INSERT INTO`MANUFACTURER`(`name`,`type`,`key_people`, `id_concern`, `website`)
	VALUES('Porsche AG', 'Акционерное общество', 'Фердинанд Порше', 1,'www.porsche.com');

INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(1, '1938', 'Германская автомобильная ассоциация');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(2, '1909', 'Аугуст Хорьх');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(3, '1963', 'Ферруччо Ламборгини');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(4, '1886', 'Карл Бенц, Готлиб Даймлер, Вильгельм Майбах');
INSERT INTO `MANUFACTURER_HISTORY`(`id_manufacturer`, `year`, `founders`)
	VALUES(5, '1931', 'Фердинанд Порше');

INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('2341 345234', 'ВЫДАН ОТДЕЛЕНИЕМ УФМС РОССИИ МОСКОВСКОЙ ОБЛАСТИ 25.11.1983', 'Московская обл., г. Москва, ул. Радищева, д. 15, кв. 25');
INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('4332 234929', 'ВЫДАН ОТДЕЛЕНИЕМ УФМС РОССИИ ТВЕРСКОЙ ОБЛАСТИ 14.01.1974', 'Тверская обл., г. Тверь, ул. 26 Бакинских Комиссаров, д. 41, кв. 2');
INSERT INTO `PASSPORT`(`passport`,`issued`,`adress`)
	VALUES('8383 283235', 'ВЫДАН ОТДЕЛЕНИЕМ УФМС РОССИИ РОСТОВСКОЙ ОБЛАСТИ 31.01.1991', 'Ростовская обл., г. Ростов, ул. Пролетарская, д. 31, кв. 118');

INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`, `paid` )
	VALUES('Страшил', 'Вратислав', 'Дмитриевич', 1, FALSE);
INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`,  `paid`)
	VALUES('Чернов', 'Дмитрий', 'Эдуардович', 2, TRUE);
INSERT INTO `BUYER`(`surname`, `name`, `middle_name`, `id_passport`, `paid`)
	VALUES('Волоцкий', 'Владимир', 'Николаевич', 3, TRUE);

INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Volkswagen Group Калуга', '78-36-78', '40702643915468254083');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Audi Prod Ингольштадт', '+49 (0)841 886 3100', '40702643915468854976');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Porsche Club Russland', '783-324-38-20', '40702643915468253542');
INSERT INTO `SUPPLIER`(`name`, `contact`, `bank_account`)
	VALUES('Центр-Кама', '+7(8552)444777', '40702643915468258736');
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
	VALUES('Бензин', 'Горючая смесь лёгких углеводородов с температурой кипения от 30 до 200 °C. Плотность около 0,75 г/см?. Теплотворная способность примерно 10 500 ккал/кг (46 МДж/кг, 34,5 МДж/литр).');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('Диз.топливо', 'Состоит из гидроочищенных керосино-газойлевых фракций прямой перегонки и до 1/5 из газойлей каткрекинга и коксования.');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('Газ', 'Смесь сжиженных под давлением лёгких углеводородов с температурой кипения от -50 до 0 °C.');
INSERT INTO `SOURCE_OF_ENERGY`(`energy_source`, `description`)
	VALUES('Гибридный', 'Используется более одного источника энергии, чтобы реализовывать рекуперацию кинетической энергии, повышая топливную эффективность силовой установки.');

INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('Поршневой', 1,'Поступательное');
INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('Поршневой', 2,'Поступательное');
INSERT INTO `TYPE_OF_ENGINE`(`engine_type`,`id_energy_source`,`movement_type`)
	VALUES('Роторно-поршневой', 1, 'Вращательное');

INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('V6 TDI', 3000, 6, 2);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('V8 FSI', 4163, 8, 1);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('M159', 6208, 8, 1);
INSERT INTO `ENGINE`(`name`,`volume`,`cylinders`,`id_engine_type`)
	VALUES('Panamera Turbo', 4806, 8, 1);

INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('Внедорожник', '5', 'Кузов «универсал» c увеличенным дорожным просветом.');
INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('Купе', 2, 'Один или два ряда сидений, структурно отдельный багажник, без подъёмной двери в задней стенке.');
INSERT INTO `BODY`(`body_type`,`doors_count`,`features`)
	VALUES('Хетчбэк', '3; 5', 'Один или два ряда сидений, дверь в задней стенке, укороченный задний свес.');

INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(8, 'Автомат');
INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(6, 'Механика');
INSERT INTO `TRANSMISSION`(`speeds`,`gearbox`)
	VALUES(7, 'Автомат');

INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('3-точечные автоматические ремни безопасности спереди: с преднатяжителями, с регулировкой по высоте, 3-точечные автоматические ремни безопасности сзади, Фронтальные подушки безопасности для водителя и переднего пассажира, с возможностью деактивации подушки безопасности для переднего пассажира, Подушки безопасности для защиты головы спереди и сзади, включая боковые подушки спереди, «Ассистент подъема/ спуска»: автоматическое удержание машины на месте при остановке на уклоне и автоматическое подтормаживание при движении вниз,Электронная система курсовой устойчивости (ESP), включая: антиблокировочную систему ABS plus, противобуксовочную систему ASR, электронную блокировку дифференциала EDS, Система ISOFIX (готовые установочные места для крепления двух детских кресел на заднем сиденье, Противотуманные фары, статичный поворотный свет, Электронный иммобилайзер');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('Фронтальные подушки безопасности для водителя и переднего пассажира, с возможностью деактивации подушки безопасности для переднего пассажира, Подушки безопасности для защиты головы спереди и сзади, включая боковые подушки спереди, «Ассистент подъема/ спуска»: автоматическое удержание машины на месте при остановке на уклоне и автоматическое подтормаживание при движении вниз,Электронная система курсовой устойчивости (ESP), включая: антиблокировочную систему ABS plus, противобуксовочную систему ASR, электронную блокировку дифференциала EDS, Система ISOFIX (готовые установочные места для крепления двух детских кресел на заднем сиденье, Противотуманные фары, статичный поворотный свет, Электронный иммобилайзер');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('Мультируль с лепестками, Цветной дисплей,    3-точечные автоматические ремни безопасности спереди: с преднатяжителями, с регулировкой по высоте, 3-точечные автоматические ремни безопасности сзади, Фронтальные подушки безопасности для водителя и переднего пассажира, с возможностью деактивации подушки безопасности для переднего пассажира, Подушки безопасности для защиты головы спереди и сзади, включая боковые подушки спереди, «Ассистент подъема/ спуска»: автоматическое удержание машины на месте при остановке на уклоне и автоматическое подтормаживание при движении вниз,Электронная система курсовой устойчивости (ESP), включая: антиблокировочную систему ABS plus, противобуксовочную систему ASR, электронную блокировку дифференциала EDS, Система ISOFIX (готовые установочные места для крепления двух детских кресел на заднем сиденье, Противотуманные фары, статичный поворотный свет, Электронный иммобилайзер');
INSERT INTO `EQUIPMENT`(`equipment`)
	VALUES('Кожаный руль, 3-точечные автоматические ремни безопасности спереди: с преднатяжителями, с регулировкой по высоте, 3-точечные автоматические ремни безопасности сзади, Фронтальные подушки безопасности для водителя и переднего пассажира, с возможностью деактивации подушки безопасности для переднего пассажира, Подушки безопасности для защиты головы спереди и сзади, включая боковые подушки спереди, «Ассистент подъема/ спуска»: автоматическое удержание машины на месте при остановке на уклоне и автоматическое подтормаживание при движении вниз,Электронная система курсовой устойчивости (ESP), включая: антиблокировочную систему ABS plus, противобуксовочную систему ASR, электронную блокировку дифференциала EDS, Система ISOFIX (готовые установочные места для крепления двух детских кресел на заднем сиденье, Противотуманные фары, статичный поворотный свет, Электронный иммобилайзер');

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
