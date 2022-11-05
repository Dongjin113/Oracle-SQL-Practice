drop table usertbl;
drop table buytbl;

create table userTBL(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);


create table buyTBL(
userName nchar(3) not null REFERENCES userTBL(userName),
prodName nchar(3) not null,
price int not null,
amount int not null
);


insert into userTBL (userName, birthyear, addr, mobile) values ('이승기', 1987, '서울', '011-111-1111');
insert into userTBL (userName, birthyear, addr, mobile) values ('김경호', 1971, '전남', '019-333-3333');
insert into userTBL (userName, birthyear, addr, mobile) values ('윤종신', 1969, '경남', '안 남김');
insert into userTBL (userName, birthyear, addr, mobile) values ('임재범', 1963, '서울', '016-666-6666');
insert into userTBL (userName, birthyear, addr, mobile) values ('은지원', 1978, '경북', '011-888-8888');
insert into userTBL (userName, birthyear, addr, mobile) values ('조관우', 1965, '경기', '018-999-9999');
insert into userTBL (userName, birthyear, addr, mobile) values ('김범수', 1979, '경남', '011-222-2222');
insert into userTBL (userName, birthyear, addr, mobile) values ('조용필', 1950, '경기', '011-444-4444');
insert into userTBL (userName, birthyear, addr, mobile) values ('바비킴', 1973, '서울', '010-000-0000');
insert into userTBL (userName, birthyear, addr, mobile) values ('성시경', 1979, '경남', '안 남김');
?


insert into buyTBL(userName, prodName, price, amount ) values ('김범수', '운동화', 30, 2);
insert into buyTBL(userName, prodName, price, amount) values ('김범수', '노트북', 1000, 1);
insert into buyTBL(userName, prodName, price, amount) values ('조용필', '모니터', 200, 1);
insert into buyTBL(userName, prodName, price, amount) values ('바비킴', '모니터', 200, 5);
insert into buyTBL(userName, prodName, price, amount) values ('김범수', '청바지', 50, 3);
insert into buyTBL(userName, prodName, price, amount) values ('바비킴', '메모리', 80, 10);
insert into buyTBL(userName, prodName, price, amount) values ('성시경', '책', 15, 5);
insert into buyTBL(userName, prodName, price, amount) values ('은지원', '책', 15, 2);
insert into buyTBL(userName, prodName, price, amount) values ('은지원', '청바지', 50, 1);
insert into buyTBL(userName, prodName, price, amount) values ('바비킴', '운동화', 30, 2);
insert into buyTBL(userName, prodName, price, amount) values ('은지원', '책', 15, 1);
insert into buyTBL(userName, prodName, price, amount)  values ('바비킴', '운동화', 30, 2);

select * from userTBL;
select * from buyTBL;

1. userTBL 과 buyTBL 을 이용하여  고객이름,  연락처, 구매물건, 단가, 수량, 구매 금액을  구하시오.
select u.userName "고객이름", mobile "연락처", prodName "구매물건", price "단가", amount"수량", (price * amount) "구매금액"
from userTBL u
join buyTBL b
on  u.userName = b.userName;


create view v_userbuyTBL
as
select u.userName "고객이름", mobile "연락처", prodName "구매물건", price "단가", amount"수량", (price * amount) "구매금액"
from userTBL u
join buyTBL b
on  u.userName = b.userName;

2. userTBL 과 buyTBL 을 이용하여 고객별  구매금액의 총합을 구하시오.
select u.username ,sum(price * amount) 
from usertbl u
join buytbl b
on u.username = b.username
group by u.username;

select 고객이름, sum(구매금액) "구매금액 총합"
from v_userbuyTBL
group by 고객이름;





3. 고객별 구매금액의 총합이 고객별 구매금액총합의 평균 보다 많은 사람만 출력하시오.
select u.username from usertbl u
join buytbl b
on u.username = b.username
group by u.username
having sum(price * amount) > (select avg(sum(price * amount)) from buytbl group by username);



select username, sum(price*amount)
from buytbl
group by username
having sum(price*amount) > (select avg(sum(price * amount)) from buytbl group by username);

4. 회원가입된 고개의 수는 몇명인가 ?
select count(*)"고객" from usertbl;

5. 하나의 물건이라도 구매한 적인 있는 고객의 수는 몇명인가?
select username, count(distinct username) from buytbl;

6. 서울과 경기도에 살고 있는 고객은 몇명인가?
select addr, count(*) 
from usertbl
group by addr 
having addr in('서울' , '경기');

select addr, count(*) 
from usertbl
where addr in('서울' , '경기')
group by addr;

select count(*) 
from usertbl
where addr in('서울' , '경기');

