create table student2(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) 
)

insert into student2(sno,sname,year,dept) values('100','나연묵','4','컴퓨터');
insert into student2(sno,sname,year,dept) values('200','이찬영','3','전기');
insert into student2(sno,sname,year,dept) values('300','정기태','1','컴퓨터');
insert into student2(sno,sname,year,dept) values('400','송병호','4','컴퓨터');
insert into student2(sno,sname,year,dept) values('500','박종화','2','산공');


1) 테이블 student2 의 모든 레코드를 출력하시오.
select sno,sname,year,dept from student2;
select * from student2;

2) student2테이블에서 sno 와 sname 을 나타내시오.
select sno, sname from student2;

3) sno 가 100 인 학생을 출력하시오.
select * from student2 where sno = 100;

4) sno가 300인 학생의 sno 와 year 을 출력하시오.
select sno,year from student2 where sno=300;

5) sno가 300 또는 400인 학생의 레코드를 출력하시오.
select * from student2 where sno =300 or sno=400;
select * from student2 where sno in('300' , '400');

6) dept가 '컴퓨터' 이고 year 이 '4' 학년인 학생을 출력하시오.
select * from student2 where dept ='컴퓨터' and year='4';

7) sno 가 300 이 아닌 학생을 출력하시오.
select * from student2 where sno != 300;

8) 700, 하니 , 4, 전산 을 추가 하시오.
insert into student2(sno,sname,year,dept) values('700', '하니', '4', '전산');

9) 800, 둘리 를 추가하시오.
insert into student2(sno,sname) values('800', '둘리');

10) 영희 , 900, 3 을 추가하시오.
insert into student2(sno,sname,year) values('900', '영희', '3');

11) 학과가 전산 또는 4학년 인 학생을 삭제하시오.
delete from student2 where dept = '전산' or year = '4';

12) 컴퓨터과 학생의 학생 수를 구하시오.
select count(dept) from student2 where dept = '컴퓨터';

13) sno과 sname을 나타내시오.
단; 학번 과 이름의 필드 명을 학번, 이름으로 보일수 있도록 하시오.
select sno as "학번", sname as "이름" from student2;

14) 학년이 3학년이고 학과가 컴퓨터인 학생의 이름과 학년을 나타내시오.
select sname as "이름", year as "학년" from student2 where year=3 and dept='컴퓨터';

15) 학년이 2학년이고 이름에 "영" 이란 글자를 포함하고 있는 학생의 이름과 학년을 나타내시오
select sname as "이름", year as "학년" from student2 where sname like '%영%' and year = '2';

16) 레코드 전체 삭제
delete from student2;

17) 테이블을 삭제하시오. ( 제거하시오.)
drop table student2;