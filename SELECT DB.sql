1. ������ ������� ��������� ��������.
SELECT concern_name AS '�������',
MANUFACTURER.name AS '�������� ��������',
 type AS '��� ��������', 
CONCERN.key_people AS '�������� ������' 
FROM CONCERN LEFT JOIN MANUFACTURER 
ON MANUFACTURER.id_concern=CONCERN.id_concern;

2. ������ ������� ����������� ���������, ���������� � ������������
SELECT MANUFACTURER.name, model_name, body_type, equipment
FROM CAR LEFT JOIN MANUFACTURER ON CAR.id_manufacturer=MANUFACTURER.id_manufacturer
LEFT JOIN MODEL ON CAR.id_model=MODEL.id_model
LEFT JOIN BODY ON MODEL.id_body_type=BODY.id_body_type
LEFT JOIN EQUIPMENT ON MODEL.id_equipment=EQUIPMENT.id_equipment
ORDER BY name;

3. ������ ������� �������, ������������� ����� ���������� �����������
SELECT symbol AS '���������', SUM(price) AS '����������� �������' FROM CAR, CAR_CATEGORY 
WHERE CAR.id_category=CAR_CATEGORY.id_category GROUP BY symbol

4. ������ ������� ���������� ����������.
SELECT M.name AS '�������������', 
model_name AS '������', 
ENGINE.name AS '���������', 
volume AS '����� ���������', 
cylinders AS '���-�� ���������',
engine_type AS '��� ���������',
movement_type AS '��� �������� ���������',
energy_source AS '�������� ������� ���������',
description AS '�������� ��������� �������',
speeds AS '���-�� �������',
gearbox AS '���'
FROM CAR, MANUFACTURER AS M, MODEL, ENGINE, TYPE_OF_ENGINE AS TY, SOURCE_OF_ENERGY AS S, TRANSMISSION AS TR
WHERE CAR.id_manufacturer=M.id_manufacturer
AND CAR.id_model=MODEL.id_model
AND MODEL.id_engine=ENGINE.id_engine
AND ENGINE.id_engine_type=TY.id_engine_type
AND TY.id_energy_source=S.id_energy_source
AND MODEL.id_transmission=TR.id_transmission;

5. ������ ������� ���������� ����� �� ��� ������
SELECT SUM(price) AS '�������' FROM CAR LEFT JOIN BUYER ON CAR.id_buyer=BUYER.id_buyer WHERE paid=TRUE

6. ������ ������� ���������� ����������, ������������� ���������� � ������� ������.
SELECT BUYER.surname AS '�������', 
BUYER.name AS '���', 
BUYER.middle_name AS '��������', 
CAR.price AS '����� � ������',
BUYER.paid AS '��������',
MANUFACTURER.name AS '�������������', 
model_name AS '������'
FROM MANUFACTURER RIGHT JOIN CAR ON MANUFACTURER.id_manufacturer=CAR.id_manufacturer
RIGHT JOIN MODEL ON CAR.id_model=MODEL.id_model
RIGHT JOIN BUYER ON CAR.id_buyer=BUYER.id_buyer;
	
7. ������ ������� ���������� � ������������� ���������.
SELECT date AS '���� ��������', SUPPLIER.name AS '���������', MANUFACTURER.name AS '�������������', model_name AS '������'
FROM SUPPLY LEFT JOIN SUPPLIER ON SUPPLY.id_supplier=SUPPLIER.id_supplier
LEFT JOIN CAR ON SUPPLY.id_supply=CAR.id_supply
LEFT JOIN MANUFACTURER ON CAR.id_manufacturer=MANUFACTURER.id_manufacturer
LEFT JOIN MODEL ON CAR.id_model=MODEL.id_model;

8. ������ ������� �����������, ������� �������������� � �������.
SELECT name, contact, bank_account FROM SUPPLIER
WHERE id_supplier IN (SELECT id_supplier FROM SUPPLY LEFT JOIN CAR ON SUPPLY.id_supply=CAR.id_supply)

9. ������� ����������, ���������� �������� ��������� ����.
SELECT M.name AS '�������������', 
MODEL.model_name AS '������', 
sizes AS '�����/������/������', 
kerb_weight AS '����������� �����',
symbol AS '����������� ��������� ����',
description AS '��������'
FROM CAR, MANUFACTURER AS M, MODEL, CAR_CATEGORY AS C
WHERE CAR.id_manufacturer=M.id_manufacturer AND CAR.id_category=C.id_category
AND CAR.id_model=MODEL.id_model AND SYMBOL='B'

10. ������ ������� ������������ ������ � ��������.
SELECT name AS '�������������', 
type AS '��� ����������� �� ����������� ����', 
year AS '��� ���������', 
founders AS '�������(�)'
FROM MANUFACTURER AS `M`, MANUFACTURER_HISTORY AS `H`
WHERE M.id_manufacturer=H.id_manufacturer;