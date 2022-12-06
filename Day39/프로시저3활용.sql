/*-------------------------------------------------------------
exec dbo.sp_140_����ڱ���_���ڵ��
	@in_������ڵ� = 'C100'
-------------------------------------------------------------*/

create procedure dbo.sp_140_����ڱ���_���ڵ��
	@in_������ڵ� nvarchar(30)

as
begin
	
	set nocount on;

	if left(@in_������ڵ�, 1) = 'A'
		begin
			select ����ڵ� = '1',
				   ����޼��� = '����'
		end

	else
		begin
			select ����ڵ� = '9',
				   ����޼��� = '�̽���'
	end

end

/*-------------------------------------------------------------
declare @out_����ڵ� int,
		@out_����޼��� nvarchar(500)

exec @out_����ڵ� = dbo.sp_140_����ڱ���_��º���
	 @in_������ڵ� = 'C100',
	 @out_�޼��� = @out_����޼��� output
-------------------------------------------------------------*/

create procedure dbo.sp_140_����ڱ���_��º���
	@in_������ڵ� nvarchar(30),
	@out_�޼��� nvarchar(500) output


as
begin

	set nocount on;

	if left(@in_������ڵ�, 1) = 'A'
		begin
			set @out_�޼��� = '����'
			return(1)
		end else begin
			set @out_�޼��� = '�̽���'
			return(99)
		end

end

/*---------------------------------------------------------------------------------------------
exec dbo.sp_140_��ǰ_��ȸ_���ڵ��
	@in_��ǰ�� = '��'
	@in_������ڵ� = 'A101'
---------------------------------------------------------------------------------------------*/

create procedure dbo.sp_140_��ǰ_��ȸ_���ڵ��
	@in_��ǰ�� nvarchar(100),
	@in_������ڵ� nvarchar(30)


as
begin

	set nocount on;

	create table #��ǰ(
		��ǰ�ڵ� nvarchar(30),
		��ǰ�� nvarchar(100)
	)

	-- �ӽ����̺� �⺻�ڷ� �Է�
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A1', '���')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A2', '����')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A3', '������')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A4', '��ȭ��')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A5', '���')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A6', '���')

	-- ó������� ������ �ӽ����̺� ����
	create table #������(
		����ڵ� int,
		����޼��� nvarchar(500)
	)

	insert into #������(����ڵ�, ����޼���)
	exec dbo.sp_140_����ڱ���_��º���
		@in_������ڵ� = @in_������ڵ�

	declare @out_����ڵ� int,              -- return�� �����
			@out_����޼��� nvarchar(500)   -- @out_�޼��� �����

	-- �ӽ����̺� ����� ����ڵ�, �޼��� ���� ������ �ٽ� ����
	select @out_����ڵ� = A.����ڵ�,
		   @out_����޼��� = A.����޼���
	from #������ A

	-- �� ���ν��� ����ڵ尡 1�� �ƴϸ� ���̻� �������� �ʰ� ����
	if @out_����ڵ� <> 1
		begin
			return
		end

	select A.��ǰ�ڵ�, A.��ǰ�� from #��ǰ
	where A.��ǰ�� like '%' + @in_��ǰ�� + '%'

end




/*----------------------------------------------------------------------------------------
declare @return_value in
		@out_�޼��� nvarchar(500)
select @out_�޼��� = N'@out_����޼���'

exec dbp.sp_140_��ǰ_��ȸ_��º���
	@in_��ǰ�� = '��'
	@in_������ڵ� = 'C101'

select ����ڵ� = @out_�޼���,
	   ����޼��� = @return_value
----------------------------------------------------------------------------------------*/
create procedure dbp.sp_140_��ǰ_��ȸ_��º���
	@in_��ǰ�� nvarchar(100)
	@in_��ǰ�ڵ� nvarchar(30)

as
begin

	set nocount on;

	create table #��ǰ(
		��ǰ�ڵ� nvarchar(30),
		��ǰ�� nvarchar(100)
	)

	-- �ӽ����̺� �⺻�ڷ� �Է�
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A1', '���')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A2', '����')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A3', '������')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A4', '��ȭ��')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A5', '���')
	insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values ('A6', '���')

	declare @out_����ڵ� int -- return�� �����
			@out_����޼��� nvarchar(500) -- @out_�޼��� �����

	exec @out_����ڵ� = sp_140_����ڱ���_��º���
		 @in_������ڵ� = @in_������ڵ�
		 @out_�޼��� = @out_����޼��� output

	-- �� ���ν��� ����ڵ尡 1�� �ƴϸ� ���̻� �������� �ʰ� ����
	if @out_����ڵ� <> 1
		begin
			return
		end

	select A.��ǰ�ڵ�, A.��ǰ�� from #��ǰ A
	where A.��ǰ�� like '%' + @in_��ǰ�� + '%'

end


