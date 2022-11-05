drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));


create table course(
 cno varchar2(5) primary key,
 cname nvarchar2(10),
 credit varchar2(3),
 dept nvarchar2(10),
 prname nvarchar2(10));


create table enrol(
 sno varchar2(3) ,
 cno varchar2(5) ,
 grade varchar2(3),
 midterm int,
 final int ,
 constraint enrol_sno_fk foreign key(sno) references student(sno),
 constraint enrol_cno_fk foreign key(cno) references course(cno),
 constraint enrol_combo_pk primary key(sno, cno));


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


insert into course(cno,cname,credit,dept,prname)
values('C123','���α׷���','3','��ǻ��','�輺��');
insert into course(cno,cname,credit,dept,prname)
values('C312','�ڷᱸ��','3','��ǻ��','Ȳ����');
insert into course(cno,cname,credit,dept,prname)
values('C324','ȭ��ó��','3','��ǻ��','�̱�ö');
insert into course(cno,cname,credit,dept,prname)
values('C413','�����ͺ��̽�','3','��ǻ��','�̼�ȣ');
insert into course(cno,cname,credit,dept,prname)
values('E412','�ݵ�ü','3','����','ȫ����');


insert into enrol(sno,cno,grade,midterm,final)
values('100','C413','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('100','E412','A',95,95);
insert into enrol(sno,cno,grade,midterm,final)
values('200','C123','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C324','C',75,75);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C413','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C324','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C413','B',80,85);
insert into enrol(sno,cno,grade,midterm,final)
values('400','E412','C',65,75);
insert into enrol(sno,cno,grade,midterm,final)
values('500','C312','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C123','A',90,90);


select * from student;
select * from course;
select * from enrol;

select * from student s
join enrol e
on s.sno = e.sno;

--[T-SQL / PL-SQL]
select s.sno, sname, year, dept, cno, grade, midterm, final 
from student s, enrol e
where s.sno = e.sno;



create view v_student_enrol_course  --view ���������� ����Ǿ� �ִ� ������ ���̺�  ����ó������
 as                                   --1.������������ �ܼ�ȭ�Ҷ� ���� 2.�ʿ��Ѱ͸� �����ְ������ 3.�뵵: ���ȼ�, ����
--[ANSI-SQL]                             1.���� : ������ �̿��Ͽ� view ���̺��� ���� �� �ִ�. 2.���ȼ� : �������̺��� �κ��� �̿��Ͽ� view ���̺��� ���� �� �ִ�.
select s.sno, sname, year, s.dept, c.cno, cname, grade, midterm, final , 
(midterm + final) as "�հ�", (midterm + final)/2 as "���"
from student s
join enrol e
on s.sno = e.sno
join course c
on c.cno = e.cno;

select * from v_student_enrol_course
where sno=100;

create view v_student
as
select sno, sname from student;

select * from v_student
where sno=300 or sno=400;

delete from v_student
where sno=300;


drop table student7;

create table student7(
 sno varchar2(3) primary key ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
 );
 
insert into student7(sno,sname,year,dept)
values('100','������','4','��ǻ��');
insert into student7(sno,sname,year,dept)
values('200','������','3','����');
insert into student7(sno,sname,year,dept)
values('300','������','1','��ǻ��');
insert into student7(sno,sname,year,dept)
values('400','�ۺ�ȣ','4','��ǻ��');
insert into student7(sno,sname,year,dept)
values('500','����ȭ','2','���');

create view v_student7
as
select * from student7;

select * from v_student7;
select * from student7;

delete from v_student7 where sno=300;

create view v_join1     --��ġ�� �÷��� �̸��� ���������� ������ ������������
as
select * from student s
join enrol e
on s.sno = e.sno;


drop view v_join2;
select * from v_join2;

create view v_join2 (���,����)
as
select s.sno as s_sno, e.sno as e_sno from student s
join enrol e
on s.sno = e.sno;

create view v_join3
as
select s.sno as s_sno, e.sno as e_sno from student s
join enrol e
on s.sno = e.sno
where s.sno >=400;

select * from v_join3;

update v_join3 set s_sno = '700' where e_sno = '400'; --fk ���������� �ɷ��־ �����̾ȉ� fk ���������� ������ ������

drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));


