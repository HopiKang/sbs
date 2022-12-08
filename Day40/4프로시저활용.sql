-- �ӽ����̺��� ���� ��, ��, ���� ���� ������ ����ϴ� sp
-- 1(������)2(������)3(������)�� �Է°�������
-- 1�� �Է°������ָ� �Ϻ��� ���� 2�� �Է°������ָ� �޺��� ���� 3�̸� �⺰�� ����
	
exec dbo.sp_180_main
	 @in_��ȸ�ѹ� = 1

create procedure dbo.sp_180_main

declare @in_��ȸ�ѹ� int

create table #�ӽ�1(
	���� nvarchar(30),
	���� numeric(18,0)
)

insert into #�ӽ�1 (����, ����) values
('20200101',10),
('20200102',20),
('20200203',30),
('20200201',40),
('20200302',50),
('20200303',60),
('20210101',70)

as
begin

	set nocount on

	if @in_��ȸ�ѹ� = 1
		begin
		exec dbo.sp_180_d
	end else if @in_��ȸ�ѹ� = 2
		begin
		exec dbo.sp_180_m
	end else
		begin
		exec dbo.sp_180_y
	end
		

end




create procedure dbo.sp_180_d

as
begin

	set nocount on

	select DD = datepart(dd,����), sum(����) --datepart�� right�� substring�� ����ص��ȴ� 
	from #�ӽ�1
	group by datepart(dd,����)

end

create procedure dbo.sp_180_m

as
begin

	set nocount on

	select MM = datepart(mm,����), sum(����)
	from #�ӽ�1
	group by datepart(mm,����)

end

create procedure dbo.sp_180_y

as
begin

	set nocount on

	select YY = datepart(yy,����), sum(����)
	from #�ӽ�1
	group by datepart(yy,����)

end



---------------------------------------------------------------------------------
--����������

declare @txt_�������� nvarchar(2000),
		@txt_���и� nvarchar(50),
		@txt_�׷� nvarchar(50)


set @txt_�������� = 'select ���и� = �׷�, ������� = sum(A.����) from #�ӽ�1 A group by �׷�' -- print�� �ѹ� Ȯ�ΰ�����

if @in_��ȸ�ѹ� = 1 begin
	set @txt_���и� = 'DD'
	set @txt_�׷� = 'right(A.����, 2)'
end else if @@in_��ȸ�ѹ� = 2 begin
	set @txt_���и� = 'MM'
	set @txt_�׷� = 'substring(A.����, 5, 2)'
end else if @@in_��ȸ�ѹ� = 2 begin
	set @txt_���и� = 'YYYY'
	set @txt_�׷� = 'left(A.����, 4)'
end else begin
	return -- ��ȸ�ѹ��� 1,2,3�� �ƴѰ�� return
end

set @txt_�������� = REPLACE(@txt_��������, '���и�', @txt_���и�) -- �ϼ��ȹ����� ���и� �ٲ㼭 ������ش�

set @txt_�������� = REPLACE(@txt_��������, '�׷�', @txt_�׷�)

exec(@txt_��������)