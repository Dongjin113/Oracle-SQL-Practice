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


insert into userTBL (userName, birthyear, addr, mobile) values ('�̽±�', 1987, '����', '011-111-1111');
insert into userTBL (userName, birthyear, addr, mobile) values ('���ȣ', 1971, '����', '019-333-3333');
insert into userTBL (userName, birthyear, addr, mobile) values ('������', 1969, '�泲', '�� ����');
insert into userTBL (userName, birthyear, addr, mobile) values ('�����', 1963, '����', '016-666-6666');
insert into userTBL (userName, birthyear, addr, mobile) values ('������', 1978, '���', '011-888-8888');
insert into userTBL (userName, birthyear, addr, mobile) values ('������', 1965, '���', '018-999-9999');
insert into userTBL (userName, birthyear, addr, mobile) values ('�����', 1979, '�泲', '011-222-2222');
insert into userTBL (userName, birthyear, addr, mobile) values ('������', 1950, '���', '011-444-4444');
insert into userTBL (userName, birthyear, addr, mobile) values ('�ٺ�Ŵ', 1973, '����', '010-000-0000');
insert into userTBL (userName, birthyear, addr, mobile) values ('���ð�', 1979, '�泲', '�� ����');
?


insert into buyTBL(userName, prodName, price, amount ) values ('�����', '�ȭ', 30, 2);
insert into buyTBL(userName, prodName, price, amount) values ('�����', '��Ʈ��', 1000, 1);
insert into buyTBL(userName, prodName, price, amount) values ('������', '�����', 200, 1);
insert into buyTBL(userName, prodName, price, amount) values ('�ٺ�Ŵ', '�����', 200, 5);
insert into buyTBL(userName, prodName, price, amount) values ('�����', 'û����', 50, 3);
insert into buyTBL(userName, prodName, price, amount) values ('�ٺ�Ŵ', '�޸�', 80, 10);
insert into buyTBL(userName, prodName, price, amount) values ('���ð�', 'å', 15, 5);
insert into buyTBL(userName, prodName, price, amount) values ('������', 'å', 15, 2);
insert into buyTBL(userName, prodName, price, amount) values ('������', 'û����', 50, 1);
insert into buyTBL(userName, prodName, price, amount) values ('�ٺ�Ŵ', '�ȭ', 30, 2);
insert into buyTBL(userName, prodName, price, amount) values ('������', 'å', 15, 1);
insert into buyTBL(userName, prodName, price, amount)  values ('�ٺ�Ŵ', '�ȭ', 30, 2);

select * from userTBL;
select * from buyTBL;

1. userTBL �� buyTBL �� �̿��Ͽ�  ���̸�,  ����ó, ���Ź���, �ܰ�, ����, ���� �ݾ���  ���Ͻÿ�.
select u.userName "���̸�", mobile "����ó", prodName "���Ź���", price "�ܰ�", amount"����", (price * amount) "���űݾ�"
from userTBL u
join buyTBL b
on  u.userName = b.userName;


create view v_userbuyTBL
as
select u.userName "���̸�", mobile "����ó", prodName "���Ź���", price "�ܰ�", amount"����", (price * amount) "���űݾ�"
from userTBL u
join buyTBL b
on  u.userName = b.userName;

2. userTBL �� buyTBL �� �̿��Ͽ� ����  ���űݾ��� ������ ���Ͻÿ�.
select u.username ,sum(price * amount) 
from usertbl u
join buytbl b
on u.username = b.username
group by u.username;

select ���̸�, sum(���űݾ�) "���űݾ� ����"
from v_userbuyTBL
group by ���̸�;





3. ���� ���űݾ��� ������ ���� ���űݾ������� ��� ���� ���� ����� ����Ͻÿ�.
select u.username from usertbl u
join buytbl b
on u.username = b.username
group by u.username
having sum(price * amount) > (select avg(sum(price * amount)) from buytbl group by username);



