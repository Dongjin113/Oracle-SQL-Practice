
create table user1(
 id nchar(10),
 name varchar(20)
);

insert into user1(id,name) values('ppk','너구리');
select * from user1;

create table pk_user1(
id nchar(10) primary key,
name varchar(20)
);

insert into user1(id,name) values('ppk','너구리');
insert into user1(id,name) values('ppk','너구리'); -- 중복
insert into user1(id,name) values('','너구리'); --not null null값이 들어올수 없다

create table pk_user2(
id nchar(10) ,
name varchar(20),
primary key (id)
);

insert into pk_user2(id,name) values('ppk','너구리');
insert into pk_user2(id,name) values('ppk','너구리'); -- 중복
insert into pk_user2(id,name) values('','너구리'); --not null null값이 들어올수 없다

create table pk_user3(
id nchar(10) ,
name varchar(20),
constraint pk_user3_1 primary key (id)  --constrinat 제약조건의 이름을 pk_user3_1 로만들겠다.
);

create table pk_user4(
id nchar(10) ,
name varchar(20),
constraint pk_user3_2 primary key (id, name)  --두개를 합쳐서 pk를만든다
);

insert into pk_user4(id,name) values('ppk','너구리1');
insert into pk_user4(id,name) values('ppk','너구리2'); 
insert into pk_user4(id,name) values('ppk','너구리1'); -- 중복 제약 조건 두개가 똑같으면 들어올수 없다
insert into pk_user4(id,name) values('ppk',''); --not null null값이 들어올수 없다

create table user11(
 id nchar(10),
 name varchar(20) not null
);

create table user11(
 id nchar(10),
 name varchar(20),
 constraint user11_user3_1 not null (id) --이런것은 안됌 not null 조건은 무조건 칼럼옆에다가 써야함 값을 필수로 받아야한다 = not null 제약조건
);              --null = 0도 무엇도아닌 모르는값

desc user11;

insert into user11(id,name) values('ppk','너구리');
insert into user11(id,name) values('ppk','');


create table user1(
 id nchar(10),
 name varchar(20)
);

create table pk_user1(
id nchar(10) primary key,
name varchar(20)
);
desc pk_user1;


create table fk_user11(
 id nchar(10)not null,
 name varchar(20) not null,
foreign key(id) references pk_user1(id)  --user1의 id를 참조하고싶은것
); -- user1 의 id가 pk가아니어서 안된다는 오류를 출력 pk가 있는 값을 참조해야함

drop table fk_user11;
drop table pk_user1;

create table pk_user1(
 id nchar(10) primary key,
 name varchar(20)
 );
 

create table fk_user11(
 id1 nchar(10)not null,
 age number(3) ,
foreign key(id1) references pk_user1(id)  --user1의 id를 참조하고싶은것
);

insert into pk_user1 (id,name) values('ppk','너구리');
insert into fk_user11 (id1,age) values('ppk','17');
insert into fk_user11 (id1,age) values('ppk2','17'); -- 참조오류 발생 pk값에 들어가있는 id값이 무조건들어가야함 ppk 아이디값이 없어서 들어가지않음
insert into pk_user1 (id,name) values('ppk2','영심이'); -- ppk2를 추가해서 fk_user11 의 ppk2값을 넣을수 있게됌

select * from fk_user11;

create table uk_user1(   --유니크제약조건 중복은 안되지만 null값은 들어가진다
 id nchar(10) unique,
 name varchar(20)
 );
 
insert into uk_user1 (id,name) values('ppk','영심이');
insert into uk_user1 (id,name) values('ppk','영심이'); -- 동일값을 넣었다고 값 추가가 안됌
insert into uk_user1 (id,name) values('','영심이'); --null값은 잘들어옴
insert into uk_user1 (id,name) values('','하늘이');
select * from uk_user1;


create table uk_user2(   --unique 제약조건에 not null을 넣으면 pk와 같아진다  unique 제약조건은 null값을 받기위해 사용
 id nchar(10) not null unique,
 name varchar(20) not null unique
 );
 
  
