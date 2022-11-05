
create table user1(
 id nchar(10),
 name varchar(20)
);

insert into user1(id,name) values('ppk','�ʱ���');
select * from user1;

create table pk_user1(
id nchar(10) primary key,
name varchar(20)
);

insert into user1(id,name) values('ppk','�ʱ���');
insert into user1(id,name) values('ppk','�ʱ���'); -- �ߺ�
insert into user1(id,name) values('','�ʱ���'); --not null null���� ���ü� ����

create table pk_user2(
id nchar(10) ,
name varchar(20),
primary key (id)
);

insert into pk_user2(id,name) values('ppk','�ʱ���');
insert into pk_user2(id,name) values('ppk','�ʱ���'); -- �ߺ�
insert into pk_user2(id,name) values('','�ʱ���'); --not null null���� ���ü� ����

create table pk_user3(
id nchar(10) ,
name varchar(20),
constraint pk_user3_1 primary key (id)  --constrinat ���������� �̸��� pk_user3_1 �θ���ڴ�.
);

create table pk_user4(
id nchar(10) ,
name varchar(20),
constraint pk_user3_2 primary key (id, name)  --�ΰ��� ���ļ� pk�������
);

insert into pk_user4(id,name) values('ppk','�ʱ���1');
insert into pk_user4(id,name) values('ppk','�ʱ���2'); 
insert into pk_user4(id,name) values('ppk','�ʱ���1'); -- �ߺ� ���� ���� �ΰ��� �Ȱ����� ���ü� ����
insert into pk_user4(id,name) values('ppk',''); --not null null���� ���ü� ����

create table user11(
 id nchar(10),
 name varchar(20) not null
);

create table user11(
 id nchar(10),
 name varchar(20),
 constraint user11_user3_1 not null (id) --�̷����� �ȉ� not null ������ ������ Į�������ٰ� ����� ���� �ʼ��� �޾ƾ��Ѵ� = not null ��������
);              --null = 0�� �������ƴ� �𸣴°�

desc user11;

insert into user11(id,name) values('ppk','�ʱ���');
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
foreign key(id) references pk_user1(id)  --user1�� id�� �����ϰ������
); -- user1 �� id�� pk���ƴϾ �ȵȴٴ� ������ ��� pk�� �ִ� ���� �����ؾ���

drop table fk_user11;
drop table pk_user1;

create table pk_user1(
 id nchar(10) primary key,
 name varchar(20)
 );
 

create table fk_user11(
 id1 nchar(10)not null,
 age number(3) ,
foreign key(id1) references pk_user1(id)  --user1�� id�� �����ϰ������
);

insert into pk_user1 (id,name) values('ppk','�ʱ���');
insert into fk_user11 (id1,age) values('ppk','17');
insert into fk_user11 (id1,age) values('ppk2','17'); -- �������� �߻� pk���� ���ִ� id���� �����ǵ����� ppk ���̵��� ��� ��������
insert into pk_user1 (id,name) values('ppk2','������'); -- ppk2�� �߰��ؼ� fk_user11 �� ppk2���� ������ �ְԉ�

select * from fk_user11;

create table uk_user1(   --����ũ�������� �ߺ��� �ȵ����� null���� ������
 id nchar(10) unique,
 name varchar(20)
 );
 
insert into uk_user1 (id,name) values('ppk','������');
insert into uk_user1 (id,name) values('ppk','������'); -- ���ϰ��� �־��ٰ� �� �߰��� �ȉ�
insert into uk_user1 (id,name) values('','������'); --null���� �ߵ���
insert into uk_user1 (id,name) values('','�ϴ���');
select * from uk_user1;


create table uk_user2(   --unique �������ǿ� not null�� ������ pk�� ��������  unique ���������� null���� �ޱ����� ���
 id nchar(10) not null unique,
 name varchar(20) not null unique
 );
 
  
