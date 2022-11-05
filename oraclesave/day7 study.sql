1. 자료 와 정보 
자료를 가공한것이 정보?

2. 오라클에서 스키마란?
스키마 = 데이타베이스 = 사용자 이름 (=저장소)

3. 제약조건 5가지 한번 적어보세요 
--pk 제약조건
--fk 제약조건
--unique 제약조건
--not null 제약조건
--check 제약조건

4. view 의 특징 
--물리적으로 연결되어있는 가상의 테이블
보안성 , 편리성
논리적인테이블

5. 트랜젝션이란 ? 
작업처리의 단위

6. DBA 는 어떤일을 하는 사람일까요?
데이타베이스 관리자 (백업, 복원, 계정생성, 장치관리)

7. 트리거 는 어떤 일을 하는것일까요?
테이블에 부착하여 update delete 작업이 발생되면 insert가 실행된다

8. F.K 에 대하여 설명하시오 
다른테이블에 pk를 참조하는 칼럼

9. char(3) 과 varchar2(3) 의 차이를 설명하시오. 
가변길이 

10. null 이란 ?
0도 공백도아닌 알수없는값 연산이 불가


C R U D

select * from student;

set serveroutput on -- 출력을 시작해라.


drop procedure ps_select_student_count;

create procedure ps_select_student_count
as
var1 int;
var2 int;
begin
  select count(*) into var1 from student;
  select count(*) into var2 from student where dept='컴퓨터';
  DBMS_OUTPUT.PUT_LINE('전체:' || var1 || ',조건:' || var2) ; --출력라인
end;

EXECUTE ps_select_student_count;

select * from student;
desc student;

create or replace procedure sp_student_insert --생성을하던지 있으면 수정하던지
(
sno varchar2,
sname nvarchar2,
dept nvarchar2,
year char
)
is
begin
  insert into student(sno, sname, dept, year)
  values(sno,sname,dept,year);
end;

EXECUTE sp_student_insert('901','영심이','전산','3');
EXECUTE sp_student_insert('902','하늘이','물리','2');


select * from student;

create or replace procedure sp_student_insert --생성을하던지 있으면 수정하던지
(
sp_sno varchar2,
sp_sname nvarchar2,
sp_dept nvarchar2,
sp_year char
)
is
begin
  insert into student(sno, sname, dept, year)
  values(sp_sno,sp_sname,sp_dept,sp_year);
end;

EXECUTE sp_student_insert('903','지솔','화학','2');


create or replace procedure sp_student_update --생성을하던지 있으면 수정하던지
(
sp_sno varchar2,
sp_sname nvarchar2,
sp_dept nvarchar2,
sp_year char
)
is
begin
  update student set sname = sp_sname , dept = sp_dept , year = sp_year 
  where sno = sp_sno;
end;

EXECUTE sp_student_update('903','지솔','화학','3');


create or replace procedure sp_student_delete --생성을하던지 있으면 수정하던지
(
sp_sno varchar2
)
is
begin
  delete from student where sno = sp_sno;
end;

EXECUTE sp_student_delete('902');

create or replace procedure sp_student_select1 --생성을하던지 있으면 수정하던지
as
var1 varchar2(10);
var2 varchar2(30);
var3 varchar2(30);