insert into uk_user2 (id,name) values('ppk','영심이');
insert into uk_user2 (id,name) values('ppk','영심이'); -- 동일값을 넣었다고 값 추가가 안됌
insert into uk_user2 (id,name) values('','영심이'); 
insert into uk_user2 (id,name) values('','하늘이');

create table ck_user2(   
 id nchar(10) not null unique,
 loc varchar(20) not null check (loc in('서울','기타')) -- 서울과 기타가 아니면 오류가나옴
 );
 
insert into ck_user2 (id,loc) values('ppk','서울');
insert into ck_user2 (id,loc) values('ppk','경기'); -- 체크제약조건

select * from ck_user2;

create table ck_user3(   
 id nchar(10) not null unique,
 loc varchar(20), 
 check (loc in('서울','기타')) -- 서울과 기타가 아니면 오류가나옴
 );
 
 insert into ck_user3 (id,loc) values('ppk','서울');
insert into ck_user3 (id,loc) values('ppk','경기'); -- 체크제약조건
 insert into ck_user3 (id,loc) values('young','기타');

select * from ck_user3;

create table default_user1(   
 id nchar(10),
 loc varchar(20),
 age number(3)
 );
 
 insert into default_user1(id) values('young1');
 select * from default_user1;
 
 create table default_user2(   
 id nchar(10),
 loc varchar(20) default '서울',
 age number(3) default 21
 );

 insert into default_user2(id) values('young1');
 select * from default_user2;
 
  create table default_user3(   
 id nchar(10),
 loc varchar(20) default '서울',
 age number(3) default '21'
 );
 
  insert into default_user3(id) values('young1');
 select * from default_user3;
 
 
 --1)테이블만들기
 create table user100(   
 id nchar(10),
 loc varchar(20),
 age number(3)
 );
 desc user100;
 
 
 --2)레코드 추가
 insert into user100(id) values('ppk');
 insert into user100(id) values('ppk');
 
 --3)레코드 제거
 delete from user100;
 
 --4)제약조건 추가
 alter table user100
 add primary key(id); --table에 제약조건 추가하기 중복된 값이 저장되있으면 제약조건이 걸리지 않음
 
 alter table user100
 add constraint user100_pk primary key(id); --table에 제약조건 추가하기(제약조건 이름지정)
 
 --5) 제약조건 확인
 select * from ALL_CONSTRAINTS
 where table_name='USER100'; --제약조건 걸려 있는지 확인하기 'USER100'값은무조건 대문자로 오라클내에서 값을 대문자로 저장해서 관리하기때문
 
 --6)제약조건 제거
 alter table user100
 drop CONSTRaINT USER100_PK; --table에 제약조건 삭제하기
 
  create table user100(   
 id nchar(10),
 loc varchar(20),
 age number(3)
 );
 
  create table user100(   
 id nchar(10),
 loc varchar(20)
 );
 
 insert into user100(id,loc,age) values('ppk','서울',100);
 insert into user100(id,loc) values('ppk','서울');
 
 --컬럼 추가하기 
alter table user100
add email varchar(50) ; 

-- 컬럼 추가하기 2
alter table user100
add age number(3) DEFAULT '17' ;

-- 컬럼 제거하기
alter table user100
drop column age;

drop table user100;

select * from user100;
desc user100;

-- 테이블 형변경하기
alter table user100
modify (id nchar(20));  --값의 크기를 키우는것은가능

alter table user100
modify (loc varchar(30));

alter table user100
modify (loc varchar(7));

alter table user100
modify (id nchar(8)); --값을 작게 바꾸는것은 불가 나머지공백은 문자로 잡혀있음

select * from user100;

 create table user200(   
 id nchar(10),
 loc varchar(20),
 age varchar(3)
 );
 
 alter table user200
modify (age varchar(3));  --안에 데이터가 없다면 뭐로 바꾸든 바뀜 데이터가 들어가있으면 쉽지않음

desc user200;
select * from user200; --숫자가 왼쪽에 붙어서 값이 출력이된다면 문자로지정되어 있는것

insert into user200(id, loc, age) values('ppk','서울','25');

alter table user200
modify (age number(3)); --문자를 숫자로 바꾸는것은 불가능


