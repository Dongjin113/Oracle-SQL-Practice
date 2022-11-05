/*문제
table 명 : school
sno 기본키 : 문자 3자리, sname (문자10), email(문자30)
*/

drop table school;

create table school(
sno char(3) not null Primary key, --기본키
sname nvarchar2(10), --가변기
email varchar(30)
);

insert into school (sno, sname, email) values('101','영심이','qwer@naver.com');
insert into school (sno, sname, email) values('102','둘리','asdfa@naver.com');
insert into school (sno, sname, email) values('103','도우너','wqer@naver.com');

select sno, sname, email from school;

delete from school where sno='102';

select * from school where sno='102';

update school set sname='' where sno = '101'; --101번을 공백문자로 바꿔줘라 ''는 null로 업데이트 ' '는 공백문자로 업데이트

select * from school;

select * from school where sname is null; --오라클에서 null 값을 비교할때는 is를 사용
select * from school where sname is not null; --null 값이 아닌것을 출력하시오

/*오라클 한글 사용시 char(3) 3을 한글 한글자로 잡아야함
nchar(3) 가,나,다 세글자 사용가능
char 기본키 공백을 가지고 있는것  1,2,공백  (3) 
varchar 가변키 공백을 없애줌     1,2,없음  (3)
조건은 항상 where 
select ~~~ from 이후는 조건

select sno, sname, email from school where sno='101'; 학번으로검색
select sno, sname, email from school where sname='영심이'; 이름으로검색
select sno, sname from school where sname='영심이'; 이름과 학번만 출력하고싶을때 이메일만 뺴면됌

*/