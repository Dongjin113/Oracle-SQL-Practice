
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

1.  학생 테이블과  등록테이블을 조인하시오.
select * from student s 
join enrol e
on s.sno = e.sno;

2. 과목 테이블과 등록 테이블을 조인하시오.
select * from enrol e 
join course c
on e.cno = c.cno;

3. 학생, 등록, 과목 테이블을 조인하시오.
select * from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

4. 학번, 이름, 학년, 성적을 출력하시오.
select s.sno, sname, year, grade from student s
join enrol e
on s.sno = e.sno;

5. 학번, 이름, 학년 , 학과, 과목번호, 과목명, 성적을 출력하시오.
select s.sno, sname, year, s.dept, c.cno, cname, grade from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

6. 황수찬 교수님 과목을 수강하고 있는 학생의 이름과 성적을 출력하시오. (황수찬 과목만 출력)
select s.sname, grade from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where prname = '황수찬';

7. 학생, 등록, 과목 테이블을 조인하여 view 테이블을 만드시오. ( v_t1 )
create view v_t1 
as
select s.sno "학번", sname "이름", year "학년", s.dept "학과", e.cno "과목번호", grade "성적", midterm "중간성적", final "기말성적", 
cname "과목병", credit "학점", prname "교수명"
from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

8. 학번, 이름, 학년, 학과 , 과목명 , 성적, 담당교수를 view 테이블로 만드시오( v_t2 )
create view v_t2
as
select s.sno , sname, year, s.dept, cname, grade, prname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno;

문제1. 나연묵 학생이 수강하고 있는 과목명을 출력하시오.
select cname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where sname = '나연묵';

 문제2. 컴퓨터과 학생의 이름과 중간고사 기말고사 성적을 나타내시오
select sname, midterm, final from student s
join enrol e
on s.sno = e.sno
where dept = '컴퓨터';

 문제3. 황수찬 교수에게 수업받고 있는 학생의 이름을 출력하시오.
select sname from student s
join enrol e
on s.sno = e.sno
join course c
on e.cno = c.cno
where prname = '황수찬';

 문제4. 3학년 학생의 중간고사 평균을 출력하시오.
select year,avg(midterm) from student s
join enrol e
on s.sno = e.sno
group by year
having year = '3';

 문제5. 학년별 중간고사 평균을 출력하시오.
select year,avg(midterm) from student s
join enrol e
on s.sno = e.sno
group by year;

 문제6. 학생별 중간고사, 기말고사 평균을 출력하시오.
select sno, round(avg(midterm),1), round(avg(final),1)
from enrol
group by sno;

 문제7. 학생의 중간고사 또는 기말고사의 평균이 80점 이상인 학생을 
        출력하시오.
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



 문제8. 학생의 중간고사, 기말고사의 평균이 90점 이상인 학생을 
        출력하시오. (중간고사 와 기말고사의 평균이 둘다 90점 이상인 학생) 
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