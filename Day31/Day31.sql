-- update��

create table ����(
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0),
	�ܰ� numeric(18,0),
	�ݾ� numeric(18,0),
)

insert into ���� (����, ��ǰ, ����, �ܰ�, �ݾ�)
values ('20200101', 'A1', 10, 100, 1000), ('20200102', 'A2', 20, 200, 4000)

create table �ܰ�(
	��ǰ nvarchar(30),
	�ܰ� numeric(18,0)
)

insert into �ܰ� (��ǰ, �ܰ�)
values ('A1', 150), ('A2', 250)

select * from ����
select * from �ܰ�

-- 1
-- ���ڰ� 20200102 ��ǰ�� A2�� �ڷḦ ã�Ƽ�
-- ������ 2�� ���� ��Ű�� �ܰ� �ݾ��� ���������ʴ´�

update ���� set ���� = ���� +2 where ���� = '20200102' and ��ǰ = 'A2'
-- set �ڰ� �ٲ�°� whare �ڰ� ã�°�
-- �ظ��ϸ� select * from ���� where ���� = '20200102' and ��ǰ = 'A2'�� �ٲ�� �Ұ��� ã�Ƴ���
-- select * from�� update�� ���� �ۼ��ؼ� Ȯ���ϴ°��� �Ǽ��� ���� �� �ִ� ����̴�

-- 2
-- ���ڰ� 20200101 ��ǰ�� A1�� �ڷḦ ã�Ƽ� ������ 14����
-- �����ϰ� �ݾ׵� ����(Ȯ�� ���� �ۼ� - ��Ī)

update ���� set ���� = 14 where ���� = '20200101' and ��ǰ = 'A1'

update A set A.���� = 14, A.�ݾ� = 14 * A.�ܰ�
from ���� A
-- �������̺��� A�� ��������Ѵ�
where ���� = '20200101'
and ��ǰ = 'A1'

-- 3
-- �ܰ� ���̺��� ����� �ܰ��� ã�Ƽ� ���� ���̺��� �ܰ��� �ݾ��� ����
-- join Ȱ��
-- select * from ���� A inner join �ܰ� B on A.��ǰ = b.��ǰ 

select * from ����
select * from �ܰ�

select * from ���� A inner join �ܰ� B on A.��ǰ = b.��ǰ
-- inner join���� ����� �ܰ����̺��� �ٿ��� �����ִ�, on���� A��ǰ�� B��ǰ�� �������� ã�Ƽ� ���δ�

update A set A.�ܰ� = B.�ܰ�, A.�ݾ� = B.�ܰ� * A.����
from ���� A inner join �ܰ� B on A.��ǰ = b.��ǰ
-- inner join���� �������̺�� �ܰ����̺��� �ٿ��� Ȱ���Ѵ�

---------------------------------------------------------------------------------------------------------------------
--
create table ����(
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0),
	�ܰ� numeric(18,0),
	�ݾ� numeric(18,0),
)

insert into ���� (����, ��ǰ, ����, �ܰ�, �ݾ�)
values (20200101, 'A1', 10, 100, 1000), (20200102, 'A2', 20, 200, 4000)

create table �ܰ�(
	��ǰ nvarchar(30),
	�ܰ� numeric(18,0),
	��� nvarchar(10)
)

insert into �ܰ� (��ǰ, �ܰ�, ���)
values ('A1', 150, 'Y'), ('A2', 250, 'N')

select * from ����
select * from �ܰ�

-- 1
-- ���ڰ� 20200101 ��ǰ�� A1�� �ڷḦ ã�Ƽ� ����
-- delete from ���̺�� where �÷� = '������ ���'

select * from ����
where ���� = 20200101
and ��ǰ = 'A1'

delete from ����
where ���� = '20200101'
and ��ǰ = 'A1'

-- 2
-- �� �ڷḦ �����ϰ� ���� ó��(Ȯ�� ���� �ۼ� - ��Ī)
--  - 1������ �̹� ������ �ڷḦ 2������ �Ǵٽ� �����ϸ�
--    ����Ǵ� ��Ȳ�� �����ϱ�

select * from ����
where ���� = 20200101
and ��ǰ = 'A1'

delete A
from ���� A
where ���� = '20200101'
and ��ǰ = 'A1'

