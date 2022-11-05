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
values('100','나연묵','4','컴퓨터');
insert into student(sno,sname,year,dept)
values('200','이찬영','3','전기');
insert into student(sno,sname,year,dept)
values('300','정기태','1','컴퓨터');
insert into student(sno,sname,year,dept)
values('400','송병호','4','컴퓨터');
insert into student(sno,sname,year,dept)
values('500','박종화','2','산공');


insert into course(cno,cname,credit,dept,prname)
values('C123','프로그래밍','3','컴퓨터','김성기');
insert into course(cno,cname,credit,dept,prname)
values('C312','자료구조','3','컴퓨터','황수찬');
insert into course(cno,cname,credit,dept,prname)
values('C324','화일처리','3','컴퓨터','이규철');
insert into course(cno,cname,credit,dept,prname)
values('C413','데이터베이스','3','컴퓨터','이성호');
insert into course(cno,cname,credit,dept,prname)
values('E412','반도체','3','전자','홍봉희');


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


1.나연묵 학생의 학번,이름,학년,중간,기말 성적을 나타내시오.
select s.sno, sname , year,midterm, final
from student s
join enrol e
on s.sno = e.sno
where sname = '나연묵';

select s.sno, sname , year,midterm, final
from student s, enrol e
where s.sno = e.sno and sname = '나연묵';

2.학번이 400번인 학생의 이름과 학과, 성적(grade)을 나타내시오.
select sname, dept, grade from student s
join enrol e
on s.sno = e.sno
where s.sno = 400;


3.컴퓨터과 학생과 전기과 학생의 이름과 학번, 성적(grade)을 나타내시오.
select sname, s.sno, grade 
from student s
join enrol e
on s.sno = e.sno
where dept = '컴퓨터' or dept = '전기';

4. 중간고사 성적이 90점 이상인 학생의 이름과 과목코드번호 중간고사 성적을 나타내시오.
select sname, cno, midterm from student s
join enrol e
on s.sno =e.sno
where midterm >= 90;

5. 3학년 4학년 학생의 이름과 과목코드,성적을 나타내시오
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

6. 자료구조를 수강한 학생의 학번과 성적을 나타내시오.
select s.sno, grade
from student s
join enrol e
on s.sno=e.sno
join course c
on e.cno = c.cno
where cname = '자료구조';

7. 성적이 A인 학생의 학번과 과목이름을 나타내시오.
select sno as "학번", cname as "과목이름" from enrol e
join course c
on c.cno = e.cno
where grade = 'A';


8. 이성호 교수가 가르친 과목을 수강한 학생의 학번과 성적을 나타내시오.
select sno as "학번", grade as "성적" 
from enrol e
join course c
on c.cno = e.cno
where prname = '이성호';

9.코드번호가 e로 시작하는 과목을 수강한 학생의 학번과 과목이름, 과목코드, 성적을 나타내시오.
select s.sno, sname, cno, grade 
from student s
join enrol e
on s.sno = e.sno
where cno like 'e%' or cno like 'E%';

select sno, cname, e.cno, grade 
from enrol e join course c 
on  e.cno=c.cno 
where c.cno like 'E%';



10. 이규철 교수의 과목을 수강한 학생은 몇명인가요
select count(prname) as "수강한 학생" 
from enrol e
join course c
on e.cno = c.cno
where prname = '이규철';

select  count(*) as "수강학생 수"
from enrol e1  join course c1 
on e1.cno=c1.cno 
where c1.prname='이규철' ;


select count(*) 
from enrol e1, course c1 
where e1.cno=c1.cno and c1.prname='이규철';

select *
from enrol e, course c , student s
where e.cno = c.cno and e.sno=s.sno;