7. 운동화를 구매한 사람의 이름과 연락처를 출력하시오.
select distinct u.username, mobile 
from usertbl u
join buytbl b
on u.username = b.username
where prodname = '운동화';

select username, mobile 
from usertbl
where username in (
select username from buytbl
where prodname = '운동화');


select * from vv_v_userbuytbl;
select * from v_userbuytbl;

update v_userbuytbl set 연락처 = '010-00-0000' where 고객이름 = '김범수'; --join된 뷰는 업데이트를 할수 없다.

create view vv_v_userbuytbl (userName,tel)
as
select 고객이름,연락처 from v_userbuytbl;





create table userTBL2(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

insert into userTBL2 (userName, birthyear, addr, mobile) values ('A승기', 1987, '서울', '011-111-1111');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('A경호', 1971, '전남', '019-333-3333');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('A종신', 1969, '경남', '안 남김');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B재범', 1963, '서울', '016-666-6666');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B지원', 1978, '경북', '011-888-8888');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B관우', 1965, '경기', '018-999-9999');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B범수', 1979, '경남', '011-222-2222');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C용필', 1950, '경기', '011-444-4444');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C비킴', 1973, '서울', '010-000-0000');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C시경', 1979, '경남', '안 남김');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('D심이', 2000, '서울', '안 남김');

create table userTBL1(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

insert into userTBL1 (userName, birthyear, addr, mobile) values ('F승기', 1987, '서울', '011-111-1111');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F경호', 1971, '전남', '019-333-3333');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F종신', 1969, '경남', '안 남김');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F재범', 1963, '서울', '016-666-6666');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F지원', 1978, '경북', '011-888-8888');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G관우', 1965, '경기', '018-999-9999');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G범수', 1979, '경남', '011-222-2222');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G용필', 1950, '경기', '011-444-4444');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G비킴', 1973, '서울', '010-000-0000');

select * from usertbl;
select * from usertbl1;
select * from usertbl2;

--insert ~ select 구문
insert into usertbl(userName, birthyear, addr, mobile)
select username, birthyear, addr, mobile from usertbl1;

insert into usertbl(userName, birthyear, addr, mobile)
select username, birthyear, addr, mobile from usertbl2;

insert into usertbl(userName, birthyear, addr, mobile)
select username, birthyear, addr, mobile from usertbl3;

create table userTBL3(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

insert into userTBL3 (userName, birthyear, addr, mobile) values ('박승기', 1987, '서울', '011-111-1111');
insert into userTBL3 (userName, birthyear, addr, mobile) values ('박경호', 1971, '전남', '019-333-3333');

--원본 테이블
create table userTBL(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

--트리거 실행 테이블
create table TriuserTBL(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12),
  delDate DATE
);


create trigger del_userTB
after delete
on userTBL
for each row
begin
    insert into  TriuserTBL
    values(:old.userName, :old.birthyear, :old.addr, :old.mobile, sysdate());  --old 메모리가 삭제되기전에 메모리에 담고있는것
end;


create trig0er update_userTB
after update
on userTBL
for each row
begin
    insert into  TriuserTBL
    values(:old.userName, :old.birthyear, :old.addr, :old.mobile, sysdate());  --old 메모리가 삭제되기전에 메모리에 담고있는것
end;





update userTBL set addr='독도'
where username like '%이%';


select * from userTBL;
delete from userTBL where username = 'D심이';
delete from userTBL where username like'F%';
select * from TriuserTBL;

select * from student;



create table Tristudent(
  sno Varchar2(3) primary key,
  sname nvarchar2(10),
  year varchar2(10) ,
  dept nvarchar2(10),
  delDate DATE
);

drop trigger del_student;

create trigger del_student
after delete
on student
for each row
begin
    insert into Tristudent
    values (:old.sno, :old.sname, :old.year, :old.dept, sysdate());
end;

drop 

 delete from student
 where sno='600';

select * from student;
select * from Tristudent;

drop table Tristudent;

create table Tristudent1(
  sno Varchar2(3) primary key,
  updateDate DATE
);

create or replace trigger T_student
after update 
on student
for each row
begin
    insert into Tristudent1 
    values(:old.sno, sysdate());
end;

create or replace trigger T_student
after update 
on student
for each row
begin
    insert into Tristudent1 
    values(:old.sno, sysdate());
end;

select * from Tristudent1;
select * from student;

update student set sname = '정성태'
where sno='300';


select sysdate
from dual;
W
select sysdate + 10
from dual;


select * from student s, enrol e, course c
where s.sno = e.sno and e.cno = c.cno;

    
create view v_join33
as
select s.*, c.cno, cname, credit, grade, midterm, final from student s, enrol e, course c
where s.sno = e.sno and e.cno = c.cno;

select * from v_join33;