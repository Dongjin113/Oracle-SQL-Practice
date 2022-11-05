Create table test (
idNum NUMBER(5)
);

insert into test(idNum)values(10001);
insert into test(idNum)values(10002);

select * from test;

delete from test 
where idnum='10001'; --이라는 값을 찾아서 지우세요
/*
주석처리
*/
--주석처리


desc test;

Create table test1 (
idNum NUMBER(5),
 name varchar(9) --가변문자
);

insert into test1 (idnum, name) values(10001,'영심이');
select * from test1; --*은 전체를 속칭함
select idnum, name from test1;
select idnum from test1;

Create table test2 (
idNum NUMBER(5) not null PRIMARY KEY --중복값을 제거
);

/*null 0도 무엇도 아닌 모르는 값*/

insert into test2 (idnum) values('10001');
insert into test2 (idnum) values('10001');
insert into test2 (idnum) values('10002');
select * from test2;
