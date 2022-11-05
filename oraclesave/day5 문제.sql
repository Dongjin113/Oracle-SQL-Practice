
문제1. idx에 p.k 를 부여하여 school을 만드시오.
create table school(
idx char(3) primary key,
s_name nvarchar2(10),
age number(3),
tel varchar2(20)
);

문제2. 레코드를 추가하시오.
insert into school(idx,s_name,age,tel) values ('101','둘리','12','010-5037-6133');
insert into school(idx,s_name,age,tel) values ('102','하니','15','011-1234-1212');
insert into school(idx,s_name,age,tel) values ('104','영심이','17','017-5555-0341');
insert into school(idx,s_name,age,tel) values ('105','young won','20','010-5555-6363');
insert into school(idx,s_name,age,tel) values ('107','대한민국','22','019-3245-1234');
insert into school(idx,s_name,age,tel) values ('109','아름이','25','070-1212-5555');
insert into school(idx,s_name,age,tel) values ('200','Choi Young','25','070-1212-5555');

문제3. 이름을 기준으로 내림차순 정렬하시오.
select * from school 
order by s_name desc;


문제4. 번호가  101, 104, 107 인 학생의 레코드를 출력하시오.
select * from school 
where idx in(101,104,107);


문제5. 105번의 이름을 영원으로 변경하시오.
update school set s_name = '영원' where idx = 105; 
select * from school;

문제6. 104번의 나이를 15살로 수정하시오.
update school set age = 15 where idx = 104;


문제7. 이름이 아름이인 학생의 전화번호를 삭제하시오.
update school set tel = '' where s_name = '아름이';


문제8. 전체 학생의 나이를 19살로 수정하시오.
update school set age = 19;
select * from school;

문제9. 102번 학생을 삭제하시오.
delete from school where idx = 102;


문제10. 전체 레코드를 삭제하시오.
delete from school;

--테이블 삭제 DDL 롤백이 안됌
--레코드 삭제 MDL 롤백이 됌

1) s_name, tel 의 값의 길이를 구하시오

select s_name, length(s_name), length(tel) 
from school;


2) 전체의 값을 하나의 컬럼에 나타내시오
select '번호:' || idx || ',이름:' || s_name || ',나이:' || age || ',전화번호:' ||tel as "학생정보"
from school;

create view v_school
as
select '번호:' || idx || ',이름:' || s_name || ',나이:' || age || ',전화번호:' ||tel as "학생정보"
from school;

select * from v_school;
select * from school;

--문자열 위치찾기
create view vv_school
as
select instr(학생정보,',',1) , instr(학생정보,',', 8), instr(학생정보,',', 15)from v_school;

select lower(s_name), upper(s_name), initcap(s_name) from school; 
-- lower 단어를 소문자로바꾸는것  upper 단어를 대문자로 바꾸는것 initcap 단어의 첫번째글자를 대문자로 바꾸는것

drop view v_school;

create view v_school
as
select lower(s_name)as "소문자", upper(s_name) as "대문자", initcap(s_name) as "첫글자" from school;

create view v12_school
as
select lower(s_name), upper(s_name), initcap(s_name) from school; --생성오류 컬럼명을 지정해줘야 생성가능

select * from v_school;

select replace(tel,'-',' ')from school; -- replace 는 문자열을 문자열로 변환하는 함수

select s_name, 
replace(lower(s_name), 'young' , '영'), 
replace(tel,'-',' ') 
from school; 

select tel,translate(Tel,'0123456789','영일이삼사오육칠팔구') 
from school;   --replace는 문자열을 한번에 바꾸지만 translate 는 한글자씩 바꿔줌

select tel, substr(tel,1,3), substr(tel,5,4), substr(tel,10,4) from school; --substr 1번째부터 3개의 값을 출력, 5번째부터 4개의 값을출력

select substr(tel,1,3) || substr(tel,5,4) || substr(tel,10,4) as "전화번호" from school
where tel is not null; 

select * from school;

create table t1
as
select substr(tel,1,3) || substr(tel,5,4) || substr(tel,10,4) as "전화번호" from school
where tel is not null; 

select * from t1;

select substr(tel,1,3) || '-'|| substr(tel,5,4) || '-' || substr(tel,10,4) as "전화번호" from school
where tel is not null; 

