use db1

/*
exec dbo.sp_�ʼ��˻� '����'
*/

create procedure dbo.sp_�ʼ��˻�
	@in_�ʼ��Է� nvarchar(100)

as
begin

	set nocount on

	create table #��ǰ(
		��ǰ�ڵ� nvarchar(30) not null,
		��ǰ�� nvarchar(100),
		��ǰ�ʼ� nvarchar(100) default,
		primary key (��ǰ�ڵ�)
	)

	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values
	('A','���'),
	('B','�������'),
	('C','����'),
	('D','���'),
	('E','û����')

	update A set
	A.��ǰ�ʼ� = [DBO].[UF_�ʼ���ȸ] (A.��ǰ��)
	from #��ǰ A
	where A.��ǰ�ʼ� = ''

	select A.��ǰ�ڵ�, A.��ǰ��, A.��ǰ�ʼ�
	from #��ǰ A
	where A.��ǰ�ʼ� like '%' + @in_�ʼ��Է� + '%' 
	order by 1

end