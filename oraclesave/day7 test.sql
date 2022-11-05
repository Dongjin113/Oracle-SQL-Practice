
drop  table enrol;
drop table juso;
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

1.  �л� ���̺��  ������̺��� �����Ͻÿ�.
select * from student s 
join enrol e
on s.sno = e.sno;

2. ���� ���̺�� ��� ���̺��� �����Ͻÿ�.
select * from enrol e 
join course c
on e.cno = c.cno;

3. �л�, ���, ���� ���̺��� �����Ͻÿ�.
select * from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

4. �й�, �̸�, �г�, ������ ����Ͻÿ�.
select s.sno, sname, year, grade from student s
join enrol e
on s.sno = e.sno;

5. �й�, �̸�, �г� , �а�, �����ȣ, �����, ������ ����Ͻÿ�.
select s.sno, sname, year, s.dept, c.cno, cname, grade from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

6. Ȳ���� ������ ������ �����ϰ� �ִ� �л��� �̸��� ������ ����Ͻÿ�. (Ȳ���� ���� ���)
select s.sname, grade from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where prname = 'Ȳ����';

7. �л�, ���, ���� ���̺��� �����Ͽ� view ���̺��� ����ÿ�. ( v_t1 )
create view v_t1 
as
select s.sno "�й�", sname "�̸�", year "�г�", s.dept "�а�", e.cno "�����ȣ", grade "����", midterm "�߰�����", final "�⸻����", 
cname "����", credit "����", prname "������"
from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

8. �й�, �̸�, �г�, �а� , ����� , ����, ��米���� view ���̺�� ����ÿ�( v_t2 )
create view v_t2
as
select s.sno , sname, year, s.dept, cname, grade, prname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

����1. ������ �л��� �����ϰ� �ִ� ������� ����Ͻÿ�.
select cname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where sname = '������';

 ����2. ��ǻ�Ͱ� �л��� �̸��� �߰���� �⸻��� ������ ��Ÿ���ÿ�
select sname, midterm, final from student s
join enrol e
on s.sno = e.sno
where dept = '��ǻ��';

 ����3. Ȳ���� �������� �����ް� �ִ� �л��� �̸��� ����Ͻÿ�.
select sname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where prname = 'Ȳ����';

 ����4. 3�г� �л��� �߰���� ����� ����Ͻÿ�.
select year,avg(midterm) from student s
join enrol e
on s.sno = e.sno
group by year
having year = '3';

 ����5. �г⺰ �߰���� ����� ����Ͻÿ�.
select year,avg(midterm) from student s
join enrol e
on s.sno = e.sno
group by year;

 ����6. �л��� �߰����, �⸻��� ����� ����Ͻÿ�.
select sno, round(avg(midterm),1), round(avg(final),1)
from enrol
group by sno;

 ����7. �л��� �߰���� �Ǵ� �⸻����� ����� 80�� �̻��� �л��� 
        ����Ͻÿ�.
select sname from student
where sno in (
select sno from enrol 
group by sno 
having avg(midterm) >= 80 or avg(final)>=80);

select sname, avg(midterm), avg(final) from student s
join enrol e
on s.sno = e.sno
group by sname
having avg(midterm) >= 80 or avg(final) >= 80;



 ����8. �л��� �߰����, �⸻����� ����� 90�� �̻��� �л��� 
        ����Ͻÿ�. (�߰���� �� �⸻����� ����� �Ѵ� 90�� �̻��� �л�) 
select sname from student
where sno in (
select sno from enrol 
group by sno
having avg(midterm) >= 90 and avg(final) >= 90);

select sname from student s
join enrol e
on s.sno = e.sno
group by sname
having avg(midterm) >= 90 and avg(final) >= 90;

select * from users;