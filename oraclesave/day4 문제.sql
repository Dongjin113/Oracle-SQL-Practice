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


1. �л� �̸��� �г��� ����Ͻÿ�.
select sname, year from student;

2. 3�г� �л��� ����Ͻÿ�.
select * from student where year = 3;

3. 3�г�� 4�г� �л��� ����Ͻÿ�.
select * from student where year in (3,4);

4. �̸��� '������' �̰� 4�г��� �л��� ����Ͻÿ�.
select * from student where sname = '������' and year = 4;

5. ��ǻ�Ͱ� �л��� �г�� �̸��� ����Ͻÿ�.
select sname, year from student where dept = '��ǻ��';

6. ������ �л��� �г�� �а��� ����Ͻÿ�. 
select year, dept from student where sname = '������';

7. ��ǻ�Ͱ��� �ƴ� �л��� �̸��� �а��� ����Ͻÿ�.
select sname, dept from student where dept != '��ǻ��'

8. �й��� 100��, 300��, 500���� �л��� �й��� �̸� �а��� ����Ͻÿ�.
select sno, sname, dept from student where sno in (100,300,500);

9. �̸��� ù���ڰ� "��" �� "��" �̸� �����ϴ� ����� �й��� �̸��� ����Ͻÿ�.
select sno, sname from student where sname like '��%' or sname like '��%'

10. 3�г� �Ǵ� 4�г� �л��� �ƴ� �л��� �й��� �̸� , �г��� ����Ͻÿ�. 
select sno, sname, year from student where year != 3 and year !=4 ;


1. ������̺��� 100 �� �л��� ���ڵ� ������ ����Ͻÿ�.
select count(*) from student where sno ='100';

--�й��� ���������� ����Ͻÿ�
select sno, count(*) from enrol
group by sno;

select sno, count(*) from enrol
group by sno
having sno='100';


2. ������ A �� ���ڵ� ������ ����Ͻÿ�.
select count(*) from enrol where grade = 'A';

select grade, count(*) from enrol
group by grade
having grade = 'A';

3. 300�� �л��� �߰�����, �⸻������ �հ� ����� ��Ÿ���ÿ�.
select MIDTERM, FINAL, (midterm + final) as "������ ��" , (midterm + final)/2 as "���" 
from enrol 
where sno = '300';

select sno, sum(midterm), sum(final), round(avg(midterm),1), round(avg(final),1)
from enrol 
group by sno
having sno ='300'; --�׷�ȭ�� ��Ų���߿� 300���� �������� ��

select sno, sum(midterm), sum(final), round(avg(midterm),1), round(avg(final),1)
from enrol 
where sno = '300'
group by sno;  --300���� ������ �׷�ȭ�� ��Ų��

4. c413 ������ �߰���� �ְ���, ������ �� ����Ͻÿ�.
select max(midterm) , min(midterm)
from enrol 
where cno = 'C413'; 

select cno, max(midterm) , min(midterm)
from enrol 
where cno = 'C413'
group by cno; 

5. 200�� �л��� �й�, �̸�, �г�, �߰�����, �⸻����, ����, �հ�, ����� ��Ÿ���ÿ�.
select s.sno, sname, year, midterm, final, grade, (midterm + final), (midterm + final)/2
from student s join enrol e
on s.sno = e.sno
where s.sno = '200';

����� �����, ��ǻ�Ͱ� �л��� ������ ������ ������ ����Ͻÿ�.
select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
group by dept
having dept = '���' or dept = '����' or dept ='��ǻ��';

select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
where dept in( '���', '����', '��ǻ��')
group by dept;

select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
group by dept
having dept in( '���', '����', '��ǻ��');

1. �����̸��� ȭ��ó���� ������ �߰���հ� �⸻����� ��Ÿ���ÿ�
select round(avg(midterm),1) , round(avg(final),1) 
from enrol e
join course c
on e.cno=c.cno
where cname = 'ȭ��ó��';

select avg(midterm) , avg(final)
from enrol e
join course c
on e.cno=c.cno
where cname = 'ȭ��ó��';

select cname ,round(avg(midterm),1) , round(avg(final),1) 
from enrol e
join course c
on e.cno=c.cno
group by cname
having cname = 'ȭ��ó��';

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

