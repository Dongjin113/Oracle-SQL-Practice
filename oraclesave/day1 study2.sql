/*����
table �� : school
sno �⺻Ű : ���� 3�ڸ�, sname (����10), email(����30)
*/

drop table school;

create table school(
sno char(3) not null Primary key, --�⺻Ű
sname nvarchar2(10), --������
email varchar(30)
);

insert into school (sno, sname, email) values('101','������','qwer@naver.com');
insert into school (sno, sname, email) values('102','�Ѹ�','asdfa@naver.com');
insert into school (sno, sname, email) values('103','�����','wqer@naver.com');

select sno, sname, email from school;

delete from school where sno='102';

select * from school where sno='102';

update school set sname='' where sno = '101'; --101���� ���鹮�ڷ� �ٲ���� ''�� null�� ������Ʈ ' '�� ���鹮�ڷ� ������Ʈ

select * from school;

select * from school where sname is null; --����Ŭ���� null ���� ���Ҷ��� is�� ���
select * from school where sname is not null; --null ���� �ƴѰ��� ����Ͻÿ�

/*����Ŭ �ѱ� ���� char(3) 3�� �ѱ� �ѱ��ڷ� ��ƾ���
nchar(3) ��,��,�� ������ ��밡��
char �⺻Ű ������ ������ �ִ°�  1,2,����  (3) 
varchar ����Ű ������ ������     1,2,����  (3)
������ �׻� where 
select ~~~ from ���Ĵ� ����

select sno, sname, email from school where sno='101'; �й����ΰ˻�
select sno, sname, email from school where sname='������'; �̸����ΰ˻�
select sno, sname from school where sname='������'; �̸��� �й��� ����ϰ������ �̸��ϸ� �����

*/