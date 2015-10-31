UPDATE `MODEL`
SET model_name='R8 Coupe'
WHERE model_name='R8' AND id_body_type
IN (SELECT id_body_type FROM BODY WHERE body_type='Купе');

UPDATE `CAR`
SET id_buyer=1 WHERE id_buyer
IN (SELECT id_buyer FROM `BUYER` WHERE id_passport
IN (SELECT id_passport FROM `PASSPORT` WHERE passport='8383 283235'));

UPDATE `PASSPORT`
SET passport='8477 253847',
issued='ВЫДАН ОТДЕЛЕНИЕМ УФМС РОССИИ НИЖЕГОРОДСКОЙ ОБЛАСТИ 15.02.1974',
adress='Нижегородская обл., г. Нижний Новгород, ул. Заслонова, д. 35, кв. 151'
WHERE id_passport
IN( SELECT id_passport FROM `BUYER` WHERE id_buyer
IN( SELECT id_buyer FROM `CAR` WHERE id_car=1));

UPDATE `BUYER` 
SET surname='Жеглов', name='Глеб', middle_name='Константинович', paid=TRUE
WHERE id_passport=1;

UPDATE `CAR`
SET price=
CASE `id_model`
	WHEN `id_model`
	IN(SELECT id_model FROM `MODEL`  WHERE id_engine
		IN(SELECT id_engine FROM `ENGINE` WHERE name='V6 TDI'))
	THEN 2000000
	WHEN `id_model`
	IN(SELECT id_model FROM `MODEL`  WHERE id_engine
		IN(SELECT id_engine FROM `ENGINE` WHERE name='V8 FSI'))
	THEN 5730000
	WHEN `id_model`
	IN(SELECT id_model FROM `MODEL`  WHERE id_engine
		IN(SELECT id_engine FROM `ENGINE` WHERE name='M159'))
	THEN 12250000
	ELSE CAR.price
END;