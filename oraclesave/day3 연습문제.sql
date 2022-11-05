create table student2(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
)

insert into student2(sno,sname,year,dept) values('100','������','4','��ǻ��');
insert into student2(sno,sname,year,dept) values('200','������','3','����');
insert into student2(sno,sname,year,dept) values('300','������','1','��ǻ��');
insert into student2(sno,sname,year,dept) values('400','�ۺ�ȣ','4','��ǻ��');
insert into student2(sno,sname,year,dept) values('500','����ȭ','2','���');


1) ���̺� student2 �� ��� ���ڵ带 ����Ͻÿ�.
select sno,sname,year,dept from student2;
select * from student2;

2) student2���̺��� sno �� sname �� ��Ÿ���ÿ�.
select sno, sname from student2;

3) sno �� 100 �� �л��� ����Ͻÿ�.
select * from student2 where sno = 100;

4) sno�� 300�� �л��� sno �� year �� ����Ͻÿ�.
select sno,year from student2 where sno=300;

5) sno�� 300 �Ǵ� 400�� �л��� ���ڵ带 ����Ͻÿ�.
select * from student2 where sno =300 or sno=400;
select * from student2 where sno in('300' , '400');

6) dept�� '��ǻ��' �̰� year �� '4' �г��� �л��� ����Ͻÿ�.
select * from student2 where dept ='��ǻ��' and year='4';

7) sno �� 300 �� �ƴ� �л��� ����Ͻÿ�.
select * from student2 where sno != 300;

8) 700, �ϴ� , 4, ���� �� �߰� �Ͻÿ�.
insert into student2(sno,sname,year,dept) values('700', '�ϴ�', '4', '����');

9) 800, �Ѹ� �� �߰��Ͻÿ�.
insert into student2(sno,sname) values('800', '�Ѹ�');

10) ���� , 900, 3 �� �߰��Ͻÿ�.
insert into student2(sno,sname,year) values('900', '����', '3');

11) �а��� ���� �Ǵ� 4�г� �� �л��� �����Ͻÿ�.
delete from student2 where dept = '����' or year = '4';

12) ��ǻ�Ͱ� �л��� �л� ���� ���Ͻÿ�.
select count(dept) from student2 where dept = '��ǻ��';

13) sno�� sname�� ��Ÿ���ÿ�.
��; �й� �� �̸��� �ʵ� ���� �й�, �̸����� ���ϼ� �ֵ��� �Ͻÿ�.
select sno as "�й�", sname as "�̸�" from student2;

14) �г��� 3�г��̰� �а��� ��ǻ���� �л��� �̸��� �г��� ��Ÿ���ÿ�.
select sname as "�̸�", year as "�г�" from student2 where year=3 and dept='��ǻ��';

15) �г��� 2�г��̰� �̸��� "��" �̶� ���ڸ� �����ϰ� �ִ� �л��� �̸��� �г��� ��Ÿ���ÿ�
select sname as "�̸�", year as "�г�" from student2 where sname like '%��%' and year = '2';

16) ���ڵ� ��ü ����
delete from student2;

17) ���̺��� �����Ͻÿ�. ( �����Ͻÿ�.)
drop table student2;