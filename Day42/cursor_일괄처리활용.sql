/*
1. �ڷ�

�����
�μ��ڵ� ������ڵ�
A          A1
A          A2
B          B1
B          B2
C          C1
C          C2

����
�μ��ڵ� ������ڵ� ����ݾ�
A           A1      100,000
A           A2      200,000
B           B1      250,000
B           B2      500,000

����
�μ��ڵ� ���ͱݾ�
A         10,000
C         30,000

2.���

�μ��ڵ� ������ڵ� ���ͱݾ��հ� ����ݾ��հ� ����ݾ� ���͹�αݾ�
A            A1         10,000      300,000    100,000    333
A            A2         10,000      300,000    200,000    6667
B            B1         0           750,000    250,0000    0
B            B2         0           750,000    500,000     0
C            C2         30,000       0            0       15000
C            C2         30,000       0            0       15000

���͹��

����ݾ��̳� ���ͱݾ����� ����ϴ� ��찡 ����

����� ���� �ݾ��� ���������� ������ ���°�쿡�� �ش�μ� ����ڿ���
�յ��ϰ� ��� �� �� �ֵ��� ó���϶�

cursor ���, cursor����� �ƴ� �ϰ�ó��������ε� �����

1. ����, ������ ���� �μ�, �����ڰ� �����ϱ� ������ [�����]���̺� ��������
   �ڷḦ �����ϴ°� ����
   (���������̺��� �������� ����,���� �� join)

2. ������ ���� �μ��� ��� ����ں��� �յ� ��� ������ �ʿ���

3. ����� �����ϰ� �ϱ� ���ؼ� #�ӽ����̺��� Ȱ���ϸ� ���� ȿ��������
   ���� �� �ִ�

*/

use db1

-- ����� ���̺� ����
create table �����(
	�μ��ڵ� nvarchar(30),
	������ڵ� nvarchar(30)
)

insert into ����� (�μ��ڵ�, ������ڵ�) values 
('A','A1'),
('A','A2'),
('B','B1'),
('B','B2'),
('C','C1'),
('C','C2')

-- ���� ���̺� ����
create table ����(
	�μ��ڵ� nvarchar(30),
	������ڵ� nvarchar(30),
	����ݾ� numeric(18,0)
)

insert into ���� (�μ��ڵ�, ������ڵ�, ����ݾ�) values
('A','A1',100,000),
('A','A2',200,000),
('B','B1',250,000),
('B','B2',500,000)


-- ���� ���̺� ����
create table ����(
	�μ��ڵ� nvarchar(30),
	���ͱݾ� numeric(18,0)
)

insert into ���� (�μ��ڵ�, ���ͱݾ�) values
('A', 10000),
('C', 30000)


select A.�μ��ڵ�, ����ݾ��հ� = isnull(sum(B.����ݾ�),0), ����ڼ� = count(*)
into #�����հ�
from ����� A 
left join ���� B on A.�μ��ڵ� = B.�μ��ڵ�
and A.������ڵ� = B.������ڵ�
group by A.�μ��ڵ�

select * from #�����հ�

-- cursor���� ����� �ӽ����̺� ����
select A.�μ��ڵ�, A.������ڵ�, 
	   ����ݾ� = isnull(B.����ݾ�,0),
	   ����ݾ��հ� = isnull(D.����ݾ��հ�,0),
	   ���ͱݾ��հ� = isnull(C.���ͱݾ�,0),
	   �μ�����ڼ� = D.����ڼ�,
	   ���͹�αݾ� = convert(numeric(18,0),0)
into #��ΰ��
from ����� A
left join ���� B on A.�μ��ڵ� = B.�μ��ڵ� and A.������ڵ� = B.������ڵ�
left join ���� C on A.�μ��ڵ� = C.�μ��ڵ� 
left join #�����հ� D on A.�μ��ڵ� = D.�μ��ڵ�

select * from #��ΰ��


declare cur_profit_sharing cursor for
select �μ��ڵ�, ������ڵ�, ����ݾ�, ����ݾ��հ�, ���ͱݾ��հ�, �μ�����ڼ� -- corsor���� ����� �÷� ��������
from #��ΰ��

open cur_profit_sharing

declare @cur_profit_sharing_�μ��ڵ� nvarchar(30),
		@cur_profit_sharing_������ڵ� nvarchar(30),
		@cur_profit_sharing_����ݾ� numeric(18,0),
		@cur_profit_sharing_����ݾ��հ� numeric(18,0),
		@cur_profit_sharing_���ͱݾ��հ� numeric(18,0),
		@cur_profit_sharing_�μ�����ڼ� int

while (1 = 1)
	begin

		fetch next from cur_profit_sharing into
		@cur_profit_sharing_�μ��ڵ�,
		@cur_profit_sharing_������ڵ�, 
		@cur_profit_sharing_����ݾ�, 
		@cur_profit_sharing_����ݾ��հ�,
		@cur_profit_sharing_���ͱݾ��հ�,
		@cur_profit_sharing_�μ�����ڼ�

		if @@FETCH_STATUS <> 0 break -- while�� Ż��

		if @cur_profit_sharing_����ݾ��հ� = 0 begin
			select * from #��ΰ�� A
			update A set
			A.���͹�αݾ� = @cur_profit_sharing_���ͱݾ��հ� * (1.0 / @cur_profit_sharing_�μ�����ڼ�)
			where A.�μ��ڵ� = @cur_profit_sharing_�μ��ڵ�
			and A.������ڵ� = @cur_profit_sharing_������ڵ�
		end else begin
			select * from #��ΰ�� A
			update A set
			A.���͹�αݾ� = @cur_profit_sharing_���ͱݾ��հ� * (@cur_profit_sharing_����ݾ� / @cur_profit_sharing_����ݾ��հ�)
			where A.�μ��ڵ� = @cur_profit_sharing_�μ��ڵ�
			and A.������ڵ� = @cur_profit_sharing_������ڵ�	
		end

	end

close cur_profit_sharing
deallocate cur_profit_sharing

select * from #��ΰ��
order by #��ΰ��.������ڵ�

-------------------------------------------------------------------------------------------------------------

-- �ϰ�ó�����
-- �����ϸ� �ӵ������� �ϰ�ó������� ����Ѵ�

select * from #��ΰ��

update A set
���͹�αݾ� = iif(A.����ݾ��հ� = 0, A.���ͱݾ��հ� = (1.0 / A.�μ�����ڼ�),
				   A.���ͱݾ��հ� = (A.����ݾ� / A.����ݾ��հ�))
from #��ΰ�� A

select * from #��ΰ��
order by �μ��ڵ�, ������ڵ