create table course(
 cno varchar2(5) primary key,
 cname nvarchar2(10),
 credit varchar2(3),
 dept nvarchar2(10),
 prname nvarchar2(10));


create table enrol(
 sno varchar2(3) ,
 cno varchar2(5) ,
 grade varchar2(3),
 midterm int,
 final int ,
 constraint enrol_combo_pk primary key(sno, cno));


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


insert into course(cno,cname,credit,dept,prname)
values('C123','���α׷���','3','��ǻ��','�輺��');
insert into course(cno,cname,credit,dept,prname)
values('C312','�ڷᱸ��','3','��ǻ��','Ȳ����');
insert into course(cno,cname,credit,dept,prname)
values('C324','ȭ��ó��','3','��ǻ��','�̱�ö');
insert into course(cno,cname,credit,dept,prname)
values('C413','�����ͺ��̽�','3','��ǻ��','�̼�ȣ');
insert into course(cno,cname,credit,dept,prname)
values('E412','�ݵ�ü','3','����','ȫ����');


insert into enrol(sno,cno,grade,midterm,final)
values('100','C413','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('100','E412','A',95,95);
insert into enrol(sno,cno,grade,midterm,final)
values('200','C123','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C324','C',75,75);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C413','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C324','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C413','B',80,85);
insert into enrol(sno,cno,grade,midterm,final)
values('400','E412','C',65,75);
insert into enrol(sno,cno,grade,midterm,final)
values('500','C312','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C123','A',90,90);


select * from student;
update student set sname='�ϴ�' where sno='100';
select * from course;
select * from enrol;

create view v_join_se
as
select s.sno, sname, year , cno, grade from student s 
join enrol e 
on s.sno = e.sno;

select * from v_join_se;
update v_join_se set sname = '�ϴ�2' where sno ='100'; -- join�� �Ǿ� �ִ� ��� �߰��� ������ ���� ���� �ʴ´�. �ϳ��� ���̺��� ��� �����ϴ�
delete from v_join_se where sno='100';  -- view���� ���� �ǰ� enrol ���������� ������ view���� ������ �����Ѱ���� �ʷ��Ҽ� �ִ�.


create view v_student88
as
select sno, sname from student;

select * from student;
select * from v_student88;

insert into v_student88(sno, sname) values('700','�ϴ���')
delete from v_student88 where sno=100;

delete from student where sno='200';

drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));


create table course(
 cno varchar2(5) primary key,
 cname nvarchar2(10),
 credit varchar2(3),
 dept nvarchar2(10),
 prname nvarchar2(10));


create table enrol(
 sno varchar2(3) ,
 cno varchar2(5) ,
 grade varchar2(3),
 midterm int,
 final int ,
 constraint enrol_sno_fk foreign key(sno) references student(sno),
 constraint enrol_cno_fk foreign key(cno) references course(cno),
 constraint enrol_combo_pk primary key(sno, cno));


insert into student(sno,sname,year,dept)
values('100','������','4','��ǻ��');
insert into student(sno,sname,year,dept)
values('200','������','3','����');

insert into course(cno,cname,credit,dept,prname)
values('C413','�����ͺ��̽�','3','��ǻ��','�̼�ȣ');

insert into enrol(sno,cno,grade,midterm,final) --fk ���������������� 100 �� c413�� �߰����������� ����� ��������
values('100','C413','A',90,95);



select * from student;
delete from student where sno='100'; --fk ������������ ���� �����Ұ�
delete from student where sno='200'; --������̺� ������ϵ��� �ʾ� ������ �߉�

select * from course;
select * from enrol;
