Create table test (
idNum NUMBER(5)
);

insert into test(idNum)values(10001);
insert into test(idNum)values(10002);

select * from test;

delete from test 
where idnum='10001'; --�̶�� ���� ã�Ƽ� ���켼��
/*
�ּ�ó��
*/
--�ּ�ó��


desc test;

Create table test1 (
idNum NUMBER(5),
 name varchar(9) --��������
);

insert into test1 (idnum, name) values(10001,'������');
select * from test1; --*�� ��ü�� ��Ī��
select idnum, name from test1;
select idnum from test1;

Create table test2 (
idNum NUMBER(5) not null PRIMARY KEY --�ߺ����� ����
);

/*null 0�� ������ �ƴ� �𸣴� ��*/

insert into test2 (idnum) values('10001');
insert into test2 (idnum) values('10001');
insert into test2 (idnum) values('10002');
select * from test2;
