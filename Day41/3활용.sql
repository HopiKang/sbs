1. while���� ����Ͽ� Ȧ���� ���� ���϶�

create procedure dbo.sp180_Ȧ���հ�

as
begin

	set nocount on

	declare @���� int = 1,
			@�հ� int = 0

	create table #���(
		���� int,
		�հ� int
	)

	while(@���� < 100)
		set @�հ� = @���� + @�հ�
		insert into #��� (����, �հ�) values (@����, @�հ�)
		set @���� = @���� + 2
	end

	select ����, �հ� from #���
			

end

-- ���ȣ��

with tbl as (select ���� = 1, �հ� = 1
			union all
			select ���� = ���� + 2,
				   �հ� = �հ� + (���� + 2)
			from tbl
			where ���� < 100 - 1)

select * from tbl option (maxrecursion 100) -- �ִ����Ƚ�� 100������ ȣ���Ѵ�



exec dbo.sp180_main


2. �ζǹ�ȣ ������

create procedure dbo.sp180_�ζǻ���

as
begin

	set nocount on

	declare @���� int = 1,
			@��ȣ int

	create table #�ζǰ�� (
		���� numeric(18,0),
		��ȣ numeric(18,0)
	)

	while(@���� < 8)
		set @��ȣ = 1 + floor(rand()*45)
		if exists (select * from #�ζǰ�� where ��ȣ = @��ȣ) continue -- �ߺ�����
		insert into #�ζǰ�� (����, ��ȣ) values (@����, @��ȣ)
		set @���� = @���� + 1
	end

	select * from #�ζǰ��

end


create procedure dbo.sp180_�ζǻ���

as
begin

	set nocount on

	with lotto as (select ���� = 1, ��ȣ = 1+floor(rand()*45)
				  union all
				  select ���� = ���� + 1,
						 ��ȣ = 1+floor(rand()*45)
				  from lotto
				  where ���� < 7)
	
	select * from lotto option (maxrecursion 100)

end