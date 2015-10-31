ALTER TABLE studenty
	ADD CONSTRAINT familia_not_znak CHECK (familia NOT LIKE '�%' AND familia NOT LIKE '�%')

ALTER TABLE studenty
	ADD CONSTRAINT imia_not_znak CHECK (imia NOT LIKE '�%' AND imia NOT LIKE '�%')

ALTER TABLE studenty
	ADD CONSTRAINT otch_not_znak CHECK (otch NOT LIKE '�%' AND otch NOT LIKE '�%')

ALTER TABLE studenty
	ADD CONSTRAINT pol_control CHECK(pol='�' OR pol='�')

ALTER TABLE studenty
	ADD CONSTRAINT nomer_control CHECK(nomer>10000)

ALTER TABLE kontr_stud
	ADD CONSTRAINT dogovor_control CHECK(dogovor>0)

ALTER TABLE kontr_stud
	ADD CONSTRAINT velichina_control CHECK(velichina>=0)

ALTER TABLE uch_goda
	ADD CONSTRAINT date_control_nachalo CHECK(nachalo>='19960901')

ALTER TABLE uch_goda
	ADD CONSTRAINT date_control_konec CHECK(konec<'20121221') 
--����� �����

ALTER TABLE special
	ADD CONSTRAINT special_control CHECK(special LIKE '______')

ALTER TABLE vyp_kaf
	ADD CONSTRAINT kurs_control CHECK(kurs>=1 AND kurs<=6)

ALTER TABLE vyp_kaf
	ADD CONSTRAINT forma_control CHECK(forma='�������' OR forma='��������')

ALTER TABLE discip
	ADD CONSTRAINT semestr_control CHECK(semestr<=12)

ALTER TABLE studenty
	ADD CONSTRAINT imia_dlina_control CHECK(familia NOT LIKE '_')

ALTER TABLE studenty
	ADD CONSTRAINT rojden_control CHECK(rojden>'18900101')
/* ����� ������ ��������� ���������������� ������������ � �������
�������� ����������� �����-����� �������, ��������� 122 ����. */