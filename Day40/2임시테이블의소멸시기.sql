-- �ӽ����̺�
-- �ϳ��� ���ν������� �ٸ����ν����� ȣ���ؼ� ����Ҷ� �ӽ����̺��� �Ҹ������ �ٸ���

exec dbo.sp_160_main

alter procedure dbo.sp_160_main
	
as
begin

	set nocount on

	create table #�ӽ�1(
		Į��1 nvarchar(30)
	)

	insert into #�ӽ�1(Į��1) values
	('123')

	exec sp_160_sub

	select * from #�ӽ�2

end


create procedure dbo.sp_160_sub

as
begin

	set nocount on

	select * from #�ӽ�1

	create table #�ӽ�2(
		Į��2 nvarchar(30)
	)

	insert into #�ӽ�2 (Į��2) values
	('456')
end

-- main���� > main �ӽ�1 ���� �� �Է� > sub���� > sub #�ӽ�1 ��ȸ > sub �ӽ�2 ���� �� �Է� > �ӽ�2 �Ҹ� > main �ȿ��� #�ӽ�2 ��ȸ