select username, sum(price*amount)
from buytbl
group by username
having sum(price*amount) > (select avg(sum(price * amount)) from buytbl group by username);

4. ȸ�����Ե� ���� ���� ����ΰ� ?
select count(*)"��" from usertbl;

5. �ϳ��� �����̶� ������ ���� �ִ� ���� ���� ����ΰ�?
select username, count(distinct username) from buytbl;

6. ����� ��⵵�� ��� �ִ� ���� ����ΰ�?
select addr, count(*) 
from usertbl
group by addr 
having addr in('����' , '���');

select addr, count(*) 
from usertbl
where addr in('����' , '���')
group by addr;

select count(*) 
from usertbl
where addr in('����' , '���');

7. �ȭ�� ������ ����� �̸��� ����ó�� ����Ͻÿ�.
select distinct u.username, mobile 
from usertbl u
join buytbl b
on u.username = b.username
where prodname = '�ȭ';

select username, mobile 
from usertbl
where username in (
select username from buytbl
where prodname = '�ȭ');


select * from vv_v_userbuytbl;
select * from v_userbuytbl;

update v_userbuytbl set ����ó = '010-00-0000' where ���̸� = '�����'; --join�� ��� ������Ʈ�� �Ҽ� ����.

create view vv_v_userbuytbl (userName,tel)
as
select ���̸�,����ó from v_userbuytbl;





create table userTBL2(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

insert into userTBL2 (userName, birthyear, addr, mobile) values ('A�±�', 1987, '����', '011-111-1111');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('A��ȣ', 1971, '����', '019-333-3333');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('A����', 1969, '�泲', '�� ����');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B���', 1963, '����', '016-666-6666');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B����', 1978, '���', '011-888-8888');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B����', 1965, '���', '018-999-9999');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('B����', 1979, '�泲', '011-222-2222');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C����', 1950, '���', '011-444-4444');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C��Ŵ', 1973, '����', '010-000-0000');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('C�ð�', 1979, '�泲', '�� ����');
insert into userTBL2 (userName, birthyear, addr, mobile) values ('D����', 2000, '����', '�� ����');

create table userTBL1(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

insert into userTBL1 (userName, birthyear, addr, mobile) values ('F�±�', 1987, '����', '011-111-1111');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F��ȣ', 1971, '����', '019-333-3333');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F����', 1969, '�泲', '�� ����');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F���', 1963, '����', '016-666-6666');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('F����', 1978, '���', '011-888-8888');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G����', 1965, '���', '018-999-9999');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G����', 1979, '�泲', '011-222-2222');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G����', 1950, '���', '011-444-4444');
insert into userTBL1 (userName, birthyear, addr, mobile) values ('G��Ŵ', 1973, '����', '010-000-0000');

select * from usertbl;
select * from usertbl1;
select * from usertbl2;

--insert ~ select ����
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

insert into userTBL3 (userName, birthyear, addr, mobile) values ('�ڽ±�', 1987, '����', '011-111-1111');
insert into userTBL3 (userName, birthyear, addr, mobile) values ('�ڰ�ȣ', 1971, '����', '019-333-3333');

--���� ���̺�
create table userTBL(
  userName nchar(3) primary key,
  birthYear int not null,
  addr nchar(2) not null,
  mobile varchar2(12)
);

--Ʈ���� ���� ���̺�
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
    values(:old.userName, :old.birthyear, :old.addr, :old.mobile, sysdate());  --old �޸𸮰� �����Ǳ����� �޸𸮿� ����ִ°�
end;


create trig0er update_userTB
after update
on userTBL
for each row
begin
    insert into  TriuserTBL
    values(:old.userName, :old.birthyear, :old.addr, :old.mobile, sysdate());  --old �޸𸮰� �����Ǳ����� �޸𸮿� ����ִ°�
end;





update userTBL set addr='����'
where username like '%��%';


select * from userTBL;
delete from userTBL where username = 'D����';
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

update student set sname = '������'
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