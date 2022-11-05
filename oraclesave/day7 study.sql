1. �ڷ� �� ���� 
�ڷḦ �����Ѱ��� ����?

2. ����Ŭ���� ��Ű����?
��Ű�� = ����Ÿ���̽� = ����� �̸� (=�����)

3. �������� 5���� �ѹ� ������� 
--pk ��������
--fk ��������
--unique ��������
--not null ��������
--check ��������

4. view �� Ư¡ 
--���������� ����Ǿ��ִ� ������ ���̺�
���ȼ� , ����
���������̺�

5. Ʈ�������̶� ? 
�۾�ó���� ����

6. DBA �� ����� �ϴ� ����ϱ��?
����Ÿ���̽� ������ (���, ����, ��������, ��ġ����)

7. Ʈ���� �� � ���� �ϴ°��ϱ��?
���̺� �����Ͽ� update delete �۾��� �߻��Ǹ� insert�� ����ȴ�

8. F.K �� ���Ͽ� �����Ͻÿ� 
�ٸ����̺� pk�� �����ϴ� Į��

9. char(3) �� varchar2(3) �� ���̸� �����Ͻÿ�. 
�������� 

10. null �̶� ?
0�� ���鵵�ƴ� �˼����°� ������ �Ұ�


C R U D

select * from student;

set serveroutput on -- ����� �����ض�.


drop procedure ps_select_student_count;

create procedure ps_select_student_count
as
var1 int;
var2 int;
begin
  select count(*) into var1 from student;
  select count(*) into var2 from student where dept='��ǻ��';
  DBMS_OUTPUT.PUT_LINE('��ü:' || var1 || ',����:' || var2) ; --��¶���
end;

EXECUTE ps_select_student_count;

select * from student;
desc student;

create or replace procedure sp_student_insert --�������ϴ��� ������ �����ϴ���
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

EXECUTE sp_student_insert('901','������','����','3');
EXECUTE sp_student_insert('902','�ϴ���','����','2');


select * from student;

create or replace procedure sp_student_insert --�������ϴ��� ������ �����ϴ���
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

EXECUTE sp_student_insert('903','����','ȭ��','2');


create or replace procedure sp_student_update --�������ϴ��� ������ �����ϴ���
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

EXECUTE sp_student_update('903','����','ȭ��','3');


create or replace procedure sp_student_delete --�������ϴ��� ������ �����ϴ���
(
sp_sno varchar2
)
is
begin
  delete from student where sno = sp_sno;
end;

EXECUTE sp_student_delete('902');

create or replace procedure sp_student_select1 --�������ϴ��� ������ �����ϴ���
as
var1 varchar2(10);
var2 varchar2(30);
var3 varchar2(30);

