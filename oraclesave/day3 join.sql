drop  table enrol;
drop  table student;
drop  table course;


create table student(
 sno varchar2(3) ,
 sname nvarchar2(10),
 year varchar2(10),
 dept nvarchar2(10) ,
 constraint   student_sno_pk   primary  key(sno));


create table course(
 cno varchar2(5) primary key,
 cname nvarchar2(10),
 credit varchar2(3),
 dept nvarchar2(10),
 prname nvarchar2(10));


create table enrol(
 sno varchar2(3) ,
 cno varchar2(5) ,
 grade varchar2(3),
 midterm int,
 final int ,
 constraint enrol_sno_fk foreign key(sno) references student(sno), 
 constraint enrol_cno_fk foreign key(cno) references course(cno), 
 constraint enrol_combo_pk primary key(sno, cno));
 
 create table enrol(
 sno varchar2(3) ,
 cno varchar2(5) ,
 grade varchar2(3),
 midterm int,
 final int ,
 primary key(sno, cno));

--fk 제약조건 다른테이블의 pk를 참조
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
insert into student(sno,sname,year,dept)
values('600','영심이','4','컴퓨터');


insert into course(cno,cname,credit,dept,prname)
values('C123','프로그래밍','3','컴퓨터','김성기');
insert into course(cno,cname,credit,dept,prname)
values('C312','자료구조','3','컴퓨터','황수찬');
insert into course(cno,cname,credit,dept,prname)
values('C324','화일처리','3','컴퓨터','이규철');
insert into course(cno,cname,credit,dept,prname)
values('C413','데이터베이스','3','컴퓨터','이성호');
insert into course(cno,cname,credit,dept,prname)
values('E412','반도체','3','전자','홍봉희');


insert into enrol(sno,cno,grade,midterm,final)
values('100','C413','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('100','E412','A',95,95);
insert into enrol(sno,cno,grade,midterm,final)
values('200','C123','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C324','C',75,75);
insert into enrol(sno,cno,grade,midterm,final)
values('300','C413','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C312','A',90,95);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C324','A',95,90);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C413','B',80,85);
insert into enrol(sno,cno,grade,midterm,final)
values('400','E412','C',65,75);
insert into enrol(sno,cno,grade,midterm,final)
values('500','C312','B',85,80);
insert into enrol(sno,cno,grade,midterm,final)
values('400','C123','A',90,90);
insert into enrol(sno,cno,grade,midterm,final)
values('700','C187','A',75,85);


select * from student;
select * from course;
select * from enrol;

select  *   from  student   join  enrol
on student.sno = enrol.sno;


select  *   from  student   join  enrol
on student.sno = enrol.sno
order  by  student.sno  asc;

select  *   from  student left outer  join  enrol
on student.sno = enrol.sno
order  by  student.sno  asc; 


select  *   from  student right outer  join  enrol
on student.sno = enrol.sno
order  by  student.sno  asc;



select  *   from  student full outer  join  enrol
on student.sno = enrol.sno
order  by  student.sno  asc;


select  *   from  student ,  enrol
where  student.sno = enrol.sno ;

select s.sno as "학번", sname, grade from student s left join enrol e
on s.sno= e.sno ;
--공백을 사용할려면 ""를 사용해줘야함 "학 번"

select * from t1;

drop table t1;