insert into uk_user2 (id,name) values('ppk','������');
insert into uk_user2 (id,name) values('ppk','������'); -- ���ϰ��� �־��ٰ� �� �߰��� �ȉ�
insert into uk_user2 (id,name) values('','������'); 
insert into uk_user2 (id,name) values('','�ϴ���');

create table ck_user2(   
 id nchar(10) not null unique,
 loc varchar(20) not null check (loc in('����','��Ÿ')) -- ����� ��Ÿ�� �ƴϸ� ����������
 );
 
insert into ck_user2 (id,loc) values('ppk','����');
insert into ck_user2 (id,loc) values('ppk','���'); -- üũ��������

select * from ck_user2;

create table ck_user3(   
 id nchar(10) not null unique,
 loc varchar(20), 
 check (loc in('����','��Ÿ')) -- ����� ��Ÿ�� �ƴϸ� ����������
 );
 
 insert into ck_user3 (id,loc) values('ppk','����');
insert into ck_user3 (id,loc) values('ppk','���'); -- üũ��������
 insert into ck_user3 (id,loc) values('young','��Ÿ');

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
 loc varchar(20) default '����',
 age number(3) default 21
 );

 insert into default_user2(id) values('young1');
 select * from default_user2;
 
  create table default_user3(   
 id nchar(10),
 loc varchar(20) default '����',
 age number(3) default '21'
 );
 
  insert into default_user3(id) values('young1');
 select * from default_user3;
 
 
 --1)���̺����
 create table user100(   
 id nchar(10),
 loc varchar(20),
 age number(3)
 );
 desc user100;
 
 
 --2)���ڵ� �߰�
 insert into user100(id) values('ppk');
 insert into user100(id) values('ppk');
 
 --3)���ڵ� ����
 delete from user100;
 
 --4)�������� �߰�
 alter table user100
 add primary key(id); --table�� �������� �߰��ϱ� �ߺ��� ���� ����������� ���������� �ɸ��� ����
 
 alter table user100
 add constraint user100_pk primary key(id); --table�� �������� �߰��ϱ�(�������� �̸�����)
 
 --5) �������� Ȯ��
 select * from ALL_CONSTRAINTS
 where table_name='USER100'; --�������� �ɷ� �ִ��� Ȯ���ϱ� 'USER100'���������� �빮�ڷ� ����Ŭ������ ���� �빮�ڷ� �����ؼ� �����ϱ⶧��
 
 --6)�������� ����
 alter table user100
 drop CONSTRaINT USER100_PK; --table�� �������� �����ϱ�
 
  create table user100(   
 id nchar(10),
 loc varchar(20),
 age number(3)
 );
 
  create table user100(   
 id nchar(10),
 loc varchar(20)
 );
 
 insert into user100(id,loc,age) values('ppk','����',100);
 insert into user100(id,loc) values('ppk','����');
 
 --�÷� �߰��ϱ� 
alter table user100
add email varchar(50) ; 

-- �÷� �߰��ϱ� 2
alter table user100
add age number(3) DEFAULT '17' ;

-- �÷� �����ϱ�
alter table user100
drop column age;

drop table user100;

select * from user100;
desc user100;

-- ���̺� �������ϱ�
alter table user100
modify (id nchar(20));  --���� ũ�⸦ Ű��°�������

alter table user100
modify (loc varchar(30));

alter table user100
modify (loc varchar(7));

alter table user100
modify (id nchar(8)); --���� �۰� �ٲٴ°��� �Ұ� ������������ ���ڷ� ��������

select * from user100;

 create table user200(   
 id nchar(10),
 loc varchar(20),
 age varchar(3)
 );
 
 alter table user200
modify (age varchar(3));  --�ȿ� �����Ͱ� ���ٸ� ���� �ٲٵ� �ٲ� �����Ͱ� �������� ��������

desc user200;
select * from user200; --���ڰ� ���ʿ� �پ ���� ����̵ȴٸ� ���ڷ������Ǿ� �ִ°�

insert into user200(id, loc, age) values('ppk','����','25');

alter table user200
modify (age number(3)); --���ڸ� ���ڷ� �ٲٴ°��� �Ұ���


