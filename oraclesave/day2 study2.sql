drop  table enrol;
drop  table student;
drop  table course;

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 primary  key(sno) );

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno)); -- 이름을 부여한것
 
 create table student(
 sno varchar2(3) not null  primary  key ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
);

/*기본키 (p.k)     
1. 중복불가
2. null 사용불가
3. 테이블에 하나만 존재
a 001 = a001
a 002 = a002
b 001 = b001
b 002 = b002
*/
drop table student27;

create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno,sname)); -- 두개의 pk부여 sno,sname 두개의 동일값있을시 에러발생
 
 insert into student(sno,sname,year,dept) values ('100','나연묵','4','컴퓨터');
 insert into student(sno,sname,year,dept) values ('100','둘리','4','컴퓨터');
 insert into student(sno,sname,year,dept) values ('200','나연묵','4','컴퓨터');
 insert into student(sno,sname,year,dept) values ('200','나연묵','3','컴퓨터1'); -- 에러발생
 select * from student;
 
  create table student(
 sno varchar2(3) not null  primary  key ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
);

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

-- sno가 100번인 학생의 학번과 이름을 출력하시오
select sno,sname from student where sno = '100';
-- sno가 100번 또는 sno가 300인 학생의 학번과 레코드를 출력하시오
select * from student where  sno = '100' or sno = '300';
select * from student where  sno in('100','300');
-- 이름에 '기' 란 글자가 포함되어있는 컴퓨터과 학생의 레코드를 출력하시오
select * from student where sname like '%기%' and dept = '컴퓨터' ;
-- 학과가 전기과 또는 항공과인 학생을 출력하시오
select sno,sname,year,dept from student where dept = '전기' or dept = '산공';
select sno,sname,year,dept from student where dept in('전기','산공');

--컴퓨터과가 아닌 학생의 이름과 학과를 출력하시오
select sno,sname,year,dept from student where dept != '컴퓨터';
select sno,sname,year,dept from student where dept <> '컴퓨터';

--학과가 전기과 또는 항공과가 아닌 학생의 레코드를 출력하시오
select sno,sname,year,dept from student where dept <> '전기' and dept <> '산공';
select sno,sname,year,dept from student where dept != '전기' and dept != '산공';
select sno,sname,year,dept from student where dept not in('전기','산공');
select sno,sname,year,dept from student where not (dept ='전기'or dept ='산공');

--이름을 기준으로 내림차순 정렬하시오.
select * from student order by sname desc;
--학년을 기준으로 내림차순 후 번호를 이용하여 오름차순 정렬하시오.
select * from student order by year desc , sno asc; --내림차순 desc 오름차순 asc 

-- 100번 학생의 이름을 나현묵으로 변경하시오
update student set sname = '나현묵' where sno = '100';
-- 전기과를 전자공학과로 변경하시오.
update student set dept = '전자공학' where dept = '전기';
--400번 학생의 레코드를 이름은 둘리, 학년은 5학년으로 변경하시오
update student set sname = '둘리' , year = 5 where sno = 400;
--600번 영심이, 5학년, 산공과로 추가 하시오.
insert into student (sno,sname,year,dept) values ('600','영심이','5','산공');
--이름의 시작이 '박'으로 시작하는 학생을 삭제하시오.
delete from student where sname like ('박%');

 



select * from student;