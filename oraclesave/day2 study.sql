create table T0517(
sno number(3),
sname nvarchar2(5)
);

insert into T0517 (sno,sname) values(001,'������');
insert into T0517 (sno,sname) values('8106','������');

select * from T0517;



create table T0518(
sno char(3),
sname nvarchar2(5)
);

insert into T0518 (sno,sname) values('001','������');

select * from T0518;

drop table t0517; --���̺� ��ü�� ���ִ°�
desc t0517; 

delete from t0518; --���ڵ� ����
desc t0518;

create table T0519(
sno number(3,1), -- �Ǽ�ǥ�� (����2�ڸ�, �Ҽ� 1�ڸ�) ���� 3�� ��ü����, ���� 1�� �Ҽ��� 1�ڸ�
sname nvarchar2(5)
);

insert into T0519 (sno,sname) values(99.9,'������');
insert into T0519 (sno,sname) values(100.1,'������'); -- �����߻�
select * from T0519;

create table T0518(
sno char(3),
sname nvarchar2(5)
);
select * from T0518;
insert into t0518(sno, sname) values('A02', '�ٴ�');
insert into t0518 values('A01', '�ϴ���');
insert into t0518(sno) values('A03');
insert into t0518 values('A04','');
insert into t0518 values('A05',' ');
insert into t0518(sname, sno) values('�Ѹ�', 'A06');

/*���ڴ� ��������ǥ '', ���ڴ� �׳�
char number ����*/

update T0518 set sname = '����' where sno = 'A01'   --���� ����


create table T0517(
sno char(3),
sname nvarchar2(5),
age number(3)
);
select * from t0517;
--�ֶ� ,21�ιٲٱ�

insert into t0517(sno, sname, age) values ('B01','������',17);
insert into t0517(sno, sname, age) values ('B02','ȿ��',22);
insert into t0517(sno, sname, age) values ('B03','ȿ��',24);


update T0517 set sname = '�ֶ�' , age = 21 where sno = 'B01';
update T0517 set age = '23' where sname = 'ȿ��';
update T0517 set age = '23' where sname = 'ȿ��' or sname = '�ֶ�';
update T0517 set age = '23' where sname = 'ȿ��' or sno = 'B04';
update T0517 set age = '24' where sno in('B01','B03'); --in�� or����������
update T0517 set age = age+2;  

insert into t0517(sno, sname, age) values('A01','�ϳ�','17');
insert into t0517(sno, sname, age) values('A02','�θ�','15');
insert into t0517(sno, sname, age) values('A03','����','13');
select sno, sname, age from t0517 where sno= 'A01' or sno = 'A02'; --�����ϳ� �����ϴ°�
select sno, sname, age from t0517 where sno= 'A01' and sname = '�ϳ�'; --�Ѵ� �����ϴ°�
select sno, sname, age from t0517 where sno like 'A%'; -- A%�ν��۵Ǵ°�  
select sno, sname, age from t0517 where sno like '%0%'; -- 0���� ��簪�� ã�°�
select sno, sname, age from t0517 where sno like '_0%'; -- _0% �ι�°���ڰ� ���ΰ��� ã�°� 
select sno, sname, age from t0517 where sno like '%��'; -- %�� ���������ڰ� ���ΰ��� ã�°�
select sno, sname, age from t0517 where sno like '%A%' or sname like '%��%';
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
order by age asc; -- A������ ������ ���̸� ������������ �����Ͻÿ