
����1. idx�� p.k �� �ο��Ͽ� school�� ����ÿ�.
create table school(
idx char(3) primary key,
s_name nvarchar2(10),
age number(3),
tel varchar2(20)
);

����2. ���ڵ带 �߰��Ͻÿ�.
insert into school(idx,s_name,age,tel) values ('101','�Ѹ�','12','010-5037-6133');
insert into school(idx,s_name,age,tel) values ('102','�ϴ�','15','011-1234-1212');
insert into school(idx,s_name,age,tel) values ('104','������','17','017-5555-0341');
insert into school(idx,s_name,age,tel) values ('105','young won','20','010-5555-6363');
insert into school(idx,s_name,age,tel) values ('107','���ѹα�','22','019-3245-1234');
insert into school(idx,s_name,age,tel) values ('109','�Ƹ���','25','070-1212-5555');
insert into school(idx,s_name,age,tel) values ('200','Choi Young','25','070-1212-5555');

����3. �̸��� �������� �������� �����Ͻÿ�.
select * from school 
order by s_name desc;


����4. ��ȣ��  101, 104, 107 �� �л��� ���ڵ带 ����Ͻÿ�.
select * from school 
where idx in(101,104,107);


����5. 105���� �̸��� �������� �����Ͻÿ�.
update school set s_name = '����' where idx = 105; 
select * from school;

����6. 104���� ���̸� 15��� �����Ͻÿ�.
update school set age = 15 where idx = 104;


����7. �̸��� �Ƹ����� �л��� ��ȭ��ȣ�� �����Ͻÿ�.
update school set tel = '' where s_name = '�Ƹ���';


����8. ��ü �л��� ���̸� 19��� �����Ͻÿ�.
update school set age = 19;
select * from school;

����9. 102�� �л��� �����Ͻÿ�.
delete from school where idx = 102;


����10. ��ü ���ڵ带 �����Ͻÿ�.
delete from school;

--���̺� ���� DDL �ѹ��� �ȉ�
--���ڵ� ���� MDL �ѹ��� ��

1) s_name, tel �� ���� ���̸� ���Ͻÿ�

select s_name, length(s_name), length(tel) 
from school;


2) ��ü�� ���� �ϳ��� �÷��� ��Ÿ���ÿ�
select '��ȣ:' || idx || ',�̸�:' || s_name || ',����:' || age || ',��ȭ��ȣ:' ||tel as "�л�����"
from school;

create view v_school
as
select '��ȣ:' || idx || ',�̸�:' || s_name || ',����:' || age || ',��ȭ��ȣ:' ||tel as "�л�����"
from school;

select * from v_school;
select * from school;

--���ڿ� ��ġã��
create view vv_school
as
select instr(�л�����,',',1) , instr(�л�����,',', 8), instr(�л�����,',', 15)from v_school;

select lower(s_name), upper(s_name), initcap(s_name) from school; 
-- lower �ܾ �ҹ��ڷιٲٴ°�  upper �ܾ �빮�ڷ� �ٲٴ°� initcap �ܾ��� ù��°���ڸ� �빮�ڷ� �ٲٴ°�

drop view v_school;

create view v_school
as
select lower(s_name)as "�ҹ���", upper(s_name) as "�빮��", initcap(s_name) as "ù����" from school;

create view v12_school
as
select lower(s_name), upper(s_name), initcap(s_name) from school; --�������� �÷����� ��������� ��������

select * from v_school;

select replace(tel,'-',' ')from school; -- replace �� ���ڿ��� ���ڿ��� ��ȯ�ϴ� �Լ�

select s_name, 
replace(lower(s_name), 'young' , '��'), 
replace(tel,'-',' ') 
from school; 

select tel,translate(Tel,'0123456789','�����̻�����ĥ�ȱ�') 
from school;   --replace�� ���ڿ��� �ѹ��� �ٲ����� translate �� �ѱ��ھ� �ٲ���

select tel, substr(tel,1,3), substr(tel,5,4), substr(tel,10,4) from school; --substr 1��°���� 3���� ���� ���, 5��°���� 4���� �������

select substr(tel,1,3) || substr(tel,5,4) || substr(tel,10,4) as "��ȭ��ȣ" from school
where tel is not null; 

select * from school;

create table t1
as
select substr(tel,1,3) || substr(tel,5,4) || substr(tel,10,4) as "��ȭ��ȣ" from school
where tel is not null; 

select * from t1;

select substr(tel,1,3) || '-'|| substr(tel,5,4) || '-' || substr(tel,10,4) as "��ȭ��ȣ" from school
where tel is not null; 

