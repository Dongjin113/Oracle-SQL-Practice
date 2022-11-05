drop  table  examtbl;

Create table examtbl (
 sno varchar2(10)  not  null primary key ,
 sname varchar2(20),
 kor  int,
 eng  int,
 math int,
 hist int
) ;

insert into examtbl values('10101','김학생', 75, 85, 90, 60);
insert into examtbl values('10102','이학생', 70, 75, 70, 60);
insert into examtbl values('10103','박학생', 70, 85, 80, 75);
insert into examtbl values('10201','조학생', 90, 85, 100, 50);
insert into examtbl values('10202','황학생', 65, 65, 60, 70);
insert into examtbl values('10203','임학생', 45, 55, 50, 55);
insert into examtbl values('10304','천학생', 70, 75, 85, 80);
insert into examtbl values('10305','남학생', 100, 85, 90, 90);
insert into examtbl values('10306','여학생', 80, 95, 90, 85);
insert into examtbl values('10307','노학생', 35, 55, 70, 55);


select * from examtbl;

select max(sno)+1 as Max_sno  from examtbl;

create table board0719(
idx varchar2(10) not null primary key,
name varchar2(20),
title varchar2(20)
);
select * from board0719;

alter table examtbl add cnt int default '1';
select * from examtbl;

Create table T0722 (
 sno varchar2(10)  not  null primary key ,
 sname nvarchar2(20),
 title nvarchar2(50),
 cnt int
) ;

drop  table member_tbl_02;

Create table member_tbl_02 (
 custno number(6)  not  null primary key ,
 custname varchar2(20),
 phone varchar2(13),
 address varchar2(60),
 joindate  date,
 grade  char(1),
 city  char(2)
);


insert  into  member_tbl_02 
values(100001,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01'); 

insert  into  member_tbl_02 
values(100002,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01'); 

insert  into  member_tbl_02 
values(100003,'장믿음','010-1111-4444','울릉군 울릉읍','20151001','B','30'); 

insert  into  member_tbl_02 
values(100004,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30'); 

insert  into  member_tbl_02 
values(100005,'진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60'); 

insert  into  member_tbl_02 
values(100006,'차공단','010-1111-7777','제조도 제주시 감나무골','20151211','C','60'); 

select  *  from member_tbl_02;

drop  table money_tbl_02;
Create table money_tbl_02 (
 custno number(6)  not  null  ,
 salenol number(8)  not  null,
 pcost  number(8),
 amount number(4),
 price  number(8),
 pcode  varchar2(4),
 sdate  date,
 constraint pk_money_tbl_02 primary key (custno,salenol)
);

insert  into  money_tbl_02 values (100001, 20160001, 500, 5, 2500, 'A001','20160101' );
insert  into  money_tbl_02 values (100001, 20160002, 1000, 4, 4000, 'A002','20160101' );
insert  into  money_tbl_02 values (100001, 20160003, 500, 3, 1500, 'A008','20160101' );
insert  into  money_tbl_02 values (100002, 20160004, 2000, 1, 2000, 'A004','20160102' );
insert  into  money_tbl_02 values (100002, 20160005, 500, 1, 500, 'A001','20160103' );
insert  into  money_tbl_02 values (100003, 20160006, 1500, 2, 3000, 'A003','20160103' );
insert  into  money_tbl_02 values (100004, 20160007, 500, 2, 1000, 'A001','20160104' );
insert  into  money_tbl_02 values (100004, 20160008, 300, 1, 300, 'A005','20160104' );
insert  into  money_tbl_02 values (100004, 20160009, 600, 1, 600, 'A006','20160104' );
insert  into  money_tbl_02 values (100004, 20160010, 3000, 1, 3000, 'A007','20160106' );

select  *  from money_tbl_02;

select max(custno)+1 as custno from member_tbl_02;