begin
  select sno, sname, dept into var1, var2, var3 from student where sno = 100;
  DBMS_OUTPUT.PUT_LINE('학생정보 : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select1;

create or replace procedure sp_student_select1 --생성을하던지 있으면 수정하던지
(
 strSno in varchar2
)
as
var1 varchar2(10);
var2 varchar2(30);
var3 varchar2(30);

begin
  select sno, sname, dept into var1, var2, var3 from student where sno = strSno;
  DBMS_OUTPUT.PUT_LINE('학생정보 : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select1('300');


create or replace procedure sp_student_select2 --생성을하던지 있으면 수정하던지
( 
 strSno in varchar2,
 strName in varchar2
)
as
var1 varchar2(10);
var2 varchar2(30);
var3 varchar2(30);

begin
  select sno, sname, dept into var1, var2, var3 from student 
  where sno = strSno or sname = strName;
  DBMS_OUTPUT.PUT_LINE('학생정보 : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select2('200','박종화');

create or replace package pkg is
    type t_ref is ref cursor;
    end;
    
    create or replace procedure sp_student_select3 --생성을하던지 있으면 수정하던지
( 
 ret out pkg.t_ref,           --값을 빼는것
 strSno in varchar2,        --변수를 받아오는것
 strName in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sno = strSno or sname = strName;
end;

execute sp_student_select3('200','박종화'); -- 프로시저 sp_student_select3 에서 우츨클릭 실행 IN으로 잡힌부분에 입력값을 입력후 확인을 누르면 출력변수에 값이나옴

create or replace procedure sp_student_select4 --생성을하던지 있으면 수정하던지
( 
 ret out pkg.t_ref           --값을 빼는것
)
is
begin
  open ret For
    select sno, sname, dept from student;
end;

create or replace procedure sp_student_select5 --생성을하던지 있으면 수정하던지
( 
 ret out pkg.t_ref,           --값을 빼는것
 strSname1 in varchar2,
 strSname2 in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sname like strSname1 or dept like strSname2;       --like 뒤는 변수라 ''를 붙히지 않음
end;

create or replace procedure sp_student_select6 --생성을하던지 있으면 수정하던지
( 
 ret out pkg.t_ref,           --값을 빼는것
 strSname1 in varchar2,
 strSname2 in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sname like '%'||strSname1||'%' or sname like '%'||strSname2||'%';       --like 뒤는 변수라 ''를 붙히지 않음
end;

create or replace procedure sp_insert
(
  i_sno varchar2,
  i_sname varchar2,
  i_dept varchar2,
  i_year varchar2
)
is
begin
insert into student(sno, sname, dept, year)
values(i_sno, i_sname, i_dept, i_year);
end;

execute sp_insert('911','가나다','전산','4');
select * from student;

create or replace procedure sp_update
(
  i_sno varchar2,
  i_sname varchar2)
is
begin
update student set sname= i_sname
where sno = i_sno;
end;

execute sp_update('100','민수')
select * from student;

create or replace procedure sp_delete
(
  i_sno varchar2)
is
begin
delete from student 
where sno = i_sno;
end;

execute sp_delele('911')
select * from student;

create or replace procedure sp_select1 
as
var1 varchar2(10);
var2 varchar2(10);
var3 varchar2(10);
begin
 select sno, sname, dept into var1,var2,var3 from student 
 where sno = 100;
 -- 하나의 라인만 출력이 가능하다.
 DBMS_OUTPUT.put_line(var1 || var2 || var3);
 end;
 
 execute sp_select1;

create or replace procedure sp_select2
(
strSno in varchar2 --입력변수
)
as
var1 varchar2(10); --출력변수
var2 varchar2(10);
var3 varchar2(10);
begin
 select sno, sname, dept into var1,var2,var3 from student 
 where sno = strSno;
 -- 하나의 라인만 출력이 가능하다.
  DBMS_OUTPUT.put_line('하나의 라인만 출력됩니다.');
 DBMS_OUTPUT.put_line(var1 || var2 || var3); --레코드 갯수만 하나만 출력될뿐 다른출력은 가능
   DBMS_OUTPUT.put_line('출력성공 !!!');
 end;
 
  execute sp_select2(100);
  
  
  create or replace procedure sp_select3
(
 ret OUT pkg.t_ref,
 strSno in varchar2 --입력변수
)
is
begin
open ret for
 select sno, sname, dept from student 
 where sno = strSno;
 DBMS_OUTPUT.put_line('출력성공 !!!');
 end;
 
 execute sp_select2;
 
 create or replace procedure sp_select4
(
 ret OUT pkg.t_ref,
 strDept in varchar2 --입력변수
)
is
begin
open ret for
 select sno, sname, dept from student 
 where dept like strDept;
 DBMS_OUTPUT.put_line('출력성공 !!!');
 end;
 
 create or replace procedure sp_select5
(
 ret OUT pkg.t_ref,
 strDept in varchar2 --입력변수
)
is
begin
open ret for
 select sno, sname, dept from student 
 where dept like '%'|| strDept ||'%';
 DBMS_OUTPUT.put_line('출력성공 !!!');
 end;
 
 select * from bigdata; --테이블 우측클릭 데이터 임포트 구분자 ; 빅데이타 >> SQL 기본정보를 사용하여 테이블을생성
 
 CREATE TABLE "SYSTEM"."Test001" 
   (	"EMP_NO" NUMBER(7,0), 
	"BIRTH_DATE" DATE, 
	"FIRST_NAME" VARCHAR2(26 BYTE), 
	"LAST_NAME" VARCHAR2(26 BYTE), 
	"GENDER" VARCHAR2(26 BYTE), 
	"HIRE_DATE" DATE
   )
   
   select * from "SYSTEM"."Test001";
 
  CREATE TABLE Test002 
   (	"EMP_NO" NUMBER(7,0), 
	"BIRTH_DATE" DATE, 
	"FIRST_NAME" VARCHAR2(26 BYTE), 
	"LAST_NAME" VARCHAR2(26 BYTE), 
	"GENDER" VARCHAR2(26 BYTE), 
	"HIRE_DATE" DATE
   )
   select * from Test002;
   
     select count(*) from bigdata;
   --생년월일에서 값 5로 시작되는 사람을 출력하시오.
   select count(*) from bigdata 
   where BIRTH_DATE like '52%';
   
   --52년생 데이터를 test 002에 추가하시오
   insert into test002 select * from bigdata 
   where BIRTH_DATE like '52%';
   
   -- BIRTH_DATE 를 년월일로 나타내시오
   select substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" from Test002;
   
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    HIRE_DATE
    from Test002;
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '여성'
     when GENDER = 'M' then '남성'
     else '기타'
    end as "성별",
    HIRE_DATE
    from Test002;
    
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    HIRE_DATE,
    CASE
     when substr(HIRE_DATE,1,2)>=90 then '90년도 입사'
     when substr(HIRE_DATE,1,2) < 90 then '80년도 입사'
    end as "입사구분"
    from Test002;
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '여성'
     when GENDER = 'M' then '남성'
     else '기타'
    end as "성별",
    HIRE_DATE,
    CASE
     when HIRE_DATE like '8%' then '80년도 입사'
     when HIRE_DATE like '9%' then '90년도 입사'
     else '기타'
    end as "입사구분"
    from Test002;
    
    
    create view v_bigdata1
    as
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '년' || substr(BIRTH_DATE,4,2) || '월' || substr(BIRTH_DATE,7,2) || '일' as "생년월일" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '여성'
     when GENDER = 'M' then '남성'
     else '기타'
    end as "성별",
    HIRE_DATE,
    CASE
     when HIRE_DATE like '8%' then '80년도 입사'
     when HIRE_DATE like '9%' then '90년도 입사'
     else '기타'
    end as "입사구분"
    from Test002;
    
    select 성별, translate(count(성별),'025','공이오') as 인원수 from v_bigdata1
    group by 성별;
    
    
    select first_name "이름", length(first_name) "길이" from v_bigdata1
    order by length(first_name) asc;
    
    select first_name "이름", length(first_name) "길이" from v_bigdata1
    order by 길이 desc;
    
    select rpad(upper(first_name),20,'#') "이름", length(first_name) "길이" from v_bigdata1
    order by 길이 desc;
    
    select Ltrim('  1234   ') as "값" , trim('  1234   ') as "값2", rtrim('  1234   ') as "값3" from dual; --Ltrim 좌측공백만 제거 trim 양쪽공백을 제거
    
    select ceil (4.1) , ceil (4.5) , ceil (4.0), ceil(4.0000000001) --4보다 크면 무조건 올림
    from dual;
    
    select floor (4.9999999) , floor (4.5) , floor (4.0), floor(4.0000000001) --4보다 크면 무조건 내림
    from dual;
    
    select round(4.7) , round(4.5) , round(4.1) --반올림
    from dual;

    select * from bigdata;
    
    
    create table t_bigdata(
    "EMP_NO" NUMBER(7,0), 
	"BIRTH_DATE" DATE, 
	"FIRST_NAME" VARCHAR2(26 BYTE), 
	"LAST_NAME" VARCHAR2(26 BYTE), 
	"GENDER" VARCHAR2(26 BYTE), 
	"HIRE_DATE" DATE,
    delDate DATE
);

   
    create or replace trigger del_bigdata
    after delete
    on bigdata
    for each row
    begin insert into t_bigdata
    values(:old.EMP_NO, :old.BIRTH_DATE, :old.FIRST_NAME, :old.LAST_NAME, :old.GENDER, :old.HIRE_DATE, sysdate() );
    end;
    
    delete from bigdata where EMP_NO < 10006 ;
    
    select * from bigdata;
    select * from t_bigdata;
   