1. Запрос выводит структуру холдинга.
SELECT concern_name AS 'Концерн',
MANUFACTURER.name AS 'Дочерняя компания',
 type AS 'Тип компании', 
CONCERN.key_people AS 'Ключевая фигура' 
FROM CONCERN LEFT JOIN MANUFACTURER 
ON MANUFACTURER.id_concern=CONCERN.id_concern;

2. Запрос выводит особенности интерьера, экстерьера и комплектации
SELECT MANUFACTURER.name, model_name, body_type, equipment
FROM CAR LEFT JOIN MANUFACTURER ON CAR.id_manufacturer=MANUFACTURER.id_manufacturer
LEFT JOIN MODEL ON CAR.id_model=MODEL.id_model
LEFT JOIN BODY ON MODEL.id_body_type=BODY.id_body_type
LEFT JOIN EQUIPMENT ON MODEL.id_equipment=EQUIPMENT.id_equipment
ORDER BY name;

3. Запрос выводит выручку, полученнаемую после реализации автомобилей
SELECT symbol AS 'Категория', SUM(price) AS 'Планируемая выручка' FROM CAR, CAR_CATEGORY 
WHERE CAR.id_category=CAR_CATEGORY.id_category GROUP BY symbol

4. Запрос выводит компоновку автомобиля.
SELECT M.name AS 'Производитель', 
model_name AS 'Модель', 
ENGINE.name AS 'Двигатель', 
volume AS 'Объем двигателя', 
cylinders AS 'Кол-во цилиндров',
engine_type AS 'Тип двигателя',
movement_type AS 'Тип движения двигателя',
energy_source AS 'Источник энергии двигателя',
description AS 'Описание источника энергии',
speeds AS 'Кол-во передач',
gearbox AS 'КПП'
FROM CAR, MANUFACTURER AS M, MODEL, ENGINE, TYPE_OF_ENGINE AS TY, SOURCE_OF_ENERGY AS S, TRANSMISSION AS TR
WHERE CAR.id_manufacturer=M.id_manufacturer
AND CAR.id_model=MODEL.id_model
AND MODEL.id_engine=ENGINE.id_engine
AND ENGINE.id_engine_type=TY.id_engine_type
AND TY.id_energy_source=S.id_energy_source
AND MODEL.id_transmission=TR.id_transmission;

5. Запрос выводит оплаченную сумму за все машины
SELECT SUM(price) AS 'Выручка' FROM CAR LEFT JOIN BUYER ON CAR.id_buyer=BUYER.id_buyer WHERE paid=TRUE

6. Запрос выводит информацию покупателе, приобретенном автомобиле и статусе оплаты.
SELECT BUYER.surname AS 'Фамилия', 
BUYER.name AS 'Имя', 
BUYER.middle_name AS 'Отчество', 
CAR.price AS 'Сумма к уплате',
BUYER.paid AS 'Оплачено',
MANUFACTURER.name AS 'Производитель', 
model_name AS 'Модель'
FROM MANUFACTURER RIGHT JOIN CAR ON MANUFACTURER.id_manufacturer=CAR.id_manufacturer
RIGHT JOIN MODEL ON CAR.id_model=MODEL.id_model
RIGHT JOIN BUYER ON CAR.id_buyer=BUYER.id_buyer;
	
7. Запрос выводит информацию о автомобильных поставках.
SELECT date AS 'Дата поставки', SUPPLIER.name AS 'Поставщик', MANUFACTURER.name AS 'Производитель', model_name AS 'Модель'
FROM SUPPLY LEFT JOIN SUPPLIER ON SUPPLY.id_supplier=SUPPLIER.id_supplier
LEFT JOIN CAR ON SUPPLY.id_supply=CAR.id_supply
LEFT JOIN MANUFACTURER ON CAR.id_manufacturer=MANUFACTURER.id_manufacturer
LEFT JOIN MODEL ON CAR.id_model=MODEL.id_model;

8. Запрос выводит поставщиков, активно сотрудничающих с салоном.
SELECT name, contact, bank_account FROM SUPPLIER
WHERE id_supplier IN (SELECT id_supplier FROM SUPPLY LEFT JOIN CAR ON SUPPLY.id_supply=CAR.id_supply)

9. Выводит автомобили, отвечающие заданной категории прав.
SELECT M.name AS 'Производитель', 
MODEL.model_name AS 'Модель', 
sizes AS 'Длина/Ширина/Высота', 
kerb_weight AS 'Снаряженная масса',
symbol AS 'Необходимая категория прав',
description AS 'Описание'
FROM CAR, MANUFACTURER AS M, MODEL, CAR_CATEGORY AS C
WHERE CAR.id_manufacturer=M.id_manufacturer AND CAR.id_category=C.id_category
AND CAR.id_model=MODEL.id_model AND SYMBOL='B'

10. Запрос выводит исторические данные о компании.
SELECT name AS 'Производитель', 
type AS 'Тип организации на сегодняшний день', 
year AS 'Год основания', 
founders AS 'Основал(и)'
FROM MANUFACTURER AS `M`, MANUFACTURER_HISTORY AS `H`
WHERE M.id_manufacturer=H.id_manufacturer;