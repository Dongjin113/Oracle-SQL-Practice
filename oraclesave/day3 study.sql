drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,       
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));  --constraint ���������� �Ǵٴ� ��


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
insert into student(sno,sname,year,dept)
values('600','�Ѹ�','',' ');

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
select * from student order by sno desc;  --������������


select * from student;
select sno,sname from student;
select sno, sname, year, dept from student where sno='300' or sno='500';
select sno, sname, year, dept from student where sno in('300','500');
select sno, sname, year, dept from student where sno='300' or sname='������';
select sno, sname, year, dept from student where year >= 4;
select sno, sname, year, dept from student where year <='2';
select sno, sname, year, dept from student where year <=2 or year>= 4;
select sno, sname, year, dept from student where year <=3 and year >= 2;
select sno, sname, year, dept from student where year between '2' and '3' order by year asc; 
--�տ��� ������ �ڿ��� ū������Ÿ������ ������ asc�������ϸ� �⺻�� ��������
select sno, sname, year, dept from student year order by year asc , sno asc;
select sno, sname, year, dept from student year order by year desc , sno asc;

select count(*) as "�л���" from student;  -- 6 ��Ī as "�л���" as�� ������������ ��� (*)�� ����ϴ������� null ���� ��������
select count(sno) as "�л���" from student;  -- 6
select count(year) as "�л���" from student;  -- 5 null�� ������ �����ʴ´ٴ� ��
select count(dept) as "�л���" from student;  -- 6 ������ ���ڷ� ������ ��
select count(nvl(year,0)) as "�л���" from student; --nvl year�� ���� null�̸� 0���δ�ü�ض�
select sno, sname, nvl(year,0), dept from student;

select sno, count(dept) as "�л���" from student
group by sno;

select * from student;

select dept, count(dept) as "�л���" from student
group by dept; --sno�� ������� �׷�ȭ  ���� �ͳ��� �����ִ°��� �׷�ȭ��� �Ѵ�

select dept, year, count(dept) as "�л���" from student
group by dept , year;

select dept, year, count(dept) as "�л���" from student
group by dept , year
order by dept desc;

select sno from student group by sno;
select dept from student group by dept;
update student set dept='����' where sno='600';

select dept as "�а��̸�", count(dept) as "�л���" from student group by dept;
select distinct dept from student;
select distinct year from student; --distinct �ߺ�����

select count( distinct dept ) as "�а���" from student; --�а��� �ߺ��� �����ؼ� ��Ÿ����
select distinct dept, year from student; -- �ߺ����Ŵ� Į���� �� �տ��� ����ؾ���  ����� �а����� ��ΰ��ƾ� �ߺ����Ű���

select dept , count(dept) from student group by dept having count(dept) >=2;
-- �׷��Լ������� ������ having�� ���
select dept , count(dept) from student group by dept having count(dept) >=2
order by count(dept) desc;


select dept "�а���" , count(dept) "�л���" 
from student 
where dept !='����'
group by dept 
having count(dept) >=2
order by count(dept) desc; --������� ������ ��ǻ�Ͱ��� �л����� ��Ÿ�����

select dept "�а���" , count(dept) "�л���" 
from student 
where dept !='����'
group by dept 
having dept = '��ǻ��'
order by count(dept) desc; --������� ������ ��ǻ�Ͱ��� �л����� ��Ÿ�����

select sum(year) "��", count(year) ,avg(year) as "���1", round(avg(nvl(year,0)),1) as "���2"
       , MAX(year)"�ְ��г�", MIN(year)"�����г�" 
from student;   

select * from student inner join enrol
on student.sno = enrol.sno
where sname='������';

select * from student inner join enrol    -- ������ ���̺��� ����   student, enrol, course
on student.sno = enrol.sno                
join course on enrol.cno = course.cno;


select * from enrol inner join course
on enrol.cno = course.cno;

select s.sno , sname , year, s.dept , 
       c.cno, cname ,credit, c.dept, 
       prname, grade, midterm, final 
from student s inner join enrol e
on s.sno = e.sno
join course c on e.cno = c.cno
where s.dept= '��ǻ��';