insert into student(sno,sname,year,dept)
values('600','�ϴ���','4','��ȭ��');
insert into student(sno,sname,year,dept)
values('700','������','4','��ȭ��');


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

insert into course(cno,cname,credit,dept,prname)
values('F111','�ڵ�������','2','�ڵ���','�ֵ���');
insert into course(cno,cname,credit,dept,prname)
values('F222','������α׷�','2','���','�̱���');

insert into course(cno,cname,credit,dept,prname)
values('F333','AI','2','�ΰ�����','��ڻ�');


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

insert into enrol(sno,cno,grade,midterm,final)
values('901','F111','A',90,90);
insert into enrol(sno,cno,grade,midterm,final)
values('902','F111','A',90,90);
insert into enrol(sno,cno,grade,midterm,final)
values('903','F222','A',90,90);

select * from student s    -- (inner) join sno�� �Ѵ� �ִ°͸� ��Ÿ��
join enrol e
on s.sno=e.sno
order by s.sno asc;

select * from student s   
left outer join enrol e
on s.sno=e.sno
order by s.sno asc;

select * from student s   
right outer join enrol e
on s.sno=e.sno
order by s.sno asc;

select * from student s   
full outer join enrol e
on s.sno=e.sno
join course c
on c.cno = e.cno
order by s.sno asc;

select * from student s      --�ߺ����� ���� �����ϴ°� ����ȭ
full outer join enrol e
on s.sno=e.sno
right outer join course c
on c.cno = e.cno
order by s.sno asc;

create table juso(                          -
sno varchar2(3) not null,
email varchar2(50),
addr nvarchar2(100),
constraint juso_sno_fk foreign key(sno) references student(sno)
);

insert into juso( sno, email, addr)
values('100','maju100@naver.com','���� ���ϱ�');
insert into juso( sno, email, addr)
values('300','maju100@naver.com','���� ���ϱ�');

select * from student s      --���̺��� �߰��Ͽ� ��ȭ��ȣ���� ���ι��� ����Ͽ� �߰��Ҽ� ���� �̶� �⺻Ű�� ũ�Ⱚ(3)�� ���ƾ���
full outer join enrol e
on s.sno=e.sno
right outer join course c
on c.cno = e.cno
full join juso j
on j.sno = s.sno
order by s.sno asc;

select * from enrol;

1. �й��� 100���̰�  �����ȣ�� C413 �� �л��� ���ؼ� 
�߰���� ������ 5�� ������Ʈ( +5) �� �ּ���.!!  
update enrol set midterm = (midterm + 5) where sno = 100 and cno = 'C413';


update enrol set midterm = (midterm + 5), final = final + 1 where sno = 100 and cno = 'C413';

2.�߰���� ������ 80�� ������ �л��� ���ؼ� 5���� ���� �ּ���!!
update enrol set midterm =(midterm+5) where midterm <= 80;

3.��ü �л��� ���ؼ� �߰���� ������ 1�� �����ּ���.
update enrol set midterm = (midterm+1);

1.��ǻ�Ͱ� �л����� ������ �߰�, �⸻ �������� -1�� �����Ͻÿ�. ����������

update enrol set midterm = midterm-1, final = final-1 
where sno in(
select sno
from student 
where dept='��ǻ��');  --���������� insert �� ������ �������������� ��밡�� select , update

delete from enrol where sno in(
select sno
from student 
where dept='��ǻ��');  --���������� insert �� ������ �������������� ��밡�� select , update

2. ���������� �̿��Ͽ� ȭ��ó�� ������ �߰������հ� �⸻��� ����� ��Ÿ���ÿ�
select avg(midterm), avg(final) 
from enrol 
where cno in(
select cno from course
where cname = 'ȭ��ó��');

3. ���������� �̿��Ͽ� �⸻����� ��� ������ 85�� �̻��� �л��� �̸��� �а��� ��Ÿ���ÿ�
select sname, dept 
from student
where sno in(
select sno from enrol 
group by sno
having avg(final) >= 85);


4. ���������� �̿��Ͽ� ��� ���̺��� �⸻���  ����� ���Ͽ� 
  ��պ��� ������ ���� �л��� �̸��� ���Ͻÿ�.
select sname from student
where sno in( select sno from enrol
group by sno
having avg(final) > (select avg(final) from enrol));