-- 3
-- �ܰ� ���̺��� ��� �÷� ���� N�� ��ǰ�� ã�Ƽ� �ش� ����
-- �ڷḸ ����ó�� �ϼ���
-- inner join����ϱ�

select * from ����
select * from �ܰ�

select * from ���� A inner join �ܰ� B on A.��ǰ = b.��ǰ

delete A
from ���� A inner join �ܰ� B on A.��ǰ = b.��ǰ
where B.��� = 'N'




-- �ý��� ������ ���� �� ó���Ǽ� üũ
--@@error ��� ������ sql ������ ������ �־����� �˷��ش�
-- [0] ���������� ������ �Ǿ��ٴ¶�
-- [0]�� �ƴ� ��� �� = ������ ������ �߻��Ѱ�

--@@rowcount ��� ������ sql ������ �� ���� ���� ������ ó�� �ߴ��� �˷��ش�
-- [0] �� �Ѱǵ� ó�� �Ǵ� ��ȸ ���� ���� ���
-- [1] �Ѱ� ó�� �Ǵ� ��ȸ��
-- [100] 100���� ó���ǰų� ��ȸ�Ȱ�
--error�� rowcount�� ����������� ��밡���ϴ�

create table ���� (
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0) default 0 null,
	primary key (����, ��ǰ)
)

select �۾���ȣ = '1-1', [ERROR] = @@ERROR, [rowcount] = @@ROWCOUNT

-- 2 �߰�
insert into ���� (����, ��ǰ, ����)
values ('20200101', 'A1', 10), ('20200102', 'A2', 20), ('20200103', 'A3', 30)

select �۾���ȣ = '2-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select �۾���ȣ = '2-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

-- 3 ����
update A set A.���� = 15 from ���� A
where A.���� = '20200101' and A.��ǰ = 'A1'

select �۾���ȣ = '3-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select �۾���ȣ = '3-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

--4 ����
delete A from ���� A where A.���� = '20200101' and A.��ǰ = 'A4'

select �۾���ȣ = '4-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select �۾���ȣ = '4-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

--5 ��� �ڷ� ��ȸ
select * from ����

select �۾���ȣ = '5-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select �۾���ȣ = '5-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT




--transaction(Ʈ�����)
--������ ������ �߻������� �ѹ��� �Ǵ°�
--ó��������

--1. begin tran Ʈ����� ����
--2. �ڱ� ���� ó��
--3. �������� - @@error @@rowcount �� �۾� �̻󿩺� üũ
--4. �����ܰ� (-)ó��
--5. �������� @@error @@rowcount �� �۾� �̻󿩺� üũ
--6. rollback tran Ʈ����� ��� - commit tran Ʈ����� �Ϸ�
--7. ���� �۾� DB�� ���� �ݿ�

create table ����(
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0) default 0 null,
	primary key (����, ��ǰ)
)

insert into ���� (����, ��ǰ, ����)
values ('20200101', 'A1', 10), ('20200102', 'A2', 20)

select * from ����

--��������
declare @int_���п��� int
set @int_���п��� = 0

begin tran

update A set A.���� = 15 from ���� A
where A.���� = '20200101' and ��ǰ = 'A1'

if @@ERROR <> 0 or @@ROWCOUNT <> 1 set @int_���п��� = 1 

delete A from ���� A where A.���� = '20200105' and A.��ǰ = 'A5'

if @@ERROR <> 0 or @@ROWCOUNT <> 1 set @int_���п��� = 1 

if @int_���п��� = 0 begin
	commit tran
end else begin
	rollback tran
end

select * from ����

select * from ���� A
where A.���� = '20200101' and ��ǰ = 'A1'



-- lock
-- ��������� �����ͺ��̽��� ���� �����ϰų� ����Ҷ� ����ϴ°�
-- Ʈ����� �ݸ� ���� (transction solation lavel)
-- read committed �ݸ������� default

begin tran

update A set A.���� = A.���� + 5 from ���� A
where A.���� = '20200101' and A.��ǰ = 'A1'
-- 1����ڰ� begin tran���� ���� 2����ڰ� ����� �Ұ��ϴ� (lock�� �ɸ���Ȳ�̴�)
-- 2����ڴ� ��� ��������̰� 1����ڰ� commit tran�� �������ٽ� �ٷ� 2������� ����� ����ȴ�


select * from ����

commit tran