use DB4

-- �ӽ����̺� ������
create table #���� (
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0) default 0 null,
)
-- �ӽ����̺� insert
insert into #���� (����, ��ǰ, ����)
values ('20200101', 'A1', 100),
('20200105', 'A1', 200),
('20200201', 'A4', 400),
('20200301', 'A5', 500)

-- �ӽ����̺� ������
create table #���� (
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0) default 0 null,
)

-- �ӽ����̺� insert
insert into #���� (����, ��ǰ, ����)
values ('20200101', 'A1', 10),
('20200102', 'A2', 20),
('20200103', 'A3', 30),
('20200401', 'A4', 40)

select * from #����
select * from #����


create table #�ӽ�1(
	��� nvarchar(06),
	��ǰ nvarchar(30),
	���Լ��� numeric(18,0) default 0 not null,
	������� numeric(18,0) default 0 not null,
)

select * from #�ӽ�1

insert into #�ӽ�1 (���, ��ǰ, ���Լ���)
select left(A.����, 6), A.��ǰ, ���Լ��� = sum(A.����) from #���� A
group by left(A.����, 6), A.��ǰ
--group by : �������� ������

insert into #�ӽ�1 (���, ��ǰ, �������)
select left(A.����, 6), A.��ǰ, ������� = sum(A.����) from #���� A
group by left(A.����, 6), A.��ǰ

select ���, ��ǰ, ���Լ��� = sum(���Լ���), ������� = sum(�������)
from #�ӽ�1
group by ���, ��ǰ
order by ���, ��ǰ
-- order by : ����



drop table #����
drop table #����
drop table #�ӽ�1

create table #��ǰ(
	��ǰ�ڵ� nvarchar(08),
	��ǰ�� nvarchar(30),
)

insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values 
('A','���'),
('B','����'),
('C','����'),
('D','����'),
('E','����')

create table #����(
	��ǰ�ڵ� nvarchar(08),
	�������� nvarchar(08),
	���Լ��� numeric(18,0)
)

insert into #���� (��ǰ�ڵ�, ��������, ���Լ���) values 
('A', '20191231', 100),
('A', '20200103', 200),
('B', '20200201', 300),
('C', '20200105', 400),
('E', '20200107', 500)

create table #����(
	��ǰ�ڵ� nvarchar(08),
	�������� nvarchar(08),
	������� numeric(18,0),
)
insert into #���� (��ǰ�ڵ�, ��������, �������) values 
('A', '20191220', 10),
('A', '20200103', 20),
('B', '20200305', 30),
('B', '20200217', 40),
('C', '20200220', 50)


select * from #��ǰ
select * from #����
select * from #����



--iif ����
--declare @a int = 50, @b int = 40;
--select result = iif(@a > @b, 'true', 'false')

--������Һθ� ����϶�(@���ҽ������� : 20200101, @������������ : 20200131)

20200201���� �����ʹ� ���Һ� ��󿡼� ���ܵ� (B,C ��ǰ)
����, ���� ������ ������ ��ü ��ǰ�ڵ�� ��� ����ϼ���

insert into #�ӽ�1 (���, ��ǰ, ���Լ���)
select left(A.����, 6), A.��ǰ, ���Լ��� = sum(A.����) from #���� A
group by left(A.����, 6), A.��ǰ

select ���, ��ǰ, ���Լ��� = sum(���Լ���), ������� = sum(�������)
from #�ӽ�1
group by ���, ��ǰ
order by ���, ��ǰ

create table #�ӽ�1(
	��ǰ�ڵ� nvarchar(06),
	��ǰ�� nvarchar(30),
	���ʼ��� numeric(18,0) default 0 not null,
	���Լ��� numeric(18,0) default 0 not null,
	������� numeric(18,0) default 0 not null,
	�⸻���� numeric(18,0) default 0 not null
)



insert into #�ӽ�1 (��ǰ�ڵ�, ��ǰ��)
select A.��ǰ�ڵ�, A.��ǰ�� from #��ǰ A

update #�ӽ�1
set ���ʼ��� = 90
where ��ǰ�� = '���'

insert into #�ӽ�1 (��ǰ�ڵ�, ��ǰ��, ���ʼ���, ���Լ���, �������, �⸻����)
select A.��ǰ�ڵ�, ���Լ��� = iif(A.�������� > 20200101, A.���Լ���, 0) from #��ǰ A, #���� B, #���� C
--group by A.��ǰ�ڵ�, A.���Լ���, A.��������

insert into #�ӽ�1 (��ǰ�ڵ�, �������)
select A.��ǰ�ڵ�, ������� = iif(A.�������� < 20200131, A.�������, 0) from #���� A


select iif(A.�������� > 20200101, A.���Լ���, 0)

insert into #�ӽ�1(��ǰ�ڵ�,��ǰ��,���Լ���,�������,�⸻����)
select A.��ǰ�ڵ�, A.��ǰ�� ,
���Լ��� = iif(B.�������� > 20200101, B.���Լ���, 0),
������� = iif(C.�������� < 20200131, C.�������, 0),
�⸻���� = ���Լ��� - �������
from #��ǰ A, #���� B, #���� C
group by A.��ǰ�ڵ�,B.��������,B.���Լ���,��ǰ��,C.��������, C.�������
-------------------------------------------------------------------------------
insert into #�ӽ�1 (��ǰ�ڵ�, ��ǰ��)
select A.��ǰ�ڵ�, A.��ǰ��
from #��ǰ A

insert into #�ӽ�1 (��ǰ�ڵ�,���Լ���)
select A.��ǰ�ڵ� ,���Լ��� = iif(A.�������� > 20200101, A.���Լ���, 0)
from #���� A
group by A.��ǰ�ڵ�, A.���Լ���, A.��������
--where A.���Լ��� > 0

select ��ǰ�ڵ�,���Լ��� = sum(���Լ���), ������� = sum(�������), �⸻���� = sum(�⸻����)
from #�ӽ�1
group by ��ǰ�ڵ�,���Լ���,�������,�⸻����
-------------------------------------------------------------------------------------------------
insert into #�ӽ�1 (��ǰ�ڵ�, ��ǰ��)
select A.��ǰ�ڵ�, A.��ǰ��
from #��ǰ A

select A.��ǰ�ڵ� ,���Լ��� = iif(A.�������� > 20200101, A.���Լ���, 0)
from #���� A, #�ӽ�1 B
where A.��ǰ�ڵ� = B.��ǰ�ڵ�
group by B.��ǰ�ڵ�, A.��ǰ�ڵ�, A.��������, A.���Լ���


select * from #�ӽ�1
drop table #�ӽ�1