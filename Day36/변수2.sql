-- ����
create table #�۾�(
	�ڵ� nvarchar(10),
	���� numeric(18,0)
)

insert into #�۾� (�ڵ�, ����) values 
('A1', 10),
('A2', 20),
('A3', 30)

select * from #�۾�

�۾� ���̺��� A2�� ���� ���θ� Ȯ���Ͽ� A2�� �����ϸ�
[A2]���� �ƴϸ� [A2]�����縦 ����ϴ� �������� �ۼ��϶�


declare @����1 int

select @����1 = count(*) -- count�� �ӵ��� ������
from #�۾� 
where �ڵ� = 'A2'

if @����1 = 1
	select ��� = '[A2]����'
else
	select ��� = '[A2]������'


if exists (select * from #�۾� where �ڵ� = 'A2')
begin
select ��� = '[A2]����'
end else begin
select ��� = '[A2]������'
end
--�׷����� exists�� ����ϸ�ȴ�
-- 1�� �̻� ������ '��', �׷��������� '����'�� ��Ÿ����