begin
  select sno, sname, dept into var1, var2, var3 from student where sno = 100;
  DBMS_OUTPUT.PUT_LINE('�л����� : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select1;

create or replace procedure sp_student_select1 --�������ϴ��� ������ �����ϴ���
(
 strSno in varchar2
)
as
var1 varchar2(10);
var2 varchar2(30);
var3 varchar2(30);

begin
  select sno, sname, dept into var1, var2, var3 from student where sno = strSno;
  DBMS_OUTPUT.PUT_LINE('�л����� : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select1('300');


create or replace procedure sp_student_select2 --�������ϴ��� ������ �����ϴ���
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
  DBMS_OUTPUT.PUT_LINE('�л����� : ' || var1 || '' || var2 || '' || var3 );
end;

execute sp_student_select2('200','����ȭ');

create or replace package pkg is
    type t_ref is ref cursor;
    end;
    
    create or replace procedure sp_student_select3 --�������ϴ��� ������ �����ϴ���
( 
 ret out pkg.t_ref,           --���� ���°�
 strSno in varchar2,        --������ �޾ƿ��°�
 strName in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sno = strSno or sname = strName;
end;

execute sp_student_select3('200','����ȭ'); -- ���ν��� sp_student_select3 ���� ����Ŭ�� ���� IN���� �����κп� �Է°��� �Է��� Ȯ���� ������ ��º����� ���̳���

create or replace procedure sp_student_select4 --�������ϴ��� ������ �����ϴ���
( 
 ret out pkg.t_ref           --���� ���°�
)
is
begin
  open ret For
    select sno, sname, dept from student;
end;

create or replace procedure sp_student_select5 --�������ϴ��� ������ �����ϴ���
( 
 ret out pkg.t_ref,           --���� ���°�
 strSname1 in varchar2,
 strSname2 in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sname like strSname1 or dept like strSname2;       --like �ڴ� ������ ''�� ������ ����
end;

create or replace procedure sp_student_select6 --�������ϴ��� ������ �����ϴ���
( 
 ret out pkg.t_ref,           --���� ���°�
 strSname1 in varchar2,
 strSname2 in varchar2
)
is
begin
  open ret For
    select sno, sname, dept from student 
    where sname like '%'||strSname1||'%' or sname like '%'||strSname2||'%';       --like �ڴ� ������ ''�� ������ ����
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

execute sp_insert('911','������','����','4');
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

execute sp_update('100','�μ�')
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
 -- �ϳ��� ���θ� ����� �����ϴ�.
 DBMS_OUTPUT.put_line(var1 || var2 || var3);
 end;
 
 execute sp_select1;

create or replace procedure sp_select2
(
strSno in varchar2 --�Էº���
)
as
var1 varchar2(10); --��º���
var2 varchar2(10);
var3 varchar2(10);
begin
 select sno, sname, dept into var1,var2,var3 from student 
 where sno = strSno;
 -- �ϳ��� ���θ� ����� �����ϴ�.
  DBMS_OUTPUT.put_line('�ϳ��� ���θ� ��µ˴ϴ�.');
 DBMS_OUTPUT.put_line(var1 || var2 || var3); --���ڵ� ������ �ϳ��� ��µɻ� �ٸ������ ����
   DBMS_OUTPUT.put_line('��¼��� !!!');
 end;
 
  execute sp_select2(100);
  
  
  create or replace procedure sp_select3
(
 ret OUT pkg.t_ref,
 strSno in varchar2 --�Էº���
)
is
begin
open ret for
 select sno, sname, dept from student 
 where sno = strSno;
 DBMS_OUTPUT.put_line('��¼��� !!!');
 end;
 
 execute sp_select2;
 
 create or replace procedure sp_select4
(
 ret OUT pkg.t_ref,
 strDept in varchar2 --�Էº���
)
is
begin
open ret for
 select sno, sname, dept from student 
 where dept like strDept;
 DBMS_OUTPUT.put_line('��¼��� !!!');
 end;
 
 create or replace procedure sp_select5
(
 ret OUT pkg.t_ref,
 strDept in varchar2 --�Էº���
)
is
begin
open ret for
 select sno, sname, dept from student 
 where dept like '%'|| strDept ||'%';
 DBMS_OUTPUT.put_line('��¼��� !!!');
 end;
 
 select * from bigdata; --���̺� ����Ŭ�� ������ ����Ʈ ������ ; ����Ÿ >> SQL �⺻������ ����Ͽ� ���̺�������
 
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
   --������Ͽ��� �� 5�� ���۵Ǵ� ����� ����Ͻÿ�.
   select count(*) from bigdata 
   where BIRTH_DATE like '52%';
   
   --52��� �����͸� test 002�� �߰��Ͻÿ�
   insert into test002 select * from bigdata 
   where BIRTH_DATE like '52%';
   
   -- BIRTH_DATE �� ����Ϸ� ��Ÿ���ÿ�
   select substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" from Test002;
   
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    HIRE_DATE
    from Test002;
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '����'
     when GENDER = 'M' then '����'
     else '��Ÿ'
    end as "����",
    HIRE_DATE
    from Test002;
    
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    HIRE_DATE,
    CASE
     when substr(HIRE_DATE,1,2)>=90 then '90�⵵ �Ի�'
     when substr(HIRE_DATE,1,2) < 90 then '80�⵵ �Ի�'
    end as "�Ի籸��"
    from Test002;
    
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '����'
     when GENDER = 'M' then '����'
     else '��Ÿ'
    end as "����",
    HIRE_DATE,
    CASE
     when HIRE_DATE like '8%' then '80�⵵ �Ի�'
     when HIRE_DATE like '9%' then '90�⵵ �Ի�'
     else '��Ÿ'
    end as "�Ի籸��"
    from Test002;
    
    
    create view v_bigdata1
    as
    select emp_no, 
    substr(BIRTH_DATE,1,2) || '��' || substr(BIRTH_DATE,4,2) || '��' || substr(BIRTH_DATE,7,2) || '��' as "�������" ,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    CASE
     when GENDER = 'F' then '����'
     when GENDER = 'M' then '����'
     else '��Ÿ'
    end as "����",
    HIRE_DATE,
    CASE
     when HIRE_DATE like '8%' then '80�⵵ �Ի�'
     when HIRE_DATE like '9%' then '90�⵵ �Ի�'
     else '��Ÿ'
    end as "�Ի籸��"
    from Test002;
    
    select ����, translate(count(����),'025','���̿�') as �ο��� from v_bigdata1
    group by ����;
    
    
    select first_name "�̸�", length(first_name) "����" from v_bigdata1
    order by length(first_name) asc;
    
    select first_name "�̸�", length(first_name) "����" from v_bigdata1
    order by ���� desc;
    
    select rpad(upper(first_name),20,'#') "�̸�", length(first_name) "����" from v_bigdata1
    order by ���� desc;
    
    select Ltrim('  1234   ') as "��" , trim('  1234   ') as "��2", rtrim('  1234   ') as "��3" from dual; --Ltrim �������鸸 ���� trim ���ʰ����� ����
    
    select ceil (4.1) , ceil (4.5) , ceil (4.0), ceil(4.0000000001) --4���� ũ�� ������ �ø�
    from dual;
    
    select floor (4.9999999) , floor (4.5) , floor (4.0), floor(4.0000000001) --4���� ũ�� ������ ����
    from dual;
    
    select round(4.7) , round(4.5) , round(4.1) --�ݿø�
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
   