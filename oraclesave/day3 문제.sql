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


1.������ �л��� �й�,�̸�,�г�,�߰�,�⸻ ������ ��Ÿ���ÿ�.
select s.sno, sname , year,midterm, final
from student s
join enrol e
on s.sno = e.sno
where sname = '������';

select s.sno, sname , year,midterm, final
from student s, enrol e
where s.sno = e.sno and sname = '������';

2.�й��� 400���� �л��� �̸��� �а�, ����(grade)�� ��Ÿ���ÿ�.
select sname, dept, grade from student s
join enrol e
on s.sno = e.sno
where s.sno = 400;


3.��ǻ�Ͱ� �л��� ����� �л��� �̸��� �й�, ����(grade)�� ��Ÿ���ÿ�.
select sname, s.sno, grade 
from student s
join enrol e
on s.sno = e.sno
where dept = '��ǻ��' or dept = '����';

4. �߰���� ������ 90�� �̻��� �л��� �̸��� �����ڵ��ȣ �߰���� ������ ��Ÿ���ÿ�.
select sname, cno, midterm from student s
join enrol e
on s.sno =e.sno
where midterm >= 90;

5. 3�г� 4�г� �л��� �̸��� �����ڵ�,������ ��Ÿ���ÿ�
select sname, cno, grade 
from student s
join enrol e
on s.sno = e.sno
where year = 3 or year =4 ;

select sname, cno, grade 
from student s
join enrol e
on s.sno = e.sno
where year in(3 , 4) ;

6. �ڷᱸ���� ������ �л��� �й��� ������ ��Ÿ���ÿ�.
select s.sno, grade
from student s
join enrol e
on s.sno=e.sno
join course c
on e.cno = c.cno
where cname = '�ڷᱸ��';

7. ������ A�� �л��� �й��� �����̸��� ��Ÿ���ÿ�.
select sno as "�й�", cname as "�����̸�" from enrol e
join course c
on c.cno = e.cno
where grade = 'A';


8. �̼�ȣ ������ ����ģ ������ ������ �л��� �й��� ������ ��Ÿ���ÿ�.
select sno as "�й�", grade as "����" 
from enrol e
join course c
on c.cno = e.cno
where prname = '�̼�ȣ';

9.�ڵ��ȣ�� e�� �����ϴ� ������ ������ �л��� �й��� �����̸�, �����ڵ�, ������ ��Ÿ���ÿ�.
select s.sno, sname, cno, grade 
from student s
join enrol e
on s.sno = e.sno
where cno like 'e%' or cno like 'E%';

select sno, cname, e.cno, grade 
from enrol e join course c 
on  e.cno=c.cno 
where c.cno like 'E%';



10. �̱�ö ������ ������ ������ �л��� ����ΰ���
select count(prname) as "������ �л�" 
from enrol e
join course c
on e.cno = c.cno
where prname = '�̱�ö';

select  count(*) as "�����л� ��"
from enrol e1  join course c1 
on e1.cno=c1.cno 
where c1.prname='�̱�ö' ;


select count(*) 
from enrol e1, course c1 
where e1.cno=c1.cno and c1.prname='�̱�ö';

select *
from enrol e, course c , student s
where e.cno = c.cno and e.sno=s.sno;


