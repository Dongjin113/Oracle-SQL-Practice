drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,       
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));  --constraint 제약조건을 건다는 뜻


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
insert into student(sno,sname,year,dept)
values('600','둘리','',' ');

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
select * from student order by sno desc;  --내림차순정렬


select * from student;
select sno,sname from student;
select sno, sname, year, dept from student where sno='300' or sno='500';
select sno, sname, year, dept from student where sno in('300','500');
select sno, sname, year, dept from student where sno='300' or sname='나연묵';
select sno, sname, year, dept from student where year >= 4;
select sno, sname, year, dept from student where year <='2';
select sno, sname, year, dept from student where year <=2 or year>= 4;
select sno, sname, year, dept from student where year <=3 and year >= 2;
select sno, sname, year, dept from student where year between '2' and '3' order by year asc; 
--앞에가 작은것 뒤에가 큰것을나타내야함 정렬중 asc를생략하면 기본이 오름차순
select sno, sname, year, dept from student year order by year asc , sno asc;
select sno, sname, year, dept from student year order by year desc , sno asc;

select count(*) as "학생수" from student;  -- 6 별칭 as "학생수" as는 가독성때문에 사용 (*)를 사용하는이유는 null 또한 세기위해
select count(sno) as "학생수" from student;  -- 6
select count(year) as "학생수" from student;  -- 5 null은 연산을 하지않는다는 뜻
select count(dept) as "학생수" from student;  -- 6 공백은 문자로 연산을 함
select count(nvl(year,0)) as "학생수" from student; --nvl year의 갚이 null이면 0으로대체해라
select sno, sname, nvl(year,0), dept from student;

select sno, count(dept) as "학생수" from student
group by sno;

select * from student;

select dept, count(dept) as "학생수" from student
group by dept; --sno를 기반으로 그룹화  같은 것끼리 묶어주는것을 그룹화라고 한다

select dept, year, count(dept) as "학생수" from student
group by dept , year;

select dept, year, count(dept) as "학생수" from student
group by dept , year
order by dept desc;

select sno from student group by sno;
select dept from student group by dept;
update student set dept='전기' where sno='600';

select dept as "학과이름", count(dept) as "학생수" from student group by dept;
select distinct dept from student;
select distinct year from student; --distinct 중복제거

select count( distinct dept ) as "학과수" from student; --학과를 중복을 제거해서 나타내라
select distinct dept, year from student; -- 중복제거는 칼럼의 젤 앞에서 사용해야함  년수와 학과명이 모두같아야 중복제거가됌

select dept , count(dept) from student group by dept having count(dept) >=2;
-- 그룹함수에대한 조건은 having을 사용
select dept , count(dept) from student group by dept having count(dept) >=2
order by count(dept) desc;


select dept "학과명" , count(dept) "학생수" 
from student 
where dept !='전기'
group by dept 
having count(dept) >=2
order by count(dept) desc; --전기과를 제외한 컴퓨터과의 학생수만 나타내어라

select dept "학과명" , count(dept) "학생수" 
from student 
where dept !='전기'
group by dept 
having dept = '컴퓨터'
order by count(dept) desc; --전기과를 제외한 컴퓨터과의 학생수만 나타내어라

select sum(year) "합", count(year) ,avg(year) as "평균1", round(avg(nvl(year,0)),1) as "평균2"
       , MAX(year)"최고학년", MIN(year)"최저학년" 
from student;   

select * from student inner join enrol
on student.sno = enrol.sno
where sname='나연묵';

select * from student inner join enrol    -- 세개의 테이블을 조인   student, enrol, course
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
where s.dept= '컴퓨터';

