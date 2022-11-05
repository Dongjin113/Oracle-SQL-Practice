drop  table enrol;
drop  table student;
drop  table course;

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 primary  key(sno) );

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno)); -- �̸��� �ο��Ѱ�
 
 create table student(
 sno varchar2(3) not null  primary  key ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
);

/*�⺻Ű (p.k)     
1. �ߺ��Ұ�
2. null ���Ұ�
3. ���̺� �ϳ��� ����
a 001 = a001
a 002 = a002
b 001 = b001
b 002 = b002
*/
drop table student27;

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno,sname)); -- �ΰ��� pk�ο� sno,sname �ΰ��� ���ϰ������� �����߻�
 
 insert into student(sno,sname,year,dept) values ('100','������','4','��ǻ��');
 insert into student(sno,sname,year,dept) values ('100','�Ѹ�','4','��ǻ��');
 insert into student(sno,sname,year,dept) values ('200','������','4','��ǻ��');
 insert into student(sno,sname,year,dept) values ('200','������','3','��ǻ��1'); -- �����߻�
 select * from student;
 
  create table student(
 sno varchar2(3) not null  primary  key ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
);

insert into student(sno,sname,year,dept)
values('100','������','4','��ǻ��');
insert into student(sno,sname,year,dept)
values('200','������','3','����');
insert into student(sno,sname,year,dept)
values('300','������','1','��ǻ��');
insert into student(sno,sname,year,dept)
values('400','�ۺ�ȣ','4','��ǻ��');
insert into student(sno,sname,year,dept)
values('500','����ȭ','2','���');

-- sno�� 100���� �л��� �й��� �̸��� ����Ͻÿ�
select sno,sname from student where sno = '100';
-- sno�� 100�� �Ǵ� sno�� 300�� �л��� �й��� ���ڵ带 ����Ͻÿ�
select * from student where  sno = '100' or sno = '300';
select * from student where  sno in('100','300');
-- �̸��� '��' �� ���ڰ� ���ԵǾ��ִ� ��ǻ�Ͱ� �л��� ���ڵ带 ����Ͻÿ�
select * from student where sname like '%��%' and dept = '��ǻ��' ;
-- �а��� ����� �Ǵ� �װ����� �л��� ����Ͻÿ�
select sno,sname,year,dept from student where dept = '����' or dept = '���';
select sno,sname,year,dept from student where dept in('����','���');

--��ǻ�Ͱ��� �ƴ� �л��� �̸��� �а��� ����Ͻÿ�
select sno,sname,year,dept from student where dept != '��ǻ��';
select sno,sname,year,dept from student where dept <> '��ǻ��';

--�а��� ����� �Ǵ� �װ����� �ƴ� �л��� ���ڵ带 ����Ͻÿ�
select sno,sname,year,dept from student where dept <> '����' and dept <> '���';
select sno,sname,year,dept from student where dept != '����' and dept != '���';
select sno,sname,year,dept from student where dept not in('����','���');
select sno,sname,year,dept from student where not (dept ='����'or dept ='���');

--�̸��� �������� �������� �����Ͻÿ�.
select * from student order by sname desc;
--�г��� �������� �������� �� ��ȣ�� �̿��Ͽ� �������� �����Ͻÿ�.
select * from student order by year desc , sno asc; --�������� desc �������� asc 

-- 100�� �л��� �̸��� ���������� �����Ͻÿ�
update student set sname = '������' where sno = '100';
-- ������� ���ڰ��а��� �����Ͻÿ�.
update student set dept = '���ڰ���' where dept = '����';
--400�� �л��� ���ڵ带 �̸��� �Ѹ�, �г��� 5�г����� �����Ͻÿ�
update student set sname = '�Ѹ�' , year = 5 where sno = 400;
--600�� ������, 5�г�, ������� �߰� �Ͻÿ�.
insert into student (sno,sname,year,dept) values ('600','������','5','���');
--�̸��� ������ '��'���� �����ϴ� �л��� �����Ͻÿ�.
delete from student where sname like ('��%');

 



select * from student;