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


1. 학생 이름과 학년을 출력하시오.
select sname, year from student;

2. 3학년 학생을 출력하시오.
select * from student where year = 3;

3. 3학년과 4학년 학생을 출력하시오.
select * from student where year in (3,4);

4. 이름이 '나연묵' 이고 4학년인 학생을 출력하시오.
select * from student where sname = '나연묵' and year = 4;

5. 컴퓨터과 학생의 학년과 이름을 출력하시오.
select sname, year from student where dept = '컴퓨터';

6. 정기태 학생의 학년과 학과를 출력하시오. 
select year, dept from student where sname = '정기태';

7. 컴퓨터과가 아닌 학생의 이름과 학과를 출력하시오.
select sname, dept from student where dept != '컴퓨터'

8. 학번이 100번, 300번, 500번인 학생의 학번과 이름 학과를 출력하시오.
select sno, sname, dept from student where sno in (100,300,500);

9. 이름의 첫글자가 "정" 과 "박" 이름 시작하는 사람의 학번과 이름을 출력하시오.
select sno, sname from student where sname like '정%' or sname like '박%'

10. 3학년 또는 4학년 학생이 아닌 학생의 학번과 이름 , 학년을 출력하시오. 
select sno, sname, year from student where year != 3 and year !=4 ;


1. 등록테이블에서 100 번 학생의 레코드 개수를 출력하시오.
select count(*) from student where sno ='100';

--학번별 수강과목을 출력하시오
select sno, count(*) from enrol
group by sno;

select sno, count(*) from enrol
group by sno
having sno='100';


2. 성적이 A 인 레코드 개수를 출력하시오.
select count(*) from enrol where grade = 'A';

select grade, count(*) from enrol
group by grade
having grade = 'A';

3. 300번 학생의 중간성적, 기말성적의 합과 평균을 나타내시오.
select MIDTERM, FINAL, (midterm + final) as "성적의 합" , (midterm + final)/2 as "평균" 
from enrol 
where sno = '300';

select sno, sum(midterm), sum(final), round(avg(midterm),1), round(avg(final),1)
from enrol 
group by sno
having sno ='300'; --그룹화를 시킨것중에 300번을 가져오는 것

select sno, sum(midterm), sum(final), round(avg(midterm),1), round(avg(final),1)
from enrol 
where sno = '300'
group by sno;  --300번만 가지고 그룹화를 시킨것

4. c413 과목의 중간고사 최고점, 최저점 을 출력하시오.
select max(midterm) , min(midterm)
from enrol 
where cno = 'C413'; 

select cno, max(midterm) , min(midterm)
from enrol 
where cno = 'C413'
group by cno; 

5. 200번 학생의 학번, 이름, 학년, 중간성적, 기말성적, 평점, 합계, 평균을 나타내시오.
select s.sno, sname, year, midterm, final, grade, (midterm + final), (midterm + final)/2
from student s join enrol e
on s.sno = e.sno
where s.sno = '200';

전기과 산공과, 컴퓨터과 학생이 수강한 과목의 개수를 출력하시오.
select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
group by dept
having dept = '산공' or dept = '전기' or dept ='컴퓨터';

select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
where dept in( '산공', '전기', '컴퓨터')
group by dept;

select dept, count(*) from student s
join enrol e 
on s.sno=e.sno
group by dept
having dept in( '산공', '전기', '컴퓨터');

1. 과목이름이 화일처리인 과목의 중간평균과 기말평균을 나타내시오
select round(avg(midterm),1) , round(avg(final),1) 
from enrol e
join course c
on e.cno=c.cno
where cname = '화일처리';

select avg(midterm) , avg(final)
from enrol e
join course c
on e.cno=c.cno
where cname = '화일처리';

select cname ,round(avg(midterm),1) , round(avg(final),1) 
from enrol e
join course c
on e.cno=c.cno
group by cname
having cname = '화일처리';

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
values('600','하늘이','4','만화괴');
insert into student(sno,sname,year,dept)
values('700','영심이','4','만화과');


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

insert into course(cno,cname,credit,dept,prname)
values('F111','자동차정비','2','자동차','최동운');
insert into course(cno,cname,credit,dept,prname)
values('F222','드론프로그램','2','드론','이광재');

insert into course(cno,cname,credit,dept,prname)
values('F333','AI','2','인공지능','김박사');


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

select * from student s    -- (inner) join sno가 둘다 있는것만 나타냄
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

select * from student s      --중복적인 값을 정리하는것 정규화
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
values('100','maju100@naver.com','서울 강북구');
insert into juso( sno, email, addr)
values('300','maju100@naver.com','서울 강북구');

select * from student s      --테이블을 추가하여 전화번호등을 조인문을 사용하여 추가할수 있음 이때 기본키의 크기값(3)은 같아야함
full outer join enrol e
on s.sno=e.sno
right outer join course c
on c.cno = e.cno
full join juso j
on j.sno = s.sno
order by s.sno asc;

select * from enrol;

1. 학번이 100번이고  과목번호가 C413 인 학생에 대해서 
중간고사 성적인 5점 업데이트( +5) 해 주세요.!!  
update enrol set midterm = (midterm + 5) where sno = 100 and cno = 'C413';


update enrol set midterm = (midterm + 5), final = final + 1 where sno = 100 and cno = 'C413';

2.중간고사 성적이 80점 이하인 학생에 대해서 5점을 더해 주세요!!
update enrol set midterm =(midterm+5) where midterm <= 80;

3.전체 학생에 대해서 중간고사 성적을 1점 더해주세요.
update enrol set midterm = (midterm+1);

1.컴퓨터과 학생들의 점수를 중간, 기말 점수에서 -1씩 진행하시오. 서브쿼리문

update enrol set midterm = midterm-1, final = final-1 
where sno in(
select sno
from student 
where dept='컴퓨터');  --서브쿼리는 insert 를 제외한 나머지문에서는 사용가능 select , update

delete from enrol where sno in(
select sno
from student 
where dept='컴퓨터');  --서브쿼리는 insert 를 제외한 나머지문에서는 사용가능 select , update

2. 서브쿼리를 이용하여 화일처리 과목의 중간고사평균과 기말고사 평균을 나타내시오
select avg(midterm), avg(final) 
from enrol 
where cno in(
select cno from course
where cname = '화일처리');

3. 서브쿼리를 이용하여 기말고사의 평균 성적이 85점 이상인 학생의 이름과 학과를 나타내시오
select sname, dept 
from student
where sno in(
select sno from enrol 
group by sno
having avg(final) >= 85);


4. 서브쿼리를 이용하여 등록 테이블에서 기말고사  평균을 구하여 
  평균보다 성적이 좋은 학생의 이름을 구하시오.
select sname from student
where sno in( select sno from enrol
group by sno
having avg(final) > (select avg(final) from enrol));


