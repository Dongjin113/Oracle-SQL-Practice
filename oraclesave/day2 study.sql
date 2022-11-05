create table T0517(
sno number(3),
sname nvarchar2(5)
);

insert into T0517 (sno,sname) values(001,'영심이');
insert into T0517 (sno,sname) values('8106','영심이');

select * from T0517;



create table T0518(
sno char(3),
sname nvarchar2(5)
);

insert into T0518 (sno,sname) values('001','영심이');

select * from T0518;

drop table t0517; --테이블 자체를 없애는것
desc t0517; 

delete from t0518; --레코드 삭제
desc t0518;

create table T0519(
sno number(3,1), -- 실수표현 (정수2자리, 소수 1자리) 앞의 3은 전체길이, 뒤이 1은 소숫점 1자리
sname nvarchar2(5)
);

insert into T0519 (sno,sname) values(99.9,'영심이');
insert into T0519 (sno,sname) values(100.1,'영심이'); -- 에러발생
select * from T0519;

create table T0518(
sno char(3),
sname nvarchar2(5)
);
select * from T0518;
insert into t0518(sno, sname) values('A02', '바다');
insert into t0518 values('A01', '하늘이');
insert into t0518(sno) values('A03');
insert into t0518 values('A04','');
insert into t0518 values('A05',' ');
insert into t0518(sname, sno) values('둘리', 'A06');

/*문자는 작은따음표 '', 숫자는 그냥
char number 차이*/

update T0518 set sname = '지솔' where sno = 'A01'   --값을 변경


create table T0517(
sno char(3),
sname nvarchar2(5),
age number(3)
);
select * from t0517;
--솔라 ,21로바꾸기

insert into t0517(sno, sname, age) values ('B01','문별이',17);
insert into t0517(sno, sname, age) values ('B02','효리',22);
insert into t0517(sno, sname, age) values ('B03','효리',24);


update T0517 set sname = '솔라' , age = 21 where sno = 'B01';
update T0517 set age = '23' where sname = '효리';
update T0517 set age = '23' where sname = '효리' or sname = '솔라';
update T0517 set age = '23' where sname = '효리' or sno = 'B04';
update T0517 set age = '24' where sno in('B01','B03'); --in이 or연산을해줌
update T0517 set age = age+2;  

insert into t0517(sno, sname, age) values('A01','하나','17');
insert into t0517(sno, sname, age) values('A02','두리','15');
insert into t0517(sno, sname, age) values('A03','마리','13');
select sno, sname, age from t0517 where sno= 'A01' or sno = 'A02'; --둘중하나 만족하는것
select sno, sname, age from t0517 where sno= 'A01' and sname = '하나'; --둘다 만족하는것
select sno, sname, age from t0517 where sno like 'A%'; -- A%로시작되는것  
select sno, sname, age from t0517 where sno like '%0%'; -- 0가들어간 모든값을 찾는것
select sno, sname, age from t0517 where sno like '_0%'; -- _0% 두번째글자가 영인것을 찾는것 
select sno, sname, age from t0517 where sno like '%리'; -- %리 마지막글자가 리인것을 찾는것
select sno, sname, age from t0517 where sno like '%A%' or sname like '%리%';
select sno, sname, age from t0517 where age >= 20; 
select sno, sname, age from t0517 where age < 20; 

select sno, sname, age from t0517 where age = 23;
select sno, sname, age from t0517 where age != 23;
select sno, sname, age from t0517 where age >= 23;
select sno, sname, age from t0517 where age < 15;
select sno, sname, age from t0517 where age >= 15 and age < 23;
select * 
from t0517 
where sno like '%A%'
order by age asc; -- A가들어가는 서식의 나이를 오름차순으로 정렬하시오