�����

use db1

------------------------------------------------------------------------------------
begin tran

declare @return_value int
		@out_����޼��� nvarchar(500)

exec @return_value = [dbo].[sp_130_��ǰ_����_��º�����ȯ_�����]
	 @in_��ǰ�ڵ� = 'B3',
	 @in_��ǰ�� = '����',
	 @out_�޼��� = @out_����޼��� out

select ����ڵ� = @return_value,
	   ����޼��� = @out_����޼���

rollback tran


exec [dbo].[sp_130_��ǰ_����_��º�����ȯ_�����]
	@in_��ǰ�ڵ� = 'B3',
	@in_��ǰ�� = '����',
	@out_�޼��� = @out_����޼��� out
	
---------------------------------------------------------------------------------------------

create procedure [dbo].[sp_130_��ǰ_����_��º�����ȯ_�����](
	@in_��ǰ�ڵ� nvarchar(30),
	@in_��ǰ�� nvarchar(100),
	@out_�޼��� nvarchar(500) output
)

as
begin

	set nocount on;

	declare @int_error int = 0,
			@int_rowcount int = 1

	create table #��ǰ(
		��ǰ�ڵ� nvarchar(30),
		��ǰ�� nvarchar(100)
	)

	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A1', '���')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A2', '����')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A3', '������')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A4', '��ȭ��')
	
	select = from #��ǰ A where A.��ǰ�ڵ� = @in_��ǰ�ڵ�

	print @in_��ǰ�ڵ� -- �ߴ���
	print @in_��ǰ��

	update A set A.��ǰ�� = @in_��ǰ�� from #��ǰ A
	where ��ǰ�ڵ� = @in_��ǰ�ڵ�

	select @int_error = @@ERROR, @int_rowcount = @@ROWCOUNT

	print @int_error -- print ���� �޼����� ���
	print @int_rowcount -- �ߴ����̱⶧���� �ּ�ó���ص� �������
	print concat('@@error =', @int_error, '@@rowcount =', @int_rowcount)

	select * from #��ǰ A where A.��ǰ�ڵ� = @in_��ǰ�ڵ�

	if @int_error <> 0 or @int_rowcount <> 1
		begin
			set @out_�޼��� = '��ǰ�ڵ� update ����'
			return(99)
		end

		set @out_�޼��� = '����ó��'
		return(1)

end




	