use db1
/*
���η�ǥ���ϱ�
*/
create table #��ǥ(
	�μ��ڵ� nvarchar(10),
	������ڵ� nvarchar(10),
	��ǥ�ݾ� numeric(18,0)
)

insert into #��ǥ (�μ��ڵ�, ������ڵ�, ��ǥ�ݾ�) values
('A1','A1-1',100000),
('A1','A1-2',200000),
('A2','A2-1',300000),
('A3','A3-1',400000)

create table #����(
	�μ��ڵ� nvarchar(10),
	������ڵ� nvarchar(10),
	����ݾ� nvarchar(10)
)

insert into #���� (�μ��ڵ�, ������ڵ�, ����ݾ�) values
('A1','A1-1',90000),
('A1','A1-2',150000),
('A2','A2-1',250000),
('A2','A2-2',100000),
('A4','A4-1',200000)

select * from #����
select * from #��ǥ

select ���� = '1��ǥ�ݾ�', �μ��ڵ�, �ݾ� = sum(��ǥ�ݾ�)
into #�ڷ�����
from #��ǥ
group by �μ��ڵ�
union all -- union�� ��翭�� ������ ��Ģ�� ���ƾ��Ѵ�
select ���� = '2��ǥ�ݾ�', �μ��ڵ�, �ݾ� = sum(����ݾ�)
from #����
group by �μ��ڵ�

select P.����
	   A1 = isnull(P.A1,0),
	   A2 = isnull(P.A1,0),
	   A3 = isnull(P.A1,0),
	   A4 = isnull(P.A1,0)
from �ڷ����� A
pivot (sum(A.�ݾ�) for A.�μ��ڵ� in (A1.A2.A3.A4)) p
order by P.����



-- +�ڵ� ��ȣȭ�� ���� ã�ƺ���