drop table t100;

create table t100(
id varchar(10),
pwd varchar(20)
);

1)�÷��߰� age ���� number (3)
alter table t100
add age number(3);

2)�÷� �߰� loc ���� nchar(3) ����Ʈ '����'
alter table t100
add loc nchar(3) default '����';

3)pwd �� ���� varchar(25) �� ����
alter table t100
modify (pwd varchar(25));

4) id�� �⺻Ű �߰�
alter table t100
add primary key(id);

5) ������ ���ڵ� 3�� �߰��ϱ�
insert into t100(id,pwd,age,loc) values ('������','1234','23','����');
insert into t100(id,pwd,age,loc) values ('��ٳ�','asdfw','25','���');
insert into t100(id,pwd,age,loc) values ('�״���','1wefdqw','27','�λ�');
desc t100;

6) t100�� ����Ͽ� v_t100 �����
create view v_t100
as
select * from t100;

7) v_t100�� �̿��Ͽ� id�� pwd�� ����� �� �ִ� v_t200�� ����ÿ�
create view v_t200
as
select id,pwd from v_t100;


create sequence s_table   --�ڵ������Ҽ��ִ� ���� ������ִ� ��
increment by 1 
start with 1001; --1001���� 1�������ض�

insert into t100(id,pwd) values(S_TABLE.NEXTVAL,'1234'); 
insert into t100(id,pwd) values(S_TABLE.NEXTVAL,'1234���ٶ��'); --���࿡ �����ߴٰ� ���������� �Ѿ�°��� �ƴ� ����ϰ� �ִ� �� ���������� �Ѿ
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

create sequence s_table2   --�ڵ������Ҽ��ִ� ���� ������ִ� ��
increment by 3 
start with 1001;


insert into t400(id,pwd) values(S_TABLE2.NEXTVAL,'4567');
select * from t400;

select 5+7 
from dual;

select '5'||'7'||'8' as "����" 
from dual; -- ||���ڸ� �������ִ°� ����Ŭ�� ���� ������ ������� ���ᰡ��

select concat('5','ABC') --�ΰ��� ���ڸ� ���� ���� 
from dual;
 
select length('�ѱ�'),lengthB('�ѱ�'),length('avcd') from dual;  --dual ������ ���̺��� ����� ������� lengthb = byte�� ũ��γ�Ÿ����





drop table t700;

create table t700(
id varchar(10),
pwd varchar(20)
);

insert into t700(id,pwd) values('ppk8','1234');
insert into t700(id,pwd) values('young','1231');
insert into t700(id,pwd) values('young','1231�����ٶ�ٻ�');

delete from t700 where pwd = '1231';

select * from t700;

1)�÷��߰� age ���� number (3)
alter table t700
add age number(3);

alter table t700
add age number(3)default '17';


2)�÷� �߰� loc ���� nchar(3) ����Ʈ '����'
alter table t700
add loc nchar(3) default '����';

3)pwd �� ���� varchar(25) �� ����
alter table t700
modify (pwd varchar(23));

4) id�� �⺻Ű �߰�
alter table t700
add primary key(id);

5) ������ ���ڵ� 3�� �߰��ϱ�
insert into t100(id,pwd,age,loc) values ('������','1234','23','����');
insert into t100(id,pwd,age,loc) values ('��ٳ�','asdfw','25','���');
insert into t100(id,pwd,age,loc) values ('�״���','1wefdqw','27','�λ�');
desc t100;

6) t100�� ����Ͽ� v_t100 �����
create view v_t700
as
select * from t700;

7) v_t100�� �̿��Ͽ� id�� pwd�� ����� �� �ִ� v_t200�� ����ÿ�
create view vv_t200
as
select id,pwd from v_t700;

create view vv_t701(���̵�,��ȣ)
as
select id,pwd from v_t700;

create view vv_t702
as
select id"���̵�1", pwd"��ȣ1" from v_t700;

select * from vv_t702;

delete from t500 where loc is null; --null ���������
