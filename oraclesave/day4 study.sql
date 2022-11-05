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

select * from student s
join enrol e
on s.sno = e.sno;

--[T-SQL / PL-SQL]
select s.sno, sname, year, dept, cno, grade, midterm, final 
from student s, enrol e
where s.sno = e.sno;



create view v_student_enrol_course  --view 물리적으로 연결되어 있는 가상의 테이블  조건처리가능
 as                                   --1.복잡한쿼리를 단순화할때 만듬 2.필요한것만 보여주고싶을때 3.용도: 보안성, 편리성
--[ANSI-SQL]                             1.편리성 : 조인을 이용하여 view 테이블을 만들 수 있다. 2.보안성 : 원본테이블의 부분을 이용하여 view 테이블을 만들 수 있다.
select s.sno, sname, year, s.dept, c.cno, cname, grade, midterm, final , 
(midterm + final) as "합계", (midterm + final)/2 as "평균"
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
values('100','나연묵','4','컴퓨터');
insert into student7(sno,sname,year,dept)
values('200','이찬영','3','전기');
insert into student7(sno,sname,year,dept)
values('300','정기태','1','컴퓨터');
insert into student7(sno,sname,year,dept)
values('400','송병호','4','컴퓨터');
insert into student7(sno,sname,year,dept)
values('500','박종화','2','산공');

create view v_student7
as
select * from student7;

select * from v_student7;
select * from student7;

delete from v_student7 where sno=300;

create view v_join1     --겹치는 컬럼의 이름을 설정해주지 않으면 생성되지않음
as
select * from student s
join enrol e
on s.sno = e.sno;


drop view v_join2;
select * from v_join2;

create view v_join2 (고기,과자)
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

update v_join3 set s_sno = '700' where e_sno = '400'; --fk 제약조건이 걸려있어서 생성이안됌 fk 제약조건을 삭제후 재진행

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
update student set sname='하니' where sno='100';
select * from course;
select * from enrol;

create view v_join_se
as
select s.sno, sname, year , cno, grade from student s 
join enrol e 
on s.sno = e.sno;

select * from v_join_se;
update v_join_se set sname = '하니2' where sno ='100'; -- join이 되어 있는 경우 추가와 수정은 실행 되지 않는다. 하나의 테이블의 뷰는 가능하다
delete from v_join_se where sno='100';  -- view에서 삭제 되고 enrol 원본에서도 삭제됌 view에서 삭제시 엉뚱한결과를 초래할수 있다.


create view v_student88
as
select sno, sname from student;

select * from student;
select * from v_student88;

insert into v_student88(sno, sname) values('700','하늘이')
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
values('100','나연묵','4','컴퓨터');
insert into student(sno,sname,year,dept)
values('200','이찬영','3','전기');

insert into course(cno,cname,credit,dept,prname)
values('C413','데이터베이스','3','컴퓨터','이성호');

insert into enrol(sno,cno,grade,midterm,final) --fk 제약조건으로인해 100 과 c413을 추가하지않으면 등록이 되지않음
values('100','C413','A',90,95);



select * from student;
delete from student where sno='100'; --fk 제약조건으로 인해 삭제불가
delete from student where sno='200'; --등록테이블에 아직등록되지 않아 삭제가 잘됌

select * from course;
select * from enrol;