drop table t100;

create table t100(
id varchar(10),
pwd varchar(20)
);

1)컬럼추가 age 형은 number (3)
alter table t100
add age number(3);

2)컬럼 추가 loc 형은 nchar(3) 디폴트 '서울'
alter table t100
add loc nchar(3) default '서울';

3)pwd 의 형은 varchar(25) 로 변경
alter table t100
modify (pwd varchar(25));

4) id에 기본키 추가
alter table t100
add primary key(id);

5) 임의의 레코드 3개 추가하기
insert into t100(id,pwd,age,loc) values ('가나다','1234','23','서울');
insert into t100(id,pwd,age,loc) values ('라바나','asdfw','25','경기');
insert into t100(id,pwd,age,loc) values ('그더노','1wefdqw','27','부산');
desc t100;

6) t100을 사용하여 v_t100 만들기
create view v_t100
as
select * from t100;

7) v_t100을 이용하여 id와 pwd를 출력할 수 있는 v_t200을 만드시오
create view v_t200
as
select id,pwd from v_t100;


create sequence s_table   --자동증가할수있는 값을 만들어주는 것
increment by 1 
start with 1001; --1001부터 1씩증가해라

insert into t100(id,pwd) values(S_TABLE.NEXTVAL,'1234'); 
insert into t100(id,pwd) values(S_TABLE.NEXTVAL,'1234간다라라'); --실행에 실패했다고 다음값으로 넘어가는것이 아닌 기억하고 있다 그 다음값으로 넘어감
insert into t100(id,pwd) values(S_TABLE.NEXTVAL,'4567');

select * from t100;

delete from t100 where id= '1009';

create table t300(
id varchar(10),
pwd varchar(20)
);

insert into t300(id,pwd) values(S_TABLE.NEXTVAL,'1234');

select * from t100;
select * from t300;



create table t400(
id varchar(10),
pwd varchar(20)
);

create sequence s_table2   --자동증가할수있는 값을 만들어주는 것
increment by 3 
start with 1001;


insert into t400(id,pwd) values(S_TABLE2.NEXTVAL,'4567');
select * from t400;

select 5+7 
from dual;

select '5'||'7'||'8' as "글자" 
from dual; -- ||문자를 연결해주는것 오라클만 가능 갯수에 상관없이 연결가능

select concat('5','ABC') --두개의 문자만 연결 가능 
from dual;
 
select length('한글'),lengthB('한글'),length('avcd') from dual;  --dual 가상의 테이블을 만들어 값을출력 lengthb = byte의 크기로나타내줌





drop table t700;

create table t700(
id varchar(10),
pwd varchar(20)
);

insert into t700(id,pwd) values('ppk8','1234');
insert into t700(id,pwd) values('young','1231');
insert into t700(id,pwd) values('young','1231가나다라바사');

delete from t700 where pwd = '1231';

select * from t700;

1)컬럼추가 age 형은 number (3)
alter table t700
add age number(3);

alter table t700
add age number(3)default '17';


2)컬럼 추가 loc 형은 nchar(3) 디폴트 '서울'
alter table t700
add loc nchar(3) default '서울';

3)pwd 의 형은 varchar(25) 로 변경
alter table t700
modify (pwd varchar(23));

4) id에 기본키 추가
alter table t700
add primary key(id);

5) 임의의 레코드 3개 추가하기
insert into t100(id,pwd,age,loc) values ('가나다','1234','23','서울');
insert into t100(id,pwd,age,loc) values ('라바나','asdfw','25','경기');
insert into t100(id,pwd,age,loc) values ('그더노','1wefdqw','27','부산');
desc t100;

6) t100을 사용하여 v_t100 만들기
create view v_t700
as
select * from t700;

7) v_t100을 이용하여 id와 pwd를 출력할 수 있는 v_t200을 만드시오
create view vv_t200
as
select id,pwd from v_t700;

create view vv_t701(아이디,암호)
as
select id,pwd from v_t700;

create view vv_t702
as
select id"아이디1", pwd"암호1" from v_t700;

select * from vv_t702;

delete from t500 where loc is null; --null 값을지우기
