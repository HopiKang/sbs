create procedure dbo.sp08_set����
as
begin

	set nocount on

	set transaction isolation level read uncommitted
	-- ����ڰ� �����͸� �����Ҷ� ��������� �߻��ɼ��ִ�
	-- �̶� �Ʒ� �� ������� ����Ǵ� �����͵� ��� ���� ���� �� �ִ�
	-- �׷��� ����Ȯ�� �����Ͱ� ��ȸ �ɼ����ִ�

	set lock_timeout 5000
	-- �ٸ� ����ڰ� �����͸� �����Ͽ� lock�� �߻��Ǹ� ��Ⱑ �߻��Ѵ�
	-- ��ٸ����ִ� �ִ� �ð��� �������ش�

	
	create table set�׽�Ʈ (��ǰ�ڵ� nvarchar(30), �Ǹż��� numeric(18,0))

	insert into set�׽�Ʈ (��ǰ�ڵ�, �Ǹż���) values
	('A1', 100), ('A2', 200), ('A3', 300)
	
	select ��ǰ�ڵ�, �Ǹż��� from set�׽�Ʈ (nolock) 
	where ��ǰ�ڵ� = 'A1'
	-- Ư�� ���̺��� read uncommitted�� �������� nolock�� �߰��ϸ�ȴ�(��������ʴ� ���׵� ��ȸ�ɼ��ִ�)

	set ansi_warnings off
	set arithignore on
	set arithabort off
	-- 0���� ������ ������ �߻����� �ʵ��� �����ϱ����ؼ� �� 3������ �߰����ָ�ȴ�

	select 0�������� = 100/0 -- ���� �̷���� ������ �߻������ʰ� null�� ó���ȴ�
	select 0�������� = isnull(100/0,0)
end